Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36011 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbeLJWJO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:14 -0500
Received: by mail-pg1-f196.google.com with SMTP id n2so5619035pgm.3
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:14 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/30] hwmon: (adt7x10) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:33 -0800
Message-Id: <1544479728-30077-16-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adt7x10.c | 59 +++++++++++++++++++++----------------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 0f538f8be6bf..2ab5c2519ff0 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -230,9 +230,8 @@ static int ADT7X10_REG_TO_TEMP(struct adt7x10_data *data, s16 reg)
 
 /* sysfs attributes for hwmon */
 
-static ssize_t adt7x10_show_temp(struct device *dev,
-				 struct device_attribute *da,
-				 char *buf)
+static ssize_t adt7x10_temp_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct adt7x10_data *data = dev_get_drvdata(dev);
@@ -250,9 +249,9 @@ static ssize_t adt7x10_show_temp(struct device *dev,
 		       data->temp[attr->index]));
 }
 
-static ssize_t adt7x10_set_temp(struct device *dev,
-				struct device_attribute *da,
-				const char *buf, size_t count)
+static ssize_t adt7x10_temp_store(struct device *dev,
+				  struct device_attribute *da,
+				  const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct adt7x10_data *data = dev_get_drvdata(dev);
@@ -273,9 +272,8 @@ static ssize_t adt7x10_set_temp(struct device *dev,
 	return count;
 }
 
-static ssize_t adt7x10_show_t_hyst(struct device *dev,
-				   struct device_attribute *da,
-				   char *buf)
+static ssize_t adt7x10_t_hyst_show(struct device *dev,
+				   struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct adt7x10_data *data = dev_get_drvdata(dev);
@@ -294,9 +292,9 @@ static ssize_t adt7x10_show_t_hyst(struct device *dev,
 		       ADT7X10_REG_TO_TEMP(data, data->temp[nr]) - hyst);
 }
 
-static ssize_t adt7x10_set_t_hyst(struct device *dev,
-				  struct device_attribute *da,
-				  const char *buf, size_t count)
+static ssize_t adt7x10_t_hyst_store(struct device *dev,
+				    struct device_attribute *da,
+				    const char *buf, size_t count)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 	int limit, ret;
@@ -317,9 +315,8 @@ static ssize_t adt7x10_set_t_hyst(struct device *dev,
 	return count;
 }
 
-static ssize_t adt7x10_show_alarm(struct device *dev,
-				  struct device_attribute *da,
-				  char *buf)
+static ssize_t adt7x10_alarm_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int ret;
@@ -339,25 +336,19 @@ static ssize_t name_show(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%s\n", data->name);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, adt7x10_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			  adt7x10_show_temp, adt7x10_set_temp, 1);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
-			  adt7x10_show_temp, adt7x10_set_temp, 2);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO,
-			  adt7x10_show_temp, adt7x10_set_temp, 3);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-			  adt7x10_show_t_hyst, adt7x10_set_t_hyst, 1);
-static SENSOR_DEVICE_ATTR(temp1_min_hyst, S_IRUGO,
-			  adt7x10_show_t_hyst, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO,
-			  adt7x10_show_t_hyst, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, adt7x10_show_alarm,
-			  NULL, ADT7X10_STAT_T_LOW);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adt7x10_show_alarm,
-			  NULL, ADT7X10_STAT_T_HIGH);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, adt7x10_show_alarm,
-			  NULL, ADT7X10_STAT_T_CRIT);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, adt7x10_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, adt7x10_temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, adt7x10_temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, adt7x10_temp, 3);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, adt7x10_t_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_hyst, adt7x10_t_hyst, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_hyst, adt7x10_t_hyst, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, adt7x10_alarm,
+			     ADT7X10_STAT_T_LOW);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, adt7x10_alarm,
+			     ADT7X10_STAT_T_HIGH);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, adt7x10_alarm,
+			     ADT7X10_STAT_T_CRIT);
 static DEVICE_ATTR_RO(name);
 
 static struct attribute *adt7x10_attributes[] = {
-- 
2.7.4
