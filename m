Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40125 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:04 -0500
Received: by mail-pg1-f194.google.com with SMTP id z10so5615807pgp.7
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:03 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/30] hwmon: (adm1021) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:26 -0800
Message-Id: <1544479728-30077-9-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adm1021.c | 48 ++++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
index eacf10fadbc6..49461b60e296 100644
--- a/drivers/hwmon/adm1021.c
+++ b/drivers/hwmon/adm1021.c
@@ -156,8 +156,8 @@ static struct adm1021_data *adm1021_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct adm1021_data *data = adm1021_update_device(dev);
@@ -165,7 +165,7 @@ static ssize_t show_temp(struct device *dev,
 	return sprintf(buf, "%d\n", data->temp[index]);
 }
 
-static ssize_t show_temp_max(struct device *dev,
+static ssize_t temp_max_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
@@ -174,7 +174,7 @@ static ssize_t show_temp_max(struct device *dev,
 	return sprintf(buf, "%d\n", data->temp_max[index]);
 }
 
-static ssize_t show_temp_min(struct device *dev,
+static ssize_t temp_min_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
@@ -183,7 +183,7 @@ static ssize_t show_temp_min(struct device *dev,
 	return sprintf(buf, "%d\n", data->temp_min[index]);
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
@@ -199,9 +199,9 @@ static ssize_t alarms_show(struct device *dev,
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static ssize_t set_temp_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct adm1021_data *data = dev_get_drvdata(dev);
@@ -225,9 +225,9 @@ static ssize_t set_temp_max(struct device *dev,
 	return count;
 }
 
-static ssize_t set_temp_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	struct adm1021_data *data = dev_get_drvdata(dev);
@@ -287,21 +287,17 @@ static ssize_t low_power_store(struct device *dev,
 }
 
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp_max,
-			  set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp_min,
-			  set_temp_min, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_temp_max,
-			  set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_temp_min,
-			  set_temp_min, 1);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 2);
 
 static DEVICE_ATTR_RO(alarms);
 static DEVICE_ATTR_RW(low_power);
-- 
2.7.4
