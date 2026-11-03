Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717969;
	b=uWPo2ZAFInSVAPGswWPyrIVT57g+h3BacmizR/tgGIa4lW+YATLZPx0XqzZIf8N8ENlg
	 SRQORBx0UMhWsH0MbxJHSn3oybxsDICXuCjuM6cdk0clzI6B6oqWFyJNGY/6CwV8IA/lg
	 aPptEaX02+dLzQp5YRNWRfqOS+Wxfe/Vdc/S3j9GB0P0vU29zUn4IdOlRihOEPnxKTSnv
	 YdFNRVjA6K0Qv6Kad8gPuPOEk+DDgFe65W5xqA2z6PvM7X7gFdQl/bv8pT+hsopw8S1vm
	 /GVOXmtH2sZpfjZ284QgnndKOSJKC3NtVo+cfPWL0O+Cu/pTfuGpQ1OOFN6OB3zOxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=av6iXpXGA/lgjiHfsVWYR0lccsZKBf5SvoImZPAutT8=;
	b=V99P+xi0ZobsQ/DVHeSQtAU3t0zLeb8fw4a2maXILDaJt/2xAnUg29SsjC+O6K9X/yQC
	 bzkpKugLAEEwm5Zr2aUQcuY6dd07oEhjDZ+ZkI6VFDt8weflpLGnHUJ7Xm9tgS9RZ4Wbj
	 MlLLi3F8s2Af+aD8MZOrJrqoyITJVRSr3d6aASXNA0mHs0Yo43uB40jqYUZwfbyNDVoVK
	 +PczAZlcMfxNUjKXPov487dNO7se+ODIi7Pp42t3KPexJRs6MpsE1t3WH2QE6eyU6sKVm
	 VvdAiBqOikoH2wsfNzB3JDxQXD0/218r4nvty2IDDoIYs5Gk30vLLIOvv0Bt9acfYWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/RkLw2p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C556071A07;
	Tue,  3 Nov 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/RkLw2p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563631F00919;
	Tue,  3 Nov 2026 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717968;
	bh=av6iXpXGA/lgjiHfsVWYR0lccsZKBf5SvoImZPAutT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a/RkLw2picPvejCVJxSLfXJJ88Imgi3XVl72Jc/7AxwJqIByqaJa2lssevpHkxzqY
	 amGTqdVPrFdnO7g+BCud8b0Yv08bwTPg1F+7zQ4F1X5W5Vnxnrtr/iDUi4wfoMpSJy
	 GfyWWrX35rtT70RH/AtrBIZEo2blL0KxJNnU228mbDgQt4wSb2r69XMwpTCVPifrWL
	 8uOo8fqvaD0/krZYkNO0h2OehAzt6gKG052FguquPo8fiZjophvLZAXG/YRBxxt09f
	 vX8deXMuTwZOeSUV9MBUUUr3GZh235eWhiw3jmcJ0zskjOaD84e3Et1eC9xzzTcf4c
	 9qUzWfjhiMnYw==
Message-ID: <sashiko-outbox-195525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-pac1711-v5-5-71c20101a52e@microchip.com>
References: <20261103-pac1711-v5-0-71c20101a52e@microchip.com>
 <20261103-pac1711-v5-5-71c20101a52e@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:59:27 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] iio: adc: pac1711: wrong power and energy scale units in pac1711_r=
ead_raw()
- [High] iio: adc: pac1711: missing vdd-supply regulator enable in pac1711_=
probe()
- [Medium] iio: adc: pac1711: in_shunt_resistor uses micro-ohms instead of =
Ohms
- [Medium] iio: adc: pac1711: signed int overflow of shunt in pac1711_read_=
raw()
- [Medium] iio: adc: pac1711: premature jiffies_tstamp update in pac1711_se=
nd_refresh()
- [Low] iio: adc: pac1711: premature sample_rate_idx update in pac1711_writ=
e_raw()
--

commit c4f8dfb4bdee1e8ce1711a47ff2fad6880c4a9a3
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: adc: add support for PAC1711

This commit adds an IIO ADC driver for the Microchip PAC1711, PAC1721,
PAC1811, and PAC1821 single-channel power and current monitors with hardware
accumulators.

> diff --git a/drivers/iio/adc/pac1711.c b/drivers/iio/adc/pac1711.c
> new file mode 100644
> index 0000000000000..6adc37a7ba0be
> --- /dev/null
> +++ b/drivers/iio/adc/pac1711.c
> @@ -0,0 +1,1233 @@

[ ... ]

> +/* Full FSR power is multiplied by 10^9 to ensure precise scale calculat=
ion. */
> +#define PAC1711_PRODUCT_VOLTAGE_PV_FSR	(4200ULL * NANO)
> +#define PAC1721_PRODUCT_VOLTAGE_PV_FSR	(900ULL * NANO)

[ ... ]

> +static int pac1711_send_refresh(struct pac1711_chip_info *info, u32 wait=
_time)
> +{
> +	struct i2c_client *client =3D info->client;
> +	int ret;
> +
> +	/* Writing a REFRESH or a REFRESH_V command */
> +	ret =3D i2c_smbus_write_byte(client, PAC1711_REFRESH_REG_ADDR);
> +	if (ret) {
> +		dev_err(&client->dev, "%s - cannot send Refresh cmd (0x%02X)\n",
> +			__func__, PAC1711_REFRESH_REG_ADDR);
> +		return ret;
> +	}
> +
> +	/* Register data retrieval timestamp */
> +	info->chip_reg_data.jiffies_tstamp =3D jiffies;
> +
> +	/* Wait till the data is available */
> +	fsleep(wait_time);
> +
> +	return 0;
> +}

[ ... ]

> +static int pac1711_reg_snapshot(struct pac1711_chip_info *info, bool *re=
freshed)
> +{
> +	u32 wait_time;
> +	int ret;
> +
> +	guard(mutex)(&info->lock);
> +
> +	/* No hardware refresh is needed */
> +	if (refreshed)
> +		*refreshed =3D false;
> +
> +	/* Return early if the minimum polling time hasn't elapsed */
> +	if (!time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
> +			msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS)))
> +		return 0;
> +
> +	wait_time =3D (1024 * 1000) / pac1711_samp_rate_map_tbl[info->sample_ra=
te_idx];
> +
> +	/* A hardware refresh will happen */
> +	ret =3D pac1711_reg_snapshot_locked(info, wait_time);
> +	if (!ret && refreshed)
> +		*refreshed =3D true;
> +
> +	return ret;
> +}

[ ... ]

> +static ssize_t pac1711_read_shunt_resistor(struct iio_dev *indio_dev, ui=
ntptr_t private,
> +					   const struct iio_chan_spec *ch, char *buf)
> +{
> +	struct pac1711_chip_info *info =3D iio_priv(indio_dev);
> +
> +	guard(mutex)(&info->lock);
> +
> +	return sysfs_emit(buf, "%u\n", info->shunt);
> +}
> +
> +static int pac1711_set_acc_enable(struct pac1711_chip_info *info, int va=
l)
> +{
> +	struct i2c_client *client =3D info->client;
> +	struct device *dev =3D &client->dev;
> +	u32 wait_time, sample_rate;
> +	int ret =3D 0;
> +
> +	if (val !=3D 0 && val !=3D 1)
> +		return -EINVAL;
> +
> +	guard(mutex)(&info->lock);
> +
> +	if (val =3D=3D info->enable_acc)
> +		return 0;
> +
> +	/*
> +	 * Force a hardware refresh to zero out the internal accumulators
> +	 * and start a new measurement window, as the chip accumulates
> +	 * continuously in the background.
> +	 */
> +	if (val) {
> +		sample_rate =3D pac1711_samp_rate_map_tbl[info->sample_rate_idx];
> +		wait_time =3D (1024 * 1000) / sample_rate;
> +		ret =3D pac1711_send_refresh(info, wait_time);
> +	} else {
> +		info->chip_reg_data.acc_val =3D 0;
> +		info->chip_reg_data.vacc =3D 0;
> +		info->chip_reg_data.acc_count =3D 0;
> +	}

[Severity: Medium]
Should info->chip_reg_data.jiffies_tstamp be updated only after
pac1711_reg_snapshot_locked() has finished reading the measurement register=
s,
rather than inside pac1711_send_refresh()?

Currently, pac1711_send_refresh() sets info->chip_reg_data.jiffies_tstamp =
=3D
jiffies before sleeping for wait_time and before any registers are read into
info->chip_reg_data.

When pac1711_set_acc_enable() re-enables accumulation, it calls
pac1711_send_refresh() without reading the measurement registers into
info->chip_reg_data. If userspace reads in_voltage0_raw, in_current0_raw, or
in_power0_raw within 50 ms (PAC1711_MIN_POLLING_TIME_MS),
pac1711_reg_snapshot() sees the updated timestamp and returns early with st=
ale
cached values. The same issue occurs if an I2C block read fails in
pac1711_reg_snapshot_locked() after pac1711_send_refresh() succeeds.

Conversely, at 8 SPS where wait_time is 128 ms, recording jiffies_tstamp
before fsleep(wait_time) means the 50 ms cache window has already expired by
the time pac1711_send_refresh() returns.

> +
> +	if (!ret)
> +		info->enable_acc =3D val;
> +
> +	if (ret)
> +		dev_err(dev, "failed to reset accumulator: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * The value of the shunt resistor may be known only at runtime and set =
by a client
> + * application. This attribute allows to set its value in micro-ohms. Y =
is the channel
> + * number. The value is used to calculate current, power and accumulated=
 energy or
> + * Coulomb counter.
> + */
> +static ssize_t pac1711_write_shunt_resistor(struct iio_dev *indio_dev, u=
intptr_t private,
> +					    const struct iio_chan_spec *ch, const char *buf,
> +					    size_t len)
> +{
> +	struct pac1711_chip_info *info =3D iio_priv(indio_dev);
> +	struct device *dev =3D &info->client->dev;
> +	unsigned int sh_val;
> +	int ret;
> +
> +	ret =3D kstrtouint(buf, 10, &sh_val);
> +	if (ret) {
> +		dev_err(dev, "Shunt value is not valid\n");
> +		return ret;
> +	}
> +
> +	if (sh_val =3D=3D 0)
> +		return -EINVAL;
> +
> +	guard(mutex)(&info->lock);
> +
> +	info->shunt =3D sh_val;
> +
> +	return len;
> +}
> +
> +static const struct iio_chan_spec_ext_info pac1711_ext_info[] =3D {
> +	{
> +		.name =3D "in_shunt_resistor",
> +		.read =3D pac1711_read_shunt_resistor,
> +		.write =3D pac1711_write_shunt_resistor,
> +		.shared =3D IIO_SHARED_BY_ALL,
> +	},
> +	{ }
> +};

[Severity: Medium]
Does exposing in_shunt_resistor in micro-ohms violate the IIO sysfs ABI?

Documentation/ABI/testing/sysfs-bus-iio specifies that in_shunt_resistor is
expressed in Ohms. Here, pac1711_read_shunt_resistor() emits info->shunt
directly in micro-ohms via sysfs_emit(), and pac1711_write_shunt_resistor()
parses the input as an integer in micro-ohms via kstrtouint().

Should this format the value in Ohms using iio_format_value() with
IIO_VAL_FRACTIONAL (or IIO_VAL_INT_PLUS_MICRO) and parse writes with
iio_str_to_fixpoint(), matching other power monitor drivers such as pac1921?

[ ... ]

> +	case IIO_CHAN_INFO_SCALE: {
> +		u32 shunt;
> +
> +		guard(mutex)(&info->lock);
> +		shunt =3D info->shunt;
> +
> +		switch (chan->address) {
> +		case PAC1711_VBUS_REG_ADDR:
> +			*val =3D info->features->voltage_millivolts_max;
> +			*val2 =3D (info->vbus_mode =3D=3D PAC1711_FULL_RANGE_BIPOLAR) ? 15 : =
16;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;
> +		case PAC1711_VSENSE_REG_ADDR:
> +			/*
> +			 * Currents - scale for mA - depends on the channel's shunt value
> +			 * (100mV * 1000000) / (2^16 * shunt(uohm))
> +			 */
> +			*val =3D 1526;
> +			*val2 =3D shunt;
> +
> +			if (info->vsense_mode =3D=3D PAC1711_FULL_RANGE_BIPOLAR)
> +				*val =3D *val << 1;
> +
> +			return IIO_VAL_FRACTIONAL;

[Severity: Medium]
Can *val2 overflow to a negative value in pac1711_read_raw() when info->shu=
nt
exceeds INT_MAX?

Both pac1711_parse_fw() and pac1711_write_shunt_resistor() accept 32-bit
unsigned values up to U32_MAX into info->shunt, only rejecting zero. When
shunt > INT_MAX, assigning it to the signed int *val2 for IIO_VAL_FRACTIONAL
wraps *val2 negative, causing iio_format_value() to output a negative curre=
nt
scale. Should shunt values greater than INT_MAX be rejected?

> +		case PAC1711_VPOWER_REG_ADDR:
> +		case PAC1711_VACC_REG_ADDR:
> +			if (chan->type =3D=3D IIO_CHARGE) {
> +				/*
> +				 * Coulomb counter scale:
> +				 * 16-bit resolution: (100mV * NANO) / 2^16
> +				 * 12-bit resolution: (100mV * NANO) / 2^12
> +				 */
> +				u64 ref =3D info->features->has_16bit_resolution ?
> +						  1525878906250ULL : 24414062500000ULL;
> +
> +				if (info->vsense_mode =3D=3D PAC1711_FULL_RANGE_BIPOLAR)
> +					ref =3D ref << 1;
> +
> +				ref =3D div_u64(ref, shunt);
> +				*val2 =3D do_div(ref, 1 * NANO);
> +				*val =3D ref;
> +
> +				return IIO_VAL_INT_PLUS_NANO;
> +			}
> +
> +			/*
> +			 * Power - uW - it will use the combined scale
> +			 * for current and voltage
> +			 * current(mA) * voltage(mV) =3D power (uW)
> +			 */
> +			tmp =3D info->features->voltage_pv_fsr;
> +			do_div(tmp, shunt);
> +
> +			if (chan->type =3D=3D IIO_ENERGY)
> +				*val2 =3D info->features->has_16bit_resolution ? 32 : 24;
> +			else
> +				*val2 =3D 32;
> +
> +			if (info->vsense_mode =3D=3D PAC1711_FULL_RANGE_BIPOLAR)
> +				*val2 -=3D 1;
> +
> +			if (info->vbus_mode =3D=3D PAC1711_FULL_RANGE_BIPOLAR)
> +				*val2 -=3D 1;
> +
> +			shift =3D fls64(tmp) - 31;
> +			if (shift > 0) {
> +				tmp >>=3D shift;
> +				*val2 -=3D shift;
> +			}
> +
> +			*val =3D (int)tmp;
> +
> +			return IIO_VAL_FRACTIONAL_LOG2;

[Severity: High]
Are the scale units for IIO_POWER and IIO_ENERGY in pac1711_read_raw() off =
by
factors of 1,000 and 1,000,000 respectively?

According to Documentation/ABI/testing/sysfs-bus-iio, power channels
(in_powerY_raw * in_powerY_scale) must be reported in milliwatts (mW), and
energy channels (in_energy_raw * in_energy_scale) must be reported in Joules
(J).

However, PAC1711_PRODUCT_VOLTAGE_PV_FSR (4200ULL * NANO =3D 4.2 * 10^12) and
PAC1721_PRODUCT_VOLTAGE_PV_FSR (900ULL * NANO =3D 9 * 10^11) compute the
numerator in microwatts * micro-ohms, as noted in the comment above. Dividi=
ng
by shunt (in micro-ohms) and returning IIO_VAL_FRACTIONAL_LOG2 with *val2 =
=3D 32
(or 24) yields a scale in microwatts for IIO_POWER (1,000x too large for mW)
and microjoules for IIO_ENERGY (1,000,000x too large for Joules).

[ ... ]

> +static int pac1711_write_raw(struct iio_dev *indio_dev, struct iio_chan_=
spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct pac1711_chip_info *info =3D iio_priv(indio_dev);
> +	struct i2c_client *client =3D info->client;
> +	struct device *dev =3D &info->client->dev;
> +	int new_idx, ret, refresh_time;
> +	s32 old_samp_rate;
> +	__be16 val_be16;
> +	u32 wait_time;
> +	u16 val_u16;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		scoped_guard(mutex, &info->lock) {
> +			old_samp_rate =3D pac1711_samp_rate_map_tbl[info->sample_rate_idx];
> +			new_idx =3D pac1711_get_samp_rate_idx(val);
> +			if (new_idx < 0)
> +				return new_idx;
> +
> +			ret =3D i2c_smbus_read_i2c_block_data(client, PAC1711_CTRL_ACT_REG_AD=
DR,
> +							    sizeof(val_u16), (u8 *)&val_be16);
> +			if (ret !=3D sizeof(val_u16)) {
> +				dev_err(&client->dev, "cannot read regs from 0x%02X\n",
> +					PAC1711_CTRL_ACT_REG_ADDR);
> +				return ret < 0 ? ret : -EIO;
> +			}
> +
> +			val_u16 =3D be16_to_cpu(val_be16);
> +			FIELD_MODIFY(PAC1711_CTRL_SAMPLE_MODE_MASK, &val_u16, new_idx);
> +			val_be16 =3D cpu_to_be16(val_u16);
> +			ret =3D i2c_smbus_write_i2c_block_data(client, PAC1711_CTRL_REG_ADDR,
> +							     sizeof(val_be16), (u8 *)&val_be16);
> +			if (ret) {
> +				dev_err(dev, "Failed to configure sampling mode in 0x%02X\n",
> +					PAC1711_CTRL_ACT_REG_ADDR);
> +				return ret;
> +			}
> +
> +			info->sample_rate_idx =3D new_idx;
> +			info->chip_reg_data.ctrl_act_reg =3D val_u16;
> +
> +			/* Force register snapshot and timestamp update with a refresh. */
> +			refresh_time =3D msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS) + 1;
> +			info->chip_reg_data.jiffies_tstamp =3D jiffies - refresh_time;
> +			wait_time =3D (1024 * 1000) / old_samp_rate;
> +
> +			/*
> +			 * We must wait for cycle completion before updating the
> +			 * sample rate value.
> +			 */
> +			ret =3D pac1711_reg_snapshot_locked(info, wait_time);
> +			if (ret) {
> +				dev_err(dev, "%s - cannot snapshot ctrl and measurement regs\n",
> +					__func__);
> +				return ret;
> +			}
> +		}

[Severity: Low]
In pac1711_write_raw(), info->sample_rate_idx is updated to new_idx before
pac1711_reg_snapshot_locked() sends the refresh command that activates the
new control register settings. If pac1711_reg_snapshot_locked() fails to se=
nd
the refresh command, won't the chip remain at old_samp_rate while
info->sample_rate_idx reports new_idx?

Also, in the error path of the i2c_smbus_write_i2c_block_data() call above,
dev_err() logs PAC1711_CTRL_ACT_REG_ADDR instead of PAC1711_CTRL_REG_ADDR.

[ ... ]

> +static int pac1711_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct pac1711_chip_info *info;
> +	struct iio_dev *indio_dev;
> +	u32 wait_time;
> +	int ret, err;
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info =3D iio_priv(indio_dev);
> +	info->client =3D client;
> +
> +	ret =3D pac1711_chip_identify(indio_dev, info);

[Severity: High]
Does pac1711_probe() need to enable the vdd-supply regulator before accessi=
ng
the chip over I2C?

Documentation/devicetree/bindings/iio/adc/microchip,pac1711.yaml requires
vdd-supply, but pac1711_probe() never calls devm_regulator_get_enable(dev,
"vdd") before calling pac1711_chip_identify() and pac1711_chip_configure().=
 If
the regulator is not already enabled by the bootloader, I2C communication w=
ill
fail during probe, or the regulator core may disable the unclaimed supply at
late_initcall while the device is in use.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-pac1711-v5=
-0-71c20101a52e@microchip.com?part=3D5
