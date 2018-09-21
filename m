Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36730 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391409AbeIVCD2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 22:03:28 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, corbet@lwn.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: ina3221: Read channel input source info from DT
Date: Fri, 21 Sep 2018 13:12:52 -0700
Message-Id: <20180921201252.12875-3-nicoleotsuka@gmail.com>
In-Reply-To: <20180921201252.12875-1-nicoleotsuka@gmail.com>
References: <20180921201252.12875-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Nicolin Chen <nicolinc@nvidia.com>

An ina3221 chip has three input ports. Each port is used
to measure the voltage and current of its input source.

The DT binding now has defined bindings for their input
sources, so the driver should read these information and
handle accordingly.

This patch adds a new structure of input source specific
information including input source label, shunt resistor
value and its connection status. It exposes these labels
via sysfs and also disables those channels where there's
no input source being connected.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
Changelog
v1->v2:
 * Added a structure for input source corresponding to DT bindings
 * Moved shunt resistor value to the structure
 * Defined in[123]_label sysfs nodes instead of name[123]_input
 * Updated probe() function to get information from DT
 * Updated ina3221 hwmon documentation for the labels
 * Dropped dynamical group definition to keep all groups as they were
 * * Will send an incremental patch later apart from this DT binding series

 Documentation/hwmon/ina3221 |   1 +
 drivers/hwmon/ina3221.c     | 126 +++++++++++++++++++++++++++++++++---
 2 files changed, 117 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/ina3221 b/Documentation/hwmon/ina3221
index 0ff74854cb2e..2726038be5bd 100644
--- a/Documentation/hwmon/ina3221
+++ b/Documentation/hwmon/ina3221
@@ -22,6 +22,7 @@ Sysfs entries
 -------------
 
 in[123]_input           Bus voltage(mV) channels
+in[123]_label           Voltage channel labels
 curr[123]_input         Current(mA) measurement channels
 shunt[123]_resistor     Shunt resistance(uOhm) channels
 curr[123]_crit          Critical alert current(mA) setting, activates the
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e6b49500c52a..ba470fc53e27 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -41,6 +41,7 @@
 #define INA3221_CONFIG_MODE_SHUNT	BIT(1)
 #define INA3221_CONFIG_MODE_BUS		BIT(2)
 #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(3)
+#define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
 
 #define INA3221_RSHUNT_DEFAULT		10000
 
@@ -86,16 +87,28 @@ static const unsigned int register_channel[] = {
 	[INA3221_WARN3] = INA3221_CHANNEL3,
 };
 
+/**
+ * struct ina3221_input - channel input source specific information
+ * @label: label of channel input source
+ * @shunt_resistor: shunt resistor value of channel input source
+ * @disconnected: connection status of channel input source
+ */
+struct ina3221_input {
+	const char *label;
+	int shunt_resistor;
+	bool disconnected;
+};
+
 /**
  * struct ina3221_data - device specific information
  * @regmap: Register map of the device
  * @fields: Register fields of the device
- * @shunt_resistors: Array of resistor values per channel
+ * @inputs: Array of channel input source specific structures
  */
 struct ina3221_data {
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
-	int shunt_resistors[INA3221_NUM_CHANNELS];
+	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
 };
 
 static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
@@ -131,6 +144,17 @@ static ssize_t ina3221_show_bus_voltage(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", voltage_mv);
 }
 
+static ssize_t ina3221_show_label(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
+	struct ina3221_data *ina = dev_get_drvdata(dev);
+	unsigned int channel = sd_attr->index;
+	struct ina3221_input *input = &ina->inputs[channel];
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", input->label);
+}
+
 static ssize_t ina3221_show_shunt_voltage(struct device *dev,
 					  struct device_attribute *attr,
 					  char *buf)
@@ -155,7 +179,8 @@ static ssize_t ina3221_show_current(struct device *dev,
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int reg = sd_attr->index;
 	unsigned int channel = register_channel[reg];
-	int resistance_uo = ina->shunt_resistors[channel];
+	struct ina3221_input *input = &ina->inputs[channel];
+	int resistance_uo = input->shunt_resistor;
 	int val, current_ma, voltage_nv, ret;
 
 	ret = ina3221_read_value(ina, reg, &val);
@@ -176,7 +201,8 @@ static ssize_t ina3221_set_current(struct device *dev,
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int reg = sd_attr->index;
 	unsigned int channel = register_channel[reg];
-	int resistance_uo = ina->shunt_resistors[channel];
+	struct ina3221_input *input = &ina->inputs[channel];
+	int resistance_uo = input->shunt_resistor;
 	int val, current_ma, voltage_uv, ret;
 
 	ret = kstrtoint(buf, 0, &current_ma);
@@ -209,11 +235,9 @@ static ssize_t ina3221_show_shunt(struct device *dev,
 	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int channel = sd_attr->index;
-	unsigned int resistance_uo;
+	struct ina3221_input *input = &ina->inputs[channel];
 
-	resistance_uo = ina->shunt_resistors[channel];
-
-	return snprintf(buf, PAGE_SIZE, "%d\n", resistance_uo);
+	return snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
 }
 
 static ssize_t ina3221_set_shunt(struct device *dev,
@@ -223,6 +247,7 @@ static ssize_t ina3221_set_shunt(struct device *dev,
 	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int channel = sd_attr->index;
+	struct ina3221_input *input = &ina->inputs[channel];
 	int val;
 	int ret;
 
@@ -232,7 +257,7 @@ static ssize_t ina3221_set_shunt(struct device *dev,
 
 	val = clamp_val(val, 1, INT_MAX);
 
-	ina->shunt_resistors[channel] = val;
+	input->shunt_resistor = val;
 
 	return count;
 }
@@ -261,6 +286,14 @@ static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO,
 static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO,
 		ina3221_show_bus_voltage, NULL, INA3221_BUS3);
 
+/* voltage channel label */
+static SENSOR_DEVICE_ATTR(in1_label, 0444,
+		ina3221_show_label, NULL, INA3221_CHANNEL1);
+static SENSOR_DEVICE_ATTR(in2_label, 0444,
+		ina3221_show_label, NULL, INA3221_CHANNEL2);
+static SENSOR_DEVICE_ATTR(in3_label, 0444,
+		ina3221_show_label, NULL, INA3221_CHANNEL3);
+
 /* calculated current */
 static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO,
 		ina3221_show_current, NULL, INA3221_SHUNT1);
@@ -320,6 +353,7 @@ static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO,
 static struct attribute *ina3221_attrs[] = {
 	/* channel 1 */
 	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
 	&sensor_dev_attr_curr1_input.dev_attr.attr,
 	&sensor_dev_attr_shunt1_resistor.dev_attr.attr,
 	&sensor_dev_attr_curr1_crit.dev_attr.attr,
@@ -330,6 +364,7 @@ static struct attribute *ina3221_attrs[] = {
 
 	/* channel 2 */
 	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
 	&sensor_dev_attr_curr2_input.dev_attr.attr,
 	&sensor_dev_attr_shunt2_resistor.dev_attr.attr,
 	&sensor_dev_attr_curr2_crit.dev_attr.attr,
@@ -340,6 +375,7 @@ static struct attribute *ina3221_attrs[] = {
 
 	/* channel 3 */
 	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
 	&sensor_dev_attr_curr3_input.dev_attr.attr,
 	&sensor_dev_attr_shunt3_resistor.dev_attr.attr,
 	&sensor_dev_attr_curr3_crit.dev_attr.attr,
@@ -370,6 +406,60 @@ static const struct regmap_config ina3221_regmap_config = {
 	.volatile_table = &ina3221_volatile_table,
 };
 
+static int ina3221_probe_child_from_dt(struct device *dev,
+				       struct device_node *child,
+				       struct ina3221_data *ina)
+{
+	struct ina3221_input *input;
+	u32 val;
+	int ret;
+
+	ret = of_property_read_u32(child, "input-id", &val);
+	if (ret) {
+		dev_err(dev, "missing input-id property of %s\n", child->name);
+		return ret;
+	} else if (val < 1 || val > INA3221_NUM_CHANNELS) {
+		dev_err(dev, "invalid input-id %d of %s\n", val, child->name);
+		return ret;
+	}
+
+	input = &ina->inputs[val - 1];
+
+	/* Log the disconnected channel input */
+	if (!of_device_is_available(child)) {
+		input->disconnected = true;
+		return 0;
+	}
+
+	/* Log the connected channel input */
+	input->label = child->name;
+
+	/* Overwrite default shunt resistor value optionally */
+	if (!of_property_read_u32(child, "shunt-resistor", &val))
+		input->shunt_resistor = val;
+
+	return 0;
+}
+
+static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
+{
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret;
+
+	/* Compatible with non-DT platforms */
+	if (!np)
+		return 0;
+
+	for_each_child_of_node(np, child) {
+		ret = ina3221_probe_child_from_dt(dev, child, ina);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ina3221_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -377,6 +467,7 @@ static int ina3221_probe(struct i2c_client *client,
 	struct ina3221_data *ina;
 	struct device *hwmon_dev;
 	int i, ret;
+	u16 mask;
 
 	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
 	if (!ina)
@@ -399,7 +490,13 @@ static int ina3221_probe(struct i2c_client *client,
 	}
 
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
-		ina->shunt_resistors[i] = INA3221_RSHUNT_DEFAULT;
+		ina->inputs[i].shunt_resistor = INA3221_RSHUNT_DEFAULT;
+
+	ret = ina3221_probe_from_dt(dev, ina);
+	if (ret) {
+		dev_err(dev, "Unable to probe from device treee\n");
+		return ret;
+	}
 
 	ret = regmap_field_write(ina->fields[F_RST], true);
 	if (ret) {
@@ -407,6 +504,15 @@ static int ina3221_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	/* Disable channels if their inputs are disconnected */
+	for (i = 0, mask = 0; i < INA3221_NUM_CHANNELS; i++) {
+		if (ina->inputs[i].disconnected)
+			mask |= INA3221_CONFIG_CHx_EN(i);
+	}
+	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG, mask, 0);
+	if (ret)
+		return ret;
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 							   client->name,
 							   ina, ina3221_groups);
-- 
2.17.1
