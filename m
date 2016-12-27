Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/10] hwmon: (f75375s) Replace function macro with explicit code
Date: Tue, 27 Dec 2016 15:28:23 -0800
Message-Id: <1482881308-13550-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace function macro with explicit code to to reduce code obfuscation
and to enable auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/f75375s.c | 48 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
index 80c42bea90ed..652ca4b34137 100644
--- a/drivers/hwmon/f75375s.c
+++ b/drivers/hwmon/f75375s.c
@@ -655,19 +655,41 @@ static ssize_t set_temp_max_hyst(struct device *dev,
 	return count;
 }
 
-#define show_fan(thing) \
-static ssize_t show_##thing(struct device *dev, struct device_attribute *attr, \
-			char *buf)\
-{\
-	int nr = to_sensor_dev_attr(attr)->index;\
-	struct f75375_data *data = f75375_update_device(dev); \
-	return sprintf(buf, "%d\n", rpm_from_reg(data->thing[nr])); \
-}
-
-show_fan(fan);
-show_fan(fan_min);
-show_fan(fan_max);
-show_fan(fan_target);
+static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", rpm_from_reg(data->fan[nr]));
+}
+
+static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", rpm_from_reg(data->fan_min[nr]));
+}
+
+static ssize_t show_fan_max(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", rpm_from_reg(data->fan_max[nr]));
+}
+
+static ssize_t show_fan_target(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", rpm_from_reg(data->fan_target[nr]));
+}
 
 static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, show_in, NULL, 0);
 static SENSOR_DEVICE_ATTR(in0_max, S_IRUGO|S_IWUSR,
-- 
2.7.4
