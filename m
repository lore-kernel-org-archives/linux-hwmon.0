Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/9] hwmon: (lm90) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:44 -0700
Message-Id: <1471153911-6536-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Reduce driver complexity and size by converting it to
the new hwmon API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 812 +++++++++++++++++++++++++++------------------------
 1 file changed, 435 insertions(+), 377 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 496e771b363f..9d887a6c0e6a 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -89,7 +89,6 @@
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
@@ -326,7 +325,7 @@ static const struct lm90_params lm90_params[] = {
 		.alert_alarms = 0x7c,
 		.max_convrate = 9,
 		.reg_local_ext = TMP451_REG_R_LOCAL_TEMPL,
-	}
+	},
 };
 
 /*
@@ -365,7 +364,10 @@ enum lm90_temp11_reg_index {
 
 struct lm90_data {
 	struct i2c_client *client;
-	const struct attribute_group *groups[6];
+	u32 channel_config[4];
+	struct hwmon_channel_info temp_info;
+	const struct hwmon_channel_info *info[3];
+	struct hwmon_chip_info chip;
 	struct mutex update_lock;
 	bool valid;		/* true if register values are valid */
 	unsigned long last_updated; /* in jiffies */
@@ -489,11 +491,11 @@ static inline int lm90_select_remote_channel(struct i2c_client *client,
  * client->update_lock must be held when calling this function (unless we are
  * in detection or initialization steps).
  */
-static void lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
-			      unsigned int interval)
+static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
+			     unsigned int interval)
 {
-	int i;
 	unsigned int update_interval;
+	int i, err;
 
 	/* Shift calculations to avoid rounding errors */
 	interval <<= 6;
@@ -504,8 +506,9 @@ static void lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
 		if (interval >= update_interval * 3 / 4)
 			break;
 
-	i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
+	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
 	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
+	return err;
 }
 
 static int lm90_update_limits(struct device *dev)
@@ -604,19 +607,17 @@ static int lm90_update_limits(struct device *dev)
 	return 0;
 }
 
-static struct lm90_data *lm90_update_device(struct device *dev)
+static int lm90_update_device(struct device *dev)
 {
 	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	unsigned long next_update;
-	int val = 0;
-
-	mutex_lock(&data->update_lock);
+	int val;
 
 	if (!data->valid) {
 		val = lm90_update_limits(dev);
 		if (val < 0)
-			goto error;
+			return val;
 	}
 
 	next_update = data->last_updated +
@@ -628,53 +629,55 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 
 		val = lm90_read_reg(client, LM90_REG_R_LOCAL_LOW);
 		if (val < 0)
-			goto error;
+			return val;
 		data->temp8[LOCAL_LOW] = val;
 
 		val = lm90_read_reg(client, LM90_REG_R_LOCAL_HIGH);
 		if (val < 0)
-			goto error;
+			return val;
 		data->temp8[LOCAL_HIGH] = val;
 
 		if (data->reg_local_ext) {
 			val = lm90_read16(client, LM90_REG_R_LOCAL_TEMP,
 					  data->reg_local_ext);
 			if (val < 0)
-				goto error;
+				return val;
 			data->temp11[LOCAL_TEMP] = val;
 		} else {
 			val = lm90_read_reg(client, LM90_REG_R_LOCAL_TEMP);
 			if (val < 0)
-				goto error;
+				return val;
 			data->temp11[LOCAL_TEMP] = val << 8;
 		}
 		val = lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
 				  LM90_REG_R_REMOTE_TEMPL);
 		if (val < 0)
-			goto error;
+			return val;
 		data->temp11[REMOTE_TEMP] = val;
 
 		val = lm90_read_reg(client, LM90_REG_R_STATUS);
 		if (val < 0)
-			goto error;
+			return val;
 		data->alarms = val;	/* lower 8 bit of alarms */
 
 		if (data->kind == max6696) {
 			val = lm90_select_remote_channel(client, data, 1);
 			if (val < 0)
-				goto error;
+				return val;
 
 			val = lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
 					  LM90_REG_R_REMOTE_TEMPL);
-			if (val < 0)
-				goto error;
+			if (val < 0) {
+				lm90_select_remote_channel(client, data, 0);
+				return val;
+			}
 			data->temp11[REMOTE2_TEMP] = val;
 
 			lm90_select_remote_channel(client, data, 0);
 
 			val = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
 			if (val < 0)
-				goto error;
+				return val;
 			data->alarms |= val << 8;
 		}
 
@@ -686,7 +689,7 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 		    !(data->alarms & data->alert_alarms)) {
 			val = lm90_read_reg(client, LM90_REG_R_CONFIG1);
 			if (val < 0)
-				goto error;
+				return val;
 
 			if (val & 0x80) {
 				dev_dbg(&client->dev, "Re-enabling ALERT#\n");
@@ -700,13 +703,7 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 		data->valid = true;
 	}
 
-error:
-	mutex_unlock(&data->update_lock);
-
-	if (val < 0)
-		return ERR_PTR(val);
-
-	return data;
+	return 0;
 }
 
 /*
@@ -832,52 +829,19 @@ static u16 temp_to_u16_adt7461(struct lm90_data *data, long val)
 	return (val + 125) / 250 * 64;
 }
 
-/*
- * Sysfs stuff
- */
-
-static ssize_t show_temp8(struct device *dev, struct device_attribute *devattr,
-			  char *buf)
+/* pec used for ADM1032 only */
+static ssize_t show_pec(struct device *dev, struct device_attribute *dummy,
+			char *buf)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm90_data *data = lm90_update_device(dev);
-	int temp;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if (data->kind == adt7461 || data->kind == tmp451)
-		temp = temp_from_u8_adt7461(data, data->temp8[attr->index]);
-	else if (data->kind == max6646)
-		temp = temp_from_u8(data->temp8[attr->index]);
-	else
-		temp = temp_from_s8(data->temp8[attr->index]);
-
-	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind == lm99 && attr->index == 3)
-		temp += 16000;
+	struct i2c_client *client = to_i2c_client(dev);
 
-	return sprintf(buf, "%d\n", temp);
+	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
 }
 
-static ssize_t set_temp8(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
+static ssize_t set_pec(struct device *dev, struct device_attribute *dummy,
+		       const char *buf, size_t count)
 {
-	static const u8 reg[TEMP8_REG_NUM] = {
-		LM90_REG_W_LOCAL_LOW,
-		LM90_REG_W_LOCAL_HIGH,
-		LM90_REG_W_LOCAL_CRIT,
-		LM90_REG_W_REMOTE_CRIT,
-		MAX6659_REG_W_LOCAL_EMERG,
-		MAX6659_REG_W_REMOTE_EMERG,
-		LM90_REG_W_REMOTE_CRIT,
-		MAX6659_REG_W_REMOTE_EMERG,
-	};
-
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm90_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int nr = attr->index;
+	struct i2c_client *client = to_i2c_client(dev);
 	long val;
 	int err;
 
@@ -885,82 +849,61 @@ static ssize_t set_temp8(struct device *dev, struct device_attribute *devattr,
 	if (err < 0)
 		return err;
 
-	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind == lm99 && attr->index == 3)
-		val -= 16000;
-
-	mutex_lock(&data->update_lock);
-	if (data->kind == adt7461 || data->kind == tmp451)
-		data->temp8[nr] = temp_to_u8_adt7461(data, val);
-	else if (data->kind == max6646)
-		data->temp8[nr] = temp_to_u8(val);
-	else
-		data->temp8[nr] = temp_to_s8(val);
-
-	lm90_select_remote_channel(client, data, nr >= 6);
-	i2c_smbus_write_byte_data(client, reg[nr], data->temp8[nr]);
-	lm90_select_remote_channel(client, data, 0);
+	switch (val) {
+	case 0:
+		client->flags &= ~I2C_CLIENT_PEC;
+		break;
+	case 1:
+		client->flags |= I2C_CLIENT_PEC;
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	mutex_unlock(&data->update_lock);
 	return count;
 }
 
-static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
-			   char *buf)
+static DEVICE_ATTR(pec, S_IWUSR | S_IRUGO, show_pec, set_pec);
+
+static int lm90_get_temp11(struct lm90_data *data, int index)
 {
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
-	struct lm90_data *data = lm90_update_device(dev);
+	s16 temp11 = data->temp11[index];
 	int temp;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
 	if (data->kind == adt7461 || data->kind == tmp451)
-		temp = temp_from_u16_adt7461(data, data->temp11[attr->index]);
+		temp = temp_from_u16_adt7461(data, temp11);
 	else if (data->kind == max6646)
-		temp = temp_from_u16(data->temp11[attr->index]);
+		temp = temp_from_u16(temp11);
 	else
-		temp = temp_from_s16(data->temp11[attr->index]);
+		temp = temp_from_s16(temp11);
 
 	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind == lm99 &&  attr->index <= 2)
+	if (data->kind == lm99 && index <= 2)
 		temp += 16000;
 
-	return sprintf(buf, "%d\n", temp);
+	return temp;
 }
 
-static ssize_t set_temp11(struct device *dev, struct device_attribute *devattr,
-			  const char *buf, size_t count)
+static int lm90_set_temp11(struct lm90_data *data, int index, long val)
 {
-	struct {
+	static struct reg {
 		u8 high;
 		u8 low;
-		int channel;
-	} reg[5] = {
-		{ LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL, 0 },
-		{ LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL, 0 },
-		{ LM90_REG_W_REMOTE_OFFSH, LM90_REG_W_REMOTE_OFFSL, 0 },
-		{ LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL, 1 },
-		{ LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL, 1 }
+	} reg[] = {
+	[REMOTE_LOW] = { LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL },
+	[REMOTE_HIGH] = { LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL },
+	[REMOTE_OFFSET] = { LM90_REG_W_REMOTE_OFFSH, LM90_REG_W_REMOTE_OFFSL },
+	[REMOTE2_LOW] = { LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL },
+	[REMOTE2_HIGH] = { LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL }
 	};
-
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
-	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	int nr = attr->nr;
-	int index = attr->index;
-	long val;
+	struct reg *regp = &reg[index];
 	int err;
 
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
 	/* +16 degrees offset for temp2 for the LM99 */
 	if (data->kind == lm99 && index <= 2)
 		val -= 16000;
 
-	mutex_lock(&data->update_lock);
 	if (data->kind == adt7461 || data->kind == tmp451)
 		data->temp11[index] = temp_to_u16_adt7461(data, val);
 	else if (data->kind == max6646)
@@ -970,317 +913,383 @@ static ssize_t set_temp11(struct device *dev, struct device_attribute *devattr,
 	else
 		data->temp11[index] = temp_to_s8(val) << 8;
 
-	lm90_select_remote_channel(client, data, reg[nr].channel);
-	i2c_smbus_write_byte_data(client, reg[nr].high,
-				  data->temp11[index] >> 8);
+	lm90_select_remote_channel(client, data, index >= 3);
+	err = i2c_smbus_write_byte_data(client, regp->high,
+					data->temp11[index] >> 8);
+	if (err < 0)
+		return err;
 	if (data->flags & LM90_HAVE_REM_LIMIT_EXT)
-		i2c_smbus_write_byte_data(client, reg[nr].low,
-					  data->temp11[index] & 0xff);
-	lm90_select_remote_channel(client, data, 0);
+		err = i2c_smbus_write_byte_data(client, regp->low,
+						data->temp11[index] & 0xff);
 
-	mutex_unlock(&data->update_lock);
-	return count;
+	lm90_select_remote_channel(client, data, 0);
+	return err;
 }
 
-static ssize_t show_temphyst(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static int lm90_get_temp8(struct lm90_data *data, int index)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm90_data *data = lm90_update_device(dev);
+	s8 temp8 = data->temp8[index];
 	int temp;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
 	if (data->kind == adt7461 || data->kind == tmp451)
-		temp = temp_from_u8_adt7461(data, data->temp8[attr->index]);
+		temp = temp_from_u8_adt7461(data, temp8);
 	else if (data->kind == max6646)
-		temp = temp_from_u8(data->temp8[attr->index]);
+		temp = temp_from_u8(temp8);
 	else
-		temp = temp_from_s8(data->temp8[attr->index]);
+		temp = temp_from_s8(temp8);
 
 	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind == lm99 && attr->index == 3)
+	if (data->kind == lm99 && index == 3)
 		temp += 16000;
 
-	return sprintf(buf, "%d\n", temp - temp_from_s8(data->temp_hyst));
+	return temp;
 }
 
-static ssize_t set_temphyst(struct device *dev, struct device_attribute *dummy,
-			    const char *buf, size_t count)
+static int lm90_set_temp8(struct lm90_data *data, int index, long val)
 {
-	struct lm90_data *data = dev_get_drvdata(dev);
+	static const u8 reg[TEMP8_REG_NUM] = {
+		LM90_REG_W_LOCAL_LOW,
+		LM90_REG_W_LOCAL_HIGH,
+		LM90_REG_W_LOCAL_CRIT,
+		LM90_REG_W_REMOTE_CRIT,
+		MAX6659_REG_W_LOCAL_EMERG,
+		MAX6659_REG_W_REMOTE_EMERG,
+		LM90_REG_W_REMOTE_CRIT,
+		MAX6659_REG_W_REMOTE_EMERG,
+	};
 	struct i2c_client *client = data->client;
-	long val;
 	int err;
-	int temp;
 
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
+	/* +16 degrees offset for temp2 for the LM99 */
+	if (data->kind == lm99 && index == 3)
+		val -= 16000;
 
-	mutex_lock(&data->update_lock);
 	if (data->kind == adt7461 || data->kind == tmp451)
-		temp = temp_from_u8_adt7461(data, data->temp8[LOCAL_CRIT]);
+		data->temp8[index] = temp_to_u8_adt7461(data, val);
 	else if (data->kind == max6646)
-		temp = temp_from_u8(data->temp8[LOCAL_CRIT]);
+		data->temp8[index] = temp_to_u8(val);
 	else
-		temp = temp_from_s8(data->temp8[LOCAL_CRIT]);
-
-	data->temp_hyst = hyst_to_reg(temp - val);
-	i2c_smbus_write_byte_data(client, LM90_REG_W_TCRIT_HYST,
-				  data->temp_hyst);
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static ssize_t show_alarms(struct device *dev, struct device_attribute *dummy,
-			   char *buf)
-{
-	struct lm90_data *data = lm90_update_device(dev);
+		data->temp8[index] = temp_to_s8(val);
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	lm90_select_remote_channel(client, data, index >= 6);
+	err = i2c_smbus_write_byte_data(client, reg[index], data->temp8[index]);
+	lm90_select_remote_channel(client, data, 0);
 
-	return sprintf(buf, "%d\n", data->alarms);
+	return err;
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute
-			  *devattr, char *buf)
+static int lm90_get_temphyst(struct lm90_data *data, int index)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm90_data *data = lm90_update_device(dev);
-	int bitnr = attr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	int temp;
 
-	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
-}
+	if (data->kind == adt7461 || data->kind == tmp451)
+		temp = temp_from_u8_adt7461(data, data->temp8[index]);
+	else if (data->kind == max6646)
+		temp = temp_from_u8(data->temp8[index]);
+	else
+		temp = temp_from_s8(data->temp8[index]);
 
-static ssize_t show_update_interval(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct lm90_data *data = dev_get_drvdata(dev);
+	/* +16 degrees offset for temp2 for the LM99 */
+	if (data->kind == lm99 && index == 3)
+		temp += 16000;
 
-	return sprintf(buf, "%u\n", data->update_interval);
+	return temp - temp_from_s8(data->temp_hyst);
 }
 
-static ssize_t set_update_interval(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static int lm90_set_temphyst(struct lm90_data *data, long val)
 {
-	struct lm90_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long val;
+	int temp;
 	int err;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	lm90_set_convrate(client, data, clamp_val(val, 0, 100000));
-	mutex_unlock(&data->update_lock);
+	if (data->kind == adt7461 || data->kind == tmp451)
+		temp = temp_from_u8_adt7461(data, data->temp8[LOCAL_CRIT]);
+	else if (data->kind == max6646)
+		temp = temp_from_u8(data->temp8[LOCAL_CRIT]);
+	else
+		temp = temp_from_s8(data->temp8[LOCAL_CRIT]);
 
-	return count;
+	data->temp_hyst = hyst_to_reg(temp - val);
+	err = i2c_smbus_write_byte_data(client, LM90_REG_W_TCRIT_HYST,
+					data->temp_hyst);
+	return err;
 }
 
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp11, NULL,
-	0, LOCAL_TEMP);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp11, NULL,
-	0, REMOTE_TEMP);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_LOW);
-static SENSOR_DEVICE_ATTR_2(temp2_min, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 0, REMOTE_LOW);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_HIGH);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 1, REMOTE_HIGH);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_CRIT);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, REMOTE_CRIT);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO, show_temphyst,
-	set_temphyst, LOCAL_CRIT);
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO, show_temphyst, NULL,
-	REMOTE_CRIT);
-static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 2, REMOTE_OFFSET);
-
-/* Individual alarm files */
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 6);
-/* Raw alarm file for compatibility */
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
-
-static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_interval,
-		   set_update_interval);
-
-static struct attribute *lm90_attributes[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,
-
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&dev_attr_alarms.attr,
-	&dev_attr_update_interval.attr,
-	NULL
+static const u8 lm90_temp_index[3] = {
+	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
 };
 
-static const struct attribute_group lm90_group = {
-	.attrs = lm90_attributes,
+static const u8 lm90_temp_min_index[3] = {
+	LOCAL_LOW, REMOTE_LOW, REMOTE2_LOW
 };
 
-static struct attribute *lm90_temp2_offset_attributes[] = {
-	&sensor_dev_attr_temp2_offset.dev_attr.attr,
-	NULL
+static const u8 lm90_temp_max_index[3] = {
+	LOCAL_HIGH, REMOTE_HIGH, REMOTE2_HIGH
 };
 
-static const struct attribute_group lm90_temp2_offset_group = {
-	.attrs = lm90_temp2_offset_attributes,
+static const u8 lm90_temp_crit_index[3] = {
+	LOCAL_CRIT, REMOTE_CRIT, REMOTE2_CRIT
 };
 
-/*
- * Additional attributes for devices with emergency sensors
- */
-static SENSOR_DEVICE_ATTR(temp1_emergency, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_EMERG);
-static SENSOR_DEVICE_ATTR(temp2_emergency, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, REMOTE_EMERG);
-static SENSOR_DEVICE_ATTR(temp1_emergency_hyst, S_IRUGO, show_temphyst,
-			  NULL, LOCAL_EMERG);
-static SENSOR_DEVICE_ATTR(temp2_emergency_hyst, S_IRUGO, show_temphyst,
-			  NULL, REMOTE_EMERG);
-
-static struct attribute *lm90_emergency_attributes[] = {
-	&sensor_dev_attr_temp1_emergency.dev_attr.attr,
-	&sensor_dev_attr_temp2_emergency.dev_attr.attr,
-	&sensor_dev_attr_temp1_emergency_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp2_emergency_hyst.dev_attr.attr,
-	NULL
+static const u8 lm90_temp_emerg_index[3] = {
+	LOCAL_EMERG, REMOTE_EMERG, REMOTE2_EMERG
 };
 
-static const struct attribute_group lm90_emergency_group = {
-	.attrs = lm90_emergency_attributes,
-};
+static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
+static const u8 lm90_max_alarm_bits[3] = { 0, 4, 12 };
+static const u8 lm90_crit_alarm_bits[3] = { 0, 1, 9 };
+static const u8 lm90_emergency_alarm_bits[3] = { 15, 13, 14 };
+static const u8 lm90_fault_bits[3] = { 0, 2, 10 };
 
-static SENSOR_DEVICE_ATTR(temp1_emergency_alarm, S_IRUGO, show_alarm, NULL, 15);
-static SENSOR_DEVICE_ATTR(temp2_emergency_alarm, S_IRUGO, show_alarm, NULL, 13);
+static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+	int err;
 
-static struct attribute *lm90_emergency_alarm_attributes[] = {
-	&sensor_dev_attr_temp1_emergency_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_emergency_alarm.dev_attr.attr,
-	NULL
-};
+	mutex_lock(&data->update_lock);
+	err = lm90_update_device(dev);
+	mutex_unlock(&data->update_lock);
+	if (err)
+		return err;
 
-static const struct attribute_group lm90_emergency_alarm_group = {
-	.attrs = lm90_emergency_alarm_attributes,
-};
+	switch (attr) {
+	case hwmon_temp_input:
+		*val = lm90_get_temp11(data, lm90_temp_index[channel]);
+		break;
+	case hwmon_temp_min_alarm:
+		*val = (data->alarms >> lm90_min_alarm_bits[channel]) & 1;
+		break;
+	case hwmon_temp_max_alarm:
+		*val = (data->alarms >> lm90_max_alarm_bits[channel]) & 1;
+		break;
+	case hwmon_temp_crit_alarm:
+		*val = (data->alarms >> lm90_crit_alarm_bits[channel]) & 1;
+		break;
+	case hwmon_temp_emergency_alarm:
+		*val = (data->alarms >> lm90_emergency_alarm_bits[channel]) & 1;
+		break;
+	case hwmon_temp_fault:
+		*val = (data->alarms >> lm90_fault_bits[channel]) & 1;
+		break;
+	case hwmon_temp_min:
+		if (channel == 0)
+			*val = lm90_get_temp8(data,
+					      lm90_temp_min_index[channel]);
+		else
+			*val = lm90_get_temp11(data,
+					       lm90_temp_min_index[channel]);
+		break;
+	case hwmon_temp_max:
+		if (channel == 0)
+			*val = lm90_get_temp8(data,
+					      lm90_temp_max_index[channel]);
+		else
+			*val = lm90_get_temp11(data,
+					       lm90_temp_max_index[channel]);
+		break;
+	case hwmon_temp_crit:
+		*val = lm90_get_temp8(data, lm90_temp_crit_index[channel]);
+		break;
+	case hwmon_temp_crit_hyst:
+		*val = lm90_get_temphyst(data, lm90_temp_crit_index[channel]);
+		break;
+	case hwmon_temp_emergency:
+		*val = lm90_get_temp8(data, lm90_temp_emerg_index[channel]);
+		break;
+	case hwmon_temp_emergency_hyst:
+		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel]);
+		break;
+	case hwmon_temp_offset:
+		*val = lm90_get_temp11(data, REMOTE_OFFSET);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
 
-/*
- * Additional attributes for devices with 3 temperature sensors
- */
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp11, NULL,
-	0, REMOTE2_TEMP);
-static SENSOR_DEVICE_ATTR_2(temp3_min, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 3, REMOTE2_LOW);
-static SENSOR_DEVICE_ATTR_2(temp3_max, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 4, REMOTE2_HIGH);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, REMOTE2_CRIT);
-static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO, show_temphyst, NULL,
-	REMOTE2_CRIT);
-static SENSOR_DEVICE_ATTR(temp3_emergency, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, REMOTE2_EMERG);
-static SENSOR_DEVICE_ATTR(temp3_emergency_hyst, S_IRUGO, show_temphyst,
-			  NULL, REMOTE2_EMERG);
-
-static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_alarm, NULL, 12);
-static SENSOR_DEVICE_ATTR(temp3_emergency_alarm, S_IRUGO, show_alarm, NULL, 14);
-
-static struct attribute *lm90_temp3_attributes[] = {
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_min.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp3_emergency.dev_attr.attr,
-	&sensor_dev_attr_temp3_emergency_hyst.dev_attr.attr,
-
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_emergency_alarm.dev_attr.attr,
-	NULL
-};
+static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+	int err;
 
-static const struct attribute_group lm90_temp3_group = {
-	.attrs = lm90_temp3_attributes,
-};
+	mutex_lock(&data->update_lock);
 
-/* pec used for ADM1032 only */
-static ssize_t show_pec(struct device *dev, struct device_attribute *dummy,
-			char *buf)
+	err = lm90_update_device(dev);
+	if (err)
+		goto error;
+
+	switch (attr) {
+	case hwmon_temp_min:
+		if (channel == 0)
+			err = lm90_set_temp8(data,
+					     lm90_temp_min_index[channel],
+					     val);
+		else
+			err = lm90_set_temp11(data,
+					      lm90_temp_min_index[channel],
+					      val);
+		break;
+	case hwmon_temp_max:
+		if (channel == 0)
+			err = lm90_set_temp8(data,
+					     lm90_temp_max_index[channel],
+					     val);
+		else
+			err = lm90_set_temp11(data,
+					      lm90_temp_max_index[channel],
+					      val);
+		break;
+	case hwmon_temp_crit:
+		err = lm90_set_temp8(data, lm90_temp_crit_index[channel], val);
+		break;
+	case hwmon_temp_crit_hyst:
+		err = lm90_set_temphyst(data, val);
+		break;
+	case hwmon_temp_emergency:
+		err = lm90_set_temp8(data, lm90_temp_emerg_index[channel], val);
+		break;
+	case hwmon_temp_offset:
+		err = lm90_set_temp11(data, REMOTE_OFFSET, val);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
+error:
+	mutex_unlock(&data->update_lock);
+
+	return err;
+}
+
+static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+	case hwmon_temp_emergency_alarm:
+	case hwmon_temp_emergency_hyst:
+	case hwmon_temp_fault:
+		return S_IRUGO;
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+	case hwmon_temp_crit:
+	case hwmon_temp_emergency:
+	case hwmon_temp_offset:
+		return S_IRUGO | S_IWUSR;
+	case hwmon_temp_crit_hyst:
+		if (channel == 0)
+			return S_IRUGO | S_IWUSR;
+		return S_IRUGO;
+	default:
+		return 0;
+	}
 }
 
-static ssize_t set_pec(struct device *dev, struct device_attribute *dummy,
-		       const char *buf, size_t count)
+static int lm90_chip_read(struct device *dev, u32 attr, int channel, long *val)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	long val;
+	struct lm90_data *data = dev_get_drvdata(dev);
 	int err;
 
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
+	mutex_lock(&data->update_lock);
+	err = lm90_update_device(dev);
+	mutex_unlock(&data->update_lock);
+	if (err)
 		return err;
 
-	switch (val) {
-	case 0:
-		client->flags &= ~I2C_CLIENT_PEC;
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		*val = data->update_interval;
 		break;
-	case 1:
-		client->flags |= I2C_CLIENT_PEC;
+	case hwmon_chip_alarms:
+		*val = data->alarms;
 		break;
 	default:
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	}
 
-	return count;
+	return 0;
 }
 
-static DEVICE_ATTR(pec, S_IWUSR | S_IRUGO, show_pec, set_pec);
+static int lm90_chip_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int err;
 
-/*
- * Real code
- */
+	mutex_lock(&data->update_lock);
+
+	err = lm90_update_device(dev);
+	if (err)
+		goto error;
+
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		err = lm90_set_convrate(client, data,
+					clamp_val(val, 0, 100000));
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
+error:
+	mutex_unlock(&data->update_lock);
+
+	return err;
+}
+
+static umode_t lm90_chip_is_visible(const void *data, u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		return S_IRUGO | S_IWUSR;
+	case hwmon_chip_alarms:
+		return S_IRUGO;
+	default:
+		return 0;
+	}
+}
+
+static int lm90_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return lm90_chip_read(dev, attr, channel, val);
+	case hwmon_temp:
+		return lm90_temp_read(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int lm90_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return lm90_chip_write(dev, attr, channel, val);
+	case hwmon_temp:
+		return lm90_temp_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t lm90_is_visible(const void *data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_chip:
+		return lm90_chip_is_visible(data, attr, channel);
+	case hwmon_temp:
+		return lm90_temp_is_visible(data, attr, channel);
+	default:
+		return 0;
+	}
+}
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int lm90_detect(struct i2c_client *client,
@@ -1617,15 +1626,31 @@ static void lm90_regulator_disable(void *regulator)
 	regulator_disable(regulator);
 }
 
+static const u32 lm90_chip_config[] = {
+	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL | HWMON_C_ALARMS,
+	0
+};
+
+static const struct hwmon_channel_info lm90_chip_info = {
+	.type = hwmon_chip,
+	.config = lm90_chip_config,
+};
+
+static const struct hwmon_ops lm90_ops = {
+	.is_visible = lm90_is_visible,
+	.read = lm90_read,
+	.write = lm90_write,
+};
+
 static int lm90_probe(struct i2c_client *client,
 		      const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
 	struct i2c_adapter *adapter = to_i2c_adapter(dev->parent);
-	struct lm90_data *data;
+	struct hwmon_channel_info *info;
 	struct regulator *regulator;
 	struct device *hwmon_dev;
-	int groups = 0;
+	struct lm90_data *data;
 	int err;
 
 	regulator = devm_regulator_get(dev, "vcc");
@@ -1665,6 +1690,49 @@ static int lm90_probe(struct i2c_client *client,
 
 	/* Set chip capabilities */
 	data->flags = lm90_params[data->kind].flags;
+
+	data->chip.ops = &lm90_ops;
+	data->chip.info = data->info;
+
+	data->info[0] = &lm90_chip_info;
+	data->info[1] = &data->temp_info;
+
+	info = &data->temp_info;
+	info->type = hwmon_temp;
+	info->config = data->channel_config;
+
+	data->channel_config[0] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
+	data->channel_config[1] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT;
+
+	if (data->flags & LM90_HAVE_OFFSET)
+		data->channel_config[1] |= HWMON_T_OFFSET;
+
+	if (data->flags & LM90_HAVE_EMERGENCY) {
+		data->channel_config[0] |= HWMON_T_EMERGENCY |
+			HWMON_T_EMERGENCY_HYST;
+		data->channel_config[1] |= HWMON_T_EMERGENCY |
+			HWMON_T_EMERGENCY_HYST;
+	}
+
+	if (data->flags & LM90_HAVE_EMERGENCY_ALARM) {
+		data->channel_config[0] |= HWMON_T_EMERGENCY_ALARM;
+		data->channel_config[1] |= HWMON_T_EMERGENCY_ALARM;
+	}
+
+	if (data->flags & LM90_HAVE_TEMP3) {
+		data->channel_config[2] = HWMON_T_INPUT |
+			HWMON_T_MIN | HWMON_T_MAX |
+			HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST |
+			HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
+			HWMON_T_CRIT_ALARM | HWMON_T_EMERGENCY_ALARM |
+			HWMON_T_FAULT;
+	}
+
 	data->reg_local_ext = lm90_params[data->kind].reg_local_ext;
 
 	/* Set maximum conversion rate */
@@ -1677,21 +1745,10 @@ static int lm90_probe(struct i2c_client *client,
 		return err;
 	}
 
-	/* Register sysfs hooks */
-	data->groups[groups++] = &lm90_group;
-
-	if (data->flags & LM90_HAVE_OFFSET)
-		data->groups[groups++] = &lm90_temp2_offset_group;
-
-	if (data->flags & LM90_HAVE_EMERGENCY)
-		data->groups[groups++] = &lm90_emergency_group;
-
-	if (data->flags & LM90_HAVE_EMERGENCY_ALARM)
-		data->groups[groups++] = &lm90_emergency_alarm_group;
-
-	if (data->flags & LM90_HAVE_TEMP3)
-		data->groups[groups++] = &lm90_temp3_group;
-
+	/*
+	 * The 'pec' attribute is attached to the i2c device and thus created
+	 * separately.
+	 */
 	if (client->flags & I2C_CLIENT_PEC) {
 		err = device_create_file(dev, &dev_attr_pec);
 		if (err)
@@ -1701,8 +1758,9 @@ static int lm90_probe(struct i2c_client *client,
 			return err;
 	}
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &data->chip,
+							 NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-- 
2.5.0
