Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E53E3C4F
	for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2026 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920988; cv=none; b=ZXWyMzdmdA+FEKVnN0ADvlQlHWGJGOJ+sS9GfpqSgITmr3UaKgGGOC+sMn1+9ha8M7SwnNI49qelHEMsX579QyasD9UbZafN13o/I3n70XBZk0FDrf8EKGHzGwU3CW3soTQ22Uudf0Tg2fsC6vzs60QqiP8ouqVeEesa8xYrmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920988; c=relaxed/simple;
	bh=jlMuunNdOOMvY5nmH5HI6Ks9mlcUm+UTjUihf1ZwLok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WvzbRVhFYqSnu6MbZl1hhndwZxs021kvoMu/dyPuy3TFQAxXIJUXJDGvpoQ9EYchRs7XucPdfXD90/Cd6zDKhJYLm8E9ovqMyvOC/dCjD8MuOtUq2yNh+mTAI5zCU2Vm7LXnQf2k+4TIOKjQ+mk9VXqpSTc4PyoX5gaVv5vUK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzHcCs5f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzHcCs5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065FAC2BCB8;
	Mon,  4 May 2026 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777920988;
	bh=jlMuunNdOOMvY5nmH5HI6Ks9mlcUm+UTjUihf1ZwLok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HzHcCs5fVjzUvgDr/leogcyVN4rh2AXA4tPETMbmsblAmjlWTcHX24zqeqbsBwWbK
	 dG0zGH+yutbz8LRFz6ag+Ol/uPSwscN/wnB/MNwve5+l898Ai6UiKHERG6bJWYdxrZ
	 1uJCNTU2xKnE5qHrh4JEswMCCpnMwOljeZd3x3RPtbKk2VzYvkm0E2QWX5qbpZPwSN
	 YjEkMhfFpEPqra9D6lta8kSYRbJOtMjfSkZO8inbXFateUl7wdOmDaLS38No1aSiq0
	 b58ok+riFgLJHo7JctdqA5I4tLX7bF67q+Xu1Tq1tXKVi+RxYHosajmGKq3yyLj4Uu
	 IY0oHP6g31Wbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (lm75) Support active-high alert polarity
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260504151020.462342-3-markus.stockhausen@gmx.de>
References: <20260504151020.462342-3-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 04 May 2026 18:56:27 +0000
Message-Id: <20260504185628.065FAC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The 16-bit polarity mask incorrectly targets a reserved bit instea=
d of the alert polarity bit due to endianness.
- [High] Destructive overwrite of firmware-configured polarity introduces a=
 backwards compatibility regression.
- [High] Pre-existing bug: `set_mask` default configurations are silently i=
gnored by regmap update logic.
- [Medium] The patch contradicts and breaks the intended active-high defaul=
t behavior of as6200 sensors.
--

commit 7a0047595dac47959119e869942835475ae3f348
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Support active-high alert polarity

This commit adds support for configuring the active-high alert polarity for
LM75 devices using the ti,alert-polarity-active-high devicetree property. It
also enforces the default polarity if the property is missing.

> hwmon: (lm75) Support active-high alert polarity
>=20
> LM75 devices supported by this driver support configurable active-high
> alert polarity. This is already documented in the devicetree description.
> Add support for it to the driver.
>=20
> Follow documentation and defensively enforce active-low if property is
> not set. This avoids possible inconsistencies for future devices with
> wrong parametrization. No API breakage as all current devices have
> their parameters set to active-low.

Is it accurate that all current devices have their parameters set to active=
-low?

Looking at the device_params array, the as6200 configuration sets
.set_mask =3D 0x94C0, which has the positive polarity bit set. By clearing =
this
bit when the devicetree property is not present, could this break the
established default behavior for as6200 sensors?

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f1a1e5b888f64..af2d6cf370496 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -123,7 +123,9 @@ struct lm75_data {
> =20
>  static const u8 lm75_sample_set_masks[] =3D { 0 << 5, 1 << 5, 2 << 5, 3 =
<< 5 };
> =20
> -#define LM75_SAMPLE_CLEAR_MASK	(3 << 5)
> +#define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
> +#define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)

Will this 16-bit mask target the correct bit?

For 16-bit devices, the driver reads the configuration register using
i2c_smbus_read_word_data(). Since LM75-compatible sensors send the Most
Significant Byte (MSB) first, the original 8-bit configuration (containing
the polarity bit) ends up in the lower 8 bits of the returned integer, while
the extended configuration is in the upper 8 bits.

By defining LM75_ALERT_POLARITY_HIGH_16_BIT as (BIT(2) << 8), does this
erroneously target a reserved bit in the extended configuration byte instead
of the actual alert polarity bit?

> +#define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
> =20
>  /* The structure below stores the configuration values of the supported =
devices.
>   * In case of being supported multiple configurations, the default one m=
ust

[ ... ]

> @@ -762,8 +765,18 @@ static int lm75_generic_probe(struct device *dev, co=
nst char *name,
>  		return err;
>  	data->orig_conf =3D status;
> =20
> -	err =3D lm75_write_config(data, data->params->set_mask,
> -				data->params->clr_mask);
> +	/* Enforce polarity active-low (default) or active-high (devicetree) */
> +	if (!data->params->config_reg_16bits)
> +		pol_mask =3D LM75_ALERT_POLARITY_HIGH_8_BIT;
> +	else
> +		pol_mask =3D LM75_ALERT_POLARITY_HIGH_16_BIT;
> +
> +	clr_mask =3D data->params->clr_mask | pol_mask;
> +	set_mask =3D data->params->set_mask & ~pol_mask;
> +	if (device_property_read_bool(dev, "ti,alert-polarity-active-high"))
> +		set_mask |=3D pol_mask;

By always including pol_mask in clr_mask, will this actively clear the
polarity bit for all devices without the devicetree property?

Prior to this patch, the polarity bit was not included in clr_mask, allowing
the driver to inherit an active-high polarity if it was already correctly
initialized by a bootloader. Could this new behavior break existing working
embedded setups that rely on bootloader defaults?

> +
> +	err =3D lm75_write_config(data, set_mask, clr_mask);

Are the set_mask bits actually being applied here?

Looking at lm75_write_config(), it uses regmap_update_bits():

drivers/hwmon/lm75.c:lm75_write_config() {
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | LM75_SHUTDOWN, set_mask);
}

Since regmap_update_bits() only modifies the bits explicitly defined in its
mask argument, any bits in set_mask that are not also in clr_mask will be
silently ignored. Should the mask argument be updated to include set_mask
(e.g., clr_mask | set_mask | LM75_SHUTDOWN) to ensure all intended
configuration bits are written?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260504151020.4623=
42-1-markus.stockhausen@gmx.de?part=3D2
