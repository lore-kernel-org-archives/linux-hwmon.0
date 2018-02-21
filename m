Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (nct6775) Initialize boolean variables with declaration
Date: Wed, 21 Feb 2018 13:09:38 -0800
Message-Id: <1519247379-29443-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
References: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Initialize boolean flags in nct6775_check_fan_inputs() while
declaring them instead of several times throughout the code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index cebd716ddc91..5662b23dbffa 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3360,8 +3360,10 @@ static inline void nct6775_init_device(struct nct6775_data *data)
 static void
 nct6775_check_fan_inputs(struct nct6775_data *data)
 {
-	bool fan3pin, fan4pin, fan4min, fan5pin, fan6pin;
-	bool pwm3pin, pwm4pin, pwm5pin, pwm6pin;
+	bool fan3pin = false, fan4pin = false, fan4min = false;
+	bool fan5pin = false, fan6pin = false;
+	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
+	bool pwm6pin = false;
 	int sioreg = data->sioreg;
 	int regval;
 
@@ -3378,12 +3380,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 		/* On NCT6775, fan4 shares pins with the fdc interface */
 		fan4pin = !(superio_inb(sioreg, 0x2A) & 0x80);
-		fan4min = false;
-		fan5pin = false;
-		fan6pin = false;
-		pwm4pin = false;
-		pwm5pin = false;
-		pwm6pin = false;
 	} else if (data->kind == nct6776) {
 		bool gpok = superio_inb(sioreg, 0x27) & 0x80;
 		const char *board_vendor, *board_name;
@@ -3423,23 +3419,11 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			fan5pin = superio_inb(sioreg, 0x1C) & 0x02;
 
 		fan4min = fan4pin;
-		fan6pin = false;
 		pwm3pin = fan3pin;
-		pwm4pin = false;
-		pwm5pin = false;
-		pwm6pin = false;
 	} else if (data->kind == nct6106) {
 		regval = superio_inb(sioreg, 0x24);
 		fan3pin = !(regval & 0x80);
 		pwm3pin = regval & 0x08;
-
-		fan4pin = false;
-		fan4min = false;
-		fan5pin = false;
-		fan6pin = false;
-		pwm4pin = false;
-		pwm5pin = false;
-		pwm6pin = false;
 	} else { /* NCT6779D, NCT6791D, NCT6792D, NCT6793D, or NCT6795D */
 		int regval_1b, regval_2a, regval_2f, regval_eb;
 		bool dsw_en;
@@ -3474,8 +3458,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			if (!fan5pin)
 				fan5pin = regval_1b & BIT(5);
 
-			fan6pin = false;
-			pwm6pin = false;
 			if (!dsw_en) {
 				fan6pin = regval & BIT(1);
 				pwm6pin = regval & BIT(0);
@@ -3506,8 +3488,6 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			}
 			break;
 		default:	/* NCT6779D */
-			fan6pin = false;
-			pwm6pin = false;
 			break;
 		}
 
-- 
2.7.4
