Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194396;
	b=ZwkoBTcSugm2icsJ95ZC1TXvqwNfF7LWeG5ZoELGsNDMNhxTfRm9MZYSCzusnkFLwbDE
	 M8FfsxR5TPsW/1ACPiCWuxjDlHxaUjLHRHM/ByPZkopkbKW5uas3VEuiEXUaVu0lAJkFA
	 uhhi7NlZ5oto7vfzwTp8pHznvx5NG45XIEShNOmjO5GfBrpj7I4bCQlgIQCvgvawVhVFG
	 Hltt7zayIW+AzM9o40EnQJP8tswAF6Bcyd2b9FU2X6JULizVHpOh0ysbHREXsa2y2rk5D
	 kC0GVJnqDlz+mlOLzJpd2IloZPk+vyVL32rdaeuHG7RR3WRrejBy4G5NySkdBOlexDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xp9ThrwCoNoVF1h3ZengAAl6CwgWVhuHFNZnRS4UoaA=;
	b=UvQwcxub8cftnW68M1NFtXeaB2x+F3uf7QpVO+hy80tAlj3bW3ksQR/0JJlz1fdtUeDT
	 QjK5AvjvaZKX6H6K6qipaKiLGRLY/vVzIdGdkLaZNxpqvsgCtz7nDr+EmhInuTwiK6K8x
	 gOkNOAhGKPcNQWdPLlfZgtujjs5Iph+x2bn2Cj4O0H4hrjgPhV7nx6pAPRXH1J2Y1K5aY
	 r7YKnMU5PTpwqBABY1rmT3M/mPPLe4rCJ7Vfd8Z8fHpsBgUgeyTDmupTNWPf13lNz/svJ
	 waUssR84ulu3fiR9mXvGr2/b/CSSJTqaYPA8+ymnjs8iIQHRriZKySLYnuMxoMj47Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG0BZ7Ch;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D086606A322;
	Wed, 28 Oct 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG0BZ7Ch
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671821F01825;
	Wed, 28 Oct 2026 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194395;
	bh=xp9ThrwCoNoVF1h3ZengAAl6CwgWVhuHFNZnRS4UoaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oG0BZ7Chx5QRVRffMs9J45Xrvd+MFH42yTTFatxAVPX+/avHNpCCXd/9+5DBZ6e8w
	 8mHKg7qeMZf6OC61+STsra1jhcwesg01iG7bewAvAF9R11hMTgu3ISpWDrqYvRhPqh
	 Y0BDLD1YN7QPEQDqEUupW5g3w9YFbvyMoM31gkkUp4ktyoQI1qgMgqGBS3hcqju0xO
	 B2VcPiJFVKi33AG6VqP0alTRXXF9LknQIQ4meOL+KvXgBeMAqN+1kGpXccwUA/zeyc
	 QAdDwsYAr6gYHvjVX9tNYb514u1OKmm1GAI+kZu49ES4bA5xUBgqehqW4S2/ykSPSd
	 hES7C1FxN9NkA==
Message-ID: <sashiko-outbox-187926@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-3-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
 <20261028-topic-sm8x50-iio-max34417-adc-v4-3-d4baaf3ee903@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 13:33:14 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: adc: max34417: missing UPDATE write before setting CAM in m=
ax34417_setup_cam_mode()
- [Medium] iio: adc: max34417: missing 1 ms delay between UPDATE commands
--

commit 43fd5d352abe401ff6be6a80277fec3e15b10fb2
Author: Neil Armstrong <neil.armstrong@linaro.org>

iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power=
 Accumulator

This commit adds an IIO ADC driver for the Analog Devices MAX34417
four-channel high dynamic range power accumulator, supporting voltage,
average power, and energy measurements over I2C/SMBus.

> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
> new file mode 100644
> index 0000000000000..b1064cf631b51
> --- /dev/null
> +++ b/drivers/iio/adc/max34417.c

[ ... ]

> +static int max34417_trigger_smm(struct max34417_data *max34417)
> +{
> +	u32 control;
> +	int rc;
> +
> +	rc =3D regmap_read(max34417->regmap, MAX34417_CONTROL_REG, &control);
> +	if (rc)
> +		return rc;
> +
> +	if (control & MAX34417_CONTROL_SMM) {
> +		/* Set SMM=3D0 to re-init the SMM mode */
> +		rc =3D regmap_clear_bits(max34417->regmap, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_SMM);
> +		if (rc)
> +			return rc;
> +
> +		/* Reset accumulators after setting SMM=3D0 */
> +		rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* Enable SMM to do a single accumulation */
> +	rc =3D regmap_set_bits(max34417->regmap, MAX34417_CONTROL_REG,
> +			     MAX34417_CONTROL_SMM);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * After the SMM bit is changed, the UPDATE command should be sent
> +	 * to reset the accumulators and perform the selected scan operation.
> +	 */
> +	rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +	/*
> +	 * UPDATE commands should be no less than 1msec apart for reliable
> +	 * measurements.
> +	 */
> +	fsleep(1 * USEC_PER_MSEC);
> +
> +	return 0;
> +}

[ ... ]

> +static int max34417_check_ovf(struct max34417_data *max34417)
> +{
> +	u32 control;
> +	int rc;
> +
> +	rc =3D regmap_read(max34417->regmap, MAX34417_CONTROL_REG, &control);
> +	if (rc)
> +		return rc;
> +
> +	if (control & MAX34417_CONTROL_OVF) {
> +		rc =3D regmap_clear_bits(max34417->regmap, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_OVF);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int max34417_read_voltage(struct max34417_data *max34417,
> +				 const struct iio_chan_spec *chan, int *val)
> +{
> +	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
> +	int rc;
> +
> +	/* In SMM mode, trigger a measurement cycle manually */
> +	if (!max34417->cam_mode) {
> +		rc =3D max34417_trigger_smm(max34417);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* Move the new UPDATE data into the SMBus read registers */
> +	rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	if (max34417->cam_mode) {
> +		/* Retrieve all channels to avoid missing data for other channels */
> +		rc =3D max34417_save_accumulators(max34417);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	rc =3D regmap_noinc_read(max34417->regmap, chan->address, &buf, sizeof(=
buf));
> +	if (rc)
> +		return rc;
> +
> +	if (!max34417->cam_mode) {
> +		rc =3D max34417_reset_smm(max34417);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	*val =3D get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
> +
> +	return IIO_VAL_INT;
> +}
> +
> +static int max34417_read_power(struct max34417_data *max34417,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2)
> +{
> +	u64 power;
> +	int rc;
> +
> +	/* In SMM mode, trigger a measurement cycle manually */
> +	if (!max34417->cam_mode) {
> +		rc =3D max34417_trigger_smm(max34417);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/*
> +	 * Move the new UPDATE data into the SMBus read registers.
> +	 * In CAM mode this will also reset the accumulators, returning
> +	 * the power accumulated since the last UPDATE.
> +	 */
> +	rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Only get the accumulator counter in CAM mode, in SMM mode
> +	 * we only accumulate only once, so the counter is 1
> +	 */
> +	if (max34417->cam_mode) {
> +		u64 acc_count;
> +		u64 acc_power;
> +
> +		/* Retrieve all channels to avoid missing data for other channels */
> +		rc =3D max34417_save_accumulators(max34417);
> +		if (rc)
> +			return rc;
> +
> +		/* Get current channel power, counter and reset them */
> +		acc_power =3D max34417->acc_power[chan->channel];
> +		acc_count =3D max34417->acc_count[chan->channel];
> +		max34417->acc_power[chan->channel] =3D 0;
> +		max34417->acc_count[chan->channel] =3D 0;
> +
> +		if (acc_count =3D=3D 0) {
> +			dev_warn_ratelimited(&max34417->indio_dev->dev,
> +					     "unexpected zero accumulator count\n");

[Severity: Medium]
Can back-to-back writes to MAX34417_UPDATE_REG occur less than 1 ms apart in
these paths?

As noted in max34417_trigger_smm(), UPDATE commands must be at least 1 ms
apart for reliable measurements, since a 4-channel scan takes roughly 976 us
at 1024 SPS in SMM mode and 651 us at 1536 SPS in CAM mode. However,
fsleep(1 * USEC_PER_MSEC) is only called once at the end of
max34417_trigger_smm().

In CAM mode, if userspace enables in_energy_en via max34417_setup_cam_mode()
or reads in_energyX_raw via max34417_read_energy() and then reads
in_powerX_average_raw on the same channel within 1 ms, max34417_read_power()
writes MAX34417_UPDATE_REG before a single scan completes. That latches 0
accumulated samples from MAX34417_ACC_COUNT_REG, triggers the "unexpected
zero accumulator count" warning, and returns 0.

Similarly, max34417_save_accumulators() -> max34417_check_ovf() can issue an
immediate second UPDATE before max34417_read_voltage() reads the voltage
register, and in SMM mode both the recovery path in max34417_trigger_smm()
and max34417_reset_smm() issue UPDATE writes without enforcing the 1 ms
minimum delay.

Should the 1 ms minimum interval be enforced across all MAX34417_UPDATE_REG
writes?

> +
> +			*val =3D 0;
> +			*val2 =3D 0;
> +
> +			return IIO_VAL_INT_64;
> +		}

[ ... ]

> +static int max34417_setup_cam_mode(struct max34417_data *max34417, int v=
al)
> +{
> +	int rc;
> +
> +	if (max34417->cam_mode && !val) {
> +		rc =3D regmap_clear_bits(max34417->regmap, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_CAM | MAX34417_CONTROL_SMM);
> +		if (rc)
> +			return rc;
> +
> +		/*
> +		 * If CAM mode must be set, the Control byte must be set to
> +		 * desired values with CAM =3D 0, then followed by an UPDATE
> +		 */
> +		rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	} else if (!max34417->cam_mode && val) {
> +		/*
> +		 * After this, the CAM mode bit can be set and another
> +		 * UPDATE must be sent.
> +		 */
> +		rc =3D regmap_clear_bits(max34417->regmap, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_SMM);
> +		if (rc)
> +			return rc;
> +		rc =3D regmap_set_bits(max34417->regmap, MAX34417_CONTROL_REG,
> +				     MAX34417_CONTROL_CAM);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);

[Severity: Medium]
Is an intermediate write to MAX34417_UPDATE_REG missing between clearing
MAX34417_CONTROL_SMM and setting MAX34417_CONTROL_CAM in the enable branch =
of
max34417_setup_cam_mode()?

It looks like the comment describing the two-step sequence to enable CAM mo=
de
was split across the disable (!val) and enable (val) branches. When enabling
CAM mode in the (!max34417->cam_mode && val) branch, clearing
MAX34417_CONTROL_SMM is immediately followed by setting MAX34417_CONTROL_CAM
without an UPDATE write to latch the CAM =3D 0, SMM =3D 0 state first.

If a prior single-shot read in max34417_read_voltage() or
max34417_read_power() failed after max34417_trigger_smm() set
MAX34417_CONTROL_SMM, a subsequent write to enable the energy channel via
max34417_write_raw() -> max34417_setup_cam_mode() would transition directly
from SMM to CAM without latching the intermediate reset state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-topic-sm8x=
50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org?part=3D3
