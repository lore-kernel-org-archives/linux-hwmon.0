Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53248 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752784AbdBISPE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Feb 2017 13:15:04 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/7] hwmon: (it87) Do not overwrite bit 2..6 of pwm control registers
Date: Thu,  9 Feb 2017 07:06:14 -0800
Message-Id: <1486652775-3926-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
References: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

In IT8620E, after setting pwm control to manual, it was observed that
pwm values for fan 4..6 have reversed results (writing 0 results in fans
running at full speed, writing 255 results in fans turned off).

With the new PWM control, pwm polarity for pwm control 4..6 is specified
in its pwm control registers. Those registers are overwritten when setting
the pwm mode or the temperature mapping. Do not touch bit 2..6 of pwm
control registers on register writes to fix the problem.

Cc: stable@vger.kernel.org # 4.9+
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4f3fabcd470d..37acb38b5e17 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1316,25 +1316,35 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 			it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
 					 data->fan_main_ctrl);
 		} else {
+			u8 ctrl;
+
 			/* No on/off mode, set maximum pwm value */
 			data->pwm_duty[nr] = pwm_to_reg(data, 0xff);
 			it87_write_value(data, IT87_REG_PWM_DUTY[nr],
 					 data->pwm_duty[nr]);
 			/* and set manual mode */
-			data->pwm_ctrl[nr] = has_newer_autopwm(data) ?
-					     data->pwm_temp_map[nr] :
-					     data->pwm_duty[nr];
-			it87_write_value(data, IT87_REG_PWM[nr],
-					 data->pwm_ctrl[nr]);
+			if (has_newer_autopwm(data)) {
+				ctrl = (data->pwm_ctrl[nr] & 0x7c) |
+					data->pwm_temp_map[nr];
+			} else {
+				ctrl = data->pwm_duty[nr];
+			}
+			data->pwm_ctrl[nr] = ctrl;
+			it87_write_value(data, IT87_REG_PWM[nr], ctrl);
 		}
 	} else {
-		if (val == 1)				/* Manual mode */
-			data->pwm_ctrl[nr] = has_newer_autopwm(data) ?
-					     data->pwm_temp_map[nr] :
-					     data->pwm_duty[nr];
-		else					/* Automatic mode */
-			data->pwm_ctrl[nr] = 0x80 | data->pwm_temp_map[nr];
-		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
+		u8 ctrl;
+
+		if (has_newer_autopwm(data)) {
+			ctrl = (data->pwm_ctrl[nr] & 0x7c) |
+				data->pwm_temp_map[nr];
+			if (val != 1)
+				ctrl |= 0x80;
+		} else {
+			ctrl = (val == 1 ? data->pwm_duty[nr] : 0x80);
+		}
+		data->pwm_ctrl[nr] = ctrl;
+		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
 
 		if (data->type != it8603 && nr < 3) {
 			/* set SmartGuardian mode */
@@ -1480,7 +1490,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	 * otherwise, just store it for later use.
 	 */
 	if (data->pwm_ctrl[nr] & 0x80) {
-		data->pwm_ctrl[nr] = 0x80 | data->pwm_temp_map[nr];
+		data->pwm_ctrl[nr] = (data->pwm_ctrl[nr] & 0xfc) |
+						data->pwm_temp_map[nr];
 		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
 	}
 	mutex_unlock(&data->update_lock);
-- 
2.7.4

