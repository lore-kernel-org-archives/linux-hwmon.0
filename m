Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33319 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:12 -0500
Received: by mail-pg1-f196.google.com with SMTP id z11so5627198pgu.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:11 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/30] hwmon: (adt7470) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:31 -0800
Message-Id: <1544479728-30077-14-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adt7470.c | 403 +++++++++++++++++++-----------------------------
 1 file changed, 158 insertions(+), 245 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 2cd920751441..6d87daf18809 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -459,19 +459,17 @@ static ssize_t num_temp_sensors_store(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_min(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", 1000 * data->temp_min[attr->index]);
 }
 
-static ssize_t set_temp_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -493,19 +491,17 @@ static ssize_t set_temp_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_max(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", 1000 * data->temp_max[attr->index]);
 }
 
-static ssize_t set_temp_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -527,7 +523,7 @@ static ssize_t set_temp_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -565,9 +561,8 @@ static ssize_t alarm_mask_store(struct device *dev,
 	return count;
 }
 
-static ssize_t show_fan_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t fan_max_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
@@ -579,9 +574,9 @@ static ssize_t show_fan_max(struct device *dev,
 		return sprintf(buf, "0\n");
 }
 
-static ssize_t set_fan_max(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf, size_t count)
+static ssize_t fan_max_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -602,9 +597,8 @@ static ssize_t set_fan_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_fan_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
@@ -616,9 +610,9 @@ static ssize_t show_fan_min(struct device *dev,
 		return sprintf(buf, "0\n");
 }
 
-static ssize_t set_fan_min(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -639,7 +633,7 @@ static ssize_t set_fan_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -652,18 +646,16 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
 		return sprintf(buf, "0\n");
 }
 
-static ssize_t show_force_pwm_max(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t force_pwm_max_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", data->force_pwm_max);
 }
 
-static ssize_t set_force_pwm_max(struct device *dev,
-				 struct device_attribute *devattr,
-				 const char *buf,
-				 size_t count)
+static ssize_t force_pwm_max_store(struct device *dev,
+				   struct device_attribute *devattr,
+				   const char *buf, size_t count)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -686,7 +678,7 @@ static ssize_t set_force_pwm_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *devattr,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -694,8 +686,8 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", data->pwm[attr->index]);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -779,19 +771,17 @@ static ssize_t pwm1_freq_store(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t pwm_max_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm_max[attr->index]);
 }
 
-static ssize_t set_pwm_max(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf,
-			   size_t count)
+static ssize_t pwm_max_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -812,19 +802,17 @@ static ssize_t set_pwm_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t pwm_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm_min[attr->index]);
 }
 
-static ssize_t set_pwm_min(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf,
-			   size_t count)
+static ssize_t pwm_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -845,9 +833,8 @@ static ssize_t set_pwm_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_tmax(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_tmax_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
@@ -855,19 +842,17 @@ static ssize_t show_pwm_tmax(struct device *dev,
 	return sprintf(buf, "%d\n", 1000 * (20 + data->pwm_tmin[attr->index]));
 }
 
-static ssize_t show_pwm_tmin(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_tmin_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", 1000 * data->pwm_tmin[attr->index]);
 }
 
-static ssize_t set_pwm_tmin(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t pwm_tmin_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -889,19 +874,17 @@ static ssize_t set_pwm_tmin(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_auto(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_auto_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
 	return sprintf(buf, "%d\n", 1 + data->pwm_automatic[attr->index]);
 }
 
-static ssize_t set_pwm_auto(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t pwm_auto_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -936,9 +919,8 @@ static ssize_t set_pwm_auto(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_auto_temp(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t pwm_auto_temp_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
@@ -959,10 +941,9 @@ static int cvt_auto_temp(int input)
 	return ilog2(input) + 1;
 }
 
-static ssize_t set_pwm_auto_temp(struct device *dev,
-				 struct device_attribute *devattr,
-				 const char *buf,
-				 size_t count)
+static ssize_t pwm_auto_temp_store(struct device *dev,
+				   struct device_attribute *devattr,
+				   const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = dev_get_drvdata(dev);
@@ -996,9 +977,8 @@ static ssize_t set_pwm_auto_temp(struct device *dev,
 	return count;
 }
 
-static ssize_t show_alarm(struct device *dev,
-			  struct device_attribute *devattr,
-			  char *buf)
+static ssize_t alarm_show(struct device *dev,
+			  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7470_data *data = adt7470_update_device(dev);
@@ -1013,175 +993,108 @@ static DEVICE_ATTR_RW(alarm_mask);
 static DEVICE_ATTR_RW(num_temp_sensors);
 static DEVICE_ATTR_RW(auto_update_interval);
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 2);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 3);
-static SENSOR_DEVICE_ATTR(temp5_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 4);
-static SENSOR_DEVICE_ATTR(temp6_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 5);
-static SENSOR_DEVICE_ATTR(temp7_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 6);
-static SENSOR_DEVICE_ATTR(temp8_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 7);
-static SENSOR_DEVICE_ATTR(temp9_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 8);
-static SENSOR_DEVICE_ATTR(temp10_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 9);
-
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 0);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 1);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 2);
-static SENSOR_DEVICE_ATTR(temp4_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 3);
-static SENSOR_DEVICE_ATTR(temp5_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 4);
-static SENSOR_DEVICE_ATTR(temp6_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 5);
-static SENSOR_DEVICE_ATTR(temp7_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 6);
-static SENSOR_DEVICE_ATTR(temp8_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 7);
-static SENSOR_DEVICE_ATTR(temp9_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 8);
-static SENSOR_DEVICE_ATTR(temp10_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 9);
-
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_temp, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, show_temp, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, show_temp, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, show_temp, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp10_input, S_IRUGO, show_temp, NULL, 9);
-
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R1T_ALARM);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R2T_ALARM);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R3T_ALARM);
-static SENSOR_DEVICE_ATTR(temp4_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R4T_ALARM);
-static SENSOR_DEVICE_ATTR(temp5_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R5T_ALARM);
-static SENSOR_DEVICE_ATTR(temp6_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R6T_ALARM);
-static SENSOR_DEVICE_ATTR(temp7_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7470_R7T_ALARM);
-static SENSOR_DEVICE_ATTR(temp8_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_R8T_ALARM));
-static SENSOR_DEVICE_ATTR(temp9_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_R9T_ALARM));
-static SENSOR_DEVICE_ATTR(temp10_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_R10T_ALARM));
-
-static SENSOR_DEVICE_ATTR(fan1_max, S_IWUSR | S_IRUGO, show_fan_max,
-		    set_fan_max, 0);
-static SENSOR_DEVICE_ATTR(fan2_max, S_IWUSR | S_IRUGO, show_fan_max,
-		    set_fan_max, 1);
-static SENSOR_DEVICE_ATTR(fan3_max, S_IWUSR | S_IRUGO, show_fan_max,
-		    set_fan_max, 2);
-static SENSOR_DEVICE_ATTR(fan4_max, S_IWUSR | S_IRUGO, show_fan_max,
-		    set_fan_max, 3);
-
-static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan3_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 2);
-static SENSOR_DEVICE_ATTR(fan4_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 3);
-
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3);
-
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_FAN1_ALARM));
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_FAN2_ALARM));
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_FAN3_ALARM));
-static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL,
-			  ALARM2(ADT7470_FAN4_ALARM));
-
-static SENSOR_DEVICE_ATTR(force_pwm_max, S_IWUSR | S_IRUGO,
-		    show_force_pwm_max, set_force_pwm_max, 0);
-
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_max, temp_max, 3);
+static SENSOR_DEVICE_ATTR_RW(temp5_max, temp_max, 4);
+static SENSOR_DEVICE_ATTR_RW(temp6_max, temp_max, 5);
+static SENSOR_DEVICE_ATTR_RW(temp7_max, temp_max, 6);
+static SENSOR_DEVICE_ATTR_RW(temp8_max, temp_max, 7);
+static SENSOR_DEVICE_ATTR_RW(temp9_max, temp_max, 8);
+static SENSOR_DEVICE_ATTR_RW(temp10_max, temp_max, 9);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_min, temp_min, 3);
+static SENSOR_DEVICE_ATTR_RW(temp5_min, temp_min, 4);
+static SENSOR_DEVICE_ATTR_RW(temp6_min, temp_min, 5);
+static SENSOR_DEVICE_ATTR_RW(temp7_min, temp_min, 6);
+static SENSOR_DEVICE_ATTR_RW(temp8_min, temp_min, 7);
+static SENSOR_DEVICE_ATTR_RW(temp9_min, temp_min, 8);
+static SENSOR_DEVICE_ATTR_RW(temp10_min, temp_min, 9);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_input, temp, 5);
+static SENSOR_DEVICE_ATTR_RO(temp7_input, temp, 6);
+static SENSOR_DEVICE_ATTR_RO(temp8_input, temp, 7);
+static SENSOR_DEVICE_ATTR_RO(temp9_input, temp, 8);
+static SENSOR_DEVICE_ATTR_RO(temp10_input, temp, 9);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, ADT7470_R1T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, ADT7470_R2T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, ADT7470_R3T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp4_alarm, alarm, ADT7470_R4T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp5_alarm, alarm, ADT7470_R5T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp6_alarm, alarm, ADT7470_R6T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp7_alarm, alarm, ADT7470_R7T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp8_alarm, alarm, ALARM2(ADT7470_R8T_ALARM));
+static SENSOR_DEVICE_ATTR_RO(temp9_alarm, alarm, ALARM2(ADT7470_R9T_ALARM));
+static SENSOR_DEVICE_ATTR_RO(temp10_alarm, alarm, ALARM2(ADT7470_R10T_ALARM));
+
+static SENSOR_DEVICE_ATTR_RW(fan1_max, fan_max, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_max, fan_max, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_max, fan_max, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_max, fan_max, 3);
+
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, ALARM2(ADT7470_FAN1_ALARM));
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, ALARM2(ADT7470_FAN2_ALARM));
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, ALARM2(ADT7470_FAN3_ALARM));
+static SENSOR_DEVICE_ATTR_RO(fan4_alarm, alarm, ALARM2(ADT7470_FAN4_ALARM));
+
+static SENSOR_DEVICE_ATTR_RW(force_pwm_max, force_pwm_max, 0);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
 
 static DEVICE_ATTR_RW(pwm1_freq);
 
-static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_min, set_pwm_min, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_min, set_pwm_min, 1);
-static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_min, set_pwm_min, 2);
-static SENSOR_DEVICE_ATTR(pwm4_auto_point1_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_min, set_pwm_min, 3);
-
-static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_max, set_pwm_max, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_max, set_pwm_max, 1);
-static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_max, set_pwm_max, 2);
-static SENSOR_DEVICE_ATTR(pwm4_auto_point2_pwm, S_IWUSR | S_IRUGO,
-		    show_pwm_max, set_pwm_max, 3);
-
-static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 1);
-static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 2);
-static SENSOR_DEVICE_ATTR(pwm4_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 3);
-
-static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, S_IRUGO, show_pwm_tmax,
-		    NULL, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, S_IRUGO, show_pwm_tmax,
-		    NULL, 1);
-static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, S_IRUGO, show_pwm_tmax,
-		    NULL, 2);
-static SENSOR_DEVICE_ATTR(pwm4_auto_point2_temp, S_IRUGO, show_pwm_tmax,
-		    NULL, 3);
-
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, show_pwm_auto,
-		    set_pwm_auto, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO, show_pwm_auto,
-		    set_pwm_auto, 1);
-static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO, show_pwm_auto,
-		    set_pwm_auto, 2);
-static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO, show_pwm_auto,
-		    set_pwm_auto, 3);
-
-static SENSOR_DEVICE_ATTR(pwm1_auto_channels_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_auto_temp, set_pwm_auto_temp, 0);
-static SENSOR_DEVICE_ATTR(pwm2_auto_channels_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_auto_temp, set_pwm_auto_temp, 1);
-static SENSOR_DEVICE_ATTR(pwm3_auto_channels_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_auto_temp, set_pwm_auto_temp, 2);
-static SENSOR_DEVICE_ATTR(pwm4_auto_channels_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_auto_temp, set_pwm_auto_temp, 3);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_pwm, pwm_min, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_pwm, pwm_min, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point1_pwm, pwm_min, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_auto_point1_pwm, pwm_min, 3);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point2_pwm, pwm_max, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point2_pwm, pwm_max, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point2_pwm, pwm_max, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_auto_point2_pwm, pwm_max, 3);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_temp, pwm_tmin, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_temp, pwm_tmin, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point1_temp, pwm_tmin, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_auto_point1_temp, pwm_tmin, 3);
+
+static SENSOR_DEVICE_ATTR_RO(pwm1_auto_point2_temp, pwm_tmax, 0);
+static SENSOR_DEVICE_ATTR_RO(pwm2_auto_point2_temp, pwm_tmax, 1);
+static SENSOR_DEVICE_ATTR_RO(pwm3_auto_point2_temp, pwm_tmax, 2);
+static SENSOR_DEVICE_ATTR_RO(pwm4_auto_point2_temp, pwm_tmax, 3);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_auto, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_auto, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_auto, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_enable, pwm_auto, 3);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_channels_temp, pwm_auto_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_channels_temp, pwm_auto_temp, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_channels_temp, pwm_auto_temp, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_auto_channels_temp, pwm_auto_temp, 3);
 
 static struct attribute *adt7470_attrs[] = {
 	&dev_attr_alarm_mask.attr,
-- 
2.7.4
