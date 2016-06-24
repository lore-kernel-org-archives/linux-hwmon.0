Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53765 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109AbcFXAuO (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 23 Jun 2016 20:50:14 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (lm75) Convert to use regmap
Date: Thu, 23 Jun 2016 17:50:01 -0700
Message-Id: <1466729401-27567-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1466729401-27567-1-git-send-email-linux@roeck-us.net>
References: <1466729401-27567-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Convert to use regmap. Leave caching to regmap and drop the register
update function. While this can result in additional read operations
if the temperature register is read continuously, it avoids re-reading
the limit registers and thus overall reduces complexity.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 163 ++++++++++++++++++++++-----------------------------
 1 file changed, 69 insertions(+), 94 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index fe83f70ba62a..17682d216071 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -26,8 +26,8 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/thermal.h>
 #include "lm75.h"
 
@@ -66,32 +66,22 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 
 
 /* The LM75 registers */
+#define LM75_REG_TEMP		0x00
 #define LM75_REG_CONF		0x01
-static const u8 LM75_REG_TEMP[3] = {
-	0x00,		/* input */
-	0x03,		/* max */
-	0x02,		/* hyst */
-};
+#define LM75_REG_HYST		0x02
+#define LM75_REG_MAX		0x03
+#define LM75_NUM_REG		0x04
 
 /* Each client has this additional data */
 struct lm75_data {
 	struct i2c_client	*client;
-	struct mutex		update_lock;
+	struct regmap		*regmap;
 	u8			orig_conf;
 	u8			resolution;	/* In bits, between 9 and 12 */
 	u8			resolution_limits;
-	char			valid;		/* !=0 if registers are valid */
-	unsigned long		last_updated;	/* In jiffies */
-	unsigned long		sample_time;	/* In jiffies */
-	s16			temp[3];	/* Register values,
-						   0 = input
-						   1 = max
-						   2 = hyst */
+	unsigned int		sample_time;	/* In ms */
 };
 
-static struct lm75_data *lm75_update_device(struct device *dev);
-
-
 /*-----------------------------------------------------------------------*/
 
 static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
@@ -103,12 +93,15 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 
 static int lm75_read_temp(void *dev, int *temp)
 {
-	struct lm75_data *data = lm75_update_device(dev);
+	struct lm75_data *data = dev_get_drvdata(dev);
+	unsigned int _temp;
+	int err;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	err = regmap_read(data->regmap, LM75_REG_TEMP, &_temp);
+	if (err < 0)
+		return err;
 
-	*temp = lm75_reg_to_mc(data->temp[0], data->resolution);
+	*temp = lm75_reg_to_mc(_temp, data->resolution);
 
 	return 0;
 }
@@ -117,13 +110,15 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *da,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct lm75_data *data = lm75_update_device(dev);
+	struct lm75_data *data = dev_get_drvdata(dev);
+	unsigned int temp = 0;
+	int err;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	err = regmap_read(data->regmap, attr->index, &temp);
+	if (err < 0)
+		return err;
 
-	return sprintf(buf, "%ld\n", lm75_reg_to_mc(data->temp[attr->index],
-						    data->resolution));
+	return sprintf(buf, "%ld\n", lm75_reg_to_mc(temp, data->resolution));
 }
 
 static ssize_t set_temp(struct device *dev, struct device_attribute *da,
@@ -131,8 +126,6 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm75_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int nr = attr->index;
 	long temp;
 	int error;
 	u8 resolution;
@@ -150,31 +143,29 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	else
 		resolution = data->resolution;
 
-	mutex_lock(&data->update_lock);
 	temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
-	data->temp[nr] = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
-					   1000) << (16 - resolution);
-	i2c_smbus_write_word_swapped(client, LM75_REG_TEMP[nr], data->temp[nr]);
-	mutex_unlock(&data->update_lock);
+	temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
+				 1000) << (16 - resolution);
+	error = regmap_write(data->regmap, attr->index, temp);
+	if (error < 0)
+		return error;
+
 	return count;
 }
 
 static ssize_t show_update_interval(struct device *dev,
 				    struct device_attribute *da, char *buf)
 {
-	struct lm75_data *data = lm75_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	struct lm75_data *data = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", jiffies_to_msecs(data->sample_time));
+	return sprintf(buf, "%u\n", data->sample_time);
 }
 
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			show_temp, set_temp, 1);
+			show_temp, set_temp, LM75_REG_MAX);
 static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-			show_temp, set_temp, 2);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
+			show_temp, set_temp, LM75_REG_HYST);
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, LM75_REG_TEMP);
 static DEVICE_ATTR(update_interval, S_IRUGO, show_update_interval, NULL);
 
 static struct attribute *lm75_attrs[] = {
@@ -195,6 +186,27 @@ static const struct thermal_zone_of_device_ops lm75_of_thermal_ops = {
 
 /* device probe and removal */
 
+static bool lm75_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg != LM75_REG_TEMP;
+}
+
+static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == LM75_REG_TEMP;
+}
+
+static const struct regmap_config lm75_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = LM75_REG_MAX,
+	.num_reg_defaults_raw = LM75_NUM_REG,
+	.writeable_reg = lm75_is_writeable_reg,
+	.volatile_reg = lm75_is_volatile_reg,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_FLAT,
+};
+
 static void lm75_remove(void *data)
 {
 	struct lm75_data *lm75 = data;
@@ -223,8 +235,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -ENOMEM;
 
 	data->client = client;
-	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
+
+	data->regmap = devm_regmap_init_i2c(client, &lm75_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
 
 	/* Set to LM75 resolution (9 bits, 1/2 degree C) and range.
 	 * Then tweak to be more precise when appropriate.
@@ -236,7 +250,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	case adt75:
 		clr_mask |= 1 << 5;		/* not one-shot mode */
 		data->resolution = 12;
-		data->sample_time = HZ / 8;
+		data->sample_time = MSEC_PER_SEC / 8;
 		break;
 	case ds1775:
 	case ds75:
@@ -244,35 +258,35 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		clr_mask |= 3 << 5;
 		set_mask |= 2 << 5;		/* 11-bit mode */
 		data->resolution = 11;
-		data->sample_time = HZ;
+		data->sample_time = MSEC_PER_SEC;
 		break;
 	case ds7505:
 		set_mask |= 3 << 5;		/* 12-bit mode */
 		data->resolution = 12;
-		data->sample_time = HZ / 4;
+		data->sample_time = MSEC_PER_SEC / 4;
 		break;
 	case g751:
 	case lm75:
 	case lm75a:
 		data->resolution = 9;
-		data->sample_time = HZ / 2;
+		data->sample_time = MSEC_PER_SEC / 2;
 		break;
 	case lm75b:
 		data->resolution = 11;
-		data->sample_time = HZ / 4;
+		data->sample_time = MSEC_PER_SEC / 4;
 		break;
 	case max6625:
 		data->resolution = 9;
-		data->sample_time = HZ / 4;
+		data->sample_time = MSEC_PER_SEC / 4;
 		break;
 	case max6626:
 		data->resolution = 12;
 		data->resolution_limits = 9;
-		data->sample_time = HZ / 4;
+		data->sample_time = MSEC_PER_SEC / 4;
 		break;
 	case tcn75:
 		data->resolution = 9;
-		data->sample_time = HZ / 8;
+		data->sample_time = MSEC_PER_SEC / 8;
 		break;
 	case mcp980x:
 		data->resolution_limits = 9;
@@ -281,14 +295,14 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	case tmp101:
 		set_mask |= 3 << 5;		/* 12-bit mode */
 		data->resolution = 12;
-		data->sample_time = HZ;
+		data->sample_time = MSEC_PER_SEC;
 		clr_mask |= 1 << 7;		/* not one-shot mode */
 		break;
 	case tmp112:
 		set_mask |= 3 << 5;		/* 12-bit mode */
 		clr_mask |= 1 << 7;		/* not one-shot mode */
 		data->resolution = 12;
-		data->sample_time = HZ / 4;
+		data->sample_time = MSEC_PER_SEC / 4;
 		break;
 	case tmp105:
 	case tmp175:
@@ -297,12 +311,12 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		set_mask |= 3 << 5;		/* 12-bit mode */
 		clr_mask |= 1 << 7;		/* not one-shot mode */
 		data->resolution = 12;
-		data->sample_time = HZ / 2;
+		data->sample_time = MSEC_PER_SEC / 2;
 		break;
 	case tmp75c:
 		clr_mask |= 1 << 5;		/* not one-shot mode */
 		data->resolution = 12;
-		data->sample_time = HZ / 4;
+		data->sample_time = MSEC_PER_SEC / 4;
 		break;
 	}
 
@@ -506,45 +520,6 @@ static struct i2c_driver lm75_driver = {
 	.address_list	= normal_i2c,
 };
 
-/*-----------------------------------------------------------------------*/
-
-static struct lm75_data *lm75_update_device(struct device *dev)
-{
-	struct lm75_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	struct lm75_data *ret = data;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + data->sample_time)
-	    || !data->valid) {
-		int i;
-		dev_dbg(&client->dev, "Starting lm75 update\n");
-
-		for (i = 0; i < ARRAY_SIZE(data->temp); i++) {
-			int status;
-
-			status = i2c_smbus_read_word_swapped(client,
-							     LM75_REG_TEMP[i]);
-			if (unlikely(status < 0)) {
-				dev_dbg(dev,
-					"LM75: Failed to read value: reg %d, error %d\n",
-					LM75_REG_TEMP[i], status);
-				ret = ERR_PTR(status);
-				data->valid = 0;
-				goto abort;
-			}
-			data->temp[i] = status;
-		}
-		data->last_updated = jiffies;
-		data->valid = 1;
-	}
-
-abort:
-	mutex_unlock(&data->update_lock);
-	return ret;
-}
-
 module_i2c_driver(lm75_driver);
 
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
-- 
2.5.0

