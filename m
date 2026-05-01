Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C936308F
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777639540; cv=none; b=lhmNc8hA+cbov0Ix97z5sOQNXe295XS0+2X4NNx1PwAHnT9rHsP9r1MZjJL+L5LZiJXaNuOWJPO4u/S91SFtx9WOaZIBBh2j7ouQyvmbhBUXfHIj5TSUNGJfCxD8wiiyJIU3m6WS1Poq8BsWLS9sjW/TFDpwmu3hq5O9J525I2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777639540; c=relaxed/simple;
	bh=ZCFDdSqmOhJKc6vui5XAfS0qp6j+ID67sTtRHZl1s/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bufP1X6Qwa2JYlJonrFgHEM/fw8qNa32DnGBfmynKaqpWo8oEhg6mtQ2EfrPzO+Ofroghz5I/9Wb/ZyUBrJXtx6pl/rOk2pOvRIRRF7CzDpxfBJVj9AAR2KVD5U3sgHXXIZi17H/irN3GTmJrHBYHjGyJ0jDKbiOMPmpwWmwJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7LLHFyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7LLHFyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C11CC2BCB4;
	Fri,  1 May 2026 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777639540;
	bh=ZCFDdSqmOhJKc6vui5XAfS0qp6j+ID67sTtRHZl1s/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=O7LLHFyG8ejrpuKltdKD2vY9c8Jjed+/pW1IuMre2SlfjG2h08reAUBs5VKLDSjm6
	 OTXmREaEjSIPge/EKTCb8Rw1I3J7MZh8PWO6JU+Yooxq+SCfczpwAE/yaMYoFm+rc5
	 kV/blXV8TCKNzUjJlIOUDpK1O4B50HAFb7mpQ9zXEBTCK4/3L1I+oqc/G8wjLVNDjL
	 ElVj0JpFIJfSVgsf6hbdXQxInmGvJoq7rfnNUxc3/A6RZN1I6xU4LVaRQdaaJDHuB6
	 f+MAvuXYLDjDLcK9gPXCBAdFLRhV8RNzWscpZQX0AYIFhOS3uuNwhAb9OwE2xypqbP
	 ssThtuhDujBkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 01 May 2026 12:45:39 +0000
Message-Id: <20260501124540.0C11CC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The active-high alert polarity configuration is completely ignored=
 by the hardware because it is not added to the register update mask.
- [High] LM75_ALERT_POLARITY_HIGH_16_BIT targets the wrong byte of the conf=
iguration register.
- [High] Changing the AS6200 default from active-high to active-low breaks =
devicetree backward compatibility.
--

commit bf60f0ac922f126e93d4f54ae47d4c76d1c9caa9
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Support active-high alert polarity

This commit adds support for configuring active-high alert polarity based
on the devicetree property for LM75-compatible devices. It also adjusts
the default configuration value for the AS6200 to be active-low for
consistency.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f1a1e5b888f64..4b075a7b1cd76 100644
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

Should the 16-bit mask also use BIT(2)?

Since 16-bit configuration register accesses use i2c_smbus_read_word_data()
and i2c_smbus_write_word_data() which process the LSB first, the standard
LM75 configuration byte maps to the LSB (bits 0-7) of the 16-bit word. Using
BIT(2) << 8 seems to target the MSB instead.

> +#define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
> =20
>  /* The structure below stores the configuration values of the supported =
devices.
>   * In case of being supported multiple configurations, the default one m=
ust
> @@ -137,7 +139,7 @@ static const struct lm75_params device_params[] =3D {
>  	},
>  	[as6200] =3D {
>  		.config_reg_16bits =3D true,
> -		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
> +		.set_mask =3D 0x90C0,	/* 8 sample/s, 4 CF */

Does changing this default mask break backward compatibility for existing
devicetrees using the AS6200?

Systems currently using this chip might lack the newly introduced
lm75,alert-polarity-active-high property and rely on the previous
active-high default to route alarms correctly.

[ ... ]
> @@ -762,8 +765,15 @@ static int lm75_generic_probe(struct device *dev, co=
nst char *name,
>  		return err;
>  	data->orig_conf =3D status;
> =20
> -	err =3D lm75_write_config(data, data->params->set_mask,
> -				data->params->clr_mask);
> +	set_mask =3D data->params->set_mask;
> +	if (of_property_read_bool(dev->of_node, "lm75,alert-polarity-active-hig=
h")) {
> +		if (!data->params->config_reg_16bits)
> +			set_mask |=3D LM75_ALERT_POLARITY_HIGH_8_BIT;
> +		else
> +			set_mask |=3D LM75_ALERT_POLARITY_HIGH_16_BIT;
> +	}
> +
> +	err =3D lm75_write_config(data, set_mask, data->params->clr_mask);

Will the new polarity bits added to set_mask be ignored by the hardware?

Looking at lm75_write_config(), the clr_mask is passed as the mask argument
to regmap_update_bits():

static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
                                    u16 clr_mask)
{
        return regmap_update_bits(data->regmap, LM75_REG_CONF,
                                  clr_mask | LM75_SHUTDOWN, set_mask);
}

Because clr_mask is not updated to include the polarity bits,
regmap_update_bits() won't modify them in the hardware register.

Would it also be safer to explicitly include the polarity bit in the
clr_mask so the hardware is deterministically reset from whatever state
the bootloader left it in?

>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260501120518.3085=
501-1-markus.stockhausen@gmx.de?part=3D2
