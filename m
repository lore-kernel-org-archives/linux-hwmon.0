Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/7] hwmon: (it87) Add support for IT8792E
Date: Thu,  9 Feb 2017 07:06:15 -0800
Message-Id: <1486652775-3926-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
References: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The chip is similar to IT8732E, but supports only three fans
and pwm outputs instead of four (the driver currently does not
support the 4th fan and pwm output of IT8732E).

Note that the chip ID is 0x8733, not 0x8792 as one would expect.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 37acb38b5e17..efb01c247e2d 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -32,6 +32,7 @@
  *            IT8783E/F Super I/O chip w/LPC interface
  *            IT8786E  Super I/O chip w/LPC interface
  *            IT8790E  Super I/O chip w/LPC interface
+ *            IT8792E  Super I/O chip w/LPC interface
  *            Sis950   A clone of the IT8705F
  *
  *  Copyright (C) 2001 Chris Gauthron
@@ -70,8 +71,8 @@
 #define DRVNAME "it87"
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
-	     it8771, it8772, it8781, it8782, it8783, it8786, it8790, it8603,
-	     it8620, it8622, it8628 };
+	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
+	     it8792, it8603, it8620, it8622, it8628 };
 
 static unsigned short force_id;
 module_param(force_id, ushort, 0);
@@ -152,6 +153,7 @@ static inline void superio_exit(int ioreg)
 #define IT8726F_DEVID 0x8726
 #define IT8728F_DEVID 0x8728
 #define IT8732F_DEVID 0x8732
+#define IT8792E_DEVID 0x8733
 #define IT8771E_DEVID 0x8771
 #define IT8772E_DEVID 0x8772
 #define IT8781F_DEVID 0x8781
@@ -423,6 +425,15 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_PWM_FREQ2,
 		.peci_mask = 0x07,
 	},
+	[it8792] = {
+		.name = "it8792",
+		.suffix = "E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
+		.peci_mask = 0x07,
+		.old_peci_mask = 0x02,	/* Actually reports PCH */
+	},
 	[it8603] = {
 		.name = "it8603",
 		.suffix = "E",
@@ -2419,6 +2430,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8732F_DEVID:
 		sio_data->type = it8732;
 		break;
+	case IT8792E_DEVID:
+		sio_data->type = it8792;
+		break;
 	case IT8771E_DEVID:
 		sio_data->type = it8771;
 		break;
-- 
2.7.4
