Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40396 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbeIWLHj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 07:07:39 -0400
Subject: Re: [PATCH v4 2/2] hwmon: ina3221: Read channel input source info
 from DT
To: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com, corbet@lwn.net
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-3-nicoleotsuka@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6f179232-9114-f403-ee35-2495cea73318@roeck-us.net>
Date: Sat, 22 Sep 2018 22:11:26 -0700
MIME-Version: 1.0
In-Reply-To: <20180923041118.8743-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 09:11 PM, Nicolin Chen wrote:
> An ina3221 chip has three input ports. Each port is used
> to measure the voltage and current of its input source.
> 
> The DT binding now has defined bindings for their input
> sources, so the driver should read these information and
> handle accordingly.
> 
> This patch adds a new structure of input source specific
> information including input source label, shunt resistor
> value and its connection status. It exposes these labels
> via sysfs if available and also disables those channels
> where there's no input source being connected.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v3->v4:
>   * Added is_visible callback function to hide sysfs nodes
> v2->v3:
>   * N/A
> v1->v2:
>   * Added a structure for input source corresponding to DT bindings
>   * Moved shunt resistor value to the structure
>   * Defined in[123]_label sysfs nodes instead of name[123]_input
>   * Updated probe() function to get information from DT
>   * Updated ina3221 hwmon documentation for the labels
>   * Dropped dynamical group definition to keep all groups as they were
>   * * Will send an incremental patch later apart from this DT binding series
> 
>   Documentation/hwmon/ina3221 |   1 +
>   drivers/hwmon/ina3221.c     | 164 +++++++++++++++++++++++++++++++++---
>   2 files changed, 154 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/hwmon/ina3221 b/Documentation/hwmon/ina3221
> index 0ff74854cb2e..2726038be5bd 100644
> --- a/Documentation/hwmon/ina3221
> +++ b/Documentation/hwmon/ina3221
> @@ -22,6 +22,7 @@ Sysfs entries
>   -------------
>   
>   in[123]_input           Bus voltage(mV) channels
> +in[123]_label           Voltage channel labels
>   curr[123]_input         Current(mA) measurement channels
>   shunt[123]_resistor     Shunt resistance(uOhm) channels
>   curr[123]_crit          Critical alert current(mA) setting, activates the
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index e6b49500c52a..101473e5e6b6 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -41,6 +41,7 @@
>   #define INA3221_CONFIG_MODE_SHUNT	BIT(1)
>   #define INA3221_CONFIG_MODE_BUS		BIT(2)
>   #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(3)
> +#define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
>   
>   #define INA3221_RSHUNT_DEFAULT		10000
>   
> @@ -86,16 +87,28 @@ static const unsigned int register_channel[] = {
>   	[INA3221_WARN3] = INA3221_CHANNEL3,
>   };
>   
> +/**
> + * struct ina3221_input - channel input source specific information
> + * @label: label of channel input source
> + * @shunt_resistor: shunt resistor value of channel input source
> + * @disconnected: connection status of channel input source
> + */
> +struct ina3221_input {
> +	const char *label;
> +	int shunt_resistor;
> +	bool disconnected;
> +};
> +
>   /**
>    * struct ina3221_data - device specific information
>    * @regmap: Register map of the device
>    * @fields: Register fields of the device
> - * @shunt_resistors: Array of resistor values per channel
> + * @inputs: Array of channel input source specific structures
>    */
>   struct ina3221_data {
>   	struct regmap *regmap;
>   	struct regmap_field *fields[F_MAX_FIELDS];
> -	int shunt_resistors[INA3221_NUM_CHANNELS];
> +	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
>   };
>   
>   static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
> @@ -131,6 +144,17 @@ static ssize_t ina3221_show_bus_voltage(struct device *dev,
>   	return snprintf(buf, PAGE_SIZE, "%d\n", voltage_mv);
>   }
>   
> +static ssize_t ina3221_show_label(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	unsigned int channel = sd_attr->index;
> +	struct ina3221_input *input = &ina->inputs[channel];
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", input->label);
> +}
> +
>   static ssize_t ina3221_show_shunt_voltage(struct device *dev,
>   					  struct device_attribute *attr,
>   					  char *buf)
> @@ -155,7 +179,8 @@ static ssize_t ina3221_show_current(struct device *dev,
>   	struct ina3221_data *ina = dev_get_drvdata(dev);
>   	unsigned int reg = sd_attr->index;
>   	unsigned int channel = register_channel[reg];
> -	int resistance_uo = ina->shunt_resistors[channel];
> +	struct ina3221_input *input = &ina->inputs[channel];
> +	int resistance_uo = input->shunt_resistor;
>   	int val, current_ma, voltage_nv, ret;
>   
>   	ret = ina3221_read_value(ina, reg, &val);
> @@ -176,7 +201,8 @@ static ssize_t ina3221_set_current(struct device *dev,
>   	struct ina3221_data *ina = dev_get_drvdata(dev);
>   	unsigned int reg = sd_attr->index;
>   	unsigned int channel = register_channel[reg];
> -	int resistance_uo = ina->shunt_resistors[channel];
> +	struct ina3221_input *input = &ina->inputs[channel];
> +	int resistance_uo = input->shunt_resistor;
>   	int val, current_ma, voltage_uv, ret;
>   
>   	ret = kstrtoint(buf, 0, &current_ma);
> @@ -209,11 +235,9 @@ static ssize_t ina3221_show_shunt(struct device *dev,
>   	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>   	struct ina3221_data *ina = dev_get_drvdata(dev);
>   	unsigned int channel = sd_attr->index;
> -	unsigned int resistance_uo;
> +	struct ina3221_input *input = &ina->inputs[channel];
>   
> -	resistance_uo = ina->shunt_resistors[channel];
> -
> -	return snprintf(buf, PAGE_SIZE, "%d\n", resistance_uo);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
>   }
>   
>   static ssize_t ina3221_set_shunt(struct device *dev,
> @@ -223,6 +247,7 @@ static ssize_t ina3221_set_shunt(struct device *dev,
>   	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>   	struct ina3221_data *ina = dev_get_drvdata(dev);
>   	unsigned int channel = sd_attr->index;
> +	struct ina3221_input *input = &ina->inputs[channel];
>   	int val;
>   	int ret;
>   
> @@ -232,7 +257,7 @@ static ssize_t ina3221_set_shunt(struct device *dev,
>   
>   	val = clamp_val(val, 1, INT_MAX);
>   
> -	ina->shunt_resistors[channel] = val;
> +	input->shunt_resistor = val;
>   
>   	return count;
>   }
> @@ -261,6 +286,14 @@ static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO,
>   static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO,
>   		ina3221_show_bus_voltage, NULL, INA3221_BUS3);
>   
> +/* voltage channel label */
> +static SENSOR_DEVICE_ATTR(in1_label, 0444,
> +		ina3221_show_label, NULL, INA3221_CHANNEL1);
> +static SENSOR_DEVICE_ATTR(in2_label, 0444,
> +		ina3221_show_label, NULL, INA3221_CHANNEL2);
> +static SENSOR_DEVICE_ATTR(in3_label, 0444,
> +		ina3221_show_label, NULL, INA3221_CHANNEL3);
> +
>   /* calculated current */
>   static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO,
>   		ina3221_show_current, NULL, INA3221_SHUNT1);
> @@ -320,6 +353,7 @@ static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO,
>   static struct attribute *ina3221_attrs[] = {
>   	/* channel 1 */
>   	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_in1_label.dev_attr.attr,
>   	&sensor_dev_attr_curr1_input.dev_attr.attr,
>   	&sensor_dev_attr_shunt1_resistor.dev_attr.attr,
>   	&sensor_dev_attr_curr1_crit.dev_attr.attr,
> @@ -330,6 +364,7 @@ static struct attribute *ina3221_attrs[] = {
>   
>   	/* channel 2 */
>   	&sensor_dev_attr_in2_input.dev_attr.attr,
> +	&sensor_dev_attr_in2_label.dev_attr.attr,
>   	&sensor_dev_attr_curr2_input.dev_attr.attr,
>   	&sensor_dev_attr_shunt2_resistor.dev_attr.attr,
>   	&sensor_dev_attr_curr2_crit.dev_attr.attr,
> @@ -340,6 +375,7 @@ static struct attribute *ina3221_attrs[] = {
>   
>   	/* channel 3 */
>   	&sensor_dev_attr_in3_input.dev_attr.attr,
> +	&sensor_dev_attr_in3_label.dev_attr.attr,
>   	&sensor_dev_attr_curr3_input.dev_attr.attr,
>   	&sensor_dev_attr_shunt3_resistor.dev_attr.attr,
>   	&sensor_dev_attr_curr3_crit.dev_attr.attr,
> @@ -350,7 +386,43 @@ static struct attribute *ina3221_attrs[] = {
>   
>   	NULL,
>   };
> -ATTRIBUTE_GROUPS(ina3221);
> +
> +static const struct attribute *ina3221_label_attrs[] = {
> +	&sensor_dev_attr_in1_label.dev_attr.attr,
> +	&sensor_dev_attr_in2_label.dev_attr.attr,
> +	&sensor_dev_attr_in3_label.dev_attr.attr,
> +};
> +
> +static umode_t ina3221_attr_is_visible(struct kobject *kobj,
> +				       struct attribute *attr, int n)
> +{
> +	const int max_attrs = ARRAY_SIZE(ina3221_attrs) - 1;
> +	const int num_attrs = max_attrs / INA3221_NUM_CHANNELS;
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	enum ina3221_channels channel = n / num_attrs;

	int index = n % num_attrs;

> +	struct ina3221_input *input = &ina->inputs[channel];
> +	int i;
> +
> +	/* Hide if channel input source is disconnected */
> +	if (input->disconnected)
> +		return 0;
> +
> +	/* Hide label node if label is not provided */

	if (index == 1 && !input->label)
		return 0;

and drop i, ina3221_label_attrs[], and the loop below.

> +	for (i = 0; i < ARRAY_SIZE(ina3221_label_attrs); i++) {
> +		input = &ina->inputs[i];
> +		if (ina3221_label_attrs[i] == attr && !input->label)
> +			return 0;
> +	}
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group ina3221_group = {
> +	.is_visible = ina3221_attr_is_visible,
> +	.attrs = ina3221_attrs,
> +};
> +__ATTRIBUTE_GROUPS(ina3221);
>   
>   static const struct regmap_range ina3221_yes_ranges[] = {
>   	regmap_reg_range(INA3221_SHUNT1, INA3221_BUS3),
> @@ -370,6 +442,60 @@ static const struct regmap_config ina3221_regmap_config = {
>   	.volatile_table = &ina3221_volatile_table,
>   };
>   
> +static int ina3221_probe_child_from_dt(struct device *dev,
> +				       struct device_node *child,
> +				       struct ina3221_data *ina)
> +{
> +	struct ina3221_input *input;
> +	u32 val;
> +	int ret;
> +
> +	ret = of_property_read_u32(child, "input-id", &val);

One thing I am still not happy with. This property name is quite unusual
for a channel ID. Most common is to use "reg". I'll comment on this in
the other patch.

> +	if (ret) {
> +		dev_err(dev, "missing input-id property of %s\n", child->name);
> +		return ret;
> +	} else if (val < 1 || val > INA3221_NUM_CHANNELS) {
> +		dev_err(dev, "invalid input-id %d of %s\n", val, child->name);
> +		return ret;
> +	}
> +

I would suggest to start channel numbers with 0.

> +	input = &ina->inputs[val - 1];
> +
> +	/* Log the disconnected channel input */
> +	if (!of_device_is_available(child)) {
> +		input->disconnected = true;
> +		return 0;
> +	}
> +
> +	/* Save the connected input label if available */
> +	of_property_read_string(child, "input-label", &input->label);
> +
> +	/* Overwrite default shunt resistor value optionally */
> +	if (!of_property_read_u32(child, "shunt-resistor", &val))
> +		input->shunt_resistor = val;
> +
> +	return 0;
> +}
> +
> +static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
> +{
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int ret;
> +
> +	/* Compatible with non-DT platforms */
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node(np, child) {
> +		ret = ina3221_probe_child_from_dt(dev, child, ina);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int ina3221_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
> @@ -377,6 +503,7 @@ static int ina3221_probe(struct i2c_client *client,
>   	struct ina3221_data *ina;
>   	struct device *hwmon_dev;
>   	int i, ret;
> +	u16 mask;
>   
>   	ina = devm_kzalloc(dev, sizeof(*ina), GFP_KERNEL);
>   	if (!ina)
> @@ -399,7 +526,13 @@ static int ina3221_probe(struct i2c_client *client,
>   	}
>   
>   	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
> -		ina->shunt_resistors[i] = INA3221_RSHUNT_DEFAULT;
> +		ina->inputs[i].shunt_resistor = INA3221_RSHUNT_DEFAULT;
> +
> +	ret = ina3221_probe_from_dt(dev, ina);
> +	if (ret) {
> +		dev_err(dev, "Unable to probe from device treee\n");
> +		return ret;
> +	}
>   
>   	ret = regmap_field_write(ina->fields[F_RST], true);
>   	if (ret) {
> @@ -407,6 +540,15 @@ static int ina3221_probe(struct i2c_client *client,
>   		return ret;
>   	}
>   
> +	/* Disable channels if their inputs are disconnected */
> +	for (i = 0, mask = 0; i < INA3221_NUM_CHANNELS; i++) {
> +		if (ina->inputs[i].disconnected)
> +			mask |= INA3221_CONFIG_CHx_EN(i);
> +	}
> +	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG, mask, 0);
> +	if (ret)
> +		return ret;
> +
>   	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>   							   client->name,
>   							   ina, ina3221_groups);
> 
