Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35533 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbeIQV5v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Sep 2018 17:57:51 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2-v6so7673049plo.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Sep 2018 09:29:46 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6775) Only display fan speed tolerance conditionally
Date: Mon, 17 Sep 2018 09:29:42 -0700
Message-Id: <1537201782-11329-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

A fan speed tolerance only makes sense if a fan target speed has been
configured in the first place. Otherwise we get odd output such as

fan1_target:0
fan1_tolerance:337500

Only display values other than 0 if a fan target speed has been configured.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 2b493d0682af..0bb2c24d21a9 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -2847,6 +2847,8 @@ store_temp_tolerance(struct device *dev, struct device_attribute *attr,
  * Fan speed tolerance is a tricky beast, since the associated register is
  * a tick counter, but the value is reported and configured as rpm.
  * Compute resulting low and high rpm values and report the difference.
+ * A target speed tolerance only makes sense if a target speed has been
+ * configured, so only display values other than 0 if that is the case.
  */
 static ssize_t
 show_speed_tolerance(struct device *dev, struct device_attribute *attr,
@@ -2855,19 +2857,23 @@ show_speed_tolerance(struct device *dev, struct device_attribute *attr,
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
-	int low = data->target_speed[nr] - data->target_speed_tolerance[nr];
-	int high = data->target_speed[nr] + data->target_speed_tolerance[nr];
-	int tolerance;
-
-	if (low <= 0)
-		low = 1;
-	if (high > 0xffff)
-		high = 0xffff;
-	if (high < low)
-		high = low;
-
-	tolerance = (fan_from_reg16(low, data->fan_div[nr])
-		     - fan_from_reg16(high, data->fan_div[nr])) / 2;
+	int target = data->target_speed[nr];
+	int tolerance = 0;
+
+	if (target) {
+		int low = target - data->target_speed_tolerance[nr];
+		int high = target + data->target_speed_tolerance[nr];
+
+		if (low <= 0)
+			low = 1;
+		if (high > 0xffff)
+			high = 0xffff;
+		if (high < low)
+			high = low;
+
+		tolerance = (fan_from_reg16(low, data->fan_div[nr])
+			     - fan_from_reg16(high, data->fan_div[nr])) / 2;
+	}
 
 	return sprintf(buf, "%d\n", tolerance);
 }
-- 
2.7.4
