Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39560 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729387AbeLJWJZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:25 -0500
Received: by mail-pf1-f194.google.com with SMTP id c72so6059273pfc.6
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:25 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 23/30] hwmon: (dell-smm-hwmon) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:41 -0800
Message-Id: <1544479728-30077-24-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Cc: "Pali Rohár" <pali.rohar@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/dell-smm-hwmon.c | 68 +++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 367a8a61712c..68c9a6664557 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -618,7 +618,7 @@ static inline void __exit i8k_exit_procfs(void)
  * Hwmon interface
  */
 
-static ssize_t i8k_hwmon_show_temp_label(struct device *dev,
+static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
 					 struct device_attribute *devattr,
 					 char *buf)
 {
@@ -641,7 +641,7 @@ static ssize_t i8k_hwmon_show_temp_label(struct device *dev,
 	return sprintf(buf, "%s\n", labels[type]);
 }
 
-static ssize_t i8k_hwmon_show_temp(struct device *dev,
+static ssize_t i8k_hwmon_temp_show(struct device *dev,
 				   struct device_attribute *devattr,
 				   char *buf)
 {
@@ -654,7 +654,7 @@ static ssize_t i8k_hwmon_show_temp(struct device *dev,
 	return sprintf(buf, "%d\n", temp * 1000);
 }
 
-static ssize_t i8k_hwmon_show_fan_label(struct device *dev,
+static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
 					struct device_attribute *devattr,
 					char *buf)
 {
@@ -685,9 +685,8 @@ static ssize_t i8k_hwmon_show_fan_label(struct device *dev,
 	return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[type]);
 }
 
-static ssize_t i8k_hwmon_show_fan(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t i8k_hwmon_fan_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	int fan_speed;
@@ -698,9 +697,8 @@ static ssize_t i8k_hwmon_show_fan(struct device *dev,
 	return sprintf(buf, "%d\n", fan_speed);
 }
 
-static ssize_t i8k_hwmon_show_pwm(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t i8k_hwmon_pwm_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	int index = to_sensor_dev_attr(devattr)->index;
 	int status;
@@ -711,9 +709,9 @@ static ssize_t i8k_hwmon_show_pwm(struct device *dev,
 	return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, 255));
 }
 
-static ssize_t i8k_hwmon_set_pwm(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count)
+static ssize_t i8k_hwmon_pwm_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	unsigned long val;
@@ -731,35 +729,23 @@ static ssize_t i8k_hwmon_set_pwm(struct device *dev,
 	return err < 0 ? -EIO : count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
-			  0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
-			  1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
-			  2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
-			  3);
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, i8k_hwmon_show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
-			  0);
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
-			  i8k_hwmon_set_pwm, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
-			  1);
-static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
-			  1);
-static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
-			  i8k_hwmon_set_pwm, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
-			  2);
-static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
-			  2);
-static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
-			  i8k_hwmon_set_pwm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, i8k_hwmon_temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_label, i8k_hwmon_temp_label, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, i8k_hwmon_temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_label, i8k_hwmon_temp_label, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, i8k_hwmon_temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_label, i8k_hwmon_temp_label, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, i8k_hwmon_temp, 3);
+static SENSOR_DEVICE_ATTR_RO(temp4_label, i8k_hwmon_temp_label, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, i8k_hwmon_fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan1_label, i8k_hwmon_fan_label, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1, i8k_hwmon_pwm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, i8k_hwmon_fan, 1);
+static SENSOR_DEVICE_ATTR_RO(fan2_label, i8k_hwmon_fan_label, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2, i8k_hwmon_pwm, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, i8k_hwmon_fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan3_label, i8k_hwmon_fan_label, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3, i8k_hwmon_pwm, 2);
 
 static struct attribute *i8k_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
-- 
2.7.4
