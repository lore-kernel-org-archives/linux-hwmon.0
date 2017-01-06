Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from argos.tuxed.org ([176.9.87.227]:33476 "EHLO argos.tuxed.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1161325AbdAFKpo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 6 Jan 2017 05:45:44 -0500
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Hornung <mhornung.linux@gmail.com>,
        devicetree@vger.kernel.org, Alexander Koch <mail@alexanderkoch.net>
Subject: [PATCH v3 3/4] hwmon: adc128d818: Support operation modes 1-3
Date: Fri,  6 Jan 2017 11:38:16 +0100
Message-Id: <20170106103817.11588-4-mail@alexanderkoch.net>
In-Reply-To: <20170106103817.11588-1-mail@alexanderkoch.net>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for operation modes 1-3 of the ADC128D818 (see datasheet sec.
8.4.1). These differ in the number and type of the available input signals,
requiring the driver to selectively hide sysfs nodes according to the
operation mode configured via devicetree.

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
Acked-by: Michael Hornung <mhornung.linux@gmail.com>
---
 drivers/hwmon/adc128d818.c | 126 +++++++++++++++++++++++++++++++--------------
 1 file changed, 86 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 2b61936c32ff..0502af963f73 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -59,6 +59,12 @@ static const unsigned short normal_i2c[] = {
 #define ADC128_REG_MAN_ID		0x3e
 #define ADC128_REG_DEV_ID		0x3f
 
+/* No. of voltage entries in adc128_attrs */
+#define ADC128_ATTR_NUM_VOLT		(8 * 4)
+
+/* Voltage inputs visible per operation mode */
+static const u8 num_inputs[] = { 7, 8, 4, 6 };
+
 struct adc128_data {
 	struct i2c_client *client;
 	struct regulator *regulator;
@@ -68,7 +74,7 @@ struct adc128_data {
 	bool valid;		/* true if following fields are valid */
 	unsigned long last_updated;	/* In jiffies */
 
-	u16 in[3][7];		/* Register value, normalized to 12 bit
+	u16 in[3][8];		/* Register value, normalized to 12 bit
 				 * 0: input voltage
 				 * 1: min limit
 				 * 2: max limit
@@ -89,7 +95,7 @@ static struct adc128_data *adc128_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		for (i = 0; i < 7; i++) {
+		for (i = 0; i < num_inputs[data->mode]; i++) {
 			rv = i2c_smbus_read_word_swapped(client,
 							 ADC128_REG_IN(i));
 			if (rv < 0)
@@ -109,20 +115,25 @@ static struct adc128_data *adc128_update_device(struct device *dev)
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
@@ -242,6 +253,25 @@ static ssize_t adc128_show_alarm(struct device *dev,
 	return sprintf(buf, "%u\n", !!(alarms & mask));
 }
 
+static umode_t adc128_is_visible(struct kobject *kobj,
+				 struct attribute *attr, int index)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct adc128_data *data = dev_get_drvdata(dev);
+
+	if (index < ADC128_ATTR_NUM_VOLT) {
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
 static SENSOR_DEVICE_ATTR_2(in0_input, S_IRUGO,
 			    adc128_show_in, NULL, 0, 0);
 static SENSOR_DEVICE_ATTR_2(in0_min, S_IWUSR | S_IRUGO,
@@ -291,6 +321,13 @@ static SENSOR_DEVICE_ATTR_2(in6_min, S_IWUSR | S_IRUGO,
 static SENSOR_DEVICE_ATTR_2(in6_max, S_IWUSR | S_IRUGO,
 			    adc128_show_in, adc128_set_in, 6, 2);
 
+static SENSOR_DEVICE_ATTR_2(in7_input, S_IRUGO,
+			    adc128_show_in, NULL, 7, 0);
+static SENSOR_DEVICE_ATTR_2(in7_min, S_IWUSR | S_IRUGO,
+			    adc128_show_in, adc128_set_in, 7, 1);
+static SENSOR_DEVICE_ATTR_2(in7_max, S_IWUSR | S_IRUGO,
+			    adc128_show_in, adc128_set_in, 7, 2);
+
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, adc128_show_temp, NULL, 0);
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
 			  adc128_show_temp, adc128_set_temp, 1);
@@ -304,44 +341,54 @@ static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, adc128_show_alarm, NULL, 3);
 static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, adc128_show_alarm, NULL, 4);
 static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, adc128_show_alarm, NULL, 5);
 static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, adc128_show_alarm, NULL, 6);
+static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, adc128_show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adc128_show_alarm, NULL, 7);
 
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
@@ -446,9 +493,8 @@ static int adc128_probe(struct i2c_client *client,
 
 	/* Operation mode is optional and defaults to mode 0 */
 	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
-		/* Currently only mode 0 supported */
-		if (data->mode != 0) {
-			dev_err(dev, "unsupported operation mode %d\n",
+		if (data->mode > 3) {
+			dev_err(dev, "invalid operation mode %d\n",
 				data->mode);
 			err = -EINVAL;
 			goto error;
-- 
2.11.0

