Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (it87) Fix feature mask for IT8792E (IT8733E)
Date: Sat, 11 Mar 2017 07:17:26 -0800
Message-Id: <1489245446-6352-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The chip features match those of IT8790E. Most important is the
ADC resolution, which is 12 mV, not 10.9 mV. It also uses the 'new'
set of registers for PECI control, and has a second PWM frequency
register.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index efb01c247e2d..3e57a6120551 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -428,11 +428,10 @@ static const struct it87_devices it87_devices[] = {
 	[it8792] = {
 		.name = "it8792",
 		.suffix = "E",
-		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
+		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+		  | FEAT_PWM_FREQ2,
 		.peci_mask = 0x07,
-		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
 	[it8603] = {
 		.name = "it8603",
-- 
2.7.4
