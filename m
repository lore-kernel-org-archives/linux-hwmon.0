Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34631 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752157AbcE0Kpu (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 27 May 2016 06:45:50 -0400
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Thorsten Leemhuis <fedora@leemhuis.info>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Fri, 27 May 2016 12:45:47 +0200
Cc: Jan C Peters <jcpeters89@gmail.com>,
	David =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com> <20160527094736.GL29844@pali> <10b66444-9405-9d4c-b1ec-ce57f7e8420f@leemhuis.info>
In-Reply-To: <10b66444-9405-9d4c-b1ec-ce57f7e8420f@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3614670.SnfDAGJEmL";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605271245.47383@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--nextPart3614670.SnfDAGJEmL
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 27 May 2016 12:01:21 Thorsten Leemhuis wrote:
> Pali Roh=C3=A1r wrote on 27.05.2016 11:47:
> > [=E2=80=A6]
> > I do not see any long taking SMM call here. Are you really sure
> > that your machine freeze when loading or using dell-smm-hwmon?
>=20
> Uhh, sorry, it seems something got mixed up somewhere. As mentioned
> earlier in this thread already: The Studio XPS 8000 I have here never
> froze when loading or using dell-smm-hwmon. I only saw its CPU fan
> speed going up and down as described in
> https://bugzilla.kernel.org/show_bug.cgi?id=3D100121 From the mail that
> started this thread I got the impression that all those problems are
> all related somehow, so I went testing the patch as asked.

Looks like there are two different problems with dell-smm-hwmon driver:

1) Fan speed going randomly up and down without system freeze

2) System freeze at boot time and at that time fan speed goes up

I though that problem with fan speed is SMM freeze, but from your log I=20
see that it is not truth. And my patch seems to fix problem 2).

So for problem 1) I need to know:

* Is it regression? I.e. is there kernel version under which i8k (or=20
dell-smm-hwmon) is working?

* If it is regression, then I need somebody to fully fully bisect=20
problematic commit. And then starts reverting it on top of new kernel=20
versions (to check that only that commit cause problem 1)).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3614670.SnfDAGJEmL
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldIJVsACgkQi/DJPQPkQ1Lx/gCdF7UqcL3TJS8qVtdEC4LEXDbI
UbIAmwdlJoesie7RJm5SAvMbjfpmEQOC
=aGF2
-----END PGP SIGNATURE-----

--nextPart3614670.SnfDAGJEmL--
