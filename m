Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237B9463
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777750587; cv=none; b=K0V7+gd+6mzFt6trD09wRsWmy192q6VIRqRVQ1PffIlSDJ0LJb8tu1ViJ/DL5g+QsNOt0aI2XDvmYgBvnJ2TIr6zLBa/y2T4i71AnRpNxi+dDjyc8M8ne6nxBx4AaHzYbCCy7vdmDg4i4kZZBSBv4GGiU7o33rEeO91+Qh24Gnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777750587; c=relaxed/simple;
	bh=mxXnhyCbHGUSpGCHeXtU3J3cyl+dlhBDUDQ/IS+Qmq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n55AoEBNGzEYdFn5HqAJxHsMnFGwAZPWFNy66X7aEvXnElEnvamowq741DJI2uPDRCDnUF2TVQ2V+MKmF4ZKYWFk1BhN48nBuCHtELdRlKLANXSaROh29l4fHcxRAxHVfAfH2Mffl9Ry1+eUCG2rYj/0AudRSqd2v7Cta+Ab7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GX0X8mGw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GX0X8mGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9C4C19425;
	Sat,  2 May 2026 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777750587;
	bh=mxXnhyCbHGUSpGCHeXtU3J3cyl+dlhBDUDQ/IS+Qmq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GX0X8mGwg8yiD3P5HfBXIyNA6MtIJ3O+QVVCGBKC9hvDlaCddKyqjO19sQhRrDX6e
	 /apC6NVvnuzlhoM8sowSCPOOeXf/Js2Faq9QThYnvCmM0gnvQRL3T7eYMTfKTMwC/1
	 nIAiM5XKBsg2eITHC4ndJ++BT+w/toJQ/CdNEWW9Dbr9MSeoOkhn7j5ZKGfYK9EvJy
	 mP0l8bViS+YGFgbnOuO2/oUKW7CHuxSSl0u/E7UFomkyxmSamh9v0ioFPZ0fm3r5op
	 l9MUzcpQx7QymdTygejgfMZSwmJhgLTwdFYjl9/vzH20VnrdO9GnLI8RmbRYaswEno
	 eXozy8vgJcjxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502190408.3577731-3-markus.stockhausen@gmx.de>
References: <20260502190408.3577731-3-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 19:36:26 +0000
Message-Id: <20260502193627.3F9C4C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The alert polarity configuration is silently ignored by the hardwa=
re because the new polarity bit is omitted from the register update mask.
- [High] For devices with 16-bit configuration registers, the polarity bit =
is incorrectly shifted into the wrong byte, modifying a reserved hardware b=
it instead of the polarity bit.
- [Low] The patch directly uses the Device Tree specific `of_property_read_=
bool()` API instead of the firmware-agnostic `device_property_read_bool()`.
--

commit 80ab4767c4e330cd441a8b4dcd804fcd1dec493b
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Support active-high alert polarity

LM75 devices supported by this driver support configurable active-high
alert polarity. This is already documented in the devicetree description.
Add support for it to the driver.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f1a1e5b888f6..d5a14a3b2820 100644
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

Does this shift target the correct byte for 16-bit registers?

Because the hardware typically expects the first transmitted byte to be the
most significant byte of its configuration register (which contains the POL=
 bit
at bit 2), and i2c_smbus_write_word_data() transmits the least significant
byte first, the POL bit might need to remain in the LSB of the logical value
(BIT(2)).

By shifting it by 8 bits, does this target the MSB of the value, which maps
to the LSB of the hardware register, potentially modifying a reserved bit
instead of the polarity?

> +#define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
> =20

[ ... ]

> @@ -762,8 +765,15 @@ static int lm75_generic_probe(struct device *dev, co=
nst char *name,
>  		return err;
>  	data->orig_conf =3D status;
> =20
> -	err =3D lm75_write_config(data, data->params->set_mask,
> -				data->params->clr_mask);
> +	set_mask =3D data->params->set_mask;
> +	if (of_property_read_bool(dev->of_node, "ti,alert-polarity-active-high"=
)) {

Could we use device_property_read_bool() here instead?

The probe function already uses device_property_read_string() to read the l=
abel
property earlier. Hardcoding the Device Tree specific API here breaks
consistency and prevents the active-high polarity feature from working on
systems using ACPI or software nodes.

> +		if (!data->params->config_reg_16bits)
> +			set_mask |=3D LM75_ALERT_POLARITY_HIGH_8_BIT;
> +		else
> +			set_mask |=3D LM75_ALERT_POLARITY_HIGH_16_BIT;
> +	}
> +
> +	err =3D lm75_write_config(data, set_mask, data->params->clr_mask);

Are we missing an update to the clear mask?

When we pass data->params->clr_mask into lm75_write_config():

drivers/hwmon/lm75.c:lm75_write_config() {
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | LM75_SHUTDOWN, set_mask);
}

The regmap_update_bits() function uses clr_mask | LM75_SHUTDOWN as the mask
of bits to modify. Since the newly added polarity bit isn't included in the
mask, is the alert polarity configuration silently ignored by the hardware?

If the device tree configures the interrupt controller for an active-high
signal but the sensor remains in its default active-low state, could this
lead to an unhandled interrupt storm?

>  	if (err)
>  		return err;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502190408.3577=
731-1-markus.stockhausen@gmx.de?part=3D2
