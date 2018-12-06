Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/13] hwmon: (ltc2945): Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:22 -0800
Message-Id: <1544124153-23961-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc2945.c | 121 ++++++++++++++++++++----------------------------
 1 file changed, 50 insertions(+), 71 deletions(-)

diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index 1b92e4f6e234..f16716a1fead 100644
--- a/drivers/hwmon/ltc2945.c
+++ b/drivers/hwmon/ltc2945.c
@@ -226,7 +226,7 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 	return val;
 }
 
-static ssize_t ltc2945_show_value(struct device *dev,
+static ssize_t ltc2945_value_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -238,9 +238,9 @@ static ssize_t ltc2945_show_value(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%lld\n", value);
 }
 
-static ssize_t ltc2945_set_value(struct device *dev,
-				     struct device_attribute *da,
-				     const char *buf, size_t count)
+static ssize_t ltc2945_value_store(struct device *dev,
+				   struct device_attribute *da,
+				   const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct regmap *regmap = dev_get_drvdata(dev);
@@ -273,7 +273,7 @@ static ssize_t ltc2945_set_value(struct device *dev,
 	return ret < 0 ? ret : count;
 }
 
-static ssize_t ltc2945_reset_history(struct device *dev,
+static ssize_t ltc2945_history_store(struct device *dev,
 				     struct device_attribute *da,
 				     const char *buf, size_t count)
 {
@@ -326,7 +326,7 @@ static ssize_t ltc2945_reset_history(struct device *dev,
 	return ret ? : count;
 }
 
-static ssize_t ltc2945_show_bool(struct device *dev,
+static ssize_t ltc2945_bool_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -347,86 +347,65 @@ static ssize_t ltc2945_show_bool(struct device *dev,
 
 /* Input voltages */
 
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_VIN_H);
-static SENSOR_DEVICE_ATTR(in1_min, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MIN_VIN_THRES_H);
-static SENSOR_DEVICE_ATTR(in1_max, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MAX_VIN_THRES_H);
-static SENSOR_DEVICE_ATTR(in1_lowest, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_MIN_VIN_H);
-static SENSOR_DEVICE_ATTR(in1_highest, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_MAX_VIN_H);
-static SENSOR_DEVICE_ATTR(in1_reset_history, S_IWUSR, NULL,
-			  ltc2945_reset_history, LTC2945_MIN_VIN_H);
-
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_ADIN_H);
-static SENSOR_DEVICE_ATTR(in2_min, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MIN_ADIN_THRES_H);
-static SENSOR_DEVICE_ATTR(in2_max, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MAX_ADIN_THRES_H);
-static SENSOR_DEVICE_ATTR(in2_lowest, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_MIN_ADIN_H);
-static SENSOR_DEVICE_ATTR(in2_highest, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_MAX_ADIN_H);
-static SENSOR_DEVICE_ATTR(in2_reset_history, S_IWUSR, NULL,
-			  ltc2945_reset_history, LTC2945_MIN_ADIN_H);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc2945_value, LTC2945_VIN_H);
+static SENSOR_DEVICE_ATTR_RW(in1_min, ltc2945_value, LTC2945_MIN_VIN_THRES_H);
+static SENSOR_DEVICE_ATTR_RW(in1_max, ltc2945_value, LTC2945_MAX_VIN_THRES_H);
+static SENSOR_DEVICE_ATTR_RO(in1_lowest, ltc2945_value, LTC2945_MIN_VIN_H);
+static SENSOR_DEVICE_ATTR_RO(in1_highest, ltc2945_value, LTC2945_MAX_VIN_H);
+static SENSOR_DEVICE_ATTR_WO(in1_reset_history, ltc2945_history,
+			     LTC2945_MIN_VIN_H);
+
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc2945_value, LTC2945_ADIN_H);
+static SENSOR_DEVICE_ATTR_RW(in2_min, ltc2945_value, LTC2945_MIN_ADIN_THRES_H);
+static SENSOR_DEVICE_ATTR_RW(in2_max, ltc2945_value, LTC2945_MAX_ADIN_THRES_H);
+static SENSOR_DEVICE_ATTR_RO(in2_lowest, ltc2945_value, LTC2945_MIN_ADIN_H);
+static SENSOR_DEVICE_ATTR_RO(in2_highest, ltc2945_value, LTC2945_MAX_ADIN_H);
+static SENSOR_DEVICE_ATTR_WO(in2_reset_history, ltc2945_history,
+			     LTC2945_MIN_ADIN_H);
 
 /* Voltage alarms */
 
-static SENSOR_DEVICE_ATTR(in1_min_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_VIN_UV);
-static SENSOR_DEVICE_ATTR(in1_max_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_VIN_OV);
-static SENSOR_DEVICE_ATTR(in2_min_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_ADIN_UV);
-static SENSOR_DEVICE_ATTR(in2_max_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_ADIN_OV);
+static SENSOR_DEVICE_ATTR_RO(in1_min_alarm, ltc2945_bool, FAULT_VIN_UV);
+static SENSOR_DEVICE_ATTR_RO(in1_max_alarm, ltc2945_bool, FAULT_VIN_OV);
+static SENSOR_DEVICE_ATTR_RO(in2_min_alarm, ltc2945_bool, FAULT_ADIN_UV);
+static SENSOR_DEVICE_ATTR_RO(in2_max_alarm, ltc2945_bool, FAULT_ADIN_OV);
 
 /* Currents (via sense resistor) */
 
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_SENSE_H);
-static SENSOR_DEVICE_ATTR(curr1_min, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MIN_SENSE_THRES_H);
-static SENSOR_DEVICE_ATTR(curr1_max, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MAX_SENSE_THRES_H);
-static SENSOR_DEVICE_ATTR(curr1_lowest, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_MIN_SENSE_H);
-static SENSOR_DEVICE_ATTR(curr1_highest, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_MAX_SENSE_H);
-static SENSOR_DEVICE_ATTR(curr1_reset_history, S_IWUSR, NULL,
-			  ltc2945_reset_history, LTC2945_MIN_SENSE_H);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc2945_value, LTC2945_SENSE_H);
+static SENSOR_DEVICE_ATTR_RW(curr1_min, ltc2945_value,
+			     LTC2945_MIN_SENSE_THRES_H);
+static SENSOR_DEVICE_ATTR_RW(curr1_max, ltc2945_value,
+			     LTC2945_MAX_SENSE_THRES_H);
+static SENSOR_DEVICE_ATTR_RO(curr1_lowest, ltc2945_value, LTC2945_MIN_SENSE_H);
+static SENSOR_DEVICE_ATTR_RO(curr1_highest, ltc2945_value,
+			     LTC2945_MAX_SENSE_H);
+static SENSOR_DEVICE_ATTR_WO(curr1_reset_history, ltc2945_history,
+			     LTC2945_MIN_SENSE_H);
 
 /* Current alarms */
 
-static SENSOR_DEVICE_ATTR(curr1_min_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_SENSE_UV);
-static SENSOR_DEVICE_ATTR(curr1_max_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_SENSE_OV);
+static SENSOR_DEVICE_ATTR_RO(curr1_min_alarm, ltc2945_bool, FAULT_SENSE_UV);
+static SENSOR_DEVICE_ATTR_RO(curr1_max_alarm, ltc2945_bool, FAULT_SENSE_OV);
 
 /* Power */
 
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, ltc2945_show_value, NULL,
-			  LTC2945_POWER_H);
-static SENSOR_DEVICE_ATTR(power1_min, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MIN_POWER_THRES_H);
-static SENSOR_DEVICE_ATTR(power1_max, S_IRUGO | S_IWUSR, ltc2945_show_value,
-			  ltc2945_set_value, LTC2945_MAX_POWER_THRES_H);
-static SENSOR_DEVICE_ATTR(power1_input_lowest, S_IRUGO, ltc2945_show_value,
-			  NULL, LTC2945_MIN_POWER_H);
-static SENSOR_DEVICE_ATTR(power1_input_highest, S_IRUGO, ltc2945_show_value,
-			  NULL, LTC2945_MAX_POWER_H);
-static SENSOR_DEVICE_ATTR(power1_reset_history, S_IWUSR, NULL,
-			  ltc2945_reset_history, LTC2945_MIN_POWER_H);
+static SENSOR_DEVICE_ATTR_RO(power1_input, ltc2945_value, LTC2945_POWER_H);
+static SENSOR_DEVICE_ATTR_RW(power1_min, ltc2945_value,
+			     LTC2945_MIN_POWER_THRES_H);
+static SENSOR_DEVICE_ATTR_RW(power1_max, ltc2945_value,
+			     LTC2945_MAX_POWER_THRES_H);
+static SENSOR_DEVICE_ATTR_RO(power1_input_lowest, ltc2945_value,
+			     LTC2945_MIN_POWER_H);
+static SENSOR_DEVICE_ATTR_RO(power1_input_highest, ltc2945_value,
+			     LTC2945_MAX_POWER_H);
+static SENSOR_DEVICE_ATTR_WO(power1_reset_history, ltc2945_history,
+			     LTC2945_MIN_POWER_H);
 
 /* Power alarms */
 
-static SENSOR_DEVICE_ATTR(power1_min_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_POWER_UV);
-static SENSOR_DEVICE_ATTR(power1_max_alarm, S_IRUGO, ltc2945_show_bool, NULL,
-			  FAULT_POWER_OV);
+static SENSOR_DEVICE_ATTR_RO(power1_min_alarm, ltc2945_bool, FAULT_POWER_UV);
+static SENSOR_DEVICE_ATTR_RO(power1_max_alarm, ltc2945_bool, FAULT_POWER_OV);
 
 static struct attribute *ltc2945_attrs[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,
-- 
2.7.4
