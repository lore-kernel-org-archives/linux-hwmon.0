Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44507 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727375AbeIQSKK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Sep 2018 14:10:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1-v6so7606163pgp.11
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Sep 2018 05:43:00 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Robert Kern <ulteq@web.de>
Subject: [PATCH] hwmon: (nct6775) Use different register to get fan RPM for fan7
Date: Mon, 17 Sep 2018 05:42:56 -0700
Message-Id: <1537188176-19714-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The documented register to retrieve the fan RPM for fan7 is found
to be unreliable at least with NCT6796D revision 3. Let's use
register 0x4ce instead. This is undocumented for NCT6796D, but
documented for NCT6797D and NCT6798D and known to be working.

Reported-by: Robert Kern <ulteq@web.de>
Cc: Robert Kern <ulteq@web.de>
Fixes: 81820059a428 ("hwmon: (nct6775) Add support for NCT6796D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index af4d8792bbb5..78603b78cf41 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -502,7 +502,7 @@ static const s8 NCT6779_BEEP_BITS[] = {
 	30, 31 };			/* intrusion0, intrusion1 */
 
 static const u16 NCT6779_REG_FAN[] = {
-	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca, 0x660 };
+	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca, 0x4ce };
 static const u16 NCT6779_REG_FAN_PULSES[NUM_FAN] = {
 	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
 
@@ -1293,7 +1293,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 		  reg == 0x402 ||
 		  reg == 0x63a || reg == 0x63c || reg == 0x63e ||
 		  reg == 0x640 || reg == 0x642 || reg == 0x64a ||
-		  reg == 0x64c || reg == 0x660 ||
+		  reg == 0x64c ||
 		  reg == 0x73 || reg == 0x75 || reg == 0x77 || reg == 0x79 ||
 		  reg == 0x7b || reg == 0x7d;
 	}
-- 
2.7.4
