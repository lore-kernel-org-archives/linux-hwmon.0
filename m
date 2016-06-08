Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: dell-smm-hwmon: security problems
Date: Wed, 8 Jun 2016 15:55:48 +0200
Cc: Jean Delvare <jdelvare@suse.com>,
 Mario_Limonciello@dell.com,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <201606081157.22900@pali> <57581C7A.30308@roeck-us.net>
In-Reply-To: <57581C7A.30308@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1814430.YnIPiG3Xr8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606081555.48907@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart1814430.YnIPiG3Xr8
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 08 June 2016 15:24:10 Guenter Roeck wrote:
> On 06/08/2016 02:57 AM, Pali Roh=C3=A1r wrote:
> > Hello!
> >=20
> > Mario wrote me about two I think security problems in
> > dell-smm-hwmon driver and I would like to ask you, how to fix
> > them.
> >=20
> > 1) File /proc/i8k (exists only when kernel is compiled with
> > CONFIG_I8K) exports DMI_PRODUCT_SERIAL and it can be read by
> > ordinary user, without root permission. Normally
> > DMI_PRODUCT_SERIAL can be read from sysfs file
> > /sys/class/dmi/id/product_serial but only by root user.
> >=20
> > 2) Via /proc/i8k ordinary user can set fan speed. This is because
> > how "restricted" parameter and variable works. Setting fan speed
> > by normal non-root user can be dangerous, e.g. malicious
> > application under user "nobody" could take control of fans.
> >=20
> > Do you have idea how to fix these problems? Just to note that
> > /proc/i8k has stable kernel ABI and changing it will break all
> > existing i8k* applications. But /proc/i8k is there only for old
> > legacy laptops (year 2000).
> >=20
> > There is module parameter "restricted" with default value false and
> > description: "Allow fan control if SYS_ADMIN capability set".
> > Current code do:
> >
> > 	case I8K_SET_FAN:
> > 		if (restricted && !capable(CAP_SYS_ADMIN))
> > 			return -EPERM;
> >=20
> > For me description is a bit ambiguous. What about setting
> > "restricted" by default to true and updating description to
> > something like this?
> >=20
> > "Disallow fan control when SYS_ADMIN capability is not set
> > (default: 1)"
>=20
> Sure. I am sure that someone will complain (we learned just recently
> that people still use the old commands, after all), but then the old
> behavior can be restored by setting the flag to 0.

Either setting that flag to 0 or running that tool under root or with=20
capability CAP_SYS_ADMIN.

> I would not use a double negative to describe it. Why not just
> something like "Allow fan control only if SYS_ADMIN capability set
> (default 1)" ?

I was thinking about that description too, but there is problem with=20
meaning too...

0 means fan control is allowed for any user
1 means fan control is allowed only for CAP_SYS_ADMIN

Description should be unambiguous for situation when flag is set to 0.

=3D=3D=3D

And do you have idea what to do with problem 1)?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1814430.YnIPiG3Xr8
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldYI+QACgkQi/DJPQPkQ1IDAgCeKtPPHQfON8ZZhtr/Sk98rBFV
f7IAn3Kk0sjUay9bY7Sl83X7sqEJe99C
=WyAp
-----END PGP SIGNATURE-----

--nextPart1814430.YnIPiG3Xr8--
