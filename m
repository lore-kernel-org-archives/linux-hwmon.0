Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F69223702;
	Fri,  5 Jun 2026 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625768; cv=none; b=n2pCgCBIYg1dQtAp63xeogr8ebhGIULdFuYhwmO/97hm9i8opWuh40w23KbryTX+SM8E5/GYmLqfToUlMoEdB3djyR8zmeNrCK/Y5nG04Cy1+I3ObkDt9hEfDI8ohZg8qRqJ0otNBW2mhzGAZW1rofibk9ongyHPMZNomUcFGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625768; c=relaxed/simple;
	bh=KdpIQa+ZSBNPY5VBlTWAKPy+3aE/BgfTSAeEZ5V9l5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EIvQJU++wmUpXZMJ4tp5Iw2JtEPpD7rwXz84W6KRzREDZfOa9qTpWpuBFspMeBcFTeYgIxKZA63P7XF+IiEHvMG9K96t0OPF7HDtocmcOsPhGA0P6eAtLqHOY6HC/42DhnvqXT1oVWcHj+jbNvkKCci6euVinmsrVXDf6yqMSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvTFyun+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvTFyun+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3381F00893;
	Fri,  5 Jun 2026 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625763;
	bh=3yMRtKR4ZhuRjBTav1g1vshqsW6Ba9SLhytTLqiw86w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvTFyun+xp2ZyDBo7Jzaoepdg4/C49ON7x66b5cUZOzRrhBvyFZxSgfhSHM/vRaR/
	 thw6LoZzWYoBvJXVuVpMBfMsPGcO6zJTPTffyj5OI+sasplfRAMF7GJRvOgVSFjz4y
	 htYpEothxwdYDfhNtc7irejdnGT7MVdyYT87qa5YT4VViCSnL7pwJRBQQFNPK2rRoU
	 krKX63t9DoV7JA0lHSTJc3JSoue2NwisVCkkY7JIx+1MwMU74nAv6bDTZo+rr/i18v
	 6/4Tb5f+xeljgTME+ughWYDd0B1GbCXlreVVu5V3wqrkLF0TV5/z8Q/AIMoBKPHigU
	 BKKBb+ajzyERg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260605020450.89638-3-zmzhu0630@163.com>
References: <20260605020450.89638-3-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:16:02 +0000
Message-Id: <20260605021603.2B3381F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing validation for the `silergy,rimon-micro-ohms` device tree =
property allows a division by zero kernel panic and integer truncation.
- [High] Unchecked subtraction in the `PMBUS_IIN_OC_FAULT_LIMIT` calculatio=
n leads to an integer underflow that defeats hardware over-current protecti=
on.
- [Low] Using a `GENMASK` macro as the exponent for a bitwise shift operati=
on is conceptually incorrect and brittle.
- [Low] A comment regarding `PSC_CURRENT_IN` and `PSC_POWER` scaling parame=
ters describes software scaling logic that does not exist in the code.
--

commit 837bf8e7761b5fce46f4967982468008be6c4700
Author: Ziming Zhu <ziming.zhu@silergycorp.com>

hwmon: pmbus: Add support for Silergy SQ24860

Add PMBus hwmon support for the Silergy SQ24860 eFuse. The driver reports
input voltage, output voltage, auxiliary voltage, input current, input
power, and temperature.

> diff --git a/drivers/hwmon/pmbus/sq24860.c b/drivers/hwmon/pmbus/sq24860.c
> new file mode 100644
> index 0000000000000..1c3b2bf2a026f
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/sq24860.c

[ ... ]

> +static int sq24860_write_iin_cal_gain(struct i2c_client *client, u32 rim=
on, u32 gimon)
> +{
> +	u64 temp =3D (u64)6400 * 1000000000 * 1000;
> +	u16 word =3D temp / ((u64)rimon * gimon);

[Severity: High]
If the silergy,rimon-micro-ohms property is read as 0 from the device tree
during sq24860_probe(), will this division by zero cause a kernel panic
during boot?

Additionally, if a user provides a very small value (e.g., < 5394 micro-ohm=
s),
the quotient will exceed U16_MAX. Since the result is directly assigned to
a u16, could this cause silent truncation and result in garbage calibration
values being written to the hardware?

> +	int ret =3D i2c_smbus_write_word_data(client, SQ24860_IIN_CAL_GAIN,
> +						word);
> +	return ret;
> +}

[ ... ]

> +static int sq24860_write_word_data(struct i2c_client *client,
> +				    int page, int reg, u16 value)
> +{
> +	int ret;
> +
> +	switch (reg) {

[ ... ]

> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		value -=3D SQ24860_IIN_OCF_OFF;

[Severity: High]
Does this unchecked subtraction risk an integer underflow if a user
requests a limit smaller than SQ24860_IIN_OCF_OFF (165)?

If value -=3D 165 underflows and wraps around to a large number, the
subsequent clamp_val() would hit its upper bound of 63. Could this
cause a safely low requested limit to configure the hardware's maximum
possible over-current limit, bypassing the safety threshold?

> +		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * SQ24860_IIN_OCF_DI=
V,
> +					  SQ24860_IIN_OCF_NUM);
> +		value =3D clamp_val(value, 0, 0x3f);
> +		ret =3D pmbus_write_byte_data(client, page, SQ24860_VIREF, value);
> +		break;
> +
> +	case PMBUS_VIRT_SAMPLES:
> +		value =3D clamp_val(value, 1, 1 << PK_MIN_AVG_AVG_CNT);

[Severity: Low]
Is it safe to use PK_MIN_AVG_AVG_CNT as a shift exponent here?

Since PK_MIN_AVG_AVG_CNT is defined as GENMASK(2, 0), it evaluates
to 7. While 1 << 7 coincidentally produces the correct limit of 128
samples, using a bitmask macro as a shift exponent is brittle. If the field
were to shift (for example, GENMASK(3, 1) evaluating to 14), would this log=
ic
break catastrophically while still passing compilation?

> +		value =3D ilog2(value);
> +		ret =3D pmbus_update_byte_data(client, page, SQ24860_PK_MIN_AVG,
> +					     PK_MIN_AVG_AVG_CNT,
> +					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
> +		break;

[ ... ]

> +static const struct pmbus_driver_info sq24860_base_info =3D {
> +	.pages =3D 1,
> +	.format[PSC_VOLTAGE_IN] =3D direct,

[ ... ]

> +	.format[PSC_TEMPERATURE] =3D direct,
> +	.m[PSC_TEMPERATURE] =3D 1,
> +	.b[PSC_TEMPERATURE] =3D 0,
> +	.R[PSC_TEMPERATURE] =3D 0,
> +	/*
> +	 * Current and Power measurement depends on the ohm value
> +	 * of Rimon. m is multiplied by 1000 below to have an integer
> +	 * and -3 is added to R to compensate.
> +	 */

[Severity: Low]
Is this comment accurate for the current implementation?

The driver info struct definitions below merely set .m =3D 16 and .R =3D 0,
with no multiplication by 1000 or -3 added to R. Is this an orphaned
copy-paste comment from another PMBus driver?

> +	.format[PSC_CURRENT_IN] =3D direct,
> +	.m[PSC_CURRENT_IN] =3D 16,
> +	.b[PSC_CURRENT_IN] =3D 0,
> +	.R[PSC_CURRENT_IN] =3D 0,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605020450.8963=
8-1-zmzhu0630@163.com?part=3D2
