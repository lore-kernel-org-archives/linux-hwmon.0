Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1503968909.32695.18.camel@aj.id.au>
Subject: Re: [PATCH v2 4/4] pmbus: max31785: Work around back-to-back writes
 with FAN_CONFIG_1_2
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
	mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com,
	openbmc@lists.ozlabs.org
Date: Tue, 29 Aug 2017 10:38:29 +0930
In-Reply-To: <20170802071541.3121-5-andrew@aj.id.au>
References: <20170802071541.3121-1-andrew@aj.id.au>
	 <20170802071541.3121-5-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VQkkosS9eSlzyYOv4Z7N"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-VQkkosS9eSlzyYOv4Z7N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-02 at 16:45 +0930, Andrew Jeffery wrote:
> Testing of the pmbus max31785 driver implementation revealed occasional
> NACKs from the device. Attempting the same transaction immediately after
> the failure appears to always succeed. The NACK has consistently been
> observed to happen on the second write of back-to-back writes to the
> device, where the first write is to FAN_CONFIG_1_2. The NACK occurs
> against the first data byte transmitted by the master on the second
> write. The behaviour has the hallmarks of a PMBus Device Busy response,
> but the busy bit is not set in the status byte.
>=20
> Work around this undocumented behaviour by retrying any back-to-back
> writes that occur after first writing FAN_CONFIG_1_2.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I expect I'll be dropping this patch. At this point it looks like we
have another chip on the bus interfering with transactions to the
MAX31785. Checking the behaviour with a scope showed that SCL was being
held down by something that wasn't the master, but according to Maxim
the SCL pin on the MAX31785 is input-only and therefore it cannot
interfere in the manner we observed. Further testing has narrowed down
the list of candidates for the interference, but our investigation is
ongoing.

Andrew
=20
> ---
> =C2=A0drivers/hwmon/pmbus/max31785.c | 105 ++++++++++++++++++++++++++++++=
+++++++----
> =C2=A01 file changed, 97 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max3178=
5.c
> index c2b693badcea..509b1a5a49b9 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -48,6 +48,55 @@ enum max31785_regs {
> =C2=A0
> > =C2=A0#define MAX31785_NR_PAGES		23
> =C2=A0
> +/*
> + * MAX31785 dragons ahead
> + *
> + * It seems there's an undocumented timing constraint when performing
> + * back-to-back writes where the first write is to FAN_CONFIG_1_2. The d=
evice
> + * provides no indication of this besides NACK'ing master Txs; no bits a=
re set
> + * in STATUS_BYTE to suggest anything has gone wrong.
> + *
> + * Given that, do a one-shot retry of the write.
> + *
> + * The max31785_*_write_*_data() functions should be used at any point w=
here
> + * the prior write is to FAN_CONFIG_1_2.
> + */
> +static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int command, u16 data)
> +{
> > +	int ret;
> +
> > +	ret =3D i2c_smbus_write_byte_data(client, command, data);
> > +	if (ret =3D=3D -EIO)
> > +		ret =3D i2c_smbus_write_byte_data(client, command, data);
> +
> > +	return ret;
> +}
> +
> +static int max31785_i2c_smbus_write_word_data(struct i2c_client *client,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int command, u16 data)
> +{
> > +	int ret;
> +
> > +	ret =3D i2c_smbus_write_word_data(client, command, data);
> > +	if (ret =3D=3D -EIO)
> > +		ret =3D i2c_smbus_write_word_data(client, command, data);
> +
> > +	return ret;
> +}
> +
> +static int max31785_pmbus_write_word_data(struct i2c_client *client, int=
 page,
> > +					=C2=A0=C2=A0int command, u16 data)
> +{
> > +	int ret;
> +
> > +	ret =3D pmbus_write_word_data(client, page, command, data);
> > +	if (ret =3D=3D -EIO)
> > +		ret =3D pmbus_write_word_data(client, page, command, data);
> +
> > +	return ret;
> +}
> +
> =C2=A0static int max31785_read_byte_data(struct i2c_client *client, int p=
age,
> > =C2=A0				=C2=A0=C2=A0=C2=A0int reg)
> =C2=A0{
> @@ -210,6 +259,31 @@ static int max31785_read_word_data(struct i2c_client=
 *client, int page,
> > =C2=A0	return rv;
> =C2=A0}
> =C2=A0
> +static int max31785_update_fan(struct i2c_client *client, int page,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 config, u8 mask, u16 c=
ommand)
> +{
> > +	int from, rv;
> > +	u8 to;
> +
> > +	from =3D pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> > +	if (from < 0)
> > +		return from;
> +
> > +	to =3D (from & ~mask) | (config & mask);
> +
> > +	if (to !=3D from) {
> > +		rv =3D pmbus_write_byte_data(client, page, PMBUS_FAN_CONFIG_12,
> > +					=C2=A0=C2=A0=C2=A0to);
> > +		if (rv < 0)
> > +			return rv;
> > +	}
> +
> > +	rv =3D max31785_pmbus_write_word_data(client, page, PMBUS_FAN_COMMAND=
_1,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0command);
> +
> > +	return rv;
> +}
> +
> =C2=A0static const int max31785_pwm_modes[] =3D { 0x7fff, 0x2710, 0xffff =
};
> =C2=A0
> =C2=A0static int max31785_write_word_data(struct i2c_client *client, int =
page,
> @@ -219,12 +293,24 @@ static int max31785_write_word_data(struct i2c_clie=
nt *client, int page,
> > =C2=A0		return -ENXIO;
> =C2=A0
> > =C2=A0	switch (reg) {
> > +	case PMBUS_VIRT_FAN_TARGET_1:
> > +		return max31785_update_fan(client, page, PB_FAN_1_RPM,
> > +					=C2=A0=C2=A0=C2=A0PB_FAN_1_RPM, word);
> > +	case PMBUS_VIRT_PWM_1:
> > +	{
> > +		u32 command =3D word;
> +
> > +		command *=3D 100;
> > +		command /=3D 255;
> > +		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
> > +					=C2=A0=C2=A0=C2=A0command);
> > +	}
> > =C2=A0	case PMBUS_VIRT_PWM_ENABLE_1:
> > =C2=A0		if (word >=3D ARRAY_SIZE(max31785_pwm_modes))
> > =C2=A0			return -EINVAL;
> =C2=A0
> > -		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
> > -					max31785_pwm_modes[word]);
> > +		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
> > +					=C2=A0=C2=A0=C2=A0max31785_pwm_modes[word]);
> > =C2=A0	default:
> > =C2=A0		break;
> > =C2=A0	}
> @@ -262,7 +348,7 @@ static int max31785_of_fan_config(struct i2c_client *=
client,
> > =C2=A0		return -ENXIO;
> > =C2=A0	}
> =C2=A0
> > -	ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> > +	ret =3D max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> @@ -419,7 +505,8 @@ static int max31785_of_fan_config(struct i2c_client *=
client,
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> > -	ret =3D i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
> > +	ret =3D max31785_i2c_smbus_write_word_data(client, MFR_FAN_CONFIG,
> > +						=C2=A0mfr_cfg);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> @@ -473,7 +560,7 @@ static int max31785_of_tmp_config(struct i2c_client *=
client,
> > =C2=A0		return -ENXIO;
> > =C2=A0	}
> =C2=A0
> > -	ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> > +	ret =3D max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> @@ -631,7 +718,8 @@ static int max31785_probe(struct i2c_client *client,
> > =C2=A0		if (!have_fan || fan_configured)
> > =C2=A0			continue;
> =C2=A0
> > -		ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> > +		ret =3D max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
> > +							=C2=A0i);
> > =C2=A0		if (ret < 0)
> > =C2=A0			return ret;
> =C2=A0
> @@ -640,8 +728,9 @@ static int max31785_probe(struct i2c_client *client,
> > =C2=A0			return ret;
> =C2=A0
> > =C2=A0		ret &=3D ~PB_FAN_1_INSTALLED;
> > -		ret =3D i2c_smbus_write_word_data(client, PMBUS_FAN_CONFIG_12,
> > -						ret);
> > +		ret =3D max31785_i2c_smbus_write_word_data(client,
> > +							=C2=A0PMBUS_FAN_CONFIG_12,
> > +							=C2=A0ret);
> > =C2=A0		if (ret < 0)
> > =C2=A0			return ret;
> > =C2=A0	}
--=-VQkkosS9eSlzyYOv4Z7N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpL6NAAoJEJ0dnzgO5LT51ioP/RzpL11Se0W4PtG3MdrvXIJp
UstXPjMNQv22mfKxBnz1Ai4FiP6sLOTDORfToTssIqT1lDvAxxUVCgPe5MHZAwHv
Y2FTKI1UD1ApZqfzWEb6k9X1jbLP10g1hdok45H1NZA439URrj0zUSo7RTjrb5bT
eg8dOOh0qv8R9yBBovcV2Y77hjfR/waPbD5aN9I/LPK3JrkmbQrchhdo2E2/QnVx
/EzF7/nqk3LdM5bF0zMQY6pT5hyNDMi3U9BBquOcjhpoTxkvS4j7HR5SToJ2aHhS
Df8AHPHdpCTkYhiTKaamdXEhBi9ZnVOR7fp/G8fHXyx6Mtxl3MJp2wfTyITT/rn4
bY5F1f0vCYvI2qMAcjTVffEfF4LMZhpCCzwVTWV2lwfkjf1+24zlG7rxU8ihphdT
toZ58xXQgYbxzcq/h2vh13u5neOQyI+4O6FTm08uJdzBB3y9qkjgP3JlLmGyHfDa
l5DH1Z3Vzrdd8gbVD67O/soTr9oSe68nzDkPMg1ldW/44erbmYlmBrcNtRDDUhJd
3mvEwqB4LrQAtvBXvzvg99pzRCqZdJNsBQnd1nQgq1Ai5iMR6KjbrifK+oeRCj2l
K5Zp8/XnkQqT/xRfHIZEgq9PhW7lqjzLQJwbXD8ApHgNKOPrSci4CDawsd+lhK+b
wF6cWb8bq+zxHuo8O/AP
=Uisu
-----END PGP SIGNATURE-----

--=-VQkkosS9eSlzyYOv4Z7N--
