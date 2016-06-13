Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Thorsten Leemhuis <fedora@leemhuis.info>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Mon, 13 Jun 2016 20:30:14 +0200
Cc: Jan C Peters <jcpeters89@gmail.com>,
 David
 =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com> <201605271521.10294@pali> <b15e8039-f5e4-b373-7a0d-397a92f873b6@leemhuis.info>
In-Reply-To: <b15e8039-f5e4-b373-7a0d-397a92f873b6@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5756580.YL7Ru7Upol";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606132030.14769@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart5756580.YL7Ru7Upol
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 30 May 2016 13:45:51 Thorsten Leemhuis wrote:
> Pali Roh=C3=A1r wrote on 27.05.2016 15:21:
> > On Friday 27 May 2016 15:05:54 Thorsten Leemhuis wrote:
> >> Pali Roh=C3=A1r wrote on 27.05.2016 12:45:
> >> So I tried a few things
> >> and came to the conclusion: the problem shows up as soon as
> >> i8k_get_fan_type() (introduced in f989e55452) is called somewhere.
> >=20
> > So, once kernel call i8k_get_fan_type() function, then fan speed
> > going up/down?
>=20
> Yes.
>=20
> > To make sure that this is root of your problem, can you take some
> > older kernel version (where is i8k working fine) and try to
> > patch+call that i8k_get_fan_type() function? To check that
> > something else cannot interference with it...
>=20
> I just tried with 3.19.8 (had to install a older distro first :-/ ),
> where the problem does not show up (I verified just to be sure). Then
> I applied below patch and voila: the fan speed starts going up/down.
>=20
> IOW: From what I can see that SMM call that i8k_get_fan_type()
> triggers the problem on my Studio 8000
>=20
> CU, knurd
>=20

Thank you for your testing! I believe now we definitely know root of=20
this problem. It is buggy Dell BIOS/SMM code and we need to avoid=20
calling I8K_SMM_GET_FAN_TYPE on affected buggy Dell machines.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5756580.YL7Ru7Upol
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlde+7YACgkQi/DJPQPkQ1IAKgCfdm9fagkIg8OpI4hXcv3FSzoQ
17YAn1ZmX6QkcmtbNTdXR2zLYAuwUlzo
=3sxN
-----END PGP SIGNATURE-----

--nextPart5756580.YL7Ru7Upol--
