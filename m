Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:47612 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933039AbdKGI2o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Nov 2017 03:28:44 -0500
From: Lei YU <mine260309@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc: Lei YU <mine260309@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/3] drivers: hwmon: Add W83773G driver
Date: Tue,  7 Nov 2017 16:27:53 +0800
Message-Id: <1510043274-4778-3-git-send-email-mine260309@gmail.com>
In-Reply-To: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
References: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Nuvoton W83773G is a hardware monitor IC providing one local
temperature and two remote temperature sensors.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
v2:
 - Rewrite the driver using regmap
 - Add offset and update_interval
---
 drivers/hwmon/Kconfig   |  10 ++
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/w83773g.c | 281 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 drivers/hwmon/w83773g.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d654314..11c6248 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1710,6 +1710,16 @@ config SENSORS_VT8231
 	  This driver can also be built as a module.  If so, the module
 	  will be called vt8231.
 
+config SENSORS_W83773G
+	tristate "Nuvoton W83773G"
+	depends on I2C
+	help
+	  If you say yes here you get support for the Nuvoton W83773G hardware
+	  monitoring chip.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called w83773g.
+
 config SENSORS_W83781D
 	tristate "Winbond W83781D, W83782D, W83783S, Asus AS99127F"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index c84d978..0649ad8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
 # asb100, then w83781d go first, as they can override other drivers' addresses.
 obj-$(CONFIG_SENSORS_ASB100)	+= asb100.o
 obj-$(CONFIG_SENSORS_W83627HF)	+= w83627hf.o
+obj-$(CONFIG_SENSORS_W83773G)	+= w83773g.o
 obj-$(CONFIG_SENSORS_W83792D)	+= w83792d.o
 obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
 obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
new file mode 100644
index 0000000..d352bac
--- /dev/null
+++ b/drivers/hwmon/w83773g.c
@@ -0,0 +1,281 @@
+/*
+ * Copyright (C) 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * Driver for the Nuvoton W83773G SMBus temperature sensor IC.
+ * Supported models: W83773G
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+/* Addresses to scan */
+static const unsigned short normal_i2c[] = { 0x4c, 0x4d, I2C_CLIENT_END };
+
+/* The W83773 registers */
+#define W83773_CONVERSION_RATE_REG_READ		0x04
+#define W83773_CONVERSION_RATE_REG_WRITE	0x0A
+#define W83773_MANUFACTURER_ID_REG		0xFE
+#define W83773_LOCAL_TEMP			0x00
+
+static const u8 W83773_STATUS[2] = { 0x02, 0x17 };
+
+static const u8 W83773_TEMP_LSB[2] = { 0x10, 0x25 };
+static const u8 W83773_TEMP_MSB[2] = { 0x01, 0x24 };
+
+static const u8 W83773_OFFSET_LSB[2] = { 0x12, 0x16 };
+static const u8 W83773_OFFSET_MSB[2] = { 0x11, 0x15 };
+
+
+/* this is the number of sensors in the device */
+static const struct i2c_device_id w83773_id[] = {
+	{ "w83773g" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, w83773_id);
+
+static const struct of_device_id w83773_of_match[] = {
+	{
+		.compatible = "nuvoton,w83773g"
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, w83773_of_match);
+
+static inline int temp_of_local(s8 reg)
+{
+	return reg * 1000;
+}
+
+static inline int temp_of_remote(s8 hb, u8 lb)
+{
+	return (hb << 3 | lb >> 5) * 125;
+}
+
+static ssize_t show_local_temp(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(regmap, sda->index, &regval);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", temp_of_local(regval));
+}
+
+static ssize_t show_remote_temp(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int regval_high;
+	unsigned int regval_low;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_TEMP_MSB[sda->index], &regval_high);
+	ret |= regmap_read(regmap, W83773_TEMP_LSB[sda->index], &regval_low);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", temp_of_remote(regval_high, regval_low));
+}
+
+static ssize_t show_status(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_STATUS[sda->index], &regval);
+
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", (u8)regval & 0x04 >> 2);
+}
+
+static ssize_t show_offset(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int regval_high;
+	unsigned int regval_low;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_OFFSET_MSB[sda->index], &regval_high);
+	ret |= regmap_read(regmap, W83773_OFFSET_LSB[sda->index], &regval_low);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", temp_of_remote(regval_high, regval_low));
+}
+
+static ssize_t set_offset(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
+	struct regmap *regmap = dev_get_drvdata(dev);
+	long val;
+	int ret;
+	int err;
+	u8 high_byte;
+	u8 low_byte;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	val = clamp_val(val, -127825, 127825);
+	/* offset value equals to (high_byte << 3 | low_byte >> 5) * 125 */
+	val /= 125;
+	high_byte = val >> 3;
+	low_byte = (val & 0x07) << 5;
+
+	ret = regmap_write(regmap, W83773_OFFSET_MSB[sda->index], high_byte);
+	ret |= regmap_write(regmap, W83773_OFFSET_LSB[sda->index], low_byte);
+
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+static ssize_t show_update_interval(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_CONVERSION_RATE_REG_READ, &regval);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%u\n", 16000 >> regval);
+}
+
+static ssize_t set_update_interval(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+	int err, rate;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+
+	/*
+	 * For valid rates, interval can be calculated as
+	 *	interval = (1 << (8 - rate)) * 62.5;
+	 * Rounded rate is therefore
+	 *	rate = 8 - __fls(interval * 8 / (62.5 * 7));
+	 * Use clamp_val() to avoid overflows, and to ensure valid input
+	 * for __fls.
+	 */
+	val = clamp_val(val, 62, 16000) * 10;
+	rate = 8 - __fls((val * 8 / (625 * 7)));
+	ret = regmap_write(regmap, W83773_CONVERSION_RATE_REG_WRITE, rate);
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, show_local_temp, NULL,
+			  W83773_LOCAL_TEMP);
+static SENSOR_DEVICE_ATTR(temp2_input, 0444, show_remote_temp, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_fault, 0444, show_status, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_offset, 0644, show_offset, set_offset, 0);
+static SENSOR_DEVICE_ATTR(temp3_input, 0444, show_remote_temp, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp3_fault, 0444, show_status, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp3_offset, 0644, show_offset, set_offset, 1);
+static DEVICE_ATTR(update_interval, 0644, show_update_interval,
+		   set_update_interval);
+
+static struct attribute *w83773g_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_fault.dev_attr.attr,
+	&sensor_dev_attr_temp2_offset.dev_attr.attr,
+	&sensor_dev_attr_temp3_input.dev_attr.attr,
+	&sensor_dev_attr_temp3_fault.dev_attr.attr,
+	&sensor_dev_attr_temp3_offset.dev_attr.attr,
+	&dev_attr_update_interval.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(w83773g);
+
+static const struct regmap_config w83773g_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int w83773_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = devm_regmap_init_i2c(client, &w83773g_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(regmap);
+	}
+
+	/* Set the conversion rate to 2 Hz */
+	ret = regmap_write(regmap, W83773_CONVERSION_RATE_REG_WRITE, 0x05);
+	if (ret < 0) {
+		dev_err(&client->dev, "error writing config rate register\n");
+		return ret;
+	}
+
+	i2c_set_clientdata(client, regmap);
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+						      regmap, w83773g_groups);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct i2c_driver w83773_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "w83773g",
+		.of_match_table = of_match_ptr(w83773_of_match),
+	},
+	.probe = w83773_probe,
+	.id_table = w83773_id,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(w83773_driver);
+
+MODULE_AUTHOR("Lei YU <mine260309@gmail.com>");
+MODULE_DESCRIPTION("W83773G temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1

