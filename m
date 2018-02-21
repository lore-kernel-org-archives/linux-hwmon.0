Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:39126 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751526AbeBUVJq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Feb 2018 16:09:46 -0500
Received: by mail-pl0-f66.google.com with SMTP id s13so1627200plq.6
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2018 13:09:45 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (nct6775) Improve fan6/pwm6 support
Date: Wed, 21 Feb 2018 13:09:37 -0800
Message-Id: <1519247379-29443-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
References: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Improve fan6/pwm6 detection on NCT6795D. Add support for fan pulses
for fans 4..6 and fan min limits for fan6.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 01d0225cd92b..cebd716ddc91 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -419,8 +419,10 @@ static const u16 NCT6776_REG_TOLERANCE_H[] = {
 static const u8 NCT6776_REG_PWM_MODE[] = { 0x04, 0, 0, 0, 0, 0 };
 static const u8 NCT6776_PWM_MODE_MASK[] = { 0x01, 0, 0, 0, 0, 0 };
 
-static const u16 NCT6776_REG_FAN_MIN[] = { 0x63a, 0x63c, 0x63e, 0x640, 0x642 };
-static const u16 NCT6776_REG_FAN_PULSES[] = { 0x644, 0x645, 0x646, 0, 0 };
+static const u16 NCT6776_REG_FAN_MIN[] = {
+	0x63a, 0x63c, 0x63e, 0x640, 0x642, 0x64a };
+static const u16 NCT6776_REG_FAN_PULSES[] = {
+	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
 
 static const u16 NCT6776_REG_WEIGHT_DUTY_BASE[] = {
 	0x13e, 0x23e, 0x33e, 0x83e, 0x93e, 0xa3e };
@@ -1235,7 +1237,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 		  ((reg & 0xfff0) == 0x4b0 && (reg & 0x000f) < 0x0b) ||
 		  reg == 0x402 ||
 		  reg == 0x63a || reg == 0x63c || reg == 0x63e ||
-		  reg == 0x640 || reg == 0x642 ||
+		  reg == 0x640 || reg == 0x642 || reg == 0x64a ||
 		  reg == 0x73 || reg == 0x75 || reg == 0x77 || reg == 0x79 ||
 		  reg == 0x7b || reg == 0x7d;
 	}
@@ -3439,7 +3441,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		pwm5pin = false;
 		pwm6pin = false;
 	} else { /* NCT6779D, NCT6791D, NCT6792D, NCT6793D, or NCT6795D */
-		int regval_1b, regval_2a, regval_eb;
+		int regval_1b, regval_2a, regval_2f, regval_eb;
+		bool dsw_en;
 
 		regval = superio_inb(sioreg, 0x1c);
 
@@ -3462,14 +3465,22 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		case nct6795:
 			regval_1b = superio_inb(sioreg, 0x1b);
 			regval_2a = superio_inb(sioreg, 0x2a);
+			regval_2f = superio_inb(sioreg, 0x2f);
+			dsw_en = regval_2f & BIT(3);
 
 			if (!pwm5pin)
 				pwm5pin = regval & BIT(7);
-			fan6pin = regval & BIT(1);
-			pwm6pin = regval & BIT(0);
+
 			if (!fan5pin)
 				fan5pin = regval_1b & BIT(5);
 
+			fan6pin = false;
+			pwm6pin = false;
+			if (!dsw_en) {
+				fan6pin = regval & BIT(1);
+				pwm6pin = regval & BIT(0);
+			}
+
 			superio_select(sioreg, NCT6775_LD_12);
 			regval_eb = superio_inb(sioreg, 0xeb);
 			if (!fan5pin)
@@ -3481,6 +3492,18 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 				fan6pin = regval_eb & BIT(3);
 			if (!pwm6pin)
 				pwm6pin = regval_eb & BIT(2);
+
+			if (data->kind == nct6795) {
+				int regval_ed = superio_inb(sioreg, 0xed);
+
+				if (!fan6pin)
+					fan6pin = (regval_2a & BIT(4)) &&
+					  (!dsw_en ||
+					   (dsw_en && (regval_ed & BIT(4))));
+				if (!pwm6pin)
+					pwm6pin = (regval_2a & BIT(3)) &&
+					  (regval_ed & BIT(2));
+			}
 			break;
 		default:	/* NCT6779D */
 			fan6pin = false;
@@ -3495,7 +3518,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 	data->has_fan = 0x03 | (fan3pin << 2) | (fan4pin << 3) |
 		(fan5pin << 4) | (fan6pin << 5);
 	data->has_fan_min = 0x03 | (fan3pin << 2) | (fan4min << 3) |
-		(fan5pin << 4);
+		(fan5pin << 4) | (fan6pin << 5);
 	data->has_pwm = 0x03 | (pwm3pin << 2) | (pwm4pin << 3) |
 		(pwm5pin << 4) | (pwm6pin << 5);
 }
-- 
2.7.4

