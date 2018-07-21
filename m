Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727998AbeGUTKX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jul 2018 15:10:23 -0400
Date: Sat, 21 Jul 2018 19:16:43 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maxime =?UTF-8?B?Um91c3Npbi1Cw6lsYW5nZXI=?=
        <maxime.roussinbelanger@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (iio_hwmon) Use devm functions
Message-ID: <20180721191643.470a5350@archlinux>
In-Reply-To: <f45e647a-ed47-31b2-8619-bc0c3f2697e0@roeck-us.net>
References: <20180720144657.21577-1-maxime.roussinbelanger@gmail.com>
        <f45e647a-ed47-31b2-8619-bc0c3f2697e0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, 20 Jul 2018 15:11:32 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 07/20/2018 07:46 AM, Maxime Roussin-B=C3=A9langer wrote:
> > Use devm_iio_channel_get_all() to automatically release
> > channels.
> >=20
> > Use devm_hwmon_device_register_with_groups() to
> > automatically unregister the device.
> >=20
> > Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gma=
il.com>

Other than Guenter's comment, looks good.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks,

Jonathan

> > ---
> >   drivers/hwmon/iio_hwmon.c | 43 ++++++++++-----------------------------
> >   1 file changed, 11 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
> > index 69031a0f7ed2..5cbd87b00ce0 100644
> > --- a/drivers/hwmon/iio_hwmon.c
> > +++ b/drivers/hwmon/iio_hwmon.c
> > @@ -73,17 +73,16 @@ static int iio_hwmon_probe(struct platform_device *=
pdev)
> >   	if (dev->of_node && dev->of_node->name)
> >   		name =3D dev->of_node->name;
> >  =20
> > -	channels =3D iio_channel_get_all(dev);
> > +	channels =3D devm_iio_channel_get_all(dev);
> >   	if (IS_ERR(channels)) {
> >   		if (PTR_ERR(channels) =3D=3D -ENODEV)
> >   			return -EPROBE_DEFER;
> >   		return PTR_ERR(channels);
> >   	}
> >  =20
> >   	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> >   	if (st =3D=3D NULL) {
> > -		ret =3D -ENOMEM;
> > -		goto error_release_channels;
> > +		return -ENOMEM;
> >   	}
> >    =20
> The { } is now no longer necessary. Please drop. Same almost everywhere b=
elow.
>=20
> Thanks,
> Guenter
>=20
> >   	st->channels =3D channels;
> > @@ -96,21 +95,19 @@ static int iio_hwmon_probe(struct platform_device *=
pdev)
> >   				 st->num_channels + 1, sizeof(*st->attrs),
> >   				 GFP_KERNEL);
> >   	if (st->attrs =3D=3D NULL) {
> > -		ret =3D -ENOMEM;
> > -		goto error_release_channels;
> > +		return -ENOMEM;
> >   	}
> >  =20
> >   	for (i =3D 0; i < st->num_channels; i++) {
> >   		a =3D devm_kzalloc(dev, sizeof(*a), GFP_KERNEL);
> >   		if (a =3D=3D NULL) {
> > -			ret =3D -ENOMEM;
> > -			goto error_release_channels;
> > +			return -ENOMEM;
> >   		}
> >  =20
> >   		sysfs_attr_init(&a->dev_attr.attr);
> >   		ret =3D iio_get_channel_type(&st->channels[i], &type);
> >   		if (ret < 0)
> > -			goto error_release_channels;
> > +			return ret;
> >  =20
> >   		switch (type) {
> >   		case IIO_VOLTAGE:
> > @@ -134,12 +131,10 @@ static int iio_hwmon_probe(struct platform_device=
 *pdev)
> >   							       humidity_i++);
> >   			break;
> >   		default:
> > -			ret =3D -EINVAL;
> > -			goto error_release_channels;
> > +			return -EINVAL;
> >   		}
> >   		if (a->dev_attr.attr.name =3D=3D NULL) {
> > -			ret =3D -ENOMEM;
> > -			goto error_release_channels;
> > +			return -ENOMEM;
> >   		}
> >   		a->dev_attr.show =3D iio_hwmon_read_val;
> >   		a->dev_attr.attr.mode =3D S_IRUGO;
> > @@ -152,31 +147,16 @@ static int iio_hwmon_probe(struct platform_device=
 *pdev)
> >  =20
> >   	sname =3D devm_kstrdup(dev, name, GFP_KERNEL);
> >   	if (!sname) {
> > -		ret =3D -ENOMEM;
> > -		goto error_release_channels;
> > +		return -ENOMEM;
> >   	}
> >  =20
> >   	strreplace(sname, '-', '_');
> > -	st->hwmon_dev =3D hwmon_device_register_with_groups(dev, sname, st,
> > -							  st->groups);
> > +	st->hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, sname, =
st,
> > +							       st->groups);
> >   	if (IS_ERR(st->hwmon_dev)) {
> > -		ret =3D PTR_ERR(st->hwmon_dev);
> > -		goto error_release_channels;
> > +		return PTR_ERR(st->hwmon_dev);
> >   	}
> >   	platform_set_drvdata(pdev, st);
> > -	return 0;
> > -
> > -error_release_channels:
> > -	iio_channel_release_all(channels);
> > -	return ret;
> > -}
> > -
> > -static int iio_hwmon_remove(struct platform_device *pdev)
> > -{
> > -	struct iio_hwmon_state *st =3D platform_get_drvdata(pdev);
> > -
> > -	hwmon_device_unregister(st->hwmon_dev);
> > -	iio_channel_release_all(st->channels);
> >  =20
> >   	return 0;
> >   }
> > @@ -193,7 +173,6 @@ static struct platform_driver __refdata iio_hwmon_d=
river =3D {
> >   		.of_match_table =3D iio_hwmon_of_match,
> >   	},
> >   	.probe =3D iio_hwmon_probe,
> > -	.remove =3D iio_hwmon_remove,
> >   };
> >  =20
> >   module_platform_driver(iio_hwmon_driver);
> >  =20
>=20

