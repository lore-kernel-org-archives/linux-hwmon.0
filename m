Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/10] hwmon: (ultra45_env) Replace macros generating sensor attributes
Date: Tue, 27 Dec 2016 15:28:24 -0800
Message-Id: <1482881308-13550-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace macros generating sensor attributes with explicit code
to simplify conversion to SENSOR_DEVICE_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ultra45_env.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/ultra45_env.c b/drivers/hwmon/ultra45_env.c
index f2816c7c918f..a74f21d6e0bc 100644
--- a/drivers/hwmon/ultra45_env.c
+++ b/drivers/hwmon/ultra45_env.c
@@ -144,17 +144,25 @@ static ssize_t show_fan_fault(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (val & (1 << fan_nr)) ? 1 : 0);
 }
 
-#define fan(index)							\
-static SENSOR_DEVICE_ATTR(fan##index##_speed, S_IRUGO | S_IWUSR,	\
-		show_fan_speed, set_fan_speed, index);			\
-static SENSOR_DEVICE_ATTR(fan##index##_fault, S_IRUGO,			\
-		show_fan_fault, NULL, index)
-
-fan(0);
-fan(1);
-fan(2);
-fan(3);
-fan(4);
+static SENSOR_DEVICE_ATTR(fan0_speed, S_IRUGO | S_IWUSR,
+			  show_fan_speed, set_fan_speed, 0);
+static SENSOR_DEVICE_ATTR(fan0_fault, S_IRUGO, show_fan_fault, NULL, 0);
+
+static SENSOR_DEVICE_ATTR(fan1_speed, S_IRUGO | S_IWUSR,
+			  show_fan_speed, set_fan_speed, 1);
+static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, show_fan_fault, NULL, 1);
+
+static SENSOR_DEVICE_ATTR(fan2_speed, S_IRUGO | S_IWUSR,
+			  show_fan_speed, set_fan_speed, 2);
+static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, show_fan_fault, NULL, 2);
+
+static SENSOR_DEVICE_ATTR(fan3_speed, S_IRUGO | S_IWUSR,
+			  show_fan_speed, set_fan_speed, 3);
+static SENSOR_DEVICE_ATTR(fan3_fault, S_IRUGO, show_fan_fault, NULL, 3);
+
+static SENSOR_DEVICE_ATTR(fan4_speed, S_IRUGO | S_IWUSR,
+			  show_fan_speed, set_fan_speed, 4);
+static SENSOR_DEVICE_ATTR(fan4_fault, S_IRUGO, show_fan_fault, NULL, 4);
 
 static SENSOR_DEVICE_ATTR(psu_fan_fault, S_IRUGO, show_fan_fault, NULL, 6);
 
-- 
2.7.4
