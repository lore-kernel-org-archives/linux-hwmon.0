Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37639 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id 2-v6so4473371pgo.4
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:49 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/13] hwmon: (nct6775) Move config variable declarations and initializations
Date: Thu, 20 Sep 2018 06:45:31 -0700
Message-Id: <1537451141-27242-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Group configuration variable declarations and initialization together.
While this results in reading more registers than necessary for a given
chip, it improves code readability and simplifies extending the code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index bd1c4772994a..aa8a44608ca3 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3436,8 +3436,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
 	bool pwm6pin = false, pwm7pin = false;
 	int sioreg = data->sioreg;
-	int cr24;
-	int cr2c;
 
 	/* Store SIO_REG_ENABLE for use during resume */
 	superio_select(sioreg, NCT6775_LD_HWM);
@@ -3445,7 +3443,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 	/* fan4 and fan5 share some pins with the GPIO and serial flash */
 	if (data->kind == nct6775) {
-		cr2c = superio_inb(sioreg, 0x2c);
+		int cr2c = superio_inb(sioreg, 0x2c);
 
 		fan3pin = cr2c & BIT(6);
 		pwm3pin = cr2c & BIT(7);
@@ -3493,17 +3491,20 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		fan4min = fan4pin;
 		pwm3pin = fan3pin;
 	} else if (data->kind == nct6106) {
-		cr24 = superio_inb(sioreg, 0x24);
+		int cr24 = superio_inb(sioreg, 0x24);
+
 		fan3pin = !(cr24 & 0x80);
 		pwm3pin = cr24 & 0x08;
 	} else {
 		/* NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D */
-		int cr1b, cr2a, cr2f;
-		int cr1c;
-		int cr2d;
-		bool dsw_en;
-
-		cr1c = superio_inb(sioreg, 0x1c);
+		int cr1b = superio_inb(sioreg, 0x1b);
+		int cr1c = superio_inb(sioreg, 0x1c);
+		int cr1d = superio_inb(sioreg, 0x1d);
+		int cr2a = superio_inb(sioreg, 0x2a);
+		int cr2b = superio_inb(sioreg, 0x2b);
+		int cr2d = superio_inb(sioreg, 0x2d);
+		int cr2f = superio_inb(sioreg, 0x2f);
+		bool dsw_en = cr2f & BIT(3);
 
 		fan3pin = !(cr1c & BIT(5));
 		fan4pin = !(cr1c & BIT(6));
@@ -3513,7 +3514,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		pwm4pin = !(cr1c & BIT(1));
 		pwm5pin = !(cr1c & BIT(2));
 
-		cr2d = superio_inb(sioreg, 0x2d);
 		switch (data->kind) {
 		case nct6791:
 		case nct6792:
@@ -3523,11 +3523,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		case nct6793:
 		case nct6795:
 		case nct6796:
-			cr1b = superio_inb(sioreg, 0x1b);
-			cr2a = superio_inb(sioreg, 0x2a);
-			cr2f = superio_inb(sioreg, 0x2f);
-			dsw_en = cr2f & BIT(3);
-
 			if (!pwm5pin)
 				pwm5pin = cr2d & BIT(7);
 
@@ -3566,9 +3561,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			}
 
 			if (data->kind == nct6796) {
-				int cr1d = superio_inb(sioreg, 0x1d);
-				int cr2b = superio_inb(sioreg, 0x2b);
-
 				fan7pin = !(cr2b & BIT(2));
 				pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
 			}
-- 
2.7.4
