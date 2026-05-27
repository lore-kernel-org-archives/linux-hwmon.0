Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3895A3E8353
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874469; cv=none; b=lpuqDz9uERIqGZIZ0yRF1G5M7B4Z+NGQxNPp/gUjZ61YnRhI2zv17l/vEg/M++z/6uq4qGrum/m9WMRBaH0YnvE9a99bY3MhR89UDVWvwZdi1GNPBmr8V9ENpy2D+Ds3eET+gWdSvchl2wJR/2Cpg/JspHMiJmNWC5r0bCHVQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874469; c=relaxed/simple;
	bh=HFaBw89fynZhFDM8/DonARlUIS8aP1MWZDiDlTM9cNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EBMAk08xqzlz7ak8pj1hzsprKFgGTtVyc5FjNDXUpsh80VNb+EejZgUXELj858skb+krcCwVtV02nvxsMPeYgziYzL7ogCHJwdaNOBW7YkhgY2LPvS/kG52Wz5u2WnzIg2NYp687VszIAvch9JGCIOzDZCq2sczXNVGGIczEdsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaZbO4jO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaZbO4jO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33061F00A3A;
	Wed, 27 May 2026 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779874467;
	bh=uIaR9Z8H4vs4kj7NJAMjj+erzwl7UloDyR2tf6eljuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZaZbO4jOnb+TfoSzdXIuntSUlbvmIQPMzJqajcBKVt3YW3cy+awkUOzGNKmkP+njw
	 eBexBPXXWJCT75uF0zjcO65mUTmT1dp22bE/TfvlExjV5RQcCxwP6KJxQx4eTuRazs
	 DanfzuPmFGkSTKhPOGAO0V1/8/SvKax8UfThdXr+7llHO+hx+1v5FI23oQNlUxUZYL
	 xOA69xLb52wMC8V+t1gdk4ydID9N5SYlvtSwBwMsDx8YerIlwQDraH5zVE4X2zYVYK
	 u6ORXoMa2TeMWYdonGkc6Wy8yAqnOnhZzeBv8QU3NBkuN155UN3Us1pZDQNHAeKpzH
	 8cE1MgskloNzw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Conor Dooley" <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260527-earring-bully-eb4a268c2e68@spud>
References: <20260527-earring-bully-eb4a268c2e68@spud>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 09:34:27 +0000
Message-Id: <20260527093427.B33061F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Masking out the sign bit of a two's complement value incorrectly r=
eports small negative voltages as massive positive spikes.
- [High] Hardware initialization occurs after device registration and uses =
`regmap_write`, creating a race condition and clobbering existing register =
state.
- [High] Missing return value checks for `regmap_read` expose uninitialized=
 kernel stack memory to userspace.
- [High] Blind dereference of `pdev->dev.parent` in the probe function.
- [Medium] The `update_interval` attribute is exposed and expected in micro=
seconds, violating the hwmon sysfs ABI standard.
- [Medium] Boolean sysfs enable attributes fail to properly reject negative=
 values.
- [Medium] The driver uses syscon APIs but its Kconfig entry does not depen=
d on or select `MFD_SYSCON`.
- [Medium] The driver ignores return values from hardware write operations,=
 masking potential hardware failures.
- [Low] Using a bitwise right shift (`>> 4`) on potentially negative temper=
atures relies on implementation-defined behavior and rounds incorrectly.
- [Low] The comment explaining the absolute zero constant is mathematically=
 incorrect.
--

commit 0cc52b7af906d819cbf1265ac544bb7d896a59da
Author: Lars Randers <lranders@mail.dk>

hwmon: add a driver for the temp/voltage sensor on PolarFire SoC

Add a driver for the temperature and voltage sensors on PolarFire SoC.
The temperature reports how hot the die is, and the voltages are the
SoC's 1.05, 1.8 and 2.5 volt rails respectively.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 14e4cea48acc4..194c8116fd018 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig

[ ... ]

> @@ -930,6 +930,18 @@ config SENSORS_JC42
>  	  This driver can also be built as a module. If so, the module
>  	  will be called jc42.
> =20
> +config SENSORS_POLARFIRE_SOC_TVS
> +	tristate "PolarFire SoC (MPFS) temperature and voltage sensor"
> +	depends on POLARFIRE_SOC_MAILBOX

[Severity: Medium]
Should this Kconfig entry depend on or select MFD_SYSCON?

The driver explicitly calls device_node_to_regmap() which is provided by
the syscon framework. If MFD_SYSCON is not enabled, the fallback stub
unconditionally returns -ENOTSUPP, which would cause the driver to silently
fail to probe at runtime without producing any build-time warnings.

> +	help
> +	  This driver adds support for the PolarFire SoC (MPFS) Temperature and

[ ... ]

> diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> new file mode 100644
> index 0000000000000..30d7baa808c4a
> --- /dev/null
> +++ b/drivers/hwmon/tvs-mpfs.c

[ ... ]

> +/*
> + * For all of these the value in millivolts is stored in 16 bits, with a=
n upper
> + * sign bit and a lower 2 bits of decimal. These masks discard the sign =
bit and
> + * decimal places, because if Linux is running these voltages cannot be =
negative
> + * and so avoid having to convert to two's complement.
> + */
> +#define MPFS_OUTPUT0_V1P8_MASK	GENMASK(30, 19)
> +#define MPFS_OUTPUT0_V1P05_MASK	GENMASK(14, 3)
> +#define MPFS_OUTPUT1_V2P5_MASK	GENMASK(14, 3)

[Severity: High]
Does discarding the sign bit cause issues with slight negative readings?

If the hardware measures a slightly negative voltage due to sensor noise
(for example, -1 mV), wouldn't the two's complement representation have the
integer bits set to all 1s?

Since the driver discards the sign bit and extracts the remaining bits via
FIELD_GET, it seems this could result in reporting the maximum positive
integer (4095 mV) instead of clamping to 0.

> +
> +/*
> + * The register map claims that the temperature is stored in bits 31:16,=
 but
> + * application note "AN4682: PolarFire FPGA Temperature and Voltage Sens=
or"
> + * says that 31 is reserved. Temperature is in kelvin, so what's probabl=
y a
> + * sign bit has no value anyway.
> + */
> +#define MPFS_OUTPUT1_TEMP_MASK GENMASK(30, 16)
> +
> +#define MPFS_TVS_INTERVAL_MASK GENMASK(15, 8)
> +#define MPFS_TVS_INTERVAL_OFFSET 8
> +/* The interval register is in increments of 32 us */
> +#define MPFS_TVS_INTERVAL_SCALE 32
> +
> +/* 273.5 in 11.4 fixed-point notation */
> +#define MPFS_TVS_K_TO_C 0x1112

[Severity: Low]
Is this comment mathematically accurate?

The value 0x1112 represents 4370 in decimal, which is 273.125 when divided
by 16. Absolute zero is 273.15, making 4370 the nearest integer, but the
comment mentions 273.5.

> +
> +enum mpfs_tvs_sensors {

[ ... ]

> +static int mpfs_tvs_voltage_read(struct mpfs_tvs *data, u32 attr,
> +				 int channel, long *val)
> +{
> +	u32 tmp, control;
> +
> +	if (attr !=3D hwmon_in_input && attr !=3D hwmon_in_enable)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);

[Severity: High]
Can a failed regmap_read() leave the control variable uninitialized?

If the underlying bus read fails, the control variable remains uninitialize=
d,
and this function could extract bits from uninitialized kernel stack memory
and return it to userspace via sysfs. This also appears to happen with the
tmp variable in the other read functions below.

> +
> +	switch (channel) {
> +	case SENSOR_V2P5:

[ ... ]

> +static int mpfs_tvs_voltage_write(struct mpfs_tvs *data, u32 attr,
> +				  int channel, long val)
> +{
> +	u32 tmp;
> +
> +	if (attr !=3D hwmon_in_enable)
> +		return -EOPNOTSUPP;
> +
> +	switch (channel) {
> +	case SENSOR_V2P5:
> +		if (val > 1)
> +			return -EINVAL;

[Severity: Medium]
Does this check properly reject negative inputs?

Because val is a signed long, negative values like -1 will bypass this
validation. When a negative value is passed to FIELD_PREP, it could
inadvertently set the enable bit to 1 due to the all-1s binary
representation.

> +
> +		tmp =3D FIELD_PREP(MPFS_TVS_CTRL_V2P5_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V2P5_ENABLE, tmp);

[Severity: Medium]
Are the return values from regmap_update_bits() intentionally ignored here?

If a hardware write fails, it looks like this unconditionally returns 0,
which would incorrectly inform userspace that the configuration was
successfully applied. This pattern seems to occur for other write handlers
as well.

> +		break;
> +	case SENSOR_V1P8:

[ ... ]

> +static int mpfs_tvs_temp_read(struct mpfs_tvs *data, u32 attr, long *val)
> +{
> +	u32 tmp, control;
> +
> +	if (attr !=3D hwmon_temp_input && attr !=3D hwmon_temp_enable)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);
> +
> +	if (attr =3D=3D hwmon_temp_enable) {
> +		*val =3D FIELD_GET(MPFS_TVS_CTRL_TEMP_ENABLE, control);
> +		return 0;
> +	}
> +
> +	if (!(control & MPFS_TVS_CTRL_TEMP_VALID))
> +		return -EINVAL;
> +
> +	regmap_read(data->regmap, MPFS_TVS_OUTPUT1, &tmp);
> +	*val =3D FIELD_GET(MPFS_OUTPUT1_TEMP_MASK, tmp);
> +	*val -=3D MPFS_TVS_K_TO_C;
> +	*val =3D (1000 * *val) >> 4; /* fixed point (11.4) to millidegrees */

[Severity: Low]
Does using a bitwise right shift on a potentially negative temperature
value rely on implementation-defined behavior?

Subtracting MPFS_TVS_K_TO_C can yield a negative number. An arithmetic
right shift rounds towards negative infinity rather than towards zero like
standard division, which might introduce minor inaccuracies for sub-zero
temperatures.

> +
> +	return 0;
> +}

[ ... ]

> +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, long =
*val)
> +{
> +	u32 tmp;
> +
> +	if (attr !=3D hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> +	//TODO: Guenter, update_interval, as implemented here, expects values
> +	//in microseconds. Is that okay? Most drivers (all that I checked tbh)
> +	//use milliseconds, but this is an 8-bit value so using ms will have
> +	//almost no granularity at all.
> +	*val =3D FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp) * MPFS_TVS_INTERVAL_SCA=
LE;

[Severity: Medium]
Is this exposing the interval in microseconds?

The hwmon sysfs ABI expects update_interval to be expressed in milliseconds.
Returning microseconds directly could break standard userspace monitoring
tools and the thermal subsystem that rely on standardized units.

> +
> +	return 0;
> +}

[ ... ]

> +static int mpfs_tvs_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct mpfs_tvs *data;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap =3D device_node_to_regmap(pdev->dev.parent->of_node);

[Severity: High]
Could pdev->dev.parent be NULL if the platform device is instantiated
manually?

If a privileged user writes to sysfs to instantiate the device or it is
bound such that pdev->dev.parent is NULL, would this unconditional
dereference trigger a NULL pointer dereference?

> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
> +				     "Failed to find syscon regmap\n");
> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "mpfs_tv=
s",
> +							 data,
> +							 &mpfs_tvs_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
> +				     "hwmon device registration failed.\n");
> +
> +	regmap_write(data->regmap, MPFS_TVS_CTRL, MPFS_TVS_CTRL_ENABLE_ALL);

[Severity: High]
Does registering the device before enabling the sensors create a race windo=
w?

The thermal core or userspace might attempt to read sensors after
devm_hwmon_device_register_with_info() completes but before they are
enabled.=20

Also, does this regmap_write() clobber the update_interval field?
Overwriting the entire control register with MPFS_TVS_CTRL_ENABLE_ALL
appears to zero out bits 15:8, destroying any interval settings made during
the race window or pre-configured by the bootloader.

> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-earring-bu=
lly-eb4a268c2e68@spud?part=3D1
