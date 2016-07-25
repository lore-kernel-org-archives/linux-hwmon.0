Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: Jean Delvare <jdelvare@suse.de>
CC: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
Subject: RE: [patch] hwmon: (pmbus) Add explicit support for DPS-460, DPS-800,
 and SGD009
Date: Mon, 25 Jul 2016 08:56:01 +0000
Message-ID: <AM5PR0501MB2097A0CA3C70509C2F9949BAA20D0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1469434229-162391-1-git-send-email-vadimp@mellanox.com>
 <20160725103201.2c64653a@endymion>
In-Reply-To: <20160725103201.2c64653a@endymion>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>



> -----Original Message-----
> From: Jean Delvare [mailto:jdelvare@suse.de]
> Sent: Monday, July 25, 2016 11:32 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org; linux-
> kernel@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch] hwmon: (pmbus) Add explicit support for DPS-460, DPS=
-800,
> and SGD009
>=20
> Hi Vadim,

Hi Jean,
Thank you for your comments.
Will resend modified patch.=20

>=20
> On Mon, 25 Jul 2016 08:10:29 +0000, Vadim Pasternak wrote:
> > Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC
> > and for
> > SGD009 from Acbel Polytech, INC.
> > These devices do not support the STATUS_CML register, and reports a
> > communication error in response to this command.
> > For this reason, the status register check is disabled for these contro=
llers.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> > ---
> >  drivers/hwmon/pmbus/pmbus.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> > index 0a74991..f28de37 100644
> > --- a/drivers/hwmon/pmbus/pmbus.c
> > +++ b/drivers/hwmon/pmbus/pmbus.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/mutex.h>
> >  #include <linux/i2c.h>
> > +#include <linux/i2c/pmbus.h>
> >  #include "pmbus.h"
> >
> >  /*
> > @@ -167,14 +168,27 @@ static int pmbus_probe(struct i2c_client *client,
> >  		       const struct i2c_device_id *id)  {
> >  	struct pmbus_driver_info *info;
> > +	struct pmbus_platform_data *pdata =3D NULL;
> > +	struct device *dev =3D &client->dev;
> >
> >  	info =3D devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
> >  			    GFP_KERNEL);
> >  	if (!info)
> >  		return -ENOMEM;
>=20
> A blank line here would improve readability IMHO.
>=20
> > +	if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
> > +	    !strcmp(id->name, "sgd009")) {
> > +		pdata =3D devm_kzalloc(&client->dev,
>=20
> You have defined dev, you might as well use it here, and also in the othe=
r
> devm_kzalloc call.
>=20
> > +				     sizeof(struct pmbus_platform_data),
> > +				     GFP_KERNEL);
> > +		if (!pdata)
> > +			return -ENOMEM;
> > +
> > +		pdata->flags =3D PMBUS_SKIP_STATUS_CHECK;
> > +	}
> >
> >  	info->pages =3D id->driver_data;
> >  	info->identify =3D pmbus_identify;
> > +	dev->platform_data =3D pdata;
> >
> >  	return pmbus_do_probe(client, id, info);  } @@ -186,6 +200,8 @@
> > static const struct i2c_device_id pmbus_id[] =3D {
> >  	{"adp4000", 1},
> >  	{"bmr453", 1},
> >  	{"bmr454", 1},
> > +	{"dps460", 1},
> > +	{"dps800", 1},
> >  	{"mdt040", 1},
> >  	{"ncp4200", 1},
> >  	{"ncp4208", 1},
> > @@ -193,6 +209,7 @@ static const struct i2c_device_id pmbus_id[] =3D {
> >  	{"pdt006", 1},
> >  	{"pdt012", 1},
> >  	{"pmbus", 0},
> > +	{"sgd009", 1},
> >  	{"tps40400", 1},
> >  	{"tps544b20", 1},
> >  	{"tps544b25", 1},
>=20
> (non-authoritative)
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>=20
> --
> Jean Delvare
> SUSE L3 Support
