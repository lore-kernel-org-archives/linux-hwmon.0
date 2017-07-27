Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1501135382.5179.18.camel@aj.id.au>
Subject: Re: [patch v5] hwmon: (aspeed-pwm-tacho) cooling device support.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Guenter Roeck
 <linux@roeck-us.net>,  Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, Ohad Oz
 <ohado@mellanox.com>, Vadim Pasternak <vadimp@mellanox.com>, Patrick
 Venture <venture@google.com>, openbmc@lists.ozlabs.org, Rob Herring
 <robh+dt@kernel.org>
Date: Thu, 27 Jul 2017 15:33:02 +0930
In-Reply-To: <20170726145227.26466-1-c_mykolak@mellanox.com>
References: <20170726145227.26466-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-PYUUg9YRMjOKlBMEKs9C"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-PYUUg9YRMjOKlBMEKs9C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-07-26 at 17:52 +0300, Mykola Kostenok wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>=20
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>=20
> v1 -> v2:
> =C2=A0- Remove device tree binding file from the patch.
> =C2=A0- Move of_node_put out of cycle because of_get_next_child
> =C2=A0=C2=A0=C2=A0already do of_put_node on previous child.
>=20
> v2 -> v3:
> =C2=A0Pointed out by Rob Herring:
> =C2=A0- Put cooling-levels under fan subnodes.
>=20
> v3 -> v4:
> =C2=A0Pointed out by Joel Stanley:
> =C2=A0- Move patch history after Signoff.
> =C2=A0- Remove unnecessary type cast.
> =C2=A0- Use array instead of pointers for colling_levels.
> =C2=A0- Rename num_level to num_levels.
> =C2=A0- Use local variable to make function easier to read.
> =C2=A0- Drop unnesesary sizeof(u8).
> =C2=A0- Use IS_ERR instead of PTR_ERR_OR_ZERO.
>=20
> v4 -> v5:
> =C2=A0Pointed out by Joel Stanley:
> =C2=A0- Use snprintf to fill cdev->name[16].
> ---
> =C2=A0drivers/hwmon/aspeed-pwm-tacho.c | 117 ++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 115 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-=
tacho.c
> index ddfe66b..049e4eb 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -20,6 +20,7 @@
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/sysfs.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/thermal.h>
> =C2=A0
> =C2=A0/* ASPEED PWM & FAN Tach Register Definition */
> > =C2=A0#define ASPEED_PTCR_CTRL		0x00
> @@ -166,6 +167,18 @@
> =C2=A0/* How long we sleep in us while waiting for an RPM result. */
> > =C2=A0#define ASPEED_RPM_STATUS_SLEEP_USEC	500
> =C2=A0
> +#define MAX_CDEV_NAME_LEN 16
> +
> +struct aspeed_cooling_device {
> > +	char name[16];
> > +	struct aspeed_pwm_tacho_data *priv;
> > +	struct thermal_cooling_device *tcdev;
> > +	int pwm_port;
> > +	u8 *cooling_levels;
> > +	u8 max_state;
> > +	u8 cur_state;
> +};
> +
> =C2=A0struct aspeed_pwm_tacho_data {
> > =C2=A0	struct regmap *regmap;
> > =C2=A0	unsigned long clk_freq;
> @@ -180,6 +193,7 @@ struct aspeed_pwm_tacho_data {
> > =C2=A0	u8 pwm_port_type[8];
> > =C2=A0	u8 pwm_port_fan_ctrl[8];
> > =C2=A0	u8 fan_tach_ch_source[16];
> > +	struct aspeed_cooling_device *cdev[8];
> > =C2=A0	const struct attribute_group *groups[3];
> =C2=A0};
> =C2=A0
> @@ -765,6 +779,94 @@ static void aspeed_create_fan_tach_channel(struct as=
peed_pwm_tacho_data *priv,
> > =C2=A0	}
> =C2=A0}
> =C2=A0
> +static int
> +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0unsigned long *state)
> +{
> > +	struct aspeed_cooling_device *cdev =3D tcdev->devdata;
> +
> > +	*state =3D cdev->max_state;
> +
> > +	return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0unsigned long *state)
> +{
> > +	struct aspeed_cooling_device *cdev =3D tcdev->devdata;
> +
> > +	*state =3D cdev->cur_state;
> +
> > +	return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0unsigned long state)
> +{
> > +	struct aspeed_cooling_device *cdev =3D tcdev->devdata;
> +
> > +	if (state > cdev->max_state)
> > +		return -EINVAL;
> +
> > +	cdev->cur_state =3D state;
> > +	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =3D
> > +					cdev->cooling_levels[cdev->cur_state];
> > +	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cdev->cooling_levels[cdev->cur_state=
]);
> +
> > +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops =3D {
> > +	.get_max_state =3D aspeed_pwm_cz_get_max_state,
> > +	.get_cur_state =3D aspeed_pwm_cz_get_cur_state,
> > +	.set_cur_state =3D aspeed_pwm_cz_set_cur_state,
> +};
> +
> +static int aspeed_create_pwm_cooling(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_node *child,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_pwm_tacho_data *priv,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 pwm_port, u8 num_levels)
> +{
> > +	int ret;
> > +	struct aspeed_cooling_device *cdev;
> +
> > +	cdev =3D devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +
> > +	if (!cdev)
> > +		return -ENOMEM;
> +
> > +	cdev->cooling_levels =3D devm_kzalloc(dev, num_levels, GFP_KERNEL);
> > +	if (!cdev->cooling_levels)
> > +		return -ENOMEM;
> +
> > +	cdev->max_state =3D num_levels - 1;
> > +	ret =3D of_property_read_u8_array(child, "cooling-levels",
> > +					cdev->cooling_levels,
> > +					num_levels);
> > +	if (ret) {
> > +		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> > +		return ret;
> > +	}
> > +	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%s%d", child->name, pwm_port=
);
> +
> > +	cdev->tcdev =3D thermal_of_cooling_device_register(child,
> > +							=C2=A0cdev->name,
> > +							=C2=A0cdev,
> > +							=C2=A0&aspeed_pwm_cool_ops);
> > +	if (IS_ERR(cdev->tcdev))
> > +		return PTR_ERR(cdev->tcdev);
> +
> > +	cdev->priv =3D priv;
> > +	cdev->pwm_port =3D pwm_port;
> +
> > +	priv->cdev[pwm_port] =3D cdev;
> +
> > +	return 0;
> +}
> +
> =C2=A0static int aspeed_create_fan(struct device *dev,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_node *child,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_pwm_tacho_data *pr=
iv)
> @@ -778,6 +880,15 @@ static int aspeed_create_fan(struct device *dev,
> > =C2=A0		return ret;
> > =C2=A0	aspeed_create_pwm_port(priv, (u8)pwm_port);
> =C2=A0
> > +	ret =3D of_property_count_u8_elems(child, "cooling-levels");
> +
> > +	if (ret > 0) {
> > +		ret =3D aspeed_create_pwm_cooling(dev, child, priv, pwm_port,
> > +						ret);
> > +		if (ret)
> > +			return ret;
> > +	}
> +
> > =C2=A0	count =3D of_property_count_u8_elems(child, "aspeed,fan-tach-ch"=
);
> > =C2=A0	if (count < 1)
> > =C2=A0		return -EINVAL;
> @@ -834,10 +945,12 @@ static int aspeed_pwm_tacho_probe(struct platform_d=
evice *pdev)
> =C2=A0
> > =C2=A0	for_each_child_of_node(np, child) {
> > =C2=A0		ret =3D aspeed_create_fan(dev, child, priv);
> > -		of_node_put(child);
> > -		if (ret)
> > +		if (ret) {
> > +			of_node_put(child);
> > =C2=A0			return ret;
> > +		}
> > =C2=A0	}
> +	of_node_put(child);

Just noting I waded in on the discussion about this of_node_put() on
v3. I don't think it is necessary.

Cheers,

Andrew

> =C2=A0
> > =C2=A0	priv->groups[0] =3D &pwm_dev_group;
> > =C2=A0	priv->groups[1] =3D &fan_dev_group;
--=-PYUUg9YRMjOKlBMEKs9C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZeYIXAAoJEJ0dnzgO5LT5MfoQAIVJcBA9mF7Qwg6gzZO2FlOQ
xdpjerr7ISxrGOpgmOkHNJCseX9Rb4g3pck03kfiPcVuyB2pycKqw51toOe14Yme
WQZyseGj5UuJZfyjvWy+jIlUUbfmCljLFmwM3eU2ucAm3n07MJuoalex1YKyBh3Z
CyJ1/D8VDOkTCvbygONlsUYbwYiEOm2LRPlPOu9DMrH6GZzaC0hqo6afxHwzjEqk
VblZ5bNedoONqki6R8P+RCq8ZH2AOdCwFXAERH0Om+bbls+Cnl/5K6w85sPu9gtB
/Y8Ddi6wTe80Nh5fYgETumJCIT0M+8XnbO/gw013CUvaj4EXueLjgRkbJogQlej+
6qTlELu9uLnWoaGFPPRH45JWmS4V6fVvZLLE3dZPv2PMgro6hTPWkkHTYn1TGVbR
fqukP6XT1wbPVGXnEB33J9vGJaZHXNz0dWm+iXMQN+yLeOfFPedcW+4RpDvQUXbz
lG+QbBOI8ol8T/m7pgcpTdCz/BiooZJwSPX/yPPHbjxhzG04igsSbscn8OHEGhto
UFkOPbQekGgOOcGKn0x/popNLn0JNVy8DbbZ1vYBn0LlgT4RCZnwE9dXljQ0xBBC
CV4TlCgEicZH7Ch/XGD7kz23MelFFGtO5xz+G4KItDKAIkOn10tHIEz8dRwk0aYk
tLG5xjVCdDhnkr/tahFT
=W7K7
-----END PGP SIGNATURE-----

--=-PYUUg9YRMjOKlBMEKs9C--
