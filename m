Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36683 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbeLVR0r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Dec 2018 12:26:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id p6so8529981wmc.1
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Dec 2018 09:26:44 -0800 (PST)
Date: Sat, 22 Dec 2018 13:50:21 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Michele Sorcinelli <michelesr@autistici.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] dell-smm-hwmon.c: Additional temperature sensors
Message-ID: <20181222125021.kzwzupc4hj7y4vlc@pali>
References: <20181205091528.ixpitemcg6wnwbyp@pali>
 <20181214235758.13360-1-michelesr@autistici.org>
 <20181221234032.GA17715@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z4rz343vgo457etp"
Content-Disposition: inline
In-Reply-To: <20181221234032.GA17715@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--z4rz343vgo457etp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Friday 21 December 2018 15:40:32 Guenter Roeck wrote:
> On Fri, Dec 14, 2018 at 11:57:59PM +0000, Michele Sorcinelli wrote:
> > The code has been extended to support up to 10 temperature sensors.
> >=20
> > Changes from previous patch versions:
> >=20
> > - fix wrong index ranges in i8k_is_visible() if conditions
> > - restore i8k_get_temp_type() as probe method for temp sensors because
> >   i8k_get_temp() is not reliable (for example it won't work when
> >   the sensors is turned off)
> >=20
> > Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
>=20
> Pali, this is waiting for your feedbacck. Any comments ?
>=20
> Thanks,
> Guenter

Hi! Sorry for delay.

> > ---
> >  drivers/hwmon/dell-smm-hwmon.c | 105 ++++++++++++++++++++++++++++-----
> >  1 file changed, 90 insertions(+), 15 deletions(-)
> >  mode change 100644 =3D> 100755 drivers/hwmon/dell-smm-hwmon.c

This change is wrong, source code files should not be executable.

Otherwise looks good. After removing executable bit, you can add my
Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

> >=20
> > --
> > 2.20.0
> >=20
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hw=
mon.c
> > old mode 100644
> > new mode 100755
> > index 367a8a617..73a30e3e4
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -82,9 +82,16 @@ static bool disallow_fan_support;
> >  #define I8K_HWMON_HAVE_TEMP2	(1 << 1)
> >  #define I8K_HWMON_HAVE_TEMP3	(1 << 2)
> >  #define I8K_HWMON_HAVE_TEMP4	(1 << 3)
> > -#define I8K_HWMON_HAVE_FAN1	(1 << 4)
> > -#define I8K_HWMON_HAVE_FAN2	(1 << 5)
> > -#define I8K_HWMON_HAVE_FAN3	(1 << 6)
> > +#define I8K_HWMON_HAVE_TEMP5	(1 << 4)
> > +#define I8K_HWMON_HAVE_TEMP6	(1 << 5)
> > +#define I8K_HWMON_HAVE_TEMP7	(1 << 6)
> > +#define I8K_HWMON_HAVE_TEMP8	(1 << 7)
> > +#define I8K_HWMON_HAVE_TEMP9	(1 << 8)
> > +#define I8K_HWMON_HAVE_TEMP10	(1 << 9)
> > +
> > +#define I8K_HWMON_HAVE_FAN1	(1 << 10)
> > +#define I8K_HWMON_HAVE_FAN2	(1 << 11)
> > +#define I8K_HWMON_HAVE_FAN3	(1 << 12)
> >=20
> >  MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> >  MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
> > @@ -743,6 +750,25 @@ static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, i8=
k_hwmon_show_temp_label, NULL,
> >  static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, i8k_hwmon_show_temp, N=
ULL, 3);
> >  static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, i8k_hwmon_show_temp_la=
bel, NULL,
> >  			  3);
> > +static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, i8k_hwmon_show_temp, N=
ULL, 4);
> > +static SENSOR_DEVICE_ATTR(temp5_label, S_IRUGO, i8k_hwmon_show_temp_la=
bel, NULL,
> > +			  4);
> > +static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, i8k_hwmon_show_temp, N=
ULL, 5);
> > +static SENSOR_DEVICE_ATTR(temp6_label, S_IRUGO, i8k_hwmon_show_temp_la=
bel, NULL,
> > +			  5);
> > +static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, i8k_hwmon_show_temp, N=
ULL, 6);
> > +static SENSOR_DEVICE_ATTR(temp7_label, S_IRUGO, i8k_hwmon_show_temp_la=
bel, NULL,
> > +			  6);
> > +static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, i8k_hwmon_show_temp, N=
ULL, 7);
> > +static SENSOR_DEVICE_ATTR(temp8_label, S_IRUGO, i8k_hwmon_show_temp_la=
bel, NULL,
> > +			  7);
> > +static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, i8k_hwmon_show_temp, N=
ULL, 8);
> > +static SENSOR_DEVICE_ATTR(temp9_label, S_IRUGO, i8k_hwmon_show_temp_la=
bel, NULL,
> > +			  8);
> > +static SENSOR_DEVICE_ATTR(temp10_input, S_IRUGO, i8k_hwmon_show_temp, =
NULL, 9);
> > +static SENSOR_DEVICE_ATTR(temp10_label, S_IRUGO, i8k_hwmon_show_temp_l=
abel, NULL,
> > +			  9);
> > +
> >  static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, i8k_hwmon_show_fan, NUL=
L, 0);
> >  static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_labe=
l, NULL,
> >  			  0);
> > @@ -770,15 +796,27 @@ static struct attribute *i8k_attrs[] =3D {
> >  	&sensor_dev_attr_temp3_label.dev_attr.attr,	/* 5 */
> >  	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
> >  	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
> > -	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 8 */
> > -	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 9 */
> > -	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 10 */
> > -	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
> > -	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
> > -	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
> > -	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
> > -	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
> > -	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
> > +	&sensor_dev_attr_temp5_input.dev_attr.attr,	/* 8 */
> > +	&sensor_dev_attr_temp5_label.dev_attr.attr,	/* 9 */
> > +	&sensor_dev_attr_temp6_input.dev_attr.attr,	/* 10 */
> > +	&sensor_dev_attr_temp6_label.dev_attr.attr,	/* 11 */
> > +	&sensor_dev_attr_temp7_input.dev_attr.attr,	/* 12 */
> > +	&sensor_dev_attr_temp7_label.dev_attr.attr,	/* 13 */
> > +	&sensor_dev_attr_temp8_input.dev_attr.attr,	/* 14 */
> > +	&sensor_dev_attr_temp8_label.dev_attr.attr,	/* 15 */
> > +	&sensor_dev_attr_temp9_input.dev_attr.attr,	/* 16 */
> > +	&sensor_dev_attr_temp9_label.dev_attr.attr,	/* 17 */
> > +	&sensor_dev_attr_temp10_input.dev_attr.attr,	/* 18 */
> > +	&sensor_dev_attr_temp10_label.dev_attr.attr,	/* 19 */
> > +	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
> > +	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
> > +	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 22 */
> > +	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 23 */
> > +	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 24 */
> > +	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 25 */
> > +	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 26 */
> > +	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 27 */
> > +	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 28 */
> >  	NULL
> >  };
> >=20
> > @@ -802,13 +840,32 @@ static umode_t i8k_is_visible(struct kobject *kob=
j, struct attribute *attr,
> >  	if (index >=3D 6 && index <=3D 7 &&
> >  	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
> >  		return 0;
> > -	if (index >=3D 8 && index <=3D 10 &&
> > +	if (index >=3D 8 && index <=3D 9 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
> > +		return 0;
> > +	if (index >=3D 10 && index <=3D 11 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
> > +		return 0;
> > +	if (index >=3D 12 && index <=3D 13 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
> > +		return 0;
> > +	if (index >=3D 14 && index <=3D 15 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
> > +		return 0;
> > +	if (index >=3D 16 && index <=3D 17 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
> > +		return 0;
> > +	if (index >=3D 18 && index <=3D 19 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
> > +		return 0;
> > +
> > +	if (index >=3D 20 && index <=3D 22 &&
> >  	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
> >  		return 0;
> > -	if (index >=3D 11 && index <=3D 13 &&
> > +	if (index >=3D 23 && index <=3D 25 &&
> >  	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
> >  		return 0;
> > -	if (index >=3D 14 && index <=3D 16 &&
> > +	if (index >=3D 26 && index <=3D 28 &&
> >  	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
> >  		return 0;
> >=20
> > @@ -841,6 +898,24 @@ static int __init i8k_init_hwmon(void)
> >  	err =3D i8k_get_temp_type(3);
> >  	if (err >=3D 0)
> >  		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
> > +	err =3D i8k_get_temp_type(4);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP5;
> > +	err =3D i8k_get_temp_type(5);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP6;
> > +	err =3D i8k_get_temp_type(6);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP7;
> > +	err =3D i8k_get_temp_type(7);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP8;
> > +	err =3D i8k_get_temp_type(8);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP9;
> > +	err =3D i8k_get_temp_type(9);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP10;
> >=20
> >  	/* First fan attributes, if fan status or type is OK */
> >  	err =3D i8k_get_fan_status(0);

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--z4rz343vgo457etp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXB4zCwAKCRCL8Mk9A+RD
UsNZAKCHQQ+yes0Cbq7VPrCVVtZyxTV7lQCfXDpIdVRKlH50SKgUF6O4qA/0W3s=
=GMq1
-----END PGP SIGNATURE-----

--z4rz343vgo457etp--
