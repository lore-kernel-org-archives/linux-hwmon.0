Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DBC331EB3;
	Wed,  5 Aug 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921630; cv=none; b=ERh3Dpejk8TG+WNsAAatD2U6AcKOXn2r0qFJ1eJXxBdyRrjV5XUYYGZl0rSzeVBfn92jk5Cf0lkeWQ/nvg8E90WJ0YWfkdT3V/bM8dtJoGk+3L380AwlKTxZkULF2S8XdXHuD9J8wSvwwGMNvZuA8VHovq/Z35JxDmLzdRoqQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921630; c=relaxed/simple;
	bh=9VUjRBCR/c+GVJJArcKwuFdAT7xrUsd0WsTtlxJXYps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=phaZcZCrNXyJbTWCEUXSMBdWtmhsGlfpDaWQblLQgMwTRYJSmWzkEq1iT0Fxdi9eqL7eMvkO2ZtxL+N3ogV8tsdXvDJP/WfrcBZeh66bigjEzmOv0lGBYzks5AEIgbt24X/4b+4eod3ytd83WwuQmnwLMhTUUI4xcbWOjjgxYeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/6HyZOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/6HyZOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43961F000E9;
	Wed,  5 Aug 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785921626;
	bh=xtjVh8X760a0uAF8EfwGV8WcLcBBel/dqzLD/9icI5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/6HyZOAeAmrUjzgPftFPrcRCjtXrgEQVmkUSlJi5ki+CkiBXso6SRLx3/cuUL+oL
	 nI0KqOZWxSdItNRtUyO0YfmV6NdWzV7MD02UcABsLu3VmTT36XP5g/3jIuS2Dup1cf
	 Vj/4a87Fme3udVmy1NFHwF65B5JscFPhLdbH+GyEJbvrceUGqtDUCuUXPZNwpXMWQx
	 aQyedQOPAU+65ewqZgoa8W4XOARzObDo/QalCF0pplKkJSumNXIlYaxnkA19C3jR2Y
	 Ugsoz6rolHt24CyTUSJ038Wv4AaXGhvL3oT5qTSPtcCl1Huognb6tsOSiZZS2ubQs2
	 bJ3zX1qvZiWeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805090400.2059006-4-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
 <20260805090400.2059006-4-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:20:26 +0000
Message-Id: <20260805092026.A43961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Incorrect scaling, missing boundary clamping, and unsigned wrap-ar=
ound for TPS1689 PMBUS_VIN_OV_FAULT_LIMIT cause severely corrupted limits a=
nd bitfield overflows.
- [High] The shared 8-bit warning limit write paths treat PMBus direct valu=
es as unsigned, breaking all warning limits for TPS1689.
- [Medium] Missing scale adaptation for PSC_CURRENT_OUT in tps25990_probe l=
eads to output current readings being off by a factor of 1000.
- [Low] The intermediate expression in the read path for PMBUS_VIN_OV_FAULT=
_LIMIT unconditionally underflows in unsigned arithmetic, violating subsyst=
em guidelines.

Pre-existing issues:
- [High] Writing a small voltage/current limit below the hardware offset fo=
r TPS25990 causes an unsigned integer underflow, wrapping around to configu=
re the hardware with its maximum (weakest) protection limit.
--

--- Patch [3]: [PATCH v6 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support =
---
commit a29f74ffb1bc30041022deb0ab63b9dd79c1a779
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus/tps25990): Add TPS1689 support

Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.

Update the documentation to include TPS1689 support.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 7634ac743025d..a91ea8f33b296 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
[ ... ]
> @@ -193,9 +202,18 @@ static int tps25990_read_word_data(struct i2c_client=
 *client,
>  		ret =3D pmbus_read_word_data(client, page, phase, reg);
>  		if (ret < 0)
>  			break;
> -		ret =3D DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> -					TPS25990_VIN_OVF_DIV);
> -		ret +=3D TPS25990_VIN_OVF_OFF;
> +		if (data->chip_id =3D=3D tps25990) {
> +			ret =3D DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> +						TPS25990_VIN_OVF_DIV);
> +			ret +=3D TPS25990_VIN_OVF_OFF;
> +		} else if (data->chip_id =3D=3D tps1689) {
> +			ret =3D DIV_ROUND_CLOSEST(
> +				((FIELD_GET(TPS1689_VIN_OV_RANGE_SEL_MASK, ret) + 1) *
> +				TPS1689_VIN_RANGE_SPAN_MV) +
> +				(FIELD_GET(TPS1689_VIN_VOV_MASK, ret) *
> +				TPS1689_VIN_VOV_STEP_MV - TPS1689_VIN_RANGE_SPAN_MV),

[Severity: Low]
Does this intermediate expression underflow in unsigned arithmetic?

The maximum VOV is 63, so 63 * 250 =3D 15750, making the subtraction
unconditionally negative. Due to the unsigned evaluation of FIELD_GET(), th=
is
underflows to a large positive integer before wrapping back correctly when
added. Can this be simplified to RNG * 16000 + VOV * 250 to avoid the
underflow?

> +				TPS1689_VIN_SCALING);
> +		}
>  		break;
[ ... ]
> @@ -238,6 +256,8 @@ static int tps25990_read_word_data(struct i2c_client =
*client,
>  static int tps25990_write_word_data(struct i2c_client *client,
>  				    int page, int reg, u16 value)
>  {
> +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
> +	struct tps25990_data *data =3D container_of(info, struct tps25990_data,=
 info);
>  	int ret;
> =20
>  	switch (reg) {

[Severity: High]
Does this newly added device support require updates to the warning limit
logic?

For TPS1689, standard voltages map to negative PMBus direct format values
(e.g., -4). In tps25990_write_word_data(), the shared 8-bit warning limits
perform a logical right shift:

	case PMBUS_VIN_UV_WARN_LIMIT:
        ...
	case PMBUS_PIN_OP_WARN_LIMIT:
		value >>=3D TPS25990_8B_SHIFT;
		value =3D clamp_val(value, 0, 0xff);

Since value is an unsigned u16, will the right shift convert negative PMBus
values to large positive numbers, causing standard voltage warning limits to
be misconfigured as the maximum possible value?

> @@ -255,10 +275,23 @@ static int tps25990_write_word_data(struct i2c_clie=
nt *client,
>  		break;
> =20
>  	case PMBUS_VIN_OV_FAULT_LIMIT:
> -		value -=3D TPS25990_VIN_OVF_OFF;
> -		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_D=
IV,
> -					  TPS25990_VIN_OVF_NUM);
> -		value =3D clamp_val(value, 0, 0xf);
> +		if (data->chip_id =3D=3D tps25990) {
> +			value -=3D TPS25990_VIN_OVF_OFF;

[Severity: High]
This isn't a bug introduced by this patch, but does writing a small limit
below the hardware offset cause an unsigned integer underflow?

If a user writes a limit that converts to a PMBus value smaller than
TPS25990_VIN_OVF_OFF (155) or TPS25990_IIN_OCF_OFF (157), value will
underflow to a huge number. Since clamp_val() then clamps it to the absolute
maximum limit index, will this completely defeat the hardware protection
during an over-voltage or over-current event?

> +			value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_=
DIV,
> +						  TPS25990_VIN_OVF_NUM);
> +			value =3D clamp_val(value, 0, 0xf);
> +		} else if (data->chip_id =3D=3D tps1689) {
> +			u32 scaled_value =3D value * TPS1689_VIN_SCALING + TPS1689_VIN_RANGE_=
SPAN_MV;
> +			u32 tmp_scaled_value =3D scaled_value;
> +			u8 ov_rng_sel =3D 0;
> +			u32 ov_set =3D 0;
> +
> +			ov_rng_sel =3D tmp_scaled_value / TPS1689_VIN_RANGE_SPAN_MV;
> +			ov_set =3D tmp_scaled_value - (TPS1689_VIN_RANGE_SPAN_MV * ov_rng_sel=
);
> +			value =3D FIELD_PREP(TPS1689_VIN_OV_RANGE_SEL_MASK, ov_rng_sel - 1) |

[Severity: High]
Does this calculation incorrectly scale the limit and overflow the bitfield?

If a PMBus direct format value of -4 (65532 as unsigned u16) is passed in,
scaling it by 251 generates an out-of-bounds ov_rng_sel. Since there is no
clamping before FIELD_PREP(), will this silently truncate the value and
configure the hardware with dangerously low over-voltage limits?

> +						FIELD_PREP(TPS1689_VIN_VOV_MASK,
> +						(ov_set / TPS1689_VIN_VOV_STEP_MV));
> +		}
>  		ret =3D pmbus_write_word_data(client, page, reg, value);
>  		break;
[ ... ]
> @@ -347,6 +380,60 @@ static const struct regulator_desc tps25990_reg_desc=
[] =3D {
>  #endif
> =20
>  static const struct pmbus_driver_info tps25990_base_info[] =3D {
> +	[tps1689] =3D {
> +		.pages =3D 1,
[ ... ]
> +		.format[PSC_CURRENT_IN] =3D direct,
> +		.m[PSC_CURRENT_IN] =3D 9548,
> +		.b[PSC_CURRENT_IN] =3D 0,
> +		.R[PSC_CURRENT_IN] =3D -6,
> +		.format[PSC_CURRENT_OUT] =3D direct,
> +		.m[PSC_CURRENT_OUT] =3D 24347,
> +		.b[PSC_CURRENT_OUT] =3D 0,
> +		.R[PSC_CURRENT_OUT] =3D -3,

[Severity: Medium]
Does tps25990_probe() need to be updated to adapt the scale for
PSC_CURRENT_OUT?

While PSC_CURRENT_IN is dynamically scaled based on the rimon resistor value
in tps25990_probe():

	tps25990_set_m(&data->info.m[PSC_CURRENT_IN], rimon);
	tps25990_set_m(&data->info.m[PSC_POWER], rimon);

PSC_CURRENT_OUT is omitted. Since the default rimon scaling multiplies m by
1000, will skipping this adaptation cause the reported output current telem=
etry
to be off by a factor of 1000?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805090400.2059=
006-1-sbogdanov@baylibre.com?part=3D3
