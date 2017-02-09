Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57330 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751670AbdBIRSK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Feb 2017 12:18:10 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/7] hwmon: (it87) Ensure that pwm control cache is current before updating values
Date: Thu,  9 Feb 2017 07:06:12 -0800
Message-Id: <1486652775-3926-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
References: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If sensor attributes were never read, the pwm control data has not been
initiialized, which can cause wrong driver behavior. Ensure that cached
data is current before acting on it.

Cc: stable@vger.kernel.org # 4.4+
Reported-by: Kevin Folz <kfolz@evertz.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 11a28b233006..85918d8a747a 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1360,6 +1360,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
+	it87_update_pwm_ctrl(data, nr);
 	if (has_newer_autopwm(data)) {
 		/*
 		 * If we are in automatic mode, the PWM duty cycle register
@@ -1472,6 +1473,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	}
 
 	mutex_lock(&data->update_lock);
+	it87_update_pwm_ctrl(data, nr);
 	data->pwm_temp_map[nr] = reg;
 	/*
 	 * If we are in automatic mode, write the temp mapping immediately;
-- 
2.7.4

