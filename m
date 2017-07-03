Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr00043.outbound.protection.outlook.com ([40.107.0.43]:26624
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750776AbdGCE3K (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jul 2017 00:29:10 -0400
From: Tom Levens <tom.levens@cern.ch>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Mike Looijmans" <mike.looijmans@topic.nl>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
Subject: [PATCH v3 1/3] hwmon: ltc2990: refactor value conversion
Date: Mon, 3 Jul 2017 06:28:58 +0200
Message-ID: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Conversion from raw values to signed integers has been refactored using
bitops.h. This also fixes a bug where negative temperatures were
converted incorrectly.

Signed-off-by: Tom Levens <tom.levens@cern.ch>
---
 drivers/hwmon/ltc2990.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index 8f8fe05..e320d21 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -11,6 +11,7 @@
  * the chip's internal temperature and Vcc power supply voltage.
  */
 
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -34,15 +35,6 @@
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
 static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
 {
@@ -55,18 +47,16 @@ static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
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
-- 
1.8.3.1

