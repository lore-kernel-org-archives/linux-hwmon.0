Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36790 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdEBFqH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 May 2017 01:46:07 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (adt7475) fan stall prevention
Date: Tue,  2 May 2017 17:45:35 +1200
Message-Id: <20170502054536.21147-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
References: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

By default adt7475 will stop the fans (pwm duty cycle 0%) when the
temperature drops past Tmin - hysteresis. Some systems want to keep the
fans moving even when the temperature drops so add new sysfs attributes
that configure the enhanced acoustics min 1-3 which allows the fans to
run at the minimum configure pwm duty cycle.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
pwmN_min is a horrible name but I really can't think of anything better.
I'm biased a little because that is essentially the name of the bits in
the datasheet. I'm open to suggestions.

 Documentation/hwmon/adt7475 |  5 +++++
 drivers/hwmon/adt7475.c     | 50 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475
index 0502f2b464e1..85dc9e17bdee 100644
--- a/Documentation/hwmon/adt7475
+++ b/Documentation/hwmon/adt7475
@@ -109,6 +109,11 @@ fan speed) is applied. PWM values range from 0 (off) to 255 (full speed).
 Fan speed may be set to maximum when the temperature sensor associated with
 the PWM control exceeds temp#_max.
 
+At Tmin - hysteresis the PWM output can either be off (0% duty cycle) or
+at the minimum (i.e. auto_point1_pwm). This can be configured using the
+pwm[1-*]_min sysfs attribute. A value of 0 means the fans will shut off. A
+value of 1 means the fans will run at auto_point1_pwm.
+
 Notes
 -----
 
diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index ec0c43fbcdce..53f25bda0919 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -79,6 +79,9 @@
 
 #define REG_TEMP_TRANGE_BASE	0x5F
 
+#define REG_ENHANCE_ACOUSTICS1	0x62
+#define REG_ENHANCE_ACOUSTICS2	0x63
+
 #define REG_PWM_MIN_BASE	0x64
 
 #define REG_TEMP_TMIN_BASE	0x67
@@ -209,6 +212,7 @@ struct adt7475_data {
 	u8 range[3];
 	u8 pwmctl[3];
 	u8 pwmchan[3];
+	u8 enh_acou[2];
 
 	u8 vid;
 	u8 vrm;
@@ -700,6 +704,43 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	data->pwm[sattr->nr][sattr->index] = clamp_val(val, 0, 0xFF);
 	i2c_smbus_write_byte_data(client, reg,
 				  data->pwm[sattr->nr][sattr->index]);
+	mutex_unlock(&data->lock);
+
+	return count;
+}
+
+
+static ssize_t show_pwm_min(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adt7475_data *data = i2c_get_clientdata(client);
+	u8 mask = BIT(5 + sattr->index);
+
+	return sprintf(buf, "%d\n", !!(data->enh_acou[0] & mask));
+}
+
+static ssize_t set_pwm_min(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct adt7475_data *data = i2c_get_clientdata(client);
+	long val;
+	u8 mask = BIT(5 + sattr->index);
+
+	if (kstrtol(buf, 10, &val))
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+
+	data->enh_acou[0] &= ~mask;
+	if (val)
+		data->enh_acou[0] |= mask;
+
+	i2c_smbus_write_byte_data(client, REG_ENHANCE_ACOUSTICS1,
+				  data->enh_acou[0]);
 
 	mutex_unlock(&data->lock);
 
@@ -1028,6 +1069,8 @@ static SENSOR_DEVICE_ATTR_2(pwm1_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MIN, 0);
 static SENSOR_DEVICE_ATTR_2(pwm1_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MAX, 0);
+static SENSOR_DEVICE_ATTR_2(pwm1_min, S_IRUGO | S_IWUSR, show_pwm_min,
+			    set_pwm_min, 0, 0);
 static SENSOR_DEVICE_ATTR_2(pwm2, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
 			    1);
 static SENSOR_DEVICE_ATTR_2(pwm2_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
@@ -1040,6 +1083,8 @@ static SENSOR_DEVICE_ATTR_2(pwm2_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MIN, 1);
 static SENSOR_DEVICE_ATTR_2(pwm2_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MAX, 1);
+static SENSOR_DEVICE_ATTR_2(pwm2_min, S_IRUGO | S_IWUSR, show_pwm_min,
+			    set_pwm_min, 0, 1);
 static SENSOR_DEVICE_ATTR_2(pwm3, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
 			    2);
 static SENSOR_DEVICE_ATTR_2(pwm3_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
@@ -1052,6 +1097,8 @@ static SENSOR_DEVICE_ATTR_2(pwm3_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MIN, 2);
 static SENSOR_DEVICE_ATTR_2(pwm3_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
 			    set_pwm, MAX, 2);
+static SENSOR_DEVICE_ATTR_2(pwm3_min, S_IRUGO | S_IWUSR, show_pwm_min,
+			    set_pwm_min, 0, 2);
 
 /* Non-standard name, might need revisiting */
 static DEVICE_ATTR_RW(pwm_use_point2_pwm_at_crit);
@@ -1112,12 +1159,14 @@ static struct attribute *adt7475_attrs[] = {
 	&sensor_dev_attr_pwm1_auto_channels_temp.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_min.dev_attr.attr,
 	&sensor_dev_attr_pwm3.dev_attr.attr,
 	&sensor_dev_attr_pwm3_freq.dev_attr.attr,
 	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
 	&sensor_dev_attr_pwm3_auto_channels_temp.dev_attr.attr,
 	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm3_min.dev_attr.attr,
 	&dev_attr_pwm_use_point2_pwm_at_crit.attr,
 	NULL,
 };
@@ -1136,6 +1185,7 @@ static struct attribute *pwm2_attrs[] = {
 	&sensor_dev_attr_pwm2_auto_channels_temp.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_min.dev_attr.attr,
 	NULL
 };
 
-- 
2.11.0.24.ge6920cf

