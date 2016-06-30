Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 3/4] hwmon: (lm75) Add update_interval attribute
Date: Wed, 29 Jun 2016 23:45:27 -0700
Message-Id: <1467269128-7448-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467269128-7448-1-git-send-email-linux@roeck-us.net>
References: <1467269128-7448-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Since we know the chip's update interval, let's make it available
to the user.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2, v3: No change

 drivers/hwmon/lm75.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 7b18cbd4a5ec..fe83f70ba62a 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -159,16 +159,29 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
+static ssize_t show_update_interval(struct device *dev,
+				    struct device_attribute *da, char *buf)
+{
+	struct lm75_data *data = lm75_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return sprintf(buf, "%u\n", jiffies_to_msecs(data->sample_time));
+}
+
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
 			show_temp, set_temp, 1);
 static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
 			show_temp, set_temp, 2);
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
+static DEVICE_ATTR(update_interval, S_IRUGO, show_update_interval, NULL);
 
 static struct attribute *lm75_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
 	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
+	&dev_attr_update_interval.attr,
 
 	NULL
 };
-- 
2.5.0
