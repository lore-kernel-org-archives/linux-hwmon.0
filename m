Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.210]:26394 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387724AbeGLBMq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 21:12:46 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 5/5] hwmon: adt7475: Change update functions to add error handling
Date: Thu, 12 Jul 2018 10:04:50 +0900
Message-Id: <20180712010450.10586-6-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

I2C SMBus is sometimes possible to return error codes.
And at the error case the measurement values are updated incorrectly.
The sensor application sends warning log message and SNMP trap.
To prevent this add error handling into the update functions.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 177 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 137 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 31a12ac405ef..00da17d72d0d 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1682,48 +1682,91 @@ static int adt7475_update_measure(struct device *dev)
 	struct adt7475_data *data = i2c_get_clientdata(client);
 	u16 ext;
 	int i;
+	int val, val2;
 
-	data->alarms = adt7475_read(REG_STATUS2) << 8;
-	data->alarms |= adt7475_read(REG_STATUS1);
+	val = adt7475_read(REG_STATUS2);
+	if (val < 0)
+		return val;
+	data->alarms = val << 8;
+
+	val = adt7475_read(REG_STATUS1);
+	if (val < 0)
+		return val;
+	data->alarms |= val;
+
+	val2 = adt7475_read(REG_EXTEND2);
+	if (val2 < 0)
+		return val2;
+
+	val = adt7475_read(REG_EXTEND1);
+	if (val < 0)
+		return val;
+
+	ext = (val2 << 8) | val;
 
-	ext = (adt7475_read(REG_EXTEND2) << 8) |
-		adt7475_read(REG_EXTEND1);
 	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
 		if (!(data->has_voltage & (1 << i)))
 			continue;
+		val = adt7475_read(VOLTAGE_REG(i));
+		if (val < 0)
+			return val;
 		data->voltage[INPUT][i] =
-			(adt7475_read(VOLTAGE_REG(i)) << 2) |
+			(val << 2) |
 			((ext >> (i * 2)) & 3);
 	}
 
-	for (i = 0; i < ADT7475_TEMP_COUNT; i++)
+	for (i = 0; i < ADT7475_TEMP_COUNT; i++) {
+		val = adt7475_read(TEMP_REG(i));
+		if (val < 0)
+			return val;
 		data->temp[INPUT][i] =
-			(adt7475_read(TEMP_REG(i)) << 2) |
+			(val << 2) |
 			((ext >> ((i + 5) * 2)) & 3);
+	}
 
 	if (data->has_voltage & (1 << 5)) {
-		data->alarms |= adt7475_read(REG_STATUS4) << 24;
-		ext = adt7475_read(REG_EXTEND3);
-		data->voltage[INPUT][5] = adt7475_read(REG_VTT) << 2 |
+		val = adt7475_read(REG_STATUS4);
+		if (val < 0)
+			return val;
+		data->alarms |= val << 24;
+
+		val = adt7475_read(REG_EXTEND3);
+		if (val < 0)
+			return val;
+		ext = val;
+
+		val = adt7475_read(REG_VTT);
+		if (val < 0)
+			return val;
+		data->voltage[INPUT][5] = val << 2 |
 			((ext >> 4) & 3);
 	}
 
 	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
 		if (i == 3 && !data->has_fan4)
 			continue;
-		data->tach[INPUT][i] =
-			adt7475_read_word(client, TACH_REG(i));
+		val = adt7475_read_word(client, TACH_REG(i));
+		if (val < 0)
+			return val;
+		data->tach[INPUT][i] = val;
 	}
 
 	/* Updated by hw when in auto mode */
 	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
 		if (i == 1 && !data->has_pwm2)
 			continue;
-		data->pwm[INPUT][i] = adt7475_read(PWM_REG(i));
+		val = adt7475_read(PWM_REG(i));
+		if (val < 0)
+			return val;
+		data->pwm[INPUT][i] = val;
 	}
 
-	if (data->has_vid)
-		data->vid = adt7475_read(REG_VID) & 0x3f;
+	if (data->has_vid) {
+		val = adt7475_read(REG_VID);
+		if (val < 0)
+			return val;
+		data->vid = val & 0x3f;
+	}
 
 	return 0;
 }
@@ -1733,59 +1776,113 @@ static int adt7475_update_limits(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
 	int i;
+	int val;
 
-	data->config4 = adt7475_read(REG_CONFIG4);
-	data->config5 = adt7475_read(REG_CONFIG5);
+	val = adt7475_read(REG_CONFIG4);
+	if (val < 0)
+		return val;
+	data->config4 = val;
+
+	val = adt7475_read(REG_CONFIG5);
+	if (val < 0)
+		return val;
+	data->config5 = val;
 
 	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
 		if (!(data->has_voltage & (1 << i)))
 			continue;
 		/* Adjust values so they match the input precision */
-		data->voltage[MIN][i] =
-			adt7475_read(VOLTAGE_MIN_REG(i)) << 2;
-		data->voltage[MAX][i] =
-			adt7475_read(VOLTAGE_MAX_REG(i)) << 2;
+		val = adt7475_read(VOLTAGE_MIN_REG(i));
+		if (val < 0)
+			return val;
+		data->voltage[MIN][i] = val << 2;
+
+		val = adt7475_read(VOLTAGE_MAX_REG(i));
+		if (val < 0)
+			return val;
+		data->voltage[MAX][i] = val << 2;
 	}
 
 	if (data->has_voltage & (1 << 5)) {
-		data->voltage[MIN][5] = adt7475_read(REG_VTT_MIN) << 2;
-		data->voltage[MAX][5] = adt7475_read(REG_VTT_MAX) << 2;
+		val = adt7475_read(REG_VTT_MIN);
+		if (val < 0)
+			return val;
+		data->voltage[MIN][5] = val << 2;
+
+		val = adt7475_read(REG_VTT_MAX);
+		if (val < 0)
+			return val;
+		data->voltage[MAX][5] = val << 2;
 	}
 
 	for (i = 0; i < ADT7475_TEMP_COUNT; i++) {
 		/* Adjust values so they match the input precision */
-		data->temp[MIN][i] =
-			adt7475_read(TEMP_MIN_REG(i)) << 2;
-		data->temp[MAX][i] =
-			adt7475_read(TEMP_MAX_REG(i)) << 2;
-		data->temp[AUTOMIN][i] =
-			adt7475_read(TEMP_TMIN_REG(i)) << 2;
-		data->temp[THERM][i] =
-			adt7475_read(TEMP_THERM_REG(i)) << 2;
-		data->temp[OFFSET][i] =
-			adt7475_read(TEMP_OFFSET_REG(i));
+		val = adt7475_read(TEMP_MIN_REG(i));
+		if (val < 0)
+			return val;
+		data->temp[MIN][i] = val << 2;
+
+		val = adt7475_read(TEMP_MAX_REG(i));
+		if (val < 0)
+			return val;
+		data->temp[MAX][i] = val << 2;
+
+		val = adt7475_read(TEMP_TMIN_REG(i));
+		if (val < 0)
+			return val;
+		data->temp[AUTOMIN][i] = val << 2;
+
+		val = adt7475_read(TEMP_THERM_REG(i));
+		if (val < 0)
+			return val;
+		data->temp[THERM][i] = val << 2;
+
+		val = adt7475_read(TEMP_OFFSET_REG(i));
+		if (val < 0)
+			return val;
+		data->temp[OFFSET][i] = val;
 	}
 	adt7475_read_hystersis(client);
 
 	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
 		if (i == 3 && !data->has_fan4)
 			continue;
-		data->tach[MIN][i] =
-			adt7475_read_word(client, TACH_MIN_REG(i));
+		val = adt7475_read_word(client, TACH_MIN_REG(i));
+		if (val < 0)
+			return val;
+		data->tach[MIN][i] = val;
 	}
 
 	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
 		if (i == 1 && !data->has_pwm2)
 			continue;
-		data->pwm[MAX][i] = adt7475_read(PWM_MAX_REG(i));
-		data->pwm[MIN][i] = adt7475_read(PWM_MIN_REG(i));
+		val = adt7475_read(PWM_MAX_REG(i));
+		if (val < 0)
+			return val;
+		data->pwm[MAX][i] = val;
+
+		val = adt7475_read(PWM_MIN_REG(i));
+		if (val < 0)
+			return val;
+		data->pwm[MIN][i] = val;
 		/* Set the channel and control information */
 		adt7475_read_pwm(client, i);
 	}
 
-	data->range[0] = adt7475_read(TEMP_TRANGE_REG(0));
-	data->range[1] = adt7475_read(TEMP_TRANGE_REG(1));
-	data->range[2] = adt7475_read(TEMP_TRANGE_REG(2));
+	val = adt7475_read(TEMP_TRANGE_REG(0));
+	if (val < 0)
+		return val;
+	data->range[0] = val;
+
+	val = adt7475_read(TEMP_TRANGE_REG(1));
+	if (val < 0)
+		return val;
+	data->range[1] = val;
+
+	val = adt7475_read(TEMP_TRANGE_REG(2));
+	if (val < 0)
+		return val;
+	data->range[2] = val;
 
 	return 0;
 }
-- 
2.16.1

