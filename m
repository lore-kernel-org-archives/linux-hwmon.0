Return-Path: <sebastian.reichel@collabora.co.uk>
Return-path: <sebastian.reichel@collabora.co.uk>
Date: Tue, 29 Aug 2017 14:51:13 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
To: Lee Jones <lee.jones@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and HWMON due for the
 v4.14 merge window
Message-ID: <20170829125113.g74twfnahomtdr2x@earth>
References: <20170821145404.18902-1-sebastian.reichel@collabora.co.uk>
 <20170822074741.jjynyudbfgzsl7ju@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32kfez3r5z65nnkh"
Content-Disposition: inline
In-Reply-To: <20170822074741.jjynyudbfgzsl7ju@dell>
List-ID: <linux-hwmon@vger.kernel.org>


--32kfez3r5z65nnkh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

I noticed, that you did not yet push out your for-mfd-next branch,
so the patches did not yet appear in linux-next. Was this
intentional?

-- Sebastian

On Tue, Aug 22, 2017 at 08:47:41AM +0100, Lee Jones wrote:
> Enjoy!
>=20
> The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba208=
77:
>=20
>   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-hwmon-=
v4.14
>=20
> for you to fetch changes up to 4f16cab19a3d57638dd5d962ff6e87c154a6cab2:
>=20
>   hwmon: da9052: Add support for TSI channel (2017-08-22 08:45:02 +0100)
>=20
> ----------------------------------------------------------------
> Immutable branch between MFD and HWMON due for the v4.14 merge window
>=20
> ----------------------------------------------------------------
> Sebastian Reichel (4):
>       mfd: da9052: Add register details for TSI
>       hwmon: da9052: Replace S_IRUGO with 0444
>       mfd: da9052: Make touchscreen registration optional
>       hwmon: da9052: Add support for TSI channel
>=20
>  drivers/hwmon/da9052-hwmon.c      | 285 ++++++++++++++++++++++++++++++++=
+++---
>  drivers/mfd/da9052-core.c         |  26 +++-
>  include/linux/mfd/da9052/da9052.h |   6 +
>  include/linux/mfd/da9052/reg.h    |  11 +-
>  4 files changed, 302 insertions(+), 26 deletions(-)
> =20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

--32kfez3r5z65nnkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlmlY0EACgkQ2O7X88g7
+prGsA//VLzQS4LiInDkts4DUZux0zGKbygYtB7GrZGskFSWp77KEsRQ69gz5/HP
GimaTY2u25hzSqTknOToQXtUVFc8JMfz19rfNXeS1nD71DANxWQXsGcYIF9fuS4r
JDcXTTAQCyPWhIYW/c7idmvNn9cLDz4cVUBkTt9DE7Jdsfrl5Vc4mH+yfFyIlc3O
5AKOjBSmdJreyvAoSddL7P++z3Gph/yga2SPrVkCWbtnzUHDLilQaA65duDdOR48
GMupHAlblU4WdEAbt1urQrHqQKdY7QsJDubocYltZ1v8KbpfaOCYzst7U4uT0jO7
nA1/tIaLUj/vacVDlIEoIdyZBLk7uJuAQ7s9XMWIH0sjDhS4uDH6FJqd3G7Dzl2T
f6KLCQJrdva/bWHnc7JzJfvHuGBLqrG6oFVT9vbsr60O3bgt6x4YC1Et/07gb51j
N0z1VtHeTRUIXSDrWCekZvFzYCY9A9scf5y74xEruyqvQWq6G+lFgkuJ813bKFVU
SaHHkiqS29NpP9GVwVoTPy9gXJioLYs4MQ/KUIXwR4wKdZXPb3a32kMAI3X/Aogg
VB7wcOas18mQVcxeh2Sri3VOaH8VmUQBUWhcCkeUKIZTnaZHWhW7ssIrkBBmF2sz
fPLB+bd5GgI2IaUbzuDWxEHa30BujeADvcbAqvXcWfu+QDcZg3g=
=IopY
-----END PGP SIGNATURE-----

--32kfez3r5z65nnkh--
