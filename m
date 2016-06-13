Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33197 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964854AbcFMS0f (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 13 Jun 2016 14:26:35 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dell-smm-hwmon: Detect fan with index=2
Date: Mon, 13 Jun 2016 20:26:31 +0200
Cc: Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <1463842366-17964-1-git-send-email-pali.rohar@gmail.com> <20160531110334.GD29844@pali> <CABcamCCmiuAGA_v3xf=wZy7wq9e1dgOsQbobiPX_BxwA_TOpzQ@mail.gmail.com>
In-Reply-To: <CABcamCCmiuAGA_v3xf=wZy7wq9e1dgOsQbobiPX_BxwA_TOpzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3691199.9G3hEvVBGA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606132026.31893@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart3691199.9G3hEvVBGA
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Guenter, I think you can take this patch also with Tolga's Tested-by.

On Wednesday 01 June 2016 13:34:47 Tolga Cakir wrote:
> Hi Pali,
>=20
> thanks for the patch and sorry for the delay! I've checked out
> https://git.kernel.org/cgit/linux/kernel/git/groeck/linux-staging.git
> /commit/?h=3Dhwmon-staging&id=3D86c050c82dd527b17cf47043831f03646f402a88
> and ran it on my Dell M3800. It correctly works for identifying 2
> fans, one listed as "Processor Fan" and the other as "Video Fan".
>=20
> The freeze only causes "Processor Fan" to run at maximum btw., "Video
> Fan" seems to be untouched. I don't get identical rpm values for both
> of them, so they are indeed 2 independent fans. E.g. at ~70=C2=B0C, I get
> 2300rpm for CPU and 2400rpm for Video. Looks good to me.
>=20
> Cheers,
> Tolga Cakir
>=20
> 2016-05-31 13:03 GMT+02:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> > Tolga, can you test this patch if is working for you correctly?
> >=20
> > On Saturday 21 May 2016 16:52:46 Pali Roh=C3=A1r wrote:
> >> Some Dell machines (e.g. Dell Precision M3800) have two fans,
> >> first with index=3D0 and second with index=3D2. So export also
> >> attributes for third fan device with index=3D2.
> >>=20
> >> Reported-by: Tolga Cakir <cevelnet@gmail.com>
> >> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >> ---
> >>=20
> >>  drivers/hwmon/dell-smm-hwmon.c |   20 +++++++++++++++++++-
> >>  1 file changed, 19 insertions(+), 1 deletion(-)
> >>=20
> >> ---
> >>=20
> >> Hi Tolga! Can you test this patch if sensors see fan device
> >> correctly?
> >>=20
> >> diff --git a/drivers/hwmon/dell-smm-hwmon.c
> >> b/drivers/hwmon/dell-smm-hwmon.c index 577445f..7a2764a 100644
> >> --- a/drivers/hwmon/dell-smm-hwmon.c
> >> +++ b/drivers/hwmon/dell-smm-hwmon.c
> >> @@ -78,6 +78,7 @@ static uint i8k_fan_max =3D I8K_FAN_HIGH;
> >>=20
> >>  #define I8K_HWMON_HAVE_TEMP4 (1 << 3)
> >>  #define I8K_HWMON_HAVE_FAN1  (1 << 4)
> >>  #define I8K_HWMON_HAVE_FAN2  (1 << 5)
> >>=20
> >> +#define I8K_HWMON_HAVE_FAN3  (1 << 6)
> >>=20
> >>  MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
> >>  MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
> >>=20
> >> @@ -246,7 +247,7 @@ static int _i8k_get_fan_type(int fan)
> >>=20
> >>  static int i8k_get_fan_type(int fan)
> >>  {
> >> =20
> >>       /* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache
> >>       values */
> >>=20
> >> -     static int types[2] =3D { INT_MIN, INT_MIN };
> >> +     static int types[3] =3D { INT_MIN, INT_MIN, INT_MIN };
> >>=20
> >>       if (types[fan] =3D=3D INT_MIN)
> >>      =20
> >>               types[fan] =3D _i8k_get_fan_type(fan);
> >>=20
> >> @@ -707,6 +708,12 @@ static SENSOR_DEVICE_ATTR(fan2_label,
> >> S_IRUGO, i8k_hwmon_show_fan_label, NULL,
> >>=20
> >>                         1);
> >> =20
> >>  static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
> >>  i8k_hwmon_show_pwm,
> >> =20
> >>                         i8k_hwmon_set_pwm, 1);
> >>=20
> >> +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO,
> >> i8k_hwmon_show_fan, NULL, +                       2);
> >> +static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO,
> >> i8k_hwmon_show_fan_label, NULL, +                       2);
> >> +static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
> >> i8k_hwmon_show_pwm, +                       i8k_hwmon_set_pwm,
> >> 2);
> >>=20
> >>  static struct attribute *i8k_attrs[] =3D {
> >> =20
> >>       &sensor_dev_attr_temp1_input.dev_attr.attr,     /* 0 */
> >>=20
> >> @@ -723,6 +730,9 @@ static struct attribute *i8k_attrs[] =3D {
> >>=20
> >>       &sensor_dev_attr_fan2_input.dev_attr.attr,      /* 11 */
> >>       &sensor_dev_attr_fan2_label.dev_attr.attr,      /* 12 */
> >>       &sensor_dev_attr_pwm2.dev_attr.attr,            /* 13 */
> >>=20
> >> +     &sensor_dev_attr_fan3_input.dev_attr.attr,      /* 14 */
> >> +     &sensor_dev_attr_fan3_label.dev_attr.attr,      /* 15 */
> >> +     &sensor_dev_attr_pwm3.dev_attr.attr,            /* 16 */
> >>=20
> >>       NULL
> >> =20
> >>  };
> >>=20
> >> @@ -747,6 +757,9 @@ static umode_t i8k_is_visible(struct kobject
> >> *kobj, struct attribute *attr,
> >>=20
> >>       if (index >=3D 11 && index <=3D 13 &&
> >>      =20
> >>           !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
> >>          =20
> >>               return 0;
> >>=20
> >> +     if (index >=3D 14 && index <=3D 16 &&
> >> +         !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
> >> +             return 0;
> >>=20
> >>       return attr->mode;
> >> =20
> >>  }
> >>=20
> >> @@ -788,6 +801,11 @@ static int __init i8k_init_hwmon(void)
> >>=20
> >>       if (err >=3D 0)
> >>      =20
> >>               i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;
> >>=20
> >> +     /* Third fan attributes, if fan status is OK */
> >> +     err =3D i8k_get_fan_status(2);
> >> +     if (err >=3D 0)
> >> +             i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
> >> +
> >>=20
> >>       i8k_hwmon_dev =3D hwmon_device_register_with_groups(NULL,
> >>       "dell_smm",
> >>      =20
> >>                                                         NULL, i8k_grou=
ps);
> >>      =20
> >>       if (IS_ERR(i8k_hwmon_dev)) {
> >=20
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3691199.9G3hEvVBGA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlde+tcACgkQi/DJPQPkQ1JpVQCgk76ybzlqApEgkIyRAZtwnXYU
4A8AoMMNqSj9jkPaztzrnXUr7BY8e/W5
=dDD1
-----END PGP SIGNATURE-----

--nextPart3691199.9G3hEvVBGA--
