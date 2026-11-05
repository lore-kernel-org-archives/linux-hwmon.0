Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883633;
	b=18a63A+34HILpWHEq838bijvY3ugSiGPa/O9SHDo1GsyDmzJf8DU0Q3LBeaKVSMxXNf0
	 MZz/BMn7x0+V2dpXUyvc05QmsWKYcMe8OXQ1RhR7YLlSySQX8GCSglnBVaNkGGsuU46N5
	 RXEdYBcHHpwMoONymbPXcU1nnE9HyjMfsqUKta464z+AqrBhUiSKfuQ65IfURj+Dh9td1
	 9sRaMacy1N/wHAFo49w0WFJAbekk5z6MHy5DoKG7yuPdzeTsVfx2d8j+HEznqGCW1efx2
	 nz7A23m/HuxpLGllfXMNtTNRmUKAfbs56RKv849BrQD3NRk51GIPEdwg4ngWgLm4L/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883633;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J96OsuBjLSNeA3D2jOIRJ0YfmmxlmMH0TVMBjsYgm8E=;
	b=rc2RRHEwIzS+C5gr9l5o19i/aJiC0Bl8KdRjdszhXvexgUhVma3UbKQVv8FY6YSuJKFx
	 isBRqiPcq6ZZjEOg4ZMtXIEiQd9lK8tFmhWhtIcU6uTVaDpk4Z93wQ92ZJQgDIthBbrgA
	 cl/9pjg2Y8ZUDojZkaXwGQ8YCBKVbAWqPM1Se7TgY2wmT2l0EPsTlRimH0OdvPeVtc+m0
	 zF3W78/HP6qDHDWZTIVo7a7h6UqhIozlUsVuW/YequLnLh8uF+4gsXLFYXHvy/XhumfU5
	 ZVRBC+KaJRJ5DAyu8OyvI3amBB5kc8CuuUrPaayhYeAkITDaXCibVbw1wIFBoScCDSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+dsiX+z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83106606A326;
	Thu,  5 Nov 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+dsiX+z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14591F000C1;
	Thu,  5 Nov 2026 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883633;
	bh=J96OsuBjLSNeA3D2jOIRJ0YfmmxlmMH0TVMBjsYgm8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+dsiX+zrv08QcgNApY6QdYr+2GMS5hwFzRlpvricDjZuZcCVL1ycfI7d6pbPdccx
	 c0+3MMjunsCUx8F6VZfT62YUCe+tcpOebOeI+qK5jQw2AejHgK4XZ88tj4wJVp7SAC
	 g7v6i9x60jQz/0Xtxru7AM4KFG4jkgxh2BwLNDp8cgFW8EZ5PLGPemugExkJaHLvml
	 Tl1Lmf/7TaJ1EgyB1SG9m8vBIa63m1De2qE7jVFVfyd5Aq8ZOwqrMRxSYDwSa3cJxz
	 xjvvkHRLCefoqn/x2vWqdrefGg1Vc+YP937r5rKNeLWs89ogIYU9kcMm0MHwt7PrBl
	 M2dk+Pv4n0TVA==
Message-ID: <sashiko-outbox-199091@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-3-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
 <20261105-topic-sm8x50-iio-max34417-adc-v6-3-63b4e8279633@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 13:00:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] iio: adc: max34417: energy scale underflows to zero in max34417_=
read_raw()
- [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/e=
nergy read
- [Medium] iio: adc: max34417: missing 1 ms delay and premature UPDATE on r=
ead/setup
--

commit b2b3b8bbfcafc2973680f358dc7e0d74750a2a05
Author: Neil Armstrong <neil.armstrong@linaro.org>

iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power=
 Accumulator

This commit adds an IIO ADC driver for the Analog Devices MAX34417
four-channel power accumulator, supporting single-shot voltage and power
readings as well as continuous accumulation mode for average power and
energy measurements over I2C/SMBus.

> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
> new file mode 100644
> index 0000000000000..f12d0e8ef1a68
> --- /dev/null
> +++ b/drivers/iio/adc/max34417.c

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
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/* Save the timestamp for the next read */
> +	max34417->last_update =3D ktime_get();
> +
> +	return 0;
> +}

[ ... ]

> +static int max34417_read_voltage(struct max34417_data *max34417,
> +				 const struct iio_chan_spec *chan, int *val)
> +{

[ ... ]

> +	/*
> +	 * Move the new UPDATE data into the SMBus read registers.
> +	 * This will also reset the accumulators, returning the
> +	 * power accumulated since the last UPDATE.
> +	 */
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/* Save the timestamp for the next read */
> +	max34417->last_update =3D ktime_get();
> +
> +	if (max34417->cam_mode) {
> +
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
> +	/* Ignore first byte which contains the Byte Count & data starts at Bit=
 2 */
> +	*val =3D get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
> +
> +	return IIO_VAL_INT;
> +}

[Severity: Medium]
As reported by Sashiko on v5 [1], in drivers/iio/adc/max34417.c, can the
MAX34417_UPDATE_REG sequencing in max34417_check_ovf(),
max34417_read_voltage(), and max34417_setup_cam_mode() violate the 1 ms
minimum interval between UPDATE commands or overwrite latched voltage data?

In max34417_read_voltage(), max34417_read_power(), and
max34417_read_energy(), the caller writes MAX34417_UPDATE_REG and then
immediately calls max34417_save_accumulators() -> max34417_check_ovf(). If
MAX34417_CONTROL_OVF is set, max34417_check_ovf() clears OVF and writes
MAX34417_UPDATE_REG a second time without waiting 1 ms after the caller's
UPDATE command.

Furthermore, in max34417_read_voltage(), max34417_save_accumulators() is
called before regmap_noinc_read(map, chan->address, &buf, sizeof(buf)). If
MAX34417_CONTROL_OVF was set because an accumulator saturated and stopped
measuring, won't the second UPDATE write inside max34417_check_ovf()
overwrite the latched SMBus registers before the voltage register is read?

Similarly, in max34417_setup_cam_mode():

	} else if (!max34417->cam_mode && val) {
		rc =3D regmap_clear_bits(map, MAX34417_CONTROL_REG,
				       MAX34417_CONTROL_CAM);
		if (rc)
			return rc;

		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
		if (rc)
			return rc;

		rc =3D regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM);
		if (rc)
			return rc;

		rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);

the function does not check max34417->last_update before its first write to
MAX34417_UPDATE_REG, and when enabling CAM mode it writes
MAX34417_UPDATE_REG twice back-to-back without a 1 ms delay.

> +static int max34417_read_power(struct max34417_data *max34417,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2)
> +{

[ ... ]

> +	if (max34417->cam_mode) {
> +		s64 acc_count;
> +		s64 acc_power;
> +
> +		/* Retrieve all channels to avoid missing data for other channels */
> +		rc =3D max34417_save_accumulators(max34417);
> +		if (rc)
> +			return rc;
> +
> +		if (max34417->overflow[chan->channel]) {
> +			max34417->overflow[chan->channel] =3D false;
> +			max34417->acc_power[chan->channel] =3D 0;
> +			max34417->acc_count[chan->channel] =3D 0;
> +			return -EOVERFLOW;
> +		}
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
> +			power =3D div64_s64(acc_power, acc_count);
> +		}
> +	} else {
> +		rc =3D max34417_read_acc_power(max34417, chan->address, &power);
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
> +	s64 delta_us =3D ktime_us_delta(ktime_get(), max34417->last_update);
> +	s64 acc_power;
> +	int rc;
> +
> +	/* Sleep up to 1msec to make sure we have a measurement cycle done */
> +	if (delta_us >=3D 0 && delta_us < (1 * USEC_PER_MSEC))
> +		fsleep((1 * USEC_PER_MSEC) - delta_us);
> +
> +	/* Move the data to the SMBus registers */
> +	rc =3D regmap_write(map, MAX34417_UPDATE_REG, 1);
> +	if (rc)
> +		return rc;
> +
> +	/* Save the timestamp for the next read */
> +	max34417->last_update =3D ktime_get();
> +
> +	/* Retrieve all channels to avoid missing data for other channels */
> +	rc =3D max34417_save_accumulators(max34417);
> +	if (rc)
> +		return rc;
> +
> +	if (max34417->overflow[chan->channel]) {
> +		max34417->overflow[chan->channel] =3D false;
> +		max34417->acc_power[chan->channel] =3D 0;
> +		max34417->acc_count[chan->channel] =3D 0;
> +		return -EOVERFLOW;
> +	}
> +
> +	/* Get current channel power and reset them */
> +	acc_power =3D max34417->acc_power[chan->channel];
> +	max34417->acc_power[chan->channel] =3D 0;
> +	max34417->acc_count[chan->channel] =3D 0;
> +
> +	iio_val_s64_decompose(acc_power, val, val2);
> +
> +	return IIO_VAL_INT_64;
> +}

[Severity: Medium]
As reported by Sashiko on v5 [2], when cam_mode is enabled in
drivers/iio/adc/max34417.c, won't reading average power in
max34417_read_power() and reading energy in max34417_read_energy() clobber
each other's state for the same channel?

Both functions consume and zero the shared per-channel fields
max34417->acc_power[chan->channel], max34417->acc_count[chan->channel], and
max34417->overflow[chan->channel]. As a result, reading in_powerX_mean_raw
discards the energy accumulated in software for channel X since the last
energy read, and reading in_energyX_raw resets the accumulated power and
sample counter needed for the next average power calculation (as well as
resetting the energy reading itself on every read instead of accumulating
monotonically while CAM mode is enabled).

[ ... ]

> +static int max34417_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{

[ ... ]

> +		case IIO_ENERGY:
> +			/*
> +			 * Scale to Joules
> +			 * P=3D((Power Accumulation / Counter) * Correction) / 2^30
> +			 * t=3D(Counter / Samples per Second)
> +			 * E=3D(P * t)
> +			 * Can be simplified to:
> +			 * (Power Accumulation * Correction) / (2^30 * SPS)
> +			 * But the denominator won't fit in 32bit and is not power of 2.
> +			 * But we can divide the numerator by SPS and shift both terms
> +			 * by a large power of two number and still use IIO_VAL_FRACTIONAL_LO=
G2
> +			 */
> +			*val =3D div_u64(max34417->input_correction[chan->channel] << 19,
> +				       MAX34417_FAST_SPS_CAM);
> +			*val2 =3D MAX34417_PWR_AVG_FULL_SCALE_BITS + 19;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;
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
As reported by Sashiko on v5 [3], doesn't the IIO_ENERGY scale calculation =
in
max34417_read_raw() underflow to zero in sysfs for almost all supported
shunt resistor values?

In max34417_probe_channel_node(), shunt-resistor-micro-ohms is accepted in
the range 1000 to 100000 micro-Ohms. max34417_calc_input_correction()
computes 2400000 / rsense_uOhm with integer division (which also truncates
non-integer correction factors such as 2400000 / 90000 =3D 26 instead of
26.667), yielding input_correction in the range [24, 2400].

In max34417_read_raw() for IIO_CHAN_INFO_SCALE on IIO_ENERGY, *val is in the
range [8192, 819200] and *val2 is 49 with IIO_VAL_FRACTIONAL_LOG2. When
__iio_format_value() in drivers/iio/industrialio-core.c formats
IIO_VAL_FRACTIONAL_LOG2:

	case IIO_VAL_FRACTIONAL_LOG2:
		tmp2 =3D shift_right((s64)vals[0] * 1000000000LL, vals[1]);
		tmp0 =3D (int)div_s64_rem(tmp2, 1000000000LL, &tmp1);

because 2^49 is 562,949,953,421,312, any rsense_uOhm >=3D 1456 micro-Ohms
produces vals[0] <=3D 562517, so (s64)vals[0] * 1000000000LL < 2^49 and tmp2
becomes 0, causing in_energyX_scale to read as 0.000000000. Even at 1000
micro-Ohms, tmp2 truncates to 1 (0.000000001 instead of 0.0000000014551915,
losing 31.3% precision), and in-kernel consumers such as
rescale_process_scale() in drivers/iio/afe/iio-rescale.c cast ULL(1) << *va=
l2
to int, truncating 1ULL << 49 to 0. Would returning a 64-bit decimal scale
type such as IIO_VAL_DECIMAL64_FEMTO via iio_val_s64_decompose() avoid this
underflow?

[1] https://lore.kernel.org/r/20261102-topic-sm8x50-iio-max34417-adc-v5-3-0=
ffa5e5f2d5c@linaro.org
[2] https://lore.kernel.org/r/20261102-topic-sm8x50-iio-max34417-adc-v5-3-0=
ffa5e5f2d5c@linaro.org
[3] https://lore.kernel.org/r/20261102-topic-sm8x50-iio-max34417-adc-v5-3-0=
ffa5e5f2d5c@linaro.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-topic-sm8x=
50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org?part=3D3
