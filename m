Return-path: <pali.rohar@gmail.com>
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use fan_status() for fan detection
Date: Mon, 13 Jun 2016 20:52:21 +0200
Cc: Jan C Peters <jcpeters89@gmail.com>,
 Thorsten Leemhuis <fedora@leemhuis.info>,
 David
 =?utf-8?q?Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>,
 Peter Saunderson <peteasa@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Tolga Cakir <cevelnet@gmail.com>,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com> <5740FB24.80709@roeck-us.net> <201605220228.00665@pali>
In-Reply-To: <201605220228.00665@pali>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7300933.ZATM7qx9DN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201606132052.22116@pali>
List-ID: <linux-hwmon@vger.kernel.org>

--nextPart7300933.ZATM7qx9DN
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 May 2016 02:28:00 Pali Roh=C3=A1r wrote:
> On Sunday 22 May 2016 02:19:48 Guenter Roeck wrote:
> > On 05/21/2016 07:46 AM, Pali Roh=C3=A1r wrote:
> > > On more Dell machines (e.g. Dell Precision M3800)
> > > I8K_SMM_GET_FAN_TYPE call is too expensive (CPU is too long in
> > > SMM mode) and cause kernel to hang. This patch cache type for
> > > each fan (as it should not change) and change the way how fan
> > > presense is detected. It revert and use function fan_status() as
> > > was before commit f989e55452c7 ("i8k: Add support for fan
> > > labels").
> > >=20
> > > Moreover, kernel hangs for 2 - 3 seconds only sometimes and only
> > > on some Dell machines. When kernel hangs fan speed is at max. So
> > > it was hard to debug and bisect where is root of this problem.
> > > It looks like this is bug in Dell BIOS which implement fan type
> > > SMM code... and there is no way how to fix it in kernel.
> > >=20
> > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > > Reported-and-tested-by: Tolga Cakir <cevelnet@gmail.com>
> > > Fixes: f989e55452c7 ("i8k: Add support for fan labels")
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D112021
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D100121
> > > Cc: stable@vger.kernel.org # v4.0+, will need backport
> >=20
> > Should this patch be applied, or do you wait for more testing ?
>=20
> I would like to hear some confirmation from people with affected
> machine.
>=20

Ok, now after testing we know that kernel should prevent calling=20
I8K_SMM_GET_FAN_TYPE on affected buggy Dell machines.

Looks like there are two different bugs in Dell SMM with=20
I8K_SMM_GET_FAN_TYPE call.

=46irst bug cause that kernel freeze for 2 - 3 seconds when=20
I8K_SMM_GET_FAN_TYPE is issued.

Second bug cause that fan goes randomly up and down (that is controlled=20
by Dell SMM) when I8K_SMM_GET_FAN_TYPE is issued. Normal behaviour is=20
returned after machine reboots.

Some Dell machines are affected by first bug, some by second bug. And=20
there are Dell machines without both bugs.

This my patch just partially fix first bug and prevent calling that call=20
at boot time. But can be issued by sysfs (+value is cached, so it is=20
called only once).

So question is: is my patch enough for fixing first bug?

And second question: how to fix second bug? I see only one option:=20
Create machine blacklist with broken Dell SMM firmware and disallow=20
calling I8K_SMM_GET_FAN_TYPE for them.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart7300933.ZATM7qx9DN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldfAOYACgkQi/DJPQPkQ1L/ywCgnOcFahpon09OZjfn4mWAHmyI
Jv4AoJcy+ADFQz8697sbfmkr777o8whX
=85pj
-----END PGP SIGNATURE-----

--nextPart7300933.ZATM7qx9DN--
