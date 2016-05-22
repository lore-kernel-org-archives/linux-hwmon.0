Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35886 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752015AbcEVPTc (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 11:19:32 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dell-smm-hwmon: Detect fan with index=2
Date: Sun, 22 May 2016 17:19:28 +0200
Cc: Jean Delvare <jdelvare@suse.com>, Tolga Cakir <cevelnet@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1463842366-17964-1-git-send-email-pali.rohar@gmail.com> <201605220231.12951@pali> <5741CC16.1000909@roeck-us.net>
In-Reply-To: <5741CC16.1000909@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1780021.j1l0nz3Tl0";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605221719.28263@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart1780021.j1l0nz3Tl0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 May 2016 17:11:18 Guenter Roeck wrote:
> On 05/21/2016 05:31 PM, Pali Roh=C3=A1r wrote:
> > On Sunday 22 May 2016 02:21:46 Guenter Roeck wrote:
> >> On 05/21/2016 07:52 AM, Pali Roh=C3=A1r wrote:
> >>> Some Dell machines (e.g. Dell Precision M3800) have two fans,
> >>> first with index=3D0 and second with index=3D2. So export also
> >>> attributes for third fan device with index=3D2.
> >>>=20
> >>> Reported-by: Tolga Cakir <cevelnet@gmail.com>
> >>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >>> ---
> >>>=20
> >>>    drivers/hwmon/dell-smm-hwmon.c |   20 +++++++++++++++++++-
> >>>    1 file changed, 19 insertions(+), 1 deletion(-)
> >>>=20
> >>> ---
> >>>=20
> >>> Hi Tolga! Can you test this patch if sensors see fan device
> >>> correctly?
> >>=20
> >> I assume this means I should wait for test results before applying
> >> the patch ?
> >=20
> > Yes, testing should be done.
> >=20
> > Do you have some pending/testing/next tree/branch for such patches?
>=20
> I have a hwmon-staging branch. I added your patches to it.
>=20
> Please use "hwmon: (dell-smm)" in the subject line of your patches.
> The subsystem name should come first, the driver name in () is a
> hwmon idiosyncrasy, and we don't need to repeat the "hwmon".

Ok, I use generic "driver_name: description" pattern as each subsystem=20
use different format. But I can send in above format future hwmon=20
patches...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1780021.j1l0nz3Tl0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldBzgAACgkQi/DJPQPkQ1K3iQCgiWklmLqlpIQu84cl5iFH5e3a
w3AAoKmOIzRRc20NsjnE65TBZ707nh+3
=tZOD
-----END PGP SIGNATURE-----

--nextPart1780021.j1l0nz3Tl0--
