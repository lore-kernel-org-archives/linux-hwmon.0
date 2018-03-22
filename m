Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:54286 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752708AbeCVNm1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Mar 2018 09:42:27 -0400
Received: by mail-wm0-f66.google.com with SMTP id h76so16081077wme.4
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Mar 2018 06:42:26 -0700 (PDT)
From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Subject: [PATCH] hwmon: (lm92) Add max6635 to lm92_id[]
Date: Thu, 22 Mar 2018 14:43:11 +0100
Message-Id: <20180322134311.19485-1-alvaro.gamez@hazent.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Since autodetection of this chip was removed, it makes sense to add prefix
max6635 so that the device can be instantiated by its actual name.

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 drivers/hwmon/lm92.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 18509b5af11e..d40fe5122e94 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -52,6 +52,7 @@
  */
 static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
 						I2C_CLIENT_END };
+enum chips { lm92, max6635 };
 
 /* The LM92 registers */
 #define LM92_REG_CONFIG			0x01 /* 8-bit, RW */
@@ -329,8 +330,8 @@ static int lm92_probe(struct i2c_client *new_client,
  */
 
 static const struct i2c_device_id lm92_id[] = {
-	{ "lm92", 0 },
-	/* max6635 could be added here */
+	{ "lm92", lm92 },
+	{ "max6635", max6635 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm92_id);
-- 
2.16.2

