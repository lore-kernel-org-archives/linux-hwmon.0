Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36796 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751446AbdEBFqH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 May 2017 01:46:07 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] hwmon: (adt7475) temperature smoothing
Date: Tue,  2 May 2017 17:45:36 +1200
Message-Id: <20170502054536.21147-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
References: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

When enabled temperature smoothing allows ramping the fan speed over a
configurable period of time instead of jumping to the new speed
instantaneously.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/hwmon/adt7475 |   5 ++
 drivers/hwmon/adt7475.c     | 121 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475
index 85dc9e17bdee..31b15cb910ea 100644
--- a/Documentation/hwmon/adt7475
+++ b/Documentation/hwmon/adt7475
@@ -114,6 +114,11 @@ at the minimum (i.e. auto_point1_pwm). This can be configured using the
 pwm[1-*]_min sysfs attribute. A value of 0 means the fans will shut off. A
 value of 1 means the fans will run at auto_point1_pwm.
 
+The responsiveness of the ADT747x to temperature changes can be configured.
+This allows smoothing of the fan speed transition. To enable temperature
+smoothing used the temp[1-*]_smoothing_enable sysfs attribute. To set the
+transition time set the value in ms in the temp[1-*]_smoothing sysfs attribute.
+
 Notes
 -----
 
diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 53f25bda0919..e1299eef7c51 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -526,6 +526,109 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+/* Assuming CONFIG6[SLOW] is 0 */
+static const int ad7475_st_map[] = {
+	37500, 18800, 12500, 7500, 4700, 3100, 1600, 800,
+};
+
+static ssize_t show_temp_st(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adt7475_data *data = i2c_get_clientdata(client);
+	int shift, idx;
+	long val;
+
+	switch (sattr->index) {
+	case 0:
+		shift = 0;
+		idx = 0;
+		break;
+	case 1:
+		shift = 4;
+		idx = 1;
+		break;
+	case 2:
+		shift = 0;
+		idx = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (sattr->nr) {
+	case CONTROL:
+		val = (data->enh_acou[idx] >> shift) & 0x8;
+		return sprintf(buf, "%d\n", !!val);
+	case MIN:
+		val = (data->enh_acou[idx] >> shift) & 0x7;
+		return sprintf(buf, "%d\n", ad7475_st_map[val]);
+	default:
+		return -EINVAL;
+	}
+}
+
+static ssize_t set_temp_st(struct device *dev, struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adt7475_data *data = i2c_get_clientdata(client);
+	unsigned char reg;
+	int shift, idx;
+	int mask;
+	long val;
+
+	if (kstrtol(buf, 10, &val))
+		return -EINVAL;
+
+	switch (sattr->index) {
+	case 0:
+		reg = REG_ENHANCE_ACOUSTICS1;
+		shift = 0;
+		idx = 0;
+		break;
+	case 1:
+		reg = REG_ENHANCE_ACOUSTICS2;
+		shift = 4;
+		idx = 1;
+		break;
+	case 2:
+		reg = REG_ENHANCE_ACOUSTICS2;
+		shift = 0;
+		idx = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (sattr->nr) {
+	case CONTROL:
+		val = !!val << 3;
+		mask = 0x8;
+		break;
+	case MIN:
+		val = find_closest_descending(val, ad7475_st_map,
+					      ARRAY_SIZE(ad7475_st_map));
+		mask = 0x7;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&data->lock);
+
+	data->enh_acou[idx] &= ~(mask << shift);
+	data->enh_acou[idx] |= (val << shift);
+
+	i2c_smbus_write_byte_data(client, reg, data->enh_acou[idx]);
+
+	mutex_unlock(&data->lock);
+
+	return count;
+}
+
 /*
  * Table of autorange values - the user will write the value in millidegrees,
  * and we'll convert it
@@ -1008,6 +1111,10 @@ static SENSOR_DEVICE_ATTR_2(temp1_crit, S_IRUGO | S_IWUSR, show_temp, set_temp,
 			    THERM, 0);
 static SENSOR_DEVICE_ATTR_2(temp1_crit_hyst, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, HYSTERSIS, 0);
+static SENSOR_DEVICE_ATTR_2(temp1_smoothing, S_IRUGO | S_IWUSR, show_temp_st,
+			    set_temp_st, MIN, 0);
+static SENSOR_DEVICE_ATTR_2(temp1_smoothing_enable, S_IRUGO | S_IWUSR,
+			    show_temp_st, set_temp_st, CONTROL, 0);
 static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, INPUT, 1);
 static SENSOR_DEVICE_ATTR_2(temp2_alarm, S_IRUGO, show_temp, NULL, ALARM, 1);
 static SENSOR_DEVICE_ATTR_2(temp2_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
@@ -1024,6 +1131,10 @@ static SENSOR_DEVICE_ATTR_2(temp2_crit, S_IRUGO | S_IWUSR, show_temp, set_temp,
 			    THERM, 1);
 static SENSOR_DEVICE_ATTR_2(temp2_crit_hyst, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, HYSTERSIS, 1);
+static SENSOR_DEVICE_ATTR_2(temp2_smoothing, S_IRUGO | S_IWUSR, show_temp_st,
+			    set_temp_st, MIN, 1);
+static SENSOR_DEVICE_ATTR_2(temp2_smoothing_enable, S_IRUGO | S_IWUSR,
+			    show_temp_st, set_temp_st, CONTROL, 1);
 static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, INPUT, 2);
 static SENSOR_DEVICE_ATTR_2(temp3_alarm, S_IRUGO, show_temp, NULL, ALARM, 2);
 static SENSOR_DEVICE_ATTR_2(temp3_fault, S_IRUGO, show_temp, NULL, FAULT, 2);
@@ -1041,6 +1152,10 @@ static SENSOR_DEVICE_ATTR_2(temp3_crit, S_IRUGO | S_IWUSR, show_temp, set_temp,
 			    THERM, 2);
 static SENSOR_DEVICE_ATTR_2(temp3_crit_hyst, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, HYSTERSIS, 2);
+static SENSOR_DEVICE_ATTR_2(temp3_smoothing, S_IRUGO | S_IWUSR, show_temp_st,
+			    set_temp_st, MIN, 2);
+static SENSOR_DEVICE_ATTR_2(temp3_smoothing_enable, S_IRUGO | S_IWUSR,
+			    show_temp_st, set_temp_st, CONTROL, 2);
 static SENSOR_DEVICE_ATTR_2(fan1_input, S_IRUGO, show_tach, NULL, INPUT, 0);
 static SENSOR_DEVICE_ATTR_2(fan1_min, S_IRUGO | S_IWUSR, show_tach, set_tach,
 			    MIN, 0);
@@ -1125,6 +1240,8 @@ static struct attribute *adt7475_attrs[] = {
 	&sensor_dev_attr_temp1_auto_point2_temp.dev_attr.attr,
 	&sensor_dev_attr_temp1_crit.dev_attr.attr,
 	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp1_smoothing.dev_attr.attr,
+	&sensor_dev_attr_temp1_smoothing_enable.dev_attr.attr,
 	&sensor_dev_attr_temp2_input.dev_attr.attr,
 	&sensor_dev_attr_temp2_alarm.dev_attr.attr,
 	&sensor_dev_attr_temp2_max.dev_attr.attr,
@@ -1134,6 +1251,8 @@ static struct attribute *adt7475_attrs[] = {
 	&sensor_dev_attr_temp2_auto_point2_temp.dev_attr.attr,
 	&sensor_dev_attr_temp2_crit.dev_attr.attr,
 	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp2_smoothing.dev_attr.attr,
+	&sensor_dev_attr_temp2_smoothing_enable.dev_attr.attr,
 	&sensor_dev_attr_temp3_input.dev_attr.attr,
 	&sensor_dev_attr_temp3_fault.dev_attr.attr,
 	&sensor_dev_attr_temp3_alarm.dev_attr.attr,
@@ -1144,6 +1263,8 @@ static struct attribute *adt7475_attrs[] = {
 	&sensor_dev_attr_temp3_auto_point2_temp.dev_attr.attr,
 	&sensor_dev_attr_temp3_crit.dev_attr.attr,
 	&sensor_dev_attr_temp3_crit_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp3_smoothing.dev_attr.attr,
+	&sensor_dev_attr_temp3_smoothing_enable.dev_attr.attr,
 	&sensor_dev_attr_fan1_input.dev_attr.attr,
 	&sensor_dev_attr_fan1_min.dev_attr.attr,
 	&sensor_dev_attr_fan1_alarm.dev_attr.attr,
-- 
2.11.0.24.ge6920cf

