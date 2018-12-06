Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/13] hwmon: (ltc4215) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:33 -0800
Message-Id: <1544124153-23961-14-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4215.c | 42 ++++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/ltc4215.c b/drivers/hwmon/ltc4215.c
index c8a9bd9b050f..d4a1d033d3e8 100644
--- a/drivers/hwmon/ltc4215.c
+++ b/drivers/hwmon/ltc4215.c
@@ -136,9 +136,8 @@ static unsigned int ltc4215_get_current(struct device *dev)
 	return curr;
 }
 
-static ssize_t ltc4215_show_voltage(struct device *dev,
-				    struct device_attribute *da,
-				    char *buf)
+static ssize_t ltc4215_voltage_show(struct device *dev,
+				    struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	const int voltage = ltc4215_get_voltage(dev, attr->index);
@@ -146,18 +145,16 @@ static ssize_t ltc4215_show_voltage(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", voltage);
 }
 
-static ssize_t ltc4215_show_current(struct device *dev,
-				    struct device_attribute *da,
-				    char *buf)
+static ssize_t ltc4215_current_show(struct device *dev,
+				    struct device_attribute *da, char *buf)
 {
 	const unsigned int curr = ltc4215_get_current(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", curr);
 }
 
-static ssize_t ltc4215_show_power(struct device *dev,
-				  struct device_attribute *da,
-				  char *buf)
+static ssize_t ltc4215_power_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
 {
 	const unsigned int curr = ltc4215_get_current(dev);
 	const int output_voltage = ltc4215_get_voltage(dev, LTC4215_ADIN);
@@ -168,9 +165,8 @@ static ssize_t ltc4215_show_power(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", power);
 }
 
-static ssize_t ltc4215_show_alarm(struct device *dev,
-					  struct device_attribute *da,
-					  char *buf)
+static ssize_t ltc4215_alarm_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ltc4215_data *data = ltc4215_update_device(dev);
@@ -189,26 +185,20 @@ static ssize_t ltc4215_show_alarm(struct device *dev,
 /* Construct a sensor_device_attribute structure for each register */
 
 /* Current */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc4215_show_current, NULL, 0);
-static SENSOR_DEVICE_ATTR(curr1_max_alarm, S_IRUGO, ltc4215_show_alarm, NULL,
-			  1 << 2);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ltc4215_current, 0);
+static SENSOR_DEVICE_ATTR_RO(curr1_max_alarm, ltc4215_alarm, 1 << 2);
 
 /* Power (virtual) */
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, ltc4215_show_power, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(power1_input, ltc4215_power, 0);
 
 /* Input Voltage */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc4215_show_voltage, NULL,
-			  LTC4215_ADIN);
-static SENSOR_DEVICE_ATTR(in1_max_alarm, S_IRUGO, ltc4215_show_alarm, NULL,
-			  1 << 0);
-static SENSOR_DEVICE_ATTR(in1_min_alarm, S_IRUGO, ltc4215_show_alarm, NULL,
-			  1 << 1);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ltc4215_voltage, LTC4215_ADIN);
+static SENSOR_DEVICE_ATTR_RO(in1_max_alarm, ltc4215_alarm, 1 << 0);
+static SENSOR_DEVICE_ATTR_RO(in1_min_alarm, ltc4215_alarm, 1 << 1);
 
 /* Output Voltage */
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4215_show_voltage, NULL,
-			  LTC4215_SOURCE);
-static SENSOR_DEVICE_ATTR(in2_min_alarm, S_IRUGO, ltc4215_show_alarm, NULL,
-			  1 << 3);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ltc4215_voltage, LTC4215_SOURCE);
+static SENSOR_DEVICE_ATTR_RO(in2_min_alarm, ltc4215_alarm, 1 << 3);
 
 /*
  * Finally, construct an array of pointers to members of the above objects,
-- 
2.7.4
