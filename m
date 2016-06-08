Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35633 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755091AbcFHSKm (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jun 2016 14:10:42 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>
Subject: Re: dell-smm-hwmon: security problems
Date: Wed, 8 Jun 2016 20:10:38 +0200
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <201606081157.22900@pali> <20160608173743.GA16615@roeck-us.net> <b8de6dc0-acfd-3b5f-e57f-9608dc145008@gmail.com>
In-Reply-To: <b8de6dc0-acfd-3b5f-e57f-9608dc145008@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2652676.EOyWsnuvs9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606082010.38489@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart2652676.EOyWsnuvs9
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 08 June 2016 19:54:35 Austin S. Hemmelgarn wrote:
> On 2016-06-08 13:37, Guenter Roeck wrote:
> > On Wed, Jun 08, 2016 at 03:55:48PM +0200, Pali Roh=C3=A1r wrote:
> >> On Wednesday 08 June 2016 15:24:10 Guenter Roeck wrote:
> >>> On 06/08/2016 02:57 AM, Pali Roh=C3=A1r wrote:
> >>>> Hello!
> >>>>=20
> >>>> Mario wrote me about two I think security problems in
> >>>> dell-smm-hwmon driver and I would like to ask you, how to fix
> >>>> them.
> >>>>=20
> >>>> 1) File /proc/i8k (exists only when kernel is compiled with
> >>>> CONFIG_I8K) exports DMI_PRODUCT_SERIAL and it can be read by
> >>>> ordinary user, without root permission. Normally
> >>>> DMI_PRODUCT_SERIAL can be read from sysfs file
> >>>> /sys/class/dmi/id/product_serial but only by root user.
> >>>>=20
> >>>> 2) Via /proc/i8k ordinary user can set fan speed. This is
> >>>> because how "restricted" parameter and variable works. Setting
> >>>> fan speed by normal non-root user can be dangerous, e.g.
> >>>> malicious application under user "nobody" could take control of
> >>>> fans.
> >>>>=20
> >>>> Do you have idea how to fix these problems? Just to note that
> >>>> /proc/i8k has stable kernel ABI and changing it will break all
> >>>> existing i8k* applications. But /proc/i8k is there only for old
> >>>> legacy laptops (year 2000).
> >>>>=20
> >>>> There is module parameter "restricted" with default value false
> >>>> and description: "Allow fan control if SYS_ADMIN capability
> >>>> set".
> >>>>=20
> >>>> Current code do:
> >>>> 	case I8K_SET_FAN:
> >>>> 		if (restricted && !capable(CAP_SYS_ADMIN))
> >>>> 	=09
> >>>> 			return -EPERM;
> >>>>=20
> >>>> For me description is a bit ambiguous. What about setting
> >>>> "restricted" by default to true and updating description to
> >>>> something like this?
> >>>>=20
> >>>> "Disallow fan control when SYS_ADMIN capability is not set
> >>>> (default: 1)"
> >>>=20
> >>> Sure. I am sure that someone will complain (we learned just
> >>> recently that people still use the old commands, after all), but
> >>> then the old behavior can be restored by setting the flag to 0.
> >>=20
> >> Either setting that flag to 0 or running that tool under root or
> >> with capability CAP_SYS_ADMIN.
> >>=20
> >>> I would not use a double negative to describe it. Why not just
> >>> something like "Allow fan control only if SYS_ADMIN capability
> >>> set (default 1)" ?
> >>=20
> >> I was thinking about that description too, but there is problem
> >> with meaning too...
> >>=20
> >> 0 means fan control is allowed for any user
> >> 1 means fan control is allowed only for CAP_SYS_ADMIN
> >>=20
> >> Description should be unambiguous for situation when flag is set
> >> to 0.
> >=20
> > Sorry, I don't understand how a double negation "disallow ... if
> > not set" would make things less ambiguous than "allow ... only if
> > set".
>=20
> Double negatives become ambiguous when you start to deal with the
> possibility of translation or working with people who are not native
> speakers of the language in question.  In English they're
> traditionally considered bad grammar, while in most other languages
> they are used for emphasis and nothing else, and thus are considered
> by some people to be bad form in technical documentation.
>=20
> Given this particular case, it would probably be the least ambiguous
> to say: Restrict fan control to CAP_SYS_ADMIN

Thank you, this is really better!

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2652676.EOyWsnuvs9
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldYX54ACgkQi/DJPQPkQ1KY8gCgkVNTO7NV8bEr8U61Ggbuuwie
/H8AoML3orqcJOpiFPbNCVu9kDclRfrO
=GCOL
-----END PGP SIGNATURE-----

--nextPart2652676.EOyWsnuvs9--
