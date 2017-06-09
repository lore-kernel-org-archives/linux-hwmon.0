Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1496969522.23335.5.camel@aj.id.au>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
	msbarth@linux.vnet.ibm.com, tpearson@raptorengineering.com,
	openbmc@lists.ozlabs.org
Date: Fri, 09 Jun 2017 10:22:02 +0930
In-Reply-To: <9358484b-ceb2-6fe4-deef-54372a3f12da@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
	 <20170607155526.GA18946@roeck-us.net> <1496908393.23335.3.camel@aj.id.au>
	 <9358484b-ceb2-6fe4-deef-54372a3f12da@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ihCRtz4nS1TvSo3HVVbi"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-ihCRtz4nS1TvSo3HVVbi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-08 at 05:37 -0700, Guenter Roeck wrote:
> On 06/08/2017 12:53 AM, Andrew Jeffery wrote:
> > On Wed, 2017-06-07 at 08:55 -0700, Guenter Roeck wrote:
> > > On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
> > > > Add a basic driver for the MAX31785, focusing on the fan control
> > > > features but ignoring the temperature and voltage monitoring
> > > > features of the device.
> > > >=20
> > > > This driver supports all fan control modes and tachometer / PWM
> > > > readback where applicable.
> > > >=20
> > > > > > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > >=20
> > > > ---
> > > > Hello,
> > > >=20
> > > > This is a rework of Timothy Pearson's original patch:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://www.mail-archive.com/linux-hw=
mon@vger.kernel.org/msg00868.html
> > > >=20
> > > > I've labelled it as v3 to differentiate from Timothy's postings.
> > > >=20
> > > > The original thread had some discussion about the MAX31785 being a =
PMBus device
> > > > and that it should thus be a PMBus driver. The implementation still=
 makes use
> > >=20
> > > After thinking about it, that is what it should be. If I accept it as=
 non-PMBus
> > > driver, it will be all but impossible to convert it to a PMBus driver=
 later on,
> > > and that just doesn't make any sense.
> >=20
> > Hopefully not being too ignorant here, but can you expand on why it
> > would be all but impossible to convert?
> >=20
>=20
> I've got a lot of noise recently just for converting a driver from the ol=
d to the
> new API (which changes the attribute location). Changing the driver from =
non-PMBus
> to PMBus would very quite likely change some attributes as well.

Okay.

>=20
> Besides that, I think it is a bad idea to bypass an infrastructure just b=
ecause
> it may require a few tweaks. That generates a bad precedent, and people _=
would_
> use that to argue that the next PMBus chip driver should not use the infr=
astructure
> either.

I understand not wanting to set a precedent. Thanks for your response.

Andrew

>=20
> Guenter
>=20
> > >=20
> > > With no one interested in writing that driver, I'll try to give it so=
me more
> > > priority myself. I do have an evaluation board somewhere, which shoul=
d help.
> > >=20
> > > Note that the second fan reading should be implemented as just that, =
not with
> > > a non-standard attribute.
> >=20
> > Agreed.
> >=20
> > Andrew
> >=20
>=20
>=20
--=-ihCRtz4nS1TvSo3HVVbi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZOfEyAAoJEJ0dnzgO5LT5e28P/0gmerGUH3LYtwXOFcSHvH82
5cgByfnd4K9rclvuhC5LuFgLe9dYF7HcVgoB2Qm++c0tfv0RdlcH1Ki65+V+whoK
Rge4y38LtOYmiikx+sM1Zz2jOw5wP/7kioUkZERfXYU5uRitxDFUWvJd0OFgTjxA
GOTS4SbKqc3GJsi5nRp6B0ptI64myokJt31fmEptYW/BAZdsuuIdeM+StOzdyt+r
h86aiY2J9xw2e1+4fU+aolyZ5W8GjjdmvdqgctqMwBXVhAUmRZ6tH5+Y9zYZUXus
apM3mr6EqUzshCxfS8v81IRCs9Pe/I5mTQ7FLikBaDEIEe/ZE3OVnt19vloBxYqj
sAzrNWfg9XROWvMy8QchykPFXdRWAY2tEifwQ/yiaCngh9GRJ7sKVxrLLtAVHQsQ
ynZikw9g4BykHPAd0MRaSK+ALuglj1Hu35wf932NDMbWNRkHRWYfUNmM1jhA71+y
vHpy/4BBA8E8QWpRNnXPjvINJiHms8rsseffrouhM3663jZBhHlrJ3duL+u21WnJ
9doDlwprmFqjyM1mQyPVkXXrJr64OEFk+s9wQK7hB+AOmXvSct/lE0AQAB2yOSkx
o3gdZgL+Y89G3Kp8zStf/e1rcZyocfr3Gz60VqmM2OCae1InAn2Yg8vCE9lIVXGG
s8cYjoZr1YYgTTzU+zKo
=hJ2O
-----END PGP SIGNATURE-----

--=-ihCRtz4nS1TvSo3HVVbi--
