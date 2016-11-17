Return-path: <tom.levens@cern.ch>
From: Tom Levens <tom.levens@cern.ch>
To: <linux@roeck-us.net>
CC: <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Tom Levens <tom.levens@cern.ch>
Subject: [PATCH v2 1/3] hwmon: ltc2990: refactor value conversion
Date: Thu, 17 Nov 2016 13:10:14 +0100
Message-ID: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Conversion from raw values to signed integers has been refactored using
the macros in bitops.h.

Signed-off-by: Tom Levens <tom.levens@cern.ch>
---
 drivers/hwmon/ltc2990.c |   27 ++++++++++-----------------
 1 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index 8f8fe05..0ec4102 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -9,8 +9,12 @@
  * This driver assumes the chip is wired as a dual current monitor, and
  * reports the voltage drop across two series resistors. It also reports
  * the chip's internal temperature and Vcc power supply voltage.
+ *
+ * Value conversion refactored
+ * by Tom Levens <tom.levens@cern.ch>
  */
 
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -34,19 +38,10 @@
 #define LTC2990_CONTROL_MODE_CURRENT	0x06
 #define LTC2990_CONTROL_MODE_VOLTAGE	0x07
 
-/* convert raw register value to sign-extended integer in 16-bit range */
-static int ltc2990_voltage_to_int(int raw)
-{
-	if (raw & BIT(14))
-		return -(0x4000 - (raw & 0x3FFF)) << 2;
-	else
-		return (raw & 0x3FFF) << 2;
-}
-
 /* Return the converted value from the given register in uV or mC */
-static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
+static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, s32 *result)
 {
-	int val;
+	s32 val;
 
 	val = i2c_smbus_read_word_swapped(i2c, reg);
 	if (unlikely(val < 0))
@@ -55,18 +50,16 @@ static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
 	switch (reg) {
 	case LTC2990_TINT_MSB:
 		/* internal temp, 0.0625 degrees/LSB, 13-bit  */
-		val = (val & 0x1FFF) << 3;
-		*result = (val * 1000) >> 7;
+		*result = sign_extend32(val, 12) * 1000 / 16;
 		break;
 	case LTC2990_V1_MSB:
 	case LTC2990_V3_MSB:
 		 /* Vx-Vy, 19.42uV/LSB. Depends on mode. */
-		*result = ltc2990_voltage_to_int(val) * 1942 / (4 * 100);
+		*result = sign_extend32(val, 14) * 1942 / 100;
 		break;
 	case LTC2990_VCC_MSB:
 		/* Vcc, 305.18μV/LSB, 2.5V offset */
-		*result = (ltc2990_voltage_to_int(val) * 30518 /
-			   (4 * 100 * 1000)) + 2500;
+		*result = sign_extend32(val, 14) * 30518 / (100 * 1000) + 2500;
 		break;
 	default:
 		return -EINVAL; /* won't happen, keep compiler happy */
@@ -79,7 +72,7 @@ static ssize_t ltc2990_show_value(struct device *dev,
 				  struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	int value;
+	s32 value;
 	int ret;
 
 	ret = ltc2990_get_value(dev_get_drvdata(dev), attr->index, &value);
-- 
1.7.1
