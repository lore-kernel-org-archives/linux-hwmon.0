Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1496908393.23335.3.camel@aj.id.au>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
	msbarth@linux.vnet.ibm.com, tpearson@raptorengineering.com,
	openbmc@lists.ozlabs.org
Date: Thu, 08 Jun 2017 17:23:13 +0930
In-Reply-To: <20170607155526.GA18946@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
	 <20170607155526.GA18946@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dPriNvg8PqsVjycTF7RB"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-dPriNvg8PqsVjycTF7RB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-06-07 at 08:55 -0700, Guenter Roeck wrote:
> On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
> > Add a basic driver for the MAX31785, focusing on the fan control
> > features but ignoring the temperature and voltage monitoring
> > features of the device.
> >=20
> > This driver supports all fan control modes and tachometer / PWM
> > readback where applicable.
> >=20
> > > > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > Hello,
> >=20
> > This is a rework of Timothy Pearson's original patch:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0https://www.mail-archive.com/linux-hwmon@vger.k=
ernel.org/msg00868.html
> >=20
> > I've labelled it as v3 to differentiate from Timothy's postings.
> >=20
> > The original thread had some discussion about the MAX31785 being a PMBu=
s device
> > and that it should thus be a PMBus driver. The implementation still mak=
es use
>=20
> After thinking about it, that is what it should be. If I accept it as non=
-PMBus
> driver, it will be all but impossible to convert it to a PMBus driver lat=
er on,
> and that just doesn't make any sense.

Hopefully not being too ignorant here, but can you expand on why it
would be all but impossible to convert?

>=20
> With no one interested in writing that driver, I'll try to give it some m=
ore
> priority myself. I do have an evaluation board somewhere, which should he=
lp.
>=20
> Note that the second fan reading should be implemented as just that, not =
with
> a non-standard attribute.

Agreed.

Andrew
--=-dPriNvg8PqsVjycTF7RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZOQJpAAoJEJ0dnzgO5LT5vsEP/1Mgcwy5LEWtEVc12XiXNjgW
/WZ/je5R4e/q6BoTGwts3KpnjKyWefPOVyF6Cwr13SJ2NX9fEdmK4QWdPF25S+1x
ifjxhPClDn8tyGmczfOEeF11fcX28r5g1+mqXHHwuexxqMOtvwk5h8UxSCBR5zSz
fbxVVPO3EWaJy2AEsacxlQ7w3JJQ1rZ9mgwRDmQM+59+t21vdzukkgS3LojRTPQ3
KjQyeW1ubnTyeQWUopbJCHsrCImTZ9p8K/LMfzDP8Mip5cYj+7IBXyX5ZCbeTZo4
j9x7PiVcgoppLdjBb1v/KiHfl4UDAZKmTnDNMw1JxOcEmrNprOI3p+eRobA/RXoW
jB93tWHnHhYxPF5utjrL36BS3lbc0G8OloRgjV7Hutl3h2ZiBhHofpgHpfy6G137
DzJI82tluNWaAw2tIiZpIlXacuYjTTfgaSampQgaGpE7dupujin+a+PQkyojI+vy
hC7TnNHxyjgZf3TClLgR3ebnoADux3D585fdwWARdH/Z9x6pvaFaABRYmPfPm/pw
EOZwalpdsgdK2k2Cu+UPsDGd+nWB8L1abcR8X5ngXuV9wElFp543v7dWUJPn1TRM
HZ1qaoFg793O5SmqxsjoL0RfxH6gEYyA9WZmvFcKEqsHa1hYhfkcIZFLoAFhfZXl
5whzFbXHZifyFN9vBjyC
=59lu
-----END PGP SIGNATURE-----

--=-dPriNvg8PqsVjycTF7RB--
