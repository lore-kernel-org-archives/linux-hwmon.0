Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:47875 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751216AbdJXAzc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2017 20:55:32 -0400
Received: by mail-pg0-f68.google.com with SMTP id r25so13138088pgn.4
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Oct 2017 17:55:31 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Ralf Goebel <ralf.goebel@imago-technologies.com>
Subject: [PATCH] tmp102: Fix first temperature reading
Date: Mon, 23 Oct 2017 17:55:26 -0700
Message-Id: <1508806526-28489-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Commit 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read
delay") reduced the initial temperature read delay and made it dependent
on the chip's shutdown mode. If the chip was not in shutdown mode at probe,
the read delay no longer applies.

This ignores the fact that the chip initialization changes the temperature
sensor resolution, and that the temperature register values change when
the resolution is changed. As a result, the reported temperature is twice
as high as the real temperature until the first temperature conversion
after the configuration change is complete. This can result in unexpected
behavior and, worst case, in a system shutdown. To fix the problem,
let's just always wait for a conversion to complete before reporting
a temperature.

Fixes: 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read delay")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=197167
Reported-by: Ralf Goebel <ralf.goebel@imago-technologies.com>
Cc: Ralf Goebel <ralf.goebel@imago-technologies.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp102.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 5eafbaada795..1af1932a72db 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -268,14 +268,7 @@ static int tmp102_probe(struct i2c_client *client,
 		return err;
 	}
 
-	tmp102->ready_time = jiffies;
-	if (tmp102->config_orig & TMP102_CONF_SD) {
-		/*
-		 * Mark that we are not ready with data until the first
-		 * conversion is complete
-		 */
-		tmp102->ready_time += msecs_to_jiffies(CONVERSION_TIME_MS);
-	}
+	tmp102->ready_time = jiffies + msecs_to_jiffies(CONVERSION_TIME_MS);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 tmp102,
-- 
2.7.4

