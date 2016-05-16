Return-path: <joshuas@alliedtelesis.co.nz>
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: adt7470: Expose PWM frequency to sysfs
Date: Mon, 16 May 2016 17:20:32 +1200
Message-Id: <1463376032-21196-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

The ADT7470 supports a variety of PWM frequencies. This patch allows the
frequency to be configured and viewed through sysfs.

The valid options are:
 -> 11.0 Hz
 -> 14.7 Hz
 -> 22.1 Hz
 -> 29.4 Hz
 -> 35.3 Hz
 -> 44.1 Hz
 -> 58.8 Hz
 -> 88.2 Hz
 -> 1.4 kHz
 -> 22.5 kHz

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 Documentation/hwmon/adt7470 |  17 +++++
 drivers/hwmon/adt7470.c     | 150 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/Documentation/hwmon/adt7470 b/Documentation/hwmon/adt7470
index 8ce4aa0..f8a58f0 100644
--- a/Documentation/hwmon/adt7470
+++ b/Documentation/hwmon/adt7470
@@ -65,6 +65,23 @@ from 0 (off) to 255 (full speed).  Fan speed will be set to maximum when the
 temperature sensor associated with the PWM control exceeds
 pwm#_auto_point2_temp.
 
+The driver also allows control of the PWM frequency:
+
+* pwm_freq
+
+The following frequencies are valid:
+
+* 11.0 Hz
+* 14.7 Hz
+* 22.1 Hz
+* 29.4 Hz
+* 35.3 Hz
+* 44.1 Hz
+* 58.8 Hz
+* 88.2 Hz
+* 1.4 kHz
+* 22.5 kHz
+
 Notes
 -----
 
diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index f5da39a..e5f0d6e 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -83,6 +83,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_PWM_MIN_MAX_ADDR		0x6D
 #define ADT7470_REG_PWM_TEMP_MIN_BASE_ADDR	0x6E
 #define ADT7470_REG_PWM_TEMP_MIN_MAX_ADDR	0x71
+#define ADT7470_REG_CFG_2			0x74
 #define ADT7470_REG_ACOUSTICS12			0x75
 #define ADT7470_REG_ACOUSTICS34			0x76
 #define ADT7470_REG_DEVICE			0x3D
@@ -142,6 +143,32 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define FAN_PERIOD_INVALID	65535
 #define FAN_DATA_VALID(x)	((x) && (x) != FAN_PERIOD_INVALID)
 
+/* The datasheet includes a table of available pwm frequencies
+ * controlled by values in config registers 1 and 2.
+ */
+#define ADT7470_CFG_LF		0x40
+#define ADT7470_FREQ_BITS	0x70
+#define ADT7470_CFG_LF_11_0_HZ	0x00
+#define ADT7470_CFG_LF_14_7_HZ	0x10
+#define ADT7470_CFG_LF_22_1_HZ	0x20
+#define ADT7470_CFG_LF_29_4_HZ	0x30
+#define ADT7470_CFG_LF_35_3_HZ	0x40
+#define ADT7470_CFG_LF_44_1_HZ	0x50
+#define ADT7470_CFG_LF_58_8_HZ	0x60
+#define ADT7470_CFG_LF_88_2_HZ	0x70
+#define ADT7470_CFG_HF_1_4_KHZ	0x00
+#define ADT7470_CFG_HF_22_5_KHZ	0x10
+#define ADT7470_11_0_HZ_STR  "11.0 Hz"
+#define ADT7470_14_7_HZ_STR  "14.7 Hz"
+#define ADT7470_22_1_HZ_STR  "22.1 Hz"
+#define ADT7470_29_4_HZ_STR  "29.4 Hz"
+#define ADT7470_35_3_HZ_STR  "35.3 Hz"
+#define ADT7470_44_1_HZ_STR  "44.1 Hz"
+#define ADT7470_58_8_HZ_STR  "58.8 Hz"
+#define ADT7470_88_2_HZ_STR  "88.2 Hz"
+#define ADT7470_1_4_KHZ_STR  "1.4 kHz"
+#define ADT7470_22_5_KHZ_STR "22.5 kHz"
+
 struct adt7470_data {
 	struct i2c_client	*client;
 	struct mutex		lock;
@@ -688,6 +715,126 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
+static ssize_t show_pwm_freq(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
+{
+	struct adt7470_data *data = adt7470_update_device(dev);
+	unsigned char cfg_reg_1;
+	unsigned char cfg_reg_2;
+	char *freq = "invalid";
+
+	mutex_lock(&data->lock);
+	cfg_reg_1 = i2c_smbus_read_byte_data(data->client, ADT7470_REG_CFG);
+	cfg_reg_2 = i2c_smbus_read_byte_data(data->client, ADT7470_REG_CFG_2);
+	mutex_unlock(&data->lock);
+
+	if (cfg_reg_1 & ADT7470_CFG_LF)
+		switch (cfg_reg_2 & ADT7470_FREQ_BITS) {
+		case ADT7470_CFG_LF_11_0_HZ:
+			freq = ADT7470_11_0_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_14_7_HZ:
+			freq = ADT7470_14_7_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_22_1_HZ:
+			freq = ADT7470_22_1_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_29_4_HZ:
+			freq = ADT7470_29_4_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_35_3_HZ:
+			freq = ADT7470_35_3_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_44_1_HZ:
+			freq = ADT7470_44_1_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_58_8_HZ:
+			freq = ADT7470_58_8_HZ_STR;
+			break;
+		case ADT7470_CFG_LF_88_2_HZ:
+			freq = ADT7470_88_2_HZ_STR;
+			break;
+		}
+	else
+		switch (cfg_reg_2 & ADT7470_FREQ_BITS) {
+		case ADT7470_CFG_HF_1_4_KHZ:
+			freq = ADT7470_1_4_KHZ_STR;
+			break;
+		default:
+			freq = ADT7470_22_5_KHZ_STR;
+			break;
+		}
+	return scnprintf(buf, PAGE_SIZE, "%s\n", freq);
+}
+
+static ssize_t set_pwm_freq(struct device *dev,
+			    struct device_attribute *devattr,
+			    const char *buf, size_t count)
+{
+	struct adt7470_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int low_freq = ADT7470_CFG_LF;
+	int freq_bits;
+	unsigned char val;
+
+	if (!strncmp(ADT7470_11_0_HZ_STR, buf, strlen(ADT7470_11_0_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_11_0_HZ;
+
+	else if (!strncmp(ADT7470_14_7_HZ_STR, buf,
+			  strlen(ADT7470_14_7_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_14_7_HZ;
+
+	else if (!strncmp(ADT7470_22_1_HZ_STR, buf,
+			  strlen(ADT7470_22_1_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_22_1_HZ;
+
+	else if (!strncmp(ADT7470_29_4_HZ_STR, buf,
+			  strlen(ADT7470_29_4_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_29_4_HZ;
+
+	else if (!strncmp(ADT7470_35_3_HZ_STR, buf,
+			  strlen(ADT7470_35_3_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_35_3_HZ;
+
+	else if (!strncmp(ADT7470_44_1_HZ_STR, buf,
+			  strlen(ADT7470_44_1_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_44_1_HZ;
+
+	else if (!strncmp(ADT7470_58_8_HZ_STR, buf,
+			  strlen(ADT7470_58_8_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_58_8_HZ;
+
+	else if (!strncmp(ADT7470_88_2_HZ_STR, buf,
+			  strlen(ADT7470_88_2_HZ_STR)))
+		freq_bits = ADT7470_CFG_LF_88_2_HZ;
+
+	else if (!strncmp(ADT7470_1_4_KHZ_STR, buf,
+			  strlen(ADT7470_1_4_KHZ_STR))) {
+		freq_bits = ADT7470_CFG_HF_1_4_KHZ;
+		low_freq = 0;
+
+	} else if (!strncmp(ADT7470_22_5_KHZ_STR, buf,
+			  strlen(ADT7470_22_5_KHZ_STR))) {
+		freq_bits = ADT7470_CFG_HF_22_5_KHZ;
+		low_freq = 0;
+
+	} else
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	/* Configuration Register 1 */
+	val = i2c_smbus_read_byte_data(client, ADT7470_REG_CFG);
+	i2c_smbus_write_byte_data(client, ADT7470_REG_CFG,
+				  (val & ~ADT7470_CFG_LF) | low_freq);
+	/* Configuration Register 2 */
+	val = i2c_smbus_read_byte_data(client, ADT7470_REG_CFG_2);
+	i2c_smbus_write_byte_data(client, ADT7470_REG_CFG_2,
+				  (val & ~ADT7470_FREQ_BITS) | freq_bits);
+	mutex_unlock(&data->lock);
+
+	return count;
+}
+
 static ssize_t show_pwm_max(struct device *dev,
 			    struct device_attribute *devattr,
 			    char *buf)
@@ -1038,6 +1185,8 @@ static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
 static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
 static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
 
+static DEVICE_ATTR(pwm_freq, S_IWUSR | S_IRUGO, show_pwm_freq, set_pwm_freq);
+
 static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
 		    show_pwm_min, set_pwm_min, 0);
 static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, S_IWUSR | S_IRUGO,
@@ -1096,6 +1245,7 @@ static struct attribute *adt7470_attrs[] = {
 	&dev_attr_alarm_mask.attr,
 	&dev_attr_num_temp_sensors.attr,
 	&dev_attr_auto_update_interval.attr,
+	&dev_attr_pwm_freq.attr,
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
 	&sensor_dev_attr_temp2_max.dev_attr.attr,
 	&sensor_dev_attr_temp3_max.dev_attr.attr,
-- 
2.8.1
