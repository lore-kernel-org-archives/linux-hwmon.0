Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41766 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbeIPUKh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Sep 2018 16:10:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id s15-v6so6464208pgv.8
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Sep 2018 07:47:25 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (lm92) Fix whitespace issues
Date: Sun, 16 Sep 2018 07:47:22 -0700
Message-Id: <1537109242-21449-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Sparse complains:

drivers/hwmon/lm92.c:209 set_temp_hyst() warn: inconsistent indenting

While at it, fix various other whitespace issues reported by checkpatch
(double empty lines, missing empty lines, whitespace at empty line).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm92.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index d40fe5122e94..e7333f8e185c 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -127,8 +127,8 @@ static struct lm92_data *lm92_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ)
-	 || !data->valid) {
+	if (time_after(jiffies, data->last_updated + HZ) ||
+	    !data->valid) {
 		dev_dbg(&client->dev, "Updating lm92 data\n");
 		for (i = 0; i < t_num_regs; i++) {
 			data->temp[i] =
@@ -153,7 +153,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 }
 
 static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			   const char *buf, size_t count)
+			const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm92_data *data = dev_get_drvdata(dev);
@@ -161,7 +161,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
 	int nr = attr->index;
 	long val;
 	int err;
-	
+
 	err = kstrtol(buf, 10, &val);
 	if (err)
 		return err;
@@ -178,6 +178,7 @@ static ssize_t show_temp_hyst(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm92_data *data = lm92_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index])
 		       - TEMP_FROM_REG(data->temp[t_hyst]));
 }
@@ -186,6 +187,7 @@ static ssize_t temp1_min_hyst_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	struct lm92_data *data = lm92_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[t_min])
 		       + TEMP_FROM_REG(data->temp[t_hyst]));
 }
@@ -206,7 +208,7 @@ static ssize_t set_temp_hyst(struct device *dev,
 
 	val = clamp_val(val, -120000, 220000);
 	mutex_lock(&data->update_lock);
-	 data->temp[t_hyst] =
+	data->temp[t_hyst] =
 		TEMP_TO_REG(TEMP_FROM_REG(data->temp[attr->index]) - val);
 	i2c_smbus_write_word_swapped(client, LM92_REG_TEMP_HYST,
 				     data->temp[t_hyst]);
@@ -218,6 +220,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct lm92_data *data = lm92_update_device(dev);
+
 	return sprintf(buf, "%d\n", ALARMS_FROM_REG(data->temp[t_input]));
 }
 
@@ -324,7 +327,6 @@ static int lm92_probe(struct i2c_client *new_client,
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-
 /*
  * Module and driver stuff
  */
-- 
2.7.4
