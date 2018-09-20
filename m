Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/13] hwmon: (nct6775) Rename configuration register variables
Date: Thu, 20 Sep 2018 06:45:29 -0700
Message-Id: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Use variable names from chip datasheets (crXX) instead of regval_XX
for configuration register variables. This is shorter and, together
with subsequent changes, makes the code easier to read.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 2a9fc8c9fb9e..7a3a1d59553e 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3497,7 +3497,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		pwm3pin = regval & 0x08;
 	} else {
 		/* NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D */
-		int regval_1b, regval_2a, regval_2f;
+		int cr1b, cr2a, cr2f;
 		bool dsw_en;
 
 		regval = superio_inb(sioreg, 0x1c);
@@ -3520,20 +3520,20 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		case nct6793:
 		case nct6795:
 		case nct6796:
-			regval_1b = superio_inb(sioreg, 0x1b);
-			regval_2a = superio_inb(sioreg, 0x2a);
-			regval_2f = superio_inb(sioreg, 0x2f);
-			dsw_en = regval_2f & BIT(3);
+			cr1b = superio_inb(sioreg, 0x1b);
+			cr2a = superio_inb(sioreg, 0x2a);
+			cr2f = superio_inb(sioreg, 0x2f);
+			dsw_en = cr2f & BIT(3);
 
 			if (!pwm5pin)
 				pwm5pin = regval & BIT(7);
 
 			if (!fan5pin)
-				fan5pin = regval_1b & BIT(5);
+				fan5pin = cr1b & BIT(5);
 
 			superio_select(sioreg, NCT6775_LD_12);
 			if (data->kind != nct6796) {
-				int regval_eb = superio_inb(sioreg, 0xeb);
+				int creb = superio_inb(sioreg, 0xeb);
 
 				if (!dsw_en) {
 					fan6pin = regval & BIT(1);
@@ -3541,33 +3541,33 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 				}
 
 				if (!fan5pin)
-					fan5pin = regval_eb & BIT(5);
+					fan5pin = creb & BIT(5);
 				if (!pwm5pin)
-					pwm5pin = (regval_eb & BIT(4)) &&
-						!(regval_2a & BIT(0));
+					pwm5pin = (creb & BIT(4)) &&
+						!(cr2a & BIT(0));
 				if (!fan6pin)
-					fan6pin = regval_eb & BIT(3);
+					fan6pin = creb & BIT(3);
 				if (!pwm6pin)
-					pwm6pin = regval_eb & BIT(2);
+					pwm6pin = creb & BIT(2);
 			}
 
 			if (data->kind == nct6795 || data->kind == nct6796) {
-				int regval_ed = superio_inb(sioreg, 0xed);
+				int cred = superio_inb(sioreg, 0xed);
 
 				if (!fan6pin)
-					fan6pin = (regval_2a & BIT(4)) &&
-					  (!dsw_en || (regval_ed & BIT(4)));
+					fan6pin = (cr2a & BIT(4)) &&
+					  (!dsw_en || (cred & BIT(4)));
 				if (!pwm6pin)
-					pwm6pin = (regval_2a & BIT(3)) &&
-					  (regval_ed & BIT(2));
+					pwm6pin = (cr2a & BIT(3)) &&
+					  (cred & BIT(2));
 			}
 
 			if (data->kind == nct6796) {
-				int regval_1d = superio_inb(sioreg, 0x1d);
-				int regval_2b = superio_inb(sioreg, 0x2b);
+				int cr1d = superio_inb(sioreg, 0x1d);
+				int cr2b = superio_inb(sioreg, 0x2b);
 
-				fan7pin = !(regval_2b & BIT(2));
-				pwm7pin = !(regval_1d & (BIT(2) | BIT(3)));
+				fan7pin = !(cr2b & BIT(2));
+				pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
 			}
 
 			break;
-- 
2.7.4
