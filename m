Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34492 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955AbcHNKDg (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 14 Aug 2016 06:03:36 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/9] hwmon: (nct7904) Convert to use new hwmon registration API
Date: Sat, 13 Aug 2016 22:51:48 -0700
Message-Id: <1471153911-6536-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
References: <1471153911-6536-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simplify code and reduce code size by using the new hwmon
registration API.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7904.c | 555 +++++++++++++++++++++++-------------------------
 1 file changed, 270 insertions(+), 285 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 08ff89d222e5..657ce88435a3 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -21,7 +21,6 @@
 #include <linux/i2c.h>
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 
 #define VENDOR_ID_REG		0x7A	/* Any bank */
 #define NUVOTON_ID		0x50
@@ -153,341 +152,230 @@ static int nct7904_write_reg(struct nct7904_data *data,
 	return ret;
 }
 
-/* FANIN ATTR */
-static ssize_t show_fan(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static int nct7904_read_fan(struct device *dev, u32 attr, int channel,
+			    long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct nct7904_data *data = dev_get_drvdata(dev);
+	unsigned int cnt, rpm;
 	int ret;
-	unsigned cnt, rpm;
 
-	ret = nct7904_read_reg16(data, BANK_0, FANIN1_HV_REG + index * 2);
-	if (ret < 0)
-		return ret;
-	cnt = ((ret & 0xff00) >> 3) | (ret & 0x1f);
-	if (cnt == 0x1fff)
-		rpm = 0;
-	else
-		rpm = 1350000 / cnt;
-	return sprintf(buf, "%u\n", rpm);
+	switch (attr) {
+	case hwmon_fan_input:
+		ret = nct7904_read_reg16(data, BANK_0,
+					 FANIN1_HV_REG + channel * 2);
+		if (ret < 0)
+			return ret;
+		cnt = ((ret & 0xff00) >> 3) | (ret & 0x1f);
+		if (cnt == 0x1fff)
+			rpm = 0;
+		else
+			rpm = 1350000 / cnt;
+		*val = rpm;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static umode_t nct7904_fanin_is_visible(struct kobject *kobj,
-					struct attribute *a, int n)
+static umode_t nct7904_fan_is_visible(const void *_data, u32 attr, int channel)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct nct7904_data *data = dev_get_drvdata(dev);
+	const struct nct7904_data *data = _data;
 
-	if (data->fanin_mask & (1 << n))
-		return a->mode;
+	if (attr == hwmon_fan_input && data->fanin_mask & (1 << channel))
+		return S_IRUGO;
 	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO, show_fan, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO, show_fan, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan7_input, S_IRUGO, show_fan, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_input, S_IRUGO, show_fan, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan9_input, S_IRUGO, show_fan, NULL, 8);
-static SENSOR_DEVICE_ATTR(fan10_input, S_IRUGO, show_fan, NULL, 9);
-static SENSOR_DEVICE_ATTR(fan11_input, S_IRUGO, show_fan, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan12_input, S_IRUGO, show_fan, NULL, 11);
-
-static struct attribute *nct7904_fanin_attrs[] = {
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan3_input.dev_attr.attr,
-	&sensor_dev_attr_fan4_input.dev_attr.attr,
-	&sensor_dev_attr_fan5_input.dev_attr.attr,
-	&sensor_dev_attr_fan6_input.dev_attr.attr,
-	&sensor_dev_attr_fan7_input.dev_attr.attr,
-	&sensor_dev_attr_fan8_input.dev_attr.attr,
-	&sensor_dev_attr_fan9_input.dev_attr.attr,
-	&sensor_dev_attr_fan10_input.dev_attr.attr,
-	&sensor_dev_attr_fan11_input.dev_attr.attr,
-	&sensor_dev_attr_fan12_input.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group nct7904_fanin_group = {
-	.attrs = nct7904_fanin_attrs,
-	.is_visible = nct7904_fanin_is_visible,
+static u8 nct7904_chan_to_index[] = {
+	0,	/* Not used */
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
+	18, 19, 20, 16
 };
 
-/* VSEN ATTR */
-static ssize_t show_voltage(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
+static int nct7904_read_in(struct device *dev, u32 attr, int channel,
+			   long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct nct7904_data *data = dev_get_drvdata(dev);
-	int ret;
-	int volt;
+	int ret, volt, index;
 
-	ret = nct7904_read_reg16(data, BANK_0, VSEN1_HV_REG + index * 2);
-	if (ret < 0)
-		return ret;
-	volt = ((ret & 0xff00) >> 5) | (ret & 0x7);
-	if (index < 14)
-		volt *= 2; /* 0.002V scale */
-	else
-		volt *= 6; /* 0.006V scale */
+	index = nct7904_chan_to_index[channel];
 
-	return sprintf(buf, "%d\n", volt);
+	switch (attr) {
+	case hwmon_in_input:
+		ret = nct7904_read_reg16(data, BANK_0,
+					 VSEN1_HV_REG + index * 2);
+		if (ret < 0)
+			return ret;
+		volt = ((ret & 0xff00) >> 5) | (ret & 0x7);
+		if (index < 14)
+			volt *= 2; /* 0.002V scale */
+		else
+			volt *= 6; /* 0.006V scale */
+		*val = volt;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t show_ltemp(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
+static umode_t nct7904_in_is_visible(const void *_data, u32 attr, int channel)
 {
-	struct nct7904_data *data = dev_get_drvdata(dev);
-	int ret;
-	int temp;
+	const struct nct7904_data *data = _data;
+	int index = nct7904_chan_to_index[channel];
 
-	ret = nct7904_read_reg16(data, BANK_0, LTD_HV_REG);
-	if (ret < 0)
-		return ret;
-	temp = ((ret & 0xff00) >> 5) | (ret & 0x7);
-	temp = sign_extend32(temp, 10) * 125;
-
-	return sprintf(buf, "%d\n", temp);
-}
-
-static umode_t nct7904_vsen_is_visible(struct kobject *kobj,
-				       struct attribute *a, int n)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct nct7904_data *data = dev_get_drvdata(dev);
+	if (channel > 0 && attr == hwmon_in_input &&
+	    (data->vsen_mask & BIT(index)))
+		return S_IRUGO;
 
-	if (data->vsen_mask & (1 << n))
-		return a->mode;
 	return 0;
 }
 
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_voltage, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_voltage, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_voltage, NULL, 2);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_voltage, NULL, 3);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, show_voltage, NULL, 4);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, show_voltage, NULL, 5);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, show_voltage, NULL, 6);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, show_voltage, NULL, 7);
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, show_voltage, NULL, 8);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, show_voltage, NULL, 9);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, show_voltage, NULL, 10);
-static SENSOR_DEVICE_ATTR(in12_input, S_IRUGO, show_voltage, NULL, 11);
-static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, show_voltage, NULL, 12);
-static SENSOR_DEVICE_ATTR(in14_input, S_IRUGO, show_voltage, NULL, 13);
-/*
- * Next 3 voltage sensors have specific names in the Nuvoton doc
- * (3VDD, VBAT, 3VSB) but we use vacant numbers for them.
- */
-static SENSOR_DEVICE_ATTR(in15_input, S_IRUGO, show_voltage, NULL, 14);
-static SENSOR_DEVICE_ATTR(in16_input, S_IRUGO, show_voltage, NULL, 15);
-static SENSOR_DEVICE_ATTR(in20_input, S_IRUGO, show_voltage, NULL, 16);
-/* This is not a voltage, but a local temperature sensor. */
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_ltemp, NULL, 0);
-static SENSOR_DEVICE_ATTR(in17_input, S_IRUGO, show_voltage, NULL, 18);
-static SENSOR_DEVICE_ATTR(in18_input, S_IRUGO, show_voltage, NULL, 19);
-static SENSOR_DEVICE_ATTR(in19_input, S_IRUGO, show_voltage, NULL, 20);
-
-static struct attribute *nct7904_vsen_attrs[] = {
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
-	&sensor_dev_attr_in8_input.dev_attr.attr,
-	&sensor_dev_attr_in9_input.dev_attr.attr,
-	&sensor_dev_attr_in10_input.dev_attr.attr,
-	&sensor_dev_attr_in11_input.dev_attr.attr,
-	&sensor_dev_attr_in12_input.dev_attr.attr,
-	&sensor_dev_attr_in13_input.dev_attr.attr,
-	&sensor_dev_attr_in14_input.dev_attr.attr,
-	&sensor_dev_attr_in15_input.dev_attr.attr,
-	&sensor_dev_attr_in16_input.dev_attr.attr,
-	&sensor_dev_attr_in20_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_in17_input.dev_attr.attr,
-	&sensor_dev_attr_in18_input.dev_attr.attr,
-	&sensor_dev_attr_in19_input.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group nct7904_vsen_group = {
-	.attrs = nct7904_vsen_attrs,
-	.is_visible = nct7904_vsen_is_visible,
-};
-
-/* CPU_TEMP ATTR */
-static ssize_t show_tcpu(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static int nct7904_read_temp(struct device *dev, u32 attr, int channel,
+			     long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct nct7904_data *data = dev_get_drvdata(dev);
-	int ret;
-	int temp;
-
-	ret = nct7904_read_reg16(data, BANK_0, T_CPU1_HV_REG + index * 2);
-	if (ret < 0)
-		return ret;
-
-	temp = ((ret & 0xff00) >> 5) | (ret & 0x7);
-	temp = sign_extend32(temp, 10) * 125;
-	return sprintf(buf, "%d\n", temp);
+	int ret, temp;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (channel == 0)
+			ret = nct7904_read_reg16(data, BANK_0, LTD_HV_REG);
+		else
+			ret = nct7904_read_reg16(data, BANK_0,
+					T_CPU1_HV_REG + (channel - 1) * 2);
+		if (ret < 0)
+			return ret;
+		temp = ((ret & 0xff00) >> 5) | (ret & 0x7);
+		*val = sign_extend32(temp, 10) * 125;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static umode_t nct7904_tcpu_is_visible(struct kobject *kobj,
-				       struct attribute *a, int n)
+static umode_t nct7904_temp_is_visible(const void *_data, u32 attr, int channel)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct nct7904_data *data = dev_get_drvdata(dev);
+	const struct nct7904_data *data = _data;
+
+	if (attr == hwmon_temp_input) {
+		if (channel == 0) {
+			if (data->vsen_mask & BIT(17))
+				return S_IRUGO;
+		} else {
+			if (data->tcpu_mask & BIT(channel - 1))
+				return S_IRUGO;
+		}
+	}
 
-	if (data->tcpu_mask & (1 << n))
-		return a->mode;
 	return 0;
 }
 
-/* "temp1_input" reserved for local temp */
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_tcpu, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_tcpu, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_tcpu, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_tcpu, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_tcpu, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, show_tcpu, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, show_tcpu, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, show_tcpu, NULL, 7);
-
-static struct attribute *nct7904_tcpu_attrs[] = {
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp5_input.dev_attr.attr,
-	&sensor_dev_attr_temp6_input.dev_attr.attr,
-	&sensor_dev_attr_temp7_input.dev_attr.attr,
-	&sensor_dev_attr_temp8_input.dev_attr.attr,
-	&sensor_dev_attr_temp9_input.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group nct7904_tcpu_group = {
-	.attrs = nct7904_tcpu_attrs,
-	.is_visible = nct7904_tcpu_is_visible,
-};
-
-/* PWM ATTR */
-static ssize_t store_pwm(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
+static int nct7904_read_pwm(struct device *dev, u32 attr, int channel,
+			    long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct nct7904_data *data = dev_get_drvdata(dev);
-	unsigned long val;
 	int ret;
 
-	if (kstrtoul(buf, 10, &val) < 0)
-		return -EINVAL;
-	if (val > 255)
-		return -EINVAL;
-
-	ret = nct7904_write_reg(data, BANK_3, FANCTL1_OUT_REG + index, val);
+	switch (attr) {
+	case hwmon_pwm_input:
+		ret = nct7904_read_reg(data, BANK_3, FANCTL1_OUT_REG + channel);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return 0;
+	case hwmon_pwm_enable:
+		ret = nct7904_read_reg(data, BANK_3, FANCTL1_FMR_REG + channel);
+		if (ret < 0)
+			return ret;
 
-	return ret ? ret : count;
+		*val = ret ? 2 : 1;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t show_pwm(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static int nct7904_write_pwm(struct device *dev, u32 attr, int channel,
+			     long val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
 	struct nct7904_data *data = dev_get_drvdata(dev);
-	int val;
-
-	val = nct7904_read_reg(data, BANK_3, FANCTL1_OUT_REG + index);
-	if (val < 0)
-		return val;
+	int ret;
 
-	return sprintf(buf, "%d\n", val);
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		ret = nct7904_write_reg(data, BANK_3, FANCTL1_OUT_REG + channel,
+					val);
+		return ret;
+	case hwmon_pwm_enable:
+		if (val < 1 || val > 2 ||
+		    (val == 2 && !data->fan_mode[channel]))
+			return -EINVAL;
+		ret = nct7904_write_reg(data, BANK_3, FANCTL1_FMR_REG + channel,
+					val == 2 ? data->fan_mode[channel] : 0);
+		return ret;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static ssize_t store_enable(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static umode_t nct7904_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct nct7904_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val) < 0)
-		return -EINVAL;
-	if (val < 1 || val > 2 || (val == 2 && !data->fan_mode[index]))
-		return -EINVAL;
-
-	ret = nct7904_write_reg(data, BANK_3, FANCTL1_FMR_REG + index,
-				val == 2 ? data->fan_mode[index] : 0);
-
-	return ret ? ret : count;
+	switch (attr) {
+	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
+		return S_IRUGO | S_IWUSR;
+	default:
+		return 0;
+	}
 }
 
-/* Return 1 for manual mode or 2 for SmartFan mode */
-static ssize_t show_enable(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
+static int nct7904_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
-	int index = to_sensor_dev_attr(devattr)->index;
-	struct nct7904_data *data = dev_get_drvdata(dev);
-	int val;
-
-	val = nct7904_read_reg(data, BANK_3, FANCTL1_FMR_REG + index);
-	if (val < 0)
-		return val;
-
-	return sprintf(buf, "%d\n", val ? 2 : 1);
+	switch (type) {
+	case hwmon_in:
+		return nct7904_read_in(dev, attr, channel, val);
+	case hwmon_fan:
+		return nct7904_read_fan(dev, attr, channel, val);
+	case hwmon_pwm:
+		return nct7904_read_pwm(dev, attr, channel, val);
+	case hwmon_temp:
+		return nct7904_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-/* 2 attributes per channel: pwm and mode */
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR,
-			show_pwm, store_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR,
-			show_enable, store_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
-			show_pwm, store_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IRUGO | S_IWUSR,
-			show_enable, store_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
-			show_pwm, store_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm3_enable, S_IRUGO | S_IWUSR,
-			show_enable, store_enable, 2);
-static SENSOR_DEVICE_ATTR(pwm4, S_IRUGO | S_IWUSR,
-			show_pwm, store_pwm, 3);
-static SENSOR_DEVICE_ATTR(pwm4_enable, S_IRUGO | S_IWUSR,
-			show_enable, store_enable, 3);
-
-static struct attribute *nct7904_fanctl_attrs[] = {
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm2.dev_attr.attr,
-	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm3.dev_attr.attr,
-	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm4.dev_attr.attr,
-	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group nct7904_fanctl_group = {
-	.attrs = nct7904_fanctl_attrs,
-};
+static int nct7904_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		return nct7904_write_pwm(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-static const struct attribute_group *nct7904_groups[] = {
-	&nct7904_fanin_group,
-	&nct7904_vsen_group,
-	&nct7904_tcpu_group,
-	&nct7904_fanctl_group,
-	NULL
-};
+static umode_t nct7904_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		return nct7904_in_is_visible(data, attr, channel);
+	case hwmon_fan:
+		return nct7904_fan_is_visible(data, attr, channel);
+	case hwmon_pwm:
+		return nct7904_pwm_is_visible(data, attr, channel);
+	case hwmon_temp:
+		return nct7904_temp_is_visible(data, attr, channel);
+	default:
+		return 0;
+	}
+}
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int nct7904_detect(struct i2c_client *client,
@@ -512,6 +400,103 @@ static int nct7904_detect(struct i2c_client *client,
 	return 0;
 }
 
+static const u32 nct7904_in_config[] = {
+	HWMON_I_INPUT,                  /* dummy, skipped in is_visible */
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
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
+static const struct hwmon_channel_info nct7904_in = {
+	.type = hwmon_in,
+	.config = nct7904_in_config,
+};
+
+static const u32 nct7904_fan_config[] = {
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info nct7904_fan = {
+	.type = hwmon_fan,
+	.config = nct7904_fan_config,
+};
+
+static const u32 nct7904_pwm_config[] = {
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	0
+};
+
+static const struct hwmon_channel_info nct7904_pwm = {
+	.type = hwmon_pwm,
+	.config = nct7904_pwm_config,
+};
+
+static const u32 nct7904_temp_config[] = {
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info nct7904_temp = {
+	.type = hwmon_temp,
+	.config = nct7904_temp_config,
+};
+
+static const struct hwmon_channel_info *nct7904_info[] = {
+	&nct7904_in,
+	&nct7904_fan,
+	&nct7904_pwm,
+	&nct7904_temp,
+	NULL
+};
+
+static const struct hwmon_ops nct7904_hwmon_ops = {
+	.is_visible = nct7904_is_visible,
+	.read = nct7904_read,
+	.write = nct7904_write,
+};
+
+static const struct hwmon_chip_info nct7904_chip_info = {
+	.ops = &nct7904_hwmon_ops,
+	.info = nct7904_info,
+};
+
 static int nct7904_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -566,8 +551,8 @@ static int nct7904_probe(struct i2c_client *client,
 	}
 
 	hwmon_dev =
-		devm_hwmon_device_register_with_groups(dev, client->name, data,
-						       nct7904_groups);
+		devm_hwmon_device_register_with_info(dev, client->name, data,
+						     &nct7904_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.5.0

