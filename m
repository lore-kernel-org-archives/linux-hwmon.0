Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it1-f201.google.com ([209.85.166.201]:54283 "EHLO
        mail-it1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbeJIFDS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Oct 2018 01:03:18 -0400
Received: by mail-it1-f201.google.com with SMTP id v13-v6so11682562itc.4
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Oct 2018 14:49:30 -0700 (PDT)
Date: Mon,  8 Oct 2018 14:49:25 -0700
Message-Id: <20181008214925.86281-1-kunyi@google.com>
Mime-Version: 1.0
Subject: [PATCH] hwmon: (npcm-750-pwm-fan): Change initial pwm target to 255
From: Kun Yi <kunyi@google.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, jdelvare@suse.com,
        linux@roeck-us.net, openbmc@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org
Cc: rlippert@google.com, benjaminfair@google.com,
        Kun Yi <kunyi@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Change initial PWM target to 255 to prevent overheating, for example
when BMC hangs in userspace or when userspace fan control application is
not implemented yet.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 96634fd54e0b..c0fab54c0094 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -52,7 +52,7 @@
 
 /* Define the Counter Register, value = 100 for match 100% */
 #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
-#define NPCM7XX_PWM_CMR_DEFAULT_NUM		127
+#define NPCM7XX_PWM_CMR_DEFAULT_NUM		255
 #define NPCM7XX_PWM_CMR_MAX			255
 
 /* default all PWM channels PRESCALE2 = 1 */
-- 
2.19.0.605.g01d371f741-goog
