Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46031 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:00 -0500
Received: by mail-pg1-f195.google.com with SMTP id y4so5599830pgc.12
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:08:59 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/30] hwmon: (ad7418) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:23 -0800
Message-Id: <1544479728-30077-6-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ad7418.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index a01b731ba5d7..76f0a5c01e8a 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -103,8 +103,8 @@ static struct ad7418_data *ad7418_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
-			char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ad7418_data *data = ad7418_update_device(dev);
@@ -112,7 +112,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 		LM75_TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t show_adc(struct device *dev, struct device_attribute *devattr,
+static ssize_t adc_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -122,8 +122,9 @@ static ssize_t show_adc(struct device *dev, struct device_attribute *devattr,
 		((data->in[attr->index] >> 6) * 2500 + 512) / 1024);
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct ad7418_data *data = dev_get_drvdata(dev);
@@ -143,16 +144,14 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-				show_temp, set_temp, 1);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-				show_temp, set_temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, 2);
 
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_adc, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_adc, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_adc, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_adc, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(in1_input, adc, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_input, adc, 1);
+static SENSOR_DEVICE_ATTR_RO(in3_input, adc, 2);
+static SENSOR_DEVICE_ATTR_RO(in4_input, adc, 3);
 
 static struct attribute *ad7416_attrs[] = {
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
-- 
2.7.4
