Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.112]:27867 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726245AbeHHDxr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 23:53:47 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v3 3/4] hwmon: (adt7475) Change update functions to add error handling
Date: Wed,  8 Aug 2018 10:32:18 +0900
Message-Id: <20180808013219.26118-4-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
References: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
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
Changes since v2:
- Change to rebase on the v3 patch 1.

Changes since v1:
- Move the changes in adt7475_update_device() to patch 4.

 drivers/hwmon/adt7475.c | 187 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 145 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index d90b31eb3472..9f7e1a5b08a5 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1384,63 +1384,119 @@ static void adt7475_remove_files(struct i2c_client *client,
 		sysfs_remove_group(&client->dev.kobj, &vid_attr_group);
 }
 
-static void adt7475_update_limits(struct i2c_client *client)
+static int adt7475_update_limits(struct i2c_client *client)
 {
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
 
 static int adt7475_probe(struct i2c_client *client,
@@ -1719,54 +1775,101 @@ static void adt7475_read_pwm(struct i2c_client *client, int index)
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
+
+	ret = adt7475_read(REG_STATUS2);
+	if (ret < 0)
+		return ret;
+	data->alarms = ret << 8;
 
-	data->alarms = adt7475_read(REG_STATUS2) << 8;
-	data->alarms |= adt7475_read(REG_STATUS1);
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
 
 static struct adt7475_data *adt7475_update_device(struct device *dev)
-- 
2.16.1

