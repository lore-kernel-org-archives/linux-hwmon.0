Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Sun, 22 May 2016 02:28:00 +0200
Cc: Jan C Peters <jcpeters89@gmail.com>,
 Thorsten Leemhuis <fedora@leemhuis.info>,
 David
 =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com> <5740FB24.80709@roeck-us.net>
In-Reply-To: <5740FB24.80709@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart91500279.fPVsvfsBiZ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201605220228.00665@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart91500279.fPVsvfsBiZ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 May 2016 02:19:48 Guenter Roeck wrote:
> On 05/21/2016 07:46 AM, Pali Roh=C3=A1r wrote:
> > On more Dell machines (e.g. Dell Precision M3800)
> > I8K_SMM_GET_FAN_TYPE call is too expensive (CPU is too long in SMM
> > mode) and cause kernel to hang. This patch cache type for each fan
> > (as it should not change) and change the way how fan presense is
> > detected. It revert and use function fan_status() as was before
> > commit f989e55452c7 ("i8k: Add support for fan labels").
> >=20
> > Moreover, kernel hangs for 2 - 3 seconds only sometimes and only on
> > some Dell machines. When kernel hangs fan speed is at max. So it
> > was hard to debug and bisect where is root of this problem. It
> > looks like this is bug in Dell BIOS which implement fan type SMM
> > code... and there is no way how to fix it in kernel.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Reported-and-tested-by: Tolga Cakir <cevelnet@gmail.com>
> > Fixes: f989e55452c7 ("i8k: Add support for fan labels")
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D112021
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D100121
> > Cc: stable@vger.kernel.org # v4.0+, will need backport
>=20
> Should this patch be applied, or do you wait for more testing ?

I would like to hear some confirmation from people with affected machine.

> Guenter
>=20
> > ---
> >=20
> >   drivers/hwmon/dell-smm-hwmon.c |   21 ++++++++++++++++-----
> >   1 file changed, 16 insertions(+), 5 deletions(-)
> >=20
> > ---
> >=20
> > Hi!
> >=20
> > Jan C Peters, Thorsten Leemhuis, David Santamar=C3=ADa Rogado, Peter
> > Saunderson and others, can you test this patch if it fixes your
> > freeze problem at boottime and when using "sensors" program?
> >=20
> > I need to know if this patch fixes problem on Dell Studio XPS 8000
> > and Dell Studio XPS 8100 machines, so we can revert git commits:
> >=20
> > 6220f4ebd7b4 ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8000")
> > a4b45b25f18d ("hwmon: (dell-smm) Blacklist Dell Studio XPS 8100")
> >=20
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c
> > b/drivers/hwmon/dell-smm-hwmon.c index c43318d..577445f 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -235,7 +235,7 @@ static int i8k_get_fan_speed(int fan)
> >=20
> >   /*
> >  =20
> >    * Read the fan type.
> >    */
> >=20
> > -static int i8k_get_fan_type(int fan)
> > +static int _i8k_get_fan_type(int fan)
> >=20
> >   {
> >  =20
> >   	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_FAN_TYPE, };
> >=20
> > @@ -243,6 +243,17 @@ static int i8k_get_fan_type(int fan)
> >=20
> >   	return i8k_smm(&regs) ? : regs.eax & 0xff;
> >  =20
> >   }
> >=20
> > +static int i8k_get_fan_type(int fan)
> > +{
> > +	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
> > +	static int types[2] =3D { INT_MIN, INT_MIN };
> > +
> > +	if (types[fan] =3D=3D INT_MIN)
> > +		types[fan] =3D _i8k_get_fan_type(fan);
> > +
> > +	return types[fan];
> > +}
> > +
> >=20
> >   /*
> >  =20
> >    * Read the fan nominal rpm for specific fan speed.
> >    */
> >=20
> > @@ -767,13 +778,13 @@ static int __init i8k_init_hwmon(void)
> >=20
> >   	if (err >=3D 0)
> >   =09
> >   		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
> >=20
> > -	/* First fan attributes, if fan type is OK */
> > -	err =3D i8k_get_fan_type(0);
> > +	/* First fan attributes, if fan status is OK */
> > +	err =3D i8k_get_fan_status(0);
> >=20
> >   	if (err >=3D 0)
> >   =09
> >   		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN1;
> >=20
> > -	/* Second fan attributes, if fan type is OK */
> > -	err =3D i8k_get_fan_type(1);
> > +	/* Second fan attributes, if fan status is OK */
> > +	err =3D i8k_get_fan_status(1);
> >=20
> >   	if (err >=3D 0)
> >   =09
> >   		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;


=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart91500279.fPVsvfsBiZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldA/RAACgkQi/DJPQPkQ1ILXACfRSAb2c5ICl9Lrj/Co3oTkAXf
frMAn1C1METnDbJLFKY+WMUfL5/8GauG
=YMnh
-----END PGP SIGNATURE-----

--nextPart91500279.fPVsvfsBiZ--
