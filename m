Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE3022F767
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147512; cv=none; b=XEY+dHpkxaldMfVClKwe0fAjnPs9xO/axkz+uVb5GLdPbjOnSTBKzrTplGY0KbL15+ou/rGIngFBp2XKNFe1XA0rs/RqH77eS//usu6RIptpzVSGQq+1J9czNvb2JWJXBr4PFs/jmFmzKuQ8E0b38ZzUTbtyGJjRfDa2uO8E/28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147512; c=relaxed/simple;
	bh=u2gJmM0G/6xxEV1DL/fVJjkWs4C4pBncp41uUECxkxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u66oZ8owt2/6tI+QuCh//V6s67qk3xpIB4mTIttfYrw0MCgd4tbwKSdpNjN84TE99nN5NkpoZUnMRiJlh7O9i0DdfZtWIysJ7tUSUi5QOcWHQeTaGlWLL3e552uKc/VLJ1t9/V3tqdJ17LoKFUnVyva+JZvrcIhgTTx0gv/Pgpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnQ0XnwU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnQ0XnwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312F31F000E9;
	Wed, 19 Aug 2026 13:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787147510;
	bh=chapzUnhxXjE7G3xJwu6gf9t6VHOnInEtvPTv/icJOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GnQ0XnwUFWZtKyV4cL4/YHxBZzwZXTzUj/fFnpvSF8t76sFVqRQg47umsX7pc3y/a
	 E0BYd6Fr36HiTMtg6WicJvIC28acFOzrAjVRk/2Pwy7cerasVJhWXkc9y84dAksCo5
	 /lV0LnNSjkn67RyGCTE8Vd63HTVVnLmk9ALzHOVBvL7ZknQNJ6WTQG7Shl/pvtvNgD
	 Rzv9YPTZRLSpEWKKLaiCOjkabJ130PkoSSoGU6nozw70abUmxyvksuGYYHVjFB7Ac8
	 uKb4RyN7O0rfwIdTFQKboDLQjGWE3Hnbl8FmmTIRm2uzZSZGSibgl83PY9CSwK/CP5
	 gsPgipBmObxGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management
 ICs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephen Horvath" <linux@stevetech.au>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>
References: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:51:49 +0000
Message-Id: <20260819135150.312F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] Race condition: sysfs registration before hardware initialization
- [Medium] Incorrect error code for out-of-range values
- [Medium] hwmon update_interval attribute violates ABI units (returns raw =
values instead of milliseconds)
- [Medium] Architectural layering violation: PMIC directly registered as hw=
mon I2C driver
- [Low] C11 syntax error due to declaration directly after a label
--

--- Patch [1]: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management=
 ICs ---
commit 4dd6cacf5a9ff70a4083c91afc8539b2aae42832
Author: Stephen Horvath <linux@stevetech.au>

hwmon: Add Support for PMIC5000 Power Management ICs

Add support for sensors present on PMIC5000 (JEDEC JESD301) compliant
power management ICs. These chips are commonly found on DDR5 memory
modules.

> diff --git a/drivers/hwmon/pmic5000.c b/drivers/hwmon/pmic5000.c
> index 0000000000000..d3f3126dd9c80
> --- /dev/null
> +++ b/drivers/hwmon/pmic5000.c

[ ... ]

> +static int pmic5000_read_temp(struct regmap *regmap, u32 attr, int chann=
el,
> +			      long *val)
> +{
> +	int err;
> +	u32 regval;
> +
> +	if (channel !=3D 0)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_temp_input: {
> +		err =3D regmap_read(regmap, PMIC5000_REG_TEMPERATURE, &regval);
> +		if (err)
> +			return err;
> +		regval >>=3D 5;
> +		/* Below 85=C2=B0C */
> +		if (regval =3D=3D 0)
> +			return -EOPNOTSUPP;

[Severity: Medium]
Since returning -EOPNOTSUPP causes userspace tools to treat the attribute=20
as permanently unsupported by the chip, should this return -ENODATA instead=
=20
when the temperature is temporarily out of range?

> +		/* 0b001 =3D 85=C2=B0C, 0b010 =3D 95=C2=B0C, etc. */
> +		*val =3D (75 + regval * 10) * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	}

[ ... ]

> +static int pmic5000_read_volt_thresholds(struct regmap *regmap, u32 attr,
> +					 int channel, long *val)
> +{

[ ... ]

> +	volt_set =3D range_regval & range_bit ? base_volts[1] : base_volts[0];
> +	volt_set +=3D (set_regval >> 1) * 5;
> +
> +	switch (attr) {
> +	case hwmon_in_min:
> +		/* 10%, 12.5%, Reserved, Reserved */
> +		const int min_permilles[4] =3D { 100, 125, PERMILLE, PERMILLE };

[Severity: Low]
Can declaring a variable immediately following a case label cause a build=20
failure? The C11 standard expects a statement after a label, rather than=20
a declaration. Would wrapping the contents of this case block in braces=20
resolve this syntax error?

> +		*val =3D volt_set - (min_permilles[(thresh_regval >> 2) & 0x03] *
> +				   volt_set / PERMILLE);
> +		return 0;
> +	case hwmon_in_max:
> +		/* 7.5%, 10%, 12.5%, Reserved */
> +		const int max_permilles[4] =3D { 75, 100, 125, PERMILLE };
> +		*val =3D volt_set + (max_permilles[(thresh_regval >> 4) & 0x03] *
> +				   volt_set / PERMILLE);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

[ ... ]

> +static int pmic5000_read_interval(struct regmap *regmap, u32 attr, long =
*val)
> +{
> +	unsigned int regval;
> +	int err;
> +
> +	if (attr !=3D hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	err =3D regmap_read(regmap, PMIC5000_REG_ADC_CONFIG, &regval);
> +	if (err < 0)
> +		return err;
> +	*val =3D 1 << (regval & 0x03);
> +	return 0;
> +}

[Severity: Medium]
Is this exposing raw values like 1, 2, 4, or 8 instead of milliseconds?=20
The hwmon ABI specifies that update_interval should be reported and set=20
in milliseconds. Do these values need to be translated to match the ABI=20
requirements?

[ ... ]

> +static int pmic5000_common_probe(struct device *dev, struct regmap *regm=
ap)
> +{
> +	unsigned int revision, vendor, bank;
> +	struct pmic5000_data *data;
> +	struct device *hwmon_dev;
> +	int err;

[ ... ]

> +	hwmon_dev =3D devm_hwmon_device_register_with_info(
> +		dev, "pmic5000", data, &pmic5000_chip_info, NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	dev_info(dev, "DDR5 PMIC sensor: vendor 0x%02x:0x%02x revision %d.%d\n",
> +		 bank & 0x7f, vendor, ((revision >> 4) & 0x03) + 1,
> +		 ((revision >> 1) & 0x07) + 1);
> +
> +	/* Enable individual measurements and enable ADC */
> +	err =3D regmap_update_bits(regmap, PMIC5000_REG_OUTPUT_SELECT,
> +				 PMIC5000_OUTPUT_SELECT,
> +				 PMIC5000_OUTPUT_SELECT);
> +	if (err)
> +		return err;
> +	err =3D regmap_update_bits(regmap, PMIC5000_REG_ADC_CONFIG,
> +				 PMIC5000_ADC_ENABLE, PMIC5000_ADC_ENABLE);

[Severity: Medium]
Does this expose the sysfs files before the ADC is actually enabled? If=20
userspace polling tools access the sysfs attributes right after=20
devm_hwmon_device_register_with_info() completes, could it trigger reads on=
=20
uninitialized hardware? Should the hardware initialization happen before=20
registration?

[ ... ]

> +static struct i2c_driver pmic5000_i2c_driver =3D {
> +	.class		=3D I2C_CLASS_HWMON,
> +	.driver =3D {
> +		.name	=3D "pmic5000",
> +		.of_match_table =3D pmic5000_of_ids,
> +		.pm =3D pm_sleep_ptr(&pmic5000_pm_ops),
> +	},
> +	.probe		=3D pmic5000_i2c_probe,
> +	.id_table	=3D pmic5000_i2c_id,
> +};
> +
> +module_i2c_driver(pmic5000_i2c_driver);

[Severity: Medium]
Is this driver placed in the correct subsystem? For PMIC chips where hardwa=
re=20
monitoring isn't the primary function, the hwmon subsystem guidelines state=
=20
the core driver should reside in drivers/mfd or drivers/regulator, and=20
instantiate the hwmon functionality as an auxiliary device. Does binding=20
directly to the I2C device here prevent regulator drivers from attaching to=
=20
this PMIC later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-pmic5000-v=
1-1-e5e0ddcf0863@stevetech.au?part=3D1
