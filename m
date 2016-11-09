Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:34102 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751425AbcKIVX6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Nov 2016 16:23:58 -0500
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH v4 1/3] hwmon: (mcp3021) add devicetree support
Date: Wed,  9 Nov 2016 22:22:34 +0100
Message-Id: <20161109212234.2329-1-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Support setting the reference voltage from the device tree.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 drivers/hwmon/mcp3021.c | 48 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index 972444a..7a83690 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2008-2009, 2012 Freescale Semiconductor, Inc.
  * Author: Mingkai Hu <Mingkai.hu@freescale.com>
  * Reworked by Sven Schuchmann <schuchmann@schleissheimer.de>
+ * DT support added by Clemens Gruber <clemens.gruber@pqgruber.com>
  *
  * This driver export the value of analog input voltage to sysfs, the
  * voltage unit is mV. Through the sysfs interface, lm-sensors tool
@@ -22,11 +23,13 @@
 #include <linux/i2c.h>
 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
-/* Vdd info */
-#define MCP3021_VDD_MAX		5500
-#define MCP3021_VDD_MIN		2700
-#define MCP3021_VDD_REF		3300
+/* Vdd / reference voltage in millivolt */
+#define MCP3021_VDD_REF_MAX	5500
+#define MCP3021_VDD_REF_MIN	2700
+#define MCP3021_VDD_REF_DEFAULT	3300
 
 /* output format */
 #define MCP3021_SAR_SHIFT	2
@@ -47,7 +50,7 @@ enum chips {
  */
 struct mcp3021_data {
 	struct device *hwmon_dev;
-	u32 vdd;	/* device power supply */
+	u32 vdd;        /* supply and reference voltage in millivolt */
 	u16 sar_shift;
 	u16 sar_mask;
 	u8 output_res;
@@ -106,6 +109,7 @@ static int mcp3021_probe(struct i2c_client *client,
 {
 	int err;
 	struct mcp3021_data *data = NULL;
+	struct device_node *np = client->dev.of_node;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -117,6 +121,21 @@ static int mcp3021_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, data);
 
+	if (np) {
+		if (!of_property_read_u32(np, "reference-voltage-microvolt",
+					  &data->vdd))
+			data->vdd /= 1000;
+		else
+			data->vdd = MCP3021_VDD_REF_DEFAULT;
+	} else {
+		u32 *pdata = dev_get_platdata(&client->dev);
+
+		if (pdata)
+			data->vdd = *pdata;
+		else
+			data->vdd = MCP3021_VDD_REF_DEFAULT;
+	}
+
 	switch (id->driver_data) {
 	case mcp3021:
 		data->sar_shift = MCP3021_SAR_SHIFT;
@@ -131,13 +150,8 @@ static int mcp3021_probe(struct i2c_client *client,
 		break;
 	}
 
-	if (dev_get_platdata(&client->dev)) {
-		data->vdd = *(u32 *)dev_get_platdata(&client->dev);
-		if (data->vdd > MCP3021_VDD_MAX || data->vdd < MCP3021_VDD_MIN)
-			return -EINVAL;
-	} else {
-		data->vdd = MCP3021_VDD_REF;
-	}
+	if (data->vdd > MCP3021_VDD_REF_MAX || data->vdd < MCP3021_VDD_REF_MIN)
+		return -EINVAL;
 
 	err = sysfs_create_file(&client->dev.kobj, &dev_attr_in0_input.attr);
 	if (err)
@@ -173,9 +187,19 @@ static const struct i2c_device_id mcp3021_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mcp3021_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id of_mcp3021_match[] = {
+	{ .compatible = "microchip,mcp3021", .data = (void *)mcp3021 },
+	{ .compatible = "microchip,mcp3221", .data = (void *)mcp3221 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_mcp3021_match);
+#endif
+
 static struct i2c_driver mcp3021_driver = {
 	.driver = {
 		.name = "mcp3021",
+		.of_match_table = of_match_ptr(of_mcp3021_match),
 	},
 	.probe = mcp3021_probe,
 	.remove = mcp3021_remove,
-- 
2.10.2

