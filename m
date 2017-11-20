Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1511138452.4287.88.camel@aj.id.au>
Subject: Re: [PATCH v5 3/4] pmbus (core): Add virtual page config bit
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
 corbet@lwn.net,  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Mon, 20 Nov 2017 11:10:52 +1030
In-Reply-To: <3e84eca8-7a10-abd3-b8df-babb5f4ac8a0@roeck-us.net>
References: 
	<cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
	 <c5ccfeab881181dfbfdbdfb26051bb4cd332f6e6.1510974230.git-series.andrew@aj.id.au>
	 <3e84eca8-7a10-abd3-b8df-babb5f4ac8a0@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ibPtvlSpZ9dpeOapjJPS"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-ibPtvlSpZ9dpeOapjJPS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-11-19 at 08:49 -0800, Guenter Roeck wrote:
> On 11/17/2017 07:26 PM, Andrew Jeffery wrote:
> > Some circumstances call for virtual pages, to expose multiple values
> > packed into an extended PMBus register in a manner non-compliant with
> > the PMBus standard. An example of this is the Maxim MAX31785 controller=
, which
> > extends the READ_FAN_SPEED_1 PMBus register from two to four bytes to s=
upport
> > tach readings for both rotors of a dual rotor fan. This extended regist=
er
> > contains two word-sized values, one reporting the rate of the fastest r=
otor,
> > the other the rate of the slowest. The concept of virtual pages aids th=
is
> > situation by mapping the page number onto the value to be selected from=
 the
> > vectored result.
> >=20
> > We should not try to set virtual pages on the device as such a page exp=
licitly
> > doesn't exist; add a flag so we can avoid doing so.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >   drivers/hwmon/pmbus/pmbus.h      |  2 ++
> >   drivers/hwmon/pmbus/pmbus_core.c | 10 +++++++---
> >   2 files changed, 9 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index b54d7604d3ef..d39d506aa63e 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
> >   #define PMBUS_HAVE_PWM12	BIT(20)
> >   #define PMBUS_HAVE_PWM34	BIT(21)
> >  =20
> > +#define PMBUS_PAGE_VIRTUAL	BIT(31)
> > +
> >   enum pmbus_data_format { linear =3D 0, direct, vid };
> >   enum vrm_version { vr11 =3D 0, vr12, vr13 };
> >  =20
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index 631db88526b6..ba97230fcde7 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -164,14 +164,18 @@ int pmbus_set_page(struct i2c_client *client, int=
 page)
> >   	int rv =3D 0;
> >   	int newpage;
> >  =20
> > -	if (page >=3D 0 && page !=3D data->currpage) {
> > +	if (page < 0 || page =3D=3D data->currpage)
> > +		return 0;
> > +
> > +	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
> >   		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> >   		newpage =3D i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> >   		if (newpage !=3D page)
> >   			rv =3D -EIO;
>=20
> This should probably be something like
> 		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> 		if (rv < 0)
> 			return rv;
> 		newpage =3D i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> 		if (newpage < 0)
> 			return newpage;
> 		if (newpage !=3D page)
> 			return -EIO;
>=20
> We can actually drop 'newpage' and just use 'rv'.
>=20
> > -		else
> > -			data->currpage =3D page;
> >   	}
> > +
> > +	data->currpage =3D page;
> > +
>=20
> ... otherwise currpage is set even on error.

Thanks for catching that, clearly I needed to pay more attention
resolving the conflicts when rebasing on hwmon-next. I'll address all
your points.

Cheers,

Andrew

>=20
> >   	return rv;
>=20
> this can then be
> 	return 0;
>=20
> >   }
> >   EXPORT_SYMBOL_GPL(pmbus_set_page);
> >=20
>=20
>=20
--=-ibPtvlSpZ9dpeOapjJPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaEiSVAAoJEJ0dnzgO5LT5aL4P/2UHJGQDIJRaGP5V7Hi22l1u
mZgcKZmgp3FsZtxE7Kx5mMxg6L33mEA6A5J3mBLrPLM0EDXM1COcd0hDBhwRsw1I
2gl16jNKu1sQp9HdNaaVs56HtqxMf1wTPox0PomD/raorYIWvi0uRmmpNvdoHM5W
+11kS3rfHeZN/87ksmdEnDbmdBSKmAeV75/oVmihsU252HFkenXPbw7sxVR/YGno
O32L/olUqccbrm+u5LmKurww7lsEDSGxNSvG7G622MYALu75xATPVW3oySBDkweT
3p5T6rL+FSroe36pnaU+OxkAenfwVSkTh7Xt8dZKz4q4x3eTORRR0qa2p/6wlMjH
S6YHpMSpjQaOmhbW4WMM97SNRb0CDJ2xJDueUxfL4QCpukJn0+hzuw2YuOuOx0On
ZE8B5qQwc2xttGSYjC/Y+bY4/goKVa/3TpI/h6pCNG9HIlJu7LyWUcLWEKHZs+0e
euU0xJDDHc35VbwKuuwUD+zycInh8m5aFpLI8kUoAFZMKUcbnHRSwVP4Fju6JkVc
JAoqU4VN5xAw54q+xsZ5Wchvy+V0QqScLvEcN47dIbZv4diEWB3KD4tWdzBL9aXQ
Jnb8BniU+k0M8dD3ltbn8I18uJLYXABD6kIGtUSZCipa40i1zT/AmbHCyKQtv+86
mCj3bbZW8F3n49hUu2T3
=nb2y
-----END PGP SIGNATURE-----

--=-ibPtvlSpZ9dpeOapjJPS--
