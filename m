Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836213CF962;
	Tue, 13 Oct 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901169; cv=none; b=Aen2tsN38hHIZBv/mF2Slgv2tlIl+Ys4ggcp/jHdz4Sm1iHcUY3P5GfeJtd1omNX48SfCJi0Lo29cjk4pn63+kMn5qMOkrutumt+XSNx3VyWalucJJyxYH1b4mqQpc+uTeUvsSviye8YmsBThm2AOSa4aP4FA4xr52g76FStiFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901169; c=relaxed/simple;
	bh=pu6RB8wJgqKeCWb3wGNWgaR5I0HueSUqFe1i0syZLHU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fBY7y4jhPuzqGQrtlFaR+ecLkRa7GX8Ebv57z4A95McJ5kFrZuhq8KclsUPYFmpG6C178hHj/T+6JjqooEQDxb4HnDv/j1wx/RrymX7ekREg93HNVSmF+wir6PrwWRlTte+anVN8UAR2J2I6WyY8gup93EgFfKtRnq4l7A8hQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyA21RFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyA21RFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC85B1F000FF;
	Tue, 13 Oct 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901168;
	bh=Lf31ryBjquCcXxq4TNfj3u2swj7rSqanVLAIPq9EgBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyA21RFTVjjYXKL+EdpSKAiBZ5J+NJHBUHLd9EWU4+n/VjC/j6udVVaZRMM1VAC5P
	 ZA5BQOeSCV057DF9pdk6nrLKjqKiMa57CRzxyuZaOlrotfNatBITtfvGbGcUFITLdq
	 jrnEi60Bod36v5LterU9BBFjio4HvlxHROxiAXSJRFtJcErA1WzMcTzUYOFlPW3Gdp
	 dGiB2wG/udQrAFixOct1fhfnQ0N/zSrT5D1r+/O514pZljKSzb4HiMG0EmeUrN3n68
	 ZC5MtL+9kQpBNY+t67rbEoS9iNCJlMs+OAgLJAd5SLz1+SbHOiqHCvIH+acNAFRunU
	 JdqDjfEi45UZQ==
Message-ID: <sashiko-outbox-169896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
 <20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:19:27 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] iio: max34417: silent truncation of 64-bit software accumulator
- [High] iio: max34417: sysfs reads violate 1ms hardware UPDATE delay const=
raint
- [Medium] iio: max34417: u32 acc_count overflows causing corrupted power c=
alculations
- [Medium] iio: max34417: device registered before hardware initialization =
completes
- [Medium] iio: max34417: unprivileged log-spam DoS via non-rate-limited de=
v_warn
- [Medium] iio: adc: max34417: data race and TOCTOU on cam_mode causes inco=
rrect statistics
--

commit ebd13d02bb2cfb7ea4951f2b1c27883dde2b138e
Author: Neil Armstrong <neil.armstrong@linaro.org>

iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power=
 Accumulator

The MAX34417 is a specialized current and voltage monitor used to determine
power consumption of portable systems. The driver supports getting the chan=
nels
voltage, average power and accumulated average power and energy over an
I2C/SMBUS serial interface.

> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
> new file mode 100644
> index 0000000000000..00d7f20cd9531
> --- /dev/null
> +++ b/drivers/iio/adc/max34417.c
> @@ -0,0 +1,777 @@

[ ... ]

> +struct max34417_data {
> +	struct iio_dev *indio_dev;
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct mutex lock;
> +	u32 input_correction[MAX34417_CHANNEL_COUNT];
> +	const char *input_label[MAX34417_CHANNEL_COUNT];
> +	bool cam_mode;
> +	u64 acc_power[MAX34417_CHANNEL_COUNT];
> +	u32 acc_count[MAX34417_CHANNEL_COUNT];
> +};

[Severity: Medium]
Will this 32-bit counter overflow during continuous long-term accumulation?

In Continuous Accumulation Mode (CAM), the hardware sample counter is repea=
tedly
added to this variable across sysfs reads. At the maximum sample rate of 10=
24
SPS, a 32-bit counter will overflow in approximately 48 days. When this
wrap-around occurs, the subsequent average power calculation
(div_u64(acc_power, acc_count)) will divide the large 64-bit acc_power by a
small or zero acc_count, resulting in a corrupted power reading or a divisi=
on
by zero panic. Should acc_count be promoted to u64?

[ ... ]

> +static int max34417_read_voltage(struct max34417_data *max34417,
> +				 const struct iio_chan_spec *chan, int *val)
> +{
> +	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
> +	u16 voltage;
> +	int rc;
> +
> +	guard(mutex)(&max34417->lock);
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

[Severity: High]
Does this bypass the hardware's 1ms UPDATE delay constraint?

The driver notes that "UPDATE commands should be no less than 1msec apart f=
or
reliable measurements." While max34417_trigger_smm() properly enforces this
delay, the sysfs read handlers for CAM mode unconditionally write to
MAX34417_UPDATE_REG. If an unprivileged userspace process polls the sysfs
attributes faster than 1ms, it might violate this constraint, potentially
leading to unreliable measurements, missing samples, or bus lockups.

[ ... ]

> +static int max34417_read_power(struct max34417_data *max34417,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2)
> +{

[ ... ]

> +	if (max34417->cam_mode) {
> +		u32 acc_count;
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
> +		if (unlikely(acc_count =3D=3D 0)) {
> +			dev_warn(max34417->dev, "unexpected zero accumulator count\n");

[Severity: Medium]
Could this non-rate-limited warning lead to a log-spam denial of service?

If an unprivileged userspace process repeatedly reads the attribute in a ti=
ght
loop, it will extract data faster than the hardware's sample rate, causing =
the
counter to evaluate to 0. This blindly prints a warning using dev_warn()
without any rate limiting, which could flood the kernel log buffer and mask
legitimate kernel messages. Should dev_warn_ratelimited() be used instead?

> +			*val =3D 0;
> +			*val2 =3D 0;
> +
> +			return IIO_VAL_INT_64;
> +		}
> +
> +		power =3D div_u64(acc_power, acc_count);
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
> +	*val =3D FIELD_GET(GENMASK_ULL(31, 0), power);
> +	*val2 =3D FIELD_GET(GENMASK_ULL(55, 32), power);

[Severity: High]
Does this silently truncate the upper 8 bits of the 64-bit software
accumulator?

GENMASK_ULL(55, 32) explicitly masks off bits 56-63, meaning any accumulated
value exceeding 56 bits is silently truncated and dropped before being
exported to IIO userspace. Since CAM mode continuously accumulates readings,
the u64 can easily exceed 56 bits in sustained operation, causing the
userspace reading to wrap around prematurely. Should this use
GENMASK_ULL(63, 32) or upper_32_bits(power)?

> +
> +	return IIO_VAL_INT_64;
> +}
> +
> +static int max34417_read_energy(struct max34417_data *max34417,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2)
> +{

[ ... ]

> +	/* Get current channel power and reset them */
> +	acc_power =3D max34417->acc_power[chan->channel];
> +	max34417->acc_power[chan->channel] =3D 0;
> +	max34417->acc_count[chan->channel] =3D 0;
> +
> +	*val =3D FIELD_GET(GENMASK_ULL(31, 0), acc_power);
> +	*val2 =3D FIELD_GET(GENMASK_ULL(55, 32), acc_power);

[Severity: High]
Does this also silently truncate the upper 8 bits of the 64-bit accumulator?

Just as in max34417_read_power(), this GENMASK_ULL(55, 32) truncates bits
56-63 of acc_power.

[ ... ]

> +static int max34417_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max34417_data *max34417 =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			return max34417_read_voltage(max34417, chan, val);
> +		case IIO_POWER:
> +			/* In default mode, we return a single measurement */
> +			if (max34417->cam_mode)
> +				return -EINVAL;
> +
> +			return max34417_read_power(max34417, chan, val, val2);

[Severity: Medium]
Could this lockless check of cam_mode lead to a TOCTOU race and return
incorrect statistics?

Here, cam_mode is evaluated without holding the mutex. Concurrently, a sysfs
write to in_energy_enable could call max34417_setup_cam_mode(), taking the
mutex and setting cam_mode to true. When max34417_read_power() is then
called, it acquires the mutex, sees cam_mode is true, and executes the CAM
mode logic. This would unexpectedly return an averaged measurement instead =
of
a single-shot reading, violating the expected IIO channel behavior.

[ ... ]

> +static int max34417_probe(struct i2c_client *client)
> +{

[ ... ]

> +	indio_dev->channels =3D max34417_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(max34417_channels);
> +	indio_dev->name =3D "max34417";
> +	indio_dev->info =3D &max34417_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +
> +	rc =3D devm_iio_device_register(dev, indio_dev);
> +	if (rc)
> +		return rc;
> +
> +	/* Reset mode and set accumulator width to Wide */
> +	rc =3D regmap_write(max34417->regmap, MAX34417_CONTROL_REG, MAX34417_CO=
NTROL_MODE);

[Severity: Medium]
Is it safe to register the IIO device before the hardware initialization
completes?

devm_iio_device_register() exposes the device and its sysfs attributes to
userspace immediately. A userspace process or udev rule could open the devi=
ce
and trigger read_raw or write_raw callbacks before the hardware is placed
into the correct mode (MAX34417_CONTROL_MODE) or its internal accumulators
are reset. Should the hardware configuration happen prior to registration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-topic-sm8x=
50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org?part=3D3
