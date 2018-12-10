Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36031 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729387AbeLJWJ2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:28 -0500
Received: by mail-pg1-f196.google.com with SMTP id n2so5619294pgm.3
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:27 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 25/30] hwmon: (ds620) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:43 -0800
Message-Id: <1544479728-30077-26-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ds620.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index 57d6958c74b8..7f8f8869c93c 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -139,7 +139,7 @@ static struct ds620_data *ds620_update_client(struct device *dev)
 	return ret;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *da,
+static ssize_t temp_show(struct device *dev, struct device_attribute *da,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -151,8 +151,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", ((data->temp[attr->index] / 8) * 625) / 10);
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *da,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev, struct device_attribute *da,
+			  const char *buf, size_t count)
 {
 	int res;
 	long val;
@@ -176,7 +176,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *da,
 			  char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -207,13 +207,11 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", !!(conf & attr->index));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp, set_temp, 1);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp, set_temp, 2);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL,
-			  DS620_REG_CONFIG_TLF);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL,
-			  DS620_REG_CONFIG_THF);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, DS620_REG_CONFIG_TLF);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, DS620_REG_CONFIG_THF);
 
 static struct attribute *ds620_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4
