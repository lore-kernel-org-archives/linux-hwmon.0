Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39027 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbeLJWIy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:08:54 -0500
Received: by mail-pl1-f194.google.com with SMTP id 101so5892881pld.6
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:08:54 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/30] hwmon: (abx500) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:19 -0800
Message-Id: <1544479728-30077-2-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/abx500.c | 96 ++++++++++++++++++++++++--------------------------
 1 file changed, 46 insertions(+), 50 deletions(-)

diff --git a/drivers/hwmon/abx500.c b/drivers/hwmon/abx500.c
index d87cae8c635f..d4ad91d9f200 100644
--- a/drivers/hwmon/abx500.c
+++ b/drivers/hwmon/abx500.c
@@ -121,7 +121,7 @@ static void gpadc_monitor(struct work_struct *work)
 }
 
 /* HWMON sysfs interfaces */
-static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -129,7 +129,7 @@ static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
 	return data->ops.show_name(dev, devattr, buf);
 }
 
-static ssize_t show_label(struct device *dev,
+static ssize_t label_show(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -137,7 +137,7 @@ static ssize_t show_label(struct device *dev,
 	return data->ops.show_label(dev, devattr, buf);
 }
 
-static ssize_t show_input(struct device *dev,
+static ssize_t input_show(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	int ret, temp;
@@ -153,8 +153,8 @@ static ssize_t show_input(struct device *dev,
 }
 
 /* Set functions (RW nodes) */
-static ssize_t set_min(struct device *dev, struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t min_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	unsigned long val;
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -173,8 +173,8 @@ static ssize_t set_min(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t max_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	unsigned long val;
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -193,9 +193,9 @@ static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t set_max_hyst(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static ssize_t max_hyst_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	unsigned long val;
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -215,8 +215,8 @@ static ssize_t set_max_hyst(struct device *dev,
 }
 
 /* Show functions (RO nodes) */
-static ssize_t show_min(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t min_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -224,8 +224,8 @@ static ssize_t show_min(struct device *dev,
 	return sprintf(buf, "%lu\n", data->min[attr->index]);
 }
 
-static ssize_t show_max(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t max_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -233,7 +233,7 @@ static ssize_t show_max(struct device *dev,
 	return sprintf(buf, "%lu\n", data->max[attr->index]);
 }
 
-static ssize_t show_max_hyst(struct device *dev,
+static ssize_t max_hyst_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -242,7 +242,7 @@ static ssize_t show_max_hyst(struct device *dev,
 	return sprintf(buf, "%lu\n", data->max_hyst[attr->index]);
 }
 
-static ssize_t show_min_alarm(struct device *dev,
+static ssize_t min_alarm_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -251,7 +251,7 @@ static ssize_t show_min_alarm(struct device *dev,
 	return sprintf(buf, "%d\n", data->min_alarm[attr->index]);
 }
 
-static ssize_t show_max_alarm(struct device *dev,
+static ssize_t max_alarm_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct abx500_temp *data = dev_get_drvdata(dev);
@@ -273,47 +273,43 @@ static umode_t abx500_attrs_visible(struct kobject *kobj,
 }
 
 /* Chip name, required by hwmon */
-static SENSOR_DEVICE_ATTR(name, S_IRUGO, show_name, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(name, name, 0);
 
 /* GPADC - SENSOR1 */
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_min, set_min, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_max, set_max, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-			  show_max_hyst, set_max_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_min_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_max_alarm, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_label, label, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, input, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, max_hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, min_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, max_alarm, 0);
 
 /* GPADC - SENSOR2 */
-static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, show_label, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_min, set_min, 1);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_max, set_max, 1);
-static SENSOR_DEVICE_ATTR(temp2_max_hyst, S_IWUSR | S_IRUGO,
-			  show_max_hyst, set_max_hyst, 1);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_min_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_max_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_label, label, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, input, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, max_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, min_alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, max_alarm, 1);
 
 /* GPADC - SENSOR3 */
-static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, show_label, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IWUSR | S_IRUGO, show_min, set_min, 2);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_max, set_max, 2);
-static SENSOR_DEVICE_ATTR(temp3_max_hyst, S_IWUSR | S_IRUGO,
-			  show_max_hyst, set_max_hyst, 2);
-static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO, show_min_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_max_alarm, NULL, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_label, label, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, input, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, max_hyst, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_min_alarm, min_alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, max_alarm, 2);
 
 /* GPADC - SENSOR4 */
-static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, show_label, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_input, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_min, S_IWUSR | S_IRUGO, show_min, set_min, 3);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IWUSR | S_IRUGO, show_max, set_max, 3);
-static SENSOR_DEVICE_ATTR(temp4_max_hyst, S_IWUSR | S_IRUGO,
-			  show_max_hyst, set_max_hyst, 3);
-static SENSOR_DEVICE_ATTR(temp4_min_alarm, S_IRUGO, show_min_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_max_alarm, S_IRUGO, show_max_alarm, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(temp4_label, label, 3);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, input, 3);
+static SENSOR_DEVICE_ATTR_RW(temp4_min, min, 3);
+static SENSOR_DEVICE_ATTR_RW(temp4_max, max, 3);
+static SENSOR_DEVICE_ATTR_RW(temp4_max_hyst, max_hyst, 3);
+static SENSOR_DEVICE_ATTR_RO(temp4_min_alarm, min_alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, max_alarm, 3);
 
 static struct attribute *abx500_temp_attributes[] = {
 	&sensor_dev_attr_name.dev_attr.attr,
-- 
2.7.4
