Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50239 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752126AbcLHT0w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 14:26:52 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: (adt7462) Fix overflows seen when writing into limit attributes
Date: Thu,  8 Dec 2016 11:26:49 -0800
Message-Id: <1481225209-12936-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix overflows seen when writing large values into temperature limit,
voltage limit, and pwm hysteresis attributes.

The input parameter to DIV_ROUND_CLOSEST() needs to be clamped to avoid
such overflows.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Simplified clamping
    Separate clamp_val() and DIV_ROUND_CLOSEST() into two lines.

 drivers/hwmon/adt7462.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 5929e126da63..19f2a6d48bac 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -810,8 +810,8 @@ static ssize_t set_temp_min(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !temp_enabled(data, attr->index))
 		return -EINVAL;
 
+	temp = clamp_val(temp, -64000, 191000);
 	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
-	temp = clamp_val(temp, 0, 255);
 
 	mutex_lock(&data->lock);
 	data->temp_min[attr->index] = temp;
@@ -848,8 +848,8 @@ static ssize_t set_temp_max(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !temp_enabled(data, attr->index))
 		return -EINVAL;
 
+	temp = clamp_val(temp, -64000, 191000);
 	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
-	temp = clamp_val(temp, 0, 255);
 
 	mutex_lock(&data->lock);
 	data->temp_max[attr->index] = temp;
@@ -912,9 +912,9 @@ static ssize_t set_volt_max(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !x)
 		return -EINVAL;
 
+	temp = clamp_val(temp, 0, 255 * x / 1000);
 	temp *= 1000; /* convert mV to uV */
 	temp = DIV_ROUND_CLOSEST(temp, x);
-	temp = clamp_val(temp, 0, 255);
 
 	mutex_lock(&data->lock);
 	data->volt_max[attr->index] = temp;
@@ -954,9 +954,9 @@ static ssize_t set_volt_min(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !x)
 		return -EINVAL;
 
+	temp = clamp_val(temp, 0, 255 * x / 1000);
 	temp *= 1000; /* convert mV to uV */
 	temp = DIV_ROUND_CLOSEST(temp, x);
-	temp = clamp_val(temp, 0, 255);
 
 	mutex_lock(&data->lock);
 	data->volt_min[attr->index] = temp;
@@ -1220,8 +1220,8 @@ static ssize_t set_pwm_hyst(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
+	temp = clamp_val(temp, 0, 15000);
 	temp = DIV_ROUND_CLOSEST(temp, 1000);
-	temp = clamp_val(temp, 0, 15);
 
 	/* package things up */
 	temp &= ADT7462_PWM_HYST_MASK;
@@ -1306,8 +1306,8 @@ static ssize_t set_pwm_tmin(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
+	temp = clamp_val(temp, -64000, 191000);
 	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
-	temp = clamp_val(temp, 0, 255);
 
 	mutex_lock(&data->lock);
 	data->pwm_tmin[attr->index] = temp;
-- 
2.5.0

