Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/13] hwmon: (k10temp) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:23 -0800
Message-Id: <1544124153-23961-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Auto-conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/blob/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 2cef0c37ff6f..cd601cd6f88a 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -191,7 +191,7 @@ static ssize_t temp1_max_show(struct device *dev,
 	return sprintf(buf, "%d\n", 70 * 1000);
 }
 
-static ssize_t show_temp_crit(struct device *dev,
+static ssize_t temp_crit_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -209,12 +209,12 @@ static ssize_t show_temp_crit(struct device *dev,
 
 static DEVICE_ATTR_RO(temp1_input);
 static DEVICE_ATTR_RO(temp1_max);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp_crit, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO, show_temp_crit, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_hyst, temp_crit, 1);
 
-static SENSOR_DEVICE_ATTR(temp1_label, 0444, temp_label_show, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_label, temp_label, 0);
 static DEVICE_ATTR_RO(temp2_input);
-static SENSOR_DEVICE_ATTR(temp2_label, 0444, temp_label_show, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_label, temp_label, 1);
 
 static umode_t k10temp_is_visible(struct kobject *kobj,
 				  struct attribute *attr, int index)
-- 
2.7.4
