Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/9] hwmon: (lm75) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:43 -0700
Message-Id: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig |   1 -
 drivers/hwmon/lm75.c  | 185 +++++++++++++++++++++++++++++++-------------------
 2 files changed, 116 insertions(+), 70 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 655a462f3622..fcdaf6773238 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -969,7 +969,6 @@ config SENSORS_LM73
 config SENSORS_LM75
 	tristate "National Semiconductor LM75 and compatibles"
 	depends on I2C
-	depends on THERMAL || !THERMAL_OF
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for one common type of
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 92f9d4bbf597..2fe4cfe839a5 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -28,7 +28,6 @@
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/thermal.h>
 #include "lm75.h"
 
 
@@ -88,56 +87,75 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 	return ((temp >> (16 - resolution)) * 1000) >> (resolution - 8);
 }
 
-/* sysfs attributes for hwmon */
-
-static int lm75_read_temp(void *dev, int *temp)
+static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
-	unsigned int _temp;
-	int err;
-
-	err = regmap_read(data->regmap, LM75_REG_TEMP, &_temp);
-	if (err < 0)
-		return err;
-
-	*temp = lm75_reg_to_mc(_temp, data->resolution);
-
+	unsigned int regval;
+	int err, reg;
+
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			*val = data->sample_time;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			reg = LM75_REG_TEMP;
+			break;
+		case hwmon_temp_max:
+			reg = LM75_REG_MAX;
+			break;
+		case hwmon_temp_max_hyst:
+			reg = LM75_REG_HYST;
+			break;
+		default:
+			return -EINVAL;
+		}
+		err = regmap_read(data->regmap, reg, &regval);
+		if (err < 0)
+			return err;
+
+		*val = lm75_reg_to_mc(regval, data->resolution);
+		break;
+	default:
+		return -EINVAL;
+	}
 	return 0;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *da,
-			 char *buf)
+static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long temp)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm75_data *data = dev_get_drvdata(dev);
-	unsigned int temp = 0;
-	int err;
-
-	err = regmap_read(data->regmap, attr->index, &temp);
-	if (err < 0)
-		return err;
-
-	return sprintf(buf, "%ld\n", lm75_reg_to_mc(temp, data->resolution));
-}
-
-static ssize_t set_temp(struct device *dev, struct device_attribute *da,
-			const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct lm75_data *data = dev_get_drvdata(dev);
-	long temp;
-	int error;
 	u8 resolution;
+	int reg;
+
+	if (type != hwmon_temp)
+		return -EINVAL;
 
-	error = kstrtol(buf, 10, &temp);
-	if (error)
-		return error;
+	switch (attr) {
+	case hwmon_temp_max:
+		reg = LM75_REG_MAX;
+		break;
+	case hwmon_temp_max_hyst:
+		reg = LM75_REG_HYST;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	/*
 	 * Resolution of limit registers is assumed to be the same as the
 	 * temperature input register resolution unless given explicitly.
 	 */
-	if (attr->index && data->resolution_limits)
+	if (data->resolution_limits)
 		resolution = data->resolution_limits;
 	else
 		resolution = data->resolution;
@@ -145,45 +163,77 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
 	temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
 				 1000) << (16 - resolution);
-	error = regmap_write(data->regmap, attr->index, temp);
-	if (error < 0)
-		return error;
 
-	return count;
+	return regmap_write(data->regmap, reg, temp);
 }
 
-static ssize_t show_update_interval(struct device *dev,
-				    struct device_attribute *da, char *buf)
+static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
 {
-	struct lm75_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%u\n", data->sample_time);
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return S_IRUGO;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return S_IRUGO;
+		case hwmon_temp_max:
+		case hwmon_temp_max_hyst:
+			return S_IRUGO | S_IWUSR;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			show_temp, set_temp, LM75_REG_MAX);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-			show_temp, set_temp, LM75_REG_HYST);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, LM75_REG_TEMP);
-static DEVICE_ATTR(update_interval, S_IRUGO, show_update_interval, NULL);
+/*-----------------------------------------------------------------------*/
 
-static struct attribute *lm75_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&dev_attr_update_interval.attr,
+/* device probe and removal */
 
-	NULL
+/* chip configuration */
+
+static const u32 lm75_chip_config[] = {
+	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
+	0
 };
-ATTRIBUTE_GROUPS(lm75);
 
-static const struct thermal_zone_of_device_ops lm75_of_thermal_ops = {
-	.get_temp = lm75_read_temp,
+static const struct hwmon_channel_info lm75_chip = {
+	.type = hwmon_chip,
+	.config = lm75_chip_config,
 };
 
-/*-----------------------------------------------------------------------*/
+static const u32 lm75_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST,
+	0
+};
 
-/* device probe and removal */
+static const struct hwmon_channel_info lm75_temp = {
+	.type = hwmon_temp,
+	.config = lm75_temp_config,
+};
+
+static const struct hwmon_channel_info *lm75_info[] = {
+	&lm75_chip,
+	&lm75_temp,
+	NULL
+};
+
+static const struct hwmon_ops lm75_hwmon_ops = {
+	.is_visible = lm75_is_visible,
+	.read = lm75_read,
+	.write = lm75_write,
+};
+
+static const struct hwmon_chip_info lm75_chip_info = {
+	.ops = &lm75_hwmon_ops,
+	.info = lm75_info,
+};
 
 static bool lm75_is_writeable_reg(struct device *dev, unsigned int reg)
 {
@@ -337,15 +387,12 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	dev_dbg(dev, "Config %02x\n", new);
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, lm75_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &lm75_chip_info,
+							 NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	devm_thermal_zone_of_sensor_register(hwmon_dev, 0,
-					     hwmon_dev,
-					     &lm75_of_thermal_ops);
-
 	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
 
 	return 0;
-- 
2.5.0
