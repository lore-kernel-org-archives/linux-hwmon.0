Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>
Subject: RE: [1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN driver
Date: Tue, 26 Jun 2018 08:03:33 +0000
Message-ID: <HE1PR0502MB375318B87492BA033E1DB170A2490@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1529514578-21333-1-git-send-email-vadimp@mellanox.com>
 <20180625174545.GA5418@roeck-us.net>
In-Reply-To: <20180625174545.GA5418@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>



> -----Original Message-----
> From: Guenter Roeck [mailto:linux@roeck-us.net]
> Sent: Monday, June 25, 2018 8:46 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-hwmon@vger.kernel.org; jiri@resnulli.us; Michael Shych
> <michaelsh@mellanox.com>
> Subject: Re: [1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN drive=
r
>=20
> On Wed, Jun 20, 2018 at 05:09:38PM +0000, Vadim Pasternak wrote:
> > Driver obtains PWM and tachometers registers location according to the
> > system configuration and creates FAN/PWM hwmon objects and a cooling
> > device. PWM and tachometers are controlled through the on-board
> > programmable device, which exports its register map. This device could
> > be attached to any bus type, for which register mapping is supported.
> > Single instance is created with one PWM control, up to 12 tachometers
> > and one cooling device. It could be as many instances as programmable
> > device supports.
> >
> > Currently driver will be activated from the Mellanox platform driver:
> > drivers/platform/x86/mlx-platform.c.
> > For the future ARM based systems it could be activated from the ARM
> > platform module.
> >

Hi Guenter,

Thank you very much for review.
>=20
> Your call, but no devicetree support ?

Since currently we have only x86 systems, I'd like to handle when
we'll ARM based system support.
Maybe if I'll activate it from arm platform module, the devicetree
support will be not needed.

>=20
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  drivers/hwmon/Kconfig      |  12 ++
> >  drivers/hwmon/Makefile     |   1 +
> >  drivers/hwmon/mlxreg-fan.c | 466
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 479 insertions(+)
> >  create mode 100644 drivers/hwmon/mlxreg-fan.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
> > f10840a..103d4bc 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -937,6 +937,18 @@ config SENSORS_MCP3021
> >  	  This driver can also be built as a module.  If so, the module
> >  	  will be called mcp3021.
> >
> > +config SENSORS_MLXREG_FAN
> > +	tristate "Mellanox Mellanox FAN driver"
> > +	depends on MELLANOX_PLATFORM
> > +	depends on REGMAP
>=20
> Every other driver uses "select REGMAP".
>=20
> > +	depends on THERMAL
>=20
> Usually that would be "THERMAL || THERMAL=3Dn". I understand the code as
> written makes it mandatory, but it is still unusual.

Do you suggest to use "THERMAL || THERMAL=3Dn" and put cooling device
related code inside #ifdef THERMAL?

>=20
> > +	help
> > +	  This option enables support for the FAN control on the Mellanox
> > +	  Ethernet and InfiniBand switches. The driver can be activated by th=
e
> > +	  platform device add call. Say Y to enable these. To compile this
> > +	  driver as a module, choose 'M' here: the module will be called
> > +	  mlxreg-fan.
> > +
> >  config SENSORS_TC654
> >  	tristate "Microchip TC654/TC655 and compatibles"
> >  	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
> > e7d52a3..cac3c06 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -129,6 +129,7 @@ obj-$(CONFIG_SENSORS_MAX31790)	+=3D
> max31790.o
> >  obj-$(CONFIG_SENSORS_MC13783_ADC)+=3D mc13783-adc.o
> >  obj-$(CONFIG_SENSORS_MCP3021)	+=3D mcp3021.o
> >  obj-$(CONFIG_SENSORS_TC654)	+=3D tc654.o
> > +obj-$(CONFIG_SENSORS_MLXREG_FAN) +=3D mlxreg-fan.o
> >  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) +=3D menf21bmc_hwmon.o
> >  obj-$(CONFIG_SENSORS_NCT6683)	+=3D nct6683.o
> >  obj-$(CONFIG_SENSORS_NCT6775)	+=3D nct6775.o
> > diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> > new file mode 100644 index 0000000..c2bf43f
> > --- /dev/null
> > +++ b/drivers/hwmon/mlxreg-fan.c
> > @@ -0,0 +1,466 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) // // Copyright
> > +(c) 2018 Mellanox Technologies. All rights reserved.
> > +// Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/device.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
>=20
> Should not be needed.

ACK
>=20
> > +#include <linux/module.h>
> > +#include <linux/platform_data/mlxreg.h> #include
> > +<linux/platform_device.h> #include <linux/regmap.h> #include
> > +<linux/thermal.h>
> > +
> > +#define MLXREG_FAN_MAX_TACHO		12
> > +#define MLXREG_FAN_MAX_STATE		10
> > +#define MLXREG_FAN_MIN_DUTY		51	/* 20% */
> > +#define MLXREG_FAN_MAX_DUTY		255	/* 100% */
> > +/* Minimum and maximum FAN allowed speed in percent: from 20% to
> > +100%. Values
>=20
> Standard multi-line comments please.

ACK

>=20
> > + * MLXREG_FAN_MAX_STATE + x, where x is between 2 and 10 are used for
> > + * setting FAN speed dynamic minimum. For example, if value is set to
> > +14 (40%)
> > + * cooling levels vector will be set to 4, 4, 4, 4, 4, 5, 6, 7, 8, 9,
> > +10 to
> > + * introduce PWM speed in percent: 40, 40, 40, 40, 40, 50, 60. 70, 80,=
 90, 100.
> > + */
> > +#define MLXREG_FAN_SPEED_MIN		(MLXREG_FAN_MAX_STATE +
> 2)
> > +#define MLXREG_FAN_SPEED_MAX		(MLXREG_FAN_MAX_STATE *
> 2)
> > +#define MLXREG_FAN_SPEED_MIN_LEVEL	2	/* 20 percent */
> > +#define MLXREG_FAN_TACHO_ROUND_DEF	500
> > +#define MLXREG_FAN_TACHO_DIVIDER_DEF	1132
> > +#define MLXREG_FAN_GET_RPM(val, d, r)	(15000000 / ((val) * (d) / 100 +
> (r)))
> > +#define MLXREG_FAN_GET_FAULT(val, mask) (((val) ^ (mask)) ? false : tr=
ue)
> > +#define MLXREG_FAN_PWM_DUTY2STATE(duty)
> 	(DIV_ROUND_CLOSEST((duty) *	\
> > +					 MLXREG_FAN_MAX_STATE,
> 	\
> > +					 MLXREG_FAN_MAX_DUTY))
> > +#define MLXREG_FAN_PWM_STATE2DUTY(stat)
> 	(DIV_ROUND_CLOSEST((stat) *	\
> > +					 MLXREG_FAN_MAX_DUTY,
> 	\
> > +					 MLXREG_FAN_MAX_STATE))
> > +
> > +/**
>=20
> Those data structures are only used internally in this driver. Sure you w=
ant them
> documented as API ?
>=20

I put it just in order to provide more explanation.
Should I remove it or format in other way?

> > + * struct mlxreg_fan_tacho - tachometer data:
> > + *
> > + * @connected: indicates if tachometer is connected;
> > + * @pwm_connected: indicates if PWM is connected;
> > + * @reg: register offset;
> > + * @mask: fault mask;
> > + */
> > +struct mlxreg_fan_tacho {
> > +	bool connected;
> > +	int reg;
> > +	int mask;
> > +};
> > +
> > +/**
> > + * struct mlxreg_fan_pwm - PWM data:
> > + *
> > + * @connected: indicates if PWM is connected;
> > + * @reg: register offset;
> > + */
> > +struct mlxreg_fan_pwm {
> > +	bool connected;
> > +	int reg;
> > +};
> > +
> > +/**
> > + * struct mlxreg_fan - private data:
> > + *
> > + * @pdev: platform device;
>=20
> The only use of pdev is to dereference pdev->dev. Might as well put it he=
re
> directly instead of dereferencing it repeatedly.

ACK

>=20
> > + * @pdata: platform data;
>=20
> The only use of pdata outside the probe function is to dereference regmap=
.
> Might as well store regmap directly.
>=20
> > + * @tacho: tachometer data;
> > + * @pwm: PWM data;
> > + * @round: round value for tachometer RPM calculation;
> > + * @divider: divider value for tachometer RPM calculation;
> > + * @cooling: cooling device levels;
> > + * @cdev: cooling device;
> > + */
> > +struct mlxreg_fan {
> > +	struct platform_device *pdev;
> > +	struct mlxreg_core_platform_data *pdata;
> > +	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
> > +	struct mlxreg_fan_pwm pwm;
> > +	int round;
> > +	int divider;
> > +	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
> > +	struct thermal_cooling_device *cdev; };
> > +
> > +static int
> > +mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32
> attr,
> > +		int channel, long *val)
> > +{
> > +	struct mlxreg_fan *mlxreg_fan =3D dev_get_drvdata(dev);
> > +	struct mlxreg_fan_tacho *tacho;
> > +	u32 regval;
> > +	int err;
> > +
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		tacho =3D &mlxreg_fan->tacho[channel];
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +			err =3D regmap_read(mlxreg_fan->pdata->regmap,
> > +					  tacho->reg, &regval);
> > +			if (err)
> > +				return err;
> > +
> > +			*val =3D MLXREG_FAN_GET_RPM(regval, mlxreg_fan-
> >divider,
> > +						  mlxreg_fan->round);
> > +			break;
> > +
> > +		case hwmon_fan_fault:
> > +			err =3D regmap_read(mlxreg_fan->pdata->regmap,
> > +					  tacho->reg, &regval);
> > +			if (err)
> > +				return err;
> > +
> > +			*val =3D MLXREG_FAN_GET_FAULT(regval, tacho->mask);
> > +			break;
> > +
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			err =3D regmap_read(mlxreg_fan->pdata->regmap,
> > +					  mlxreg_fan->pwm.reg, &regval);
> > +			if (err)
> > +				return err;
> > +
> > +			*val =3D regval;
> > +			break;
> > +
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
> > +mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32
> attr,
> > +		 int channel, long val)
> > +{
> > +	struct mlxreg_fan *mlxreg_fan =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			if (val < MLXREG_FAN_MIN_DUTY || val >
> > +			    MLXREG_FAN_MAX_DUTY)
>=20
> Please plit lines after ||

ACK

>=20
> > +				return -EINVAL;
> > +			return regmap_write(mlxreg_fan->pdata->regmap,
> > +					    mlxreg_fan->pwm.reg, val);
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
> > +static umode_t
> > +mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type,
> u32 attr,
> > +		      int channel)
> > +{
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		if (!(((struct mlxreg_fan *)data)->tacho[channel].connected))
> > +			return 0;
> > +
> > +		switch (attr) {
> > +		case hwmon_fan_input:
> > +		case hwmon_fan_fault:
> > +			return 0444;
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +
> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			return 0644;
> > +		default:
> > +			break;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const u32 mlxreg_fan_hwmon_fan_config[] =3D {
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	HWMON_F_INPUT | HWMON_F_FAULT,
> > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info mlxreg_fan_hwmon_fan =3D {
> > +	.type =3D hwmon_fan,
> > +	.config =3D mlxreg_fan_hwmon_fan_config, };
> > +
> > +static const u32 mlxreg_fan_hwmon_pwm_config[] =3D {
> > +	HWMON_PWM_INPUT,
> > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info mlxreg_fan_hwmon_pwm =3D {
> > +	.type =3D hwmon_pwm,
> > +	.config =3D mlxreg_fan_hwmon_pwm_config, };
> > +
> > +static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] =3D {
> > +	&mlxreg_fan_hwmon_fan,
> > +	&mlxreg_fan_hwmon_pwm,
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_ops mlxreg_fan_hwmon_hwmon_ops =3D {
> > +	.is_visible =3D mlxreg_fan_is_visible,
> > +	.read =3D mlxreg_fan_read,
> > +	.write =3D mlxreg_fan_write,
> > +};
> > +
> > +static const struct hwmon_chip_info mlxreg_fan_hwmon_chip_info =3D {
> > +	.ops =3D &mlxreg_fan_hwmon_hwmon_ops,
> > +	.info =3D mlxreg_fan_hwmon_info,
> > +};
> > +
> > +static int mlxreg_fan_get_max_state(struct thermal_cooling_device *cde=
v,
> > +				    unsigned long *state)
> > +{
> > +	*state =3D MLXREG_FAN_MAX_STATE;
> > +	return 0;
> > +}
> > +
> > +static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cde=
v,
> > +				    unsigned long *state)
> > +
> > +{
> > +	struct mlxreg_fan *mlxreg_fan =3D cdev->devdata;
> > +	u32 regval;
> > +	int err;
> > +
> > +	err =3D regmap_read(mlxreg_fan->pdata->regmap, mlxreg_fan-
> >pwm.reg,
> > +			  &regval);
> > +	if (err) {
> > +		dev_err(&mlxreg_fan->pdev->dev, "Failed to query PWM
> duty\n");
> > +		return err;
> > +	}
> > +
> > +	*state =3D MLXREG_FAN_PWM_DUTY2STATE(regval);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cde=
v,
> > +				    unsigned long state)
> > +
> > +{
> > +	struct mlxreg_fan *mlxreg_fan =3D cdev->devdata;
> > +	unsigned long cur_state;
> > +	u32 regval;
> > +	int i;
> > +	int err;
> > +
> > +	/* Verify if this request is for changing allowed FAN dynamical
>=20
> /*
>  * comment
>  */

ACK

>=20
> > +	 * minimum. If it is - update cooling levels accordingly and update
> > +	 * state, if current state is below the newly requested minimum state=
.
> > +	 * For example, if current state is 5, and minimal state is to be
> > +	 * changed from 4 to 6, mlxreg_fan->cooling_levels[0 to 5] will be
> > +	 * changed all from 4 to 6. And state 5 (mlxreg_fan->cooling_levels[4=
])
> > +	 * should be overwritten.
> > +	 */
> > +	if (state >=3D MLXREG_FAN_SPEED_MIN && state <=3D
> MLXREG_FAN_SPEED_MAX) {
> > +		state -=3D MLXREG_FAN_MAX_STATE;
> > +		for (i =3D 0; i < state; i++)
> > +			mlxreg_fan->cooling_levels[i] =3D state;
> > +		for (i =3D state; i <=3D MLXREG_FAN_MAX_STATE; i++)
> > +			mlxreg_fan->cooling_levels[i] =3D i;
> > +
> > +		err =3D regmap_read(mlxreg_fan->pdata->regmap,
> > +				  mlxreg_fan->pwm.reg, &regval);
> > +		if (err) {
> > +			dev_err(&mlxreg_fan->pdev->dev, "Failed to query
> PWM duty\n");
> > +			return err;
> > +		}
> > +
> > +		cur_state =3D MLXREG_FAN_PWM_DUTY2STATE(regval);
> > +		if (state < cur_state)
> > +			return 0;
> > +
> > +		state =3D cur_state;
> > +	}
> > +
> > +	if (state > MLXREG_FAN_MAX_STATE)
> > +		return -EINVAL;
> > +
> > +	/* Normalize the state to the valid speed range. */
> > +	state =3D mlxreg_fan->cooling_levels[state];
> > +	err =3D regmap_write(mlxreg_fan->pdata->regmap, mlxreg_fan-
> >pwm.reg,
> > +			   MLXREG_FAN_PWM_STATE2DUTY(state));
> > +	if (err) {
> > +		dev_err(&mlxreg_fan->pdev->dev, "Failed to write PWM
> duty\n");
> > +		return err;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops =
=3D {
> > +	.get_max_state	=3D mlxreg_fan_get_max_state,
> > +	.get_cur_state	=3D mlxreg_fan_get_cur_state,
> > +	.set_cur_state	=3D mlxreg_fan_set_cur_state,
> > +};
> > +
> > +static int mlxreg_fan_config(struct mlxreg_fan *mlxreg_fan) {
> > +	struct mlxreg_core_platform_data *pdata =3D mlxreg_fan->pdata;
>=20
> Pass mlxreg_core_platform_data as argument to avoid needing it in mlxreg_=
fan.
>=20

ACK

> > +	struct mlxreg_core_data *data =3D pdata->data;
> > +	int tacho_num =3D 0, i;
> > +
> > +	mlxreg_fan->round =3D MLXREG_FAN_TACHO_ROUND_DEF;
> > +	mlxreg_fan->divider =3D MLXREG_FAN_TACHO_DIVIDER_DEF;
> > +	for (i =3D 0; i < pdata->counter; i++, data++) {
> > +		if (strnstr(data->label, "tacho", sizeof(data->label))) {
> > +			if (tacho_num =3D=3D MLXREG_FAN_MAX_TACHO) {
> > +				dev_err(&mlxreg_fan->pdev->dev, "invalid
> tacho entry: %s\n",
> > +					data->label);
> > +				return -EINVAL;
> > +			}
> > +			mlxreg_fan->tacho[tacho_num].reg =3D data->reg;
> > +			mlxreg_fan->tacho[tacho_num].mask =3D data->mask;
> > +			mlxreg_fan->tacho[tacho_num++].connected =3D true;
> > +		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
> > +			if (mlxreg_fan->pwm.connected) {
> > +				dev_err(&mlxreg_fan->pdev->dev, "invalid
> pwm entry: %s\n",
> > +					data->label);
> > +				return -EINVAL;
> > +			}
> > +			mlxreg_fan->pwm.reg =3D data->reg;
> > +			mlxreg_fan->pwm.connected =3D true;
> > +		} else if (strnstr(data->label, "conf", sizeof(data->label))) {
> > +			mlxreg_fan->round =3D data->mask;
> > +			mlxreg_fan->divider =3D data->bit;
> > +		} else {
> > +			dev_err(&mlxreg_fan->pdev->dev, "invalid label: %s\n",
> > +				data->label);
> > +			return -EINVAL;
> > +		}
> > +		dev_info(&mlxreg_fan->pdev->dev, "label: %s,
> offset:0x%02x\n",
> > +			 data->label, data->reg);
>=20
> This is debugging information. Please no noise.

ACK

>=20
> > +	}
> > +
> > +	/* Init cooling levels per PWM state. */
> > +	for (i =3D 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
> > +		mlxreg_fan->cooling_levels[i] =3D
> MLXREG_FAN_SPEED_MIN_LEVEL;
> > +	for (i =3D MLXREG_FAN_SPEED_MIN_LEVEL; i <=3D
> MLXREG_FAN_MAX_STATE; i++)
> > +		mlxreg_fan->cooling_levels[i] =3D i;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxreg_fan_probe(struct platform_device *pdev) {
> > +	struct mlxreg_core_platform_data *pdata;
> > +	struct mlxreg_fan *mlxreg_fan;
> > +	struct device *hwm;
> > +	const char *name;
> > +	int err;
> > +
> > +	pdata =3D dev_get_platdata(&pdev->dev);
> > +	if (!pdata) {
> > +		dev_err(&pdev->dev, "Failed to get platform data.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mlxreg_fan =3D devm_kzalloc(&pdev->dev, sizeof(*mlxreg_fan),
> GFP_KERNEL);
> > +	if (!mlxreg_fan)
> > +		return -ENOMEM;
> > +
> > +	mlxreg_fan->pdev =3D pdev;
> > +	mlxreg_fan->pdata =3D pdata;
> > +	dev_set_drvdata(&pdev->dev, mlxreg_fan);
> > +
>=20
> platform_set_drvdata()

ACK

>=20
> > +	err =3D mlxreg_fan_config(mlxreg_fan);
> > +	if (err)
> > +		return err;
> > +
> > +	if (pdev->id > -1)
> > +		name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s%d",
> > +				      "mlxreg_fan", pdev->id);
> > +	else
> > +		name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> "mlxreg_fan");
>=20
> This is very unusual. Why do you need a per-device-id name ? Why not just=
 use a
> single name such as "mlxreg_fan" like every other driver ?

I did it in order to distinct between cooling device types in case we have =
more
then one instance of mlxreg_fan in
/sys/class/thermal/cooling_device{x}/type
But maybe it's really redundant, since I can do it based on cooling_device =
index.
I'll remove it.

>=20
> > +	if (!name)
> > +		return -ENOMEM;
> > +
> > +	hwm =3D devm_hwmon_device_register_with_info(&pdev->dev, name,
> > +						   mlxreg_fan,
> > +
> &mlxreg_fan_hwmon_chip_info,
> > +						   NULL);
> > +	if (IS_ERR(hwm)) {
> > +		dev_err(&pdev->dev, "Failed to register hwmon device\n");
> > +		return PTR_ERR(hwm);
> > +	}
> > +
> > +	mlxreg_fan->cdev =3D thermal_cooling_device_register("mlxreg_fan",
> > +						mlxreg_fan,
> > +						&mlxreg_fan_cooling_ops);
> > +	if (IS_ERR(mlxreg_fan->cdev)) {
> > +		dev_err(&pdev->dev, "Failed to register cooling device\n");
> > +		return PTR_ERR(mlxreg_fan->cdev);
> > +	}
>=20
> This effectively makes the driver hard dependent on THERMAL. Ok with me i=
f
> that is what you want, it just seems unusual to limit the driver's use ca=
se like
> that.

OK, I'll use here #ifdef CONFIG_THERMAL.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int mlxreg_fan_remove(struct platform_device *pdev) {
> > +	struct mlxreg_fan *mlxreg_fan =3D platform_get_drvdata(pdev);
> > +
> > +	thermal_cooling_device_unregister(mlxreg_fan->cdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver mlxreg_fan_driver =3D {
> > +	.driver =3D {
> > +	    .name =3D "mlxreg-fan",
> > +	},
> > +	.probe =3D mlxreg_fan_probe,
> > +	.remove =3D mlxreg_fan_remove,
> > +};
> > +
> > +module_platform_driver(mlxreg_fan_driver);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> > +MODULE_DESCRIPTION("Mellanox FAN driver"); MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:mlxreg-fan");
