Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39738 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id j8-v6so4403790pff.6
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:45:48 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/13] hwmon: (nct6775) Replace 'regval' with variables named after config registers
Date: Thu, 20 Sep 2018 06:45:30 -0700
Message-Id: <1537451141-27242-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Using variables named after configuration registers makes it more obvious
which configuration register value is used, especially if more than one
configuration register value is used to determine a configuration detail.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 7a3a1d59553e..bd1c4772994a 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3436,7 +3436,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
 	bool pwm6pin = false, pwm7pin = false;
 	int sioreg = data->sioreg;
-	int regval;
+	int cr24;
+	int cr2c;
 
 	/* Store SIO_REG_ENABLE for use during resume */
 	superio_select(sioreg, NCT6775_LD_HWM);
@@ -3444,10 +3445,10 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 	/* fan4 and fan5 share some pins with the GPIO and serial flash */
 	if (data->kind == nct6775) {
-		regval = superio_inb(sioreg, 0x2c);
+		cr2c = superio_inb(sioreg, 0x2c);
 
-		fan3pin = regval & BIT(6);
-		pwm3pin = regval & BIT(7);
+		fan3pin = cr2c & BIT(6);
+		pwm3pin = cr2c & BIT(7);
 
 		/* On NCT6775, fan4 shares pins with the fdc interface */
 		fan4pin = !(superio_inb(sioreg, 0x2A) & 0x80);
@@ -3492,30 +3493,32 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		fan4min = fan4pin;
 		pwm3pin = fan3pin;
 	} else if (data->kind == nct6106) {
-		regval = superio_inb(sioreg, 0x24);
-		fan3pin = !(regval & 0x80);
-		pwm3pin = regval & 0x08;
+		cr24 = superio_inb(sioreg, 0x24);
+		fan3pin = !(cr24 & 0x80);
+		pwm3pin = cr24 & 0x08;
 	} else {
 		/* NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D */
 		int cr1b, cr2a, cr2f;
+		int cr1c;
+		int cr2d;
 		bool dsw_en;
 
-		regval = superio_inb(sioreg, 0x1c);
+		cr1c = superio_inb(sioreg, 0x1c);
 
-		fan3pin = !(regval & BIT(5));
-		fan4pin = !(regval & BIT(6));
-		fan5pin = !(regval & BIT(7));
+		fan3pin = !(cr1c & BIT(5));
+		fan4pin = !(cr1c & BIT(6));
+		fan5pin = !(cr1c & BIT(7));
 
-		pwm3pin = !(regval & BIT(0));
-		pwm4pin = !(regval & BIT(1));
-		pwm5pin = !(regval & BIT(2));
+		pwm3pin = !(cr1c & BIT(0));
+		pwm4pin = !(cr1c & BIT(1));
+		pwm5pin = !(cr1c & BIT(2));
 
-		regval = superio_inb(sioreg, 0x2d);
+		cr2d = superio_inb(sioreg, 0x2d);
 		switch (data->kind) {
 		case nct6791:
 		case nct6792:
-			fan6pin = regval & BIT(1);
-			pwm6pin = regval & BIT(0);
+			fan6pin = cr2d & BIT(1);
+			pwm6pin = cr2d & BIT(0);
 			break;
 		case nct6793:
 		case nct6795:
@@ -3526,7 +3529,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			dsw_en = cr2f & BIT(3);
 
 			if (!pwm5pin)
-				pwm5pin = regval & BIT(7);
+				pwm5pin = cr2d & BIT(7);
 
 			if (!fan5pin)
 				fan5pin = cr1b & BIT(5);
@@ -3536,8 +3539,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 				int creb = superio_inb(sioreg, 0xeb);
 
 				if (!dsw_en) {
-					fan6pin = regval & BIT(1);
-					pwm6pin = regval & BIT(0);
+					fan6pin = cr2d & BIT(1);
+					pwm6pin = cr2d & BIT(0);
 				}
 
 				if (!fan5pin)
-- 
2.7.4
