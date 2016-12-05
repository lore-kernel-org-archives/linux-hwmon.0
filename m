Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51324 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGEQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:04:16 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/17] hwmon: (adt7462) Fix overflows seen when writing into limit attributes
Date: Sun,  4 Dec 2016 20:55:30 -0800
Message-Id: <1480913740-5678-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix overflows seen when writing large values into temperature limit,
voltage limit, and pwm hysteresis attributes.

The input parameter to DIV_ROUND_CLOSEST() needs to be clamped to avoid
such overflows.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7462.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 5929e126da63..0e9c8d3e8f5c 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -810,8 +810,7 @@ static ssize_t set_temp_min(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !temp_enabled(data, attr->index))
 		return -EINVAL;
 
-	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
-	temp = clamp_val(temp, 0, 255);
+	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -64000, 191000), 1000) + 64;
 
 	mutex_lock(&data->lock);
 	data->temp_min[attr->index] = temp;
@@ -848,8 +847,7 @@ static ssize_t set_temp_max(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !temp_enabled(data, attr->index))
 		return -EINVAL;
 
-	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
-	temp = clamp_val(temp, 0, 255);
+	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -64000, 191000), 1000) + 64;
 
 	mutex_lock(&data->lock);
 	data->temp_max[attr->index] = temp;
@@ -912,6 +910,7 @@ static ssize_t set_volt_max(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !x)
 		return -EINVAL;
 
+	temp = clamp_val(temp, 0, INT_MAX / 1000 - x);
 	temp *= 1000; /* convert mV to uV */
 	temp = DIV_ROUND_CLOSEST(temp, x);
 	temp = clamp_val(temp, 0, 255);
@@ -954,6 +953,7 @@ static ssize_t set_volt_min(struct device *dev,
 	if (kstrtol(buf, 10, &temp) || !x)
 		return -EINVAL;
 
+	temp = clamp_val(temp, 0, INT_MAX / 1000 - x);
 	temp *= 1000; /* convert mV to uV */
 	temp = DIV_ROUND_CLOSEST(temp, x);
 	temp = clamp_val(temp, 0, 255);
@@ -1220,8 +1220,7 @@ static ssize_t set_pwm_hyst(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = DIV_ROUND_CLOSEST(temp, 1000);
-	temp = clamp_val(temp, 0, 15);
+	temp = DIV_ROUND_CLOSEST(clamp_val(temp, 0, 15000), 1000);
 
 	/* package things up */
 	temp &= ADT7462_PWM_HYST_MASK;
@@ -1306,8 +1305,7 @@ static ssize_t set_pwm_tmin(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
-	temp = clamp_val(temp, 0, 255);
+	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -64000, 191000), 1000) + 64;
 
 	mutex_lock(&data->lock);
 	data->pwm_tmin[attr->index] = temp;
-- 
2.5.0

