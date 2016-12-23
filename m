Return-path: <mail@alexanderkoch.net>
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Kosina <trivial@kernel.org>,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [RFC PATCH v2 4/4] hwmon: adc128d818: Support operation modes 1-3
Date: Fri, 23 Dec 2016 23:12:05 +0100
Message-Id: <20161223221205.8825-5-mail@alexanderkoch.net>
In-Reply-To: <20161223221205.8825-1-mail@alexanderkoch.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
List-ID: <linux-hwmon@vger.kernel.org>

Add support for operation modes 1-3 of the ADC128D818 (see datasheet sec.
8.4.1). These differ in the number and type of the available input signals,
requiring the driver to selectively hide sysfs nodes according to the
operation mode configured via devicetree.

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 drivers/hwmon/adc128d818.c | 120 ++++++++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index cbb3bc5e5229..46c9fc9f1be2 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -59,6 +59,9 @@ static const unsigned short normal_i2c[] = {
 #define ADC128_REG_MAN_ID		0x3e
 #define ADC128_REG_DEV_ID		0x3f
 
+/* Voltage inputs visible per operation mode */
+static const u8 num_inputs[] = { 7, 8, 4, 6 };
+
 struct adc128_data {
 	struct i2c_client *client;
 	struct regulator *regulator;
@@ -68,7 +71,7 @@ struct adc128_data {
 	bool valid;		/* true if following fields are valid */
 	unsigned long last_updated;	/* In jiffies */
 
-	u16 in[3][7];		/* Register value, normalized to 12 bit
+	u16 in[3][8];		/* Register value, normalized to 12 bit
 				 * 0: input voltage
 				 * 1: min limit
 				 * 2: max limit
@@ -89,7 +92,7 @@ static struct adc128_data *adc128_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		for (i = 0; i < 7; i++) {
+		for (i = 0; i < num_inputs[data->mode]; i++) {
 			rv = i2c_smbus_read_word_swapped(client,
 							 ADC128_REG_IN(i));
 			if (rv < 0)
@@ -109,20 +112,25 @@ static struct adc128_data *adc128_update_device(struct device *dev)
 			data->in[2][i] = rv << 4;
 		}
 
-		rv = i2c_smbus_read_word_swapped(client, ADC128_REG_TEMP);
-		if (rv < 0)
-			goto abort;
-		data->temp[0] = rv >> 7;
+		if (data->mode != 1) {
+			rv = i2c_smbus_read_word_swapped(client,
+							 ADC128_REG_TEMP);
+			if (rv < 0)
+				goto abort;
+			data->temp[0] = rv >> 7;
 
-		rv = i2c_smbus_read_byte_data(client, ADC128_REG_TEMP_MAX);
-		if (rv < 0)
-			goto abort;
-		data->temp[1] = rv << 1;
+			rv = i2c_smbus_read_byte_data(client,
+						      ADC128_REG_TEMP_MAX);
+			if (rv < 0)
+				goto abort;
+			data->temp[1] = rv << 1;
 
-		rv = i2c_smbus_read_byte_data(client, ADC128_REG_TEMP_HYST);
-		if (rv < 0)
-			goto abort;
-		data->temp[2] = rv << 1;
+			rv = i2c_smbus_read_byte_data(client,
+						      ADC128_REG_TEMP_HYST);
+			if (rv < 0)
+				goto abort;
+			data->temp[2] = rv << 1;
+		}
 
 		rv = i2c_smbus_read_byte_data(client, ADC128_REG_ALARM);
 		if (rv < 0)
@@ -242,6 +250,25 @@ static ssize_t adc128_show_alarm(struct device *dev,
 	return sprintf(buf, "%u\n", !!(alarms & mask));
 }
 
+static umode_t adc128_is_visible(struct kobject *kobj,
+				 struct attribute *attr, int index)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct adc128_data *data = dev_get_drvdata(dev);
+
+	if (index < 8 * 4) {
+		/* Voltage, visible according to num_inputs[] */
+		if (index >= num_inputs[data->mode] * 4)
+			return 0;
+	} else {
+		/* Temperature, visible if not in mode 1 */
+		if (data->mode == 1)
+			return 0;
+	}
+
+	return attr->mode;
+}
+
 static SENSOR_DEVICE_ATTR_2(in0_input, 0444, adc128_show_in, NULL, 0, 0);
 static SENSOR_DEVICE_ATTR_2(in0_min, 0644, adc128_show_in, adc128_set_in, 0, 1);
 static SENSOR_DEVICE_ATTR_2(in0_max, 0644, adc128_show_in, adc128_set_in, 0, 2);
@@ -270,6 +297,10 @@ static SENSOR_DEVICE_ATTR_2(in6_input, 0444, adc128_show_in, NULL, 6, 0);
 static SENSOR_DEVICE_ATTR_2(in6_min, 0644, adc128_show_in, adc128_set_in, 6, 1);
 static SENSOR_DEVICE_ATTR_2(in6_max, 0644, adc128_show_in, adc128_set_in, 6, 2);
 
+static SENSOR_DEVICE_ATTR_2(in7_input, 0444, adc128_show_in, NULL, 7, 0);
+static SENSOR_DEVICE_ATTR_2(in7_min, 0644, adc128_show_in, adc128_set_in, 7, 1);
+static SENSOR_DEVICE_ATTR_2(in7_max, 0644, adc128_show_in, adc128_set_in, 7, 2);
+
 static SENSOR_DEVICE_ATTR(temp1_input, 0444, adc128_show_temp, NULL, 0);
 static SENSOR_DEVICE_ATTR(temp1_max, 0644,
 			  adc128_show_temp, adc128_set_temp, 1);
@@ -283,44 +314,54 @@ static SENSOR_DEVICE_ATTR(in3_alarm, 0444, adc128_show_alarm, NULL, 3);
 static SENSOR_DEVICE_ATTR(in4_alarm, 0444, adc128_show_alarm, NULL, 4);
 static SENSOR_DEVICE_ATTR(in5_alarm, 0444, adc128_show_alarm, NULL, 5);
 static SENSOR_DEVICE_ATTR(in6_alarm, 0444, adc128_show_alarm, NULL, 6);
+static SENSOR_DEVICE_ATTR(in7_alarm, 0444, adc128_show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_max_alarm, 0444, adc128_show_alarm, NULL, 7);
 
 static struct attribute *adc128_attrs[] = {
-	&sensor_dev_attr_in0_min.dev_attr.attr,
-	&sensor_dev_attr_in1_min.dev_attr.attr,
-	&sensor_dev_attr_in2_min.dev_attr.attr,
-	&sensor_dev_attr_in3_min.dev_attr.attr,
-	&sensor_dev_attr_in4_min.dev_attr.attr,
-	&sensor_dev_attr_in5_min.dev_attr.attr,
-	&sensor_dev_attr_in6_min.dev_attr.attr,
-	&sensor_dev_attr_in0_max.dev_attr.attr,
-	&sensor_dev_attr_in1_max.dev_attr.attr,
-	&sensor_dev_attr_in2_max.dev_attr.attr,
-	&sensor_dev_attr_in3_max.dev_attr.attr,
-	&sensor_dev_attr_in4_max.dev_attr.attr,
-	&sensor_dev_attr_in5_max.dev_attr.attr,
-	&sensor_dev_attr_in6_max.dev_attr.attr,
+	&sensor_dev_attr_in0_alarm.dev_attr.attr,
 	&sensor_dev_attr_in0_input.dev_attr.attr,
+	&sensor_dev_attr_in0_max.dev_attr.attr,
+	&sensor_dev_attr_in0_min.dev_attr.attr,
+	&sensor_dev_attr_in1_alarm.dev_attr.attr,
 	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_max.dev_attr.attr,
+	&sensor_dev_attr_in1_min.dev_attr.attr,
+	&sensor_dev_attr_in2_alarm.dev_attr.attr,
 	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_max.dev_attr.attr,
+	&sensor_dev_attr_in2_min.dev_attr.attr,
+	&sensor_dev_attr_in3_alarm.dev_attr.attr,
 	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_in3_max.dev_attr.attr,
+	&sensor_dev_attr_in3_min.dev_attr.attr,
+	&sensor_dev_attr_in4_alarm.dev_attr.attr,
 	&sensor_dev_attr_in4_input.dev_attr.attr,
+	&sensor_dev_attr_in4_max.dev_attr.attr,
+	&sensor_dev_attr_in4_min.dev_attr.attr,
+	&sensor_dev_attr_in5_alarm.dev_attr.attr,
 	&sensor_dev_attr_in5_input.dev_attr.attr,
+	&sensor_dev_attr_in5_max.dev_attr.attr,
+	&sensor_dev_attr_in5_min.dev_attr.attr,
+	&sensor_dev_attr_in6_alarm.dev_attr.attr,
 	&sensor_dev_attr_in6_input.dev_attr.attr,
+	&sensor_dev_attr_in6_max.dev_attr.attr,
+	&sensor_dev_attr_in6_min.dev_attr.attr,
+	&sensor_dev_attr_in7_alarm.dev_attr.attr,
+	&sensor_dev_attr_in7_input.dev_attr.attr,
+	&sensor_dev_attr_in7_max.dev_attr.attr,
+	&sensor_dev_attr_in7_min.dev_attr.attr,
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_in0_alarm.dev_attr.attr,
-	&sensor_dev_attr_in1_alarm.dev_attr.attr,
-	&sensor_dev_attr_in2_alarm.dev_attr.attr,
-	&sensor_dev_attr_in3_alarm.dev_attr.attr,
-	&sensor_dev_attr_in4_alarm.dev_attr.attr,
-	&sensor_dev_attr_in5_alarm.dev_attr.attr,
-	&sensor_dev_attr_in6_alarm.dev_attr.attr,
 	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(adc128);
+
+static struct attribute_group adc128_group = {
+	.attrs = adc128_attrs,
+	.is_visible = adc128_is_visible,
+};
+__ATTRIBUTE_GROUPS(adc128);
 
 static int adc128_detect(struct i2c_client *client, struct i2c_board_info *info)
 {
@@ -425,9 +466,8 @@ static int adc128_probe(struct i2c_client *client,
 
 	/* Operation mode is optional and defaults to mode 0 */
 	if (of_property_read_u8(dev->of_node, "mode", &data->mode) == 0) {
-		/* Currently only mode 0 supported */
-		if (data->mode != 0) {
-			dev_err(dev, "unsupported operation mode %d",
+		if (data->mode > 3) {
+			dev_err(dev, "invalid operation mode %d",
 				data->mode);
 			err = -EINVAL;
 			goto error;
-- 
2.11.0
