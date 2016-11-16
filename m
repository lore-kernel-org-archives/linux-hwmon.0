Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40313 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751520AbcKPOp3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Nov 2016 09:45:29 -0500
Subject: Re: [PATCH] hwmon: ltc2990: support all measurement modes
To: Tom Levens <tom.levens@cern.ch>, jdelvare@suse.com
References: <1479304407-3922-1-git-send-email-tom.levens@cern.ch>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2ad3a198-c197-cf7e-82e8-bbe97d3474bc@roeck-us.net>
Date: Wed, 16 Nov 2016 06:45:17 -0800
MIME-Version: 1.0
In-Reply-To: <1479304407-3922-1-git-send-email-tom.levens@cern.ch>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/16/2016 05:53 AM, Tom Levens wrote:
> Updated ltc2990 driver to support all possible measurement modes that
> the chip provides. Mode can be set through a device tree attribute or by
> writing to the "mode" sysfs attribute.
>
> Signed-off-by: Tom Levens <tom.levens@cern.ch>
> ---
>  .../devicetree/bindings/hwmon/ltc2990.txt          |   15 +
>  Documentation/hwmon/ltc2990                        |   25 ++-
>  drivers/hwmon/Kconfig                              |    7 +-
>  drivers/hwmon/ltc2990.c                            |  268 +++++++++++++++++---
>  4 files changed, 266 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2990.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/ltc2990.txt b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
> new file mode 100644
> index 0000000..0a17e8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
> @@ -0,0 +1,15 @@
> +ltc2990
> +
> +Required properties:
> +- compatible: must be "lltc,ltc2990"
> +- reg: I2C slave address
> +
> +Optional properties:
> +- mode: measurement mode (0-7), see Documentation/hwmon/ltc2990 for details
> +
This needs to be documented here.

> +Example:
> +ltc2990@4c {
> +	compatible = "lltc,ltc2990";
> +	mode = <7>;
> +	reg = <0x4c>;
> +};

Please submit as separate patch and copy devicetree maintainers for Ack.
You'll probably want to specify valid modes and their impact.

> diff --git a/Documentation/hwmon/ltc2990 b/Documentation/hwmon/ltc2990
> index c25211e..a97df88 100644
> --- a/Documentation/hwmon/ltc2990
> +++ b/Documentation/hwmon/ltc2990
> @@ -8,6 +8,7 @@ Supported chips:
>      Datasheet: http://www.linear.com/product/ltc2990
>
>  Author: Mike Looijmans <mike.looijmans@topic.nl>
> +        Tom Levens <tom.levens@cern.ch>
>
>
>  Description
> @@ -16,10 +17,8 @@ Description
>  LTC2990 is a Quad I2C Voltage, Current and Temperature Monitor.
>  The chip's inputs can measure 4 voltages, or two inputs together (1+2 and 3+4)
>  can be combined to measure a differential voltage, which is typically used to
> -measure current through a series resistor, or a temperature.
> -
> -This driver currently uses the 2x differential mode only. In order to support
> -other modes, the driver will need to be expanded.
> +measure current through a series resistor, or a temperature with an external
> +diode.
>
>
>  Usage Notes
> @@ -32,12 +31,20 @@ devices explicitly.
>  Sysfs attributes
>  ----------------
>
> +in0_input     Voltage at Vcc pin in millivolt (range 2.5V to 5V)
> +temp1_input   Internal chip temperature in millidegrees Celcius
> +mode          Set the measurement mode (range 0 to 7)
> +
The mode is determined by the hardware configuration. It does not make sense
to have it user configurable.

> +A subset of the following attributes are visible, depending on the programmed
> +measurement mode.
> +
> +in[1-4]_input Voltage at V[1-4] pin in millivolt
> +temp2_input   External temperature sensor TR1 in millidegrees Celcius
> +temp3_input   External temperature sensor TR2 in millidegrees Celcius
> +curr1_input   Current in mA across V1-V2 assuming a 1mOhm sense resistor
> +curr2_input   Current in mA across V3-V4 assuming a 1mOhm sense resistor
> +
>  The "curr*_input" measurements actually report the voltage drop across the
>  input pins in microvolts. This is equivalent to the current through a 1mOhm
>  sense resistor. Divide the reported value by the actual sense resistor value
>  in mOhm to get the actual value.
> -
> -in0_input     Voltage at Vcc pin in millivolt (range 2.5V to 5V)
> -temp1_input   Internal chip temperature in millidegrees Celcius
> -curr1_input   Current in mA across v1-v2 assuming a 1mOhm sense resistor.
> -curr2_input   Current in mA across v3-v4 assuming a 1mOhm sense resistor.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 45cef3d..f7096ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -699,15 +699,12 @@ config SENSORS_LTC2945
>  	  be called ltc2945.
>
>  config SENSORS_LTC2990
> -	tristate "Linear Technology LTC2990 (current monitoring mode only)"
> +	tristate "Linear Technology LTC2990"
>  	depends on I2C
>  	help
>  	  If you say yes here you get support for Linear Technology LTC2990
>  	  I2C System Monitor. The LTC2990 supports a combination of voltage,
> -	  current and temperature monitoring, but in addition to the Vcc supply
> -	  voltage and chip temperature, this driver currently only supports
> -	  reading two currents by measuring two differential voltages across
> -	  series resistors.
> +	  current and temperature monitoring.
>
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ltc2990.
> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> index 8f8fe05..b6f910d 100644
> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -4,11 +4,10 @@
>   * Copyright (C) 2014 Topic Embedded Products
>   * Author: Mike Looijmans <mike.looijmans@topic.nl>
>   *
> - * License: GPLv2
> + * Copyright (C) 2016 European Organization for Nuclear Research (CERN)
> + * Author: Tom Levens <tom.levens@cern.ch>
>   *
Please specify your changes. Something like "Support for all chip modes by ..."
would be more appropriate.

> - * This driver assumes the chip is wired as a dual current monitor, and
> - * reports the voltage drop across two series resistors. It also reports
> - * the chip's internal temperature and Vcc power supply voltage.
> + * License: GPLv2
>   */
>
>  #include <linux/err.h>
> @@ -17,6 +16,7 @@
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>
>  #define LTC2990_STATUS	0x00
>  #define LTC2990_CONTROL	0x01
> @@ -31,8 +31,36 @@
>  #define LTC2990_CONTROL_KELVIN		BIT(7)
>  #define LTC2990_CONTROL_SINGLE		BIT(6)
>  #define LTC2990_CONTROL_MEASURE_ALL	(0x3 << 3)
> -#define LTC2990_CONTROL_MODE_CURRENT	0x06
> -#define LTC2990_CONTROL_MODE_VOLTAGE	0x07
> +#define LTC2990_CONTROL_MODE_DEFAULT	0x06
> +#define LTC2990_CONTROL_MODE_MAX	0x07
> +
> +#define LTC2990_IN0	BIT(0)
> +#define LTC2990_IN1	BIT(1)
> +#define LTC2990_IN2	BIT(2)
> +#define LTC2990_IN3	BIT(3)
> +#define LTC2990_IN4	BIT(4)
> +#define LTC2990_CURR1	BIT(5)
> +#define LTC2990_CURR2	BIT(6)
> +#define LTC2990_TEMP1	BIT(7)
> +#define LTC2990_TEMP2	BIT(8)
> +#define LTC2990_TEMP3	BIT(9)
> +
> +static const int ltc2990_attrs_ena[] = {
> +	LTC2990_IN1 | LTC2990_IN2 | LTC2990_TEMP3,
> +	LTC2990_CURR1 | LTC2990_TEMP3,
> +	LTC2990_CURR1 | LTC2990_IN3 | LTC2990_IN4,
> +	LTC2990_TEMP2 | LTC2990_IN3 | LTC2990_IN4,
> +	LTC2990_TEMP2 | LTC2990_CURR2,
> +	LTC2990_TEMP2 | LTC2990_TEMP3,
> +	LTC2990_CURR1 | LTC2990_CURR2,
> +	LTC2990_IN1 | LTC2990_IN2 | LTC2990_IN3 | LTC2990_IN4
> +};
> +
> +struct ltc2990_data {
> +	struct i2c_client *i2c;
> +	struct mutex update_lock;
> +	u32 mode;
> +};
>
>  /* convert raw register value to sign-extended integer in 16-bit range */
>  static int ltc2990_voltage_to_int(int raw)
> @@ -44,30 +72,68 @@ static int ltc2990_voltage_to_int(int raw)
>  }
>
>  /* Return the converted value from the given register in uV or mC */
> -static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
> +static int ltc2990_get_value(struct i2c_client *i2c, int index, int *result)
>  {
>  	int val;
> +	u8 reg;
> +
> +	switch (index) {
> +	case LTC2990_IN0:
> +		reg = LTC2990_VCC_MSB;
> +		break;
> +	case LTC2990_IN1:
> +	case LTC2990_CURR1:
> +	case LTC2990_TEMP2:
> +		reg = LTC2990_V1_MSB;
> +		break;
> +	case LTC2990_IN2:
> +		reg = LTC2990_V2_MSB;
> +		break;
> +	case LTC2990_IN3:
> +	case LTC2990_CURR2:
> +	case LTC2990_TEMP3:
> +		reg = LTC2990_V3_MSB;
> +		break;
> +	case LTC2990_IN4:
> +		reg = LTC2990_V4_MSB;
> +		break;
> +	case LTC2990_TEMP1:
> +		reg = LTC2990_TINT_MSB;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>
>  	val = i2c_smbus_read_word_swapped(i2c, reg);
>  	if (unlikely(val < 0))
>  		return val;
>
> -	switch (reg) {
> -	case LTC2990_TINT_MSB:
> -		/* internal temp, 0.0625 degrees/LSB, 13-bit  */
> +	switch (index) {
> +	case LTC2990_TEMP1:
> +	case LTC2990_TEMP2:
> +	case LTC2990_TEMP3:
> +		/* temp, 0.0625 degrees/LSB, 13-bit  */
>  		val = (val & 0x1FFF) << 3;
>  		*result = (val * 1000) >> 7;

Turns out this is actually wrong. Bit 12 is a sign bit per datasheet.
Separate problem, though, and should be fixed with a separate patch.
The first line should probably use sign_extend().

>  		break;
> -	case LTC2990_V1_MSB:
> -	case LTC2990_V3_MSB:
> -		 /* Vx-Vy, 19.42uV/LSB. Depends on mode. */
> +	case LTC2990_CURR1:
> +	case LTC2990_CURR2:
> +		 /* Vx-Vy, 19.42uV/LSB */
>  		*result = ltc2990_voltage_to_int(val) * 1942 / (4 * 100);

Hmmm .. voltage_to_int() always adds two bits which are then just taken off
subsequently. Another unrelated change - ltc2990_voltage_to_int() should
just use sign_extend() and not bother shifting the result to the left.
Or maybe just use sign_extend() and drop ltc2990_voltage_to_int() entirely.

Another separate patch, though.

>  		break;
> -	case LTC2990_VCC_MSB:
> -		/* Vcc, 305.18μV/LSB, 2.5V offset */
> +	case LTC2990_IN0:
> +		/* Vcc, 305.18uV/LSB, 2.5V offset */
>  		*result = (ltc2990_voltage_to_int(val) * 30518 /
>  			   (4 * 100 * 1000)) + 2500;
>  		break;
> +	case LTC2990_IN1:
> +	case LTC2990_IN2:
> +	case LTC2990_IN3:
> +	case LTC2990_IN4:
> +		/* Vx: 305.18uV/LSB */
> +		*result = (ltc2990_voltage_to_int(val) * 30518 /
> +			   (4 * 100 * 1000));
> +		break;
>  	default:
>  		return -EINVAL; /* won't happen, keep compiler happy */
>  	}
> @@ -75,66 +141,198 @@ static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
>  	return 0;
>  }
>
> +
No double empty lines please.

> +static int ltc2990_write_control_trigger(struct ltc2990_data *data)
> +{

more like ltc2990_init_chip().

> +	int ret;
> +
> +	/* Setup continuous mode */
> +	ret = i2c_smbus_write_byte_data(data->i2c, LTC2990_CONTROL,
> +					LTC2990_CONTROL_MEASURE_ALL |
> +					data->mode);
> +	if (unlikely(ret < 0)) {
> +		dev_err(&data->i2c->dev,
> +			"Error: Failed to set control mode.\n");
> +		return ret;
> +	}
> +	/* Trigger once to start continuous conversion */
> +	ret = i2c_smbus_write_byte_data(data->i2c, LTC2990_TRIGGER, 0x01);
> +	if (unlikely(ret < 0)) {
> +		dev_err(&data->i2c->dev,
> +		"Error: Failed to start acquisition.\n");

This looks like a bad multi-line alignment. Please align continuation lines with '('.

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static ssize_t ltc2990_show_value(struct device *dev,
>  				  struct device_attribute *da, char *buf)
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct ltc2990_data *data = dev_get_drvdata(dev);
>  	int value;
>  	int ret;
>
> -	ret = ltc2990_get_value(dev_get_drvdata(dev), attr->index, &value);
> +	ret = ltc2990_get_value(data->i2c, attr->index, &value);
>  	if (unlikely(ret < 0))
>  		return ret;
>
>  	return snprintf(buf, PAGE_SIZE, "%d\n", value);
>  }
>
> +static ssize_t ltc2990_get_mode(struct device *dev,
> +				struct device_attribute *da, char *buf)
> +{
> +	struct ltc2990_data *data = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", data->mode);
> +}
> +
> +static const struct attribute_group ltc2990_group;
> +
> +static ssize_t ltc2990_set_mode(struct device *dev,
> +				struct device_attribute *da,
> +				const char *buf, size_t count)
> +{
> +	struct ltc2990_data *data = dev_get_drvdata(dev);
> +	int ret;
> +	unsigned long mode;
> +
> +	ret = kstrtoul(buf, 10, &mode);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	if (mode > LTC2990_CONTROL_MODE_MAX)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	data->mode = mode;
> +
> +	ret = ltc2990_write_control_trigger(data);
> +	if (unlikely(ret < 0))
> +		goto abort;
> +
> +	ret = sysfs_update_group(&dev->kobj, &ltc2990_group);
> +	if (unlikely(ret < 0))
> +		goto abort;
> +
> +	ret = count;
> +
> +abort:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}

As mentioned above, mode is a hardware configuration and should not be
changeable (or accessible, for that matter) using a sysfs attribute.

> +
> +static umode_t ltc2990_attrs_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct ltc2990_data *data = dev_get_drvdata(dev);
> +	struct device_attribute *da =
> +			container_of(a, struct device_attribute, attr);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +
> +	if (ltc2990_attrs_ena[data->mode] & attr->index)
> +		return a->mode;
> +	else
> +		return 0;
> +}
> +
>  static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ltc2990_show_value, NULL,
> -			  LTC2990_TINT_MSB);
> +			  LTC2990_TEMP1);
> +static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, ltc2990_show_value, NULL,
> +			  LTC2990_TEMP2);
> +static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, ltc2990_show_value, NULL,
> +			  LTC2990_TEMP3);
>  static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc2990_show_value, NULL,
> -			  LTC2990_V1_MSB);
> +			  LTC2990_CURR1);
>  static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ltc2990_show_value, NULL,
> -			  LTC2990_V3_MSB);
> +			  LTC2990_CURR2);
>  static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ltc2990_show_value, NULL,
> -			  LTC2990_VCC_MSB);
> +			  LTC2990_IN0);
> +static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc2990_show_value, NULL,
> +			  LTC2990_IN1);
> +static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc2990_show_value, NULL,
> +			  LTC2990_IN2);
> +static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ltc2990_show_value, NULL,
> +			  LTC2990_IN3);
> +static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ltc2990_show_value, NULL,
> +			  LTC2990_IN4);
> +static SENSOR_DEVICE_ATTR(mode, S_IRUGO | S_IWUSR, ltc2990_get_mode,
> +			  ltc2990_set_mode, 0);
>
>  static struct attribute *ltc2990_attrs[] = {
> -	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp2_input.dev_attr.attr,
> +	&sensor_dev_attr_temp3_input.dev_attr.attr,
>  	&sensor_dev_attr_curr1_input.dev_attr.attr,
>  	&sensor_dev_attr_curr2_input.dev_attr.attr,
> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_in2_input.dev_attr.attr,
> +	&sensor_dev_attr_in3_input.dev_attr.attr,
> +	&sensor_dev_attr_in4_input.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ltc2990_group = {
> +	.attrs = ltc2990_attrs,
> +	.is_visible = ltc2990_attrs_visible,
> +};
> +
> +static struct attribute *ltc2990_static_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
>  	&sensor_dev_attr_in0_input.dev_attr.attr,
> +	&sensor_dev_attr_mode.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ltc2990_static_group = {
> +	.attrs = ltc2990_static_attrs
> +};
> +
> +static const struct attribute_group *ltc2990_groups[] = {
> +	&ltc2990_group,
> +	&ltc2990_static_group,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(ltc2990);
>
>  static int ltc2990_i2c_probe(struct i2c_client *i2c,
>  			     const struct i2c_device_id *id)
>  {
>  	int ret;
>  	struct device *hwmon_dev;
> +	struct ltc2990_data *data;
> +	struct device_node *of_node = i2c->dev.of_node;
>
>  	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>  				     I2C_FUNC_SMBUS_WORD_DATA))
>  		return -ENODEV;
>
> -	/* Setup continuous mode, current monitor */
> -	ret = i2c_smbus_write_byte_data(i2c, LTC2990_CONTROL,
> -					LTC2990_CONTROL_MEASURE_ALL |
> -					LTC2990_CONTROL_MODE_CURRENT);
> -	if (ret < 0) {
> -		dev_err(&i2c->dev, "Error: Failed to set control mode.\n");
> -		return ret;
> +	data = devm_kzalloc(&i2c->dev, sizeof(struct ltc2990_data), GFP_KERNEL);
> +	if (unlikely(!data))
> +		return -ENOMEM;
> +	data->i2c = i2c;
> +
> +	if (!of_node || of_property_read_u32(of_node, "mode", &data->mode))
> +		data->mode = LTC2990_CONTROL_MODE_DEFAULT;
> +
> +	if (data->mode > LTC2990_CONTROL_MODE_MAX) {
> +		dev_warn(&data->i2c->dev,
> +			"Warning: Mode %d out of range, defaulting to %d.\n",
> +			data->mode, LTC2990_CONTROL_MODE_DEFAULT);
> +		data->mode = LTC2990_CONTROL_MODE_DEFAULT;

This should fail loading the driver with -EINVAL.

>  	}
> -	/* Trigger once to start continuous conversion */
> -	ret = i2c_smbus_write_byte_data(i2c, LTC2990_TRIGGER, 1);
> -	if (ret < 0) {
> -		dev_err(&i2c->dev, "Error: Failed to start acquisition.\n");
> +
> +	ret = ltc2990_write_control_trigger(data);
> +	if (unlikely(ret < 0))
>  		return ret;
> -	}
> +
> +	mutex_init(&data->update_lock);
>
>  	hwmon_dev = devm_hwmon_device_register_with_groups(&i2c->dev,
>  							   i2c->name,
> -							   i2c,
> +							   data,
>  							   ltc2990_groups);
>
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>

