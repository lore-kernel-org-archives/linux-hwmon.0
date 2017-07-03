Return-Path: <prvs=03571e9363=mike.looijmans@topicproducts.com>
Return-path: <prvs=03571e9363=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH v3 3/3] hwmon: ltc2990: support all measurement modes
To: Tom Levens <tom.levens@cern.ch>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
References: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
 <1499056140-6064-3-git-send-email-tom.levens@cern.ch>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <341b5c67-c013-5a7c-54b5-e8c2a7c168e7@topic.nl>
Date: Mon, 3 Jul 2017 08:29:56 +0200
MIME-Version: 1.0
In-Reply-To: <1499056140-6064-3-git-send-email-tom.levens@cern.ch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

=EF=BB=BFApplied, and tested on my board, so you have my

Tested-By: mike.looijmans@topic.nl

Probably the maintainers will like to see a patch header mail with a "v3"=20
summary for what you've changed ("git send-email --cover-letter" or somethi=
ng=20
similar to that)

On 03-07-17 06:29, Tom Levens wrote:
> Updated version of the ltc2990 driver which supports all measurement
> modes (current, voltage, temperature) available in the chip.
>=20
> If devicetree is used, the mode must be specified with the property
> "lltc,meas-mode". The format and possible values of the property are
> described in the binding.
>=20
> If devicetree is not used, the mode of the chip will not be configured.
> Unless the chip is configured by another source, only the internal
> temperature and supply voltage will be measured.
>=20
> Signed-off-by: Tom Levens <tom.levens@cern.ch>
> ---
>   Documentation/hwmon/ltc2990 |  24 ++++--
>   drivers/hwmon/Kconfig       |   7 +-
>   drivers/hwmon/ltc2990.c     | 196 +++++++++++++++++++++++++++++++++++++=
-------
>   3 files changed, 185 insertions(+), 42 deletions(-)
>=20
> diff --git a/Documentation/hwmon/ltc2990 b/Documentation/hwmon/ltc2990
> index c25211e..3ed68f6 100644
> --- a/Documentation/hwmon/ltc2990
> +++ b/Documentation/hwmon/ltc2990
> @@ -8,6 +8,7 @@ Supported chips:
>       Datasheet: http://www.linear.com/product/ltc2990
>  =20
>   Author: Mike Looijmans <mike.looijmans@topic.nl>
> +        Tom Levens <tom.levens@cern.ch>
>  =20
>  =20
>   Description
> @@ -16,10 +17,8 @@ Description
>   LTC2990 is a Quad I2C Voltage, Current and Temperature Monitor.
>   The chip's inputs can measure 4 voltages, or two inputs together (1+2 a=
nd 3+4)
>   can be combined to measure a differential voltage, which is typically u=
sed to
> -measure current through a series resistor, or a temperature.
> -
> -This driver currently uses the 2x differential mode only. In order to su=
pport
> -other modes, the driver will need to be expanded.
> +measure current through a series resistor, or a temperature with an exte=
rnal
> +diode.
>  =20
>  =20
>   Usage Notes
> @@ -32,12 +31,19 @@ devices explicitly.
>   Sysfs attributes
>   ----------------
>  =20
> +in0_input     Voltage at Vcc pin in millivolt (range 2.5V to 5V)
> +temp1_input   Internal chip temperature in millidegrees Celcius
> +
> +A subset of the following attributes are visible, depending on the measu=
rement
> +mode of the chip.
> +
> +in[1-4]_input Voltage at V[1-4] pin in millivolt
> +temp2_input   External temperature sensor TR1 in millidegrees Celcius
> +temp3_input   External temperature sensor TR2 in millidegrees Celcius
> +curr1_input   Current in mA across V1-V2 assuming a 1mOhm sense resistor
> +curr2_input   Current in mA across V3-V4 assuming a 1mOhm sense resistor
> +
>   The "curr*_input" measurements actually report the voltage drop across =
the
>   input pins in microvolts. This is equivalent to the current through a 1=
mOhm
>   sense resistor. Divide the reported value by the actual sense resistor =
value
>   in mOhm to get the actual value.
> -
> -in0_input     Voltage at Vcc pin in millivolt (range 2.5V to 5V)
> -temp1_input   Internal chip temperature in millidegrees Celcius
> -curr1_input   Current in mA across v1-v2 assuming a 1mOhm sense resistor=
.
> -curr2_input   Current in mA across v3-v4 assuming a 1mOhm sense resistor=
.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5ef2814..578e5a9 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -709,15 +709,12 @@ config SENSORS_LTC2945
>   	  be called ltc2945.
>  =20
>   config SENSORS_LTC2990
> -	tristate "Linear Technology LTC2990 (current monitoring mode only)"
> +	tristate "Linear Technology LTC2990"
>   	depends on I2C
>   	help
>   	  If you say yes here you get support for Linear Technology LTC2990
>   	  I2C System Monitor. The LTC2990 supports a combination of voltage,
> -	  current and temperature monitoring, but in addition to the Vcc supply
> -	  voltage and chip temperature, this driver currently only supports
> -	  reading two currents by measuring two differential voltages across
> -	  series resistors.
> +	  current and temperature monitoring.
>  =20
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc2990.
> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> index e320d21..32f3a8d 100644
> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -5,10 +5,6 @@
>    * Author: Mike Looijmans <mike.looijmans@topic.nl>
>    *
>    * License: GPLv2
> - *
> - * This driver assumes the chip is wired as a dual current monitor, and
> - * reports the voltage drop across two series resistors. It also reports
> - * the chip's internal temperature and Vcc power supply voltage.
>    */
>  =20
>   #include <linux/bitops.h>
> @@ -18,6 +14,7 @@
>   #include <linux/i2c.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>  =20
>   #define LTC2990_STATUS	0x00
>   #define LTC2990_CONTROL	0x01
> @@ -29,35 +26,109 @@
>   #define LTC2990_V4_MSB	0x0C
>   #define LTC2990_VCC_MSB	0x0E
>  =20
> -#define LTC2990_CONTROL_KELVIN		BIT(7)
> -#define LTC2990_CONTROL_SINGLE		BIT(6)
> -#define LTC2990_CONTROL_MEASURE_ALL	(0x3 << 3)
> -#define LTC2990_CONTROL_MODE_CURRENT	0x06
> -#define LTC2990_CONTROL_MODE_VOLTAGE	0x07
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
> +#define LTC2990_NONE	0
> +#define LTC2990_ALL	GENMASK(9, 0)
> +
> +#define LTC2990_MODE0_SHIFT	0
> +#define LTC2990_MODE0_MASK	GENMASK(2, 0)
> +#define LTC2990_MODE1_SHIFT	3
> +#define LTC2990_MODE1_MASK	GENMASK(1, 0)
> +
> +/* Enabled measurements for mode bits 2..0 */
> +static const int ltc2990_attrs_ena_0[] =3D {
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
> +/* Enabled measurements for mode bits 4..3 */
> +static const int ltc2990_attrs_ena_1[] =3D {
> +	LTC2990_NONE,
> +	LTC2990_TEMP2 | LTC2990_IN1 | LTC2990_CURR1,
> +	LTC2990_TEMP3 | LTC2990_IN3 | LTC2990_CURR2,
> +	LTC2990_ALL
> +};
> +
> +struct ltc2990_data {
> +	struct i2c_client *i2c;
> +	u32 mode[2];
> +};
>  =20
>   /* Return the converted value from the given register in uV or mC */
> -static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result=
)
> +static int ltc2990_get_value(struct i2c_client *i2c, int index, int *res=
ult)
>   {
>   	int val;
> +	u8 reg;
> +
> +	switch (index) {
> +	case LTC2990_IN0:
> +		reg =3D LTC2990_VCC_MSB;
> +		break;
> +	case LTC2990_IN1:
> +	case LTC2990_CURR1:
> +	case LTC2990_TEMP2:
> +		reg =3D LTC2990_V1_MSB;
> +		break;
> +	case LTC2990_IN2:
> +		reg =3D LTC2990_V2_MSB;
> +		break;
> +	case LTC2990_IN3:
> +	case LTC2990_CURR2:
> +	case LTC2990_TEMP3:
> +		reg =3D LTC2990_V3_MSB;
> +		break;
> +	case LTC2990_IN4:
> +		reg =3D LTC2990_V4_MSB;
> +		break;
> +	case LTC2990_TEMP1:
> +		reg =3D LTC2990_TINT_MSB;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>  =20
>   	val =3D i2c_smbus_read_word_swapped(i2c, reg);
>   	if (unlikely(val < 0))
>   		return val;
>  =20
> -	switch (reg) {
> -	case LTC2990_TINT_MSB:
> -		/* internal temp, 0.0625 degrees/LSB, 13-bit  */
> +	switch (index) {
> +	case LTC2990_TEMP1:
> +	case LTC2990_TEMP2:
> +	case LTC2990_TEMP3:
> +		/* temp, 0.0625 degrees/LSB */
>   		*result =3D sign_extend32(val, 12) * 1000 / 16;
>   		break;
> -	case LTC2990_V1_MSB:
> -	case LTC2990_V3_MSB:
> -		 /* Vx-Vy, 19.42uV/LSB. Depends on mode. */
> +	case LTC2990_CURR1:
> +	case LTC2990_CURR2:
> +		 /* Vx-Vy, 19.42uV/LSB */
>   		*result =3D sign_extend32(val, 14) * 1942 / 100;
>   		break;
> -	case LTC2990_VCC_MSB:
> -		/* Vcc, 305.18=CE=BCV/LSB, 2.5V offset */
> +	case LTC2990_IN0:
> +		/* Vcc, 305.18uV/LSB, 2.5V offset */
>   		*result =3D sign_extend32(val, 14) * 30518 / (100 * 1000) + 2500;
>   		break;
> +	case LTC2990_IN1:
> +	case LTC2990_IN2:
> +	case LTC2990_IN3:
> +	case LTC2990_IN4:
> +		/* Vx, 305.18uV/LSB */
> +		*result =3D sign_extend32(val, 14) * 30518 / (100 * 1000);
> +		break;
>   	default:
>   		return -EINVAL; /* won't happen, keep compiler happy */
>   	}
> @@ -69,48 +140,117 @@ static ssize_t ltc2990_show_value(struct device *de=
v,
>   				  struct device_attribute *da, char *buf)
>   {
>   	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +	struct ltc2990_data *data =3D dev_get_drvdata(dev);
>   	int value;
>   	int ret;
>  =20
> -	ret =3D ltc2990_get_value(dev_get_drvdata(dev), attr->index, &value);
> +	ret =3D ltc2990_get_value(data->i2c, attr->index, &value);
>   	if (unlikely(ret < 0))
>   		return ret;
>  =20
>   	return snprintf(buf, PAGE_SIZE, "%d\n", value);
>   }
>  =20
> +static umode_t ltc2990_attrs_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	struct device *dev =3D container_of(kobj, struct device, kobj);
> +	struct ltc2990_data *data =3D dev_get_drvdata(dev);
> +	struct device_attribute *da =3D
> +			container_of(a, struct device_attribute, attr);
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +
> +	int attrs_mask =3D LTC2990_IN0 | LTC2990_TEMP1 |
> +			 ltc2990_attrs_ena_0[data->mode[0]] &
> +			 ltc2990_attrs_ena_1[data->mode[1]];
> +
> +	if (attr->index & attrs_mask)
> +		return a->mode;
> +
> +	return 0;
> +}
> +
>   static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ltc2990_show_value, NUL=
L,
> -			  LTC2990_TINT_MSB);
> +			  LTC2990_TEMP1);
> +static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, ltc2990_show_value, NULL=
,
> +			  LTC2990_TEMP2);
> +static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, ltc2990_show_value, NULL=
,
> +			  LTC2990_TEMP3);
>   static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc2990_show_value, NUL=
L,
> -			  LTC2990_V1_MSB);
> +			  LTC2990_CURR1);
>   static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ltc2990_show_value, NUL=
L,
> -			  LTC2990_V3_MSB);
> +			  LTC2990_CURR2);
>   static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ltc2990_show_value, NULL,
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
>  =20
>   static struct attribute *ltc2990_attrs[] =3D {
>   	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp2_input.dev_attr.attr,
> +	&sensor_dev_attr_temp3_input.dev_attr.attr,
>   	&sensor_dev_attr_curr1_input.dev_attr.attr,
>   	&sensor_dev_attr_curr2_input.dev_attr.attr,
>   	&sensor_dev_attr_in0_input.dev_attr.attr,
> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_in2_input.dev_attr.attr,
> +	&sensor_dev_attr_in3_input.dev_attr.attr,
> +	&sensor_dev_attr_in4_input.dev_attr.attr,
>   	NULL,
>   };
> -ATTRIBUTE_GROUPS(ltc2990);
> +
> +static const struct attribute_group ltc2990_group =3D {
> +	.attrs =3D ltc2990_attrs,
> +	.is_visible =3D ltc2990_attrs_visible,
> +};
> +__ATTRIBUTE_GROUPS(ltc2990);
>  =20
>   static int ltc2990_i2c_probe(struct i2c_client *i2c,
>   			     const struct i2c_device_id *id)
>   {
>   	int ret;
>   	struct device *hwmon_dev;
> +	struct ltc2990_data *data;
> +	struct device_node *of_node =3D i2c->dev.of_node;
>  =20
>   	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>   				     I2C_FUNC_SMBUS_WORD_DATA))
>   		return -ENODEV;
>  =20
> -	/* Setup continuous mode, current monitor */
> +	data =3D devm_kzalloc(&i2c->dev, sizeof(struct ltc2990_data), GFP_KERNE=
L);
> +	if (unlikely(!data))
> +		return -ENOMEM;
> +
> +	data->i2c =3D i2c;
> +
> +	if (of_node) {
> +		ret =3D of_property_read_u32_array(of_node, "lltc,meas-mode",
> +						 data->mode, 2);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
> +		    data->mode[1] & ~LTC2990_MODE1_MASK)
> +			return -EINVAL;
> +	} else {
> +		ret =3D i2c_smbus_read_byte_data(i2c, LTC2990_CONTROL);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->mode[0] =3D ret >> LTC2990_MODE0_SHIFT & LTC2990_MODE0_MASK;
> +		data->mode[1] =3D ret >> LTC2990_MODE1_SHIFT & LTC2990_MODE1_MASK;
> +	}
> +
> +	/* Setup continuous mode */
>   	ret =3D i2c_smbus_write_byte_data(i2c, LTC2990_CONTROL,
> -					LTC2990_CONTROL_MEASURE_ALL |
> -					LTC2990_CONTROL_MODE_CURRENT);
> +					data->mode[0] << LTC2990_MODE0_SHIFT |
> +					data->mode[1] << LTC2990_MODE1_SHIFT);
>   	if (ret < 0) {
>   		dev_err(&i2c->dev, "Error: Failed to set control mode.\n");
>   		return ret;
> @@ -124,7 +264,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>  =20
>   	hwmon_dev =3D devm_hwmon_device_register_with_groups(&i2c->dev,
>   							   i2c->name,
> -							   i2c,
> +							   data,
>   							   ltc2990_groups);
>  =20
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>=20



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
