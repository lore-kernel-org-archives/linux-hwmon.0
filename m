Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ssl.serverraum.org ([213.133.101.245]:60608 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753860AbcJNJxq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Oct 2016 05:53:46 -0400
From: Michael Walle <michael@walle.cc>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 2/2] hwmon: adt7411: add min, max and alarm attributes
Date: Fri, 14 Oct 2016 11:43:35 +0200
Message-Id: <1476438215-6654-2-git-send-email-michael@walle.cc>
In-Reply-To: <1476438215-6654-1-git-send-email-michael@walle.cc>
References: <1476438215-6654-1-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds support for the min, max and alarm attributes of the
voltage and temperature channels. Additionally, the temp2_fault attribute
is supported which indicates a fault of the external temperature diode.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/hwmon/adt7411.c | 306 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 271 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index 2f44cdc..c6351b8 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -21,6 +21,21 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/slab.h>
 
+#define ADT7411_REG_STAT_1			0x00
+#define ADT7411_STAT_1_INT_TEMP_HIGH		(1 << 0)
+#define ADT7411_STAT_1_INT_TEMP_LOW		(1 << 1)
+#define ADT7411_STAT_1_EXT_TEMP_HIGH_AIN1	(1 << 2)
+#define ADT7411_STAT_1_EXT_TEMP_LOW		(1 << 3)
+#define ADT7411_STAT_1_EXT_TEMP_FAULT		(1 << 4)
+#define ADT7411_STAT_1_AIN2			(1 << 5)
+#define ADT7411_STAT_1_AIN3			(1 << 6)
+#define ADT7411_STAT_1_AIN4			(1 << 7)
+#define ADT7411_REG_STAT_2			0x01
+#define ADT7411_STAT_2_AIN5			(1 << 0)
+#define ADT7411_STAT_2_AIN6			(1 << 1)
+#define ADT7411_STAT_2_AIN7			(1 << 2)
+#define ADT7411_STAT_2_AIN8			(1 << 3)
+#define ADT7411_STAT_2_VDD			(1 << 4)
 #define ADT7411_REG_INT_TEMP_VDD_LSB		0x03
 #define ADT7411_REG_EXT_TEMP_AIN14_LSB		0x04
 #define ADT7411_REG_VDD_MSB			0x06
@@ -43,6 +58,17 @@
 #define ADT7411_CFG3_RESERVED_BIT3		(1 << 3)
 #define ADT7411_CFG3_REF_VDD			(1 << 4)
 
+#define ADT7411_REG_VDD_HIGH			0x23
+#define ADT7411_REG_VDD_LOW			0x24
+#define ADT7411_REG_TEMP_HIGH(nr)		(0x25 + 2 * (nr))
+#define ADT7411_REG_TEMP_LOW(nr)		(0x26 + 2 * (nr))
+#define ADT7411_REG_IN_HIGH(nr)		((nr) > 1 \
+						  ? 0x2b + 2 * ((nr)-2) \
+						  : 0x27)
+#define ADT7411_REG_IN_LOW(nr)			((nr) > 1 \
+						  ? 0x2c + 2 * ((nr)-2) \
+						  : 0x28)
+
 #define ADT7411_REG_DEVICE_ID			0x4d
 #define ADT7411_REG_MANUFACTURER_ID		0x4e
 
@@ -51,6 +77,30 @@
 
 static const unsigned short normal_i2c[] = { 0x48, 0x4a, 0x4b, I2C_CLIENT_END };
 
+static const u8 adt7411_in_alarm_reg[] = {
+	ADT7411_REG_STAT_2,
+	ADT7411_REG_STAT_1,
+	ADT7411_REG_STAT_1,
+	ADT7411_REG_STAT_1,
+	ADT7411_REG_STAT_1,
+	ADT7411_REG_STAT_2,
+	ADT7411_REG_STAT_2,
+	ADT7411_REG_STAT_2,
+	ADT7411_REG_STAT_2,
+};
+
+static const u8 adt7411_in_alarm_bits[] = {
+	ADT7411_STAT_2_VDD,
+	ADT7411_STAT_1_EXT_TEMP_HIGH_AIN1,
+	ADT7411_STAT_1_AIN2,
+	ADT7411_STAT_1_AIN3,
+	ADT7411_STAT_1_AIN4,
+	ADT7411_STAT_2_AIN5,
+	ADT7411_STAT_2_AIN6,
+	ADT7411_STAT_2_AIN7,
+	ADT7411_STAT_2_AIN8,
+};
+
 struct adt7411_data {
 	struct mutex device_lock;	/* for "atomic" device accesses */
 	struct mutex update_lock;
@@ -165,6 +215,19 @@ static struct attribute *adt7411_attrs[] = {
 };
 ATTRIBUTE_GROUPS(adt7411);
 
+static int adt7411_read_in_alarm(struct device *dev, int channel, long *val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, adt7411_in_alarm_reg[channel]);
+	if (ret < 0)
+		return ret;
+	*val = !!(ret & adt7411_in_alarm_bits[channel]);
+	return 0;
+}
+
 static int adt7411_read_in_vdd(struct device *dev, u32 attr, long *val)
 {
 	struct adt7411_data *data = dev_get_drvdata(dev);
@@ -179,32 +242,40 @@ static int adt7411_read_in_vdd(struct device *dev, u32 attr, long *val)
 			return ret;
 		*val = ret * 7000 / 1024;
 		return 0;
+	case hwmon_in_min:
+		ret = i2c_smbus_read_byte_data(client, ADT7411_REG_VDD_LOW);
+		if (ret < 0)
+			return ret;
+		*val = ret * 7000 / 256;
+		return 0;
+	case hwmon_in_max:
+		ret = i2c_smbus_read_byte_data(client, ADT7411_REG_VDD_HIGH);
+		if (ret < 0)
+			return ret;
+		*val = ret * 7000 / 256;
+	case hwmon_in_alarm:
+		return adt7411_read_in_alarm(dev, 0, val);
 	default:
 		return -EOPNOTSUPP;
 	}
 }
 
-static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
-				long *val)
+static int adt7411_update_vref(struct device *dev)
 {
 	struct adt7411_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
+	int val;
 
-	int ret;
-	int lsb_reg, lsb_shift;
-	int nr = channel - 1;
-
-	mutex_lock(&data->update_lock);
 	if (time_after_eq(jiffies, data->next_update)) {
-		ret = i2c_smbus_read_byte_data(client, ADT7411_REG_CFG3);
-		if (ret < 0)
-			goto exit_unlock;
+		val = i2c_smbus_read_byte_data(client, ADT7411_REG_CFG3);
+		if (val < 0)
+			return val;
 
-		if (ret & ADT7411_CFG3_REF_VDD) {
-			ret = adt7411_read_in_vdd(dev, hwmon_in_input,
+		if (val & ADT7411_CFG3_REF_VDD) {
+			val = adt7411_read_in_vdd(dev, hwmon_in_input,
 						  &data->vref_cached);
-			if (ret < 0)
-				goto exit_unlock;
+			if (val < 0)
+				return val;
 		} else {
 			data->vref_cached = 2250;
 		}
@@ -212,6 +283,24 @@ static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
 		data->next_update = jiffies + HZ;
 	}
 
+	return 0;
+}
+
+static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
+				long *val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+
+	int ret;
+	int reg, lsb_reg, lsb_shift;
+	int nr = channel - 1;
+
+	mutex_lock(&data->update_lock);
+	ret = adt7411_update_vref(dev);
+	if (ret < 0)
+		goto exit_unlock;
+
 	switch (attr) {
 	case hwmon_in_input:
 		lsb_reg = ADT7411_REG_EXT_TEMP_AIN14_LSB + (nr >> 2);
@@ -223,6 +312,20 @@ static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
 		*val = ret * data->vref_cached / 1024;
 		ret = 0;
 		break;
+	case hwmon_in_min:
+	case hwmon_in_max:
+		reg = (attr == hwmon_in_min)
+			? ADT7411_REG_IN_LOW(channel)
+			: ADT7411_REG_IN_HIGH(channel);
+		ret = i2c_smbus_read_byte_data(client, reg);
+		if (ret < 0)
+			goto exit_unlock;
+		*val = ret * data->vref_cached / 256;
+		ret = 0;
+		break;
+	case hwmon_in_alarm:
+		ret = adt7411_read_in_alarm(dev, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -241,12 +344,41 @@ static int adt7411_read_in(struct device *dev, u32 attr, int channel,
 		return adt7411_read_in_chan(dev, attr, channel, val);
 }
 
+
+static int adt7411_read_temp_alarm(struct device *dev, u32 attr, int channel,
+				   long *val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret, bit;
+
+	ret = i2c_smbus_read_byte_data(client, ADT7411_REG_STAT_1);
+	if (ret < 0)
+		return ret;
+
+	switch (attr) {
+	case hwmon_temp_min_alarm:
+		bit = channel ? ADT7411_STAT_1_EXT_TEMP_LOW
+			      : ADT7411_STAT_1_INT_TEMP_LOW;
+		break;
+	case hwmon_temp_max_alarm:
+		bit = channel ? ADT7411_STAT_1_EXT_TEMP_HIGH_AIN1
+			      : ADT7411_STAT_1_INT_TEMP_HIGH;
+		break;
+	case hwmon_temp_fault:
+		bit = ADT7411_STAT_1_EXT_TEMP_FAULT;
+		break;
+	}
+	*val = !!(ret & bit);
+	return 0;
+}
+
 static int adt7411_read_temp(struct device *dev, u32 attr, int channel,
 			     long *val)
 {
 	struct adt7411_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	int ret, regl, regh;
+	int ret, reg, regl, regh;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -260,6 +392,21 @@ static int adt7411_read_temp(struct device *dev, u32 attr, int channel,
 		ret = ret & 0x200 ? ret - 0x400 : ret; /* 10 bit signed */
 		*val = ret * 250;
 		return 0;
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+		reg = (attr == hwmon_temp_min)
+			? ADT7411_REG_TEMP_LOW(channel)
+			: ADT7411_REG_TEMP_HIGH(channel);
+		ret = i2c_smbus_read_byte_data(client, reg);
+		if (ret < 0)
+			return ret;
+		ret = ret & 0x80 ? ret - 0x100 : ret; /* 8 bit signed */
+		*val = ret * 1000;
+		return 0;
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_fault:
+		return adt7411_read_temp_alarm(dev, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -278,26 +425,112 @@ static int adt7411_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
+static int adt7411_write_in(struct device *dev, u32 attr, int channel,
+			    long val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret, reg;
+
+	mutex_lock(&data->update_lock);
+	ret = adt7411_update_vref(dev);
+	if (ret < 0)
+		goto exit_unlock;
+	val = DIV_ROUND_CLOSEST(val * 256, data->vref_cached);
+	val = clamp_val(val, 0, 255);
+
+	switch (attr) {
+	case hwmon_in_min:
+		reg = ADT7411_REG_IN_LOW(channel);
+		break;
+	case hwmon_in_max:
+		reg = ADT7411_REG_IN_HIGH(channel);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		goto exit_unlock;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, reg, val);
+ exit_unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static int adt7411_write_temp(struct device *dev, u32 attr, int channel,
+			      long val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int reg;
+
+	val = DIV_ROUND_CLOSEST(val, 1000);
+	val = clamp_val(val, -128, 127);
+	val = val < 0 ? 0x100 + val : val;
+
+	switch (attr) {
+	case hwmon_temp_min:
+		reg = ADT7411_REG_TEMP_LOW(channel);
+		break;
+	case hwmon_temp_max:
+		reg = ADT7411_REG_TEMP_HIGH(channel);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return i2c_smbus_write_byte_data(client, reg, val);
+}
+
+static int adt7411_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_in:
+		return adt7411_write_in(dev, attr, channel, val);
+	case hwmon_temp:
+		return adt7411_write_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t adt7411_is_visible(const void *_data,
 				  enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
 	const struct adt7411_data *data = _data;
+	bool visible;
 
 	switch (type) {
 	case hwmon_in:
-		if (channel > 0 && channel < 3)
-			return data->use_ext_temp ? 0 : S_IRUGO;
-		else
-			return S_IRUGO;
+		visible = channel == 0 || channel >= 2 || !data->use_ext_temp;
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_alarm:
+			return visible ? S_IRUGO : 0;
+		case hwmon_in_min:
+		case hwmon_in_max:
+			return visible ? S_IRUGO | S_IWUSR : 0;
+		}
+		break;
 	case hwmon_temp:
-		if (channel == 1)
-			return data->use_ext_temp ? S_IRUGO : 0;
-		else
-			return S_IRUGO;
+		visible = channel == 0 || data->use_ext_temp;
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_fault:
+			return visible ? S_IRUGO : 0;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+			return visible ? S_IRUGO | S_IWUSR : 0;
+		}
+		break;
 	default:
-		return 0;
+		break;
 	}
+	return 0;
 }
 
 static int adt7411_detect(struct i2c_client *client,
@@ -371,15 +604,15 @@ static int adt7411_init_device(struct adt7411_data *data)
 }
 
 static const u32 adt7411_in_config[] = {
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
 	0
 };
 
@@ -389,8 +622,10 @@ static const struct hwmon_channel_info adt7411_in = {
 };
 
 static const u32 adt7411_temp_config[] = {
-	HWMON_T_INPUT,
-	HWMON_T_INPUT,
+	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MIN_ALARM |
+		HWMON_T_MAX | HWMON_T_MAX_ALARM,
+	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MIN_ALARM |
+		HWMON_T_MAX | HWMON_T_MAX_ALARM | HWMON_T_FAULT,
 	0
 };
 
@@ -408,6 +643,7 @@ static const struct hwmon_channel_info *adt7411_info[] = {
 static const struct hwmon_ops adt7411_hwmon_ops = {
 	.is_visible = adt7411_is_visible,
 	.read = adt7411_read,
+	.write = adt7411_write,
 };
 
 static const struct hwmon_chip_info adt7411_chip_info = {
-- 
2.1.4

