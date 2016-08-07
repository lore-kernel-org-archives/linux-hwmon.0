Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (lm95241) Use more accurate limits
Date: Sun,  7 Aug 2016 16:32:00 -0700
Message-Id: <1470612720-30165-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
References: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The lower temperature limit is -128 degrees C. The supported upper limits
are 127.875 or 255.875 degrees C. Also, don't fail if a value outside
the supported range is provided when setting a temperature limit.
Instead, clamp the provided value to the available value range.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index df94f486b21c..3d96c3fcba9b 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -205,7 +205,7 @@ static ssize_t show_min(struct device *dev, struct device_attribute *attr,
 
 	return snprintf(buf, PAGE_SIZE - 1,
 			data->config & to_sensor_dev_attr(attr)->index ?
-			"-127000\n" : "0\n");
+			"-128000\n" : "0\n");
 }
 
 static ssize_t set_min(struct device *dev, struct device_attribute *attr,
@@ -216,8 +216,6 @@ static ssize_t set_min(struct device *dev, struct device_attribute *attr,
 
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
-	if (val < -128000)
-		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
 
@@ -242,7 +240,7 @@ static ssize_t show_max(struct device *dev, struct device_attribute *attr,
 
 	return snprintf(buf, PAGE_SIZE - 1,
 			data->config & to_sensor_dev_attr(attr)->index ?
-			"127000\n" : "255000\n");
+			"127875\n" : "255875\n");
 }
 
 static ssize_t set_max(struct device *dev, struct device_attribute *attr,
@@ -253,8 +251,6 @@ static ssize_t set_max(struct device *dev, struct device_attribute *attr,
 
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
-	if (val >= 256000)
-		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
 
-- 
2.5.0
