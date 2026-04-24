Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5515D244684
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 03:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777000090; cv=none; b=oVO+3h3A+5/aAwAW44z3KIFa4s9/VBtLawKA4ndieO9nU9DSgVEaEKGSMG7LZFeJ1LLlzHgOTV28UDCHfCcb8Jo6lP9XAlB/30bQifFTOq1omBF5Hf1SS53ceEAa1Puo+Zj0/Za2UA3OeiC3J+mgIINLsu13ul5I712jLhECzas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777000090; c=relaxed/simple;
	bh=LagfTCZClyobVhA2aA0FRngQl8/bc0duTTo7ly1zraI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a+moriMsOA3x0NT6PCI300XdIALIgV0gz+cZOUOfk0xVUpzgSlKqDTZYHTan2wdq2uC6Cnsd7wuO50Tnq8bfNaOhrA3tw6NaqTFD920by6Ou6uWULbP+MHhrSeAH1XJgjKnViKA3qw3KYPYeWxPbjnYtgMOO8ojIRTSXTvCasJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iex7tsGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iex7tsGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F7DC2BCAF;
	Fri, 24 Apr 2026 03:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777000089;
	bh=LagfTCZClyobVhA2aA0FRngQl8/bc0duTTo7ly1zraI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iex7tsGlk5+t1YYIKBDHS6g3QXKjQxWCj3xfrSLu6/VyBc81d62SAnMJsFGUSzkyw
	 GHXh4T26pZhnmnpwza5blc+3r94tpSnwr2NtIthMM7ZKVYLdPu6WKnOcISgvxSNy7j
	 NFVhKG9AswyUHX9GaFyYuhY1tCWP/N9bUOh1fdBxq1s994qDKXUCu5zKed6R+mqRIW
	 L0/D/nPEKdVWW6GeLP24HMZtf3M4ngDwR272X7t63mdselursyNZxAsXjk5HYngL1n
	 MIbWLdpMNQXjSBRfkIFUBRki1/9mO+5yq/gQpN8vn2BXmXA1eZ4ixpY3CcjEHADprB
	 WARBd4mhbcDMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/13] hwmon: spd5118: Add I3C support
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-13-akhilrajeev@nvidia.com>
References: <20260423085718.70762-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 03:08:09 +0000
Message-Id: <20260424030809.D0F7DC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [High] NVMEM reads over I3C return corrupted data due to an unhandled 64-=
byte block rollover.
- [High] Stack-allocated buffers are passed to `regmap_bulk_read()`, which =
is unsafe for DMA-capable I3C controllers and will cause kernel panics or m=
emory corruption.
- [Low] The driver can be selected when `CONFIG_I2C` is disabled, leading t=
o a Kconfig unmet direct dependency warning and a compilation failure due t=
o undefined I2C APIs.
- [Low] Building the driver when `CONFIG_I3C` is disabled results in a link=
er error for `__devm_regmap_init_i3c`.
--

commit 4b70b869fa4332fdf133591e152cc997f3522e25
Author: Akhil R <akhilrajeev@nvidia.com>

hwmon: spd5118: Add I3C support
   =20
Add a regmap config and a probe function to support I3C-based
communication with SPD5118 devices.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 14e4cea48acc47..a7f60f8868eb6b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2309,12 +2309,15 @@ config SENSORS_INA3221
> =20
>  config SENSORS_SPD5118
>  	tristate "SPD5118 Compliant Temperature Sensors"
> -	depends on I2C
> +	depends on I3C_OR_I2C
>  	select REGMAP_I2C

If CONFIG_I2C is disabled and CONFIG_I3C is enabled as a module, could this
cause Kconfig unmet direct dependency warnings?

Because select REGMAP_I2C strictly depends on I2C, it will result in warnin=
gs.
Compilation might also fail when module_i3c_i2c_driver() unconditionally
references i2c_add_driver(), which is undefined when CONFIG_I2C is not set.

> +	select REGMAP_I3C if I3C

[ ... ]

> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 8fdde35e68cd3f..db66028d2f590e 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -464,6 +465,27 @@ static const struct regmap_config spd5118_regmap8_co=
nfig =3D {
>  	.num_ranges =3D ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
>  };
> =20
> +/*
> + * SPD5118 2-byte register address format (JESD300-5, Tables 7 & 20):
> + *   Byte 1 (on wire first):  MemReg | BlkAddr[0] | Address[5:0]
> + *   Byte 2 (on wire second): 0000   | BlkAddr[4:1]
> + *
> + * The address byte (with MemReg and lower address bits) must be sent fi=
rst,
> + * followed by the upper block address byte. With regmap 16-bit register
> + * format, this maps to little-endian: the low byte of the 16-bit value =
is
> + * transmitted first. No range config is needed since I3C does not use M=
R11
> + * page switching.
> + */
> +static const struct regmap_config spd5118_regmap_i3c_config =3D {
> +	.reg_bits =3D 16,
> +	.val_bits =3D 8,
> +	.max_register =3D 0x7ff,

Since the 2-byte address format specifies only a 6-bit Address field, does =
the
internal address counter roll over at the 64-byte boundary during I3C mode?

If spd5118_nvmem_read_page() executes a 128-byte regmap_bulk_read(), it
appears the device will silently wrap around to the beginning of the same
64-byte block, returning repeated and incorrect data instead of advancing to
the next block.

> +	.reg_format_endian =3D REGMAP_ENDIAN_LITTLE,
> +	.writeable_reg =3D spd5118_writeable_reg,
> +	.volatile_reg =3D spd5118_volatile_reg,
> +	.cache_type =3D REGCACHE_MAPLE,
> +};
> +

[ ... ]

> @@ -701,7 +723,39 @@ static struct i2c_driver spd5118_i2c_driver =3D {
>  	.address_list	=3D IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2=
c : NULL,
>  };
> =20
> -module_i2c_driver(spd5118_i2c_driver);
> +/* I3C */
> +
> +static int spd5118_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct device *dev =3D i3cdev_to_dev(i3cdev);
> +	struct regmap *regmap;
> +	u8 regval[2];
> +	int err;
> +
> +	regmap =3D devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);

If CONFIG_I3C is disabled, will this unconditionally call
devm_regmap_init_i3c() and result in a linker error?

When CONFIG_I3C is disabled, REGMAP_I3C is not selected, and
__devm_regmap_init_i3c is only exported by regmap-i3c.c when REGMAP_I3C is
enabled.

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
> +
> +	err =3D regmap_bulk_read(regmap, SPD5118_REG_TYPE, regval, 2);

Is it safe to pass the stack-allocated buffer regval to regmap_bulk_read()?

Because val_bits =3D 8 uses regmap_parse_inplace_noop, regmap_bulk_read() a=
voids
bounce buffers and passes the user buffer directly down to regmap_i3c_read()
and i3c_device_do_xfers().

Passing stack memory to DMA-capable APIs can lead to memory corruption or
kernel panics.

> +	if (err)
> +		return err;
> +
> +	if (regval[0] !=3D 0x51 || regval[1] !=3D 0x18)
> +		return -ENODEV;
> +
> +	return spd5118_common_probe(dev, regmap);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D12
