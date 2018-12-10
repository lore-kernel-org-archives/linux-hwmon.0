Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46225 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbeLJWJC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:02 -0500
Received: by mail-pf1-f194.google.com with SMTP id c73so6039701pfe.13
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:01 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/30] hwmon: (adc128d818) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:24 -0800
Message-Id: <1544479728-30077-7-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adc128d818.c | 135 ++++++++++++++++++---------------------------
 1 file changed, 55 insertions(+), 80 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index bd2ca315c9d8..ca794bf904de 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -153,8 +153,8 @@ static struct adc128_data *adc128_update_device(struct device *dev)
 	return ret;
 }
 
-static ssize_t adc128_show_in(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+static ssize_t adc128_in_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct adc128_data *data = adc128_update_device(dev);
 	int index = to_sensor_dev_attr_2(attr)->index;
@@ -168,8 +168,9 @@ static ssize_t adc128_show_in(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", val);
 }
 
-static ssize_t adc128_set_in(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t adc128_in_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct adc128_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr_2(attr)->index;
@@ -193,7 +194,7 @@ static ssize_t adc128_set_in(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t adc128_show_temp(struct device *dev,
+static ssize_t adc128_temp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct adc128_data *data = adc128_update_device(dev);
@@ -207,9 +208,9 @@ static ssize_t adc128_show_temp(struct device *dev,
 	return sprintf(buf, "%d\n", temp * 500);/* 0.5 degrees C resolution */
 }
 
-static ssize_t adc128_set_temp(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static ssize_t adc128_temp_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct adc128_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
@@ -233,7 +234,7 @@ static ssize_t adc128_set_temp(struct device *dev,
 	return count;
 }
 
-static ssize_t adc128_show_alarm(struct device *dev,
+static ssize_t adc128_alarm_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct adc128_data *data = adc128_update_device(dev);
@@ -272,77 +273,51 @@ static umode_t adc128_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static SENSOR_DEVICE_ATTR_2(in0_input, S_IRUGO,
-			    adc128_show_in, NULL, 0, 0);
-static SENSOR_DEVICE_ATTR_2(in0_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 0, 1);
-static SENSOR_DEVICE_ATTR_2(in0_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 0, 2);
-
-static SENSOR_DEVICE_ATTR_2(in1_input, S_IRUGO,
-			    adc128_show_in, NULL, 1, 0);
-static SENSOR_DEVICE_ATTR_2(in1_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 1, 1);
-static SENSOR_DEVICE_ATTR_2(in1_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 1, 2);
-
-static SENSOR_DEVICE_ATTR_2(in2_input, S_IRUGO,
-			    adc128_show_in, NULL, 2, 0);
-static SENSOR_DEVICE_ATTR_2(in2_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 2, 1);
-static SENSOR_DEVICE_ATTR_2(in2_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 2, 2);
-
-static SENSOR_DEVICE_ATTR_2(in3_input, S_IRUGO,
-			    adc128_show_in, NULL, 3, 0);
-static SENSOR_DEVICE_ATTR_2(in3_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 3, 1);
-static SENSOR_DEVICE_ATTR_2(in3_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 3, 2);
-
-static SENSOR_DEVICE_ATTR_2(in4_input, S_IRUGO,
-			    adc128_show_in, NULL, 4, 0);
-static SENSOR_DEVICE_ATTR_2(in4_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 4, 1);
-static SENSOR_DEVICE_ATTR_2(in4_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 4, 2);
-
-static SENSOR_DEVICE_ATTR_2(in5_input, S_IRUGO,
-			    adc128_show_in, NULL, 5, 0);
-static SENSOR_DEVICE_ATTR_2(in5_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 5, 1);
-static SENSOR_DEVICE_ATTR_2(in5_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 5, 2);
-
-static SENSOR_DEVICE_ATTR_2(in6_input, S_IRUGO,
-			    adc128_show_in, NULL, 6, 0);
-static SENSOR_DEVICE_ATTR_2(in6_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 6, 1);
-static SENSOR_DEVICE_ATTR_2(in6_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 6, 2);
-
-static SENSOR_DEVICE_ATTR_2(in7_input, S_IRUGO,
-			    adc128_show_in, NULL, 7, 0);
-static SENSOR_DEVICE_ATTR_2(in7_min, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 7, 1);
-static SENSOR_DEVICE_ATTR_2(in7_max, S_IWUSR | S_IRUGO,
-			    adc128_show_in, adc128_set_in, 7, 2);
-
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, adc128_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			  adc128_show_temp, adc128_set_temp, 1);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-			  adc128_show_temp, adc128_set_temp, 2);
-
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, adc128_show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, adc128_show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, adc128_show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, adc128_show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, adc128_show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, adc128_show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, adc128_show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, adc128_show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adc128_show_alarm, NULL, 7);
+static SENSOR_DEVICE_ATTR_2_RO(in0_input, adc128_in, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in0_min, adc128_in, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in0_max, adc128_in, 0, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in1_input, adc128_in, 1, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_min, adc128_in, 1, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in1_max, adc128_in, 1, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in2_input, adc128_in, 2, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in2_min, adc128_in, 2, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_max, adc128_in, 2, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in3_input, adc128_in, 3, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in3_min, adc128_in, 3, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in3_max, adc128_in, 3, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in4_input, adc128_in, 4, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in4_min, adc128_in, 4, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in4_max, adc128_in, 4, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in5_input, adc128_in, 5, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in5_min, adc128_in, 5, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in5_max, adc128_in, 5, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in6_input, adc128_in, 6, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in6_min, adc128_in, 6, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in6_max, adc128_in, 6, 2);
+
+static SENSOR_DEVICE_ATTR_2_RO(in7_input, adc128_in, 7, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in7_min, adc128_in, 7, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in7_max, adc128_in, 7, 2);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, adc128_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, adc128_temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, adc128_temp, 2);
+
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, adc128_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, adc128_alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, adc128_alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, adc128_alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, adc128_alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, adc128_alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, adc128_alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, adc128_alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, adc128_alarm, 7);
 
 static struct attribute *adc128_attrs[] = {
 	&sensor_dev_attr_in0_alarm.dev_attr.attr,
-- 
2.7.4
