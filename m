From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Thu, 09 Feb 2017 15:32:27 -0800
Subject: [PATCH 3/7] hwmon: (it87) Improve IT8622 support
In-Reply-To: <1486651773-3103-1-git-send-email-linux@roeck-us.net>
Message-ID: <1486651773-3103-3-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Configuration registers on ITE8622 are different to 8620 and 8628 and
require special handling. Also, the chip supports up to 5 pwm controls.

Signed-off-by: Guenter Roeck <li...@roeck-us.net>
---
 drivers/hwmon/it87.c | 67 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4d9090f89401..11a28b233006 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -295,10 +295,11 @@ struct it87_devices {
 #define FEAT_SIX_FANS          BIT(11) /* Supports six fans */
 #define FEAT_10_9MV_ADC                BIT(12)
 #define FEAT_AVCC3             BIT(13) /* Chip supports in9/AVCC3 */
-#define FEAT_SIX_PWM           BIT(14) /* Chip supports 6 pwm chn */
-#define FEAT_PWM_FREQ2         BIT(15) /* Separate pwm freq 2 */
-#define FEAT_SIX_TEMP          BIT(16) /* Up to 6 temp sensors */
-#define FEAT_VIN3_5V           BIT(17) /* VIN3 connected to +5V */
+#define FEAT_FIVE_PWM          BIT(14) /* Chip supports 5 pwm chn */
+#define FEAT_SIX_PWM           BIT(15) /* Chip supports 6 pwm chn */
+#define FEAT_PWM_FREQ2         BIT(16) /* Separate pwm freq 2 */
+#define FEAT_SIX_TEMP          BIT(17) /* Up to 6 temp sensors */
+#define FEAT_VIN3_5V           BIT(18) /* VIN3 connected to +5V */
 
 static const struct it87_devices it87_devices[] = {
        [it87] = {
@@ -444,8 +445,8 @@ static const struct it87_devices it87_devices[] = {
                .suffix = "E",
                .features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
                  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
-                 | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2 | FEAT_AVCC3
-                 | FEAT_VIN3_5V,
+                 | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+                 | FEAT_AVCC3 | FEAT_VIN3_5V,
                .peci_mask = 0x07,
        },
        [it8628] = {
@@ -477,6 +478,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_in7_internal(data) ((data)->features & FEAT_IN7_INTERNAL)
 #define has_six_fans(data)     ((data)->features & FEAT_SIX_FANS)
 #define has_avcc3(data)                ((data)->features & FEAT_AVCC3)
+#define has_five_pwm(data)     ((data)->features & (FEAT_FIVE_PWM \
+                                                    | FEAT_SIX_PWM))
 #define has_six_pwm(data)      ((data)->features & FEAT_SIX_PWM)
 #define has_pwm_freq2(data)    ((data)->features & FEAT_PWM_FREQ2)
 #define has_six_temp(data)     ((data)->features & FEAT_SIX_TEMP)
@@ -1929,11 +1932,13 @@ static ssize_t show_label(struct device *dev, struct 
device_attribute *attr,
                "+5V",
                "5VSB",
                "Vbat",
+               "AVCC",
        };
        static const char * const labels_it8721[] = {
                "+3.3V",
                "3VSB",
                "Vbat",
+               "+3.3V",
        };
        struct it87_data *data = dev_get_drvdata(dev);
        int nr = to_sensor_dev_attr(attr)->index;
@@ -1952,7 +1957,7 @@ static SENSOR_DEVICE_ATTR(in3_label, S_IRUGO, show_label, 
NULL, 0);
 static SENSOR_DEVICE_ATTR(in7_label, S_IRUGO, show_label, NULL, 1);
 static SENSOR_DEVICE_ATTR(in8_label, S_IRUGO, show_label, NULL, 2);
 /* AVCC3 */
-static SENSOR_DEVICE_ATTR(in9_label, S_IRUGO, show_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in9_label, S_IRUGO, show_label, NULL, 3);
 
 static umode_t it87_in_is_visible(struct kobject *kobj,
                                  struct attribute *attr, int index)
@@ -2475,8 +2480,10 @@ static int __init it87_find(int sioaddr, unsigned short 
*address,
        else
                sio_data->skip_in |= BIT(9);
 
-       if (!has_six_pwm(config))
+       if (!has_five_pwm(config))
                sio_data->skip_pwm |= BIT(3) | BIT(4) | BIT(5);
+       else if (!has_six_pwm(config))
+               sio_data->skip_pwm |= BIT(5);
 
        if (!has_vid(config))
                sio_data->skip_vid = 1;
@@ -2620,6 +2627,50 @@ static int __init it87_find(int sioaddr, unsigned short 
*address,
                        sio_data->skip_fan |= BIT(5);
                }
 
+               /* Check if AVCC is on VIN3 */
+               reg = superio_inb(sioaddr, IT87_SIO_PINX2_REG);
+               if (reg & BIT(0))
+                       sio_data->internal |= BIT(0);
+               else
+                       sio_data->skip_in |= BIT(9);
+
+               sio_data->beep_pin = superio_inb(sioaddr,
+                                                IT87_SIO_BEEP_PIN_REG) & 0x3f;
+       } else if (sio_data->type == it8622) {
+               int reg;
+
+               superio_select(sioaddr, GPIO);
+
+               /* Check for pwm4, fan4 */
+               reg = superio_inb(sioaddr, IT87_SIO_GPIO1_REG);
+               if (reg & BIT(6))
+                       sio_data->skip_fan |= BIT(3);
+               if (reg & BIT(5))
+                       sio_data->skip_pwm |= BIT(3);
+
+               /* Check for pwm3, fan3, pwm5, fan5 */
+               reg = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+               if (reg & BIT(6))
+                       sio_data->skip_pwm |= BIT(2);
+               if (reg & BIT(7))
+                       sio_data->skip_fan |= BIT(2);
+               if (reg & BIT(3))
+                       sio_data->skip_pwm |= BIT(4);
+               if (reg & BIT(1))
+                       sio_data->skip_fan |= BIT(4);
+
+               /* Check for pwm2, fan2 */
+               reg = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+               if (reg & BIT(1))
+                       sio_data->skip_pwm |= BIT(1);
+               if (reg & BIT(2))
+                       sio_data->skip_fan |= BIT(1);
+
+               /* Check for AVCC */
+               reg = superio_inb(sioaddr, IT87_SIO_PINX2_REG);
+               if (!(reg & BIT(0)))
+                       sio_data->skip_in |= BIT(9);
+
                sio_data->beep_pin = superio_inb(sioaddr,
                                                 IT87_SIO_BEEP_PIN_REG) & 0x3f;
        } else {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
