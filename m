Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632273;
	b=ss1cfsRuzOyul8Kx7c/uv+mbI3OtklFbLtUuTikChGm4gQsNv826hzvzWGhNsJZ0W+aK
	 JKbFb2QW/hsd4n4LZYjgJSYL5BTnL+pUNocUY94Zd2b2ODmk1QHoeZWQa8o7qnYgzUhlz
	 8mTrdsaZdefCvx1YAmtHdmo6vxwEhV1MOR092/Z8gwX+UG6gNDASZxXBXErjtwIwjT5cg
	 R/ODCsGAcQ183tWR7qt2zWSQZ5EnQn98c+L4XK1diw9JEgZfS3vpFtgOy1oOLoAQf6gRB
	 5cJiyQ2EkAwuxMPCwSG0Ub4J17WOgO806DzAcSAgQxgmcHZWUqhVL7qiywb3IsI8oRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632273;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ttlx1S4g0qJqX23tQAeg+M/sK6IAj7cChCsv1kdsaJU=;
	b=39GQlK9JDrRy0UUNCySHZCFW8pmq1X1UhsYQriF90rf9iM6yieORidHb1+FzZkGG6iau
	 VwkB2UnY8Yuh6+Ms+1Oj4xA21WJNinaXA2slpMZP1o8Q+sPajK7cjz3jjbgCtSPXek3fj
	 3NFvDovs4q4UrO+XTkciZS1Gwn6zAFxeVIoP9xO0Gtdc3e4qApD3X66sq9H/GvBoY6ru+
	 vUQxStamdJ2L+E2tcbzZ5dVzr3hVv7MGCWa/5fkD/6+floUX4NACgDKFyg3wFXHHvGnfH
	 3UkRjFLedBxgEbrJb+PGz4u4Dcqx3O8MdiCSpi/WYzVps3I1yflRoxTZ23KGMOvxBgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMdHzEM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C86076D82;
	Mon,  2 Nov 2026 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMdHzEM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B111F00A1C;
	Mon,  2 Nov 2026 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632272;
	bh=ttlx1S4g0qJqX23tQAeg+M/sK6IAj7cChCsv1kdsaJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMdHzEM2Ne9oC7GEP8asCtIFedtLZlI3L9cav9FsvL1BCTRp4lQStfqhgLyQilr+D
	 U9ebUai7tH2x/RMMMVLE7NOsvMuPPiMlHIiPYiSK0ii/PGbIuLNW1LxsDEpS6HMuxg
	 Tq23LoAJpgYu30xGND7LmFH4mS7VkHAUwelebmnWvXx3p3ouHsZdvESeXnf3LYbnkG
	 4v9H6mU/3IoAgPxBli59I65aeyw5HeAmJoTAhpYAEGJ/5WkVgS7P2LwQ7XZFRddX+e
	 YxOK9dQHELDt51xjFI5lGV1GIC9nUYCg4NoySWO9zSnLN8RggbTpcPoLK/zgPRuw/m
	 A3pRXaiSDsYTQ==
Message-ID: <sashiko-outbox-193640@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-3-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261102-topic-sm8x50-iio-max34417-adc-v5-3-0ffa5e5f2d5c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:11:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/e=
nergy read
- [Medium] iio: adc: max34417: missing 1 ms delay between UPDATE commands
- [Medium] iio: adc: max34417: scale truncation and mJ unit in max34417_rea=
d_raw()
- [Medium] iio: adc: max34417: missing UPDATE before CAM in max34417_setup_=
cam_mode()
- [Low] iio: adc: max34417: reuse max34417_reset_smm() in max34417_trigger_=
smm()
--

commit e5d0251e2d5be0cc82051f421a62b0919d01161f
Author: Neil Armstrong <neil.armstrong@linaro.org>

iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power=
 Accumulator

This commit adds an IIO ADC driver for the Analog Devices MAX34417
four-channel current and voltage monitor, supporting single-shot and
continuous accumulation measurements of voltage, average power, and energy
over I2C/SMBus.

> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
> new file mode 100644
> index 0000000000000..e679cf142141b
> --- /dev/null
> +++ b/drivers/iio/adc/max34417.c

[ ... ]

> +static int max34417_reset_smm(struct max34417_data *max34417)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	int rc;
> +
> +	/* Set SMM=3D0 to re-init the SMM mode */
> +	rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_SM=
M);
> +	if (rc)
> +		return rc;
> +
> +	/* Reset accumulators after setting SMM=3D0 */
> +	return regmap_write(map, MAX34417_UPDATE_REG, 1);
> +}
> +
> +static int max34417_trigger_smm(struct max34417_data *max34417)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	u32 control;
> +	int rc;
> +
> +	rc =3D regmap_read(map, MAX34417_CONTROL_REG, &control);
> +	if (rc)
> +		return rc;
> +
> +	if (control & MAX34417_CONTROL_SMM) {
> +		/* Set SMM=3D0 to re-init the SMM mode */
> +		rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_SMM);
> +		if (rc)
> +			return rc;
> +
> +		/* Reset accumulators after setting SMM=3D0 */
> +		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	}

[Severity: Low]
This isn't a bug, but could max34417_trigger_smm() call
max34417_reset_smm(max34417) here instead of duplicating the
regmap_clear_bits() and regmap_write() sequence?

> +
> +	/* Enable SMM to do a single accumulation */
> +	rc =3D regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_SMM);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * After the SMM bit is changed, the UPDATE command should be sent
> +	 * to reset the accumulators and perform the selected scan operation.
> +	 */
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +	/*
> +	 * UPDATE commands should be no less than 1msec apart for reliable
> +	 * measurements, since in Manual mode the SPS is 1kHz, we need wait
> +	 * for the measurement to finish before moving the data in the SMbus
> +	 * registers.
> +	 */
> +	fsleep(1 * USEC_PER_MSEC);
> +
> +	return 0;
> +}

[ ... ]

> +static int max34417_check_ovf(struct max34417_data *max34417)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	u32 control;
> +	int rc;
> +
> +	rc =3D regmap_read(map, MAX34417_CONTROL_REG, &control);
> +	if (rc)
> +		return rc;
> +
> +	if (!(control & MAX34417_CONTROL_OVF))
> +		return 0;
> +
> +	rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG,
> +			       MAX34417_CONTROL_OVF);
> +	if (rc)
> +		return rc;
> +
> +	return regmap_write(map, MAX34417_UPDATE_REG, 1);
> +}
> +
> +/*
> + * Save all power accumulators and counter after each UPDATE command
> + * since it will reset the internal registers for ALL channels,
> + * so in order to not loose any captured data we retrieve all registers
> + * and accumulate them in the context variables.
> + * When user gets either power or energy, those variables content
> + * will be returned and zero-ed to return the power accumulated
> + * since last read for each separate channel.
> + */
> +static int max34417_save_accumulators(struct max34417_data *max34417)
> +{
> +	u64 acc_power;
> +	u32 acc_count;
> +	int rc;
> +
> +	rc =3D max34417_read_acc_count(max34417, &acc_count);
> +	if (rc)
> +		return rc;
> +
> +	for (int i =3D 0; i < MAX34417_CHANNEL_COUNT; i++) {
> +		rc =3D max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
> +					     &acc_power);
> +		if (rc)
> +			return rc;
> +
> +		/* TODO sanitize accumulators in case of overflow */
> +		max34417->acc_power[i] +=3D acc_power;
> +		max34417->acc_count[i] +=3D acc_count;
> +	}
> +
> +	/* Check for overflow */
> +	return max34417_check_ovf(max34417);
> +}
> +
> +static int max34417_read_voltage(struct max34417_data *max34417,
> +				 const struct iio_chan_spec *chan, int *val)
> +{
> +	struct regmap *map =3D max34417->regmap;
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
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
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
> +	rc =3D regmap_noinc_read(map, chan->address, &buf, sizeof(buf));
> +	if (rc)
> +		return rc;
> +
> +	if (!max34417->cam_mode) {
> +		rc =3D max34417_reset_smm(max34417);
> +		if (rc)
> +			return rc;
> +	}

[Severity: Medium]
As reported by Sashiko on v3 [1], writes to MAX34417_UPDATE_REG must be at
least 1 ms apart because a 4-channel scan takes roughly 976 us at 1024
samples per second in single-shot mode and 651 us at 1536 samples per
second in continuous accumulation mode, yet fsleep(1 * USEC_PER_MSEC) is
only called once at the end of max34417_trigger_smm().

In continuous accumulation mode, max34417_setup_cam_mode(),
max34417_read_voltage(), max34417_read_power(), and max34417_read_energy()
write MAX34417_UPDATE_REG without enforcing a minimum interval since the
previous update. If userspace reads in_powerY_mean_raw within 1 ms of
enabling in_energy_en, or reads the same channel twice within one scan
period, MAX34417_UPDATE_REG is written before a single sample is
accumulated, causing MAX34417_ACC_COUNT_REG to read as 0, triggering the
"unexpected zero accumulator count" warning, and resetting the in-progress
hardware scan.

Similarly, in max34417_save_accumulators() -> max34417_check_ovf(), if
MAX34417_CONTROL_OVF is set, it clears the flag and immediately writes
MAX34417_UPDATE_REG a second time without waiting 1 ms or saving samples
accumulated during the readout; in max34417_read_voltage(), this also
happens before chan->address is read.

In single-shot mode, max34417_read_voltage() and max34417_read_power()
write MAX34417_UPDATE_REG, perform one read, and immediately call
max34417_reset_smm(), which writes MAX34417_UPDATE_REG again without a 1 ms
delay (and max34417_trigger_smm() can also issue two back-to-back writes to
MAX34417_UPDATE_REG when MAX34417_CONTROL_SMM is already set).

Should the driver track the timestamp of the last MAX34417_UPDATE_REG write
or enforce the minimum delay across all paths that issue an update command?

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
> +	struct regmap *map =3D max34417->regmap;
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
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Only get the accumulator counter in CAM mode, in SMM mode
> +	 * we only accumulate once, so the counter is 1
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
> +			power =3D 0;
> +		} else {
> +			power =3D div64_u64(acc_power, acc_count);
> +		}
> +	} else {
> +		rc =3D max34417_read_acc_power(max34417, chan->address, &power);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D max34417_reset_smm(max34417);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	iio_val_s64_decompose(power, val, val2);
> +
> +	return IIO_VAL_INT_64;
> +}
> +
> +static int max34417_read_energy(struct max34417_data *max34417,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	u64 acc_power;
> +	int rc;
> +
> +	/* Move the data to the SMBus registers */
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/* Retrieve all channels to avoid missing data for other channels */
> +	rc =3D max34417_save_accumulators(max34417);
> +	if (rc)
> +		return rc;
> +
> +	/* Get current channel power and reset them */
> +	acc_power =3D max34417->acc_power[chan->channel];
> +	max34417->acc_power[chan->channel] =3D 0;
> +	max34417->acc_count[chan->channel] =3D 0;

[Severity: Medium]
When continuous accumulation mode is enabled, both max34417_read_power()
(via IIO_CHAN_INFO_AVERAGE_RAW) and max34417_read_energy() (via
IIO_CHAN_INFO_RAW) accumulate hardware readings into the same per-channel
arrays max34417->acc_power[chan->channel] and
max34417->acc_count[chan->channel], and both functions zero those entries on
read.

Doesn't reading in_powerY_mean_raw discard all energy accumulated on that
channel since the last in_energyY_raw read, and conversely doesn't reading
in_energyY_raw wipe out the accumulated power and sample count for
in_powerY_mean_raw (causing an immediate subsequent read of
in_powerY_mean_raw to see acc_count =3D=3D 0 and warn)? Also, shouldn't
in_energyY_raw report monotonically accumulated energy while enabled rather
than resetting max34417->acc_power[chan->channel] to 0 on every read?

> +
> +	iio_val_s64_decompose(acc_power, val, val2);
> +
> +	return IIO_VAL_INT_64;
> +}
> +
> +static int max34417_setup_cam_mode(struct max34417_data *max34417, int v=
al)
> +{
> +	struct regmap *map =3D max34417->regmap;
> +	int rc;
> +
> +	if (max34417->cam_mode && !val) {
> +		rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG,
> +				       MAX34417_CONTROL_CAM | MAX34417_CONTROL_SMM);
> +		if (rc)
> +			return rc;
> +
> +		/*
> +		 * If CAM mode must be set, the Control byte must be set to
> +		 * desired values with CAM =3D 0, then followed by an UPDATE
> +		 */
> +		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;
> +	} else if (!max34417->cam_mode && val) {
> +		/*
> +		 * After this, the CAM mode bit can be set and another
> +		 * UPDATE must be sent.
> +		 */
> +		rc =3D regmap_update_bits(map, MAX34417_CONTROL_REG,
> +					MAX34417_CONTROL_SMM | MAX34417_CONTROL_CAM,
> +					MAX34417_CONTROL_CAM);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +		if (rc)
> +			return rc;

[Severity: Medium]
As reported by Sashiko on v4 [2], the comment split across the two branches
of max34417_setup_cam_mode() notes that to enable continuous accumulation
mode, MAX34417_CONTROL_REG must first be written with MAX34417_CONTROL_CAM
cleared and latched with a write to MAX34417_UPDATE_REG before setting
MAX34417_CONTROL_CAM and sending a second MAX34417_UPDATE_REG write.

If a previous single-shot read failed after max34417_trigger_smm() set
MAX34417_CONTROL_SMM (before max34417_reset_smm() could clear it),
MAX34417_CONTROL_SMM remains set in hardware while max34417->cam_mode is
false. When max34417_setup_cam_mode() is then called with val !=3D 0,
regmap_update_bits() clears MAX34417_CONTROL_SMM and sets
MAX34417_CONTROL_CAM in a single transaction without first latching the
CAM =3D 0, SMM =3D 0 state via MAX34417_UPDATE_REG.

Should the enable path in max34417_setup_cam_mode() clear
MAX34417_CONTROL_SMM (with MAX34417_CONTROL_CAM =3D 0) and write
MAX34417_UPDATE_REG before setting MAX34417_CONTROL_CAM?

> +
> +		/* Reset counters and accumulators */
> +		for (int i =3D 0; i < MAX34417_CHANNEL_COUNT; i++) {
> +			max34417->acc_power[i] =3D 0;
> +			max34417->acc_count[i] =3D 0;
> +		}
> +	}
> +
> +	max34417->cam_mode =3D val;
> +
> +	return 0;
> +}

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			/* Scale to mV */
> +			*val =3D MAX34417_VOLTAGE_CORRECTION_SCALE * MILLI;
> +			*val2 =3D MAX34417_VOLTAGE_FULL_SCALE_BITS;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;
> +		case IIO_POWER:
> +			/*
> +			 * Scale to mW
> +			 * (1000 * (Power Accumulation / Counter) * Correction) / 2^30
> +			 */
> +			*val =3D max34417->input_correction[chan->channel] * MILLIWATT_PER_WA=
TT;
> +			*val2 =3D MAX34417_PWR_AVG_FULL_SCALE_BITS;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;
> +		case IIO_ENERGY:
> +			/*
> +			 * Scale to mJ
> +			 * P=3D(1000 * (Power Accumulation / Counter) * Correction) / 2^30
> +			 * t=3D(Counter / Samples per Second)
> +			 * E=3D(P * t)
> +			 * Can be simplified to:
> +			 * (1000 * Power Accumulation * Correction) / (2^30 * SPS)
> +			 * The denominator doesn't fit in 32bit so scale down both terms.
> +			 */
> +			*val =3D max34417->input_correction[chan->channel];
> +			*val2 =3D div_u64(BIT_ULL(MAX34417_PWR_AVG_FULL_SCALE_BITS) *
> +					MAX34417_FAST_SPS_CAM, MILLI);
> +
> +			return IIO_VAL_FRACTIONAL;
> +		default:
> +			return -EINVAL;
> +		}

[ ... ]

> +static u32 max34417_calc_input_correction(u32 rsense_uOhm)
> +{
> +	/* Derived from Table 14. Correction Factors for Various Current-Sense =
Resistor Values */
> +	return (MAX34417_MAX_RSENSE * MAX34417_PWR_CORRECTION_SCALE) / rsense_u=
Ohm;
> +}

[Severity: Medium]
Does the scale calculation in max34417_read_raw() and
max34417_calc_input_correction() lose significant precision and use the
wrong unit for IIO_ENERGY?

1. For IIO_ENERGY, max34417_read_raw() sets *val to input_correction (which
   is 24 when rsense_uOhm is 100000 uOhm) and *val2 to
   div_u64(BIT_ULL(30) * 1536, 1000) =3D 1649267441 with IIO_VAL_FRACTIONAL.
   Because iio_format_value() formats IIO_VAL_FRACTIONAL as
   div_s64((s64)vals[0] * 1000000000LL, vals[1]) with 9 decimal places,
   24 * 10^9 / 1649267441 truncates to 14 (0.000000014 instead of
   0.000000014551915), losing about 3.8% precision.

2. In max34417_calc_input_correction(),
   (MAX34417_MAX_RSENSE * MAX34417_PWR_CORRECTION_SCALE) / rsense_uOhm
   divides 2400000 by rsense_uOhm using integer arithmetic before
   max34417_read_raw() scales by MILLIWATT_PER_WATT, truncating non-integer
   correction factors (for instance, rsense_uOhm =3D 90000 yields 26 instead
   of 26.667, a 2.5% error).

3. Documentation/ABI/testing/sysfs-bus-iio specifies that in_energy_raw and
   in_energy_scale produce values in Joules after applying the scale,
   whereas max34417_read_raw() scales IIO_ENERGY to millijoules.

[1] https://lore.kernel.org/r/sashiko-outbox-169896@kernel.org
[2] https://lore.kernel.org/r/20261028-topic-sm8x50-iio-max34417-adc-v4-3-d=
4baaf3ee903@linaro.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-topic-sm8x=
50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org?part=3D3
