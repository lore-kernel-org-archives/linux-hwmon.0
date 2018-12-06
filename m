Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/13] hwmon: (ltc4260) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:26 -0800
Message-Id: <1544124153-23961-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4260.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/ltc4260.c b/drivers/hwmon/ltc4260.c
index afb09574b12c..011b1ae98ff1 100644
--- a/drivers/hwmon/ltc4260.c
+++ b/drivers/hwmon/ltc4260.c
@@ -79,7 +79,7 @@ static int ltc4260_get_value(struct device *dev, u8 reg)
 	return val;
 }
 
-static ssize_t ltc4260_show_value(struct device *dev,
+static ssize_t ltc4260_value_show(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -91,7 +91,7 @@ static ssize_t ltc4260_show_value(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", value);
 }
 
-static ssize_t ltc4260_show_bool(struct device *dev,
+static ssize_t ltc4260_bool_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -111,30 +111,24 @@ static ssize_t ltc4260_show_bool(struct device *dev,
 }
 
 /* Voltages */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc4260_show_value, NULL,
-			  LTC4260_SOURCE);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4260_show_value, NULL,
-			  LTC4260_ADIN);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc4260_value, LTC4260_SOURCE);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc4260_value, LTC4260_ADIN);
 
 /*
  * Voltage alarms
  * UV/OV faults are associated with the input voltage, and the POWER BAD and
  * FET SHORT faults are associated with the output voltage.
  */
-static SENSOR_DEVICE_ATTR(in1_min_alarm, S_IRUGO, ltc4260_show_bool, NULL,
-			  FAULT_UV);
-static SENSOR_DEVICE_ATTR(in1_max_alarm, S_IRUGO, ltc4260_show_bool, NULL,
-			  FAULT_OV);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, ltc4260_show_bool, NULL,
-			  FAULT_POWER_BAD | FAULT_FET_SHORT);
+static SENSOR_DEVICE_ATTR_RO(in1_min_alarm, ltc4260_bool, FAULT_UV);
+static SENSOR_DEVICE_ATTR_RO(in1_max_alarm, ltc4260_bool, FAULT_OV);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, ltc4260_bool,
+			     FAULT_POWER_BAD | FAULT_FET_SHORT);
 
 /* Current (via sense resistor) */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc4260_show_value, NULL,
-			  LTC4260_SENSE);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc4260_value, LTC4260_SENSE);
 
 /* Overcurrent alarm */
-static SENSOR_DEVICE_ATTR(curr1_max_alarm, S_IRUGO, ltc4260_show_bool, NULL,
-			  FAULT_OC);
+static SENSOR_DEVICE_ATTR_RO(curr1_max_alarm, ltc4260_bool, FAULT_OC);
 
 static struct attribute *ltc4260_attrs[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,
-- 
2.7.4
