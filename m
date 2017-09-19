Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Tue, 19 Sep 2017 14:59:34 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Andrea Merello <andrea.merello@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH] hwmon: (stts751) Fix buffer size passed to snprintf
Message-ID: <20170919145934.4da22fa6@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Function snprintf already cares for the terminating NUL at the end of
the string, the caller doesn't need to do it.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Andrea Merello <andrea.merello@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/stts751.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- linux-4.14-rc1.orig/drivers/hwmon/stts751.c	2017-09-17 00:47:51.000000000 +0200
+++ linux-4.14-rc1/drivers/hwmon/stts751.c	2017-09-19 14:51:39.773843565 +0200
@@ -396,7 +396,7 @@ static ssize_t show_max_alarm(struct dev
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->max_alert);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->max_alert);
 }
 
 static ssize_t show_min_alarm(struct device *dev, struct device_attribute *attr,
@@ -413,7 +413,7 @@ static ssize_t show_min_alarm(struct dev
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->min_alert);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->min_alert);
 }
 
 static ssize_t show_input(struct device *dev, struct device_attribute *attr,
@@ -428,7 +428,7 @@ static ssize_t show_input(struct device
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->temp);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->temp);
 }
 
 static ssize_t show_therm(struct device *dev, struct device_attribute *attr,
@@ -436,7 +436,7 @@ static ssize_t show_therm(struct device
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->therm);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm);
 }
 
 static ssize_t set_therm(struct device *dev, struct device_attribute *attr,
@@ -478,7 +478,7 @@ static ssize_t show_hyst(struct device *
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->hyst);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->hyst);
 }
 
 static ssize_t set_hyst(struct device *dev, struct device_attribute *attr,
@@ -518,7 +518,7 @@ static ssize_t show_therm_trip(struct de
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->therm_trip);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm_trip);
 }
 
 static ssize_t show_max(struct device *dev, struct device_attribute *attr,
@@ -526,7 +526,7 @@ static ssize_t show_max(struct device *d
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->event_max);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_max);
 }
 
 static ssize_t set_max(struct device *dev, struct device_attribute *attr,
@@ -560,7 +560,7 @@ static ssize_t show_min(struct device *d
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->event_min);
+	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_min);
 }
 
 static ssize_t set_min(struct device *dev, struct device_attribute *attr,
@@ -594,7 +594,7 @@ static ssize_t show_interval(struct devi
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n",
+	return snprintf(buf, PAGE_SIZE, "%d\n",
 			stts751_intervals[priv->interval]);
 }
 


-- 
Jean Delvare
SUSE L3 Support
