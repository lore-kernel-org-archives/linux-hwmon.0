Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0284A6CE7;
	Wed,  7 Oct 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384892; cv=none; b=dJ3mwXADo1fjPtykgqRRb9xsVnQavxIayTzgDJQ5tTQ5vjLYrZ3qdNXuaLTdg9yL/ph7WTJtEMm5qbtumMDZZmIPMXnRYLbbQGBrSKGa+vmue/uYizn1XqnQ73Q4l9Jg68FjH+SnstK0yQr9EORmBCt8ICnA8fXDD89eZZ0TUeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384892; c=relaxed/simple;
	bh=XlwcHdQcw+RyDK11DDKWkgsIZa9cu/LUkPEx+cwOHhc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d0J6cz+v0YyQ2dznKRMR/35CB4ga9PwiKmZXxA78fEdq4IlkeZcDgWsB6XwbnM4RnLtwGdUJLBwW/ArwqSf0LRDhqihgz3u+K3ZGzJP7UJcBCYj6u39PFOuolNoOl5cGKVEl7KO7ysg+9p01DPnGqpOtFaKVy8A0iYgoxxh72Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jrk0Lp4F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jrk0Lp4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133741F000FF;
	Wed,  7 Oct 2026 14:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384885;
	bh=1RgLOdNB5W1mLt5pC92v9qTaHOPlscDgu0s8MiU6QT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jrk0Lp4F+aUkC1otcM76JoYtbK8f54mgGylHgC133la+42jNwBbTPCEQjlKyK1gUi
	 wvqFV+9LHB2fS4GiGcaFWtSm9Pb/jZaBUVlMJwqbHDCLRDAtL2Kfc9l0nIyY0WsROP
	 T3EXWuQTYJcJvGY0km37TejKE3+o3MejN1X5kLL49y2Dmz70uL0pXqcVD8BQEW9l7E
	 QYQ620VmfbWa7TmCF+66x0CJbOcSkJOl33S+nOZ4eWAubdH8Pcd9cbHHW051whUQtM
	 DHmKKA7vY3pDoAKo2HI8jpQwiTDWI2NEKArJ6HBTQmmDLSkaEeE9hWtwI0qcfdVVTa
	 dQe8TkYWSmIcA==
Message-ID: <sashiko-outbox-163128@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-pac1711-v4-3-6ef34d7a7947@microchip.com>
References: <20261007-pac1711-v4-0-6ef34d7a7947@microchip.com>
 <20261007-pac1711-v4-3-6ef34d7a7947@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 14:54:44 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] iio: integer overflow in scale calculation yields negative scale
- [High] iio: skipped conversion wait during sample rate change causes corr=
upted reads
- [High] iio: fixed 50ms polling rate limits abort slow hardware conversions
- [Medium] iio: data race exposing un-sign-extended vbus/vsense and shunt t=
o userspace
- [Medium] iio: missing devicetree fallback name assignment exposes (null) =
to sysfs
- [Medium] iio: TOCTOU race in pac1711_set_acc_enable due to split mutex sc=
opes
- [Low] iio: incompatible pointer type assignment to vals triggers build fa=
ilure
--

commit 8dfe13196844f805df3c10995b75092fcc0ad04a
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: adc: add support for PAC1711

This commit adds the IIO driver for Microchip PAC1711, PAC1721, PAC1811 and
PAC1821 single-channel power monitors with accumulator.

> diff --git a/drivers/iio/adc/pac1711.c b/drivers/iio/adc/pac1711.c
> new file mode 100644
> index 0000000000000..c6795d86e3866
> --- /dev/null
> +++ b/drivers/iio/adc/pac1711.c
[ ... ]
> +static int pac1711_reg_snapshot(struct pac1711_chip_info *info, bool do_=
refresh,
> +				u8 refresh_cmd, u32 wait_time, bool *refreshed)
> +{
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

[Severity: High]
Does this hardcoded 50ms check prematurely abort slow hardware conversions?

If the sample rate is configured to be slower than 50ms per conversion (for
example, 8 samples per second takes 125ms), it seems polling just past 50ms
will continuously trigger new refresh commands and reset the device before
conversions complete.

[ ... ]
> +static int pac1711_set_acc_enable(struct pac1711_chip_info *info, int va=
l)
> +{
[ ... ]
> +	scoped_guard(mutex, &info->lock) {
> +		if (val =3D=3D info->enable_acc)
> +			return 0;
> +	}
> +
> +	cancel_delayed_work_sync(&info->work_chip_refresh);
> +
> +	scoped_guard(mutex, &info->lock) {

[Severity: Medium]
Could this lock drop around cancel_delayed_work_sync() open a race condition
where concurrent calls modify the device configuration?

It appears the device could be left in the opposite state of the requested
configuration while still reporting success.

[ ... ]
> +static int pac1711_read_raw(struct iio_dev *indio_dev, struct iio_chan_s=
pec const *chan,
> +			    int *val, int *val2, long mask)
> +{
[ ... ]
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret =3D pac1711_retrieve_data(info, PAC1711_MIN_UPDATE_WAIT_TIME_US);
> +		if (ret)
> +			return ret;
> +
> +		switch (chan->type) {
> +		case IIO_VOLTAGE:
> +			*val =3D info->chip_reg_data.vbus;
> +			return IIO_VAL_INT;

[Severity: Medium]
Unlike the IIO_POWER case below which uses a scoped_guard, does reading
info->chip_reg_data.vbus without taking info->lock expose readers to an
intermediate un-sign-extended state?

In pac1711_reg_snapshot_locked(), vbus is updated in two steps:

	info->chip_reg_data.vbus =3D get_unaligned_be16(offset_reg_data_p);
	if (info->vbus_mode !=3D PAC1711_FULL_RANGE_UNIPOLAR)
		info->chip_reg_data.vbus =3D sign_extend32(info->chip_reg_data.vbus, 15);

[ ... ]
> +	case IIO_CHAN_INFO_SCALE:
> +		switch (chan->address) {
[ ... ]
> +		case PAC1711_VPOWER_REG_ADDR:
> +		case PAC1711_VACC_REG_ADDR:
[ ... ]
> +			/*
> +			 * Power - uW - it will use the combined scale
> +			 * for current and voltage
> +			 * current(mA) * voltage(mV) =3D power (uW)
> +			 */
> +			tmp =3D info->features->voltage_pv_fsr;
> +
> +			do_div(tmp, info->shunt);
> +			*val =3D (int)tmp;

[Severity: High]
Does casting the 64-bit unsigned tmp to a 32-bit signed int overflow if
info->shunt is small?

For a 1 mOhm shunt, tmp could be 4,200,000,000, which would wrap around the
maximum signed 32-bit integer and produce a negative scale factor.

[ ... ]
> +static int pac1711_write_raw(struct iio_dev *indio_dev, struct iio_chan_=
spec const *chan,
> +			     int val, int val2, long mask)
> +{
[ ... ]
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		scoped_guard(mutex, &info->lock) {
[ ... ]
> +			info->sample_rate_idx =3D new_idx;
> +			info->chip_reg_data.ctrl_act_reg =3D val_u16;
> +
> +			/* Force register snapshot and timestamp update with a refresh. */
> +			refresh_time =3D msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS) + 1;
> +			info->chip_reg_data.jiffies_tstamp =3D jiffies - refresh_time;
> +		}
> +
> +		/* We must wait for cycle completion before updating the sample rate v=
alue. */
> +		ret =3D pac1711_retrieve_data(info, ((1024 * 1000) / old_samp_rate));

[Severity: High]
Since info->lock is dropped here, can a concurrent reader intercept the
artificially aged jiffies_tstamp and trigger a hardware refresh?

The original thread's call to pac1711_retrieve_data() could then see a fresh
timestamp, skip the wait entirely, and return prematurely, leading to
corrupted reads.

Additionally, since fsleep() occurs in pac1711_send_refresh() after the
command is sent, the hardware has already snapshotted the state before the
wait happens.

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
Does this incompatible pointer type assignment trigger a build failure with
the compiler flag to treat warnings as errors?

pac1711_samp_rate_map_tbl is defined as an array of unsigned int, but vals
expects a const int **.

[ ... ]
> +static int pac1711_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D pac1711_chip_identify(indio_dev, info);
> +	if (ret =3D=3D -ENODEV) {
> +		/*
> +		 * If it fails to identify the hardware based on internal
> +		 * registers, use compatible from devicetree.
> +		 */
> +		info->features =3D i2c_get_match_data(client);
> +		if (!info->features)
> +			return -EINVAL;
> +	} else if (ret) {

[Severity: Medium]
If the devicetree fallback path is taken, it appears indio_dev->name is nev=
er
initialized before calling devm_iio_device_register().

Will this expose a (null) sysfs attribute and break userspace tools?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-pac1711-v4=
-0-6ef34d7a7947@microchip.com?part=3D3
