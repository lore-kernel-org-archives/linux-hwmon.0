Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1510283545.4287.46.camel@aj.id.au>
Subject: Re: [v4,6/6] pmbus: max31785: Add dual tachometer support
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, joel@jms.id.au,
	openbmc@lists.ozlabs.org
Date: Fri, 10 Nov 2017 13:42:25 +1030
In-Reply-To: <20171105145833.GA25880@roeck-us.net>
References: <20171103045306.26448-7-andrew@aj.id.au>
	 <20171105145833.GA25880@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+Zte4dKK+u19q+PcE5yx"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-+Zte4dKK+u19q+PcE5yx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-11-05 at 06:58 -0800, Guenter Roeck wrote:
> On Fri, Nov 03, 2017 at 03:53:06PM +1100, Andrew Jeffery wrote:
> > The dual tachometer feature is implemented in hardware with a TACHSEL
> > input to indicate the rotor under measurement, and exposed on the devic=
e
> > by extending the READ_FAN_SPEED_1 word with two extra bytes*. The need
> > to read the non-standard four-byte response leads to a cut-down
> > implementation of i2c_smbus_xfer_emulated() included in the driver.
> > Further, to expose the second rotor tachometer value to userspace the
> > values are exposed through virtual pages. We re-route accesses to
> > FAN_CONFIG_1_2 and READ_FAN_SPEED_1 on undefined (in hardware) pages
> > 23-28 to the same registers on pages 0-5, and with the latter command w=
e
> > extract the value from the second word of the four-byte response.
> >=20
> > * The documentation recommends the slower rotor be associated with
> > TACHSEL=3D0, which provides the first word of the response. The TACHSEL=
=3D0
> > measurement is used by the controller's closed-loop fan management.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/hwmon/max31785   |   8 ++-
> >  drivers/hwmon/pmbus/max31785.c | 159 +++++++++++++++++++++++++++++++++=
+++++++-
> >  2 files changed, 163 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max3178=
5
> > index e9edbf11948f..8e75efc5e4b9 100644
> > --- a/Documentation/hwmon/max31785
> > +++ b/Documentation/hwmon/max31785
> > @@ -17,8 +17,9 @@ management with temperature and remote voltage sensin=
g. Various fan control
> >  features are provided, including PWM frequency control, temperature hy=
steresis,
> >  dual tachometer measurements, and fan health monitoring.
> > =20
> > -For dual rotor fan configuration, the MAX31785 exposes the slowest rot=
or of the
> > -two in the fan[1-4]_input attributes.
> > +For dual-rotor configurations the MAX31785A exposes the second rotor t=
achometer
> > +readings in attributes fan[5-8]_input. By contrast the MAX31785 only e=
xposes
> > +the slowest rotor measurement, and does so in the fan[1-4]_input attri=
butes.
> > =20
> >  Usage Notes
> >  -----------
> > @@ -31,7 +32,8 @@ Sysfs attributes
> > =20
> >  fan[1-4]_alarm		Fan alarm.
> >  fan[1-4]_fault		Fan fault.
> > -fan[1-4]_input		Fan RPM.
> > +fan[1-8]_input		Fan RPM. On the MAX31785A, inputs 5-8 correspond to th=
e
> > +			second rotor of fans 1-4
> >  fan[1-4]_target		Fan input target
> > =20
> >  in[1-6]_crit		Critical maximum output voltage
> > diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31=
785.c
> > index 0d97ddf67079..2ca7febb2843 100644
> > --- a/drivers/hwmon/pmbus/max31785.c
> > +++ b/drivers/hwmon/pmbus/max31785.c
> > @@ -16,10 +16,82 @@
> > =20
> >  enum max31785_regs {
> >  	MFR_REVISION		=3D 0x9b,
> > +	MFR_FAN_CONFIG		=3D 0xf1,
> >  };
> > =20
> > +#define MAX31785			0x3030
> > +#define MAX31785A			0x3040
> > +
> > +#define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
> > +
> >  #define MAX31785_NR_PAGES		23
> > =20
> > +static int max31785_read_byte_data(struct i2c_client *client, int page=
,
> > +				   int reg)
> > +{
> > +	switch (reg) {
> > +	case PMBUS_VOUT_MODE:
> > +		if (page < MAX31785_NR_PAGES)
> > +			return -ENODATA;
> > +
> > +		return -ENOTSUPP;
> > +	case PMBUS_FAN_CONFIG_12:
> > +		if (page < MAX31785_NR_PAGES)
> > +			return -ENODATA;
> > +
> > +		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
> > +					    reg);
> > +	}
> > +
> > +	return -ENODATA;
> > +}
> > +
> > +static int max31785_write_byte(struct i2c_client *client, int page, u8=
 value)
> > +{
> > +	if (page < MAX31785_NR_PAGES)
> > +		return -ENODATA;
> > +
> > +	return -ENOTSUPP;
> > +}
> > +
> > +static int max31785_read_long_data(struct i2c_client *client, int page=
,
> > +				   int reg, u32 *data)
> > +{
> > +	unsigned char cmdbuf[1];
> > +	unsigned char rspbuf[4];
> > +	int rc;
> > +
> > +	struct i2c_msg msg[2] =3D {
> > +		{
> > +			.addr =3D client->addr,
> > +			.flags =3D 0,
> > +			.len =3D sizeof(cmdbuf),
> > +			.buf =3D cmdbuf,
> > +		},
> > +		{
> > +			.addr =3D client->addr,
> > +			.flags =3D I2C_M_RD,
> > +			.len =3D sizeof(rspbuf),
> > +			.buf =3D rspbuf,
> > +		},
> > +	};
> > +
> > +	cmdbuf[0] =3D reg;
> > +
> > +	rc =3D pmbus_set_page(client, page);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	*data =3D (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
> > +		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));
> > +
> > +	return rc;
> > +}
> > +
> >  static int max31785_get_pwm(struct i2c_client *client, int page)
> >  {
> >  	int config;
> > @@ -76,7 +148,25 @@ static int max31785_read_word_data(struct i2c_clien=
t *client, int page,
> >  	int rv;
> > =20
> >  	switch (reg) {
> > +	case PMBUS_READ_FAN_SPEED_1:
> > +	{
> > +		u32 val;
> > +
> > +		if (page < MAX31785_NR_PAGES)
> > +			return -ENODATA;
> > +
> > +		rv =3D max31785_read_long_data(client, page - MAX31785_NR_PAGES,
> > +					     reg, &val);
> > +		if (rv < 0)
> > +			return rv;
> > +
> > +		rv =3D (val >> 16) & 0xffff;
> > +		break;
> > +	}
> >  	case PMBUS_VIRT_PWM_1:
> > +		if (page >=3D MAX31785_NR_PAGES)
> > +			return -ENOTSUPP;
> > +
> >  		rv =3D max31785_get_pwm(client, page);
> >  		if (rv < 0)
> >  			return rv;
> > @@ -85,10 +175,13 @@ static int max31785_read_word_data(struct i2c_clie=
nt *client, int page,
> >  		rv /=3D 100;
> >  		break;
> >  	case PMBUS_VIRT_PWM_ENABLE_1:
> > +		if (page >=3D MAX31785_NR_PAGES)
> > +			return -ENOTSUPP;
> > +
> >  		rv =3D max31785_get_pwm_mode(client, page);
> >  		break;
> >  	default:
> > -		rv =3D -ENODATA;
> > +		rv =3D (page >=3D MAX31785_NR_PAGES) ? -ENXIO : -ENODATA;
> >  		break;
> >  	}
> > =20
> > @@ -100,6 +193,9 @@ static const int max31785_pwm_modes[] =3D { 0x7fff,=
 0x2710, 0xffff };
> >  static int max31785_write_word_data(struct i2c_client *client, int pag=
e,
> >  				    int reg, u16 word)
> >  {
> > +	if (page >=3D MAX31785_NR_PAGES)
> > +		return -ENXIO;
> > +
> >  	switch (reg) {
> >  	case PMBUS_VIRT_PWM_ENABLE_1:
> >  		if (word >=3D ARRAY_SIZE(max31785_pwm_modes))
> > @@ -127,7 +223,9 @@ static const struct pmbus_driver_info max31785_info=
 =3D {
> >  	.pages =3D MAX31785_NR_PAGES,
> > =20
> >  	.write_word_data =3D max31785_write_word_data,
> > +	.read_byte_data =3D max31785_read_byte_data,
> >  	.read_word_data =3D max31785_read_word_data,
> > +	.write_byte =3D max31785_write_byte,
> > =20
> >  	/* RPM */
> >  	.format[PSC_FAN] =3D direct,
> > @@ -174,6 +272,55 @@ static const struct pmbus_driver_info max31785_inf=
o =3D {
> >  	.func[22] =3D MAX31785_VOUT_FUNCS,
> >  };
> > =20
> > +static int max31785_configure(struct i2c_client *client,
> > +			      const struct i2c_device_id *id,
> > +			      struct pmbus_driver_info *info)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	bool dual_tach =3D false;
> > +	int ret;
> > +	int i;
> > +
> > +	ret =3D i2c_smbus_read_word_data(client, MFR_REVISION);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (!strcmp("max31785a", id->name)) {
> > +		if (ret =3D=3D MAX31785A)
> > +			dual_tach =3D true;
> > +		else
> > +			dev_warn(dev, "Expected max3175a, found max31785: cannot provide se=
condary tachometer readings\n");
> > +	} else if (!strcmp("max31785", id->name)) {
> > +		if (ret =3D=3D MAX31785A)
> > +			dev_info(dev, "Expected max31785, found max3175a: suppressing secon=
dary tachometer attributes\n");
> > +	} else {
> > +		return -EINVAL;
> > +	}
>=20
> This is too restrictive. I would suggest to move the chip detection part
> to the probe function. Also, since you have it, you should weed out any o=
ther
> types (ret could be anything) and not just assume it is MAX31785 if it is=
n't
> MAX31785A.
>=20
> The "excpected" messages are ok, but don't unnecessaily suppress attribut=
es.
> If there is a need to do this for some reason, there should be a configur=
ation
> parameter: forcing the user to specify the wrong type on purpose to suppr=
ess
> information is just wrong.
>=20
> dual_tach should not depend on the type in id but on the detected type.

No worries, will fix all of the above.

Thanks for the feedback.

Andrew
--=-+Zte4dKK+u19q+PcE5yx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaBRkZAAoJEJ0dnzgO5LT5er4P/05xpzlx97JaSgwj4TAbMO9g
8lkycO49UILfIDMk02sYDvQzf/jYMpN+K4KX+yzWzJVO1qPuVSrIjYwC4UN6LOrh
kLHloeHFK8qxQ1r6HNaMDlSxQ/dik+izWsJb+iJILxkG78UjT/ctuvRcvKNGYTqd
i41RJxhOxsV9mBIDO+Rma2abrN4JgxRt6KENGzkWai+jeANzn7fIvEqzzVuE4l76
20YY9+uwF3wcI4En64ETFetwzMzZAS5OnHpOgA9CXR3xVtq9kM3P4vrysXeoWNe7
FxsMbODa0PjhCWs8p+DhfhRNYtgSWiJlOJqVVaOZEHuQS0Dp+Pc8/Y7S2SpKiiue
xWIAK9ZUH2FeWGLVb7RcuzghwINrAEw7fPyRJj/WBVxjYz10ZRGrQlPDoy522mUf
fVs7z96CI4IUJHnGjJBXpKOrxzqMl6TrllZCUe8u4llz+5mjbVHAnOh/qGdap0j0
Po9fo/sFGnd0nB+e6844lYKFX9UZa2lxD31XojPDVfb9vUmTNSfNQLUJDrhfgPq7
UV5kzxt0wNB1/vARAFGD19QXJprE/qJlJJScYpRZwiHzIz8Q+ZHt94TTl9VcUnFG
ON07pLQjABGirWihB+0Htn4t14UkDSdxPYO/+8Zxm8c9AzzdEbl34yyCPZo5ew/q
l44xjqFXv7A9BYsGhFbZ
=rxje
-----END PGP SIGNATURE-----

--=-+Zte4dKK+u19q+PcE5yx--
