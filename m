Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/13] hwmon: (ntc_thermistor) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:28 -0800
Message-Id: <1544124153-23961-9-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ntc_thermistor.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 56d83b2472c8..2823aff82c82 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -601,14 +601,14 @@ static int ntc_read_temp(void *data, int *temp)
 	return 0;
 }
 
-static ssize_t ntc_show_type(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t ntc_type_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "4\n");
 }
 
-static ssize_t ntc_show_temp(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t ntc_temp_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct ntc_data *data = dev_get_drvdata(dev);
 	int ohm;
@@ -620,8 +620,8 @@ static ssize_t ntc_show_temp(struct device *dev,
 	return sprintf(buf, "%d\n", get_temp_mc(data, ohm));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_type, S_IRUGO, ntc_show_type, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ntc_show_temp, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_type, ntc_type, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, ntc_temp, 0);
 
 static struct attribute *ntc_attrs[] = {
 	&sensor_dev_attr_temp1_type.dev_attr.attr,
-- 
2.7.4
