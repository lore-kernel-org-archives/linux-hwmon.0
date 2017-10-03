Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
Subject: RE: [v2,1/2] hwmon: Driver for Maxim MAX6621 temperature sensor
Date: Tue, 3 Oct 2017 15:23:23 +0000
Message-ID: <AM4PR05MB33303E587EAB78B6C9B67854A2720@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1505126725-4336-2-git-send-email-vadimp@mellanox.com>
 <20171003145836.GA25868@roeck-us.net>
In-Reply-To: <20171003145836.GA25868@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>



> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> Roeck
> Sent: Tuesday, October 03, 2017 5:59 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: robh+dt@kernel.org; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [v2,1/2] hwmon: Driver for Maxim MAX6621 temperature sensor
>=20
> On Mon, Sep 11, 2017 at 10:45:24AM +0000, Vadim Pasternak wrote:
> > MAX6621 is a PECI-to-I2C translator provides an efficient, low-cost
> > solution for PECI-to-SMBus/I2C protocol conversion. It allows reading
> > the temperature from the PECI-compliant host directly from up to four
> > PECI-enabled CPUs.
> >

Hi Guenter,

Very sorry, it should be v4. I'll resend v4.

I also got ack from Rob for dts file, but This with suggestion to put it in=
=20
trivial-devices.txt instead.
I will resend v4 updated with Rob's comment.
Really sorry for this confusion.

Thanks,
Vadim.

>=20
>=20
> I am confused by this patch. It was sent after v3, effectively undoing th=
at
> version. Please explain.
>=20
> Guenter
>=20
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> > v1->v2
> >  Comments pointed out by Guenter:
> >  - arrange includes in alphabetic order;
> >  - add include for bitops.h;
> >  - remove MAX6621_REG_NON_WRITEABLE_REG;
> >  - drop temp_min, temp_max, temp_reset_history attributes;
> >  - remove redundant braces in max6621_verify_reg_data;
> >  - fix return code in max6621_verify_reg_data;
> >  - not report channels which are not physically connected;
> >  - use u32 for regval in max6621_read and max6621_write;
> >  - provide in temprature offset in milli-degrees C;
> >  - drop hwmon_temp_fault attribute;
> >  - drop activation point setting in CONFIG2 reg, leave it for user
> > space;  Comments pointed out by Jiri:
> >  - fixe device name;
> >  Fixes added by Vadim:
> >  - modify names in max6621_temp_labels;
> >  - add hwmon_temp_alarm attribute and hwmon_temp_crit attributes per
> >    socket;
> >  - fix defines for MIN and MAX temperature;
> > ---
> >  drivers/hwmon/Kconfig   |  14 ++
> >  drivers/hwmon/Makefile  |   1 +
> >  drivers/hwmon/max6621.c | 484
> > ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 499 insertions(+)
> >  create mode 100644 drivers/hwmon/max6621.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
> > 5b9a61f..325d161 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -855,6 +855,20 @@ tristate "MAX31722 temperature sensor"
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called max31722.
> >
> > +config SENSORS_MAX6621
> > +	tristate "Maxim MAX6621 sensor chip"
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	help
> > +	  If you say yes here you get support for MAX6621 sensor chip.
> > +	  MAX6621 is a PECI-to-I2C translator provides an efficient,
> > +	  low-cost solution for PECI-to-SMBus/I2C protocol conversion.
> > +	  It allows reading the temperature from the PECI-compliant
> > +	  host directly from up to four PECI-enabled CPUs.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called max6621.
> > +
> >  config SENSORS_MAX6639
> >  	tristate "Maxim MAX6639 sensor chip"
> >  	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
> > d4641a9..43333cb 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -116,6 +116,7 @@ obj-$(CONFIG_SENSORS_MAX1619)	+=3D max1619.o
> >  obj-$(CONFIG_SENSORS_MAX1668)	+=3D max1668.o
> >  obj-$(CONFIG_SENSORS_MAX197)	+=3D max197.o
> >  obj-$(CONFIG_SENSORS_MAX31722)	+=3D max31722.o
> > +obj-$(CONFIG_SENSORS_MAX6621)	+=3D max6621.o
> >  obj-$(CONFIG_SENSORS_MAX6639)	+=3D max6639.o
> >  obj-$(CONFIG_SENSORS_MAX6642)	+=3D max6642.o
> >  obj-$(CONFIG_SENSORS_MAX6650)	+=3D max6650.o
> > diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c new
> > file mode 100644 index 0000000..2ad7fad
> > --- /dev/null
> > +++ b/drivers/hwmon/max6621.c
> > @@ -0,0 +1,484 @@
> > +/*
> > + * Hardware monitoring driver for Maxim MAX6621
> > + *
> > + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License as published
> > +by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/of_device.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MAX6621_DRV_NAME		"max6621"
> > +#define MAX6621_TEMP_INPUT_REG_NUM	9
> > +#define MAX6621_TEMP_INPUT_MIN		-20000
> > +#define MAX6621_TEMP_INPUT_MAX		120000
> > +
> > +#define MAX6621_TEMP_S0D0_REG		0x00
> > +#define MAX6621_TEMP_S0D1_REG		0x01
> > +#define MAX6621_TEMP_S1D0_REG		0x02
> > +#define MAX6621_TEMP_S1D1_REG		0x03
> > +#define MAX6621_TEMP_S2D0_REG		0x04
> > +#define MAX6621_TEMP_S2D1_REG		0x05
> > +#define MAX6621_TEMP_S3D0_REG		0x06
> > +#define MAX6621_TEMP_S3D1_REG		0x07
> > +#define MAX6621_TEMP_MAX_REG		0x08
> > +#define MAX6621_TEMP_ALERT_CAUSE	0x0b
> > +#define MAX6621_TEMP_MAX_ADDR_REG	0x0a
> > +#define MAX6621_CONFIG0_REG		0x0c
> > +#define MAX6621_CONFIG1_REG		0x0d
> > +#define MAX6621_CONFIG2_REG		0x0e
> > +#define MAX6621_CONFIG3_REG		0x0f
> > +#define MAX6621_TEMP_S0_ALERT_REG	0x10
> > +#define MAX6621_TEMP_S1_ALERT_REG	0x11
> > +#define MAX6621_TEMP_S2_ALERT_REG	0x12
> > +#define MAX6621_TEMP_S3_ALERT_REG	0x13
> > +#define MAX6621_CLEAR_ALERT_REG		0x15
> > +#define MAX6621_REG_MAX
> 	(MAX6621_CLEAR_ALERT_REG + 1)
> > +#define MAX6621_REG_TEMP_SHIFT		0x06
> > +
> > +#define MAX6621_ENABLE_TEMP_ALERTS_BIT	4
> > +#define MAX6621_ENABLE_I2C_CRC_BIT	5
> > +#define MAX6621_ENABLE_ALTERNATE_DATA	6
> > +#define MAX6621_ENABLE_LOCKUP_TO	7
> > +#define MAX6621_ENABLE_S0D0_BIT		8
> > +#define MAX6621_ENABLE_S0D1_BIT		9
> > +#define MAX6621_ENABLE_S1D0_BIT		10
> > +#define MAX6621_ENABLE_S1D1_BIT		11
> > +#define MAX6621_ENABLE_S2D0_BIT		12
> > +#define MAX6621_ENABLE_S2D1_BIT		13
> > +#define MAX6621_ENABLE_S3D0_BIT		14
> > +#define MAX6621_ENABLE_S3D1_BIT		15
> > +#define MAX6621_ENABLE_TEMP_ALL
> 	GENMASK(MAX6621_ENABLE_S3D1_BIT, \
> > +						MAX6621_ENABLE_S0D0_BIT)
> > +#define MAX6621_POLL_DELAY_MASK		0x5
> > +#define MAX6621_CONFIG0_INIT
> 	(MAX6621_ENABLE_TEMP_ALL | \
> > +					 BIT(MAX6621_ENABLE_LOCKUP_TO)
> | \
> > +					 BIT(MAX6621_ENABLE_I2C_CRC_BIT)
> | \
> > +					 MAX6621_POLL_DELAY_MASK)
> > +
> > +/* Error codes */
> > +#define MAX6621_TRAN_FAILED	0x8100	/*
> > +					 * PECI transaction failed for more
> > +					 * than the configured number of
> > +					 * consecutive retries.
> > +					 */
> > +#define MAX6621_POOL_DIS	0x8101	/*
> > +					 * Polling disabled for requested
> > +					 * socket/domain.
> > +					 */
> > +#define MAX6621_POOL_UNCOMPLETE	0x8102	/*
> > +					 * First poll not yet completed for
> > +					 * requested socket/domain (on
> > +					 * startup).
> > +					 */
> > +#define MAX6621_SD_DIS		0x8103	/*
> > +					 * Read maximum temperature
> requested,
> > +					 * but no sockets/domains enabled
> or
> > +					 * all enabled sockets/domains have
> > +					 * errors; or read maximum
> temperature
> > +					 * address requested, but read
> maximum
> > +					 * temperature was not called.
> > +					 */
> > +#define MAX6621_ALERT_DIS	0x8104	/*
> > +					 * Get alert socket/domain
> requested,
> > +					 * but no alert active.
> > +					 */
> > +#define MAX6621_PECI_ERR_MIN	0x8000	/* Intel spec PECI error min
> value. */
> > +#define MAX6621_PECI_ERR_MAX	0x80ff	/* Intel spec PECI error max
> value. */
> > +
> > +static const u32 max6621_temp_regs[] =3D {
> > +	MAX6621_TEMP_MAX_REG, MAX6621_TEMP_S0D0_REG,
> MAX6621_TEMP_S1D0_REG,
> > +	MAX6621_TEMP_S2D0_REG, MAX6621_TEMP_S3D0_REG,
> MAX6621_TEMP_S0D1_REG,
> > +	MAX6621_TEMP_S1D1_REG, MAX6621_TEMP_S2D1_REG,
> MAX6621_TEMP_S3D1_REG,
> > +};
> > +
> > +static const char *const max6621_temp_labels[] =3D {
> > +	"maximum",
> > +	"socket0_0",
> > +	"socket1_0",
> > +	"socket2_0",
> > +	"socket3_0",
> > +	"socket0_1",
> > +	"socket1_1",
> > +	"socket2_1",
> > +	"socket3_1",
> > +};
> > +
> > +static const int max6621_temp_alert_chan2reg[] =3D {
> > +	MAX6621_CLEAR_ALERT_REG,
> > +	MAX6621_TEMP_S0_ALERT_REG,
> > +	MAX6621_TEMP_S1_ALERT_REG,
> > +	MAX6621_TEMP_S2_ALERT_REG,
> > +	MAX6621_TEMP_S3_ALERT_REG,
> > +};
> > +
> > +/**
> > + * struct max6621_data - private data:
> > + *
> > + * @client: I2C client;
> > + * @regmap: register map handle;
> > + * @temp_offset: offset that is added to all temperature return;
> > + * @input_chan2reg: mapping from channel to register;  */ struct
> > +max6621_data {
> > +	struct i2c_client	*client;
> > +	struct regmap		*regmap;
> > +	u16			temp_offset;
> > +	int
> 	input_chan2reg[MAX6621_TEMP_INPUT_REG_NUM + 1];
> > +};
> > +
> > +static long max6621_temp_mc2reg(long val) {
> > +	return (val / 1000L) << MAX6621_REG_TEMP_SHIFT; }
> > +
> > +static umode_t
> > +max6621_is_visible(const void *data, enum hwmon_sensor_types type,
> u32 attr,
> > +		   int channel)
> > +{
> > +	/* Skip channels which are not physically conncted. */
> > +	if (((struct max6621_data *)data)->input_chan2reg[channel] < 0)
> > +		return 0;
> > +
> > +	switch (type) {
> > +	case hwmon_temp:
> > +		switch (attr) {
> > +		case hwmon_temp_input:
> > +			return 0444;
> > +		case hwmon_temp_label:
> > +		case hwmon_temp_offset:
> > +		case hwmon_temp_crit:
> > +		case hwmon_temp_alarm:
> > +			return 0644;
> > +		default:
> > +			break;
> > +		}
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int max6621_verify_reg_data(struct device *dev, int regval) {
> > +	if (regval >=3D MAX6621_PECI_ERR_MIN && regval <=3D
> > +	    MAX6621_PECI_ERR_MAX) {
> > +		dev_dbg(dev, "PECI error code - err 0x%04x.\n",
> > +			regval);
> > +
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (regval) {
> > +	case MAX6621_TRAN_FAILED:
> > +		dev_dbg(dev, "PECI transaction failed - err 0x%04x.\n",
> > +			regval);
> > +		break;
> > +	case MAX6621_POOL_DIS:
> > +		dev_dbg(dev, "Polling disabled - err 0x%04x.\n", regval);
> > +		break;
> > +	case MAX6621_POOL_UNCOMPLETE:
> > +		dev_dbg(dev, "First poll not completed on startup - err
> 0x%04x.\n",
> > +			regval);
> > +		break;
> > +	case MAX6621_SD_DIS:
> > +		dev_dbg(dev, "Resource is disabled - err 0x%04x.\n", regval);
> > +		break;
> > +	case MAX6621_ALERT_DIS:
> > +		dev_dbg(dev, "No alert active - err 0x%04x.\n", regval);
> > +		break;
> > +	default:
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int
> > +max6621_read(struct device *dev, enum hwmon_sensor_types type, u32
> attr,
> > +	     int channel, long *val)
> > +{
> > +	struct max6621_data *data =3D dev_get_drvdata(dev);
> > +	u32 regval;
> > +	int reg;
> > +	s8 temp;
> > +	int ret;
> > +
> > +	switch (type) {
> > +	case hwmon_temp:
> > +		switch (attr) {
> > +		case hwmon_temp_input:
> > +			reg =3D data->input_chan2reg[channel];
> > +			ret =3D regmap_read(data->regmap, reg, &regval);
> > +			if (ret)
> > +				return ret;
> > +
> > +			ret =3D max6621_verify_reg_data(dev, regval);
> > +			if (ret)
> > +				return ret;
> > +
> > +			temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> > +			*val =3D temp * 1000L;
> > +
> > +			break;
> > +		case hwmon_temp_offset:
> > +			*val =3D (data->temp_offset >>
> MAX6621_REG_TEMP_SHIFT) *
> > +			       1000L;
> > +
> > +			break;
> > +		case hwmon_temp_crit:
> > +			reg =3D max6621_temp_alert_chan2reg[channel];
> > +			ret =3D regmap_read(data->regmap, reg, &regval);
> > +			if (ret)
> > +				return ret;
> > +
> > +			ret =3D max6621_verify_reg_data(dev, regval);
> > +			if (ret)
> > +				return ret;
> > +
> > +			*val =3D regval * 1000L;
> > +
> > +			break;
> > +		case hwmon_temp_alarm:
> > +			ret =3D regmap_read(data->regmap,
> > +					  MAX6621_TEMP_ALERT_CAUSE,
> > +					  &regval);
> > +			if (ret)
> > +				return ret;
> > +
> > +			ret =3D max6621_verify_reg_data(dev, regval);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			*val =3D !!regval;
> > +
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +max6621_write(struct device *dev, enum hwmon_sensor_types type, u32
> attr,
> > +	      int channel, long val)
> > +{
> > +	struct max6621_data *data =3D dev_get_drvdata(dev);
> > +	u32 reg;
> > +
> > +	switch (type) {
> > +	case hwmon_temp:
> > +		switch (attr) {
> > +		case hwmon_temp_offset:
> > +			/* Clamp to allowed range to prevent overflow. */
> > +			val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
> > +					MAX6621_TEMP_INPUT_MAX);
> > +			val =3D max6621_temp_mc2reg(val);
> > +			if (data->temp_offset !=3D val) {
> > +				data->temp_offset =3D val;
> > +				return regmap_write(data->regmap,
> > +						    MAX6621_CONFIG2_REG,
> val);
> > +			}
> > +
> > +			return 0;
> > +		case hwmon_temp_crit:
> > +			reg =3D max6621_temp_alert_chan2reg[channel];
> > +			/* Clamp to allowed range to prevent overflow. */
> > +			val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
> > +					MAX6621_TEMP_INPUT_MAX);
> > +			val =3D val / 1000L;
> > +
> > +			return regmap_write(data->regmap, reg, val);
> > +		case hwmon_temp_alarm:
> > +			/*
> > +			 * Use i2c_smbus_write_byte, since
> > +			 * MAX6621_CLEAR_ALERT_REG access expects send-
> byte
> > +			 * smbus protocol for clearing alert.
> > +			 */
> > +			return i2c_smbus_write_byte(data->client,
> > +
> MAX6621_CLEAR_ALERT_REG);
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static int
> > +max6621_read_string(struct device *dev, enum hwmon_sensor_types
> type, u32 attr,
> > +		    int channel, const char **str)
> > +{
> > +	switch (type) {
> > +	case hwmon_temp:
> > +		switch (attr) {
> > +		case hwmon_temp_label:
> > +			*str =3D max6621_temp_labels[channel];
> > +			return 0;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static const struct regmap_config max6621_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 16,
> > +	.max_register =3D MAX6621_REG_MAX,
> > +	.val_format_endian =3D REGMAP_ENDIAN_LITTLE, };
> > +
> > +static u32 max6621_chip_config[] =3D {
> > +	HWMON_C_REGISTER_TZ,
> > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info max6621_chip =3D {
> > +	.type =3D hwmon_chip,
> > +	.config =3D max6621_chip_config,
> > +};
> > +
> > +static const u32 max6621_temp_config[] =3D {
> > +	HWMON_T_INPUT | HWMON_T_ALARM | HWMON_T_LABEL |
> HWMON_T_OFFSET,
> > +	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
> > +	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
> > +	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
> > +	HWMON_T_INPUT | HWMON_T_CRIT,
> > +	HWMON_T_INPUT | HWMON_T_LABEL,
> > +	HWMON_T_INPUT | HWMON_T_LABEL,
> > +	HWMON_T_INPUT | HWMON_T_LABEL,
> > +	HWMON_T_INPUT | HWMON_T_LABEL,
> > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info max6621_temp =3D {
> > +	.type =3D hwmon_temp,
> > +	.config =3D max6621_temp_config,
> > +};
> > +
> > +static const struct hwmon_channel_info *max6621_info[] =3D {
> > +	&max6621_chip,
> > +	&max6621_temp,
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_ops max6621_hwmon_ops =3D {
> > +	.read =3D max6621_read,
> > +	.write =3D max6621_write,
> > +	.read_string =3D max6621_read_string,
> > +	.is_visible =3D max6621_is_visible,
> > +};
> > +
> > +static const struct hwmon_chip_info max6621_chip_info =3D {
> > +	.ops =3D &max6621_hwmon_ops,
> > +	.info =3D max6621_info,
> > +};
> > +
> > +static int max6621_probe(struct i2c_client *client,
> > +			 const struct i2c_device_id *id)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct max6621_data *data;
> > +	struct device *hwmon_dev;
> > +	int i;
> > +	int ret;
> > +
> > +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->regmap =3D devm_regmap_init_i2c(client,
> &max6621_regmap_config);
> > +	if (IS_ERR(data->regmap))
> > +		return PTR_ERR(data->regmap);
> > +
> > +	i2c_set_clientdata(client, data);
> > +	data->client =3D client;
> > +
> > +	/* Set CONFIG0 register masking temperature alerts and PEC. */
> > +	ret =3D regmap_write(data->regmap, MAX6621_CONFIG0_REG,
> > +			   MAX6621_CONFIG0_INIT);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Verify which temperature input registers are enabled. */
> > +	for (i =3D 0; i < MAX6621_TEMP_INPUT_REG_NUM; i++) {
> > +		ret =3D i2c_smbus_read_word_data(client,
> max6621_temp_regs[i]);
> > +		if (ret < 0)
> > +			return ret;
> > +		ret =3D max6621_verify_reg_data(dev, ret);
> > +		if (ret) {
> > +			data->input_chan2reg[i] =3D -1;
> > +			continue;
> > +		}
> > +
> > +		data->input_chan2reg[i] =3D max6621_temp_regs[i];
> > +	}
> > +
> > +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client-
> >name,
> > +							 data,
> > +
> &max6621_chip_info,
> > +							 NULL);
> > +
> > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static const struct i2c_device_id max6621_id[] =3D {
> > +	{ MAX6621_DRV_NAME, 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max6621_id);
> > +
> > +static const struct of_device_id max6621_of_match[] =3D {
> > +	{ .compatible =3D "maxim,max6621" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, max6621_of_match);
> > +
> > +static struct i2c_driver max6621_driver =3D {
> > +	.class		=3D I2C_CLASS_HWMON,
> > +	.driver =3D {
> > +		.name =3D MAX6621_DRV_NAME,
> > +		.of_match_table =3D of_match_ptr(max6621_of_match),
> > +	},
> > +	.probe		=3D max6621_probe,
> > +	.id_table	=3D max6621_id,
> > +};
> > +
> > +module_i2c_driver(max6621_driver);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> > +MODULE_DESCRIPTION("Driver for Maxim MAX6621");
> > +MODULE_LICENSE("GPL");
