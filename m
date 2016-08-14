Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46210 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752452AbcHNQEh (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 14 Aug 2016 12:04:37 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 8/9] hwmon: (jc42) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:50 -0700
Message-Id: <1471153911-6536-8-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 293 ++++++++++++++++++++++++++-------------------------
 1 file changed, 149 insertions(+), 144 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 9d5f85f3384f..1bf22eff0b08 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -28,7 +28,6 @@
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -254,170 +253,148 @@ abort:
 	return ret;
 }
 
-/* sysfs functions */
-
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct jc42_data *data = jc42_update_device(dev);
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-	return sprintf(buf, "%d\n",
-		       jc42_temp_from_reg(data->temp[attr->index]));
-}
-
-static ssize_t show_temp_hyst(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
+static int jc42_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct jc42_data *data = jc42_update_device(dev);
 	int temp, hyst;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	temp = jc42_temp_from_reg(data->temp[attr->index]);
-	hyst = jc42_hysteresis[(data->config & JC42_CFG_HYST_MASK)
-			       >> JC42_CFG_HYST_SHIFT];
-	return sprintf(buf, "%d\n", temp - hyst);
+	switch (attr) {
+	case hwmon_temp_input:
+		*val = jc42_temp_from_reg(data->temp[t_input]);
+		return 0;
+	case hwmon_temp_min:
+		*val = jc42_temp_from_reg(data->temp[t_min]);
+		return 0;
+	case hwmon_temp_max:
+		*val = jc42_temp_from_reg(data->temp[t_max]);
+		return 0;
+	case hwmon_temp_crit:
+		*val = jc42_temp_from_reg(data->temp[t_crit]);
+		return 0;
+	case hwmon_temp_max_hyst:
+		temp = jc42_temp_from_reg(data->temp[t_max]);
+		hyst = jc42_hysteresis[(data->config & JC42_CFG_HYST_MASK)
+						>> JC42_CFG_HYST_SHIFT];
+		*val = temp - hyst;
+		return 0;
+	case hwmon_temp_crit_hyst:
+		temp = jc42_temp_from_reg(data->temp[t_crit]);
+		hyst = jc42_hysteresis[(data->config & JC42_CFG_HYST_MASK)
+						>> JC42_CFG_HYST_SHIFT];
+		*val = temp - hyst;
+		return 0;
+	case hwmon_temp_min_alarm:
+		*val = (data->temp[t_input] >> JC42_ALARM_MIN_BIT) & 1;
+		return 0;
+	case hwmon_temp_max_alarm:
+		*val = (data->temp[t_input] >> JC42_ALARM_MAX_BIT) & 1;
+		return 0;
+	case hwmon_temp_crit_alarm:
+		*val = (data->temp[t_input] >> JC42_ALARM_CRIT_BIT) & 1;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static int jc42_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct jc42_data *data = dev_get_drvdata(dev);
-	int err, ret = count;
-	int nr = attr->index;
-	long val;
+	struct i2c_client *client = data->client;
+	int diff, hyst;
+	int ret;
 
-	if (kstrtol(buf, 10, &val) < 0)
-		return -EINVAL;
 	mutex_lock(&data->update_lock);
-	data->temp[nr] = jc42_temp_to_reg(val, data->extended);
-	err = i2c_smbus_write_word_swapped(data->client, temp_regs[nr],
-					   data->temp[nr]);
-	if (err < 0)
-		ret = err;
-	mutex_unlock(&data->update_lock);
-	return ret;
-}
 
-/*
- * JC42.4 compliant chips only support four hysteresis values.
- * Pick best choice and go from there.
- */
-static ssize_t set_temp_crit_hyst(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buf, size_t count)
-{
-	struct jc42_data *data = dev_get_drvdata(dev);
-	long val;
-	int diff, hyst;
-	int err;
-	int ret = count;
-
-	if (kstrtol(buf, 10, &val) < 0)
-		return -EINVAL;
-
-	val = clamp_val(val, (data->extended ? JC42_TEMP_MIN_EXTENDED :
-			      JC42_TEMP_MIN) - 6000, JC42_TEMP_MAX);
-	diff = jc42_temp_from_reg(data->temp[t_crit]) - val;
-
-	hyst = 0;
-	if (diff > 0) {
-		if (diff < 2250)
-			hyst = 1;	/* 1.5 degrees C */
-		else if (diff < 4500)
-			hyst = 2;	/* 3.0 degrees C */
-		else
-			hyst = 3;	/* 6.0 degrees C */
+	switch (attr) {
+	case hwmon_temp_min:
+		data->temp[t_min] = jc42_temp_to_reg(val, data->extended);
+		ret = i2c_smbus_write_word_swapped(client, temp_regs[t_min],
+						   data->temp[t_min]);
+		break;
+	case hwmon_temp_max:
+		data->temp[t_max] = jc42_temp_to_reg(val, data->extended);
+		ret = i2c_smbus_write_word_swapped(client, temp_regs[t_max],
+						   data->temp[t_max]);
+		break;
+	case hwmon_temp_crit:
+		data->temp[t_crit] = jc42_temp_to_reg(val, data->extended);
+		ret = i2c_smbus_write_word_swapped(client, temp_regs[t_crit],
+						   data->temp[t_crit]);
+		break;
+	case hwmon_temp_crit_hyst:
+		/*
+		 * JC42.4 compliant chips only support four hysteresis values.
+		 * Pick best choice and go from there.
+		 */
+		val = clamp_val(val, (data->extended ? JC42_TEMP_MIN_EXTENDED
+						     : JC42_TEMP_MIN) - 6000,
+				JC42_TEMP_MAX);
+		diff = jc42_temp_from_reg(data->temp[t_crit]) - val;
+		hyst = 0;
+		if (diff > 0) {
+			if (diff < 2250)
+				hyst = 1;	/* 1.5 degrees C */
+			else if (diff < 4500)
+				hyst = 2;	/* 3.0 degrees C */
+			else
+				hyst = 3;	/* 6.0 degrees C */
+		}
+		data->config = (data->config & ~JC42_CFG_HYST_MASK) |
+				(hyst << JC42_CFG_HYST_SHIFT);
+		ret = i2c_smbus_write_word_swapped(data->client,
+						   JC42_REG_CONFIG,
+						   data->config);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
 	}
 
-	mutex_lock(&data->update_lock);
-	data->config = (data->config & ~JC42_CFG_HYST_MASK)
-	  | (hyst << JC42_CFG_HYST_SHIFT);
-	err = i2c_smbus_write_word_swapped(data->client, JC42_REG_CONFIG,
-					   data->config);
-	if (err < 0)
-		ret = err;
 	mutex_unlock(&data->update_lock);
-	return ret;
-}
 
-static ssize_t show_alarm(struct device *dev,
-			  struct device_attribute *attr, char *buf)
-{
-	u16 bit = to_sensor_dev_attr(attr)->index;
-	struct jc42_data *data = jc42_update_device(dev);
-	u16 val;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	val = data->temp[t_input];
-	if (bit != JC42_ALARM_CRIT_BIT && (data->config & JC42_CFG_CRIT_ONLY))
-		val = 0;
-	return sprintf(buf, "%u\n", (val >> bit) & 1);
+	return ret;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, t_input);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp, set_temp, t_crit);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO, show_temp, set_temp, t_min);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, show_temp, set_temp, t_max);
-
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO, show_temp_hyst,
-			  set_temp_crit_hyst, t_crit);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO, show_temp_hyst, NULL, t_max);
-
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL,
-			  JC42_ALARM_CRIT_BIT);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL,
-			  JC42_ALARM_MIN_BIT);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL,
-			  JC42_ALARM_MAX_BIT);
-
-static struct attribute *jc42_attributes[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	NULL
-};
-
-static umode_t jc42_attribute_mode(struct kobject *kobj,
-				  struct attribute *attr, int index)
+static umode_t jc42_is_visible(const void *_data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct jc42_data *data = dev_get_drvdata(dev);
+	const struct jc42_data *data = _data;
 	unsigned int config = data->config;
-	bool readonly;
-
-	if (attr == &sensor_dev_attr_temp1_crit.dev_attr.attr)
-		readonly = config & JC42_CFG_TCRIT_LOCK;
-	else if (attr == &sensor_dev_attr_temp1_min.dev_attr.attr ||
-		 attr == &sensor_dev_attr_temp1_max.dev_attr.attr)
-		readonly = config & JC42_CFG_EVENT_LOCK;
-	else if (attr == &sensor_dev_attr_temp1_crit_hyst.dev_attr.attr)
-		readonly = config & (JC42_CFG_EVENT_LOCK | JC42_CFG_TCRIT_LOCK);
-	else
-		readonly = true;
-
-	return S_IRUGO | (readonly ? 0 : S_IWUSR);
+	umode_t mode = S_IRUGO;
+
+	switch (attr) {
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+		if (!(config & JC42_CFG_EVENT_LOCK))
+			mode |= S_IWUSR;
+		break;
+	case hwmon_temp_crit:
+		if (!(config & JC42_CFG_TCRIT_LOCK))
+			mode |= S_IWUSR;
+		break;
+	case hwmon_temp_crit_hyst:
+		if (!(config & (JC42_CFG_EVENT_LOCK | JC42_CFG_TCRIT_LOCK)))
+			mode |= S_IWUSR;
+		break;
+	case hwmon_temp_input:
+	case hwmon_temp_max_hyst:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+		break;
+	default:
+		mode = 0;
+		break;
+	}
+	return mode;
 }
 
-static const struct attribute_group jc42_group = {
-	.attrs = jc42_attributes,
-	.is_visible = jc42_attribute_mode,
-};
-__ATTRIBUTE_GROUPS(jc42);
-
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
 {
@@ -450,6 +427,34 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
 	return -ENODEV;
 }
 
+static const u32 jc42_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT |
+	HWMON_T_MAX_HYST | HWMON_T_CRIT_HYST |
+	HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
+	0
+};
+
+static const struct hwmon_channel_info jc42_temp = {
+	.type = hwmon_temp,
+	.config = jc42_temp_config,
+};
+
+static const struct hwmon_channel_info *jc42_info[] = {
+	&jc42_temp,
+	NULL
+};
+
+static const struct hwmon_ops jc42_hwmon_ops = {
+	.is_visible = jc42_is_visible,
+	.read = jc42_read,
+	.write = jc42_write,
+};
+
+static const struct hwmon_chip_info jc42_chip_info = {
+	.ops = &jc42_hwmon_ops,
+	.info = jc42_info,
+};
+
 static int jc42_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
@@ -482,9 +487,9 @@ static int jc42_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 	data->config = config;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data,
-							   jc42_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &jc42_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.5.0

