Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>
Subject: RE: [patch v2 1/1] Add support for Texas Instruments tps53679 device
Date: Thu, 31 Aug 2017 04:38:01 +0000
Message-ID: <AM4PR05MB3330E3073F2A85E9CAC1D1B7A29D0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1504130534-114811-1-git-send-email-vadimp@mellanox.com>
 <20170831040150.GA26660@roeck-us.net>
In-Reply-To: <20170831040150.GA26660@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>



> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> Roeck
> Sent: Thursday, August 31, 2017 7:02 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-hwmon@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch v2 1/1] Add support for Texas Instruments tps53679
> device
>=20
> On Wed, Aug 30, 2017 at 10:02:14PM +0000, Vadim Pasternak wrote:
> > The below lists of VOUT_MODE command readout with their related VID
> > protocols, Digital to Analog Converter steps, supported by the device:
> > VR12.0 mode, 5-mV DAC - 0x21
> > VR12.5 mode, 10-mV DAC - 0x22
> > VR13.0 mode, 10-mV DAC - 0x24
> > IMVP8 mode, 5-mV DAC - 0x25
> > VR13.0 mode, 5-mV DAC - 0x27
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> Applied to hwmon-next. Minor comment below for reference (though many
> hwmon drivers do that wrong as well).
>=20
> For future patches, please remember to tag the subject line with the
> subsystem and, if appropriate, the affected driver.

Hi Guenter,

Thank you for taking it to hwmon-next and for your comment. Next time will =
do it in right way.

Thanks,
Vadim.

>=20
> Thanks,
> Guenter
>=20
> > ---
> > v1->v2
> >  Comments pointed out by Guenter:
> >  - arrange includes in alphabetic order;
> >  - remove tps53679_data, since it's used only in tps53679_identify;
> >  - drop redundant comment;
> >  - drop id field in tps53679_id;
> > ---
> >  drivers/hwmon/pmbus/Kconfig    |  10 ++++
> >  drivers/hwmon/pmbus/Makefile   |   1 +
> >  drivers/hwmon/pmbus/tps53679.c | 113
> > +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 124 insertions(+)
> >  create mode 100644 drivers/hwmon/pmbus/tps53679.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig
> b/drivers/hwmon/pmbus/Kconfig
> > index 68d717a..42d2366 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -135,6 +135,16 @@ config SENSORS_TPS40422
> >  	  This driver can also be built as a module. If so, the module will
> >  	  be called tps40422.
> >
> > +config SENSORS_TPS53679
> > +	tristate "TI TPS53679"
> > +	default n
> > +	help
> > +	  If you say yes here you get hardware monitoring support for TI
> > +	  TPS53679.
> > +
> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called tps53679.
> > +
> >  config SENSORS_UCD9000
> >  	tristate "TI UCD90120, UCD90124, UCD90160, UCD9090, UCD90910"
> >  	default n
> > diff --git a/drivers/hwmon/pmbus/Makefile
> > b/drivers/hwmon/pmbus/Makefile index 75bb7ca..c7c76b0 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -14,6 +14,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+=3D
> max20751.o
> >  obj-$(CONFIG_SENSORS_MAX34440)	+=3D max34440.o
> >  obj-$(CONFIG_SENSORS_MAX8688)	+=3D max8688.o
> >  obj-$(CONFIG_SENSORS_TPS40422)	+=3D tps40422.o
> > +obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679.o
> >  obj-$(CONFIG_SENSORS_UCD9000)	+=3D ucd9000.o
> >  obj-$(CONFIG_SENSORS_UCD9200)	+=3D ucd9200.o
> >  obj-$(CONFIG_SENSORS_ZL6100)	+=3D zl6100.o
> > diff --git a/drivers/hwmon/pmbus/tps53679.c
> > b/drivers/hwmon/pmbus/tps53679.c new file mode 100644 index
> > 0000000..85b515c
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tps53679.c
> > @@ -0,0 +1,113 @@
> > +/*
> > + * Hardware monitoring driver for Texas Instruments TPS53679
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
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +#define TPS53679_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV
> DAC */
> > +#define TPS53679_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV
> DAC */
> > +#define TPS53679_PROT_VR13_10MV		0x04 /* VR13.0 mode,
> 10-mV DAC */
> > +#define TPS53679_PROT_IMVP8_5MV		0x05 /* IMVP8 mode,
> 5-mV DAC */
> > +#define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV
> DAC */
> > +#define TPS53679_PAGE_NUM		2
> > +
> > +static int tps53679_identify(struct i2c_client *client,
> > +			     struct pmbus_driver_info *info) {
> > +	u8 vout_params;
> > +	int ret;
> > +
> > +	/* Read the register with VOUT scaling value.*/
> > +	ret =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	vout_params =3D ret & GENMASK(4, 0);
> > +
> > +	switch (vout_params) {
> > +	case TPS53679_PROT_VR13_10MV:
> > +	case TPS53679_PROT_VR12_5_10MV:
> > +		info->vrm_version =3D vr13;
> > +		break;
> > +	case TPS53679_PROT_VR13_5MV:
> > +	case TPS53679_PROT_VR12_5MV:
> > +	case TPS53679_PROT_IMVP8_5MV:
> > +		info->vrm_version =3D vr12;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct pmbus_driver_info tps53679_info =3D {
> > +	.pages =3D TPS53679_PAGE_NUM,
> > +	.format[PSC_VOLTAGE_IN] =3D linear,
> > +	.format[PSC_VOLTAGE_OUT] =3D vid,
> > +	.format[PSC_TEMPERATURE] =3D linear,
> > +	.format[PSC_CURRENT_OUT] =3D linear,
> > +	.format[PSC_POWER] =3D linear,
> > +	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> PMBUS_HAVE_STATUS_VOUT |
> > +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> > +		PMBUS_HAVE_POUT,
> > +	.func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> PMBUS_HAVE_STATUS_VOUT |
> > +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> > +		PMBUS_HAVE_POUT,
> > +	.identify =3D tps53679_identify,
> > +};
> > +
> > +static int tps53679_probe(struct i2c_client *client,
> > +			  const struct i2c_device_id *id)
> > +{
> > +	return pmbus_do_probe(client, id, &tps53679_info); }
> > +
> > +static const struct i2c_device_id tps53679_id[] =3D {
> > +	{"tps53679", 0},
> > +	{}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, tps53679_id);
> > +
> > +static const struct of_device_id tps53679_of_match[] =3D {
> > +	{.compatible =3D "ti,tps53679"},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, tps53679_of_match);
> > +
> > +static struct i2c_driver tps53679_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "tps53679",
> > +		.of_match_table =3D of_match_ptr(tps53679_of_match),
> > +	},
> > +	.probe =3D tps53679_probe,
> > +	.remove =3D pmbus_do_remove,
> > +	.id_table =3D tps53679_id,
> > +};
> > +
> > +module_i2c_driver(tps53679_driver);
> > +
> > +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Texas Instruments TPS53679");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.1.4
> >
