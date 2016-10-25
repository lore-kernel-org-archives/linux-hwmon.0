Return-path: <jgunthorpe@obsidianresearch.com>
Date: Tue, 25 Oct 2016 17:26:21 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] lm87: Use hwmon to create the sysfs groups
Message-ID: <20161025232621.GB20339@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

This is the expected thing for a hwmon driver to do, this changes
the sysfs paths from, say:

  /sys/bus/i2c/devices/0-002c/temp1_input

to:

  /sys/bus/i2c/devices/0-002c/hwmon/hwmon0/temp1_input

Which is consistent with accepted changes to other hwmon drivers
(eg lm75)

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
 drivers/hwmon/lm87.c | 108 +++++++++++++++++++--------------------------------
 1 file changed, 39 insertions(+), 69 deletions(-)

Tested on a PPC platform

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 47598989cd3c..70896c078d20 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -154,7 +154,6 @@ static u8 LM87_REG_TEMP_LOW[3] = { 0x3A, 0x38, 0x2C };
  */
 
 struct lm87_data {
-	struct device *hwmon_dev;
 	struct mutex update_lock;
 	char valid; /* zero until following fields are valid */
 	unsigned long last_updated; /* In jiffies */
@@ -181,6 +180,8 @@ struct lm87_data {
 	u16 alarms;		/* register values, combined */
 	u8 vid;			/* register values, combined */
 	u8 vrm;
+
+	const struct attribute_group *attr_groups[5];
 };
 
 static inline int lm87_read_value(struct i2c_client *client, u8 reg)
@@ -195,7 +196,7 @@ static inline int lm87_write_value(struct i2c_client *client, u8 reg, u8 value)
 
 static struct lm87_data *lm87_update_device(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 
 	mutex_lock(&data->update_lock);
@@ -309,7 +310,7 @@ static ssize_t show_in_max(struct device *dev,
 static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
 	long val;
@@ -330,7 +331,7 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 static ssize_t set_in_max(struct device *dev,  struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
 	long val;
@@ -396,7 +397,7 @@ static ssize_t show_temp_high(struct device *dev,
 static ssize_t set_temp_low(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
 	long val;
@@ -416,7 +417,7 @@ static ssize_t set_temp_low(struct device *dev, struct device_attribute *attr,
 static ssize_t set_temp_high(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
 	long val;
@@ -495,7 +496,7 @@ static ssize_t show_fan_div(struct device *dev,
 static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
 	long val;
@@ -522,7 +523,7 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
 	long val;
@@ -635,7 +636,7 @@ static ssize_t show_aout(struct device *dev, struct device_attribute *attr,
 static ssize_t set_aout(struct device *dev, struct device_attribute *attr,
 			const char *buf, size_t count)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	long val;
 	int err;
@@ -841,20 +842,6 @@ static int lm87_detect(struct i2c_client *client, struct i2c_board_info *info)
 	return 0;
 }
 
-static void lm87_remove_files(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-
-	sysfs_remove_group(&dev->kobj, &lm87_group);
-	sysfs_remove_group(&dev->kobj, &lm87_group_in6);
-	sysfs_remove_group(&dev->kobj, &lm87_group_fan1);
-	sysfs_remove_group(&dev->kobj, &lm87_group_in7);
-	sysfs_remove_group(&dev->kobj, &lm87_group_fan2);
-	sysfs_remove_group(&dev->kobj, &lm87_group_temp3);
-	sysfs_remove_group(&dev->kobj, &lm87_group_in0_5);
-	sysfs_remove_group(&dev->kobj, &lm87_group_vid);
-}
-
 static void lm87_init_client(struct i2c_client *client)
 {
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -909,7 +896,9 @@ static void lm87_init_client(struct i2c_client *client)
 static int lm87_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct lm87_data *data;
+	struct device *hwmon_dev;
 	int err;
+	unsigned int group_tail = 0;
 
 	data = devm_kzalloc(&client->dev, sizeof(struct lm87_data), GFP_KERNEL);
 	if (!data)
@@ -930,58 +919,42 @@ static int lm87_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data->in_scale[6] = 1875;
 	data->in_scale[7] = 1875;
 
-	/* Register sysfs hooks */
-	err = sysfs_create_group(&client->dev.kobj, &lm87_group);
-	if (err)
-		goto exit_stop;
-
-	if (data->channel & CHAN_NO_FAN(0)) {
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_in6);
-		if (err)
-			goto exit_remove;
-	} else {
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_fan1);
-		if (err)
-			goto exit_remove;
-	}
-
-	if (data->channel & CHAN_NO_FAN(1)) {
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_in7);
-		if (err)
-			goto exit_remove;
-	} else {
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_fan2);
-		if (err)
-			goto exit_remove;
-	}
-
-	if (data->channel & CHAN_TEMP3) {
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_temp3);
-		if (err)
-			goto exit_remove;
-	} else {
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_in0_5);
-		if (err)
-			goto exit_remove;
-	}
+	/*
+	 * Construct the list of attributes, the list depends on the
+	 * configuration of the chip
+	 */
+	data->attr_groups[group_tail++] = &lm87_group;
+	if (data->channel & CHAN_NO_FAN(0))
+		data->attr_groups[group_tail++] = &lm87_group_in6;
+	else
+		data->attr_groups[group_tail++] = &lm87_group_fan1;
+
+	if (data->channel & CHAN_NO_FAN(1))
+		data->attr_groups[group_tail++] = &lm87_group_in7;
+	else
+		data->attr_groups[group_tail++] = &lm87_group_fan2;
+
+	if (data->channel & CHAN_TEMP3)
+		data->attr_groups[group_tail++] = &lm87_group_temp3;
+	else
+		data->attr_groups[group_tail++] = &lm87_group_in0_5;
 
 	if (!(data->channel & CHAN_NO_VID)) {
 		data->vrm = vid_which_vrm();
-		err = sysfs_create_group(&client->dev.kobj, &lm87_group_vid);
-		if (err)
-			goto exit_remove;
+		data->attr_groups[group_tail++] = &lm87_group_vid;
 	}
 
-	data->hwmon_dev = hwmon_device_register(&client->dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		err = PTR_ERR(data->hwmon_dev);
-		goto exit_remove;
+	WARN_ON(group_tail > ARRAY_SIZE(data->attr_groups));
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(
+	    &client->dev, client->name, client, data->attr_groups);
+	if (IS_ERR(hwmon_dev)) {
+		err = PTR_ERR(hwmon_dev);
+		goto exit_stop;
 	}
 
 	return 0;
 
-exit_remove:
-	lm87_remove_files(client);
 exit_stop:
 	lm87_write_value(client, LM87_REG_CONFIG, data->config);
 	return err;
@@ -991,9 +964,6 @@ static int lm87_remove(struct i2c_client *client)
 {
 	struct lm87_data *data = i2c_get_clientdata(client);
 
-	hwmon_device_unregister(data->hwmon_dev);
-	lm87_remove_files(client);
-
 	lm87_write_value(client, LM87_REG_CONFIG, data->config);
 	return 0;
 }
-- 
2.1.4
