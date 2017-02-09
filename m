From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Thu, 09 Feb 2017 07:29:49 -0800
Subject: [PATCH 2/7] hwmon: (it87) Add support for IT8622E
In-Reply-To: <1486651773-3103-1-git-send-email-linux@roeck-us.net>
Message-ID: <1486651773-3103-2-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

IT8622E is similar to IT8620E, but only supports five pwm controls and
five fan tachometers.

Originally-from: Kevin Folz <kf...@evertz.com>.
Signed-off-by: Guenter Roeck <li...@roeck-us.net>
---
 drivers/hwmon/it87.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 3bfa866cc82f..4d9090f89401 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -12,6 +12,7 @@
  *
  *  Supports: IT8603E  Super I/O chip w/LPC interface
  *            IT8620E  Super I/O chip w/LPC interface
+ *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
  *            IT8628E  Super I/O chip w/LPC interface
  *            IT8705F  Super I/O chip w/LPC interface
@@ -70,7 +71,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
             it8771, it8772, it8781, it8782, it8783, it8786, it8790, it8603,
-            it8620, it8628 };
+            it8620, it8622, it8628 };
 
 static unsigned short force_id;
 module_param(force_id, ushort, 0);
@@ -160,6 +161,7 @@ static inline void superio_exit(int ioreg)
 #define IT8790E_DEVID 0x8790
 #define IT8603E_DEVID 0x8603
 #define IT8620E_DEVID 0x8620
+#define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
 #define IT87_ACT_REG  0x30
@@ -437,6 +439,15 @@ static const struct it87_devices it87_devices[] = {
                  | FEAT_SIX_TEMP | FEAT_VIN3_5V,
                .peci_mask = 0x07,
        },
+       [it8622] = {
+               .name = "it8622",
+               .suffix = "E",
+               .features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+                 | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+                 | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2 | FEAT_AVCC3
+                 | FEAT_VIN3_5V,
+               .peci_mask = 0x07,
+       },
        [it8628] = {
                .name = "it8628",
                .suffix = "E",
@@ -2418,6 +2429,9 @@ static int __init it87_find(int sioaddr, unsigned short 
*address,
        case IT8620E_DEVID:
                sio_data->type = it8620;
                break;
+       case IT8622E_DEVID:
+               sio_data->type = it8622;
+               break;
        case IT8628E_DEVID:
                sio_data->type = it8628;
                break;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
