Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Thorsten Leemhuis <fedora@leemhuis.info>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Thu, 26 May 2016 17:51:47 +0200
Cc: Jan C Peters <jcpeters89@gmail.com>,
 David
 =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com> <2fc3a0a0-950d-845c-200d-7a89b57270f6@leemhuis.info>
In-Reply-To: <2fc3a0a0-950d-845c-200d-7a89b57270f6@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1673758.APgfVqGZLz";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605261751.47334@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart1673758.APgfVqGZLz
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 26 May 2016 17:39:57 Thorsten Leemhuis wrote:
> > I need to know if this patch fixes problem on Dell Studio XPS 8000
> > and Dell Studio XPS 8100 machines, so we can revert git commits:
> > 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000")
> > a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")
>=20
> Just checked: Sorry, that patch did not fix the CPU fan speed issue
> on my XPS 8000, so there is afaics no reason to revert 6220f4ebd7b4
> :-/

Please, can you apply patch "dell-smm-hwmon: In debug mode log duration=20
of SMM calls" and compile dell-smm-hwmon in debug mode to tell us which=20
SMM call takes too long? This is probably they key for that XPS=20
problems...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1673758.APgfVqGZLz
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldHG5MACgkQi/DJPQPkQ1IA3wCbBq13Mv8GGjUBBtg813CldHnc
nr8AmgLjTW+grzXNyGeKvMQ0vHIlxfaL
=ROCl
-----END PGP SIGNATURE-----

--nextPart1673758.APgfVqGZLz--
