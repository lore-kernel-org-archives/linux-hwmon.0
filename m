Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/13] hwmon: (max6650) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:27 -0800
Message-Id: <1544124153-23961-8-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 65be4b19fe47..4752a9ee9645 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -209,8 +209,8 @@ static int max6650_set_operating_mode(struct max6650_data *data, u8 mode)
 	return 0;
 }
 
-static ssize_t get_fan(struct device *dev, struct device_attribute *devattr,
-		       char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max6650_data *data = max6650_update_device(dev);
@@ -514,8 +514,8 @@ static ssize_t fan1_div_store(struct device *dev,
  * 1 = alarm
  */
 
-static ssize_t get_alarm(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
+static ssize_t alarm_show(struct device *dev,
+			  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max6650_data *data = max6650_update_device(dev);
@@ -534,24 +534,19 @@ static ssize_t get_alarm(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", alarm);
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
 static DEVICE_ATTR_RW(fan1_target);
 static DEVICE_ATTR_RW(fan1_div);
 static DEVICE_ATTR_RW(pwm1_enable);
 static DEVICE_ATTR_RW(pwm1);
-static SENSOR_DEVICE_ATTR(fan1_max_alarm, S_IRUGO, get_alarm, NULL,
-			  MAX6650_ALRM_MAX);
-static SENSOR_DEVICE_ATTR(fan1_min_alarm, S_IRUGO, get_alarm, NULL,
-			  MAX6650_ALRM_MIN);
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, get_alarm, NULL,
-			  MAX6650_ALRM_TACH);
-static SENSOR_DEVICE_ATTR(gpio1_alarm, S_IRUGO, get_alarm, NULL,
-			  MAX6650_ALRM_GPIO1);
-static SENSOR_DEVICE_ATTR(gpio2_alarm, S_IRUGO, get_alarm, NULL,
-			  MAX6650_ALRM_GPIO2);
+static SENSOR_DEVICE_ATTR_RO(fan1_max_alarm, alarm, MAX6650_ALRM_MAX);
+static SENSOR_DEVICE_ATTR_RO(fan1_min_alarm, alarm, MAX6650_ALRM_MIN);
+static SENSOR_DEVICE_ATTR_RO(fan1_fault, alarm, MAX6650_ALRM_TACH);
+static SENSOR_DEVICE_ATTR_RO(gpio1_alarm, alarm, MAX6650_ALRM_GPIO1);
+static SENSOR_DEVICE_ATTR_RO(gpio2_alarm, alarm, MAX6650_ALRM_GPIO2);
 
 static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 				    int n)
-- 
2.7.4
