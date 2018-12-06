Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/13] hwmon: (ina2xx) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:32 -0800
Message-Id: <1544124153-23961-13-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 07ee19573b3f..290379c49be9 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -290,7 +290,7 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 	return val;
 }
 
-static ssize_t ina2xx_show_value(struct device *dev,
+static ssize_t ina2xx_value_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -329,16 +329,15 @@ static int ina2xx_set_shunt(struct ina2xx_data *data, long val)
 	return 0;
 }
 
-static ssize_t ina2xx_show_shunt(struct device *dev,
-			      struct device_attribute *da,
-			      char *buf)
+static ssize_t ina2xx_shunt_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%li\n", data->rshunt);
 }
 
-static ssize_t ina2xx_store_shunt(struct device *dev,
+static ssize_t ina2xx_shunt_store(struct device *dev,
 				  struct device_attribute *da,
 				  const char *buf, size_t count)
 {
@@ -356,9 +355,9 @@ static ssize_t ina2xx_store_shunt(struct device *dev,
 	return count;
 }
 
-static ssize_t ina226_set_interval(struct device *dev,
-				   struct device_attribute *da,
-				   const char *buf, size_t count)
+static ssize_t ina226_interval_store(struct device *dev,
+				     struct device_attribute *da,
+				     const char *buf, size_t count)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -380,7 +379,7 @@ static ssize_t ina226_set_interval(struct device *dev,
 	return count;
 }
 
-static ssize_t ina226_show_interval(struct device *dev,
+static ssize_t ina226_interval_show(struct device *dev,
 				    struct device_attribute *da, char *buf)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
@@ -395,29 +394,22 @@ static ssize_t ina226_show_interval(struct device *dev,
 }
 
 /* shunt voltage */
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ina2xx_show_value, NULL,
-			  INA2XX_SHUNT_VOLTAGE);
+static SENSOR_DEVICE_ATTR_RO(in0_input, ina2xx_value, INA2XX_SHUNT_VOLTAGE);
 
 /* bus voltage */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ina2xx_show_value, NULL,
-			  INA2XX_BUS_VOLTAGE);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ina2xx_value, INA2XX_BUS_VOLTAGE);
 
 /* calculated current */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ina2xx_show_value, NULL,
-			  INA2XX_CURRENT);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
 
 /* calculated power */
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, ina2xx_show_value, NULL,
-			  INA2XX_POWER);
+static SENSOR_DEVICE_ATTR_RO(power1_input, ina2xx_value, INA2XX_POWER);
 
 /* shunt resistance */
-static SENSOR_DEVICE_ATTR(shunt_resistor, S_IRUGO | S_IWUSR,
-			  ina2xx_show_shunt, ina2xx_store_shunt,
-			  INA2XX_CALIBRATION);
+static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ina2xx_shunt, INA2XX_CALIBRATION);
 
 /* update interval (ina226 only) */
-static SENSOR_DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
-			  ina226_show_interval, ina226_set_interval, 0);
+static SENSOR_DEVICE_ATTR_RW(update_interval, ina226_interval, 0);
 
 /* pointers to created device attributes */
 static struct attribute *ina2xx_attrs[] = {
-- 
2.7.4
