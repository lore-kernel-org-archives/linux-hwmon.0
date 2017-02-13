Return-path: <andrew@aj.id.au>
Message-ID: <1486948333.3661.1.camel@aj.id.au>
Subject: Re: [PATCH linux v7 3/6] hwmon: occ: Add I2C transport
 implementation for SCOM operations
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, Mark Rutland
	 <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Wolfram Sang
	 <wsa@the-dreams.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Edward A. James"
	 <eajames@us.ibm.com>
Date: Mon, 13 Feb 2017 11:42:13 +1030
In-Reply-To: <4224dbab-d48c-be48-154d-5ed14dd5231e@linux.vnet.ibm.com>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com>
	 <1486509056-25838-4-git-send-email-eajames@linux.vnet.ibm.com>
	 <CACPK8XcdsG83HsQW1Pv5zR339mgTzYjfuLQE+gE8yk8Z88MrTA@mail.gmail.com>
	 <4224dbab-d48c-be48-154d-5ed14dd5231e@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZWwyIWnQ1jk7xf+ytTbo"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-ZWwyIWnQ1jk7xf+ytTbo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-10 at 15:05 -0600, Eddie James wrote:
> On 02/09/2017 11:31 PM, Joel Stanley wrote:
> > > On Wed, Feb 8, 2017 at 9:40 AM,<eajames@linux.vnet.ibm.com>=C2=A0 wro=
te:
> > >> From: "Edward A. James"<eajames@us.ibm.com>
> >>
> >> Add functions to send SCOM operations over I2C bus. The BMC can
> >> communicate with the Power8 host processor over I2C, but needs to use =
SCOM
> >> operations in order to access the OCC register space.
> > This doesn't need to be separate from the p8_occ_i2c.c file. You can
> > remove a layer of function calls by merging this in and having these
> > be your getscom putscom bus_ops callbacks.
>=20
> The purpose of having this separate was so that we could do the scom=C2=
=A0
> address shift for p8 separately.

Separation was my suggestion. It makes the I2C transport implementation
independent of any P8 details, and having it separate* is no more
abstract than the core performing SCOMs through the FSI interface when
that's available. I feel like it's muddying the waters conceptually to
bury P8 details in the implementation of a SCOM transport layer.

However, in our less abstract world the P8 will be the only system that
uses the I2C transport, so while I don't think merging the functions is
a good idea from an abstraction perspective it won't have a big impact.

Andrew

* Maybe the I2C SCOM transport even deserves to live outside
drivers/hwmon/occ?
--=-ZWwyIWnQ1jk7xf+ytTbo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYoQftAAoJEJ0dnzgO5LT5bG8P/3DtJryiExcgApkmxLwIptly
0iAY2DAj/xyhoyGOzXyOpcTsRuJSL7JAHoEx+CuMz9lzbdtvYkYKx0dWi6xCGAim
Bas6Cxa200Bjh6kjrzff07hseUtu2OGNYfK81QxRJgvMCjvfAi7IAv7ERqPQf/Qu
TbiNWR/iIaTOWe2eCDAdn1sg6P8SykmDaLHH3s8nciaoYF75723fpsX8NgSiTHe1
aVFz++vSBtKKedmc0gMnE1ckQ0oGclDTeYQ5pu5ccTRglRoa/GdGoRMAD11g3/xS
IEm3p9l8S+RYExWO6jworVvLkPImhmDsfGNAdPtypKRAXr83IB/kdKQA12AbsHJC
IL1hlZEFCN/uE2b4EZt60iWSwzNvKXfzdAFzrXRMEthlFIGYYoTUCe//JksxBky/
R5E7yFmlk1fW3GA9sLsaiWP9ggs+06yajhzEdDaK9Yax64jN0J90wlHZHpM82jRw
ry3d9meazF7ZuFRRpF2GZfCAW0F0bAIZiDsow7fycMelEXqu5M2tKUzmCBXO826Q
BfQPsz7TrJvtBvuqX3/M3h5uDtpyQ4VC159SjyUBdRMTmbKID7eLP/5K+rZWy07x
u2T6Cd1GeaRzxmKZVYEzGrskcrwWsy9h21ud3l/WthSAVjjFmuFbBNj41NV/Cv46
cgdkJMTmmz38ME0Y4nJ3
=vq+A
-----END PGP SIGNATURE-----

--=-ZWwyIWnQ1jk7xf+ytTbo--
