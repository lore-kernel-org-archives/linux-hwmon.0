Return-path: <broonie@sirena.org.uk>
Date: Tue, 29 Mar 2016 15:29:27 -0700
From: Mark Brown <broonie@kernel.org>
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: Guenter Roeck <linux@roeck-us.net>, lee.jones@linaro.org,
	linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, lgirdwood@gmail.com
Message-ID: <20160329222927.GS2350@sirena.org.uk>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-8-git-send-email-tthayer@opensource.altera.com>
 <20160329201648.GA30248@roeck-us.net>
 <56FAF70D.4010109@opensource.altera.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wKbYzd8t8rt1PVqr"
Content-Disposition: inline
In-Reply-To: <56FAF70D.4010109@opensource.altera.com>
Subject: Re: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
List-ID: <linux-hwmon@vger.kernel.org>


--wKbYzd8t8rt1PVqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 29, 2016 at 04:43:41PM -0500, Thor Thayer wrote:

> Yes, I see your point. In looking at the regulator drivers, I interpret
> those as being controlled by the driver whereas this chip is passively
> reporting status.

If the device isn't doing regulation it's not a regulator.

> After reading the referenced document, I agree that hwmon probably isn't
> appropriate. However, the regulator doesn't seem appropriate either (the
> only status appears to be tied to battery properties).

We report status for regulators but that's tied to monitoring that's
built into a device that does regulation.

How about IIO or power supply?

--wKbYzd8t8rt1PVqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW+wHGAAoJECTWi3JdVIfQU6EH/0lenHgC0Sa1yadZvkoLzETz
n7bhGzHq9X9kXQ+s0F9GnKbzGJuK2bolxVm6+QaO37J6wzNAMtX9PDKpWHOZpzxn
GEAPys0I++0cPCTsP08Rf6F+LGv3j7bjX+/GRGktjjf+aN7b8UKCD0OiiI8rpPFN
90OfC2PQjQ86o9Mh2WcXfIkecqCF5qBLree3wrmAVJOjL+mFjyO5CER57SunYSuJ
gtdguP6jwddoizhiOq0XhM6eKIhNqOgTwOWCnzAU65B1cSgbGE+jDecWHNAa2NaI
shzw9eMgmahJ/LyV0wleV/i5d51LFMMFpJsQNGWLJqhSCG7iqKrNnaMf3WxJH+E=
=4hgU
-----END PGP SIGNATURE-----

--wKbYzd8t8rt1PVqr--
