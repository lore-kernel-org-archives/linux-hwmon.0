Return-path: <broonie@sirena.org.uk>
Date: Fri, 9 Sep 2016 11:14:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Hoan Tran <hotran@apm.com>, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org,
	linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org
Message-ID: <20160909101407.GA27946@sirena.org.uk>
References: <E1biHa1-0004JG-Om@optimist>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <E1biHa1-0004JG-Om@optimist>
Subject: Re: next-20160909 build: 1 failures 0 warnings (next-20160909)
List-ID: <linux-hwmon@vger.kernel.org>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2016 at 09:54:37AM +0100, Build bot for Mark Brown wrote:

Since yesterday -next has been failing to build an arm64 allmodconfig
due to:

> 	arm64-allmodconfig
> ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!

caused by 05dbf57876b97d2 (hwmon: Add xgene hwmon driver).  That symbol
is not exported so can't be used from modules though I can't immediately
see how that module acquired a reference to that symbol.

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX0otuAAoJECTWi3JdVIfQJi8H/i7elA+l4xsjvXcvWJuRSgDC
8NwCycQeqFDXS0iBTO+etVNTuWzAjf2grABq3zhO5ddGt8cyV2PMXvZAc8G5UH0d
o6loLz/cTKpF+1F7X4BTggIC+Dz52XcllDA+o2QX7Yl/HyQGT1y+lpm0TZfP3eOX
TecdlSSAsBUOszMZfbqDwKCR30MNZh4D0RXXnX7PxKAlyE5n8jWDYjRsFsypbn3W
crSClncDWnTJI5DUDu4IAc984XGUlEbqv1i8hW4sKUAACjblOpmeGWvn62xjx0Dw
EmjA1U5QcMVpI74lS0fy3JAalqUoO76yQPa3dhmTB4qwf+Tf1lt9VT9hcT4DiGQ=
=h3PP
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
