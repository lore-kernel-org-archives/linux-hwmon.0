Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35220 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751671AbcK0FQZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2016 00:16:25 -0500
Received: by mail-pg0-f65.google.com with SMTP id p66so9556963pga.2
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2016 21:16:25 -0800 (PST)
From: John Muir <john@jmuir.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: John Muir <john@jmuir.com>
Subject: [PATCH 3/3] hwmon: tmp108: Update driver to use hwmon_chip_info.
Date: Sat, 26 Nov 2016 21:15:37 -0800
Message-Id: <1480223737-82080-4-git-send-email-john@jmuir.com>
In-Reply-To: <1480223737-82080-2-git-send-email-john@jmuir.com>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Move the tmp108 driver from hwmon attribute groups to
hwmon_chip_info.

Signed-off-by: John Muir <john@jmuir.com>
---
 drivers/hwmon/tmp108.c | 142 +++++++++++++++++++++++++------------------------
 1 file changed, 73 insertions(+), 69 deletions(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index b13d652..29ddc2e 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -25,7 +25,6 @@
 #include <linux/device.h>
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
-#include <linux/thermal.h>
 #include <linux/of.h>
 
 #define	DRIVER_NAME "tmp108"
@@ -87,12 +86,6 @@ struct tmp108 {
 	unsigned long ready_time;
 };
 
-static const u8 tmp108_temp_reg[TMP108_TEMP_REG_COUNT] = {
-	TMP108_REG_TEMP,
-	TMP108_REG_TLOW,
-	TMP108_REG_THIGH,
-};
-
 /* convert 12-bit TMP108 register value to milliCelsius */
 static inline int tmp108_temp_reg_to_mC(s16 val)
 {
@@ -105,23 +98,28 @@ static inline u16 tmp108_mC_to_temp_reg(int val)
 	return (val * 256) / 1000;
 }
 
-static int tmp108_read_reg_temp(struct device *dev, int reg, int *temp)
+static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *temp)
 {
 	struct tmp108 *tmp108 = dev_get_drvdata(dev);
 	unsigned int regval;
-	int err;
+	int err, reg;
 
-	switch (reg) {
-	case TMP108_REG_TEMP:
+	switch (attr) {
+	case hwmon_temp_input:
 		/* Is it too early to return a conversion ? */
 		if (time_before(jiffies, tmp108->ready_time)) {
 			dev_dbg(dev, "%s: Conversion not ready yet..\n",
 				__func__);
 			return -EAGAIN;
 		}
+		reg = TMP108_REG_TEMP;
+		break;
+	case hwmon_temp_min:
+		reg = TMP108_REG_TLOW;
 		break;
-	case TMP108_REG_TLOW:
-	case TMP108_REG_THIGH:
+	case hwmon_temp_max:
+		reg = TMP108_REG_THIGH;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -135,68 +133,79 @@ static int tmp108_read_reg_temp(struct device *dev, int reg, int *temp)
 	return 0;
 }
 
-static ssize_t tmp108_show_temp(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long temp)
 {
-	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
-	int temp;
-	int err;
-
-	if (sda->index >= ARRAY_SIZE(tmp108_temp_reg))
-		return -EINVAL;
+	struct tmp108 *tmp108 = dev_get_drvdata(dev);
+	int reg;
 
-	err = tmp108_read_reg_temp(dev, tmp108_temp_reg[sda->index], &temp);
-	if (err)
-		return err;
+	switch (attr) {
+	case hwmon_temp_min:
+		reg = TMP108_REG_TLOW;
+		break;
+	case hwmon_temp_max:
+		reg = TMP108_REG_THIGH;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
+	return regmap_write(tmp108->regmap, reg, tmp108_mC_to_temp_reg(temp));
 }
 
-static ssize_t tmp108_set_temp(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
 {
-	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
-	struct tmp108 *tmp108 = dev_get_drvdata(dev);
-	long temp;
-	int err;
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return S_IRUGO;
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+		return S_IRUGO | S_IWUSR;
+	default:
+		return 0;
+	}
+}
 
-	if (sda->index >= ARRAY_SIZE(tmp108_temp_reg))
-		return -EINVAL;
+static u32 tmp108_chip_config[] = {
+	HWMON_C_REGISTER_TZ,
+	0
+};
 
-	if (kstrtol(buf, 10, &temp) < 0)
-		return -EINVAL;
+static const struct hwmon_channel_info tmp108_chip = {
+	.type = hwmon_chip,
+	.config = tmp108_chip_config,
+};
 
-	temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
-	err = regmap_write(tmp108->regmap, tmp108_temp_reg[sda->index],
-			   tmp108_mC_to_temp_reg(temp));
-	if (err)
-		return err;
-	return count;
-}
+static u32 tmp108_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN,
+	0
+};
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp108_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, tmp108_show_temp,
-			  tmp108_set_temp, 1);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, tmp108_show_temp,
-			  tmp108_set_temp, 2);
+static const struct hwmon_channel_info tmp108_temp = {
+	.type = hwmon_temp,
+	.config = tmp108_temp_config,
+};
 
-static struct attribute *tmp108_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
+static const struct hwmon_channel_info *tmp108_info[] = {
+	&tmp108_chip,
+	&tmp108_temp,
 	NULL
 };
-ATTRIBUTE_GROUPS(tmp108);
 
-static int tmp108_get_temp(void *dev, int *temp)
-{
-	return tmp108_read_reg_temp(dev, TMP108_REG_TEMP, temp);
-}
+static const struct hwmon_ops tmp108_hwmon_ops = {
+	.is_visible = tmp108_is_visible,
+	.read = tmp108_read,
+	.write = tmp108_write,
+};
 
-static const struct thermal_zone_of_device_ops tmp108_of_thermal_ops = {
-	.get_temp = tmp108_get_temp,
+static const struct hwmon_chip_info tmp108_chip_info = {
+	.ops = &tmp108_hwmon_ops,
+	.info = tmp108_info,
 };
 
 static void tmp108_update_ready_time(struct tmp108 *tmp108)
@@ -243,7 +252,6 @@ static int tmp108_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
-	struct thermal_zone_device *tz;
 	struct tmp108 *tmp108;
 	unsigned int regval;
 	int err;
@@ -352,19 +360,15 @@ static int tmp108_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   tmp108,
-							   tmp108_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 tmp108,
+							 &tmp108_chip_info,
+							 NULL);
 	if (IS_ERR(hwmon_dev)) {
 		dev_dbg(dev, "unable to register hwmon device\n");
 		return PTR_ERR(hwmon_dev);
 	}
 
-	tz = devm_thermal_zone_of_sensor_register(hwmon_dev, 0, hwmon_dev,
-						  &tmp108_of_thermal_ops);
-	if (IS_ERR(tz))
-		return PTR_ERR(tz);
-
 	dev_info(dev, "%s, alert: active %s, hyst: %uC, conv: %ucHz\n",
 		 (tmp108->config & TMP108_CONF_TM) != 0 ?
 			"interrupt" : "comparator",
-- 
2.8.0.rc3.226.g39d4020

