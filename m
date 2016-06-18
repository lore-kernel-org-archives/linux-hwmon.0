Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/6] dell-smm-hwmon fixes
Date: Sat, 18 Jun 2016 17:26:00 +0200
Cc: Jean Delvare <jdelvare@suse.com>,
 Jan C Peters <jcpeters89@gmail.com>,
 Thorsten Leemhuis <fedora@leemhuis.info>,
 David
 =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>,
 Tolga Cakir <cevelnet@gmail.com>,
 "Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
 Mario_Limonciello@dell.com,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
 Dakota Whipple <dakotajaywhipple@gmail.com>,
 Leon Yu <leon@leonyu.net>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com> <57656537.3020904@roeck-us.net>
In-Reply-To: <57656537.3020904@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3371101.4lvI3NeiPb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606181726.01058@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart3371101.4lvI3NeiPb
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 18 June 2016 17:13:59 Guenter Roeck wrote:
> On 06/17/2016 03:54 PM, Pali Roh=C3=A1r wrote:
> > I'm sending all my dell-smm-hwmon patches in one series, because
> > due to changes in code other patches depends on previous.
> >=20
> > First two patches fixes problem with old /proc/i8k file. Second is
> > security fix and should be backported to all stable kernels (that
> > problem was there always). I tested i8kctl tool (from i8kutils
> > package) that it still works with these patches. Without root
> > access for those security operations just showes '?' or '-1'.
> >=20
> > Third and fourth patches try to fix problem on machines with broken
> > SMM/BIOS when calling function fan_type().
> >=20
> > Fifth is new feature and last sixth useful for debugging.
> >=20
> > Pali Roh=C3=A1r (6):
> >    hwmon: (dell-smm) Fail in ioctl I8K_BIOS_VERSION when bios
> >    version is
> >   =20
> >      not a number
> >   =20
> >    hwmon: (dell-smm) Restrict fan control and serial number to
> >   =20
> >      CAP_SYS_ADMIN by default
> >   =20
> >    hwmon: (dell-smm) Disallow fan_type() calls on broken machines
> >    hwmon: (dell-smm) Cache fan_type() calls and change fan
> >    detection hwmon: (dell-smm) Detect fan with index=3D2
> >    hwmon: (dell-smm) In debug mode log duration of SMM calls
> >  =20
> >   drivers/hwmon/dell-smm-hwmon.c |  122
> >   ++++++++++++++++++++++++++++++++-------- 1 file changed, 99
> >   insertions(+), 23 deletions(-)
>=20
> Pali,
>=20
> You asked for additional testing, so I am not sure what you expect me
> to do.
>=20
> Which of the patches can/should I apply now ?
>=20
> Guenter

Test 3/6 and 4/6 patches on affected Dell machines. I CCed all people=20
who tried to debug those bugs, so need confirmation from them that after=20
applying 3/6 and 4/6 patches, erratic fan behaviour is not there...

But because those two patches depends on previous, it is needed to test=20
whole series...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3371101.4lvI3NeiPb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldlaAkACgkQi/DJPQPkQ1IVbwCfQVWfMTeCk6r0aP4PcWmMjXp0
/zcAn2Kqpo6j/B5PwPCrNx+fph3C727d
=dYS7
-----END PGP SIGNATURE-----

--nextPart3371101.4lvI3NeiPb--
