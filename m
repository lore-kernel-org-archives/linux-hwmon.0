Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39435 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id w14-v6so4382779plp.6
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:59 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/13] hwmon: (nct6796) Clean up and amend fan/pwm configuration for NCT6796D
Date: Thu, 20 Sep 2018 06:45:38 -0700
Message-Id: <1537451141-27242-10-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Now that everything is separated, clean up fan and pwm configuration
for NCT6796D. While doing that, take the forgotten configuration register
cre0 into account to determine if AUXFANIN2 (fan5) and AUXFANOUT2 (pwm5)
are connected.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index d9c2b934321d..c07414dd38dd 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3505,10 +3505,12 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		int cr2d = superio_inb(sioreg, 0x2d);
 		int cr2f = superio_inb(sioreg, 0x2f);
 		bool dsw_en = cr2f & BIT(3);
+		int cre0;
 		int creb;
 		int cred;
 
 		superio_select(sioreg, NCT6775_LD_12);
+		cre0 = superio_inb(sioreg, 0xe0);
 		creb = superio_inb(sioreg, 0xeb);
 		cred = superio_inb(sioreg, 0xed);
 
@@ -3556,27 +3558,24 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			pwm6pin |= creb & BIT(2);
 			break;
 		case nct6796:
-			pwm5pin |= cr2d & BIT(7);
 			fan5pin |= cr1b & BIT(5);
+			fan5pin |= (cre0 & BIT(3)) && !(cr1b & BIT(0));
+			fan5pin |= creb & BIT(5);
 
-			if (data->kind != nct6796) {
-				fan5pin |= creb & BIT(5);
-				pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+			fan6pin = (cr2a & BIT(4)) &&
+					(!dsw_en || (cred & BIT(4)));
+			fan6pin |= creb & BIT(3);
 
-				fan6pin = !dsw_en && (cr2d & BIT(1));
-				fan6pin |= creb & BIT(3);
+			fan7pin = !(cr2b & BIT(2));
 
-				pwm6pin = !dsw_en && (cr2d & BIT(0));
-				pwm6pin |= creb & BIT(2);
-			}
+			pwm5pin |= cr2d & BIT(7);
+			pwm5pin |= (cre0 & BIT(4)) && !(cr1b & BIT(0));
+			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
 
-			fan6pin |= (cr2a & BIT(4)) &&
-					(!dsw_en || (cred & BIT(4)));
-			pwm6pin |= (cr2a & BIT(3)) && (cred & BIT(2));
+			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
+			pwm6pin |= creb & BIT(2);
 
-			fan7pin = !(cr2b & BIT(2));
 			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
-
 			break;
 		default:	/* NCT6779D */
 			break;
-- 
2.7.4
