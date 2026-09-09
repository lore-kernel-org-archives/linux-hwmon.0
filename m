Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AF556B8D;
	Wed,  9 Sep 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957338; cv=none; b=l0OMCsKPGtu2CAsYW1KDTZEMtMIicTEy46rJXGp4+SRZh/vFDkMgMGnURx+oyAYdYidrdDqC2OVGLG94Xh+XiSYIZKjt7y8RVKzfPJOI0nBRBSloEQdIwSrEXrnweyp5gqhbh0YKyh1CD32eiq1GGqaajnreRF9C1ZFeliAZ/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957338; c=relaxed/simple;
	bh=uEMl5o1BJpnYhtiDhJMKBz92UhyzmVpwNXr5hHsHOIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFC2BJkEwfelOYBzEBaOThJauzFuryx8em/ukmb80nYiPDAtU01SSdVhMjpIMkF5b0kk3t6eB3Ju5Np0ZFKKnZesUAyDnc2eR/1Op8llyb0xE9FjwZ1MIGcG5zretW+7XHSzJ6ZEujcrkJbWw/jPVdRyxQ6WIWWkYpU7XupNzQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQwbEX5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQwbEX5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15CF1F00A3A;
	Wed,  9 Sep 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957337;
	bh=pgmi7h7nBaJiu4dLU3N39MRh3jOv8rvnCGn1jI5Golg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQwbEX5ITxriJORwlcEOHBP+dkliMGf/bICHfVjBXNiz6BcsDkQvPVxnGxFDYcvFC
	 fxcywHDklBORCfEkkZsi2hPRqoioi0Q2prEYeMWl6C3K4jmd1/gkEDb+1hVcqF9jrJ
	 IZeosSSV0Chq0L64zs4ExYFKWzk2RfEPUIrdGyxmu7+SlolRp4WaKaEGvIJjcHU6sE
	 RR27ZDW2MKDwt5gMacCz2bgRxqKeVdZsE9iebcODVDr6MHS815cVG21t5foqXQylnM
	 8dCKhAT4xl2fKd/hkaKAsAYrrfupEADvoJB9pClyigl3MX0OJlvUD+Zf8F/3YgJYBj
	 dN8OK8PjO/bMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-pac1711-v3-2-dff81003b82f@microchip.com>
References: <20260909-pac1711-v3-0-dff81003b82f@microchip.com>
 <20260909-pac1711-v3-2-dff81003b82f@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:35:36 +0000
Message-Id: <20260909123536.F15CF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Sample rate configuration silently fails because `val_be16` is not=
 updated before being written back to the device via I2C.
- [High] Concurrent calls to `pac1711_set_acc_enable()` can permanently can=
cel the background refresh workqueue due to an unsafe early return.
- [Medium] Torn reads and data races of 64-bit values (`acc_val` and `vpowe=
r`) because they are read outside of `info->lock`.
- [Medium] Timestamp manipulation intended to force a hardware refresh fail=
s to guarantee execution if the previous snapshot was taken very recently.
- [Medium] Incorrect wait time calculated using the old sampling rate inste=
ad of the newly applied rate.
- [Low] Assigning an `unsigned int` array to a `const int *` pointer trigge=
rs a compiler warning.
--

commit 2bd1bfeeb99a3cf2d3d02a346520acaae1f7f3ea
Author: Ariana Lazar <ariana.lazar@microchip.com>
Subject: iio: adc: add support for PAC1711

This adds the IIO driver for Microchip PAC1711, PAC1721, PAC1811, and
PAC1821 single-channel power monitors. It supports voltage, current, and
power measurements, as well as an accumulator for energy or charge.

> diff --git a/drivers/iio/adc/pac1711.c b/drivers/iio/adc/pac1711.c
> new file mode 100644
> index 0000000000000..f23d08205952f
> --- /dev/null
> +++ b/drivers/iio/adc/pac1711.c
[ ... ]
> +static int pac1711_set_acc_enable(struct pac1711_chip_info *info, int va=
l)
> +{
[ ... ]
> +	cancel_delayed_work_sync(&info->work_chip_refresh);
> +
> +	scoped_guard(mutex, &info->lock) {
> +		if (val =3D=3D info->enable_acc)
> +			return 0;

[Severity: High]
Could this early return permanently halt the background refresh task? If
another thread updates enable_acc concurrently and this thread cancels the
just-scheduled work, returning 0 here skips the schedule_delayed_work() call
below. Does this cause the hardware accumulator to silently overflow since =
it
is no longer refreshed?

> +
> +		/*
> +		 * Force a hardware refresh to zero out the internal accumulators
[ ... ]
> +static ssize_t pac1711_in_coulomb_counter_raw_show(struct device *dev,
> +						   struct device_attribute *attr, char *buf)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct pac1711_chip_info *info =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D pac1711_retrieve_data(info, PAC1711_MIN_UPDATE_WAIT_TIME_US);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lld\n", info->chip_reg_data.acc_val);

[Severity: Medium]
Can this sysfs read race with concurrent background updates? Since acc_val =
is
a 64-bit value accessed outside of info->lock, could this result in torn re=
ads
on 32-bit platforms when the workqueue updates it concurrently?

> +}
[ ... ]
> +static int pac1711_read_raw(struct iio_dev *indio_dev, struct iio_chan_s=
pec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct pac1711_chip_info *info =3D iio_priv(indio_dev);
> +	int ret;
> +	u64 tmp =3D 0;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret =3D pac1711_retrieve_data(info, PAC1711_MIN_UPDATE_WAIT_TIME_US);
> +		if (ret)
> +			return ret;
> +
> +		switch (chan->type) {
[ ... ]
> +		case IIO_POWER:
> +			*val =3D (u32)info->chip_reg_data.vpower;
> +			*val2 =3D (u32)(info->chip_reg_data.vpower >> 32);
> +			return IIO_VAL_INT_64;

[Severity: Medium]
Are these 64-bit accesses safe against concurrent modification? Reading the
upper and lower 32 bits independently outside of info->lock might expose an
intermediate state if the background workqueue modifies vpower concurrently.

> +		case IIO_ENERGY:
> +			*val =3D (u32)info->chip_reg_data.acc_val;
> +			*val2 =3D (u32)(info->chip_reg_data.acc_val >> 32);
> +			return IIO_VAL_INT_64;
[ ... ]
> +static int pac1711_write_raw(struct iio_dev *indio_dev, struct iio_chan_=
spec const *chan,
> +			     int val, int val2, long mask)
> +{
[ ... ]
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
> +			ret =3D i2c_smbus_write_i2c_block_data(client, PAC1711_CTRL_REG_ADDR,
> +							     sizeof(val_be16), (u8 *)&val_be16);

[Severity: High]
Does this code write the unmodified register back to the hardware? It looks=
 like
val_u16 is updated, but is not converted and stored back into val_be16 befo=
re
calling i2c_smbus_write_i2c_block_data(). Should there be an assignment
updating val_be16 here?

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
> +			refresh_time =3D msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS) - 1;
> +			info->chip_reg_data.jiffies_tstamp -=3D refresh_time;

[Severity: Medium]
Will this reliably force a hardware refresh? Subtracting 49ms from a freshly
captured timestamp leaves it within the 50ms polling threshold. Doesn't the
time_after() check in pac1711_reg_snapshot() evaluate to false if the last
snapshot was taken very recently, causing the refresh command to be skipped?

> +		}
> +
> +		ret =3D pac1711_retrieve_data(info, ((1024 * 1000) / old_samp_rate));

[Severity: Medium]
Is the wait time calculation using the correct sampling rate? The chip was =
just
commanded to use the new rate, but old_samp_rate is used to calculate the
delay. If the rate was decreased, wouldn't this wait time be too short, cau=
sing
stale or incomplete data to be read?

> +		if (ret) {
> +			dev_err(dev, "%s - cannot snapshot ctrl and measurement regs\n", __fu=
nc__);
> +			return ret;
> +		}
[ ... ]
> +static int pac1711_read_avail(struct iio_dev *indio_dev, struct iio_chan=
_spec const *channel,
> +			      const int **vals, int *type, int *length, long mask)
> +{
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*type =3D IIO_VAL_INT;
> +		*vals =3D pac1711_samp_rate_map_tbl;

[Severity: Low]
Does this pointer assignment generate a compiler warning? The global table
pac1711_samp_rate_map_tbl is declared as an unsigned int array, but the IIO
core passes a const int ** for vals. Should the mapping table be declared
as const int to match the expected signature?

> +		*length =3D ARRAY_SIZE(pac1711_samp_rate_map_tbl);
> +		return IIO_AVAIL_LIST;
> +	}
> +
> +	return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-pac1711-v3=
-0-dff81003b82f@microchip.com?part=3D2
