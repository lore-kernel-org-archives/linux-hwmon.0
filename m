Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/10] hwmon: (wm831x-hwmon) Replace macros generating sensor attributes
Date: Tue, 27 Dec 2016 15:28:20 -0800
Message-Id: <1482881308-13550-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace macros generating sensor attributes with explicit code to ease
conversion to SENSOR_DEVICE_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/wm831x-hwmon.c | 48 ++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/wm831x-hwmon.c b/drivers/hwmon/wm831x-hwmon.c
index a16cce72e4e2..46d32ae94167 100644
--- a/drivers/hwmon/wm831x-hwmon.c
+++ b/drivers/hwmon/wm831x-hwmon.c
@@ -79,25 +79,35 @@ static ssize_t show_label(struct device *dev,
 	return sprintf(buf, "%s\n", input_names[channel]);
 }
 
-#define WM831X_VOLTAGE(id, name) \
-	static SENSOR_DEVICE_ATTR(in##id##_input, S_IRUGO, show_voltage, \
-				  NULL, name)
-
-#define WM831X_NAMED_VOLTAGE(id, name) \
-	WM831X_VOLTAGE(id, name); \
-	static SENSOR_DEVICE_ATTR(in##id##_label, S_IRUGO, show_label,	\
-				  NULL, name)
-
-WM831X_VOLTAGE(0, WM831X_AUX_AUX1);
-WM831X_VOLTAGE(1, WM831X_AUX_AUX2);
-WM831X_VOLTAGE(2, WM831X_AUX_AUX3);
-WM831X_VOLTAGE(3, WM831X_AUX_AUX4);
-
-WM831X_NAMED_VOLTAGE(4, WM831X_AUX_SYSVDD);
-WM831X_NAMED_VOLTAGE(5, WM831X_AUX_USB);
-WM831X_NAMED_VOLTAGE(6, WM831X_AUX_BATT);
-WM831X_NAMED_VOLTAGE(7, WM831X_AUX_WALL);
-WM831X_NAMED_VOLTAGE(8, WM831X_AUX_BKUP_BATT);
+static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_AUX1);
+static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_AUX2);
+static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_AUX3);
+static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_AUX4);
+static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_SYSVDD);
+static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_USB);
+static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_BATT);
+static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_WALL);
+static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, show_voltage, NULL,
+			  WM831X_AUX_BKUP_BATT);
+
+static SENSOR_DEVICE_ATTR(in4_label, S_IRUGO, show_label, NULL,
+			  WM831X_AUX_SYSVDD);
+static SENSOR_DEVICE_ATTR(in5_label, S_IRUGO, show_label, NULL,
+			  WM831X_AUX_USB);
+static SENSOR_DEVICE_ATTR(in6_label, S_IRUGO, show_label, NULL,
+			  WM831X_AUX_BATT);
+static SENSOR_DEVICE_ATTR(in7_label, S_IRUGO, show_label, NULL,
+			  WM831X_AUX_WALL);
+static SENSOR_DEVICE_ATTR(in8_label, S_IRUGO, show_label, NULL,
+			  WM831X_AUX_BKUP_BATT);
 
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_chip_temp, NULL,
 			  WM831X_AUX_CHIP_TEMP);
-- 
2.7.4
