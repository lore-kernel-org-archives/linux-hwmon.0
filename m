Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/9] hwmon: (tmp102) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:45 -0700
Message-Id: <1471153911-6536-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig  |   1 -
 drivers/hwmon/tmp102.c | 152 ++++++++++++++++++++++++++++---------------------
 2 files changed, 88 insertions(+), 65 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fcdaf6773238..6c82ee240c4c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1571,7 +1571,6 @@ config SENSORS_THMC50
 config SENSORS_TMP102
 	tristate "Texas Instruments TMP102"
 	depends on I2C
-	depends on THERMAL || !THERMAL_OF
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for Texas Instruments TMP102
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 8479ac5eb853..0874d77acec6 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -25,7 +25,6 @@
 #include <linux/device.h>
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
-#include <linux/thermal.h>
 #include <linux/of.h>
 
 #define	DRIVER_NAME "tmp102"
@@ -79,84 +78,111 @@ static inline u16 tmp102_mC_to_reg(int val)
 	return (val * 128) / 1000;
 }
 
-static int tmp102_read_temp(void *dev, int *temp)
+static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *temp)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
-	unsigned int reg;
-	int ret;
-
-	if (time_before(jiffies, tmp102->ready_time)) {
-		dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
-		return -EAGAIN;
+	unsigned int regval;
+	int err, reg;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		/* Is it too early to return a conversion ? */
+		if (time_before(jiffies, tmp102->ready_time))
+			return -EAGAIN;
+		reg = TMP102_TEMP_REG;
+		break;
+	case hwmon_temp_max_hyst:
+		reg = TMP102_TLOW_REG;
+		break;
+	case hwmon_temp_max:
+		reg = TMP102_THIGH_REG;
+		break;
+	default:
+		return -EOPNOTSUPP;
 	}
 
-	ret = regmap_read(tmp102->regmap, TMP102_TEMP_REG, &reg);
-	if (ret < 0)
-		return ret;
-
-	*temp = tmp102_reg_to_mC(reg);
+	err = regmap_read(tmp102->regmap, reg, &regval);
+	if (err < 0)
+		return err;
+	*temp = tmp102_reg_to_mC(regval);
 
 	return 0;
 }
 
-static ssize_t tmp102_show_temp(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long temp)
 {
-	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
-	int regaddr = sda->index;
-	unsigned int reg;
-	int err;
-
-	if (regaddr == TMP102_TEMP_REG &&
-	    time_before(jiffies, tmp102->ready_time))
-		return -EAGAIN;
-
-	err = regmap_read(tmp102->regmap, regaddr, &reg);
-	if (err < 0)
-		return err;
+	int reg;
+
+	switch (attr) {
+	case hwmon_temp_max_hyst:
+		reg = TMP102_TLOW_REG;
+		break;
+	case hwmon_temp_max:
+		reg = TMP102_THIGH_REG;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	return sprintf(buf, "%d\n", tmp102_reg_to_mC(reg));
+	temp = clamp_val(temp, -256000, 255000);
+	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(temp));
 }
 
-static ssize_t tmp102_set_temp(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
 {
-	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
-	struct tmp102 *tmp102 = dev_get_drvdata(dev);
-	int reg = sda->index;
-	long val;
-	int err;
-
-	if (kstrtol(buf, 10, &val) < 0)
-		return -EINVAL;
-	val = clamp_val(val, -256000, 255000);
-
-	err = regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
-	return err ? : count;
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return S_IRUGO;
+	case hwmon_temp_max_hyst:
+	case hwmon_temp_max:
+		return S_IRUGO | S_IWUSR;
+	default:
+		return 0;
+	}
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp102_show_temp, NULL,
-			  TMP102_TEMP_REG);
+static u32 tmp102_chip_config[] = {
+	HWMON_C_REGISTER_TZ,
+	0
+};
+
+static const struct hwmon_channel_info tmp102_chip = {
+	.type = hwmon_chip,
+	.config = tmp102_chip_config,
+};
 
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO, tmp102_show_temp,
-			  tmp102_set_temp, TMP102_TLOW_REG);
+static u32 tmp102_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST,
+	0
+};
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, tmp102_show_temp,
-			  tmp102_set_temp, TMP102_THIGH_REG);
+static const struct hwmon_channel_info tmp102_temp = {
+	.type = hwmon_temp,
+	.config = tmp102_temp_config,
+};
 
-static struct attribute *tmp102_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
+static const struct hwmon_channel_info *tmp102_info[] = {
+	&tmp102_chip,
+	&tmp102_temp,
 	NULL
 };
-ATTRIBUTE_GROUPS(tmp102);
 
-static const struct thermal_zone_of_device_ops tmp102_of_thermal_ops = {
-	.get_temp = tmp102_read_temp,
+static const struct hwmon_ops tmp102_hwmon_ops = {
+	.is_visible = tmp102_is_visible,
+	.read = tmp102_read,
+	.write = tmp102_write,
+};
+
+static const struct hwmon_chip_info tmp102_chip_info = {
+	.ops = &tmp102_hwmon_ops,
+	.info = tmp102_info,
 };
 
 static void tmp102_restore_config(void *data)
@@ -188,7 +214,7 @@ static const struct regmap_config tmp102_regmap_config = {
 };
 
 static int tmp102_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+			const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
@@ -249,16 +275,14 @@ static int tmp102_probe(struct i2c_client *client,
 		tmp102->ready_time += msecs_to_jiffies(CONVERSION_TIME_MS);
 	}
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   tmp102,
-							   tmp102_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 tmp102,
+							 &tmp102_chip_info,
+							 NULL);
 	if (IS_ERR(hwmon_dev)) {
 		dev_dbg(dev, "unable to register hwmon device\n");
 		return PTR_ERR(hwmon_dev);
 	}
-	devm_thermal_zone_of_sensor_register(hwmon_dev, 0, hwmon_dev,
-					     &tmp102_of_thermal_ops);
-
 	dev_info(dev, "initialized\n");
 
 	return 0;
-- 
2.5.0
