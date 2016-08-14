Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56151 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783AbcHNJDt (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 14 Aug 2016 05:03:49 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/9] hwmon: (max31790) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:49 -0700
Message-Id: <1471153911-6536-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31790.c | 521 ++++++++++++++++++++---------------------------
 1 file changed, 224 insertions(+), 297 deletions(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 69c0ac80a946..bef84e085973 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -17,7 +17,6 @@
 
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
@@ -169,362 +168,288 @@ static u8 bits_for_tach_period(int rpm)
 	return bits;
 }
 
-static ssize_t get_fan(struct device *dev,
-		       struct device_attribute *devattr, char *buf)
+static int max31790_read_fan(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max31790_data *data = max31790_update_device(dev);
 	int sr, rpm;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	sr = get_tach_period(data->fan_dynamics[attr->index]);
-	rpm = RPM_FROM_REG(data->tach[attr->index], sr);
-
-	return sprintf(buf, "%d\n", rpm);
-}
-
-static ssize_t get_fan_target(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31790_data *data = max31790_update_device(dev);
-	int sr, rpm;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	sr = get_tach_period(data->fan_dynamics[attr->index]);
-	rpm = RPM_FROM_REG(data->target_count[attr->index], sr);
-
-	return sprintf(buf, "%d\n", rpm);
+	switch (attr) {
+	case hwmon_fan_input:
+		sr = get_tach_period(data->fan_dynamics[channel]);
+		rpm = RPM_FROM_REG(data->tach[channel], sr);
+		*val = rpm;
+		return 0;
+	case hwmon_fan_target:
+		sr = get_tach_period(data->fan_dynamics[channel]);
+		rpm = RPM_FROM_REG(data->target_count[channel], sr);
+		*val = rpm;
+		return 0;
+	case hwmon_fan_fault:
+		*val = !!(data->fault_status & (1 << channel));
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_fan_target(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static int max31790_write_fan(struct device *dev, u32 attr, int channel,
+			      long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max31790_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
+	int target_count;
+	int err = 0;
 	u8 bits;
 	int sr;
-	int target_count;
-	unsigned long rpm;
-	int err;
-
-	err = kstrtoul(buf, 10, &rpm);
-	if (err)
-		return err;
 
 	mutex_lock(&data->update_lock);
 
-	rpm = clamp_val(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
-	bits = bits_for_tach_period(rpm);
-	data->fan_dynamics[attr->index] =
-			((data->fan_dynamics[attr->index]
-			  & ~MAX31790_FAN_DYN_SR_MASK)
-			 | (bits << MAX31790_FAN_DYN_SR_SHIFT));
-	err = i2c_smbus_write_byte_data(client,
-			MAX31790_REG_FAN_DYNAMICS(attr->index),
-			data->fan_dynamics[attr->index]);
-
-	if (err < 0) {
-		mutex_unlock(&data->update_lock);
-		return err;
+	switch (attr) {
+	case hwmon_fan_target:
+		val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
+		bits = bits_for_tach_period(val);
+		data->fan_dynamics[channel] =
+			((data->fan_dynamics[channel] &
+			  ~MAX31790_FAN_DYN_SR_MASK) |
+			 (bits << MAX31790_FAN_DYN_SR_SHIFT));
+		err = i2c_smbus_write_byte_data(client,
+					MAX31790_REG_FAN_DYNAMICS(channel),
+					data->fan_dynamics[channel]);
+		if (err < 0)
+			break;
+
+		sr = get_tach_period(data->fan_dynamics[channel]);
+		target_count = RPM_TO_REG(val, sr);
+		target_count = clamp_val(target_count, 0x1, 0x7FF);
+
+		data->target_count[channel] = target_count << 5;
+
+		err = i2c_smbus_write_word_swapped(client,
+					MAX31790_REG_TARGET_COUNT(channel),
+					data->target_count[channel]);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
 	}
 
-	sr = get_tach_period(data->fan_dynamics[attr->index]);
-	target_count = RPM_TO_REG(rpm, sr);
-	target_count = clamp_val(target_count, 0x1, 0x7FF);
-
-	data->target_count[attr->index] = target_count << 5;
-
-	err = i2c_smbus_write_word_swapped(client,
-			MAX31790_REG_TARGET_COUNT(attr->index),
-			data->target_count[attr->index]);
-
 	mutex_unlock(&data->update_lock);
 
-	if (err < 0)
-		return err;
+	return err;
+}
 
-	return count;
+static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
+{
+	const struct max31790_data *data = _data;
+	u8 fan_config = data->fan_config[channel % NR_CHANNEL];
+
+	switch (attr) {
+	case hwmon_fan_input:
+	case hwmon_fan_fault:
+		if (channel < NR_CHANNEL ||
+		    (fan_config & MAX31790_FAN_CFG_TACH_INPUT))
+			return S_IRUGO;
+		return 0;
+	case hwmon_fan_target:
+		if (channel < NR_CHANNEL &&
+		    !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
+			return S_IRUGO | S_IWUSR;
+		return 0;
+	default:
+		return 0;
+	}
 }
 
-static ssize_t get_pwm(struct device *dev,
-		       struct device_attribute *devattr, char *buf)
+static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max31790_data *data = max31790_update_device(dev);
-	int pwm;
+	u8 fan_config = data->fan_config[channel];
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	pwm = data->pwm[attr->index] >> 8;
-
-	return sprintf(buf, "%d\n", pwm);
+	switch (attr) {
+	case hwmon_pwm_input:
+		*val = data->pwm[channel] >> 8;
+		return 0;
+	case hwmon_pwm_enable:
+		if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
+			*val = 2;
+		else if (fan_config & MAX31790_FAN_CFG_TACH_INPUT_EN)
+			*val = 1;
+		else
+			*val = 0;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t set_pwm(struct device *dev,
-		       struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
+			      long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max31790_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long pwm;
-	int err;
-
-	err = kstrtoul(buf, 10, &pwm);
-	if (err)
-		return err;
-
-	if (pwm > 255)
-		return -EINVAL;
+	u8 fan_config;
+	int err = 0;
 
 	mutex_lock(&data->update_lock);
 
-	data->pwm[attr->index] = pwm << 8;
-	err = i2c_smbus_write_word_swapped(client,
-			MAX31790_REG_PWMOUT(attr->index),
-			data->pwm[attr->index]);
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255) {
+			err = -EINVAL;
+			break;
+		}
+		data->pwm[channel] = val << 8;
+		err = i2c_smbus_write_word_swapped(client,
+						   MAX31790_REG_PWMOUT(channel),
+						   val);
+		break;
+	case hwmon_pwm_enable:
+		fan_config = data->fan_config[channel];
+		if (val == 0) {
+			fan_config &= ~(MAX31790_FAN_CFG_TACH_INPUT_EN |
+					MAX31790_FAN_CFG_RPM_MODE);
+		} else if (val == 1) {
+			fan_config = (fan_config |
+				      MAX31790_FAN_CFG_TACH_INPUT_EN) &
+				     ~MAX31790_FAN_CFG_RPM_MODE;
+		} else if (val == 2) {
+			fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN |
+				      MAX31790_FAN_CFG_RPM_MODE;
+		} else {
+			err = -EINVAL;
+			break;
+		}
+		data->fan_config[channel] = fan_config;
+		err = i2c_smbus_write_byte_data(client,
+					MAX31790_REG_FAN_CONFIG(channel),
+					fan_config);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
 
 	mutex_unlock(&data->update_lock);
 
-	if (err < 0)
-		return err;
-
-	return count;
+	return err;
 }
 
-static ssize_t get_pwm_enable(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
+static umode_t max31790_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31790_data *data = max31790_update_device(dev);
-	int mode;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if (data->fan_config[attr->index] & MAX31790_FAN_CFG_RPM_MODE)
-		mode = 2;
-	else if (data->fan_config[attr->index] & MAX31790_FAN_CFG_TACH_INPUT_EN)
-		mode = 1;
-	else
-		mode = 0;
-
-	return sprintf(buf, "%d\n", mode);
+	const struct max31790_data *data = _data;
+	u8 fan_config = data->fan_config[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
+		if (!(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
+			return S_IRUGO | S_IWUSR;
+		return 0;
+	default:
+		return 0;
+	}
 }
 
-static ssize_t set_pwm_enable(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static int max31790_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31790_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long mode;
-	int err;
-
-	err = kstrtoul(buf, 10, &mode);
-	if (err)
-		return err;
-
-	switch (mode) {
-	case 0:
-		data->fan_config[attr->index] =
-			data->fan_config[attr->index]
-			& ~(MAX31790_FAN_CFG_TACH_INPUT_EN
-			    | MAX31790_FAN_CFG_RPM_MODE);
-		break;
-	case 1:
-		data->fan_config[attr->index] =
-			(data->fan_config[attr->index]
-			 | MAX31790_FAN_CFG_TACH_INPUT_EN)
-			& ~MAX31790_FAN_CFG_RPM_MODE;
-		break;
-	case 2:
-		data->fan_config[attr->index] =
-			data->fan_config[attr->index]
-			| MAX31790_FAN_CFG_TACH_INPUT_EN
-			| MAX31790_FAN_CFG_RPM_MODE;
-		break;
+	switch (type) {
+	case hwmon_fan:
+		return max31790_read_fan(dev, attr, channel, val);
+	case hwmon_pwm:
+		return max31790_read_pwm(dev, attr, channel, val);
 	default:
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	}
-
-	mutex_lock(&data->update_lock);
-
-	err = i2c_smbus_write_byte_data(client,
-			MAX31790_REG_FAN_CONFIG(attr->index),
-			data->fan_config[attr->index]);
-
-	mutex_unlock(&data->update_lock);
-
-	if (err < 0)
-		return err;
-
-	return count;
 }
 
-static ssize_t get_fan_fault(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
+static int max31790_write(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31790_data *data = max31790_update_device(dev);
-	int fault;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	fault = !!(data->fault_status & (1 << attr->index));
+	switch (type) {
+	case hwmon_fan:
+		return max31790_write_fan(dev, attr, channel, val);
+	case hwmon_pwm:
+		return max31790_write_pwm(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-	return sprintf(buf, "%d\n", fault);
+static umode_t max31790_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return max31790_fan_is_visible(data, attr, channel);
+	case hwmon_pwm:
+		return max31790_pwm_is_visible(data, attr, channel);
+	default:
+		return 0;
+	}
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO, get_fan, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO, get_fan, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, get_fan_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, get_fan_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_fault, S_IRUGO, get_fan_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_fault, S_IRUGO, get_fan_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_fault, S_IRUGO, get_fan_fault, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_fault, S_IRUGO, get_fan_fault, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(fan7_input, S_IRUGO, get_fan, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_input, S_IRUGO, get_fan, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan9_input, S_IRUGO, get_fan, NULL, 8);
-static SENSOR_DEVICE_ATTR(fan10_input, S_IRUGO, get_fan, NULL, 9);
-static SENSOR_DEVICE_ATTR(fan11_input, S_IRUGO, get_fan, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan12_input, S_IRUGO, get_fan, NULL, 11);
-
-static SENSOR_DEVICE_ATTR(fan7_fault, S_IRUGO, get_fan_fault, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_fault, S_IRUGO, get_fan_fault, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan9_fault, S_IRUGO, get_fan_fault, NULL, 8);
-static SENSOR_DEVICE_ATTR(fan10_fault, S_IRUGO, get_fan_fault, NULL, 9);
-static SENSOR_DEVICE_ATTR(fan11_fault, S_IRUGO, get_fan_fault, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan12_fault, S_IRUGO, get_fan_fault, NULL, 11);
-
-static SENSOR_DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 0);
-static SENSOR_DEVICE_ATTR(fan2_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 1);
-static SENSOR_DEVICE_ATTR(fan3_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 2);
-static SENSOR_DEVICE_ATTR(fan4_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 3);
-static SENSOR_DEVICE_ATTR(fan5_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 4);
-static SENSOR_DEVICE_ATTR(fan6_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 5);
-
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 3);
-static SENSOR_DEVICE_ATTR(pwm5, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 4);
-static SENSOR_DEVICE_ATTR(pwm6, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 5);
-
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 2);
-static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 3);
-static SENSOR_DEVICE_ATTR(pwm5_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 4);
-static SENSOR_DEVICE_ATTR(pwm6_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 5);
-
-static struct attribute *max31790_attrs[] = {
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan3_input.dev_attr.attr,
-	&sensor_dev_attr_fan4_input.dev_attr.attr,
-	&sensor_dev_attr_fan5_input.dev_attr.attr,
-	&sensor_dev_attr_fan6_input.dev_attr.attr,
-
-	&sensor_dev_attr_fan1_fault.dev_attr.attr,
-	&sensor_dev_attr_fan2_fault.dev_attr.attr,
-	&sensor_dev_attr_fan3_fault.dev_attr.attr,
-	&sensor_dev_attr_fan4_fault.dev_attr.attr,
-	&sensor_dev_attr_fan5_fault.dev_attr.attr,
-	&sensor_dev_attr_fan6_fault.dev_attr.attr,
-
-	&sensor_dev_attr_fan7_input.dev_attr.attr,
-	&sensor_dev_attr_fan8_input.dev_attr.attr,
-	&sensor_dev_attr_fan9_input.dev_attr.attr,
-	&sensor_dev_attr_fan10_input.dev_attr.attr,
-	&sensor_dev_attr_fan11_input.dev_attr.attr,
-	&sensor_dev_attr_fan12_input.dev_attr.attr,
-
-	&sensor_dev_attr_fan7_fault.dev_attr.attr,
-	&sensor_dev_attr_fan8_fault.dev_attr.attr,
-	&sensor_dev_attr_fan9_fault.dev_attr.attr,
-	&sensor_dev_attr_fan10_fault.dev_attr.attr,
-	&sensor_dev_attr_fan11_fault.dev_attr.attr,
-	&sensor_dev_attr_fan12_fault.dev_attr.attr,
-
-	&sensor_dev_attr_fan1_target.dev_attr.attr,
-	&sensor_dev_attr_fan2_target.dev_attr.attr,
-	&sensor_dev_attr_fan3_target.dev_attr.attr,
-	&sensor_dev_attr_fan4_target.dev_attr.attr,
-	&sensor_dev_attr_fan5_target.dev_attr.attr,
-	&sensor_dev_attr_fan6_target.dev_attr.attr,
-
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_pwm2.dev_attr.attr,
-	&sensor_dev_attr_pwm3.dev_attr.attr,
-	&sensor_dev_attr_pwm4.dev_attr.attr,
-	&sensor_dev_attr_pwm5.dev_attr.attr,
-	&sensor_dev_attr_pwm6.dev_attr.attr,
-
-	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm5_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm6_enable.dev_attr.attr,
-	NULL
+static const u32 max31790_fan_config[] = {
+	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_FAULT,
+	0
 };
 
-static umode_t max31790_attrs_visible(struct kobject *kobj,
-				     struct attribute *a, int n)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct max31790_data *data = dev_get_drvdata(dev);
-	struct device_attribute *devattr =
-			container_of(a, struct device_attribute, attr);
-	int index = to_sensor_dev_attr(devattr)->index % NR_CHANNEL;
-	u8 fan_config;
+static const struct hwmon_channel_info max31790_fan = {
+	.type = hwmon_fan,
+	.config = max31790_fan_config,
+};
 
-	fan_config = data->fan_config[index];
+static const u32 max31790_pwm_config[] = {
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	0
+};
 
-	if (n >= NR_CHANNEL * 2 && n < NR_CHANNEL * 4 &&
-	    !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
-		return 0;
-	if (n >= NR_CHANNEL * 4 && (fan_config & MAX31790_FAN_CFG_TACH_INPUT))
-		return 0;
+static const struct hwmon_channel_info max31790_pwm = {
+	.type = hwmon_pwm,
+	.config = max31790_pwm_config,
+};
 
-	return a->mode;
-}
+static const struct hwmon_channel_info *max31790_info[] = {
+	&max31790_fan,
+	&max31790_pwm,
+	NULL
+};
+
+static const struct hwmon_ops max31790_hwmon_ops = {
+	.is_visible = max31790_is_visible,
+	.read = max31790_read,
+	.write = max31790_write,
+};
 
-static const struct attribute_group max31790_group = {
-	.attrs = max31790_attrs,
-	.is_visible = max31790_attrs_visible,
+static const struct hwmon_chip_info max31790_chip_info = {
+	.ops = &max31790_hwmon_ops,
+	.info = max31790_info,
 };
-__ATTRIBUTE_GROUPS(max31790);
 
 static int max31790_init_client(struct i2c_client *client,
 				struct max31790_data *data)
@@ -575,8 +500,10 @@ static int max31790_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-			client->name, data, max31790_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &max31790_chip_info,
+							 NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.5.0

