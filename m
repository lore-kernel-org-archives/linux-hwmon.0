Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.210]:61577 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727669AbeHGLMI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 07:12:08 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 3/4] hwmon: (adt7475) Change update functions to add error handling
Date: Tue,  7 Aug 2018 17:57:32 +0900
Message-Id: <20180807085733.28756-4-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180807085733.28756-1-ikegami@allied-telesis.co.jp>
References: <20180807085733.28756-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

I2C SMBus is sometimes possible to return error codes.
And at the error case the measurement values are updated incorrectly.
The sensor application sends warning log message and SNMP trap.
To prevent this add error handling into the update functions.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 202 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 158 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 5f03a93632c3..fb89b88f1998 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1658,127 +1658,236 @@ static void adt7475_read_pwm(struct i2c_client *client, int index)
 	}
 }
 
-static void adt7475_update_measure(struct device *dev)
+static int adt7475_update_measure(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
 	u16 ext;
 	int i;
+	int ret;
 
-	data->alarms = adt7475_read(REG_STATUS2) << 8;
-	data->alarms |= adt7475_read(REG_STATUS1);
+	ret = adt7475_read(REG_STATUS2);
+	if (ret < 0)
+		return ret;
+	data->alarms = ret << 8;
+
+	ret = adt7475_read(REG_STATUS1);
+	if (ret < 0)
+		return ret;
+	data->alarms |= ret;
+
+	ret = adt7475_read(REG_EXTEND2);
+	if (ret < 0)
+		return ret;
+
+	ext = (ret << 8);
+
+	ret = adt7475_read(REG_EXTEND1);
+	if (ret < 0)
+		return ret;
+
+	ext |= ret;
 
-	ext = (adt7475_read(REG_EXTEND2) << 8) |
-		adt7475_read(REG_EXTEND1);
 	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
 		if (!(data->has_voltage & (1 << i)))
 			continue;
+		ret = adt7475_read(VOLTAGE_REG(i));
+		if (ret < 0)
+			return ret;
 		data->voltage[INPUT][i] =
-			(adt7475_read(VOLTAGE_REG(i)) << 2) |
+			(ret << 2) |
 			((ext >> (i * 2)) & 3);
 	}
 
-	for (i = 0; i < ADT7475_TEMP_COUNT; i++)
+	for (i = 0; i < ADT7475_TEMP_COUNT; i++) {
+		ret = adt7475_read(TEMP_REG(i));
+		if (ret < 0)
+			return ret;
 		data->temp[INPUT][i] =
-			(adt7475_read(TEMP_REG(i)) << 2) |
+			(ret << 2) |
 			((ext >> ((i + 5) * 2)) & 3);
+	}
 
 	if (data->has_voltage & (1 << 5)) {
-		data->alarms |= adt7475_read(REG_STATUS4) << 24;
-		ext = adt7475_read(REG_EXTEND3);
-		data->voltage[INPUT][5] = adt7475_read(REG_VTT) << 2 |
+		ret = adt7475_read(REG_STATUS4);
+		if (ret < 0)
+			return ret;
+		data->alarms |= ret << 24;
+
+		ret = adt7475_read(REG_EXTEND3);
+		if (ret < 0)
+			return ret;
+		ext = ret;
+
+		ret = adt7475_read(REG_VTT);
+		if (ret < 0)
+			return ret;
+		data->voltage[INPUT][5] = ret << 2 |
 			((ext >> 4) & 3);
 	}
 
 	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
 		if (i == 3 && !data->has_fan4)
 			continue;
-		data->tach[INPUT][i] =
-			adt7475_read_word(client, TACH_REG(i));
+		ret = adt7475_read_word(client, TACH_REG(i));
+		if (ret < 0)
+			return ret;
+		data->tach[INPUT][i] = ret;
 	}
 
 	/* Updated by hw when in auto mode */
 	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
 		if (i == 1 && !data->has_pwm2)
 			continue;
-		data->pwm[INPUT][i] = adt7475_read(PWM_REG(i));
+		ret = adt7475_read(PWM_REG(i));
+		if (ret < 0)
+			return ret;
+		data->pwm[INPUT][i] = ret;
 	}
 
-	if (data->has_vid)
-		data->vid = adt7475_read(REG_VID) & 0x3f;
+	if (data->has_vid) {
+		ret = adt7475_read(REG_VID);
+		if (ret < 0)
+			return ret;
+		data->vid = ret & 0x3f;
+	}
+
+	return 0;
 }
 
-static void adt7475_update_limits(struct device *dev)
+static int adt7475_update_limits(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
 	int i;
+	int ret;
 
-	data->config4 = adt7475_read(REG_CONFIG4);
-	data->config5 = adt7475_read(REG_CONFIG5);
+	ret = adt7475_read(REG_CONFIG4);
+	if (ret < 0)
+		return ret;
+	data->config4 = ret;
+
+	ret = adt7475_read(REG_CONFIG5);
+	if (ret < 0)
+		return ret;
+	data->config5 = ret;
 
 	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
 		if (!(data->has_voltage & (1 << i)))
 			continue;
 		/* Adjust values so they match the input precision */
-		data->voltage[MIN][i] =
-			adt7475_read(VOLTAGE_MIN_REG(i)) << 2;
-		data->voltage[MAX][i] =
-			adt7475_read(VOLTAGE_MAX_REG(i)) << 2;
+		ret = adt7475_read(VOLTAGE_MIN_REG(i));
+		if (ret < 0)
+			return ret;
+		data->voltage[MIN][i] = ret << 2;
+
+		ret = adt7475_read(VOLTAGE_MAX_REG(i));
+		if (ret < 0)
+			return ret;
+		data->voltage[MAX][i] = ret << 2;
 	}
 
 	if (data->has_voltage & (1 << 5)) {
-		data->voltage[MIN][5] = adt7475_read(REG_VTT_MIN) << 2;
-		data->voltage[MAX][5] = adt7475_read(REG_VTT_MAX) << 2;
+		ret = adt7475_read(REG_VTT_MIN);
+		if (ret < 0)
+			return ret;
+		data->voltage[MIN][5] = ret << 2;
+
+		ret = adt7475_read(REG_VTT_MAX);
+		if (ret < 0)
+			return ret;
+		data->voltage[MAX][5] = ret << 2;
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
+		ret = adt7475_read(TEMP_MIN_REG(i));
+		if (ret < 0)
+			return ret;
+		data->temp[MIN][i] = ret << 2;
+
+		ret = adt7475_read(TEMP_MAX_REG(i));
+		if (ret < 0)
+			return ret;
+		data->temp[MAX][i] = ret << 2;
+
+		ret = adt7475_read(TEMP_TMIN_REG(i));
+		if (ret < 0)
+			return ret;
+		data->temp[AUTOMIN][i] = ret << 2;
+
+		ret = adt7475_read(TEMP_THERM_REG(i));
+		if (ret < 0)
+			return ret;
+		data->temp[THERM][i] = ret << 2;
+
+		ret = adt7475_read(TEMP_OFFSET_REG(i));
+		if (ret < 0)
+			return ret;
+		data->temp[OFFSET][i] = ret;
 	}
 	adt7475_read_hystersis(client);
 
 	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
 		if (i == 3 && !data->has_fan4)
 			continue;
-		data->tach[MIN][i] =
-			adt7475_read_word(client, TACH_MIN_REG(i));
+		ret = adt7475_read_word(client, TACH_MIN_REG(i));
+		if (ret < 0)
+			return ret;
+		data->tach[MIN][i] = ret;
 	}
 
 	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
 		if (i == 1 && !data->has_pwm2)
 			continue;
-		data->pwm[MAX][i] = adt7475_read(PWM_MAX_REG(i));
-		data->pwm[MIN][i] = adt7475_read(PWM_MIN_REG(i));
+		ret = adt7475_read(PWM_MAX_REG(i));
+		if (ret < 0)
+			return ret;
+		data->pwm[MAX][i] = ret;
+
+		ret = adt7475_read(PWM_MIN_REG(i));
+		if (ret < 0)
+			return ret;
+		data->pwm[MIN][i] = ret;
 		/* Set the channel and control information */
 		adt7475_read_pwm(client, i);
 	}
 
-	data->range[0] = adt7475_read(TEMP_TRANGE_REG(0));
-	data->range[1] = adt7475_read(TEMP_TRANGE_REG(1));
-	data->range[2] = adt7475_read(TEMP_TRANGE_REG(2));
+	ret = adt7475_read(TEMP_TRANGE_REG(0));
+	if (ret < 0)
+		return ret;
+	data->range[0] = ret;
+
+	ret = adt7475_read(TEMP_TRANGE_REG(1));
+	if (ret < 0)
+		return ret;
+	data->range[1] = ret;
+
+	ret = adt7475_read(TEMP_TRANGE_REG(2));
+	if (ret < 0)
+		return ret;
+	data->range[2] = ret;
+
+	return 0;
 }
 
 static struct adt7475_data *adt7475_update_device(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
+	int ret;
 
 	mutex_lock(&data->lock);
 
 	/* Measurement values update every 2 seconds */
 	if (time_after(jiffies, data->measure_updated + HZ * 2) ||
 	    !data->valid) {
-		adt7475_update_measure(dev);
+		ret = adt7475_update_measure(dev);
+		if (ret < 0) {
+			data->valid = false;
+			mutex_unlock(&data->lock);
+			return ERR_PTR(ret);
+		}
 		data->measure_updated = jiffies;
 		data->valid = true;
 	}
@@ -1786,7 +1895,12 @@ static struct adt7475_data *adt7475_update_device(struct device *dev)
 	/* Limits and settings, should never change update every 60 seconds */
 	if (time_after(jiffies, data->limits_updated + HZ * 60) ||
 	    !data->valid) {
-		adt7475_update_limits(dev);
+		ret = adt7475_update_limits(dev);
+		if (ret < 0) {
+			data->valid = false;
+			mutex_unlock(&data->lock);
+			return ERR_PTR(ret);
+		}
 		data->limits_updated = jiffies;
 		data->valid = true;
 	}
-- 
2.16.1

