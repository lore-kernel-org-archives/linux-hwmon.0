Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36130 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147AbcFRWrA (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 18 Jun 2016 18:47:00 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/6] hwmon: (dell-smm) Disallow fan_type() calls on broken machines
Date: Sun, 19 Jun 2016 00:46:57 +0200
Cc: Jean Delvare <jdelvare@suse.com>,
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
	Leon Yu <leon@leonyu.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com> <1466204089-17030-4-git-send-email-pali.rohar@gmail.com> <5765AA31.8010202@roeck-us.net>
In-Reply-To: <5765AA31.8010202@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5780907.ZJgZe51igl";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606190046.57390@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart5780907.ZJgZe51igl
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 18 June 2016 22:08:17 Guenter Roeck wrote:
> On 06/17/2016 03:54 PM, Pali Roh=C3=A1r wrote:
> > Some Dell machines have especially broken SMM or BIOS which cause
> > that once fan_type() is called then CPU fan speed going randomly
> > up and down. And for fixing this behaviour reboot is required.
> >=20
> > So this patch creates fan_type blacklist of affected Dell machines
> > and disallow fan_type() call on them to prevent that erratic
> > behaviour.
> >=20
> > Old blacklist which disabled loading driver on some machines added
> > in commits a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio
> > XPS 8100") and 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell
> > Studio XPS 8000") were moved to FAN_TYPE blacklist.
> >=20
> > Reported-by: Jan C Peters <jcpeters89@gmail.com>
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D100121
> > Cc: stable@vger.kernel.org # v4.0+, will need backport
>=20
> Applied.
>=20
> It seemed worthwhile to apply this patch now, without waiting for
> further test feedback, since it at least reduces the impact of the
> observed problems. If follow-up changes are necessary, those will
> have to be applied in separate patches.
>=20
> Guenter

Ok. Meanwhile patch was tested on Inspiron 580, so maybe it could be=20
appended into commit message.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5780907.ZJgZe51igl
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldlz2EACgkQi/DJPQPkQ1L/DACfX7tv009c7ameStDyxCMQ4Vgt
soEAoKiElMAmQXNm0aWVj0/OciWW1q1W
=XEeL
-----END PGP SIGNATURE-----

--nextPart5780907.ZJgZe51igl--
