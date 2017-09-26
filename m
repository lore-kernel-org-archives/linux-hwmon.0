Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1506402405.30138.35.camel@aj.id.au>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add Maxim MAX31785
 documentation
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
	mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com,
	openbmc@lists.ozlabs.org
Date: Tue, 26 Sep 2017 14:36:45 +0930
In-Reply-To: <20170918201528.GA27615@roeck-us.net>
References: <20170908043919.6924-1-andrew@aj.id.au>
	 <20170908043919.6924-2-andrew@aj.id.au>
	 <20170918192638.4xqszyj466lrnpbz@rob-hp-laptop>
	 <20170918201528.GA27615@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KAruN5h0taGOo6R+Ub+B"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-KAruN5h0taGOo6R+Ub+B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-18 at 13:15 -0700, Guenter Roeck wrote:
> On Mon, Sep 18, 2017 at 02:26:38PM -0500, Rob Herring wrote:
> > On Fri, Sep 08, 2017 at 02:39:17PM +1000, Andrew Jeffery wrote:
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > > =C2=A0.../devicetree/bindings/hwmon/pmbus/max31785.txt=C2=A0=C2=A0=C2=
=A0| 158 +++++++++++++++++++++
> >=20
> > I think this needs to be located by what it does (fan control), not wha=
t=C2=A0
> > interface it has (pmbus).
> >=20
> > I'm not all that happy with hwmon either because things here seem to=C2=
=A0
> > just be based on being Linux hwmon devices which is sometimes arbitrary=
.=C2=A0
> >=20
>=20
> The chip also measures temperatures. Other PMBus chips may do fan control=
,
> measure temperatures, measure and/or control voltages, current, power ...
> Strictly speaking pretty much all PMBus chips are multi-function devices.
> I personally don't really care if the documentation is spread across
> several directories, but even here this is already challenging.
>=20
> Only solution I can think of would be to create separate documents for ea=
ch
> functionality, ie here one for the device itself, one for fan control,
> and one for temperature control (if that needs separate bindings). That
> would be similar to mfd. But then we would still have to sort out where
> to store the various bindings. Like iio, in subdirectories ? Like mfd,
> in the matching subsystems ? If so, what to do if there is no matching
> subsystem ?
>=20
> Lots of questions. I'll be happy to spend some time sorting it out,
> but I would need some directions.
>=20

Likewise - I'm keen to discuss and iterate on this so we get something
satisfactory.

At least I could split out the PMBus-specific bindings from the Maxim-
specific bindings in the current document, but there's still the
question of how to arrange it as Guenter has queried above, and also
how much of PMBus to define bindings for. I'm hesitant to take a stab
at describing bindings across the whole spec if I don't have useful
driver implementations to test against. I know that the bindings
describe the hardware and not the driver, but there are probably more
or less clumsy ways to describe devices that could be ironed out with a
corresponding implementation (e.g. the Aspeed PWM/Tacho...).

Thoughts?

Andrew
--=-KAruN5h0taGOo6R+Ub+B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyeBlAAoJEJ0dnzgO5LT5cNsQAJTIlYjvpwz30KYhT5UuocAo
pJ7Pwd4i2eyPAhxcf3Y7COLo0zdxhlRI3si/zxUkJDGx/wTIrQ1jjWrtZ6VlZFIP
VZUTWSsng0qlatB7PppeKxvaQIgI+AWw3AnrXpW3GQF3Ke+RhUdYpEjJ0oNKCOui
Dq4ZhfUELi6pkd+5ZgvTI/OpgjlSBRLwiYc8GHrkdlExxTVRXJIbpE6qqjGBxYrL
M/XbkHqntBq9PVu/uRRJtaSG1uol7rtMG5p4Vn3PTFOHE2s4Ke+9pLQMBFdEjaG9
tQmN38UPZNxb7XHj+kiIqKV+v834DDjN9WkfnDAclIGSojOyTwiidHtlcmvuKdN3
nL1aqjYU55tVe5mMK1VdPNTmeGpD9+QoPeDwb9o4WeOXBLXe45PelV0+LWLD64ha
tkqDH4ilk4YS2sim/2aapqwoELtc6BJxf76oZcGqBAzqEAPoiWpGdn+PcGc3TErX
hqKnMfL3p1/RgxJ6F69neZ6/OAbOYdj8H4nKNpBFVvyRpJBAicV1HkzR2av40p3w
dhDFfazKw8rSPNUC49rZ1ZOuwJ0kIt4kRP4eB3k2ZqiAMpPjv5buT4gApHj6vRCc
aiL4uDoO7M00r70Pm0M4zc4UA//cQ/VB/pvRlGTnEM4sk7IQvw6Vw6APEgswvG64
N5+Xp/JKnOSAdOHvWe2R
=quqO
-----END PGP SIGNATURE-----

--=-KAruN5h0taGOo6R+Ub+B--
