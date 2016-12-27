Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/10] hwmon: (max1668) Prepare for auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW}
Date: Tue, 27 Dec 2016 15:28:22 -0800
Message-Id: <1482881308-13550-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW} requires that attribute
permissions match the existence of show and store functions. Update
attribute permissions to meet that requirement. The is_visible function
does not use the permission from the attribute and thus does not require
any modifications.

There is no functional change associated with this patch.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1668.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/max1668.c b/drivers/hwmon/max1668.c
index 7ca889910262..cea7ab8ae21b 100644
--- a/drivers/hwmon/max1668.c
+++ b/drivers/hwmon/max1668.c
@@ -254,29 +254,29 @@ static ssize_t set_temp_min(struct device *dev,
 }
 
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, show_temp_max,
+static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR, show_temp_max,
 				set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO, show_temp_min,
+static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO | S_IWUSR, show_temp_min,
 				set_temp_min, 0);
 static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO, show_temp_max,
+static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO | S_IWUSR, show_temp_max,
 				set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IRUGO, show_temp_min,
+static SENSOR_DEVICE_ATTR(temp2_min, S_IRUGO | S_IWUSR, show_temp_min,
 				set_temp_min, 1);
 static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IRUGO, show_temp_max,
+static SENSOR_DEVICE_ATTR(temp3_max, S_IRUGO | S_IWUSR, show_temp_max,
 				set_temp_max, 2);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IRUGO, show_temp_min,
+static SENSOR_DEVICE_ATTR(temp3_min, S_IRUGO | S_IWUSR, show_temp_min,
 				set_temp_min, 2);
 static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IRUGO, show_temp_max,
+static SENSOR_DEVICE_ATTR(temp4_max, S_IRUGO | S_IWUSR, show_temp_max,
 				set_temp_max, 3);
-static SENSOR_DEVICE_ATTR(temp4_min, S_IRUGO, show_temp_min,
+static SENSOR_DEVICE_ATTR(temp4_min, S_IRUGO | S_IWUSR, show_temp_min,
 				set_temp_min, 3);
 static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp5_max, S_IRUGO, show_temp_max,
+static SENSOR_DEVICE_ATTR(temp5_max, S_IRUGO | S_IWUSR, show_temp_max,
 				set_temp_max, 4);
-static SENSOR_DEVICE_ATTR(temp5_min, S_IRUGO, show_temp_min,
+static SENSOR_DEVICE_ATTR(temp5_min, S_IRUGO | S_IWUSR, show_temp_min,
 				set_temp_min, 4);
 
 static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 14);
-- 
2.7.4
