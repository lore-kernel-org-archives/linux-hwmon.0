Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:44458 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752490AbeC0Pxd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Mar 2018 11:53:33 -0400
Received: by mail-pl0-f67.google.com with SMTP id 9-v6so14337287ple.11
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Mar 2018 08:53:33 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6775) Fix writing pwmX_mode
Date: Tue, 27 Mar 2018 08:53:30 -0700
Message-Id: <1522166010-5406-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

pwmX_mode is defined in the ABI as 0=DC mode, 1=pwm mode. The chip
register bit is set to 1 for DC mode. This got mixed up, and writing
1 into pwmX_mode resulted in DC mode enabled. Fix it up by using
the ABI definition throughout the driver for consistency.

Fixes: 77eb5b3703d99 ("hwmon: (nct6775) Add support for pwm, pwm_mode, ... ")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index fdf24f008d75..aebce560bfaf 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1513,7 +1513,7 @@ static void nct6775_update_pwm(struct device *dev)
 		duty_is_dc = data->REG_PWM_MODE[i] &&
 		  (nct6775_read_value(data, data->REG_PWM_MODE[i])
 		   & data->PWM_MODE_MASK[i]);
-		data->pwm_mode[i] = duty_is_dc;
+		data->pwm_mode[i] = !duty_is_dc;
 
 		fanmodecfg = nct6775_read_value(data, data->REG_FAN_MODE[i]);
 		for (j = 0; j < ARRAY_SIZE(data->REG_PWM); j++) {
@@ -2397,7 +2397,7 @@ show_pwm_mode(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
-	return sprintf(buf, "%d\n", !data->pwm_mode[sattr->index]);
+	return sprintf(buf, "%d\n", data->pwm_mode[sattr->index]);
 }
 
 static ssize_t
@@ -2418,9 +2418,9 @@ store_pwm_mode(struct device *dev, struct device_attribute *attr,
 	if (val > 1)
 		return -EINVAL;
 
-	/* Setting DC mode is not supported for all chips/channels */
+	/* Setting DC mode (0) is not supported for all chips/channels */
 	if (data->REG_PWM_MODE[nr] == 0) {
-		if (val)
+		if (!val)
 			return -EINVAL;
 		return count;
 	}
@@ -2429,7 +2429,7 @@ store_pwm_mode(struct device *dev, struct device_attribute *attr,
 	data->pwm_mode[nr] = val;
 	reg = nct6775_read_value(data, data->REG_PWM_MODE[nr]);
 	reg &= ~data->PWM_MODE_MASK[nr];
-	if (val)
+	if (!val)
 		reg |= data->PWM_MODE_MASK[nr];
 	nct6775_write_value(data, data->REG_PWM_MODE[nr], reg);
 	mutex_unlock(&data->update_lock);
-- 
2.7.4

