Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33315 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:11 -0500
Received: by mail-pg1-f194.google.com with SMTP id z11so5627168pgu.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:09 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/30] hwmon: (adt7462) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:30 -0800
Message-Id: <1544479728-30077-13-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adt7462.c | 646 ++++++++++++++++++++----------------------------
 1 file changed, 271 insertions(+), 375 deletions(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 19f2a6d48bac..b0211f731251 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -784,9 +784,8 @@ static struct adt7462_data *adt7462_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp_min(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -797,10 +796,9 @@ static ssize_t show_temp_min(struct device *dev,
 	return sprintf(buf, "%d\n", 1000 * (data->temp_min[attr->index] - 64));
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
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -822,9 +820,8 @@ static ssize_t set_temp_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_max(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -835,10 +832,9 @@ static ssize_t show_temp_max(struct device *dev,
 	return sprintf(buf, "%d\n", 1000 * (data->temp_max[attr->index] - 64));
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
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -860,7 +856,7 @@ static ssize_t set_temp_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -874,9 +870,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 				     250 * frac);
 }
 
-static ssize_t show_temp_label(struct device *dev,
-			       struct device_attribute *devattr,
-			       char *buf)
+static ssize_t temp_label_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -884,9 +879,8 @@ static ssize_t show_temp_label(struct device *dev,
 	return sprintf(buf, "%s\n", temp_label(data, attr->index));
 }
 
-static ssize_t show_volt_max(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t volt_max_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -898,10 +892,9 @@ static ssize_t show_volt_max(struct device *dev,
 	return sprintf(buf, "%d\n", x);
 }
 
-static ssize_t set_volt_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t volt_max_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -926,9 +919,8 @@ static ssize_t set_volt_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_volt_min(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t volt_min_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -940,10 +932,9 @@ static ssize_t show_volt_min(struct device *dev,
 	return sprintf(buf, "%d\n", x);
 }
 
-static ssize_t set_volt_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t volt_min_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -968,9 +959,8 @@ static ssize_t set_volt_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_voltage(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t voltage_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -982,9 +972,8 @@ static ssize_t show_voltage(struct device *dev,
 	return sprintf(buf, "%d\n", x);
 }
 
-static ssize_t show_voltage_label(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t voltage_label_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -992,9 +981,8 @@ static ssize_t show_voltage_label(struct device *dev,
 	return sprintf(buf, "%s\n", voltage_label(data, attr->index));
 }
 
-static ssize_t show_alarm(struct device *dev,
-			  struct device_attribute *devattr,
-			  char *buf)
+static ssize_t alarm_show(struct device *dev,
+			  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -1012,9 +1000,8 @@ static int fan_enabled(struct adt7462_data *data, int fan)
 	return data->fan_enabled & (1 << fan);
 }
 
-static ssize_t show_fan_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -1031,9 +1018,9 @@ static ssize_t show_fan_min(struct device *dev,
 	return sprintf(buf, "%d\n", FAN_PERIOD_TO_RPM(temp));
 }
 
-static ssize_t set_fan_min(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1057,7 +1044,7 @@ static ssize_t set_fan_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -1071,18 +1058,16 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
 		       FAN_PERIOD_TO_RPM(data->fan[attr->index]));
 }
 
-static ssize_t show_force_pwm_max(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t force_pwm_max_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	struct adt7462_data *data = adt7462_update_device(dev);
 	return sprintf(buf, "%d\n", (data->cfg2 & ADT7462_FSPD_MASK ? 1 : 0));
 }
 
-static ssize_t set_force_pwm_max(struct device *dev,
-				 struct device_attribute *devattr,
-				 const char *buf,
-				 size_t count)
+static ssize_t force_pwm_max_store(struct device *dev,
+				   struct device_attribute *devattr,
+				   const char *buf, size_t count)
 {
 	struct adt7462_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1105,7 +1090,7 @@ static ssize_t set_force_pwm_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *devattr,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -1113,8 +1098,8 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", data->pwm[attr->index]);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1134,18 +1119,16 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t show_pwm_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t pwm_max_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct adt7462_data *data = adt7462_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm_max);
 }
 
-static ssize_t set_pwm_max(struct device *dev,
-			   struct device_attribute *devattr,
-			   const char *buf,
-			   size_t count)
+static ssize_t pwm_max_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct adt7462_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1164,19 +1147,17 @@ static ssize_t set_pwm_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t pwm_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
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
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1197,9 +1178,8 @@ static ssize_t set_pwm_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_hyst(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_hyst_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -1207,10 +1187,9 @@ static ssize_t show_pwm_hyst(struct device *dev,
 		      (data->pwm_trange[attr->index] & ADT7462_PWM_HYST_MASK));
 }
 
-static ssize_t set_pwm_hyst(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t pwm_hyst_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1236,9 +1215,8 @@ static ssize_t set_pwm_hyst(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_tmax(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_tmax_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -1251,10 +1229,9 @@ static ssize_t show_pwm_tmax(struct device *dev,
 	return sprintf(buf, "%d\n", tmin + trange);
 }
 
-static ssize_t set_pwm_tmax(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf,
-			    size_t count)
+static ssize_t pwm_tmax_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	int temp;
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -1284,19 +1261,17 @@ static ssize_t set_pwm_tmax(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_tmin(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_tmin_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
 	return sprintf(buf, "%d\n", 1000 * (data->pwm_tmin[attr->index] - 64));
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
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1318,9 +1293,8 @@ static ssize_t set_pwm_tmin(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_auto(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t pwm_auto_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -1350,10 +1324,9 @@ static void set_pwm_channel(struct i2c_client *client,
 	mutex_unlock(&data->lock);
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
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1375,9 +1348,8 @@ static ssize_t set_pwm_auto(struct device *dev,
 	}
 }
 
-static ssize_t show_pwm_auto_temp(struct device *dev,
-				  struct device_attribute *devattr,
-				  char *buf)
+static ssize_t pwm_auto_temp_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adt7462_data *data = adt7462_update_device(dev);
@@ -1409,10 +1381,9 @@ static int cvt_auto_temp(int input)
 	return ilog2(input);
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
 	struct adt7462_data *data = dev_get_drvdata(dev);
@@ -1431,274 +1402,199 @@ static ssize_t set_pwm_auto_temp(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 2);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IWUSR | S_IRUGO, show_temp_max,
-		    set_temp_max, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 0);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 1);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 2);
-static SENSOR_DEVICE_ATTR(temp4_min, S_IWUSR | S_IRUGO, show_temp_min,
-		    set_temp_min, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_temp_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, show_temp_label, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, show_temp_label, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, show_temp_label, NULL, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM1 | ADT7462_LT_ALARM);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM1 | ADT7462_R1T_ALARM);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM1 | ADT7462_R2T_ALARM);
-static SENSOR_DEVICE_ATTR(temp4_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM1 | ADT7462_R3T_ALARM);
-
-static SENSOR_DEVICE_ATTR(in1_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 0);
-static SENSOR_DEVICE_ATTR(in2_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 1);
-static SENSOR_DEVICE_ATTR(in3_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 2);
-static SENSOR_DEVICE_ATTR(in4_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 3);
-static SENSOR_DEVICE_ATTR(in5_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 4);
-static SENSOR_DEVICE_ATTR(in6_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 5);
-static SENSOR_DEVICE_ATTR(in7_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 6);
-static SENSOR_DEVICE_ATTR(in8_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 7);
-static SENSOR_DEVICE_ATTR(in9_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 8);
-static SENSOR_DEVICE_ATTR(in10_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 9);
-static SENSOR_DEVICE_ATTR(in11_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 10);
-static SENSOR_DEVICE_ATTR(in12_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 11);
-static SENSOR_DEVICE_ATTR(in13_max, S_IWUSR | S_IRUGO, show_volt_max,
-		    set_volt_max, 12);
-
-static SENSOR_DEVICE_ATTR(in1_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 0);
-static SENSOR_DEVICE_ATTR(in2_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 1);
-static SENSOR_DEVICE_ATTR(in3_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 2);
-static SENSOR_DEVICE_ATTR(in4_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 3);
-static SENSOR_DEVICE_ATTR(in5_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 4);
-static SENSOR_DEVICE_ATTR(in6_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 5);
-static SENSOR_DEVICE_ATTR(in7_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 6);
-static SENSOR_DEVICE_ATTR(in8_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 7);
-static SENSOR_DEVICE_ATTR(in9_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 8);
-static SENSOR_DEVICE_ATTR(in10_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 9);
-static SENSOR_DEVICE_ATTR(in11_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 10);
-static SENSOR_DEVICE_ATTR(in12_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 11);
-static SENSOR_DEVICE_ATTR(in13_min, S_IWUSR | S_IRUGO, show_volt_min,
-		    set_volt_min, 12);
-
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_voltage, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_voltage, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_voltage, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_voltage, NULL, 3);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, show_voltage, NULL, 4);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, show_voltage, NULL, 5);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, show_voltage, NULL, 6);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, show_voltage, NULL, 7);
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, show_voltage, NULL, 8);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, show_voltage, NULL, 9);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, show_voltage, NULL, 10);
-static SENSOR_DEVICE_ATTR(in12_input, S_IRUGO, show_voltage, NULL, 11);
-static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, show_voltage, NULL, 12);
-
-static SENSOR_DEVICE_ATTR(in1_label, S_IRUGO, show_voltage_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_label, S_IRUGO, show_voltage_label, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_label, S_IRUGO, show_voltage_label, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_label, S_IRUGO, show_voltage_label, NULL, 3);
-static SENSOR_DEVICE_ATTR(in5_label, S_IRUGO, show_voltage_label, NULL, 4);
-static SENSOR_DEVICE_ATTR(in6_label, S_IRUGO, show_voltage_label, NULL, 5);
-static SENSOR_DEVICE_ATTR(in7_label, S_IRUGO, show_voltage_label, NULL, 6);
-static SENSOR_DEVICE_ATTR(in8_label, S_IRUGO, show_voltage_label, NULL, 7);
-static SENSOR_DEVICE_ATTR(in9_label, S_IRUGO, show_voltage_label, NULL, 8);
-static SENSOR_DEVICE_ATTR(in10_label, S_IRUGO, show_voltage_label, NULL, 9);
-static SENSOR_DEVICE_ATTR(in11_label, S_IRUGO, show_voltage_label, NULL, 10);
-static SENSOR_DEVICE_ATTR(in12_label, S_IRUGO, show_voltage_label, NULL, 11);
-static SENSOR_DEVICE_ATTR(in13_label, S_IRUGO, show_voltage_label, NULL, 12);
-
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V0_ALARM);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V7_ALARM);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V2_ALARM);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V6_ALARM);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V5_ALARM);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V4_ALARM);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V3_ALARM);
-static SENSOR_DEVICE_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM2 | ADT7462_V1_ALARM);
-static SENSOR_DEVICE_ATTR(in9_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM3 | ADT7462_V10_ALARM);
-static SENSOR_DEVICE_ATTR(in10_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM3 | ADT7462_V9_ALARM);
-static SENSOR_DEVICE_ATTR(in11_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM3 | ADT7462_V8_ALARM);
-static SENSOR_DEVICE_ATTR(in12_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM3 | ADT7462_V11_ALARM);
-static SENSOR_DEVICE_ATTR(in13_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM3 | ADT7462_V12_ALARM);
-
-static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan3_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 2);
-static SENSOR_DEVICE_ATTR(fan4_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 3);
-static SENSOR_DEVICE_ATTR(fan5_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 4);
-static SENSOR_DEVICE_ATTR(fan6_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 5);
-static SENSOR_DEVICE_ATTR(fan7_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 6);
-static SENSOR_DEVICE_ATTR(fan8_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    set_fan_min, 7);
-
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO, show_fan, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO, show_fan, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan7_input, S_IRUGO, show_fan, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_input, S_IRUGO, show_fan, NULL, 7);
-
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F0_ALARM);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F1_ALARM);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F2_ALARM);
-static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F3_ALARM);
-static SENSOR_DEVICE_ATTR(fan5_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F4_ALARM);
-static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F5_ALARM);
-static SENSOR_DEVICE_ATTR(fan7_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F6_ALARM);
-static SENSOR_DEVICE_ATTR(fan8_alarm, S_IRUGO, show_alarm, NULL,
-			  ADT7462_ALARM4 | ADT7462_F7_ALARM);
-
-static SENSOR_DEVICE_ATTR(force_pwm_max, S_IWUSR | S_IRUGO,
-		    show_force_pwm_max, set_force_pwm_max, 0);
-
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
-
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
-static SENSOR_DEVICE_ATTR(temp1_auto_point1_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_point1_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_point1_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 2);
-static SENSOR_DEVICE_ATTR(temp4_auto_point1_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_auto_point2_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_point2_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_point2_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 2);
-static SENSOR_DEVICE_ATTR(temp4_auto_point2_hyst, S_IWUSR | S_IRUGO,
-		    show_pwm_hyst, set_pwm_hyst, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 2);
-static SENSOR_DEVICE_ATTR(temp4_auto_point1_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmin, set_pwm_tmin, 3);
-
-static SENSOR_DEVICE_ATTR(temp1_auto_point2_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmax, set_pwm_tmax, 0);
-static SENSOR_DEVICE_ATTR(temp2_auto_point2_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmax, set_pwm_tmax, 1);
-static SENSOR_DEVICE_ATTR(temp3_auto_point2_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmax, set_pwm_tmax, 2);
-static SENSOR_DEVICE_ATTR(temp4_auto_point2_temp, S_IWUSR | S_IRUGO,
-		    show_pwm_tmax, set_pwm_tmax, 3);
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
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_max, temp_max, 3);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_min, temp_min, 3);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_label, temp_label, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_label, temp_label, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_label, temp_label, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_label, temp_label, 3);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm,
+			     ADT7462_ALARM1 | ADT7462_LT_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm,
+			     ADT7462_ALARM1 | ADT7462_R1T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm,
+			     ADT7462_ALARM1 | ADT7462_R2T_ALARM);
+static SENSOR_DEVICE_ATTR_RO(temp4_alarm, alarm,
+			     ADT7462_ALARM1 | ADT7462_R3T_ALARM);
+
+static SENSOR_DEVICE_ATTR_RW(in1_max, volt_max, 0);
+static SENSOR_DEVICE_ATTR_RW(in2_max, volt_max, 1);
+static SENSOR_DEVICE_ATTR_RW(in3_max, volt_max, 2);
+static SENSOR_DEVICE_ATTR_RW(in4_max, volt_max, 3);
+static SENSOR_DEVICE_ATTR_RW(in5_max, volt_max, 4);
+static SENSOR_DEVICE_ATTR_RW(in6_max, volt_max, 5);
+static SENSOR_DEVICE_ATTR_RW(in7_max, volt_max, 6);
+static SENSOR_DEVICE_ATTR_RW(in8_max, volt_max, 7);
+static SENSOR_DEVICE_ATTR_RW(in9_max, volt_max, 8);
+static SENSOR_DEVICE_ATTR_RW(in10_max, volt_max, 9);
+static SENSOR_DEVICE_ATTR_RW(in11_max, volt_max, 10);
+static SENSOR_DEVICE_ATTR_RW(in12_max, volt_max, 11);
+static SENSOR_DEVICE_ATTR_RW(in13_max, volt_max, 12);
+
+static SENSOR_DEVICE_ATTR_RW(in1_min, volt_min, 0);
+static SENSOR_DEVICE_ATTR_RW(in2_min, volt_min, 1);
+static SENSOR_DEVICE_ATTR_RW(in3_min, volt_min, 2);
+static SENSOR_DEVICE_ATTR_RW(in4_min, volt_min, 3);
+static SENSOR_DEVICE_ATTR_RW(in5_min, volt_min, 4);
+static SENSOR_DEVICE_ATTR_RW(in6_min, volt_min, 5);
+static SENSOR_DEVICE_ATTR_RW(in7_min, volt_min, 6);
+static SENSOR_DEVICE_ATTR_RW(in8_min, volt_min, 7);
+static SENSOR_DEVICE_ATTR_RW(in9_min, volt_min, 8);
+static SENSOR_DEVICE_ATTR_RW(in10_min, volt_min, 9);
+static SENSOR_DEVICE_ATTR_RW(in11_min, volt_min, 10);
+static SENSOR_DEVICE_ATTR_RW(in12_min, volt_min, 11);
+static SENSOR_DEVICE_ATTR_RW(in13_min, volt_min, 12);
+
+static SENSOR_DEVICE_ATTR_RO(in1_input, voltage, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_input, voltage, 1);
+static SENSOR_DEVICE_ATTR_RO(in3_input, voltage, 2);
+static SENSOR_DEVICE_ATTR_RO(in4_input, voltage, 3);
+static SENSOR_DEVICE_ATTR_RO(in5_input, voltage, 4);
+static SENSOR_DEVICE_ATTR_RO(in6_input, voltage, 5);
+static SENSOR_DEVICE_ATTR_RO(in7_input, voltage, 6);
+static SENSOR_DEVICE_ATTR_RO(in8_input, voltage, 7);
+static SENSOR_DEVICE_ATTR_RO(in9_input, voltage, 8);
+static SENSOR_DEVICE_ATTR_RO(in10_input, voltage, 9);
+static SENSOR_DEVICE_ATTR_RO(in11_input, voltage, 10);
+static SENSOR_DEVICE_ATTR_RO(in12_input, voltage, 11);
+static SENSOR_DEVICE_ATTR_RO(in13_input, voltage, 12);
+
+static SENSOR_DEVICE_ATTR_RO(in1_label, voltage_label, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_label, voltage_label, 1);
+static SENSOR_DEVICE_ATTR_RO(in3_label, voltage_label, 2);
+static SENSOR_DEVICE_ATTR_RO(in4_label, voltage_label, 3);
+static SENSOR_DEVICE_ATTR_RO(in5_label, voltage_label, 4);
+static SENSOR_DEVICE_ATTR_RO(in6_label, voltage_label, 5);
+static SENSOR_DEVICE_ATTR_RO(in7_label, voltage_label, 6);
+static SENSOR_DEVICE_ATTR_RO(in8_label, voltage_label, 7);
+static SENSOR_DEVICE_ATTR_RO(in9_label, voltage_label, 8);
+static SENSOR_DEVICE_ATTR_RO(in10_label, voltage_label, 9);
+static SENSOR_DEVICE_ATTR_RO(in11_label, voltage_label, 10);
+static SENSOR_DEVICE_ATTR_RO(in12_label, voltage_label, 11);
+static SENSOR_DEVICE_ATTR_RO(in13_label, voltage_label, 12);
+
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V0_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V7_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V2_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V6_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V5_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V4_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V3_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in8_alarm, alarm,
+			     ADT7462_ALARM2 | ADT7462_V1_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in9_alarm, alarm,
+			     ADT7462_ALARM3 | ADT7462_V10_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in10_alarm, alarm,
+			     ADT7462_ALARM3 | ADT7462_V9_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in11_alarm, alarm,
+			     ADT7462_ALARM3 | ADT7462_V8_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in12_alarm, alarm,
+			     ADT7462_ALARM3 | ADT7462_V11_ALARM);
+static SENSOR_DEVICE_ATTR_RO(in13_alarm, alarm,
+			     ADT7462_ALARM3 | ADT7462_V12_ALARM);
+
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
+static SENSOR_DEVICE_ATTR_RW(fan5_min, fan_min, 4);
+static SENSOR_DEVICE_ATTR_RW(fan6_min, fan_min, 5);
+static SENSOR_DEVICE_ATTR_RW(fan7_min, fan_min, 6);
+static SENSOR_DEVICE_ATTR_RW(fan8_min, fan_min, 7);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
+static SENSOR_DEVICE_ATTR_RO(fan5_input, fan, 4);
+static SENSOR_DEVICE_ATTR_RO(fan6_input, fan, 5);
+static SENSOR_DEVICE_ATTR_RO(fan7_input, fan, 6);
+static SENSOR_DEVICE_ATTR_RO(fan8_input, fan, 7);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F0_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F1_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F2_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan4_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F3_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan5_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F4_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan6_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F5_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan7_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F6_ALARM);
+static SENSOR_DEVICE_ATTR_RO(fan8_alarm, alarm,
+			     ADT7462_ALARM4 | ADT7462_F7_ALARM);
+
+static SENSOR_DEVICE_ATTR_RW(force_pwm_max, force_pwm_max, 0);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
+
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
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_point1_hyst, pwm_hyst, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_point1_hyst, pwm_hyst, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_point1_hyst, pwm_hyst, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_auto_point1_hyst, pwm_hyst, 3);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_point2_hyst, pwm_hyst, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_point2_hyst, pwm_hyst, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_point2_hyst, pwm_hyst, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_auto_point2_hyst, pwm_hyst, 3);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_point1_temp, pwm_tmin, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_point1_temp, pwm_tmin, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_point1_temp, pwm_tmin, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_auto_point1_temp, pwm_tmin, 3);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_point2_temp, pwm_tmax, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_point2_temp, pwm_tmax, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_point2_temp, pwm_tmax, 2);
+static SENSOR_DEVICE_ATTR_RW(temp4_auto_point2_temp, pwm_tmax, 3);
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
 
 static struct attribute *adt7462_attrs[] = {
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
-- 
2.7.4
