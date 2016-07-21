Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
Subject: RE: [patch] Disable PMBus status check for DPS400 PSU controller
Date: Thu, 21 Jul 2016 14:08:59 +0000
Message-ID: <AM5PR0501MB209769770BC712B75FB7F768A2090@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1469112953-77032-1-git-send-email-vadimp@mellanox.com>
 <5790D10A.9070404@roeck-us.net>
In-Reply-To: <5790D10A.9070404@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>



> -----Original Message-----
> From: Guenter Roeck [mailto:linux@roeck-us.net]
> Sent: Thursday, July 21, 2016 4:42 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: jdelvare@suse.com; linux-hwmon@vger.kernel.org; linux-
> kernel@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch] Disable PMBus status check for DPS400 PSU controller
>=20

Hi Guenter,

Thank you very much for your reply.

> Hi Vadim,
>=20
> On 07/21/2016 07:55 AM, Vadim Pasternak wrote:
> > pmbus/dps400: disable PMBus status check through platform data
> > structure to provide support for PSU DPS-460, DPS-800 from Delta
> > Electronics, INC and for
> > SGD009 from Acbel Polytech, INC.
> > These devices do not support the STATUS_CML register, and reports
> > communication error in response to this command.
> > For this reason for these controllers, the status register check is dis=
abled.
> >
>=20
> The subject should be "hwmon: (pmbus) Add explicit support for DPS-460, D=
PS-
> 800, and SGD009", followed by something like
>=20
> "Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and=
 for
> SGD009 from Acbel Polytech, INC.
> These devices do not support the STATUS_CML register and report a
> communication error in response to this command. For this reason, the sta=
tus
> register check is disabled for these controllers."
>=20
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> >
> Unnecessary blank line
>=20
> > Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus.c      | 16 ++++++++++++++++
> >   drivers/hwmon/pmbus/pmbus_core.c |  3 +++
> >   2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> > index 0a74991..44c736a 100644
> > --- a/drivers/hwmon/pmbus/pmbus.c
> > +++ b/drivers/hwmon/pmbus/pmbus.c
> > @@ -25,6 +25,7 @@
> >   #include <linux/slab.h>
> >   #include <linux/mutex.h>
> >   #include <linux/i2c.h>
> > +#include <linux/i2c/pmbus.h>
> >   #include "pmbus.h"
> >
> >   /*
> > @@ -167,14 +168,26 @@ static int pmbus_probe(struct i2c_client *client,
> >   		       const struct i2c_device_id *id)
> >   {
> >   	struct pmbus_driver_info *info;
> > +	struct pmbus_platform_data *pdata =3D NULL;
> > +	struct device *dev =3D &client->dev;
> >
> >   	info =3D devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info)=
,
> >   			    GFP_KERNEL);
> >   	if (!info)
> >   		return -ENOMEM;
> > +	if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps460") ||
>=20
> Should the second string be dps800 ?
>=20
> > +	    !strcmp(id->name, "sgd009")) {
> > +		pdata =3D kzalloc(sizeof(struct pmbus_platform_data),
> GFP_KERNEL);
>=20
> Please use devm_kzalloc().
>=20
> > +		if (!pdata) {
> > +			kfree(info);
>=20
> info was allocated with devm_kzalloc() and thus does not need kfree (besi=
des, if
> at all, it would have to be devm_kfree).
>=20
> > +			return -ENOMEM;
> > +		}
> > +		pdata->flags =3D PMBUS_SKIP_STATUS_CHECK;
> > +	}
> >
> >   	info->pages =3D id->driver_data;
> >   	info->identify =3D pmbus_identify;
> > +	dev->platform_data =3D pdata;
> >
> >   	return pmbus_do_probe(client, id, info);
> >   }
> > @@ -199,6 +212,9 @@ static const struct i2c_device_id pmbus_id[] =3D {
> >   	{"tps544c20", 1},
> >   	{"tps544c25", 1},
> >   	{"udt020", 1},
> > +	{"dps460", 1},
> > +	{"dps800", 1},
> > +	{"sgd009", 1},
>=20
> Please list in alphabetic order.
>=20
> >   	{}
> >   };
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c
> > b/drivers/hwmon/pmbus/pmbus_core.c
> > index ba59eae..3d98070 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -1931,8 +1931,11 @@ EXPORT_SYMBOL_GPL(pmbus_do_probe);
> >   int pmbus_do_remove(struct i2c_client *client)
> >   {
> >   	struct pmbus_data *data =3D i2c_get_clientdata(client);
> > +	const struct pmbus_platform_data *pdata =3D
> > +				dev_get_platdata(&client->dev);
> >   	hwmon_device_unregister(data->hwmon_dev);
> >   	kfree(data->group.attrs);
> > +	kfree(pdata);

So, if I use in allocation
               pdata =3D devm_kzalloc(&client->dev,
                                    sizeof(struct pmbus_platform_data),
                                    GFP_KERNEL);
I also can drop the above three lines, right?

> >   	return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(pmbus_do_remove);
> >
