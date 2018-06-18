Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56324 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754561AbeFRQZB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Jun 2018 12:25:01 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: [PATCH] hwmon: (nct6775) Fix comment in the description of pwm_mode
Date: Mon, 18 Jun 2018 09:24:57 -0700
Message-Id: <1529339097-23743-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Commit 415eb2a1aaa488 ("hwmon: (nct6775) Fix writing pwmX_mode") changed
the definition of the pwm_mode variable, but did not update the comment
describing it.

Reported-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index f9d1349c3286..37149909f8a8 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1050,8 +1050,8 @@ struct nct6775_data {
 	u64 beeps;
 
 	u8 pwm_num;	/* number of pwm */
-	u8 pwm_mode[NUM_FAN];	/* 1->DC variable voltage,
-				 * 0->PWM variable duty cycle
+	u8 pwm_mode[NUM_FAN];	/* 0->DC variable voltage,
+				 * 1->PWM variable duty cycle
 				 */
 	enum pwm_enable pwm_enable[NUM_FAN];
 			/* 0->off
-- 
2.7.4

