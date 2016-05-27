Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Thorsten Leemhuis <fedora@leemhuis.info>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Fri, 27 May 2016 15:21:10 +0200
Cc: Jan C Peters <jcpeters89@gmail.com>,
 David
 =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com> <201605271245.47383@pali> <01084692-618a-31db-76f8-60176d1cd2cc@leemhuis.info>
In-Reply-To: <01084692-618a-31db-76f8-60176d1cd2cc@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1642232.Jl8UzZsv1J";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605271521.10294@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart1642232.Jl8UzZsv1J
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 27 May 2016 15:05:54 Thorsten Leemhuis wrote:
> Pali Roh=C3=A1r wrote on 27.05.2016 12:45:
> > [=E2=80=A6]
> > Looks like there are two different problems with dell-smm-hwmon
> > driver: 1) Fan speed going randomly up and down without system
> > freeze [=E2=80=A6]
> > So for problem 1) I need to know:
> >=20
> > * Is it regression? [=E2=80=A6]
>=20
> Yes, it is known to be a regression from f989e55452, as identified
> by Jan in https://bugzilla.kernel.org/show_bug.cgi?id=3D100121#c13
>=20
> I just verified and reverted that change on top of 4.6; the
> problem with the fan speed indeed goes away.

Ok, thanks for testing!

> So I tried a few things
> and came to the conclusion: the problem shows up as soon as
> i8k_get_fan_type() (introduced in f989e55452) is called somewhere.

So, once kernel call i8k_get_fan_type() function, then fan speed going=20
up/down? Even if it was called only at once? Can you confirm it? Caching=20
patch cause that for each fan that function is called exactly one time.

If this is problem, we can probably create DMI list of machines which do=20
not like i8k_get_fan_type() call and disable it for them.

To make sure that this is root of your problem, can you take some older=20
kernel version (where is i8k working fine) and try to patch+call that=20
i8k_get_fan_type() function? To check that something else cannot=20
interference with it...

> Find below the minimal patch I could come up to that makes the fan
> act normal on the Studio 8000 I have here (it's just meant as a
> reference and not meant to be applied, as it leaves unused functions
> around).

Patch just make sure that i8k_get_fan_type() is never called.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1642232.Jl8UzZsv1J
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldIScYACgkQi/DJPQPkQ1KDwQCgns3iN+KEW01C4tvfzKBPey/A
IPMAnjM4NXZWkw8pNF0FwjpBxPp1I57P
=H6mj
-----END PGP SIGNATURE-----

--nextPart1642232.Jl8UzZsv1J--
