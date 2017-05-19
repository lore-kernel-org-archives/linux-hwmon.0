Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (nct6775) Improve fan detection
Date: Fri, 19 May 2017 11:05:59 -0700
Message-Id: <1495217160-32336-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
References: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Recent chips support multiple pins for fan speed inputs and fan control
outputs. Examine all of them to determine supported fan controls.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 45 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 9d8d25c54415..769daa78c560 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -105,6 +105,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define NCT6775_LD_ACPI		0x0a
 #define NCT6775_LD_HWM		0x0b
 #define NCT6775_LD_VID		0x0d
+#define NCT6775_LD_12		0x12
 
 #define SIO_REG_LDSEL		0x07	/* Logical device select */
 #define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
@@ -3392,6 +3393,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		pwm5pin = false;
 		pwm6pin = false;
 	} else {	/* NCT6779D, NCT6791D, NCT6792D, or NCT6793D */
+		int regval_1b, regval_2a, regval_eb;
+
 		regval = superio_inb(sioreg, 0x1c);
 
 		fan3pin = !(regval & BIT(5));
@@ -3402,17 +3405,43 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		pwm4pin = !(regval & BIT(1));
 		pwm5pin = !(regval & BIT(2));
 
-		fan4min = fan4pin;
-
-		if (data->kind == nct6791 || data->kind == nct6792 ||
-		    data->kind == nct6793) {
-			regval = superio_inb(sioreg, 0x2d);
-			fan6pin = (regval & BIT(1));
-			pwm6pin = (regval & BIT(0));
-		} else {	/* NCT6779D */
+		regval = superio_inb(sioreg, 0x2d);
+		switch (data->kind) {
+		case nct6791:
+		case nct6792:
+			fan6pin = regval & BIT(1);
+			pwm6pin = regval & BIT(0);
+			break;
+		case nct6793:
+			regval_1b = superio_inb(sioreg, 0x1b);
+			regval_2a = superio_inb(sioreg, 0x2a);
+
+			if (!pwm5pin)
+				pwm5pin = regval & BIT(7);
+			fan6pin = regval & BIT(1);
+			pwm6pin = regval & BIT(0);
+			if (!fan5pin)
+				fan5pin = regval_1b & BIT(5);
+
+			superio_select(sioreg, NCT6775_LD_12);
+			regval_eb = superio_inb(sioreg, 0xeb);
+			if (!fan5pin)
+				fan5pin = regval_eb & BIT(5);
+			if (!pwm5pin)
+				pwm5pin = (regval_eb & BIT(4)) &&
+					   !(regval_2a & BIT(0));
+			if (!fan6pin)
+				fan6pin = regval_eb & BIT(3);
+			if (!pwm6pin)
+				pwm6pin = regval_eb & BIT(2);
+			break;
+		default:	/* NCT6779D */
 			fan6pin = false;
 			pwm6pin = false;
+			break;
 		}
+
+		fan4min = fan4pin;
 	}
 
 	/* fan 1 and 2 (0x03) are always present */
-- 
2.7.4
