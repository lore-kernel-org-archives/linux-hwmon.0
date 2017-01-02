Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ssl.serverraum.org ([213.133.101.245]:49880 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756494AbdABQx4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Jan 2017 11:53:56 -0500
From: Michael Walle <michael@walle.cc>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [PATCH] hwmon: (lm90) fix temp1_max_alarm attribute
Date: Mon,  2 Jan 2017 17:53:39 +0100
Message-Id: <1483376019-11788-1-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Since commit commit eb1c8f4325d5 ("hwmon: (lm90) Convert to use new hwmon
registration API") the temp1_max_alarm and temp1_crit_alarm attributes are
mapped to the same alarm bit. Fix the typo.

Fixes: eb1c8f4325d5 ("hwmon: (lm90) Convert to use new hwmon registration API")
Signed-off-by: Micehael Walle <michael@walle.cc>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 322ed92..841f242 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1036,7 +1036,7 @@ static const u8 lm90_temp_emerg_index[3] = {
 };
 
 static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
-static const u8 lm90_max_alarm_bits[3] = { 0, 4, 12 };
+static const u8 lm90_max_alarm_bits[3] = { 6, 4, 12 };
 static const u8 lm90_crit_alarm_bits[3] = { 0, 1, 9 };
 static const u8 lm90_emergency_alarm_bits[3] = { 15, 13, 14 };
 static const u8 lm90_fault_bits[3] = { 0, 2, 10 };
-- 
2.1.4

