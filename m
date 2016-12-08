Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47287 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752466AbcLHTXt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 14:23:49 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: (adm9240) Fix overflows seen when writing into limit attributes
Date: Thu,  8 Dec 2016 11:22:29 -0800
Message-Id: <1481224949-4288-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Module test reports:

in0_min: Suspected overflow: [3320 vs. 0]
in0_max: Suspected overflow: [3320 vs. 0]
in4_min: Suspected overflow: [15938 vs. 0]
in4_max: Suspected overflow: [15938 vs. 0]
temp1_max: Suspected overflow: [127000 vs. 0]
temp1_max_hyst: Suspected overflow: [127000 vs. 0]
aout_output: Suspected overflow: [1250 vs. 0]

Code analysis reveals that the overflows are caused by conversions
from unsigned long to long to int, combined with multiplications on
passed values.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Improved and simplified clamping

 drivers/hwmon/adm9240.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 2fe1828bd10b..72bf2489511e 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -98,13 +98,15 @@ static inline unsigned int IN_FROM_REG(u8 reg, int n)
 
 static inline u8 IN_TO_REG(unsigned long val, int n)
 {
-	return clamp_val(SCALE(val, 192, nom_mv[n]), 0, 255);
+	val = clamp_val(val, 0, nom_mv[n] * 255 / 192);
+	return SCALE(val, 192, nom_mv[n]);
 }
 
 /* temperature range: -40..125, 127 disables temperature alarm */
 static inline s8 TEMP_TO_REG(long val)
 {
-	return clamp_val(SCALE(val, 1, 1000), -40, 127);
+	val = clamp_val(val, -40000, 127000);
+	return SCALE(val, 1, 1000);
 }
 
 /* two fans, each with low fan speed limit */
@@ -122,7 +124,8 @@ static inline unsigned int FAN_FROM_REG(u8 reg, u8 div)
 /* analog out 0..1250mV */
 static inline u8 AOUT_TO_REG(unsigned long val)
 {
-	return clamp_val(SCALE(val, 255, 1250), 0, 255);
+	val = clamp_val(val, 0, 1250);
+	return SCALE(val, 255, 1250);
 }
 
 static inline unsigned int AOUT_FROM_REG(u8 reg)
-- 
2.5.0

