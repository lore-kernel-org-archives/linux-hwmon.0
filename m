Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41255 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752535AbcF3NvP (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 30 Jun 2016 09:51:15 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/6] hwmon: (lm90) Simplify read functions
Date: Thu, 30 Jun 2016 06:50:58 -0700
Message-Id: <1467294661-23879-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
References: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Return both error code and register value as return code from
read functions, and always check for errors.

This reduces code size on x86_64 by more than 1k while at
the same time improving error resiliency.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 308 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 193 insertions(+), 115 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 9d733cb0504c..2a330bdbf1bc 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -171,7 +171,6 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
 
 #define SA56004_REG_R_LOCAL_TEMPL 0x22
 
-#define LM90_DEF_CONVRATE_RVAL	6	/* Def conversion rate register value */
 #define LM90_MAX_CONVRATE_MS	16000	/* Maximum conversion rate in ms */
 
 /* TMP451 registers */
@@ -410,7 +409,7 @@ static inline s32 adm1032_write_byte(struct i2c_client *client, u8 value)
  * because we don't want the address pointer to change between the write
  * byte and the read byte transactions.
  */
-static int lm90_read_reg(struct i2c_client *client, u8 reg, u8 *value)
+static int lm90_read_reg(struct i2c_client *client, u8 reg)
 {
 	int err;
 
@@ -421,20 +420,12 @@ static int lm90_read_reg(struct i2c_client *client, u8 reg, u8 *value)
 	} else
 		err = i2c_smbus_read_byte_data(client, reg);
 
-	if (err < 0) {
-		dev_warn(&client->dev, "Register %#02x read failed (%d)\n",
-			 reg, err);
-		return err;
-	}
-	*value = err;
-
-	return 0;
+	return err;
 }
 
-static int lm90_read16(struct i2c_client *client, u8 regh, u8 regl, u16 *value)
+static int lm90_read16(struct i2c_client *client, u8 regh, u8 regl)
 {
-	int err;
-	u8 oldh, newh, l;
+	int oldh, newh, l;
 
 	/*
 	 * There is a trick here. We have to read two registers to have the
@@ -449,18 +440,21 @@ static int lm90_read16(struct i2c_client *client, u8 regh, u8 regl, u16 *value)
 	 * we have to read the low byte again, and now we believe we have a
 	 * correct reading.
 	 */
-	if ((err = lm90_read_reg(client, regh, &oldh))
-	 || (err = lm90_read_reg(client, regl, &l))
-	 || (err = lm90_read_reg(client, regh, &newh)))
-		return err;
+	oldh = lm90_read_reg(client, regh);
+	if (oldh < 0)
+		return oldh;
+	l = lm90_read_reg(client, regl);
+	if (l < 0)
+		return l;
+	newh = lm90_read_reg(client, regh);
+	if (newh < 0)
+		return newh;
 	if (oldh != newh) {
-		err = lm90_read_reg(client, regl, &l);
-		if (err)
-			return err;
+		l = lm90_read_reg(client, regl);
+		if (l < 0)
+			return l;
 	}
-	*value = (newh << 8) | l;
-
-	return 0;
+	return (newh << 8) | l;
 }
 
 /*
@@ -471,20 +465,23 @@ static int lm90_read16(struct i2c_client *client, u8 regh, u8 regl, u16 *value)
  * various registers have different meanings as a result of selecting a
  * non-default remote channel.
  */
-static inline void lm90_select_remote_channel(struct i2c_client *client,
-					      struct lm90_data *data,
-					      int channel)
+static inline int lm90_select_remote_channel(struct i2c_client *client,
+					     struct lm90_data *data,
+					     int channel)
 {
-	u8 config;
+	int config;
 
 	if (data->kind == max6696) {
-		lm90_read_reg(client, LM90_REG_R_CONFIG1, &config);
+		config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
+		if (config < 0)
+			return config;
 		config &= ~0x08;
 		if (channel)
 			config |= 0x08;
 		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
 					  config);
 	}
+	return 0;
 }
 
 /*
@@ -516,104 +513,153 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	unsigned long next_update;
+	int val = 0;
 
 	mutex_lock(&data->update_lock);
 
 	next_update = data->last_updated +
 		      msecs_to_jiffies(data->update_interval);
 	if (time_after(jiffies, next_update) || !data->valid) {
-		u8 h, l;
-		u8 alarms;
-
 		dev_dbg(&client->dev, "Updating lm90 data.\n");
-		lm90_read_reg(client, LM90_REG_R_LOCAL_LOW,
-			      &data->temp8[LOCAL_LOW]);
-		lm90_read_reg(client, LM90_REG_R_LOCAL_HIGH,
-			      &data->temp8[LOCAL_HIGH]);
-		lm90_read_reg(client, LM90_REG_R_LOCAL_CRIT,
-			      &data->temp8[LOCAL_CRIT]);
-		lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT,
-			      &data->temp8[REMOTE_CRIT]);
-		lm90_read_reg(client, LM90_REG_R_TCRIT_HYST, &data->temp_hyst);
+		val = lm90_read_reg(client, LM90_REG_R_LOCAL_LOW);
+		if (val < 0)
+			goto error;
+		data->temp8[LOCAL_LOW] = val;
+
+		val = lm90_read_reg(client, LM90_REG_R_LOCAL_HIGH);
+		if (val < 0)
+			goto error;
+		data->temp8[LOCAL_HIGH] = val;
+
+		val = lm90_read_reg(client, LM90_REG_R_LOCAL_CRIT);
+		if (val < 0)
+			goto error;
+		data->temp8[LOCAL_CRIT] = val;
+
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
+		if (val < 0)
+			goto error;
+		data->temp8[REMOTE_CRIT] = val;
+		val = lm90_read_reg(client, LM90_REG_R_TCRIT_HYST);
+		if (val < 0)
+			goto error;
+		data->temp_hyst = val;
 
 		if (data->reg_local_ext) {
-			lm90_read16(client, LM90_REG_R_LOCAL_TEMP,
-				    data->reg_local_ext,
-				    &data->temp11[LOCAL_TEMP]);
+			val = lm90_read16(client, LM90_REG_R_LOCAL_TEMP,
+					  data->reg_local_ext);
+			if (val < 0)
+				goto error;
+			data->temp11[LOCAL_TEMP] = val;
 		} else {
-			if (lm90_read_reg(client, LM90_REG_R_LOCAL_TEMP,
-					  &h) == 0)
-				data->temp11[LOCAL_TEMP] = h << 8;
+			val = lm90_read_reg(client, LM90_REG_R_LOCAL_TEMP);
+			if (val < 0)
+				goto error;
+			data->temp11[LOCAL_TEMP] = val << 8;
 		}
-		lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
-			    LM90_REG_R_REMOTE_TEMPL,
-			    &data->temp11[REMOTE_TEMP]);
-
-		if (lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH, &h) == 0) {
-			data->temp11[REMOTE_LOW] = h << 8;
-			if ((data->flags & LM90_HAVE_REM_LIMIT_EXT)
-			 && lm90_read_reg(client, LM90_REG_R_REMOTE_LOWL,
-					  &l) == 0)
-				data->temp11[REMOTE_LOW] |= l;
+		val = lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
+				  LM90_REG_R_REMOTE_TEMPL);
+		if (val < 0)
+			goto error;
+		data->temp11[REMOTE_TEMP] = val;
+
+		lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
+		if (val < 0)
+			goto error;
+		data->temp11[REMOTE_LOW] = val << 8;
+		if (data->flags & LM90_HAVE_REM_LIMIT_EXT) {
+			val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWL);
+			if (val < 0)
+				goto error;
+			data->temp11[REMOTE_LOW] |= val;
 		}
-		if (lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH, &h) == 0) {
-			data->temp11[REMOTE_HIGH] = h << 8;
-			if ((data->flags & LM90_HAVE_REM_LIMIT_EXT)
-			 && lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHL,
-					  &l) == 0)
-				data->temp11[REMOTE_HIGH] |= l;
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH);
+		if (val < 0)
+			goto error;
+		data->temp11[REMOTE_HIGH] = val << 8;
+		if (data->flags & LM90_HAVE_REM_LIMIT_EXT) {
+			val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHL);
+			if (val < 0)
+				goto error;
+			data->temp11[REMOTE_HIGH] |= val;
 		}
 
 		if (data->flags & LM90_HAVE_OFFSET) {
-			if (lm90_read_reg(client, LM90_REG_R_REMOTE_OFFSH,
-					  &h) == 0
-			 && lm90_read_reg(client, LM90_REG_R_REMOTE_OFFSL,
-					  &l) == 0)
-				data->temp11[REMOTE_OFFSET] = (h << 8) | l;
+			val = lm90_read16(client, LM90_REG_R_REMOTE_OFFSH,
+					  LM90_REG_R_REMOTE_OFFSL);
+			if (val < 0)
+				goto error;
+			data->temp11[REMOTE_OFFSET] = val;
 		}
 		if (data->flags & LM90_HAVE_EMERGENCY) {
-			lm90_read_reg(client, MAX6659_REG_R_LOCAL_EMERG,
-				      &data->temp8[LOCAL_EMERG]);
-			lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG,
-				      &data->temp8[REMOTE_EMERG]);
+			val = lm90_read_reg(client, MAX6659_REG_R_LOCAL_EMERG);
+			if (val < 0)
+				goto error;
+			data->temp8[LOCAL_EMERG] = val;
+			val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
+			if (val < 0)
+				goto error;
+			data->temp8[REMOTE_EMERG] = val;
 		}
-		lm90_read_reg(client, LM90_REG_R_STATUS, &alarms);
-		data->alarms = alarms;	/* save as 16 bit value */
+		val = lm90_read_reg(client, LM90_REG_R_STATUS);
+		if (val < 0)
+			goto error;
+		data->alarms = val;	/* lower 8 bit of alarms */
 
 		if (data->kind == max6696) {
-			lm90_select_remote_channel(client, data, 1);
-			lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT,
-				      &data->temp8[REMOTE2_CRIT]);
-			lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG,
-				      &data->temp8[REMOTE2_EMERG]);
-			lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
-				    LM90_REG_R_REMOTE_TEMPL,
-				    &data->temp11[REMOTE2_TEMP]);
-			if (!lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH, &h))
-				data->temp11[REMOTE2_LOW] = h << 8;
-			if (!lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH, &h))
-				data->temp11[REMOTE2_HIGH] = h << 8;
+			val = lm90_select_remote_channel(client, data, 1);
+			if (val < 0)
+				goto error;
+
+			val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
+			if (val < 0)
+				goto error;
+			data->temp8[REMOTE2_CRIT] = val;
+
+			val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
+			if (val < 0)
+				goto error;
+			data->temp8[REMOTE2_EMERG] = val;
+
+			val = lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
+					  LM90_REG_R_REMOTE_TEMPL);
+			if (val < 0)
+				goto error;
+			data->temp11[REMOTE2_TEMP] = val;
+
+			val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
+			if (val < 0)
+				goto error;
+			data->temp11[REMOTE2_LOW] = val << 8;
+
+			val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH);
+			if (val < 0)
+				goto error;
+			data->temp11[REMOTE2_HIGH] = val << 8;
+
 			lm90_select_remote_channel(client, data, 0);
 
-			if (!lm90_read_reg(client, MAX6696_REG_R_STATUS2,
-					   &alarms))
-				data->alarms |= alarms << 8;
+			val = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
+			if (val < 0)
+				goto error;
+			data->alarms |= val << 8;
 		}
 
 		/*
 		 * Re-enable ALERT# output if it was originally enabled and
 		 * relevant alarms are all clear
 		 */
-		if ((data->config_orig & 0x80) == 0
-		 && (data->alarms & data->alert_alarms) == 0) {
-			u8 config;
+		if (!(data->config_orig & 0x80) &&
+		    !(data->alarms & data->alert_alarms)) {
+			val = lm90_read_reg(client, LM90_REG_R_CONFIG1);
+			if (val < 0)
+				goto error;
 
-			lm90_read_reg(client, LM90_REG_R_CONFIG1, &config);
-			if (config & 0x80) {
+			if (val & 0x80) {
 				dev_dbg(&client->dev, "Re-enabling ALERT#\n");
 				i2c_smbus_write_byte_data(client,
 							  LM90_REG_W_CONFIG1,
-							  config & ~0x80);
+							  val & ~0x80);
 			}
 		}
 
@@ -621,8 +667,12 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 		data->valid = 1;
 	}
 
+error:
 	mutex_unlock(&data->update_lock);
 
+	if (val < 0)
+		return ERR_PTR(val);
+
 	return data;
 }
 
@@ -764,6 +814,9 @@ static ssize_t show_temp8(struct device *dev, struct device_attribute *devattr,
 	struct lm90_data *data = lm90_update_device(dev);
 	int temp;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (data->kind == adt7461 || data->kind == tmp451)
 		temp = temp_from_u8_adt7461(data, data->temp8[attr->index]);
 	else if (data->kind == max6646)
@@ -830,6 +883,9 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
 	struct lm90_data *data = lm90_update_device(dev);
 	int temp;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (data->kind == adt7461 || data->kind == tmp451)
 		temp = temp_from_u16_adt7461(data, data->temp11[attr->index]);
 	else if (data->kind == max6646)
@@ -905,6 +961,9 @@ static ssize_t show_temphyst(struct device *dev,
 	struct lm90_data *data = lm90_update_device(dev);
 	int temp;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (data->kind == adt7461 || data->kind == tmp451)
 		temp = temp_from_u8_adt7461(data, data->temp8[attr->index]);
 	else if (data->kind == max6646)
@@ -951,6 +1010,10 @@ static ssize_t show_alarms(struct device *dev, struct device_attribute *dummy,
 			   char *buf)
 {
 	struct lm90_data *data = lm90_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->alarms);
 }
 
@@ -961,6 +1024,9 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute
 	struct lm90_data *data = lm90_update_device(dev);
 	int bitnr = attr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
 }
 
@@ -1414,24 +1480,22 @@ static void lm90_restore_conf(void *_data)
 				  data->config_orig);
 }
 
-static void lm90_init_client(struct i2c_client *client, struct lm90_data *data)
+static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 {
-	u8 config, convrate;
+	int config, convrate;
 
-	if (lm90_read_reg(client, LM90_REG_R_CONVRATE, &convrate) < 0) {
-		dev_warn(&client->dev, "Failed to read convrate register!\n");
-		convrate = LM90_DEF_CONVRATE_RVAL;
-	}
+	convrate = lm90_read_reg(client, LM90_REG_R_CONVRATE);
+	if (convrate < 0)
+		return convrate;
 	data->convrate_orig = convrate;
 
 	/*
 	 * Start the conversions.
 	 */
 	lm90_set_convrate(client, data, 500);	/* 500ms; 2Hz conversion rate */
-	if (lm90_read_reg(client, LM90_REG_R_CONFIG1, &config) < 0) {
-		dev_warn(&client->dev, "Initialization failed!\n");
-		return;
-	}
+	config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
+	if (config < 0)
+		return config;
 	data->config_orig = config;
 
 	/* Check Temperature Range Select */
@@ -1459,17 +1523,24 @@ static void lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
 
 	devm_add_action(&client->dev, lm90_restore_conf, data);
+
+	return 0;
 }
 
 static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
 {
 	struct lm90_data *data = i2c_get_clientdata(client);
-	u8 st, st2 = 0;
+	int st, st2 = 0;
 
-	lm90_read_reg(client, LM90_REG_R_STATUS, &st);
+	st = lm90_read_reg(client, LM90_REG_R_STATUS);
+	if (st < 0)
+		return false;
 
-	if (data->kind == max6696)
-		lm90_read_reg(client, MAX6696_REG_R_STATUS2, &st2);
+	if (data->kind == max6696) {
+		st2 = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
+		if (st2 < 0)
+			return false;
+	}
 
 	*status = st | (st2 << 8);
 
@@ -1571,7 +1642,11 @@ static int lm90_probe(struct i2c_client *client,
 	data->max_convrate = lm90_params[data->kind].max_convrate;
 
 	/* Initialize the LM90 chip */
-	lm90_init_client(client, data);
+	err = lm90_init_client(client, data);
+	if (err < 0) {
+		dev_err(dev, "Failed to initialize device\n");
+		return err;
+	}
 
 	/* Register sysfs hooks */
 	data->groups[groups++] = &lm90_group;
@@ -1627,13 +1702,16 @@ static void lm90_alert(struct i2c_client *client, unsigned int flag)
 		 */
 		struct lm90_data *data = i2c_get_clientdata(client);
 
-		if ((data->flags & LM90_HAVE_BROKEN_ALERT)
-		 && (alarms & data->alert_alarms)) {
-			u8 config;
+		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
+		    (alarms & data->alert_alarms)) {
+			int config;
+
 			dev_dbg(&client->dev, "Disabling ALERT#\n");
-			lm90_read_reg(client, LM90_REG_R_CONFIG1, &config);
-			i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
-						  config | 0x80);
+			config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
+			if (config >= 0)
+				i2c_smbus_write_byte_data(client,
+							  LM90_REG_W_CONFIG1,
+							  config | 0x80);
 		}
 	} else {
 		dev_info(&client->dev, "Everything OK\n");
-- 
2.5.0

