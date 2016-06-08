Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Mario_Limonciello@dell.com,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: dell-smm-hwmon: security problems
Date: Wed, 8 Jun 2016 11:57:22 +0200
Cc: linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3447391.dsiW97AAf5";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606081157.22900@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart3447391.dsiW97AAf5
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Mario wrote me about two I think security problems in dell-smm-hwmon=20
driver and I would like to ask you, how to fix them.

1) File /proc/i8k (exists only when kernel is compiled with CONFIG_I8K)=20
exports DMI_PRODUCT_SERIAL and it can be read by ordinary user, without=20
root permission. Normally DMI_PRODUCT_SERIAL can be read from sysfs file=20
/sys/class/dmi/id/product_serial but only by root user.

2) Via /proc/i8k ordinary user can set fan speed. This is because how=20
"restricted" parameter and variable works. Setting fan speed by normal=20
non-root user can be dangerous, e.g. malicious application under user=20
"nobody" could take control of fans.

Do you have idea how to fix these problems? Just to note that /proc/i8k=20
has stable kernel ABI and changing it will break all existing i8k*=20
applications. But /proc/i8k is there only for old legacy laptops (year=20
2000).

There is module parameter "restricted" with default value false and=20
description: "Allow fan control if SYS_ADMIN capability set". Current=20
code do:

	case I8K_SET_FAN:
		if (restricted && !capable(CAP_SYS_ADMIN))
			return -EPERM;

=46or me description is a bit ambiguous. What about setting "restricted"=20
by default to true and updating description to something like this?

"Disallow fan control when SYS_ADMIN capability is not set (default: 1)"

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3447391.dsiW97AAf5
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAldX7AIACgkQi/DJPQPkQ1IpFgCgzBeTcJe89z9OUxMmUQ8ZF/qI
JuYAmL//HX6YY3rWHdEBWY8aNz2ks6s=
=4fEr
-----END PGP SIGNATURE-----

--nextPart3447391.dsiW97AAf5--
