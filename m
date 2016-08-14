Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 9/9] hwmon: (lm95241) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:51 -0700
Message-Id: <1471153911-6536-9-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 432 +++++++++++++++++++++++++++---------------------
 1 file changed, 242 insertions(+), 190 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 3d96c3fcba9b..ce41a19de30a 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -23,11 +23,9 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
-#include <linux/sysfs.h>
 
 #define DEVNAME "lm95241"
 
@@ -137,229 +135,241 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 	return data;
 }
 
-/* Sysfs stuff */
-static ssize_t show_input(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct lm95241_data *data = lm95241_update_device(dev);
-	int index = to_sensor_dev_attr(attr)->index;
-
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n",
-			index == 0 || (data->config & BIT(index / 2)) ?
-		temp_from_reg_signed(data->temp[index], data->temp[index + 1]) :
-		temp_from_reg_unsigned(data->temp[index],
-				       data->temp[index + 1]));
-}
-
-static ssize_t show_type(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static int lm95241_read_chip(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
 	struct lm95241_data *data = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1,
-		data->model & to_sensor_dev_attr(attr)->index ? "1\n" : "2\n");
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		*val = data->interval;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_type(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static int lm95241_read_temp(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
-	struct lm95241_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long val;
-	int shift;
-	u8 mask = to_sensor_dev_attr(attr)->index;
-
-	if (kstrtoul(buf, 10, &val) < 0)
-		return -EINVAL;
-	if (val != 1 && val != 2)
-		return -EINVAL;
-
-	shift = mask == R1MS_MASK ? TT1_SHIFT : TT2_SHIFT;
-
-	mutex_lock(&data->update_lock);
+	struct lm95241_data *data = lm95241_update_device(dev);
 
-	data->trutherm &= ~(TT_MASK << shift);
-	if (val == 1) {
-		data->model |= mask;
-		data->trutherm |= (TT_ON << shift);
-	} else {
-		data->model &= ~mask;
-		data->trutherm |= (TT_OFF << shift);
+	switch (attr) {
+	case hwmon_temp_input:
+		if (!channel || (data->config & BIT(channel - 1)))
+			*val = temp_from_reg_signed(data->temp[channel * 2],
+						data->temp[channel * 2 + 1]);
+		else
+			*val = temp_from_reg_unsigned(data->temp[channel * 2],
+						data->temp[channel * 2 + 1]);
+		return 0;
+	case hwmon_temp_min:
+		if (channel == 1)
+			*val = (data->config & R1DF_MASK) ? -128000 : 0;
+		else
+			*val = (data->config & R2DF_MASK) ? -128000 : 0;
+		return 0;
+	case hwmon_temp_max:
+		if (channel == 1)
+			*val = (data->config & R1DF_MASK) ? 127875 : 255875;
+		else
+			*val = (data->config & R2DF_MASK) ? 127875 : 255875;
+		return 0;
+	case hwmon_temp_type:
+		if (channel == 1)
+			*val = (data->model & R1MS_MASK) ? 1 : 2;
+		else
+			*val = (data->model & R2MS_MASK) ? 1 : 2;
+		return 0;
+	case hwmon_temp_fault:
+		if (channel == 1)
+			*val = !!(data->status & R1DM);
+		else
+			*val = !!(data->status & R2DM);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
 	}
-	data->valid = 0;
-
-	i2c_smbus_write_byte_data(client, LM95241_REG_RW_REMOTE_MODEL,
-				  data->model);
-	i2c_smbus_write_byte_data(client, LM95241_REG_RW_TRUTHERM,
-				  data->trutherm);
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
 }
 
-static ssize_t show_min(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static int lm95241_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
-	struct lm95241_data *data = dev_get_drvdata(dev);
-
-	return snprintf(buf, PAGE_SIZE - 1,
-			data->config & to_sensor_dev_attr(attr)->index ?
-			"-128000\n" : "0\n");
+	switch (type) {
+	case hwmon_chip:
+		return lm95241_read_chip(dev, attr, channel, val);
+	case hwmon_temp:
+		return lm95241_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_min(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static int lm95241_write_chip(struct device *dev, u32 attr, int channel,
+			      long val)
 {
 	struct lm95241_data *data = dev_get_drvdata(dev);
-	long val;
-
-	if (kstrtol(buf, 10, &val) < 0)
-		return -EINVAL;
+	int convrate;
+	u8 config;
+	int ret;
 
 	mutex_lock(&data->update_lock);
 
-	if (val < 0)
-		data->config |= to_sensor_dev_attr(attr)->index;
-	else
-		data->config &= ~to_sensor_dev_attr(attr)->index;
-	data->valid = 0;
-
-	i2c_smbus_write_byte_data(data->client, LM95241_REG_RW_CONFIG,
-				  data->config);
-
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		config = data->config & ~CFG_CRMASK;
+		if (val < 130) {
+			convrate = 76;
+			config |= CFG_CR0076;
+		} else if (val < 590) {
+			convrate = 182;
+			config |= CFG_CR0182;
+		} else if (val < 1850) {
+			convrate = 1000;
+			config |= CFG_CR1000;
+		} else {
+			convrate = 2700;
+			config |= CFG_CR2700;
+		}
+		data->interval = convrate;
+		data->config = config;
+		ret = i2c_smbus_write_byte_data(data->client,
+						LM95241_REG_RW_CONFIG, config);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
 	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-static ssize_t show_max(struct device *dev, struct device_attribute *attr,
-			char *buf)
-{
-	struct lm95241_data *data = dev_get_drvdata(dev);
-
-	return snprintf(buf, PAGE_SIZE - 1,
-			data->config & to_sensor_dev_attr(attr)->index ?
-			"127875\n" : "255875\n");
+	return ret;
 }
 
-static ssize_t set_max(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static int lm95241_write_temp(struct device *dev, u32 attr, int channel,
+			      long val)
 {
 	struct lm95241_data *data = dev_get_drvdata(dev);
-	long val;
-
-	if (kstrtol(buf, 10, &val) < 0)
-		return -EINVAL;
+	struct i2c_client *client = data->client;
+	int ret;
 
 	mutex_lock(&data->update_lock);
 
-	if (val <= 127000)
-		data->config |= to_sensor_dev_attr(attr)->index;
-	else
-		data->config &= ~to_sensor_dev_attr(attr)->index;
-	data->valid = 0;
-
-	i2c_smbus_write_byte_data(data->client, LM95241_REG_RW_CONFIG,
-				  data->config);
+	switch (attr) {
+	case hwmon_temp_min:
+		if (channel == 1) {
+			if (val < 0)
+				data->config |= R1DF_MASK;
+			else
+				data->config &= ~R1DF_MASK;
+		} else {
+			if (val < 0)
+				data->config |= R2DF_MASK;
+			else
+				data->config &= ~R2DF_MASK;
+		}
+		data->valid = 0;
+		ret = i2c_smbus_write_byte_data(client, LM95241_REG_RW_CONFIG,
+						data->config);
+		break;
+	case hwmon_temp_max:
+		if (channel == 1) {
+			if (val <= 127875)
+				data->config |= R1DF_MASK;
+			else
+				data->config &= ~R1DF_MASK;
+		} else {
+			if (val <= 127875)
+				data->config |= R2DF_MASK;
+			else
+				data->config &= ~R2DF_MASK;
+		}
+		data->valid = 0;
+		ret = i2c_smbus_write_byte_data(client, LM95241_REG_RW_CONFIG,
+						data->config);
+		break;
+	case hwmon_temp_type:
+		if (val != 1 && val != 2) {
+			ret = -EINVAL;
+			break;
+		}
+		if (channel == 1) {
+			data->trutherm &= ~(TT_MASK << TT1_SHIFT);
+			if (val == 1) {
+				data->model |= R1MS_MASK;
+				data->trutherm |= (TT_ON << TT1_SHIFT);
+			} else {
+				data->model &= ~R1MS_MASK;
+				data->trutherm |= (TT_OFF << TT1_SHIFT);
+			}
+		} else {
+			data->trutherm &= ~(TT_MASK << TT2_SHIFT);
+			if (val == 1) {
+				data->model |= R2MS_MASK;
+				data->trutherm |= (TT_ON << TT2_SHIFT);
+			} else {
+				data->model &= ~R2MS_MASK;
+				data->trutherm |= (TT_OFF << TT2_SHIFT);
+			}
+		}
+		ret = i2c_smbus_write_byte_data(client,
+						LM95241_REG_RW_REMOTE_MODEL,
+						data->model);
+		if (ret < 0)
+			break;
+		ret = i2c_smbus_write_byte_data(client, LM95241_REG_RW_TRUTHERM,
+						data->trutherm);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
 
 	mutex_unlock(&data->update_lock);
 
-	return count;
-}
-
-static ssize_t show_fault(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct lm95241_data *data = lm95241_update_device(dev);
-
-	return snprintf(buf, PAGE_SIZE - 1, "%d",
-			!!(data->status & to_sensor_dev_attr(attr)->index));
+	return ret;
 }
 
-static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static int lm95241_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
 {
-	struct lm95241_data *data = lm95241_update_device(dev);
-
-	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", data->interval);
+	switch (type) {
+	case hwmon_chip:
+		return lm95241_write_chip(dev, attr, channel, val);
+	case hwmon_temp:
+		return lm95241_write_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_interval(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static umode_t lm95241_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
 {
-	struct lm95241_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int convrate;
-	u8 config;
-
-	if (kstrtoul(buf, 10, &val) < 0)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-
-	config = data->config & ~CFG_CRMASK;
-
-	if (val < 130) {
-		convrate = 76;
-		config |= CFG_CR0076;
-	} else if (val < 590) {
-		convrate = 182;
-		config |= CFG_CR0182;
-	} else if (val < 1850) {
-		convrate = 1000;
-		config |= CFG_CR1000;
-	} else {
-		convrate = 2700;
-		config |= CFG_CR2700;
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return S_IRUGO | S_IWUSR;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return S_IRUGO;
+		case hwmon_temp_fault:
+			return S_IRUGO;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+		case hwmon_temp_type:
+			return S_IRUGO | S_IWUSR;
+		}
+		break;
+	default:
+		break;
 	}
-
-	data->interval = convrate;
-	data->config = config;
-	i2c_smbus_write_byte_data(data->client, LM95241_REG_RW_CONFIG,
-				  config);
-	mutex_unlock(&data->update_lock);
-
-	return count;
+	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_input, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_type, S_IWUSR | S_IRUGO, show_type, set_type,
-			  R1MS_MASK);
-static SENSOR_DEVICE_ATTR(temp3_type, S_IWUSR | S_IRUGO, show_type, set_type,
-			  R2MS_MASK);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_min, set_min,
-			  R1DF_MASK);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IWUSR | S_IRUGO, show_min, set_min,
-			  R2DF_MASK);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_max, set_max,
-			  R1DF_MASK);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_max, set_max,
-			  R2DF_MASK);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_fault, NULL, R1DM);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_fault, NULL, R2DM);
-static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_interval,
-		   set_interval);
-
-static struct attribute *lm95241_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_type.dev_attr.attr,
-	&sensor_dev_attr_temp3_type.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp3_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&dev_attr_update_interval.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(lm95241);
-
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int lm95241_detect(struct i2c_client *new_client,
 			  struct i2c_board_info *info)
@@ -408,6 +418,47 @@ static void lm95241_init_client(struct i2c_client *client,
 				  data->model);
 }
 
+static const u32 lm95241_chip_config[] = {
+	HWMON_C_UPDATE_INTERVAL,
+	0
+};
+
+static const struct hwmon_channel_info lm95241_chip = {
+	.type = hwmon_chip,
+	.config = lm95241_chip_config,
+};
+
+static const u32 lm95241_temp_config[] = {
+	HWMON_T_INPUT,
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_TYPE |
+		HWMON_T_FAULT,
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_TYPE |
+		HWMON_T_FAULT,
+	0
+};
+
+static const struct hwmon_channel_info lm95241_temp = {
+	.type = hwmon_temp,
+	.config = lm95241_temp_config,
+};
+
+static const struct hwmon_channel_info *lm95241_info[] = {
+	&lm95241_chip,
+	&lm95241_temp,
+	NULL
+};
+
+static const struct hwmon_ops lm95241_hwmon_ops = {
+	.is_visible = lm95241_is_visible,
+	.read = lm95241_read,
+	.write = lm95241_write,
+};
+
+static const struct hwmon_chip_info lm95241_chip_info = {
+	.ops = &lm95241_hwmon_ops,
+	.info = lm95241_info,
+};
+
 static int lm95241_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -425,9 +476,10 @@ static int lm95241_probe(struct i2c_client *client,
 	/* Initialize the LM95241 chip */
 	lm95241_init_client(client, data);
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data,
-							   lm95241_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &lm95241_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.5.0
