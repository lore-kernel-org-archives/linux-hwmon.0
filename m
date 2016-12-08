Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52377 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751302AbcLHT3b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 14:29:31 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: (adm1026) Fix overflows seen when writing into limit attributes
Date: Thu,  8 Dec 2016 11:29:29 -0800
Message-Id: <1481225369-13461-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix overflows seen when writing large values into voltage limit,
temperature limit, temperature offset, and DAC attributes.

Overflows are seen due to unbound multiplications and additions.

While at it, change the low temperature limit to -128 degrees C,
since this is the minimum temperature accepted by the chip.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Provide reason for changing lower temperature range.

 drivers/hwmon/adm1026.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index e67b9a50ac7c..b2a5d9e5c590 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -197,8 +197,9 @@ static int adm1026_scaling[] = { /* .001 Volts */
 	};
 #define NEG12_OFFSET  16000
 #define SCALE(val, from, to) (((val)*(to) + ((from)/2))/(from))
-#define INS_TO_REG(n, val)  (clamp_val(SCALE(val, adm1026_scaling[n], 192),\
-	0, 255))
+#define INS_TO_REG(n, val)	\
+		SCALE(clamp_val(val, 0, 255 * adm1026_scaling[n] / 192), \
+		      adm1026_scaling[n], 192)
 #define INS_FROM_REG(n, val) (SCALE(val, 192, adm1026_scaling[n]))
 
 /*
@@ -215,11 +216,11 @@ static int adm1026_scaling[] = { /* .001 Volts */
 #define DIV_TO_REG(val) ((val) >= 8 ? 3 : (val) >= 4 ? 2 : (val) >= 2 ? 1 : 0)
 
 /* Temperature is reported in 1 degC increments */
-#define TEMP_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500)) \
-					/ 1000, -127, 127))
+#define TEMP_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), \
+					   1000)
 #define TEMP_FROM_REG(val) ((val) * 1000)
-#define OFFSET_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500)) \
-					  / 1000, -127, 127))
+#define OFFSET_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), \
+					     1000)
 #define OFFSET_FROM_REG(val) ((val) * 1000)
 
 #define PWM_TO_REG(val) (clamp_val(val, 0, 255))
@@ -233,7 +234,8 @@ static int adm1026_scaling[] = { /* .001 Volts */
  *   indicates that the DAC could be used to drive the fans, but in our
  *   example board (Arima HDAMA) it isn't connected to the fans at all.
  */
-#define DAC_TO_REG(val) (clamp_val(((((val) * 255) + 500) / 2500), 0, 255))
+#define DAC_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, 0, 2500) * 255, \
+					  2500)
 #define DAC_FROM_REG(val) (((val) * 2500) / 255)
 
 /*
@@ -593,7 +595,10 @@ static ssize_t set_in16_min(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->in_min[16] = INS_TO_REG(16, val + NEG12_OFFSET);
+	data->in_min[16] = INS_TO_REG(16,
+				      clamp_val(val, INT_MIN,
+						INT_MAX - NEG12_OFFSET) +
+				      NEG12_OFFSET);
 	adm1026_write_value(client, ADM1026_REG_IN_MIN[16], data->in_min[16]);
 	mutex_unlock(&data->update_lock);
 	return count;
@@ -618,7 +623,10 @@ static ssize_t set_in16_max(struct device *dev, struct device_attribute *attr,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->in_max[16] = INS_TO_REG(16, val+NEG12_OFFSET);
+	data->in_max[16] = INS_TO_REG(16,
+				      clamp_val(val, INT_MIN,
+						INT_MAX - NEG12_OFFSET) +
+				      NEG12_OFFSET);
 	adm1026_write_value(client, ADM1026_REG_IN_MAX[16], data->in_max[16]);
 	mutex_unlock(&data->update_lock);
 	return count;
-- 
2.5.0

