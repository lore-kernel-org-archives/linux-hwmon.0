Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dell-smm-hwmon: Detect fan with index=2
Date: Sun, 22 May 2016 02:31:12 +0200
Cc: Jean Delvare <jdelvare@suse.com>,
 Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1463842366-17964-1-git-send-email-pali.rohar@gmail.com> <5740FB9A.6060803@roeck-us.net>
In-Reply-To: <5740FB9A.6060803@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3932577.MmQmFPiCkP";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605220231.12951@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart3932577.MmQmFPiCkP
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 May 2016 02:21:46 Guenter Roeck wrote:
> On 05/21/2016 07:52 AM, Pali Roh=C3=A1r wrote:
> > Some Dell machines (e.g. Dell Precision M3800) have two fans, first
> > with index=3D0 and second with index=3D2. So export also attributes
> > for third fan device with index=3D2.
> >=20
> > Reported-by: Tolga Cakir <cevelnet@gmail.com>
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >=20
> >   drivers/hwmon/dell-smm-hwmon.c |   20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> >=20
> > ---
> >=20
> > Hi Tolga! Can you test this patch if sensors see fan device
> > correctly?
>=20
> I assume this means I should wait for test results before applying
> the patch ?

Yes, testing should be done.

Do you have some pending/testing/next tree/branch for such patches?

> Thanks,
> Guenter
>=20
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c
> > b/drivers/hwmon/dell-smm-hwmon.c index 577445f..7a2764a 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -78,6 +78,7 @@ static uint i8k_fan_max =3D I8K_FAN_HIGH;
> >=20
> >   #define I8K_HWMON_HAVE_TEMP4	(1 << 3)
> >   #define I8K_HWMON_HAVE_FAN1	(1 << 4)
> >   #define I8K_HWMON_HAVE_FAN2	(1 << 5)
> >=20
> > +#define I8K_HWMON_HAVE_FAN3	(1 << 6)
> >=20
> >   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> >   MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
> >=20
> > @@ -246,7 +247,7 @@ static int _i8k_get_fan_type(int fan)
> >=20
> >   static int i8k_get_fan_type(int fan)
> >   {
> >  =20
> >   	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values
> >   	*/
> >=20
> > -	static int types[2] =3D { INT_MIN, INT_MIN };
> > +	static int types[3] =3D { INT_MIN, INT_MIN, INT_MIN };
> >=20
> >   	if (types[fan] =3D=3D INT_MIN)
> >   =09
> >   		types[fan] =3D _i8k_get_fan_type(fan);
> >=20
> > @@ -707,6 +708,12 @@ static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO,
> > i8k_hwmon_show_fan_label, NULL,
> >=20
> >   			  1);
> >  =20
> >   static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
> >   i8k_hwmon_show_pwm,
> >  =20
> >   			  i8k_hwmon_set_pwm, 1);
> >=20
> > +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan,
> > NULL, +			  2);
> > +static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO,
> > i8k_hwmon_show_fan_label, NULL, +			  2);
> > +static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
> > i8k_hwmon_show_pwm, +			  i8k_hwmon_set_pwm, 2);
> >=20
> >   static struct attribute *i8k_attrs[] =3D {
> >  =20
> >   	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
> >=20
> > @@ -723,6 +730,9 @@ static struct attribute *i8k_attrs[] =3D {
> >=20
> >   	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
> >   	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
> >   	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
> >=20
> > +	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
> > +	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
> > +	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
> >=20
> >   	NULL
> >  =20
> >   };
> >=20
> > @@ -747,6 +757,9 @@ static umode_t i8k_is_visible(struct kobject
> > *kobj, struct attribute *attr,
> >=20
> >   	if (index >=3D 11 && index <=3D 13 &&
> >   =09
> >   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
> >   	=09
> >   		return 0;
> >=20
> > +	if (index >=3D 14 && index <=3D 16 &&
> > +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
> > +		return 0;
> >=20
> >   	return attr->mode;
> >  =20
> >   }
> >=20
> > @@ -788,6 +801,11 @@ static int __init i8k_init_hwmon(void)
> >=20
> >   	if (err >=3D 0)
> >   =09
> >   		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;
> >=20
> > +	/* Third fan attributes, if fan status is OK */
> > +	err =3D i8k_get_fan_status(2);
> > +	if (err >=3D 0)
> > +		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
> > +
> >=20
> >   	i8k_hwmon_dev =3D hwmon_device_register_with_groups(NULL,
> >   	"dell_smm",
> >   =09
> >   							  NULL, i8k_groups);
> >   =09
> >   	if (IS_ERR(i8k_hwmon_dev)) {

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3932577.MmQmFPiCkP
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldA/dAACgkQi/DJPQPkQ1KfMgCeN4kpCYsOaDzikdF8kQWMdI/a
xpYAn3A0JyMLDQv8qsGK3x4raWvXMLUw
=tEyi
-----END PGP SIGNATURE-----

--nextPart3932577.MmQmFPiCkP--
