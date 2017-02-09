From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Thu, 09 Feb 2017 07:21:41 -0800
Subject: [PATCH 1/7] hwmon: (it87) Add feature flag indicating that VIN3 is connected to 5V
Message-ID: <1486651773-3103-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On IT8622E and IT8628E, VIN3 is expected to be connected to +5V.
Add feature flag and reflect in input label.

Signed-off-by: Guenter Roeck <li...@roeck-us.net>
---
 drivers/hwmon/it87.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ef4e0527bd21..3bfa866cc82f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -296,6 +296,7 @@ struct it87_devices {
 #define FEAT_SIX_PWM           BIT(14) /* Chip supports 6 pwm chn */
 #define FEAT_PWM_FREQ2         BIT(15) /* Separate pwm freq 2 */
 #define FEAT_SIX_TEMP          BIT(16) /* Up to 6 temp sensors */
+#define FEAT_VIN3_5V           BIT(17) /* VIN3 connected to +5V */
 
 static const struct it87_devices it87_devices[] = {
        [it87] = {
@@ -433,7 +434,7 @@ static const struct it87_devices it87_devices[] = {
                .features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
                  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
                  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
-                 | FEAT_SIX_TEMP,
+                 | FEAT_SIX_TEMP | FEAT_VIN3_5V,
                .peci_mask = 0x07,
        },
        [it8628] = {
@@ -442,7 +443,7 @@ static const struct it87_devices it87_devices[] = {
                .features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
                  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
                  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
-                 | FEAT_SIX_TEMP,
+                 | FEAT_SIX_TEMP | FEAT_VIN3_5V,
                .peci_mask = 0x07,
        },
 };
@@ -468,6 +469,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_six_pwm(data)      ((data)->features & FEAT_SIX_PWM)
 #define has_pwm_freq2(data)    ((data)->features & FEAT_PWM_FREQ2)
 #define has_six_temp(data)     ((data)->features & FEAT_SIX_TEMP)
+#define has_vin3_5v(data)      ((data)->features & FEAT_VIN3_5V)
 
 struct it87_sio_data {
        enum chips type;
@@ -1926,7 +1928,9 @@ static ssize_t show_label(struct device *dev, struct 
device_attribute *attr,
        int nr = to_sensor_dev_attr(attr)->index;
        const char *label;
 
-       if (has_12mv_adc(data) || has_10_9mv_adc(data))
+       if (has_vin3_5v(data) && nr == 0)
+               label = labels[0];
+       else if (has_12mv_adc(data) || has_10_9mv_adc(data))
                label = labels_it8721[nr];
        else
                label = labels[nr];
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
