Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43174 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWI6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:08:58 -0500
Received: by mail-pl1-f193.google.com with SMTP id gn14so5883838plb.10
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:08:58 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/30] hwmon: (ad7414) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:22 -0800
Message-Id: <1544479728-30077-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ad7414.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ad7414.c b/drivers/hwmon/ad7414.c
index cec227f13874..f13806d731fa 100644
--- a/drivers/hwmon/ad7414.c
+++ b/drivers/hwmon/ad7414.c
@@ -107,25 +107,25 @@ static struct ad7414_data *ad7414_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp_input(struct device *dev,
+static ssize_t temp_input_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct ad7414_data *data = ad7414_update_device(dev);
 	return sprintf(buf, "%d\n", ad7414_temp_from_reg(data->temp_input));
 }
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_input, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
 
-static ssize_t show_max_min(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t max_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct ad7414_data *data = ad7414_update_device(dev);
 	return sprintf(buf, "%d\n", data->temps[index] * 1000);
 }
 
-static ssize_t set_max_min(struct device *dev,
-			   struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t max_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct ad7414_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -147,12 +147,10 @@ static ssize_t set_max_min(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			  show_max_min, set_max_min, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
-			  show_max_min, set_max_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, max_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, max_min, 1);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -161,8 +159,8 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 4);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 4);
 
 static struct attribute *ad7414_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4
