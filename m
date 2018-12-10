Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35977 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbeLJWJQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:16 -0500
Received: by mail-pf1-f195.google.com with SMTP id b85so6066554pfc.3
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:15 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/30] hwmon: (amc6821) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:34 -0800
Message-Id: <1544479728-30077-17-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/amc6821.c | 229 ++++++++++++++++++------------------------------
 1 file changed, 87 insertions(+), 142 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 46b4e35fd555..2cc5d3c63a4d 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -44,10 +44,10 @@ static const unsigned short normal_i2c[] = {0x18, 0x19, 0x1a, 0x2c, 0x2d, 0x2e,
  */
 
 static int pwminv;	/*Inverted PWM output. */
-module_param(pwminv, int, S_IRUGO);
+module_param(pwminv, int, 0444);
 
 static int init = 1; /*Power-on initialization.*/
-module_param(init, int, S_IRUGO);
+module_param(init, int, 0444);
 
 enum chips { amc6821 };
 
@@ -277,10 +277,8 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t get_temp(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
@@ -288,11 +286,8 @@ static ssize_t get_temp(
 	return sprintf(buf, "%d\n", data->temp[ix] * 1000);
 }
 
-static ssize_t set_temp(
-		struct device *dev,
-		struct device_attribute *attr,
-		const char *buf,
-		size_t count)
+static ssize_t temp_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -314,10 +309,8 @@ static ssize_t set_temp(
 	return count;
 }
 
-static ssize_t get_temp_alarm(
-	struct device *dev,
-	struct device_attribute *devattr,
-	char *buf)
+static ssize_t temp_alarm_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
@@ -352,10 +345,8 @@ static ssize_t get_temp_alarm(
 		return sprintf(buf, "0");
 }
 
-static ssize_t get_temp2_fault(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t temp2_fault_show(struct device *dev,
+				struct device_attribute *devattr, char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	if (data->stat1 & AMC6821_STAT1_RTF)
@@ -364,20 +355,16 @@ static ssize_t get_temp2_fault(
 		return sprintf(buf, "0");
 }
 
-static ssize_t get_pwm1(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm1);
 }
 
-static ssize_t set_pwm1(
-		struct device *dev,
-		struct device_attribute *devattr,
-		const char *buf,
-		size_t count)
+static ssize_t pwm1_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -393,20 +380,16 @@ static ssize_t set_pwm1(
 	return count;
 }
 
-static ssize_t get_pwm1_enable(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *devattr, char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm1_enable);
 }
 
-static ssize_t set_pwm1_enable(
-		struct device *dev,
-		struct device_attribute *attr,
-		const char *buf,
-		size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -451,19 +434,17 @@ static ssize_t set_pwm1_enable(
 	return count;
 }
 
-static ssize_t get_pwm1_auto_channels_temp(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t pwm1_auto_channels_temp_show(struct device *dev,
+					    struct device_attribute *devattr,
+					    char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm1_auto_channels_temp);
 }
 
-static ssize_t get_temp_auto_point_temp(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t temp_auto_point_temp_show(struct device *dev,
+					 struct device_attribute *devattr,
+					 char *buf)
 {
 	int ix = to_sensor_dev_attr_2(devattr)->index;
 	int nr = to_sensor_dev_attr_2(devattr)->nr;
@@ -481,10 +462,9 @@ static ssize_t get_temp_auto_point_temp(
 	}
 }
 
-static ssize_t get_pwm1_auto_point_pwm(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t pwm1_auto_point_pwm_show(struct device *dev,
+					struct device_attribute *devattr,
+					char *buf)
 {
 	int ix = to_sensor_dev_attr(devattr)->index;
 	struct amc6821_data *data = amc6821_update_device(dev);
@@ -513,11 +493,9 @@ static inline ssize_t set_slope_register(struct i2c_client *client,
 	return 0;
 }
 
-static ssize_t set_temp_auto_point_temp(
-		struct device *dev,
-		struct device_attribute *attr,
-		const char *buf,
-		size_t count)
+static ssize_t temp_auto_point_temp_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	struct i2c_client *client = data->client;
@@ -586,11 +564,9 @@ static ssize_t set_temp_auto_point_temp(
 	return count;
 }
 
-static ssize_t set_pwm1_auto_point_pwm(
-		struct device *dev,
-		struct device_attribute *attr,
-		const char *buf,
-		size_t count)
+static ssize_t pwm1_auto_point_pwm_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -626,10 +602,8 @@ static ssize_t set_pwm1_auto_point_pwm(
 	return count;
 }
 
-static ssize_t get_fan(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
@@ -638,10 +612,8 @@ static ssize_t get_fan(
 	return sprintf(buf, "%d\n", (int)(6000000 / data->fan[ix]));
 }
 
-static ssize_t get_fan1_fault(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t fan1_fault_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	if (data->stat1 & AMC6821_STAT1_FANS)
@@ -650,10 +622,8 @@ static ssize_t get_fan1_fault(
 		return sprintf(buf, "0");
 }
 
-static ssize_t set_fan(
-		struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -682,19 +652,16 @@ static ssize_t set_fan(
 	return count;
 }
 
-static ssize_t get_fan1_div(
-		struct device *dev,
-		struct device_attribute *devattr,
-		char *buf)
+static ssize_t fan1_div_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct amc6821_data *data = amc6821_update_device(dev);
 	return sprintf(buf, "%d\n", data->fan1_div);
 }
 
-static ssize_t set_fan1_div(
-		struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan1_div_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -734,69 +701,47 @@ static ssize_t set_fan1_div(
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
-	get_temp, NULL, IDX_TEMP1_INPUT);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO | S_IWUSR, get_temp,
-	set_temp, IDX_TEMP1_MIN);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR, get_temp,
-	set_temp, IDX_TEMP1_MAX);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO | S_IWUSR, get_temp,
-	set_temp, IDX_TEMP1_CRIT);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO,
-	get_temp_alarm, NULL, IDX_TEMP1_MIN);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO,
-	get_temp_alarm, NULL, IDX_TEMP1_MAX);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO,
-	get_temp_alarm, NULL, IDX_TEMP1_CRIT);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO,
-	get_temp, NULL, IDX_TEMP2_INPUT);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IRUGO | S_IWUSR, get_temp,
-	set_temp, IDX_TEMP2_MIN);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO | S_IWUSR, get_temp,
-	set_temp, IDX_TEMP2_MAX);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IRUGO | S_IWUSR, get_temp,
-	set_temp, IDX_TEMP2_CRIT);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO,
-	get_temp2_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO,
-	get_temp_alarm, NULL, IDX_TEMP2_MIN);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO,
-	get_temp_alarm, NULL, IDX_TEMP2_MAX);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO,
-	get_temp_alarm, NULL, IDX_TEMP2_CRIT);
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, IDX_FAN1_INPUT);
-static SENSOR_DEVICE_ATTR(fan1_min, S_IRUGO | S_IWUSR,
-	get_fan, set_fan, IDX_FAN1_MIN);
-static SENSOR_DEVICE_ATTR(fan1_max, S_IRUGO | S_IWUSR,
-	get_fan, set_fan, IDX_FAN1_MAX);
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, get_fan1_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_div, S_IRUGO | S_IWUSR,
-	get_fan1_div, set_fan1_div, 0);
-
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm1, set_pwm1, 0);
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-	get_pwm1_enable, set_pwm1_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IRUGO,
-	get_pwm1_auto_point_pwm, NULL, 0);
-static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, S_IWUSR | S_IRUGO,
-	get_pwm1_auto_point_pwm, set_pwm1_auto_point_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, S_IRUGO,
-	get_pwm1_auto_point_pwm, NULL, 2);
-static SENSOR_DEVICE_ATTR(pwm1_auto_channels_temp, S_IRUGO,
-	get_pwm1_auto_channels_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_point1_temp, S_IRUGO,
-	get_temp_auto_point_temp, NULL, 1, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_point2_temp, S_IWUSR | S_IRUGO,
-	get_temp_auto_point_temp, set_temp_auto_point_temp, 1, 1);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_point3_temp, S_IWUSR | S_IRUGO,
-	get_temp_auto_point_temp, set_temp_auto_point_temp, 1, 2);
-
-static SENSOR_DEVICE_ATTR_2(temp2_auto_point1_temp, S_IWUSR | S_IRUGO,
-	get_temp_auto_point_temp, set_temp_auto_point_temp, 2, 0);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_point2_temp, S_IWUSR | S_IRUGO,
-	get_temp_auto_point_temp, set_temp_auto_point_temp, 2, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_point3_temp, S_IWUSR | S_IRUGO,
-	get_temp_auto_point_temp, set_temp_auto_point_temp, 2, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, IDX_TEMP1_INPUT);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, IDX_TEMP1_MIN);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, IDX_TEMP1_MAX);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp, IDX_TEMP1_CRIT);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, temp_alarm, IDX_TEMP1_MIN);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, temp_alarm, IDX_TEMP1_MAX);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, temp_alarm, IDX_TEMP1_CRIT);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, IDX_TEMP2_INPUT);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp, IDX_TEMP2_MIN);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp, IDX_TEMP2_MAX);
+static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp, IDX_TEMP2_CRIT);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, temp2_fault, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, temp_alarm, IDX_TEMP2_MIN);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, temp_alarm, IDX_TEMP2_MAX);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, temp_alarm, IDX_TEMP2_CRIT);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, IDX_FAN1_INPUT);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan, IDX_FAN1_MIN);
+static SENSOR_DEVICE_ATTR_RW(fan1_max, fan, IDX_FAN1_MAX);
+static SENSOR_DEVICE_ATTR_RO(fan1_fault, fan1_fault, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan1_div, 0);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm1, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm1_enable, 0);
+static SENSOR_DEVICE_ATTR_RO(pwm1_auto_point1_pwm, pwm1_auto_point_pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point2_pwm, pwm1_auto_point_pwm, 1);
+static SENSOR_DEVICE_ATTR_RO(pwm1_auto_point3_pwm, pwm1_auto_point_pwm, 2);
+static SENSOR_DEVICE_ATTR_RO(pwm1_auto_channels_temp, pwm1_auto_channels_temp,
+			     0);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_auto_point1_temp, temp_auto_point_temp,
+			       1, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_point2_temp, temp_auto_point_temp,
+			       1, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_point3_temp, temp_auto_point_temp,
+			       1, 2);
+
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point1_temp, temp_auto_point_temp,
+			       2, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point2_temp, temp_auto_point_temp,
+			       2, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point3_temp, temp_auto_point_temp,
+			       2, 2);
 
 static struct attribute *amc6821_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4
