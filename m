Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:62258 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935052AbcJRW6g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Oct 2016 18:58:36 -0400
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH] mcp3021: rework for DT support of reference-voltage
Date: Wed, 19 Oct 2016 00:44:44 +0200
Message-Id: <20161018224444.11225-1-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Support setting the reference voltage in the device tree.
Rework of driver structure, put chip specific data in a separate
structure and assign it depending on device id from platform data or
DT match.
Extend the device documentation and add new documentation for the
devicetree bindings.
Also change S_IRUGO to the better readable 0444, which fixes a
checkpatch warning.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 .../devicetree/bindings/hwmon/mcp3021.txt          |  21 +++
 Documentation/hwmon/mcp3021                        |   5 +
 drivers/hwmon/mcp3021.c                            | 184 ++++++++++++++-------
 3 files changed, 149 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt

diff --git a/Documentation/devicetree/bindings/hwmon/mcp3021.txt b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
new file mode 100644
index 0000000..e1d1e62
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
@@ -0,0 +1,21 @@
+mcp3021 properties
+
+Required properties:
+- compatible: Must be one of the following:
+	- "microchip,mcp3021" for mcp3021
+	- "microchip,mcp3221" for mcp3221
+- reg: I2C address
+
+Optional properties:
+
+- reference-voltage
+	Reference voltage in millivolt (mV)
+
+Example:
+
+mcp3021@4d {
+	compatible = "microchip,mcp3021";
+	reg = <0x4d>;
+
+	reference-voltage = <4500>; /* 4.5 V */
+};
diff --git a/Documentation/hwmon/mcp3021 b/Documentation/hwmon/mcp3021
index 74a6b72..55792c3 100644
--- a/Documentation/hwmon/mcp3021
+++ b/Documentation/hwmon/mcp3021
@@ -12,6 +12,7 @@ Supported chips:
 Authors:
    Mingkai Hu
    Sven Schuchmann <schuchmann@schleissheimer.de>
+   Clemens Gruber <clemens.gruber@pqgruber.com>
 
 Description
 -----------
@@ -27,3 +28,7 @@ Communication to the MCP3021/MCP3221  is performed using a 2-wire I2C
 compatible interface. Standard (100 kHz) and Fast (400 kHz) I2C modes are
 available. The default I2C device address is 0x4d (contact the Microchip
 factory for additional address options).
+
+The reference-voltage used in the conversion can be set via platform data or
+device tree. Please refer to Documentation/devicetree/bindings/i2c/mcp3021.txt
+for information about the bindings if the device tree is used.
diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index 972444a..ebbd3d2 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2008-2009, 2012 Freescale Semiconductor, Inc.
  * Author: Mingkai Hu <Mingkai.hu@freescale.com>
  * Reworked by Sven Schuchmann <schuchmann@schleissheimer.de>
+ * Copyright (C) 2016 Clemens Gruber <clemens.gruber@pqgruber.com>
  *
  * This driver export the value of analog input voltage to sysfs, the
  * voltage unit is mV. Through the sysfs interface, lm-sensors tool
@@ -22,35 +23,74 @@
 #include <linux/i2c.h>
 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
-/* Vdd info */
+/* Vdd / reference voltage */
 #define MCP3021_VDD_MAX		5500
 #define MCP3021_VDD_MIN		2700
-#define MCP3021_VDD_REF		3300
+#define MCP3021_VDD_DEFAULT	3300
 
-/* output format */
-#define MCP3021_SAR_SHIFT	2
-#define MCP3021_SAR_MASK	0x3ff
-#define MCP3021_OUTPUT_RES	10	/* 10-bit resolution */
+struct mcp3021_chip_info {
+	u16 sar_shift;
+	u16 sar_mask;
+	u8 output_res;
+};
+
+struct mcp3021_data {
+	struct device *hwmon_dev;
+	const struct mcp3021_chip_info *chip_info;
+	u32 vdd; /* Supply and reference voltage for AD conversion */
+};
 
-#define MCP3221_SAR_SHIFT	0
-#define MCP3221_SAR_MASK	0xfff
-#define MCP3221_OUTPUT_RES	12	/* 12-bit resolution */
+static int mcp3021_probe(struct i2c_client *client,
+	const struct i2c_device_id *id);
+static int mcp3021_remove(struct i2c_client *client);
 
-enum chips {
+enum {
 	mcp3021,
 	mcp3221
 };
 
-/*
- * Client data (each client gets its own)
- */
-struct mcp3021_data {
-	struct device *hwmon_dev;
-	u32 vdd;	/* device power supply */
-	u16 sar_shift;
-	u16 sar_mask;
-	u8 output_res;
+static const struct i2c_device_id mcp3021_id[] = {
+	{ "mcp3021", mcp3021 },
+	{ "mcp3221", mcp3221 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, mcp3021_id);
+
+static const struct mcp3021_chip_info mcp3021_chip_info_tbl[] = {
+	[mcp3021] = {
+		.sar_shift = 2,
+		.sar_mask = 0x3ff,
+		.output_res = 10,	/* 10-bit resolution */
+	},
+	[mcp3221] = {
+		.sar_shift = 0,
+		.sar_mask = 0xfff,
+		.output_res = 12,	/* 12-bit resolution */
+	},
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_mcp3021_match[] = {
+	{ .compatible = "microchip,mcp3021", .data = (void *)mcp3021 },
+	{ .compatible = "microchip,mcp3221", .data = (void *)mcp3221 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_mcp3021_match);
+#endif
+
+static struct i2c_driver mcp3021_driver = {
+	.driver = {
+		.name = "mcp3021",
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(of_mcp3021_match),
+#endif
+	},
+	.probe = mcp3021_probe,
+	.remove = mcp3021_remove,
+	.id_table = mcp3021_id,
 };
 
 static int mcp3021_read16(struct i2c_client *client)
@@ -73,14 +113,15 @@ static int mcp3021_read16(struct i2c_client *client)
 	 * The ten-bit output code is composed of the lower 4-bit of the
 	 * first byte and the upper 6-bit of the second byte.
 	 */
-	reg = (reg >> data->sar_shift) & data->sar_mask;
+	reg = (reg >> data->chip_info->sar_shift) & data->chip_info->sar_mask;
 
 	return reg;
 }
 
 static inline u16 volts_from_reg(struct mcp3021_data *data, u16 val)
 {
-	return DIV_ROUND_CLOSEST(data->vdd * val, 1 << data->output_res);
+	return DIV_ROUND_CLOSEST(data->vdd * val,
+				 1 << data->chip_info->output_res);
 }
 
 static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
@@ -99,46 +140,83 @@ static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", in_input);
 }
 
-static DEVICE_ATTR(in0_input, S_IRUGO, show_in_input, NULL);
+static DEVICE_ATTR(in0_input, 0444, show_in_input, NULL);
 
-static int mcp3021_probe(struct i2c_client *client,
+#ifdef CONFIG_OF
+static int mcp3021_probe_dt(struct i2c_client *client,
 				const struct i2c_device_id *id)
 {
-	int err;
-	struct mcp3021_data *data = NULL;
+	struct mcp3021_data *data = i2c_get_clientdata(client);
+	struct device_node *np = client->dev.of_node;
+	const struct of_device_id *match;
+	int devid, ret;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+	match = of_match_device(of_mcp3021_match, &client->dev);
+	if (!match)
 		return -ENODEV;
 
-	data = devm_kzalloc(&client->dev, sizeof(struct mcp3021_data),
-			    GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	devid = (int)(uintptr_t)match->data;
+	data->chip_info = &mcp3021_chip_info_tbl[devid];
 
-	i2c_set_clientdata(client, data);
-
-	switch (id->driver_data) {
-	case mcp3021:
-		data->sar_shift = MCP3021_SAR_SHIFT;
-		data->sar_mask = MCP3021_SAR_MASK;
-		data->output_res = MCP3021_OUTPUT_RES;
-		break;
-
-	case mcp3221:
-		data->sar_shift = MCP3221_SAR_SHIFT;
-		data->sar_mask = MCP3221_SAR_MASK;
-		data->output_res = MCP3221_OUTPUT_RES;
-		break;
+	ret = of_property_read_u32(np, "reference-voltage", &data->vdd);
+	if (ret) {
+		/* Fallback: Use default value */
+		data->vdd = MCP3021_VDD_DEFAULT;
+		return 0;
 	}
 
+	if (data->vdd > MCP3021_VDD_MAX || data->vdd < MCP3021_VDD_MIN)
+		return -EINVAL;
+
+	return 0;
+}
+#else
+static int mcp3021_probe_dt(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	return 1;
+}
+#endif
+
+static int mcp3021_probe_pdata(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct mcp3021_data *data = i2c_get_clientdata(client);
+
+	data->chip_info = &mcp3021_chip_info_tbl[id->driver_data];
+
 	if (dev_get_platdata(&client->dev)) {
 		data->vdd = *(u32 *)dev_get_platdata(&client->dev);
 		if (data->vdd > MCP3021_VDD_MAX || data->vdd < MCP3021_VDD_MIN)
 			return -EINVAL;
 	} else {
-		data->vdd = MCP3021_VDD_REF;
+		data->vdd = MCP3021_VDD_DEFAULT;
 	}
 
+	return 0;
+}
+
+static int mcp3021_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct mcp3021_data *data = NULL;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, data);
+
+	err = mcp3021_probe_dt(client, id);
+	if (err > 0)
+		mcp3021_probe_pdata(client, id);
+	else if (err < 0)
+		return err;
+
 	err = sysfs_create_file(&client->dev.kobj, &dev_attr_in0_input.attr);
 	if (err)
 		return err;
@@ -166,22 +244,6 @@ static int mcp3021_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id mcp3021_id[] = {
-	{ "mcp3021", mcp3021 },
-	{ "mcp3221", mcp3221 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, mcp3021_id);
-
-static struct i2c_driver mcp3021_driver = {
-	.driver = {
-		.name = "mcp3021",
-	},
-	.probe = mcp3021_probe,
-	.remove = mcp3021_remove,
-	.id_table = mcp3021_id,
-};
-
 module_i2c_driver(mcp3021_driver);
 
 MODULE_AUTHOR("Mingkai Hu <Mingkai.hu@freescale.com>");
-- 
2.10.0

