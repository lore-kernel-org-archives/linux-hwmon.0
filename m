Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41088 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:14 -0500
Received: by mail-pl1-f193.google.com with SMTP id u6so5885538plm.8
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:12 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/30] hwmon: (adt7475) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:32 -0800
Message-Id: <1544479728-30077-15-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adt7475.c | 308 ++++++++++++++++++++----------------------------
 1 file changed, 126 insertions(+), 182 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index f4c7516eb989..0dbb8df74e44 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -322,7 +322,7 @@ static void adt7475_write_word(struct i2c_client *client, int reg, u16 val)
 	i2c_smbus_write_byte_data(client, reg, val & 0xFF);
 }
 
-static ssize_t show_voltage(struct device *dev, struct device_attribute *attr,
+static ssize_t voltage_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -343,8 +343,9 @@ static ssize_t show_voltage(struct device *dev, struct device_attribute *attr,
 	}
 }
 
-static ssize_t set_voltage(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t voltage_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
@@ -380,7 +381,7 @@ static ssize_t set_voltage(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -438,8 +439,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", out);
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -540,8 +541,8 @@ static const int ad7475_st_map[] = {
 	37500, 18800, 12500, 7500, 4700, 3100, 1600, 800,
 };
 
-static ssize_t show_temp_st(struct device *dev, struct device_attribute *attr,
-				  char *buf)
+static ssize_t temp_st_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -567,8 +568,9 @@ static ssize_t show_temp_st(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "0\n");
 }
 
-static ssize_t set_temp_st(struct device *dev, struct device_attribute *attr,
-				 const char *buf, size_t count)
+static ssize_t temp_st_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -627,7 +629,7 @@ static const int autorange_table[] = {
 	53330, 80000
 };
 
-static ssize_t show_point2(struct device *dev, struct device_attribute *attr,
+static ssize_t point2_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -645,8 +647,8 @@ static ssize_t show_point2(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", val + autorange_table[out]);
 }
 
-static ssize_t set_point2(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t point2_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
@@ -688,7 +690,7 @@ static ssize_t set_point2(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_tach(struct device *dev, struct device_attribute *attr,
+static ssize_t tach_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -706,8 +708,8 @@ static ssize_t show_tach(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", out);
 }
 
-static ssize_t set_tach(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t tach_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
@@ -729,7 +731,7 @@ static ssize_t set_tach(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -741,7 +743,7 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
 }
 
-static ssize_t show_pwmchan(struct device *dev, struct device_attribute *attr,
+static ssize_t pwmchan_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -753,7 +755,7 @@ static ssize_t show_pwmchan(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
 }
 
-static ssize_t show_pwmctrl(struct device *dev, struct device_attribute *attr,
+static ssize_t pwmctrl_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -765,8 +767,8 @@ static ssize_t show_pwmctrl(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
@@ -815,7 +817,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_stall_disable(struct device *dev,
+static ssize_t stall_disable_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
@@ -826,9 +828,9 @@ static ssize_t show_stall_disable(struct device *dev,
 	return sprintf(buf, "%d\n", !!(data->enh_acoustics[0] & mask));
 }
 
-static ssize_t set_stall_disable(struct device *dev,
-				 struct device_attribute *attr, const char *buf,
-				 size_t count)
+static ssize_t stall_disable_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -910,8 +912,9 @@ static int hw_set_pwm(struct i2c_client *client, int index,
 	return 0;
 }
 
-static ssize_t set_pwmchan(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t pwmchan_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -933,8 +936,9 @@ static ssize_t set_pwmchan(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_pwmctrl(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t pwmctrl_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -961,7 +965,7 @@ static const int pwmfreq_table[] = {
 	11, 14, 22, 29, 35, 44, 58, 88, 22500
 };
 
-static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
+static ssize_t pwmfreq_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
@@ -976,8 +980,9 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", pwmfreq_table[idx]);
 }
 
-static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t pwmfreq_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1074,156 +1079,95 @@ static ssize_t cpu0_vid_show(struct device *dev,
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
-static SENSOR_DEVICE_ATTR_2(in0_input, S_IRUGO, show_voltage, NULL, INPUT, 0);
-static SENSOR_DEVICE_ATTR_2(in0_max, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MAX, 0);
-static SENSOR_DEVICE_ATTR_2(in0_min, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MIN, 0);
-static SENSOR_DEVICE_ATTR_2(in0_alarm, S_IRUGO, show_voltage, NULL, ALARM, 0);
-static SENSOR_DEVICE_ATTR_2(in1_input, S_IRUGO, show_voltage, NULL, INPUT, 1);
-static SENSOR_DEVICE_ATTR_2(in1_max, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MAX, 1);
-static SENSOR_DEVICE_ATTR_2(in1_min, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MIN, 1);
-static SENSOR_DEVICE_ATTR_2(in1_alarm, S_IRUGO, show_voltage, NULL, ALARM, 1);
-static SENSOR_DEVICE_ATTR_2(in2_input, S_IRUGO, show_voltage, NULL, INPUT, 2);
-static SENSOR_DEVICE_ATTR_2(in2_max, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MAX, 2);
-static SENSOR_DEVICE_ATTR_2(in2_min, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MIN, 2);
-static SENSOR_DEVICE_ATTR_2(in2_alarm, S_IRUGO, show_voltage, NULL, ALARM, 2);
-static SENSOR_DEVICE_ATTR_2(in3_input, S_IRUGO, show_voltage, NULL, INPUT, 3);
-static SENSOR_DEVICE_ATTR_2(in3_max, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MAX, 3);
-static SENSOR_DEVICE_ATTR_2(in3_min, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MIN, 3);
-static SENSOR_DEVICE_ATTR_2(in3_alarm, S_IRUGO, show_voltage, NULL, ALARM, 3);
-static SENSOR_DEVICE_ATTR_2(in4_input, S_IRUGO, show_voltage, NULL, INPUT, 4);
-static SENSOR_DEVICE_ATTR_2(in4_max, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MAX, 4);
-static SENSOR_DEVICE_ATTR_2(in4_min, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MIN, 4);
-static SENSOR_DEVICE_ATTR_2(in4_alarm, S_IRUGO, show_voltage, NULL, ALARM, 8);
-static SENSOR_DEVICE_ATTR_2(in5_input, S_IRUGO, show_voltage, NULL, INPUT, 5);
-static SENSOR_DEVICE_ATTR_2(in5_max, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MAX, 5);
-static SENSOR_DEVICE_ATTR_2(in5_min, S_IRUGO | S_IWUSR, show_voltage,
-			    set_voltage, MIN, 5);
-static SENSOR_DEVICE_ATTR_2(in5_alarm, S_IRUGO, show_voltage, NULL, ALARM, 31);
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp, NULL, INPUT, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_alarm, S_IRUGO, show_temp, NULL, ALARM, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_fault, S_IRUGO, show_temp, NULL, FAULT, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    MAX, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    MIN, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_offset, S_IRUGO | S_IWUSR, show_temp,
-			    set_temp, OFFSET, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_point1_temp, S_IRUGO | S_IWUSR,
-			    show_temp, set_temp, AUTOMIN, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_auto_point2_temp, S_IRUGO | S_IWUSR,
-			    show_point2, set_point2, 0, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_crit, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    THERM, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_crit_hyst, S_IRUGO | S_IWUSR, show_temp,
-			    set_temp, HYSTERSIS, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_smoothing, S_IRUGO | S_IWUSR, show_temp_st,
-			    set_temp_st, 0, 0);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, INPUT, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_alarm, S_IRUGO, show_temp, NULL, ALARM, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    MAX, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    MIN, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IRUGO | S_IWUSR, show_temp,
-			    set_temp, OFFSET, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_point1_temp, S_IRUGO | S_IWUSR,
-			    show_temp, set_temp, AUTOMIN, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_auto_point2_temp, S_IRUGO | S_IWUSR,
-			    show_point2, set_point2, 0, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_crit, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    THERM, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_crit_hyst, S_IRUGO | S_IWUSR, show_temp,
-			    set_temp, HYSTERSIS, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_smoothing, S_IRUGO | S_IWUSR, show_temp_st,
-			    set_temp_st, 0, 1);
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, INPUT, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_alarm, S_IRUGO, show_temp, NULL, ALARM, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_fault, S_IRUGO, show_temp, NULL, FAULT, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    MAX, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    MIN, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_offset, S_IRUGO | S_IWUSR, show_temp,
-			    set_temp, OFFSET, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_point1_temp, S_IRUGO | S_IWUSR,
-			    show_temp, set_temp, AUTOMIN, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_auto_point2_temp, S_IRUGO | S_IWUSR,
-			    show_point2, set_point2, 0, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_crit, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    THERM, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_crit_hyst, S_IRUGO | S_IWUSR, show_temp,
-			    set_temp, HYSTERSIS, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_smoothing, S_IRUGO | S_IWUSR, show_temp_st,
-			    set_temp_st, 0, 2);
-static SENSOR_DEVICE_ATTR_2(fan1_input, S_IRUGO, show_tach, NULL, INPUT, 0);
-static SENSOR_DEVICE_ATTR_2(fan1_min, S_IRUGO | S_IWUSR, show_tach, set_tach,
-			    MIN, 0);
-static SENSOR_DEVICE_ATTR_2(fan1_alarm, S_IRUGO, show_tach, NULL, ALARM, 0);
-static SENSOR_DEVICE_ATTR_2(fan2_input, S_IRUGO, show_tach, NULL, INPUT, 1);
-static SENSOR_DEVICE_ATTR_2(fan2_min, S_IRUGO | S_IWUSR, show_tach, set_tach,
-			    MIN, 1);
-static SENSOR_DEVICE_ATTR_2(fan2_alarm, S_IRUGO, show_tach, NULL, ALARM, 1);
-static SENSOR_DEVICE_ATTR_2(fan3_input, S_IRUGO, show_tach, NULL, INPUT, 2);
-static SENSOR_DEVICE_ATTR_2(fan3_min, S_IRUGO | S_IWUSR, show_tach, set_tach,
-			    MIN, 2);
-static SENSOR_DEVICE_ATTR_2(fan3_alarm, S_IRUGO, show_tach, NULL, ALARM, 2);
-static SENSOR_DEVICE_ATTR_2(fan4_input, S_IRUGO, show_tach, NULL, INPUT, 3);
-static SENSOR_DEVICE_ATTR_2(fan4_min, S_IRUGO | S_IWUSR, show_tach, set_tach,
-			    MIN, 3);
-static SENSOR_DEVICE_ATTR_2(fan4_alarm, S_IRUGO, show_tach, NULL, ALARM, 3);
-static SENSOR_DEVICE_ATTR_2(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
-			    0);
-static SENSOR_DEVICE_ATTR_2(pwm1_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
-			    set_pwmfreq, INPUT, 0);
-static SENSOR_DEVICE_ATTR_2(pwm1_enable, S_IRUGO | S_IWUSR, show_pwmctrl,
-			    set_pwmctrl, INPUT, 0);
-static SENSOR_DEVICE_ATTR_2(pwm1_auto_channels_temp, S_IRUGO | S_IWUSR,
-			    show_pwmchan, set_pwmchan, INPUT, 0);
-static SENSOR_DEVICE_ATTR_2(pwm1_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
-			    set_pwm, MIN, 0);
-static SENSOR_DEVICE_ATTR_2(pwm1_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
-			    set_pwm, MAX, 0);
-static SENSOR_DEVICE_ATTR_2(pwm1_stall_disable, S_IRUGO | S_IWUSR,
-			    show_stall_disable, set_stall_disable, 0, 0);
-static SENSOR_DEVICE_ATTR_2(pwm2, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
-			    1);
-static SENSOR_DEVICE_ATTR_2(pwm2_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
-			    set_pwmfreq, INPUT, 1);
-static SENSOR_DEVICE_ATTR_2(pwm2_enable, S_IRUGO | S_IWUSR, show_pwmctrl,
-			    set_pwmctrl, INPUT, 1);
-static SENSOR_DEVICE_ATTR_2(pwm2_auto_channels_temp, S_IRUGO | S_IWUSR,
-			    show_pwmchan, set_pwmchan, INPUT, 1);
-static SENSOR_DEVICE_ATTR_2(pwm2_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
-			    set_pwm, MIN, 1);
-static SENSOR_DEVICE_ATTR_2(pwm2_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
-			    set_pwm, MAX, 1);
-static SENSOR_DEVICE_ATTR_2(pwm2_stall_disable, S_IRUGO | S_IWUSR,
-			    show_stall_disable, set_stall_disable, 0, 1);
-static SENSOR_DEVICE_ATTR_2(pwm3, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
-			    2);
-static SENSOR_DEVICE_ATTR_2(pwm3_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
-			    set_pwmfreq, INPUT, 2);
-static SENSOR_DEVICE_ATTR_2(pwm3_enable, S_IRUGO | S_IWUSR, show_pwmctrl,
-			    set_pwmctrl, INPUT, 2);
-static SENSOR_DEVICE_ATTR_2(pwm3_auto_channels_temp, S_IRUGO | S_IWUSR,
-			    show_pwmchan, set_pwmchan, INPUT, 2);
-static SENSOR_DEVICE_ATTR_2(pwm3_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
-			    set_pwm, MIN, 2);
-static SENSOR_DEVICE_ATTR_2(pwm3_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
-			    set_pwm, MAX, 2);
-static SENSOR_DEVICE_ATTR_2(pwm3_stall_disable, S_IRUGO | S_IWUSR,
-			    show_stall_disable, set_stall_disable, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in0_input, voltage, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in0_max, voltage, MAX, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in0_min, voltage, MIN, 0);
+static SENSOR_DEVICE_ATTR_2_RO(in0_alarm, voltage, ALARM, 0);
+static SENSOR_DEVICE_ATTR_2_RO(in1_input, voltage, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in1_max, voltage, MAX, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in1_min, voltage, MIN, 1);
+static SENSOR_DEVICE_ATTR_2_RO(in1_alarm, voltage, ALARM, 1);
+static SENSOR_DEVICE_ATTR_2_RO(in2_input, voltage, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in2_max, voltage, MAX, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in2_min, voltage, MIN, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in2_alarm, voltage, ALARM, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in3_input, voltage, INPUT, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in3_max, voltage, MAX, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in3_min, voltage, MIN, 3);
+static SENSOR_DEVICE_ATTR_2_RO(in3_alarm, voltage, ALARM, 3);
+static SENSOR_DEVICE_ATTR_2_RO(in4_input, voltage, INPUT, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in4_max, voltage, MAX, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in4_min, voltage, MIN, 4);
+static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, voltage, ALARM, 8);
+static SENSOR_DEVICE_ATTR_2_RO(in5_input, voltage, INPUT, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in5_max, voltage, MAX, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in5_min, voltage, MIN, 5);
+static SENSOR_DEVICE_ATTR_2_RO(in5_alarm, voltage, ALARM, 31);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_input, temp, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_alarm, temp, ALARM, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_fault, temp, FAULT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp, MAX, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_min, temp, MIN, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_offset, temp, OFFSET, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_point1_temp, temp, AUTOMIN, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_point2_temp, point2, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_crit, temp, THERM, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_crit_hyst, temp, HYSTERSIS, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_smoothing, temp_st, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_input, temp, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_alarm, temp, ALARM, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp, MAX, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_min, temp, MIN, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_offset, temp, OFFSET, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point1_temp, temp, AUTOMIN, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point2_temp, point2, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_crit, temp, THERM, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_crit_hyst, temp, HYSTERSIS, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_smoothing, temp_st, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_input, temp, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_alarm, temp, ALARM, 2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_fault, temp, FAULT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_max, temp, MAX, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_min, temp, MIN, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_offset, temp, OFFSET, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_point1_temp, temp, AUTOMIN, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_auto_point2_temp, point2, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_crit, temp, THERM, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_crit_hyst, temp, HYSTERSIS, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_smoothing, temp_st, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RO(fan1_input, tach, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(fan1_min, tach, MIN, 0);
+static SENSOR_DEVICE_ATTR_2_RO(fan1_alarm, tach, ALARM, 0);
+static SENSOR_DEVICE_ATTR_2_RO(fan2_input, tach, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RW(fan2_min, tach, MIN, 1);
+static SENSOR_DEVICE_ATTR_2_RO(fan2_alarm, tach, ALARM, 1);
+static SENSOR_DEVICE_ATTR_2_RO(fan3_input, tach, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(fan3_min, tach, MIN, 2);
+static SENSOR_DEVICE_ATTR_2_RO(fan3_alarm, tach, ALARM, 2);
+static SENSOR_DEVICE_ATTR_2_RO(fan4_input, tach, INPUT, 3);
+static SENSOR_DEVICE_ATTR_2_RW(fan4_min, tach, MIN, 3);
+static SENSOR_DEVICE_ATTR_2_RO(fan4_alarm, tach, ALARM, 3);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1, pwm, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_freq, pwmfreq, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_enable, pwmctrl, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_channels_temp, pwmchan, INPUT, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_pwm, pwm, MIN, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_pwm, pwm, MAX, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_stall_disable, stall_disable, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2, pwm, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_freq, pwmfreq, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_enable, pwmctrl, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_channels_temp, pwmchan, INPUT, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_pwm, pwm, MIN, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_pwm, pwm, MAX, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_stall_disable, stall_disable, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3, pwm, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3_freq, pwmfreq, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3_enable, pwmctrl, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_channels_temp, pwmchan, INPUT, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point1_pwm, pwm, MIN, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point2_pwm, pwm, MAX, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm3_stall_disable, stall_disable, 0, 2);
 
 /* Non-standard name, might need revisiting */
 static DEVICE_ATTR_RW(pwm_use_point2_pwm_at_crit);
-- 
2.7.4
