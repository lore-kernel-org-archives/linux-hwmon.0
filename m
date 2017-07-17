Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34168 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbdGQPUV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2017 11:20:21 -0400
Date: Mon, 17 Jul 2017 17:20:17 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
To: Lee Jones <lee.jones@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 3/6] mfd: da9052: add register details for TSI
Message-ID: <20170717152017.gtqa6g657k232z5k@earth>
References: <20170703084003.31184-1-sebastian.reichel@collabora.co.uk>
 <20170703084003.31184-4-sebastian.reichel@collabora.co.uk>
 <20170717143245.qvcshsnodtk7pi2h@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="67b5l5vhy3cwnku7"
Content-Disposition: inline
In-Reply-To: <20170717143245.qvcshsnodtk7pi2h@dell>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--67b5l5vhy3cwnku7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 17, 2017 at 03:32:45PM +0100, Lee Jones wrote:
> On Mon, 03 Jul 2017, Sebastian Reichel wrote:
>=20
> > Add register details an channels definition for using the TSI
> > registers in the hwmon driver.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > ---
> >  include/linux/mfd/da9052/da9052.h |  6 ++++++
> >  include/linux/mfd/da9052/reg.h    | 11 ++++++++++-
> >  2 files changed, 16 insertions(+), 1 deletion(-)
>=20
> Do other patches in this set depend on this change?

Patch 6 has a compile-time dependency on 3 (this one) + 5
and a runtime-dependency on patch 4. My proposed merge
solution would be an immutable branch for the mfd changes,
that can be pulled by hwmon.

-- Sebastian

--67b5l5vhy3cwnku7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlls1a4ACgkQ2O7X88g7
+prc0A//SybWijyIHY2bF3PfjjYQ5qzsHgOZEyoP8r+txUpvI5bMyef5AwIze5LR
JeNO8KhaddzohRr2VE9Z8Z8hLzzi3gL+u3AuFdN5aTjCitZ48aFIk887oU6RMGfw
POpPxQS0+t2JPk3q2JA1uePNdgb4klcd7MS6bByRww1HHsX6BI9CTu6CVY1aV/L4
fI9tay7mZjj8UdqJFfWp/404Tzn3+wqkkzKtpmBsOegUXvIHgAoTZJaF79DNV8mW
p8/QvMyIEQaPTz7j3zxFeYF8iLGVGwxSuR2yLPQ9v+fwsdmmPnkDL/s/8VUB3T1+
Bb2KRm1R8fRnUoYO0nbX8oRcqD6oFqUubLYfJ2werV9N0WR0yGFpBp+OvPL4GUfa
LW+pqNZ/E0/+9On+9/esYRpkSSSsw24vQEc9pMaatTd8CuhRWybK0ThhzCJ6WKVn
iY546HhwiF/POVXrrJYfLmK5XlvynVpafBjD2vn4dvXBpNWvMLznfb+00q9YruSL
xyCUqI+ynMLAZtWIop3GuQitOSop2D7hIhWgFhjSm7wLzR9/2FrR1CCgKE1Ne0nj
HIcCkUp7bWnvzIwqFbIn1Oq2CndYYJ4/hYOsWVhLkJudZPuN5UxFx7h7ub6H2MS/
N3xjym6gSPRsUcn+SIIajaOl4dhq5zBPPnPNIswCYNuFuyIRwUs=
=bmfY
-----END PGP SIGNATURE-----

--67b5l5vhy3cwnku7--
