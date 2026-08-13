Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71EF3BBA0E;
	Thu, 13 Aug 2026 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657542; cv=none; b=le8bmx0h4fEA0FV2hDadHzgQYkF5+sHNjykvqTuVRbolmZNa+dLkTnWAq+epAXw8niqMoFjloRetf263j067SgZANoKIstSJ/D9vRJ7hrxiZ2zAHS/IumskkuEct+t5D3/AOH+cEi02uZh6ojd5ULzv8fvUwvY1JTxvk+RuiI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657542; c=relaxed/simple;
	bh=lY/bVn492D3RqqHZ3tPQLdcVgvCJHlazPiruj+HWdis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ttit7GZ3HNZOefZMf9bHrQezx+JFqAWO4tM9gDAuKxabuDHYXoAtSIsjQIHybGhJAUnH2w+vfvYjH6JuRIQI/nxqqPCvwEOsNgon35+u6ceeIPNghhC8XZxOhFKyy0407wgrbIEGfeocQ82Fm2tEwkFydxRtG68btjVLaR7YNos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfkdSumG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfkdSumG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255691F00A3A;
	Thu, 13 Aug 2026 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657540;
	bh=s5dMdEhY10KKx3cwEMua/BmTvk8uWImvb7VWa547TlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EfkdSumGQqXfNK/W1lfpIs2cNpFq5UGYJ4TnFk9NyZKpYruMPFs+Bg9YIN5F4JGrQ
	 r7Mc3mVPCWH2cq4TNFOvWDJYcAPP04UCz9cadv7kxUWamUhZYaih+/D4HRmVampiqL
	 Xg3spHnSnDKj07ipuoulluRMeS8aNT5TkMHPiVTrPh5+BK2M1RT8gEnh1XT6lLtPhW
	 7TQwtsQffFfQtjN/a21RQ/5VJqi65GiJpEfZRFoZ2U+m5EqBy75VzP8CzkkIxPyKI2
	 4H092bStzuAPVhshAnYQ+01rGvsZytb/XJd2OvsN98L235aU/XM38UgxFDsDTgUyE6
	 JdF9bQMnAMdEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260314-ltc4283-support-v7-2-1cda48e93802@analog.com>
References: <20260314-ltc4283-support-v7-2-1cda48e93802@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:45:39 +0000
Message-Id: <20260813214540.255691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The result of `clamp_val()` is ignored, leaving user inputs unclam=
ped and bypassing bounds checks.
- [High] The `VPWR`, `ADIO12`, and `ADIO34` channels read from and incorrec=
tly clear the alarm logs of the unrelated `DRAIN` channel.
- [High] Fatal logic error in property matching aborts device probe when a =
valid `adi,overcurrent-retries` or `adi,fet-bad-retries` property is provid=
ed.
- [Medium] The logic for disabling the redundant ADC2 channel based on the =
`adi,vpower-drns-enable` property is swapped, disabling the actively monito=
red channel instead.
- [Medium] Calculation of `st->power_max` in `ltc4283_set_max_limits()` ove=
rflows 32-bit arithmetic for small sense resistors.
- [Medium] Software read-modify-write on volatile hardware fault and alarm =
registers can silently drop concurrently asserted hardware events.
- [Medium] Integer overflow when multiplying user input by `MILLI` prior to=
 bounds clamping leads to unintended limit inversion.
- [Low] The `%*ph` format specifier is incorrectly used to print an array o=
f 32-bit integers, yielding an unintelligible error message.
--

--- Patch [2]: [PATCH v7 2/3] hwmon: ltc4283: Add support for the LTC4283 S=
wap Controller ---
commit 636c5e8a9699ab80f86857069a188d6f2e25172d
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
Date:   Sat Mar 14 10:52:20 2026 +0000

    hwmon: ltc4283: Add support for the LTC4283 Swap Controller
   =20
    This commit adds support for the Analog Devices LTC4283 Hot Swap Contro=
ller.
    It features an I2C interface and ADC for monitoring board current, volt=
age,
    power, energy, and fault status. The driver implements hardware monitor=
ing
    interfaces and configures the chip properties based on device tree inpu=
ts.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 0000000000000..2066ff5d568fb
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c
[ ... ]
> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> +			      u32 mask, long *val)
> +{
[ ... ]
> +	*val =3D !!(alarm & mask);
> +
> +	/* If not status/fault logs, clear the alarm after reading it. */
> +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> +		return regmap_clear_bits(st->map, reg, mask);

[Severity: Medium]
Does this read-modify-write operation on volatile hardware fault and alarm=
=20
registers risk silently dropping concurrently asserted hardware events?

The regmap_clear_bits function reads the current state and writes it back=20
with target bits cleared. For Write-0-to-Clear volatile registers, writing =
a=20
0 clears the bit. If a new hardware fault occurs between the read and write=
,=20
the software will write a 0 to the newly asserted bit, inadvertently cleari=
ng=20
it before it is processed. Should a direct write of the inverted mask be=20
used instead?

> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel =3D=3D LTC4283_VPWR)

[Severity: High]
Can this result in false alarm readings and silently erased DRAIN fault log=
s?

This compares the channel ID to a register address macro (LTC4283_VPWR,=20
which is 0x44) instead of the channel enum LTC4283_CHAN_VPWR, so it will=20
always fail.

> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  BIT(2 + max_alm), val);
[ ... ]
> +	if (channel >=3D LTC4283_CHAN_ADIN12 && channel <=3D LTC4283_CHAN_ADIN3=
4) {
> +		u32 bit =3D (channel - LTC4283_CHAN_ADIN12) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> +					  BIT(7 - bit - !max_alm), val);
> +	}

[Severity: High]
Does this bounds check omit the LTC4283_CHAN_ADIO12 and LTC4283_CHAN_ADIO34=
=20
differential channels?=20

> +
> +	if (channel =3D=3D LTC4283_CHAN_DRNS)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> +					  BIT(6 + max_alm), val);
> +
> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> +				  val);
> +}

[Severity: High]
Due to the above two issues, queries for VPWR, ADIO12, and ADIO34 will=20
bypass their intended logic and execute this fallback. The fallback targets=
=20
and clears LTC4283_ADC_ALM_LOG_4 (the DRAIN alarm log). This logic error=20
appears to erase critical DRAIN fault logs when reading unrelated channels.

[ ... ]
> +static int ltc4283_write_power_byte(const struct ltc4283_hwmon *st, u32 =
reg,
> +				    long val)
> +{
> +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILL=
I;
> +	u32 __raw;
> +
> +	clamp_val(val, 0, st->power_max);

[Severity: High]
Is the result of clamp_val ignored here?

The macro evaluates to the clamped value but doesn't modify the argument in=
=20
place. Without assigning the return value back to val, out-of-bounds user=20
inputs will bypass the bounds check. This can cause subsequent arithmetic t=
o=20
overflow or produce large values that are silently truncated when written t=
o=20
the 8-bit registers.

> +	__raw =3D DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense, temp);
> +
> +	return regmap_write(st->map, reg, __raw);
> +}
[ ... ]
> +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> +{
[ ... ]
> +	/* Clear possible power faults. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> +}

[Severity: Medium]
Similar to ltc4283_read_alarm, does this regmap_clear_bits call risk a=20
read-modify-write operation erasing newly asserted power fault events?

[ ... ]
> +static int ltc4283_reset_in_hist(struct ltc4283_hwmon *st, u32 channel)
> +{
[ ... ]
> +	/*
> +	 * Make sure to clear possible under/over voltage faults. Otherwise the
> +	 * chip won't latch on again.
> +	 */
> +	if (channel =3D=3D LTC4283_CHAN_VIN)
> +		return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +					 LTC4283_OV_FAULT_MASK | LTC4283_UV_FAULT_MASK);
[ ... ]
> +	/* Then, let's also clear possible fet faults. Same as above. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_FET_BAD_FAULT_MASK | LTC4283_FET_SHORT_FAULT_MASK);
> +}

[Severity: Medium]
Are these regmap_clear_bits calls also at risk of erasing newly asserted=20
voltage or FET fault events via read-modify-write?

[ ... ]
> +static int ltc4283_write_minmax(struct ltc4283_hwmon *st, long val,
> +				u32 channel, bool is_max)
> +{
[ ... ]
> +	if (is_max) {
> +		reg =3D LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV,
> +					     val * MILLI);
> +	}
> +
> +	reg =3D LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV, val * MILLI);
> +}

[Severity: Medium]
Could this multiplication by MILLI cause a signed 32-bit integer overflow?

If a highly permissive positive threshold is passed, val * MILLI can wrap=20
around the signed 32-bit integer boundary and become negative. A downstream=
=20
clamp_val() will then catch this negative value and clamp it to 0, which=20
would inadvertently set the threshold to 0 and trigger persistent false=20
hardware alarms.

[ ... ]
> +static int ltc4283_write_curr_byte(const struct ltc4283_hwmon *st,
> +				   u32 reg, long val)
> +{
> +	u32 temp =3D LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	u32 reg_val, isense_max;
> +
> +	isense_max =3D DIV_ROUND_CLOSEST(st->vsense_max * MICRO * DECA, st->rse=
nse);
> +	clamp_val(val, 0, isense_max);

[Severity: High]
Like in ltc4283_write_power_byte, the returned value of clamp_val is not=20
assigned back to val, leaving user inputs unclamped and bypassing bounds=20
checks.

> +	reg_val =3D DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense, temp);
> +
> +	return regmap_write(st->map, reg, reg_val);
> +}
[ ... ]
> +static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct devic=
e *dev)
> +{
> +	u32 temp =3D st->vsense_max * DECA * MICRO;
> +	int ret;
> +
> +	ret =3D ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_FS=
_uV,
> +				    st->vsense_max * MILLI);
> +	if (ret)
> +		return ret;
> +
> +	/* Power is given by ISENSE * Vout. */
> +	st->power_max =3D DIV_ROUND_CLOSEST(temp, st->rsense) * LTC4283_ADC2_FS=
_mV;

[Severity: Medium]
Does this multiplication overflow a 32-bit unsigned integer before assignme=
nt?

For typical small shunt values (e.g., 10 uOhm or rsense =3D 100), the produ=
ct=20
of the 32-bit values can exceed the 32-bit maximum, resulting in integer=20
wrap-around. This assigns a massively truncated threshold to st->power_max=
=20
and disrupts hardware limit bounds logic.

> +	return ltc4283_write_power_byte(st, LTC4283_POWER_MAX_TH, st->power_max=
);
> +}
> +
> +static int ltc4283_parse_array_prop(const struct ltc4283_hwmon *st,
> +				    struct device *dev, const char *prop,
> +				    const u32 *vals, u32 n_vals)
> +{
[ ... ]
> +	return dev_err_probe(dev, -EINVAL,
> +			     "Invalid %s property value %u, expected one of: %*ph\n",
> +			     prop, prop_val, n_vals, vals);
> +}

[Severity: Low]
Can this format string yield an unintelligible error message?

The %*ph format specifier expects a u8 * array and prints raw bytes. Using=
=20
it for a const u32 * array prints only the first n_vals bytes of the first=
=20
integer in memory, creating a mangled message.

[ ... ]
> +static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
> +{
[ ... ]
> +	ret =3D device_property_match_property_string(dev, "adi,overcurrent-ret=
ries",
> +						    ltc4283_oc_fet_retry,
> +						    ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	/* We still want to catch when an invalid string is given. */
> +	if (ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "adi,overcurrent-retries invalid value\n");

[Severity: High]
Does this erroneously trigger an error return on a successful property matc=
h?

The device_property_match_property_string function returns a non-negative=20
index on success. Since a valid positive index does not equal -EINVAL, a=20
successfully parsed property causes the driver to interpret it as an error=
=20
and abort the probe.

> +	if (ret >=3D 0) {
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> +					 LTC4283_OC_RETRY_MASK,
> +					 FIELD_PREP(LTC4283_OC_RETRY_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D device_property_match_property_string(dev, "adi,fet-bad-retries=
",
> +						    ltc4283_oc_fet_retry,
> +						    ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	if (ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "adi,fet-bad-retries invalid value\n");

[Severity: High]
Similar to above, this aborts the probe if a valid adi,fet-bad-retries=20
property is provided.

[ ... ]
> +	if (device_property_read_bool(dev, "adi,vpower-drns-enable")) {
> +		__clear_bit(LTC4283_CHAN_DRAIN, &st->ch_enable_mask);
> +		chan =3D LTC4283_CHAN_DRAIN - LTC4283_CHAN_ADI_1;
> +		val =3D 1;
> +	} else {
> +		__clear_bit(LTC4283_CHAN_DRNS, &st->ch_enable_mask);
> +		chan =3D LTC4283_CHAN_DRNS - LTC4283_CHAN_ADI_1;
> +		val =3D 0;
> +	}

[Severity: Medium]
Is the logic for disabling the redundant ADC2 channel inverted here?

When adi,vpower-drns-enable is true, VPWR is configured to monitor DRNS,=20
making the DRNS ADC2 channel redundant, but the driver disables the DRAIN=20
channel. When false, VPWR monitors DRAIN, making DRAIN redundant, but the=20
driver disables DRNS. This leaves the redundant channel active while=20
disabling the actively monitored channel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260314-ltc4283-su=
pport-v7-0-1cda48e93802@analog.com?part=3D2
