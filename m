Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56133 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797AbcHNJDm (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 14 Aug 2016 05:03:42 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/9] hwmon: (ltc4245) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:47 -0700
Message-Id: <1471153911-6536-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4245.c | 362 +++++++++++++++++++++++-------------------------
 1 file changed, 175 insertions(+), 187 deletions(-)

diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index 681b5b7b3c3b..4680d89556ce 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
@@ -53,8 +54,6 @@ enum ltc4245_cmd {
 struct ltc4245_data {
 	struct i2c_client *client;
 
-	const struct attribute_group *groups[3];
-
 	struct mutex update_lock;
 	bool valid;
 	unsigned long last_updated; /* in jiffies */
@@ -162,7 +161,7 @@ static struct ltc4245_data *ltc4245_update_device(struct device *dev)
 		ltc4245_update_gpios(dev);
 
 		data->last_updated = jiffies;
-		data->valid = 1;
+		data->valid = true;
 	}
 
 	mutex_unlock(&data->update_lock);
@@ -256,213 +255,204 @@ static unsigned int ltc4245_get_current(struct device *dev, u8 reg)
 	return curr;
 }
 
-static ssize_t ltc4245_show_voltage(struct device *dev,
-				    struct device_attribute *da,
-				    char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	const int voltage = ltc4245_get_voltage(dev, attr->index);
+/* Map from voltage channel index to voltage register */
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", voltage);
-}
+static const s8 ltc4245_in_regs[] = {
+	LTC4245_12VIN, LTC4245_5VIN, LTC4245_3VIN, LTC4245_VEEIN,
+	LTC4245_12VOUT, LTC4245_5VOUT, LTC4245_3VOUT, LTC4245_VEEOUT,
+};
+
+/* Map from current channel index to current register */
 
-static ssize_t ltc4245_show_current(struct device *dev,
-				    struct device_attribute *da,
-				    char *buf)
+static const s8 ltc4245_curr_regs[] = {
+	LTC4245_12VSENSE, LTC4245_5VSENSE, LTC4245_3VSENSE, LTC4245_VEESENSE,
+};
+
+static int ltc4245_read_curr(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	const unsigned int curr = ltc4245_get_current(dev, attr->index);
+	struct ltc4245_data *data = ltc4245_update_device(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", curr);
+	switch (attr) {
+	case hwmon_curr_input:
+		*val = ltc4245_get_current(dev, ltc4245_curr_regs[channel]);
+		return 0;
+	case hwmon_curr_max_alarm:
+		*val = !!(data->cregs[LTC4245_FAULT1] & BIT(channel + 4));
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t ltc4245_show_power(struct device *dev,
-				  struct device_attribute *da,
-				  char *buf)
+static int ltc4245_read_in(struct device *dev, u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	const unsigned int curr = ltc4245_get_current(dev, attr->index);
-	const int output_voltage = ltc4245_get_voltage(dev, attr->index+1);
+	struct ltc4245_data *data = ltc4245_update_device(dev);
 
-	/* current in mA * voltage in mV == power in uW */
-	const unsigned int power = abs(output_voltage * curr);
+	switch (attr) {
+	case hwmon_in_input:
+		if (channel < 8) {
+			*val = ltc4245_get_voltage(dev,
+						ltc4245_in_regs[channel]);
+		} else {
+			int regval = data->gpios[channel - 8];
+
+			if (regval < 0)
+				return regval;
+			*val = regval * 10;
+		}
+		return 0;
+	case hwmon_in_min_alarm:
+		if (channel < 4)
+			*val = !!(data->cregs[LTC4245_FAULT1] & BIT(channel));
+		else
+			*val = !!(data->cregs[LTC4245_FAULT2] &
+				  BIT(channel - 4));
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", power);
+static int ltc4245_read_power(struct device *dev, u32 attr, int channel,
+			      long *val)
+{
+	unsigned long curr;
+	long voltage;
+
+	switch (attr) {
+	case hwmon_power_input:
+		(void)ltc4245_update_device(dev);
+		curr = ltc4245_get_current(dev, ltc4245_curr_regs[channel]);
+		voltage = ltc4245_get_voltage(dev, ltc4245_in_regs[channel]);
+		*val = abs(curr * voltage);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t ltc4245_show_alarm(struct device *dev,
-					  struct device_attribute *da,
-					  char *buf)
+static int ltc4245_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
-	struct ltc4245_data *data = ltc4245_update_device(dev);
-	const u8 reg = data->cregs[attr->index];
-	const u32 mask = attr->nr;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", (reg & mask) ? 1 : 0);
+	switch (type) {
+	case hwmon_curr:
+		return ltc4245_read_curr(dev, attr, channel, val);
+	case hwmon_power:
+		return ltc4245_read_power(dev, attr, channel, val);
+	case hwmon_in:
+		return ltc4245_read_in(dev, attr, channel - 1, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t ltc4245_show_gpio(struct device *dev,
-				 struct device_attribute *da,
-				 char *buf)
+static umode_t ltc4245_is_visible(const void *_data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct ltc4245_data *data = ltc4245_update_device(dev);
-	int val = data->gpios[attr->index];
+	const struct ltc4245_data *data = _data;
+
+	switch (type) {
+	case hwmon_in:
+		if (channel == 0)
+			return 0;
+		switch (attr) {
+		case hwmon_in_input:
+			if (channel > 9 && !data->use_extra_gpios)
+				return 0;
+			return S_IRUGO;
+		case hwmon_in_min_alarm:
+			if (channel > 8)
+				return 0;
+			return S_IRUGO;
+		default:
+			return 0;
+		}
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+		case hwmon_curr_max_alarm:
+			return S_IRUGO;
+		default:
+			return 0;
+		}
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			return S_IRUGO;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
 
-	/* handle stale GPIO's */
-	if (val < 0)
-		return val;
+static const u32 ltc4245_in_config[] = {
+	HWMON_I_INPUT,			/* dummy, skipped in is_visible */
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	0
+};
 
-	/* Convert to millivolts and print */
-	return snprintf(buf, PAGE_SIZE, "%u\n", val * 10);
-}
+static const struct hwmon_channel_info ltc4245_in = {
+	.type = hwmon_in,
+	.config = ltc4245_in_config,
+};
 
-/* Construct a sensor_device_attribute structure for each register */
-
-/* Input voltages */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_12VIN);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_5VIN);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_3VIN);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_VEEIN);
-
-/* Input undervoltage alarms */
-static SENSOR_DEVICE_ATTR_2(in1_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 0, LTC4245_FAULT1);
-static SENSOR_DEVICE_ATTR_2(in2_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 1, LTC4245_FAULT1);
-static SENSOR_DEVICE_ATTR_2(in3_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 2, LTC4245_FAULT1);
-static SENSOR_DEVICE_ATTR_2(in4_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 3, LTC4245_FAULT1);
-
-/* Currents (via sense resistor) */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc4245_show_current, NULL,
-			  LTC4245_12VSENSE);
-static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ltc4245_show_current, NULL,
-			  LTC4245_5VSENSE);
-static SENSOR_DEVICE_ATTR(curr3_input, S_IRUGO, ltc4245_show_current, NULL,
-			  LTC4245_3VSENSE);
-static SENSOR_DEVICE_ATTR(curr4_input, S_IRUGO, ltc4245_show_current, NULL,
-			  LTC4245_VEESENSE);
-
-/* Overcurrent alarms */
-static SENSOR_DEVICE_ATTR_2(curr1_max_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 4, LTC4245_FAULT1);
-static SENSOR_DEVICE_ATTR_2(curr2_max_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 5, LTC4245_FAULT1);
-static SENSOR_DEVICE_ATTR_2(curr3_max_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 6, LTC4245_FAULT1);
-static SENSOR_DEVICE_ATTR_2(curr4_max_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 7, LTC4245_FAULT1);
-
-/* Output voltages */
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_12VOUT);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_5VOUT);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_3VOUT);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, ltc4245_show_voltage, NULL,
-			  LTC4245_VEEOUT);
-
-/* Power Bad alarms */
-static SENSOR_DEVICE_ATTR_2(in5_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 0, LTC4245_FAULT2);
-static SENSOR_DEVICE_ATTR_2(in6_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 1, LTC4245_FAULT2);
-static SENSOR_DEVICE_ATTR_2(in7_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 2, LTC4245_FAULT2);
-static SENSOR_DEVICE_ATTR_2(in8_min_alarm, S_IRUGO, ltc4245_show_alarm, NULL,
-			    1 << 3, LTC4245_FAULT2);
-
-/* GPIO voltages */
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, ltc4245_show_gpio, NULL, 0);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, ltc4245_show_gpio, NULL, 1);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, ltc4245_show_gpio, NULL, 2);
-
-/* Power Consumption (virtual) */
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, ltc4245_show_power, NULL,
-			  LTC4245_12VSENSE);
-static SENSOR_DEVICE_ATTR(power2_input, S_IRUGO, ltc4245_show_power, NULL,
-			  LTC4245_5VSENSE);
-static SENSOR_DEVICE_ATTR(power3_input, S_IRUGO, ltc4245_show_power, NULL,
-			  LTC4245_3VSENSE);
-static SENSOR_DEVICE_ATTR(power4_input, S_IRUGO, ltc4245_show_power, NULL,
-			  LTC4245_VEESENSE);
+static const u32 ltc4245_curr_config[] = {
+	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+	0
+};
 
-/*
- * Finally, construct an array of pointers to members of the above objects,
- * as required for sysfs_create_group()
- */
-static struct attribute *ltc4245_std_attributes[] = {
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-
-	&sensor_dev_attr_in1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_in2_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_in3_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_in4_min_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_curr1_input.dev_attr.attr,
-	&sensor_dev_attr_curr2_input.dev_attr.attr,
-	&sensor_dev_attr_curr3_input.dev_attr.attr,
-	&sensor_dev_attr_curr4_input.dev_attr.attr,
-
-	&sensor_dev_attr_curr1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_curr2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_curr3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_curr4_max_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
-	&sensor_dev_attr_in8_input.dev_attr.attr,
-
-	&sensor_dev_attr_in5_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_in6_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_in7_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_in8_min_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in9_input.dev_attr.attr,
-
-	&sensor_dev_attr_power1_input.dev_attr.attr,
-	&sensor_dev_attr_power2_input.dev_attr.attr,
-	&sensor_dev_attr_power3_input.dev_attr.attr,
-	&sensor_dev_attr_power4_input.dev_attr.attr,
-
-	NULL,
+static const struct hwmon_channel_info ltc4245_curr = {
+	.type = hwmon_curr,
+	.config = ltc4245_curr_config,
 };
 
-static struct attribute *ltc4245_gpio_attributes[] = {
-	&sensor_dev_attr_in10_input.dev_attr.attr,
-	&sensor_dev_attr_in11_input.dev_attr.attr,
-	NULL,
+static const u32 ltc4245_power_config[] = {
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	0
 };
 
-static const struct attribute_group ltc4245_std_group = {
-	.attrs = ltc4245_std_attributes,
+static const struct hwmon_channel_info ltc4245_power = {
+	.type = hwmon_power,
+	.config = ltc4245_power_config,
 };
 
-static const struct attribute_group ltc4245_gpio_group = {
-	.attrs = ltc4245_gpio_attributes,
+static const struct hwmon_channel_info *ltc4245_info[] = {
+	&ltc4245_in,
+	&ltc4245_curr,
+	&ltc4245_power,
+	NULL
 };
 
-static void ltc4245_sysfs_add_groups(struct ltc4245_data *data)
-{
-	/* standard sysfs attributes */
-	data->groups[0] = &ltc4245_std_group;
+static const struct hwmon_ops ltc4245_hwmon_ops = {
+	.is_visible = ltc4245_is_visible,
+	.read = ltc4245_read,
+};
 
-	/* if we're using the extra gpio support, register it's attributes */
-	if (data->use_extra_gpios)
-		data->groups[1] = &ltc4245_gpio_group;
-}
+static const struct hwmon_chip_info ltc4245_chip_info = {
+	.ops = &ltc4245_hwmon_ops,
+	.info = ltc4245_info,
+};
 
 static bool ltc4245_use_extra_gpios(struct i2c_client *client)
 {
@@ -502,12 +492,10 @@ static int ltc4245_probe(struct i2c_client *client,
 	i2c_smbus_write_byte_data(client, LTC4245_FAULT1, 0x00);
 	i2c_smbus_write_byte_data(client, LTC4245_FAULT2, 0x00);
 
-	/* Add sysfs hooks */
-	ltc4245_sysfs_add_groups(data);
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
-							   client->name, data,
-							   data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
+							 client->name, data,
+							 &ltc4245_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.5.0

