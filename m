Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34512 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955AbcHNKDh (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 14 Aug 2016 06:03:37 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/9] hwmon: (tmp421) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:46 -0700
Message-Id: <1471153911-6536-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp421.c | 134 +++++++++++++++++++++----------------------------
 1 file changed, 58 insertions(+), 76 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 85d48d80822a..6f4a38eef255 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -72,6 +72,10 @@ MODULE_DEVICE_TABLE(i2c, tmp421_id);
 struct tmp421_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
+	u32 temp_config[5];
+	struct hwmon_channel_info temp_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
 	char valid;
 	unsigned long last_updated;
 	int channels;
@@ -125,85 +129,45 @@ static struct tmp421_data *tmp421_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp_value(struct device *dev,
-			       struct device_attribute *devattr, char *buf)
+static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct tmp421_data *data = tmp421_update_device(dev);
-	int temp;
-
-	mutex_lock(&data->update_lock);
-	if (data->config & TMP421_CONFIG_RANGE)
-		temp = temp_from_u16(data->temp[index]);
-	else
-		temp = temp_from_s16(data->temp[index]);
-	mutex_unlock(&data->update_lock);
-
-	return sprintf(buf, "%d\n", temp);
-}
-
-static ssize_t show_fault(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
-{
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct tmp421_data *data = tmp421_update_device(dev);
-
-	/*
-	 * The OPEN bit signals a fault. This is bit 0 of the temperature
-	 * register (low byte).
-	 */
-	if (data->temp[index] & 0x01)
-		return sprintf(buf, "1\n");
-	else
-		return sprintf(buf, "0\n");
+	struct tmp421_data *tmp421 = tmp421_update_device(dev);
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (tmp421->config & TMP421_CONFIG_RANGE)
+			*val = temp_from_u16(tmp421->temp[channel]);
+		else
+			*val = temp_from_s16(tmp421->temp[channel]);
+		return 0;
+	case hwmon_temp_fault:
+		/*
+		 * The OPEN bit signals a fault. This is bit 0 of the
+		 * temperature register (low byte).
+		 */
+		*val = tmp421->temp[channel] & 0x01;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static umode_t tmp421_is_visible(struct kobject *kobj, struct attribute *a,
-				int n)
+static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct tmp421_data *data = dev_get_drvdata(dev);
-	struct device_attribute *devattr;
-	unsigned int index;
-
-	devattr = container_of(a, struct device_attribute, attr);
-	index = to_sensor_dev_attr(devattr)->index;
-
-	if (index < data->channels)
-		return a->mode;
-
-	return 0;
+	switch (attr) {
+	case hwmon_temp_fault:
+		if (channel == 0)
+			return 0;
+		return S_IRUGO;
+	case hwmon_temp_input:
+		return S_IRUGO;
+	default:
+		return 0;
+	}
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_value, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp_value, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp_value, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp_value, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_fault, S_IRUGO, show_fault, NULL, 3);
-
-static struct attribute *tmp421_attr[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_fault.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group tmp421_group = {
-	.attrs = tmp421_attr,
-	.is_visible = tmp421_is_visible,
-};
-
-static const struct attribute_group *tmp421_groups[] = {
-	&tmp421_group,
-	NULL
-};
-
 static int tmp421_init_client(struct i2c_client *client)
 {
 	int config, config_orig;
@@ -289,13 +253,18 @@ static int tmp421_detect(struct i2c_client *client,
 	return 0;
 }
 
+static const struct hwmon_ops tmp421_ops = {
+	.is_visible = tmp421_is_visible,
+	.read = tmp421_read,
+};
+
 static int tmp421_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct tmp421_data *data;
-	int err;
+	int i, err;
 
 	data = devm_kzalloc(dev, sizeof(struct tmp421_data), GFP_KERNEL);
 	if (!data)
@@ -309,8 +278,21 @@ static int tmp421_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, tmp421_groups);
+	for (i = 0; i < data->channels; i++)
+		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
+
+	data->chip.ops = &tmp421_ops;
+	data->chip.info = data->info;
+
+	data->info[0] = &data->temp_info;
+
+	data->temp_info.type = hwmon_temp;
+	data->temp_info.config = data->temp_config;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &data->chip,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.5.0

