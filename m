Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35215 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbcFRWoY (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 18:44:24 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Leon Yu <leon@leonyu.net>
Subject: Re: [PATCH 0/6] dell-smm-hwmon fixes
Date: Sun, 19 Jun 2016 00:44:20 +0200
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	David =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com> <57657CE2.6040107@roeck-us.net> <CA+vQ2zCoGhLT2PUUhcuggJ3oE9Z6vfUW=Z1wgm8Ozz3XdnQoxA@mail.gmail.com>
In-Reply-To: <CA+vQ2zCoGhLT2PUUhcuggJ3oE9Z6vfUW=Z1wgm8Ozz3XdnQoxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1783281.23akJLct6X";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606190044.21035@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart1783281.23akJLct6X
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for testing! It took too long, but bugs in vendor SMM code are=20
hard to detect and probably impossible to fix. So I would call this=20
patch just as "workaround" and not proper bug fix...

On Saturday 18 June 2016 23:58:19 Leon Yu wrote:
> Just installed on "Inspiron 580", appears to have fixed the problem.
>=20
> On Sat, Jun 18, 2016 at 12:54 PM, Guenter Roeck <linux@roeck-us.net>
> wrote:
> > On 06/18/2016 08:26 AM, Pali Roh=C3=A1r wrote:
> >> On Saturday 18 June 2016 17:13:59 Guenter Roeck wrote:
> >>> On 06/17/2016 03:54 PM, Pali Roh=C3=A1r wrote:
> >>>> I'm sending all my dell-smm-hwmon patches in one series, because
> >>>> due to changes in code other patches depends on previous.
> >>>>=20
> >>>> First two patches fixes problem with old /proc/i8k file. Second
> >>>> is security fix and should be backported to all stable kernels
> >>>> (that problem was there always). I tested i8kctl tool (from
> >>>> i8kutils package) that it still works with these patches.
> >>>> Without root access for those security operations just showes
> >>>> '?' or '-1'.
> >>>>=20
> >>>> Third and fourth patches try to fix problem on machines with
> >>>> broken SMM/BIOS when calling function fan_type().
> >>>>=20
> >>>> Fifth is new feature and last sixth useful for debugging.
> >>>>=20
> >>>> Pali Roh=C3=A1r (6):
> >>>>     hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios
> >>>>     version is
> >>>>    =20
> >>>>       not a number
> >>>>    =20
> >>>>     hwmon: (dell-smm) Restrict fan control and serial number to
> >>>>    =20
> >>>>       CAP_SYS_ADMIN by default
> >>>>    =20
> >>>>     hwmon: (dell-smm) Disallow fan_type() calls on broken
> >>>>     machines hwmon: (dell-smm) Cache fan_type() calls and
> >>>>     change fan detection hwmon: (dell-smm) Detect fan with
> >>>>     index=3D2 hwmon: (dell-smm) In debug mode log duration of SMM
> >>>>     calls
> >>>>   =20
> >>>>    drivers/hwmon/dell-smm-hwmon.c |  122
> >>>>    ++++++++++++++++++++++++++++++++-------- 1 file changed, 99
> >>>>    insertions(+), 23 deletions(-)
> >>>=20
> >>> Pali,
> >>>=20
> >>> You asked for additional testing, so I am not sure what you
> >>> expect me to do.
> >>>=20
> >>> Which of the patches can/should I apply now ?
> >>>=20
> >>> Guenter
> >>=20
> >> Test 3/6 and 4/6 patches on affected Dell machines. I CCed all
> >> people who tried to debug those bugs, so need confirmation from
> >> them that after applying 3/6 and 4/6 patches, erratic fan
> >> behaviour is not there...
> >>=20
> >> But because those two patches depends on previous, it is needed to
> >> test whole series...
> >>=20
> >> This doesn't tell me which patches to apply now. The first two ?
> >=20
> > Guenter

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1783281.23akJLct6X
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldlzsUACgkQi/DJPQPkQ1JMlwCgtPA6R8YyjfC3fMkwTWqkIIQy
ykQAnRwtuar/hy0bfCjTFEc5hhm6ez05
=Ld0Y
-----END PGP SIGNATURE-----

--nextPart1783281.23akJLct6X--
