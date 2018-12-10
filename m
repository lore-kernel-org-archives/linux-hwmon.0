Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46816 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729387AbeLJWJ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:26 -0500
Received: by mail-pl1-f193.google.com with SMTP id t13so5876905ply.13
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:26 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 24/30] hwmon: (ds1621) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:42 -0800
Message-Id: <1544479728-30077-25-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ds1621.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index 5c317fc32a4a..6fcdac068a27 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -234,7 +234,7 @@ static struct ds1621_data *ds1621_update_client(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *da,
+static ssize_t temp_show(struct device *dev, struct device_attribute *da,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -243,8 +243,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *da,
 		       DS1621_TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *da,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev, struct device_attribute *da,
+			  const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ds1621_data *data = dev_get_drvdata(dev);
@@ -270,7 +270,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", ALARMS_FROM_REG(data->conf));
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *da,
 			  char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -319,13 +319,11 @@ static ssize_t update_interval_store(struct device *dev,
 static DEVICE_ATTR_RO(alarms);
 static DEVICE_ATTR_RW(update_interval);
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp, set_temp, 1);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp, set_temp, 2);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL,
-		DS1621_ALARM_TEMP_LOW);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL,
-		DS1621_ALARM_TEMP_HIGH);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, DS1621_ALARM_TEMP_LOW);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, DS1621_ALARM_TEMP_HIGH);
 
 static struct attribute *ds1621_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4
