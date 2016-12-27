Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/10] hwmon: (it87) Prepare for auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW}
Date: Tue, 27 Dec 2016 15:28:21 -0800
Message-Id: <1482881308-13550-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW} requires that attribute
permissions match the existence of show and store functions. Update
permissions as well as is_visible functions to meet that requirement.
There is no functional change associated with this patch.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ef4e0527bd21..15557a76bbca 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1621,7 +1621,7 @@ static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
 static SENSOR_DEVICE_ATTR(pwm1_freq, S_IRUGO | S_IWUSR, show_pwm_freq,
 			  set_pwm_freq, 0);
-static SENSOR_DEVICE_ATTR(pwm1_auto_channels_temp, S_IRUGO,
+static SENSOR_DEVICE_ATTR(pwm1_auto_channels_temp, S_IRUGO | S_IWUSR,
 			  show_pwm_temp_map, set_pwm_temp_map, 0);
 static SENSOR_DEVICE_ATTR_2(pwm1_auto_point1_pwm, S_IRUGO | S_IWUSR,
 			    show_auto_pwm, set_auto_pwm, 0, 0);
@@ -1649,8 +1649,9 @@ static SENSOR_DEVICE_ATTR(pwm1_auto_slope, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(pwm2_enable, S_IRUGO | S_IWUSR,
 			  show_pwm_enable, set_pwm_enable, 1);
 static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm2_freq, S_IRUGO, show_pwm_freq, set_pwm_freq, 1);
-static SENSOR_DEVICE_ATTR(pwm2_auto_channels_temp, S_IRUGO,
+static SENSOR_DEVICE_ATTR(pwm2_freq, S_IRUGO | S_IWUSR, show_pwm_freq,
+			  set_pwm_freq, 1);
+static SENSOR_DEVICE_ATTR(pwm2_auto_channels_temp, S_IRUGO | S_IWUSR,
 			  show_pwm_temp_map, set_pwm_temp_map, 1);
 static SENSOR_DEVICE_ATTR_2(pwm2_auto_point1_pwm, S_IRUGO | S_IWUSR,
 			    show_auto_pwm, set_auto_pwm, 1, 0);
@@ -1679,7 +1680,7 @@ static SENSOR_DEVICE_ATTR(pwm3_enable, S_IRUGO | S_IWUSR,
 			  show_pwm_enable, set_pwm_enable, 2);
 static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 2);
 static SENSOR_DEVICE_ATTR(pwm3_freq, S_IRUGO, show_pwm_freq, NULL, 2);
-static SENSOR_DEVICE_ATTR(pwm3_auto_channels_temp, S_IRUGO,
+static SENSOR_DEVICE_ATTR(pwm3_auto_channels_temp, S_IRUGO | S_IWUSR,
 			  show_pwm_temp_map, set_pwm_temp_map, 2);
 static SENSOR_DEVICE_ATTR_2(pwm3_auto_point1_pwm, S_IRUGO | S_IWUSR,
 			    show_auto_pwm, set_auto_pwm, 2, 0);
@@ -1708,7 +1709,7 @@ static SENSOR_DEVICE_ATTR(pwm4_enable, S_IRUGO | S_IWUSR,
 			  show_pwm_enable, set_pwm_enable, 3);
 static SENSOR_DEVICE_ATTR(pwm4, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 3);
 static SENSOR_DEVICE_ATTR(pwm4_freq, S_IRUGO, show_pwm_freq, NULL, 3);
-static SENSOR_DEVICE_ATTR(pwm4_auto_channels_temp, S_IRUGO,
+static SENSOR_DEVICE_ATTR(pwm4_auto_channels_temp, S_IRUGO | S_IWUSR,
 			  show_pwm_temp_map, set_pwm_temp_map, 3);
 static SENSOR_DEVICE_ATTR_2(pwm4_auto_point1_temp, S_IRUGO | S_IWUSR,
 			    show_auto_temp, set_auto_temp, 2, 1);
@@ -1727,7 +1728,7 @@ static SENSOR_DEVICE_ATTR(pwm5_enable, S_IRUGO | S_IWUSR,
 			  show_pwm_enable, set_pwm_enable, 4);
 static SENSOR_DEVICE_ATTR(pwm5, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 4);
 static SENSOR_DEVICE_ATTR(pwm5_freq, S_IRUGO, show_pwm_freq, NULL, 4);
-static SENSOR_DEVICE_ATTR(pwm5_auto_channels_temp, S_IRUGO,
+static SENSOR_DEVICE_ATTR(pwm5_auto_channels_temp, S_IRUGO | S_IWUSR,
 			  show_pwm_temp_map, set_pwm_temp_map, 4);
 static SENSOR_DEVICE_ATTR_2(pwm5_auto_point1_temp, S_IRUGO | S_IWUSR,
 			    show_auto_temp, set_auto_temp, 2, 1);
@@ -1746,7 +1747,7 @@ static SENSOR_DEVICE_ATTR(pwm6_enable, S_IRUGO | S_IWUSR,
 			  show_pwm_enable, set_pwm_enable, 5);
 static SENSOR_DEVICE_ATTR(pwm6, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 5);
 static SENSOR_DEVICE_ATTR(pwm6_freq, S_IRUGO, show_pwm_freq, NULL, 5);
-static SENSOR_DEVICE_ATTR(pwm6_auto_channels_temp, S_IRUGO,
+static SENSOR_DEVICE_ATTR(pwm6_auto_channels_temp, S_IRUGO | S_IWUSR,
 			  show_pwm_temp_map, set_pwm_temp_map, 5);
 static SENSOR_DEVICE_ATTR_2(pwm6_auto_point1_temp, S_IRUGO | S_IWUSR,
 			    show_auto_temp, set_auto_temp, 2, 1);
@@ -2199,12 +2200,12 @@ static umode_t it87_pwm_is_visible(struct kobject *kobj,
 		return 0;
 
 	/* pwmX_auto_channels_temp is only writable if auto pwm is supported */
-	if (a == 3 && (has_old_autopwm(data) || has_newer_autopwm(data)))
-		return attr->mode | S_IWUSR;
+	if (a == 3 && !has_old_autopwm(data) && !has_newer_autopwm(data))
+		return attr->mode & ~0200;
 
 	/* pwm2_freq is writable if there are two pwm frequency selects */
-	if (has_pwm_freq2(data) && i == 1 && a == 2)
-		return attr->mode | S_IWUSR;
+	if (!has_pwm_freq2(data) && i == 1 && a == 2)
+		return attr->mode & ~0200;
 
 	return attr->mode;
 }
-- 
2.7.4
