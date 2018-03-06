Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33378 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753663AbeCFNFw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Mar 2018 08:05:52 -0500
Date: Tue, 6 Mar 2018 14:05:51 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au,
        andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
        jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180306130551.GA16061@amd>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <20180306125416.GD26143@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20180306125416.GD26143@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-03-06 13:54:16, Andrew Lunn wrote:
> On Tue, Mar 06, 2018 at 01:40:02PM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > > ---
> > >  .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++=
++++++++++
> > >  1 file changed, 73 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspee=
d.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b=
/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > > new file mode 100644
> > > index 000000000000..8a86f346d550
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > > @@ -0,0 +1,73 @@
> > > +Device tree configuration for PECI buses on the AST24XX and AST25XX =
SoCs.
> >=20
> > Are these SoCs x86-based?
>=20
> ARM, as far as i can tell. If i get the architecture correct, these
> are BMC, Board Management Controllers, looking after the main x86 CPU,
> stopping it overheating, controlling the power supplies, remote
> management, etc.

Ok, so with x86 machine, I get arm-based one for free. I get it. Is
user able to run his own kernel on the arm system, or is it locked
down, TiVo style?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqeki8ACgkQMOfwapXb+vLqygCglPEZOOQBA5q0Fn16vyQbhxrU
F6IAoI4+SNEpv1QvK+tYZlnVkaev34y6
=AFs6
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
