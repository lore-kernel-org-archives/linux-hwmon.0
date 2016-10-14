Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ssl.serverraum.org ([213.133.101.245]:43832 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751802AbcJNJxq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Oct 2016 05:53:46 -0400
From: Michael Walle <michael@walle.cc>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 1/2] hwmon: adt7411: update to new hwmon registration API
Date: Fri, 14 Oct 2016 11:43:34 +0200
Message-Id: <1476438215-6654-1-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is also a preparation for to support more properties like min, max and
alarm.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/hwmon/adt7411.c | 300 +++++++++++++++++++++++++++++-------------------
 1 file changed, 179 insertions(+), 121 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index 812fbc0..2f44cdc 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -55,7 +55,7 @@ struct adt7411_data {
 	struct mutex device_lock;	/* for "atomic" device accesses */
 	struct mutex update_lock;
 	unsigned long next_update;
-	int vref_cached;
+	long vref_cached;
 	struct i2c_client *client;
 	bool use_ext_temp;
 };
@@ -114,85 +114,6 @@ static int adt7411_modify_bit(struct i2c_client *client, u8 reg, u8 bit,
 	return ret;
 }
 
-static ssize_t adt7411_show_vdd(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct adt7411_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int ret = adt7411_read_10_bit(client, ADT7411_REG_INT_TEMP_VDD_LSB,
-			ADT7411_REG_VDD_MSB, 2);
-
-	return ret < 0 ? ret : sprintf(buf, "%u\n", ret * 7000 / 1024);
-}
-
-static ssize_t adt7411_show_temp(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	int nr = to_sensor_dev_attr(attr)->index;
-	struct adt7411_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int val;
-	struct {
-		u8 low;
-		u8 high;
-	} reg[2] = {
-		{ ADT7411_REG_INT_TEMP_VDD_LSB, ADT7411_REG_INT_TEMP_MSB },
-		{ ADT7411_REG_EXT_TEMP_AIN14_LSB,
-		  ADT7411_REG_EXT_TEMP_AIN1_MSB },
-	};
-
-	val = adt7411_read_10_bit(client, reg[nr].low, reg[nr].high, 0);
-	if (val < 0)
-		return val;
-
-	val = val & 0x200 ? val - 0x400 : val; /* 10 bit signed */
-
-	return sprintf(buf, "%d\n", val * 250);
-}
-
-static ssize_t adt7411_show_input(struct device *dev,
-				  struct device_attribute *attr, char *buf)
-{
-	int nr = to_sensor_dev_attr(attr)->index;
-	struct adt7411_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int val;
-	u8 lsb_reg, lsb_shift;
-
-	mutex_lock(&data->update_lock);
-	if (time_after_eq(jiffies, data->next_update)) {
-		val = i2c_smbus_read_byte_data(client, ADT7411_REG_CFG3);
-		if (val < 0)
-			goto exit_unlock;
-
-		if (val & ADT7411_CFG3_REF_VDD) {
-			val = adt7411_read_10_bit(client,
-					ADT7411_REG_INT_TEMP_VDD_LSB,
-					ADT7411_REG_VDD_MSB, 2);
-			if (val < 0)
-				goto exit_unlock;
-
-			data->vref_cached = val * 7000 / 1024;
-		} else {
-			data->vref_cached = 2250;
-		}
-
-		data->next_update = jiffies + HZ;
-	}
-
-	lsb_reg = ADT7411_REG_EXT_TEMP_AIN14_LSB + (nr >> 2);
-	lsb_shift = 2 * (nr & 0x03);
-	val = adt7411_read_10_bit(client, lsb_reg,
-			ADT7411_REG_EXT_TEMP_AIN1_MSB + nr, lsb_shift);
-	if (val < 0)
-		goto exit_unlock;
-
-	val = sprintf(buf, "%u\n", val * data->vref_cached / 1024);
- exit_unlock:
-	mutex_unlock(&data->update_lock);
-	return val;
-}
-
 static ssize_t adt7411_show_bit(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -228,65 +149,156 @@ static ssize_t adt7411_set_bit(struct device *dev,
 	return ret < 0 ? ret : count;
 }
 
-
 #define ADT7411_BIT_ATTR(__name, __reg, __bit) \
 	SENSOR_DEVICE_ATTR_2(__name, S_IRUGO | S_IWUSR, adt7411_show_bit, \
 	adt7411_set_bit, __bit, __reg)
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, adt7411_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, adt7411_show_temp, NULL, 1);
-static DEVICE_ATTR(in0_input, S_IRUGO, adt7411_show_vdd, NULL);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, adt7411_show_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, adt7411_show_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, adt7411_show_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, adt7411_show_input, NULL, 3);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, adt7411_show_input, NULL, 4);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, adt7411_show_input, NULL, 5);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, adt7411_show_input, NULL, 6);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, adt7411_show_input, NULL, 7);
 static ADT7411_BIT_ATTR(no_average, ADT7411_REG_CFG2, ADT7411_CFG2_DISABLE_AVG);
 static ADT7411_BIT_ATTR(fast_sampling, ADT7411_REG_CFG3, ADT7411_CFG3_ADC_CLK_225);
 static ADT7411_BIT_ATTR(adc_ref_vdd, ADT7411_REG_CFG3, ADT7411_CFG3_REF_VDD);
 
 static struct attribute *adt7411_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&dev_attr_in0_input.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
-	&sensor_dev_attr_in8_input.dev_attr.attr,
 	&sensor_dev_attr_no_average.dev_attr.attr,
 	&sensor_dev_attr_fast_sampling.dev_attr.attr,
 	&sensor_dev_attr_adc_ref_vdd.dev_attr.attr,
 	NULL
 };
+ATTRIBUTE_GROUPS(adt7411);
 
-static umode_t adt7411_attrs_visible(struct kobject *kobj,
-				     struct attribute *attr, int index)
+static int adt7411_read_in_vdd(struct device *dev, u32 attr, long *val)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
 	struct adt7411_data *data = dev_get_drvdata(dev);
-	bool visible = true;
+	struct i2c_client *client = data->client;
+	int ret;
 
-	if (attr == &sensor_dev_attr_temp2_input.dev_attr.attr)
-		visible = data->use_ext_temp;
-	else if (attr == &sensor_dev_attr_in1_input.dev_attr.attr ||
-		 attr == &sensor_dev_attr_in2_input.dev_attr.attr)
-		visible = !data->use_ext_temp;
+	switch (attr) {
+	case hwmon_in_input:
+		ret = adt7411_read_10_bit(client, ADT7411_REG_INT_TEMP_VDD_LSB,
+				ADT7411_REG_VDD_MSB, 2);
+		if (ret < 0)
+			return ret;
+		*val = ret * 7000 / 1024;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int adt7411_read_in_chan(struct device *dev, u32 attr, int channel,
+				long *val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
 
-	return visible ? attr->mode : 0;
+	int ret;
+	int lsb_reg, lsb_shift;
+	int nr = channel - 1;
+
+	mutex_lock(&data->update_lock);
+	if (time_after_eq(jiffies, data->next_update)) {
+		ret = i2c_smbus_read_byte_data(client, ADT7411_REG_CFG3);
+		if (ret < 0)
+			goto exit_unlock;
+
+		if (ret & ADT7411_CFG3_REF_VDD) {
+			ret = adt7411_read_in_vdd(dev, hwmon_in_input,
+						  &data->vref_cached);
+			if (ret < 0)
+				goto exit_unlock;
+		} else {
+			data->vref_cached = 2250;
+		}
+
+		data->next_update = jiffies + HZ;
+	}
+
+	switch (attr) {
+	case hwmon_in_input:
+		lsb_reg = ADT7411_REG_EXT_TEMP_AIN14_LSB + (nr >> 2);
+		lsb_shift = 2 * (nr & 0x03);
+		ret = adt7411_read_10_bit(client, lsb_reg,
+				ADT7411_REG_EXT_TEMP_AIN1_MSB + nr, lsb_shift);
+		if (ret < 0)
+			goto exit_unlock;
+		*val = ret * data->vref_cached / 1024;
+		ret = 0;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+ exit_unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
-static const struct attribute_group adt7411_group = {
-	.attrs = adt7411_attrs,
-	.is_visible = adt7411_attrs_visible,
-};
-__ATTRIBUTE_GROUPS(adt7411);
+static int adt7411_read_in(struct device *dev, u32 attr, int channel,
+			   long *val)
+{
+	if (channel == 0)
+		return adt7411_read_in_vdd(dev, attr, val);
+	else
+		return adt7411_read_in_chan(dev, attr, channel, val);
+}
+
+static int adt7411_read_temp(struct device *dev, u32 attr, int channel,
+			     long *val)
+{
+	struct adt7411_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret, regl, regh;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		regl = channel ? ADT7411_REG_EXT_TEMP_AIN14_LSB :
+				 ADT7411_REG_INT_TEMP_VDD_LSB;
+		regh = channel ? ADT7411_REG_EXT_TEMP_AIN1_MSB :
+				 ADT7411_REG_INT_TEMP_MSB;
+		ret = adt7411_read_10_bit(client, regl, regh, 0);
+		if (ret < 0)
+			return ret;
+		ret = ret & 0x200 ? ret - 0x400 : ret; /* 10 bit signed */
+		*val = ret * 250;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int adt7411_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		return adt7411_read_in(dev, attr, channel, val);
+	case hwmon_temp:
+		return adt7411_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t adt7411_is_visible(const void *_data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct adt7411_data *data = _data;
+
+	switch (type) {
+	case hwmon_in:
+		if (channel > 0 && channel < 3)
+			return data->use_ext_temp ? 0 : S_IRUGO;
+		else
+			return S_IRUGO;
+	case hwmon_temp:
+		if (channel == 1)
+			return data->use_ext_temp ? S_IRUGO : 0;
+		else
+			return S_IRUGO;
+	default:
+		return 0;
+	}
+}
 
 static int adt7411_detect(struct i2c_client *client,
 			  struct i2c_board_info *info)
@@ -358,6 +370,51 @@ static int adt7411_init_device(struct adt7411_data *data)
 	return i2c_smbus_write_byte_data(data->client, ADT7411_REG_CFG1, val);
 }
 
+static const u32 adt7411_in_config[] = {
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info adt7411_in = {
+	.type = hwmon_in,
+	.config = adt7411_in_config,
+};
+
+static const u32 adt7411_temp_config[] = {
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info adt7411_temp = {
+	.type = hwmon_temp,
+	.config = adt7411_temp_config,
+};
+
+static const struct hwmon_channel_info *adt7411_info[] = {
+	&adt7411_in,
+	&adt7411_temp,
+	NULL
+};
+
+static const struct hwmon_ops adt7411_hwmon_ops = {
+	.is_visible = adt7411_is_visible,
+	.read = adt7411_read,
+};
+
+static const struct hwmon_chip_info adt7411_chip_info = {
+	.ops = &adt7411_hwmon_ops,
+	.info = adt7411_info,
+};
+
 static int adt7411_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
@@ -382,9 +439,10 @@ static int adt7411_probe(struct i2c_client *client,
 	/* force update on first occasion */
 	data->next_update = jiffies;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data,
-							   adt7411_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &adt7411_chip_info,
+							 adt7411_groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.1.4

