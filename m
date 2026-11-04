Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763674;
	b=aGjohW0jnVMlrfkKr6P+bYrqNW/g2eM4+EaA/CvpbZsM/DgvlHZgHevJWKbD3CCm+XYB
	 4ITNMbOzfoyzcim1qV5Z0pd0zloEr/r01Q8EjondWRkLLS93d7RufijPd51jQKPBWtSFC
	 nGaxriGzbxxWNyqlcJ6ePHiljkcGssDAvHasYzmkYsxifC8ssdX6/MnRBahN1/fK5MHfK
	 Q4yiIIicHnGb3GnBcLDCADDlo/xY6sNcpQnUr8Y3zr0sv3OugcAMC5swQPgMfVnI9GMJt
	 t3ZdZNXzEARNM1FWHR3hR2V3T+1L7juzVkf+6kAsIx4FmKsplp3ZCLWQFtO1PUuUQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763674;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZfU3QDJk03w7Octfw0qxWRtbR9li0uNTEHM66lL57Rw=;
	b=fGP/S4t2QnMWRaz/4nlhAQLGzqNqjDfsOFf5se6FZ3N/Yq9Q6z/+ACLXNqRO+UeUZPYD
	 lqoUpYRIGi6A8rk1mbIrbnd4BBtH/nWJhVvEkDKTCSj4oY2RXmxdF6eCo/gNcn2SMv+b8
	 gpxhkeHS5JzV0MKnoHP5Zq1MlchuDaBL8MAlqiDHUF9fWMctNet4dQ8Fk1NI508VwnZXx
	 RgR+nAzleL5HbfKIXZ1aDhgibtqqlPEJXam9cR8ATER5wZuPA/RGGg6tiq6oreuH2vWKF
	 W6yoMA+GJ/5T8IxsoT0HsIH6lmZ8+rHlIfJuFIaXRwvKFaUeCbtC3K58MUQdMih08lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWwBnn4m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D24C606A326;
	Wed,  4 Nov 2026 03:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWwBnn4m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA57F1F00A1D;
	Wed,  4 Nov 2026 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763674;
	bh=ZfU3QDJk03w7Octfw0qxWRtbR9li0uNTEHM66lL57Rw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jWwBnn4m0xNDpMNIssO8VXvnPz+xcMLbgysyEVhGGKlk1nsylAMTHyaNKY4OgsEgD
	 Et76499H8KH6FWiaAw2Uwoc76uvafEIxrLSKhhl+dhd7my+IFOh2hT4PfDG+/3jxaT
	 e5CPvVuZhh8+kVGjNpYKA0dvrA2CXMucde9dg739jJusd7CjxR0ufc2mT7nM2wcdXs
	 7U1FGrjFV9w6WUKOiLEHcom9tsaRbEnYwNzFQdE09gA9PfMPIm4VyN/q0PqY68r4gL
	 NgxeqJ58C4uOgT1vse6CICSjj5B/DrD/bV6U0oPmIYbvSySt1QfquTuvk/9Ud8MUMQ
	 hvi1wdhkSVKOg==
Message-ID: <sashiko-outbox-196619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: ltc4283: Add support for the LTC4284 swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-staging-ltc4284-v1-2-49fce67ebc48@analog.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-2-49fce67ebc48@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:41:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] hwmon: ltc4283: positional initializers in ltc4283_i2c_id table ent=
ries
- [Low] hwmon: ltc4283: duplicated channel info table and chip-ID helpers
- [Low] hwmon: ltc4283: missing default resistor fallback in ltc4283_setup()
- [Low] hwmon: ltc4283: commit message omits functional differences for LTC=
4284
--

commit 07a1775aa285e31dccd905e19fc784e472406b97
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: ltc4283: Add support for the LTC4284 swap controller

This commit adds support for the Analog Devices LTC4284 negative voltage hot
swap controller to the ltc4283 hwmon driver, including dual current sense
channels and separate ADC power sense resistor handling.

>     hwmon: ltc4283: Add support for the LTC4284 swap controller
>    =20
>     Support the LTC4284 Hot Swap Controller. It is very Similar to LTC428=
3 but
>     for higher power. The device features programmable current limit with
>     foldback and independently adjustable inrush current to optimize the
>     MOSFET safe operating area (SOA). The SOA timer limits MOSFET tempera=
ture
>     rise for reliable protection against overstresses.
>    =20
>     An I2C interface and onboard ADC allow monitoring of board current,
>     voltage, power, energy, and fault status.
>    =20
>     Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

[Severity: Low]
This isn't a bug, but the commit message mostly repeats generic hot-swap
controller features already shared with the LTC4283.

Could the changelog also describe the functional differences added to the
driver for the LTC4284, specifically the two current sense channels (SENSE1
and SENSE2) with separate sense resistors (rsense and rsense2) and the
dedicated ADC sense resistor (radc) used for power and energy calculations?

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> index 9ec409bc26482..d27c211146152 100644
> --- a/drivers/hwmon/ltc4283.c
> +++ b/drivers/hwmon/ltc4283.c
[ ... ]
> @@ -173,7 +192,19 @@ enum {
>  #define LTC4283_ADIO34_MAX \
>  	LTC4283_ADC_2_MAX_DIFF(LTC4283_CHAN_ADIO34 - LTC4283_CHAN_ADIN12)
> =20
> +enum ltc4283_chip_id {
> +	ID_LTC4283,
> +	ID_LTC4284,
> +};
> +
> +struct ltc4283_chip_info {
> +	enum ltc4283_chip_id id;
> +	const char *name;
> +	const struct hwmon_chip_info *hwmon_info;
> +};
> +
>  struct ltc4283_hwmon {
> +	const struct ltc4283_chip_info *info;
>  	struct regmap *map;
>  	struct i2c_client *client;
>  	unsigned long gpio_mask;
> @@ -182,12 +213,118 @@ struct ltc4283_hwmon {
>  	unsigned long power_max;
>  	/* in millivolt */
>  	u32 vsense_max;
> -	/* in tenths of microohm*/
> +	/* in tenths of microohm - For LTC4283 SENSE or LTC4284 SENSE1 */
>  	u32 rsense;
> +	/* in tenths of microohm - For LTC4284 SENSE2 only */
> +	u32 rsense2;
> +	/* in tenths of microohm - For LTC4284 ADC power measurement */
> +	u32 radc;
>  	bool energy_en;
>  	bool ext_fault;
>  };
> =20
> +static u32 ltc4283_get_rsense(const struct ltc4283_hwmon *st, u32 channe=
l)
> +{
> +	if (channel)
> +		return st->rsense2;
> +
> +	return st->rsense;
> +}
> +
> +static u32 ltc4283_get_rpower(const struct ltc4283_hwmon *st)
> +{
> +	/* For LTC4284, ADC uses radc. For LTC4283, ADC uses rsense. */
> +	if (st->info->id =3D=3D ID_LTC4284)
> +		return st->radc;
> +
> +	return st->rsense;
> +}
> +
> +static u8 ltc4283_get_sense_reg(const struct ltc4283_hwmon *st, u32 chan=
nel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1;
> +
> +	return LTC4284_SENSE2;
> +}
> +
> +static u8 ltc4283_get_sense_min_reg(const struct ltc4283_hwmon *st, u32 =
channel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE_MIN;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1_MIN;
> +
> +	return LTC4284_SENSE2_MIN;
> +}
> +
> +static u8 ltc4283_get_sense_max_reg(const struct ltc4283_hwmon *st, u32 =
channel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE_MAX;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1_MAX;
> +
> +	return LTC4284_SENSE2_MAX;
> +}
> +
> +static u8 ltc4283_get_sense_min_th_reg(const struct ltc4283_hwmon *st, u=
32 channel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE_MIN_TH;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1_MIN_TH;
> +
> +	return LTC4284_SENSE2_MIN_TH;
> +}
> +
> +static u8 ltc4283_get_sense_max_th_reg(const struct ltc4283_hwmon *st, u=
32 channel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE_MAX_TH;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1_MAX_TH;
> +
> +	return LTC4284_SENSE2_MAX_TH;
> +}
> +
> +static u8 ltc4283_get_curr_alarm_reg(const struct ltc4283_hwmon *st)
> +{
> +	if (st->info->id =3D=3D ID_LTC4284)
> +		return LTC4283_ADC_ALM_LOG_4;
> +
> +	return LTC4283_ADC_ALM_LOG_1;
> +}
> +
> +static u8 ltc4283_get_curr_alarm_high_mask(const struct ltc4283_hwmon *s=
t, u32 channel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE_HIGH_ALM;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1_HIGH_ALM;
> +
> +	return LTC4284_SENSE2_HIGH_ALM;
> +}
> +
> +static u8 ltc4283_get_curr_alarm_low_mask(const struct ltc4283_hwmon *st=
, u32 channel)
> +{
> +	if (st->info->id =3D=3D ID_LTC4283)
> +		return LTC4283_SENSE_LOW_ALM;
> +
> +	if (!channel)
> +		return LTC4284_SENSE1_LOW_ALM;
> +
> +	return LTC4284_SENSE2_LOW_ALM;
> +}

[ ... ]

> @@ -974,15 +1133,32 @@ static int ltc4283_read_labels(struct device *dev,
>  static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct devic=
e *dev)
>  {
>  	u32 temp =3D st->vsense_max * DECA * MICRO;
> +	u32 resistor =3D ltc4283_get_rpower(st);
>  	int ret;
> =20
> -	ret =3D ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_FS=
_uV,
> -				    st->vsense_max * MILLI);
> -	if (ret)
> -		return ret;
> +	if (st->info->id =3D=3D ID_LTC4283) {
> +		ret =3D ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_F=
S_uV,
> +					    st->vsense_max * MILLI);
> +		if (ret)
> +			return ret;
> +	} else {
> +		/* LTC4284: Set max limits for SENSE1 and SENSE2 */
> +		ret =3D ltc4283_write_in_byte(st, LTC4284_SENSE1_MAX_TH,
> +					    LTC4283_ADC1_FS_uV,
> +					    st->vsense_max * MILLI);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ltc4283_write_in_byte(st, LTC4284_SENSE2_MAX_TH,
> +					    LTC4283_ADC1_FS_uV,
> +					    st->vsense_max * MILLI);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	/* Power is given by ISENSE * Vout. */
> -	st->power_max =3D DIV_ROUND_CLOSEST(temp, st->rsense) * LTC4283_ADC2_FS=
_mV;
> +	st->power_max =3D DIV_ROUND_CLOSEST(temp, resistor) * LTC4283_ADC2_FS_m=
V;
> +
>  	return ltc4283_write_power_byte(st, LTC4283_POWER_MAX_TH, st->power_max=
);
>  }
> =20
> @@ -1271,6 +1447,45 @@ static int ltc4283_setup(struct ltc4283_hwmon *st,=
 struct device *dev)
>  	 */
>  	st->rsense /=3D CENTI;
> =20
> +	/*
> +	 * For LTC4284, rsense is for SENSE1, rsense2 for SENSE2, and radc is
> +	 * the effective sense resistance for ADC+- pin.
> +	 */
> +	if (st->info->id =3D=3D ID_LTC4284) {
> +		ret =3D device_property_read_u32(dev, "adi,rsense2-nano-ohms",
> +					       &st->rsense2);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to read adi,rsense2-nano-ohms\n");
> +
> +		if (st->rsense2 < LTC4283_MIN_RSENSE || st->rsense2 > LTC4283_MAX_RSEN=
SE)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "adi,rsense2-nano-ohms(%u) too small or too large [%u %u]\n",
> +					     st->rsense2, LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE);
> +
> +		st->rsense2 /=3D CENTI;
> +
> +		ret =3D device_property_read_u32(dev, "adi,radc-nano-ohms",
> +					       &st->radc);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to read adi,radc-nano-ohms\n");
> +
> +		if (st->radc < LTC4283_MIN_RSENSE || st->radc > LTC4283_MAX_RSENSE)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "adi,radc-nano-ohms(%u) too small or too large [%u %u]\n",
> +					     st->radc, LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE);
> +
> +		st->radc /=3D CENTI;

[Severity: Low]
In ltc4283_setup(), st->rsense is initialized to LTC4283_MIN_RSENSE before
calling device_property_read_u32(dev, "adi,rsense-nano-ohms", &st->rsense) =
so
that the driver can probe without firmware properties:

	st->rsense =3D LTC4283_MIN_RSENSE;
	ret =3D device_property_read_u32(dev, "adi,rsense-nano-ohms",
				       &st->rsense);
	if (!ret) {
		if (st->rsense < LTC4283_MIN_RSENSE || st->rsense > LTC4283_MAX_RSENSE)
			return dev_err_probe(...);
	}

When an LTC4284 device is instantiated via ltc4283_i2c_id without firmware
properties, won't ltc4283_probe() -> ltc4283_setup() fail because
device_property_read_u32() is required to succeed for adi,rsense2-nano-ohms
and adi,radc-nano-ohms instead of defaulting to LTC4283_MIN_RSENSE?

> +
> +		/* Enable SENSE1 and SENSE2 */
> +		ret =3D regmap_set_bits(st->map, LTC4283_ADC_SELECT_2,
> +				      LTC4284_SENSE1_SELECT_MASK |
> +				      LTC4284_SENSE2_SELECT_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D device_property_read_u32(dev, "adi,current-limit-sense-microvol=
t",
>  				       &st->vsense_max);
>  	if (!ret) {
> @@ -1558,6 +1773,91 @@ static const struct hwmon_channel_info * const ltc=
4283_info[] =3D {
>  	NULL
>  };
> =20
> +static const struct hwmon_channel_info * const ltc4284_info[] =3D {
[ ... ]
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> +			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> +			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> +			   HWMON_C_RESET_HISTORY | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> +			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> +			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> +			   HWMON_C_RESET_HISTORY | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> +			   HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
> +			   HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> +			   HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(energy,
> +			   HWMON_E_ENABLE),
> +	HWMON_CHANNEL_INFO(energy64,
> +			   HWMON_E_INPUT),
> +	NULL
> +};

[Severity: Low]
This isn't a bug, but there is quite a bit of duplication here:

1. ltc4284_info[] copies all 16 voltage channels, the power channel, and the
energy channels from ltc4283_info[] just to add a second current channel.
Could both current channels be defined in ltc4283_info[] and channel 1 hidd=
en
for ID_LTC4283 in ltc4283_is_visible() / ltc4283_curr_is_visible(), similar
to how ltc4283_in_is_visible() hides voltage channels?

2. Eight separate helper functions (ltc4283_get_sense_reg(),
ltc4283_get_sense_min_reg(), ltc4283_get_sense_max_reg(),
ltc4283_get_sense_min_th_reg(), ltc4283_get_sense_max_th_reg(),
ltc4283_get_curr_alarm_reg(), ltc4283_get_curr_alarm_high_mask(), and
ltc4283_get_curr_alarm_low_mask()) branch on st->info->id. Could these
register addresses and masks be stored in struct ltc4283_chip_info instead?

3. ltc4283_set_max_limits() branches on st->info->id =3D=3D ID_LTC4283 to s=
elect
LTC4283_SENSE_MAX_TH vs LTC4284_SENSE1_MAX_TH instead of reusing
ltc4283_get_sense_max_th_reg(st, 0).

4. ltc4283_setup() repeats the property read, [LTC4283_MIN_RSENSE,
LTC4283_MAX_RSENSE] range check, and division by CENTI three times for
adi,rsense-nano-ohms, adi,rsense2-nano-ohms, and adi,radc-nano-ohms. Could
that be factored into a small helper?

[ ... ]

> @@ -1769,13 +2090,15 @@ static int ltc4283_probe(struct i2c_client *clien=
t)
>  }
> =20
>  static const struct of_device_id ltc4283_of_match[] =3D {
> -	{ .compatible =3D "adi,ltc4283" },
> +	{ .compatible =3D "adi,ltc4283", .data =3D &chip_info_ltc4283 },
> +	{ .compatible =3D "adi,ltc4284", .data =3D &chip_info_ltc4284 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ltc4283_of_match);
> =20
>  static const struct i2c_device_id ltc4283_i2c_id[] =3D {
> -	{ "ltc4283" },
> +	{ "ltc4283", (kernel_ulong_t)&chip_info_ltc4283 },
> +	{ "ltc4284", (kernel_ulong_t)&chip_info_ltc4284 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);

[Severity: Low]
This isn't a bug, but should the modified and new entries in ltc4283_i2c_id=
[]
use named initializers (.name and .driver_data) to match I2C subsystem
conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-staging-lt=
c4284-v1-0-49fce67ebc48@analog.com?part=3D2
