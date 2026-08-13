Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED33C3F54;
	Thu, 13 Aug 2026 21:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657368; cv=none; b=LVNZqbg8FJClLzYRY47mNjEkSgcjn8K0CzUOP53pUyPrnJrzrcd3wcRANjStkpEK4J8ie4oN0l+EQqtsdX55qjirjXrThyrUvjuiuY6wJAit7vZ2b5FaPK54JWZR+E11kkQSDAE5FkTJkDOyA9hmwJJAg2TdxTIJQgn4QdHBGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657368; c=relaxed/simple;
	bh=Z8nUjH2UUGiOvOYTMDwo0yM2Ic6XVu+mS9LfB9G4M6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VQPYg4dbXztuNVcS53PSAteFsWs/XxmzwzI6gcXGAF/OzxXieEZUKT4W7K61ud1a4VgLZ8JtuP1eCgaYTK7pOYe+KDIA7tvRRrHQNbu6tBshDyxP4IiiAoiY1VB/fcwwxQaKSIfNlFl8o7VNp6O0NUJYXHqfivgc3KA0RyFxprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrpLavRk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrpLavRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997291F000E9;
	Thu, 13 Aug 2026 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657366;
	bh=IxiqP3QGi7Igwp1MMlL7SZkhIEbkwwIVpqTNIoSusNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrpLavRkFJBrgrT2SJ5mTnthw+azDN7D1NDbFDRt7zs9T+4ZMUa91zwvgPM81ZJgp
	 m/CnhZpTK9camj57/N85geZiIR/r5B6198VImbQCSVQqBYOlVkFmLBV++WHi/1k369
	 O7irEZY2+ge0wVinSn6jAaMC3gmfBYzQ4teuOab2yI1T+ycGmutdhkESaPRhd/dHDe
	 rFzK3k45x/Af0JSWm1JKH0jHJSCLGiEMIpWA25w7f062/xXV4Q08Tp/t5/6tmYlbTK
	 lRDYB2lh0NPZu7dHQ78sGCaKpNnOjjKVvvOMO/2f3fpckJq1Kr/O+ikjWlYWZoB+4/
	 xNhM4mtdprZzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: Add support for TI INA4230 power monitor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260310-ina4230-v3-2-06ab3a77c570@flipper.net>
References: <20260310-ina4230-v3-2-06ab3a77c570@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:42:46 +0000
Message-Id: <20260813214246.997291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Kernel panic due to division by zero when calculating conversion t=
ime with all channels disabled.
- [High] The driver modifies its cached `CONFIG1` register during probe but=
 never writes this configuration to the hardware.
- [High] Resetting the device in `ina4230_resume()` corrupts the regmap cac=
he for `CONFIG2` and prevents it from being restored.
- [High] Silent failure when modifying shunt channel enable attributes due =
to missing channel index modulo.
- [High] `ina4230_read_energy` corrupts energy readings by reading across 1=
6-bit register boundaries.
- [High] Sysfs attributes remain active after `ina4230_remove()` completes,=
 causing a lifecycle race that can trigger PM counter underflows or bus err=
ors.
- [High] Infinite polling loop in `ina4230_wait_for_data` when no channels =
are active.
- [Medium] Concurrent sysfs writes to extra attributes (`shuntX_resistor`) =
cause a data race on shared driver state.
- [Medium] Unbalanced PM runtime usage counter decrements in the probe erro=
r path and teardown path.
- [Medium] `ina4230_is_enabled()` incorrectly reports a channel as enabled =
based on the global device PM state.
- [Medium] Missing averaging multiplier in conversion time calculation caus=
es premature timeouts.
- [Low] Missing `HWMON_I_ENABLE` flag prevents the exposure of channel enab=
le/disable sysfs attributes.
--

--- Patch [2]: [PATCH v3 2/2] hwmon: Add support for TI INA4230 power monit=
or ---
commit fc5e3f0118ad0f82f69443f939a77d438a653011
Author: Alexey Charkov <alchark@flipper.net>
Subject: hwmon: Add support for TI INA4230 power monitor

This commit adds a driver for the TI INA4230 Quad Current/Voltage Monitor.
It supports voltage, current, power and energy measurements over I2C, but
skips the alert functionality in this initial implementation.

> diff --git a/drivers/hwmon/ina4230.c b/drivers/hwmon/ina4230.c
> new file mode 100644
> index 0000000000000..7e5c7fe2274b3
> --- /dev/null
> +++ b/drivers/hwmon/ina4230.c
[ ... ]
> +static inline bool ina4230_is_enabled(struct ina4230_data *ina, int chan=
nel)
> +{
> +	return pm_runtime_active(ina->pm_dev) &&
> +		!ina->inputs[channel].disconnected;
> +}

[Severity: Medium]
Could this be a regression where the function no longer reflects individual
channel state?

It checks pm_runtime_active(), which represents the global power state of
the chip. If channel 1 is disabled via sysfs but channel 2 remains enabled,
the device remains active and this would incorrectly return true for channe=
l 1.
This might allow sysfs reads to fetch stale data instead of returning -ENOD=
ATA
as intended by the API contract.

[ ... ]
> +static inline u32 ina4230_interval_ms_to_conv_time(u16 config, int inter=
val)
> +{
> +	u32 channels =3D hweight16(config & INA4230_CONFIG1_ACTIVE_CHANNEL_MASK=
);
> +	u32 samples_idx =3D FIELD_GET(INA4230_CONFIG1_AVG_MASK, config);
> +	u32 samples =3D ina4230_avg_samples[samples_idx];
> +
> +	/* Bisect the result to Bus and Shunt conversion times */
> +	return DIV_ROUND_CLOSEST(interval * 1000 / 2, channels * samples);
> +}

[Severity: High]
What happens here if all channels are disabled?

If the channel bitmask is zero (either disconnected in DT or disabled via
sysfs), the channels variable evaluates to 0. The subsequent calculation
would then result in a division by zero panic, which seems like a regression
during sysfs writes.

[ ... ]
> +static inline u32 ina4230_reg_to_interval_us(u16 config)
> +{
> +	u32 channels =3D hweight16(config & INA4230_CONFIG1_ACTIVE_CHANNEL_MASK=
);
> +	u32 vbus_ct_idx =3D FIELD_GET(INA4230_CONFIG1_VBUSCT_MASK, config);
> +	u32 vsh_ct_idx =3D FIELD_GET(INA4230_CONFIG1_VSHCT_MASK, config);
> +	u32 vbus_ct =3D ina4230_conv_time[vbus_ct_idx];
> +	u32 vsh_ct =3D ina4230_conv_time[vsh_ct_idx];
> +
> +	/* Calculate total conversion time */
> +	return channels * (vbus_ct + vsh_ct);
> +}

[Severity: Medium]
Should this calculation include the number of samples being averaged?

ina4230_interval_ms_to_conv_time() correctly factors in the sample count,
but it is omitted here. This could cause the returned timeout duration to be
significantly shorter than the actual hardware integration time, potentially
leading to premature timeouts during polling, which could be a regression.

[ ... ]
> +static inline int ina4230_wait_for_data(struct ina4230_data *ina)
> +{
> +	u32 wait, cvrf;
> +
> +	wait =3D ina4230_reg_to_interval_us(ina->reg_config1);
> +
> +	/* Polling the CVRF bit to make sure read data is ready */
> +	return regmap_field_read_poll_timeout(ina->fields[F_CVRF],
> +					      cvrf, cvrf, wait, wait * 2);
> +}

[Severity: High]
Is it possible for this regression to cause an infinite spin?

If no channels are active, ina4230_reg_to_interval_us() returns 0. Passing
0 as the timeout to regmap_field_read_poll_timeout() usually means to poll
forever without timing out. Since no hardware conversions are occurring, the
CVRF bit will never be asserted, potentially causing a soft lockup.

[ ... ]
> +static int ina4230_set_calibration(struct ina4230_data *ina, int channel)
> +{
[ ... ]
> +	input->shunt_gain =3D shunt_range_uV > 20480 ? 1 : 4;
> +	ina->reg_config2 &=3D ~INA4230_CONFIG2_RANGE_CH(channel);
> +	if (input->shunt_gain =3D=3D 4)
> +		ina->reg_config2 |=3D INA4230_CONFIG2_RANGE_CH(channel);
> +
> +	ret =3D regmap_write(ina->regmap, INA4230_CONFIG2, ina->reg_config2);

[Severity: Medium]
Is a lock needed here to protect the read-modify-write of ina->reg_config2?

Extra sysfs attributes backed by ina4230_shunt_store() do not take the hwmon
core lock automatically and can be executed concurrently. Modifying the
cached config value without a driver-level lock could lead to corrupted
internal state and hardware state, which might be a regression.

[ ... ]
> +static int ina4230_read_energy(struct device *dev, u32 attr, int channel=
, long *val)
> +{
[ ... ]
> +	case hwmon_energy_input:
> +		if (!ina4230_is_enabled(ina, channel))
> +			return -ENODATA;
> +
> +		ret =3D regmap_noinc_read(ina->regmap, reg, &regval, sizeof(regval));

[Severity: High]
Does reading 4 bytes here pull in data from adjacent registers?

The registers on this chip are 16 bits wide (val_bits =3D 16), and the ener=
gy
registers are only 16 bits. Reading sizeof(regval), which is 4 bytes for a
__be32, would read 2 bytes from the energy register and auto-increment to r=
ead
the next 2 bytes from the adjacent calibration register, resulting in a
corrupted value. Could this be a data corruption regression?

[ ... ]
> +static int ina4230_write(struct device *dev, enum hwmon_sensor_types typ=
e,
> +			 u32 attr, int channel, long val)
> +{
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		ret =3D ina4230_write_chip(dev, attr, val);
> +		break;
> +	case hwmon_in:
> +		/* 0-align channel ID */
> +		ret =3D ina4230_write_enable(dev, channel - 1, val);

[Severity: High]
Does this handle shunt channel indices correctly?

Sysfs paths provide channel numbers up to 8 (voltage channels 1-4 and shunt
channels 5-8). For a shunt channel like channel 5, passing channel - 1 resu=
lts
in index 4. The channel enablement mask only covers bits 12-15, so shifting
by 4 would push the mask into bits 16-19, leading to an empty mask. The dri=
ver
would then silently fail to disable the shunt channel, causing a regression=
 in
expected behavior.

[ ... ]
> +static const struct hwmon_channel_info * const ina4230_info[] =3D {
[ ... ]
> +	HWMON_CHANNEL_INFO(in,
> +			   /* 0: dummy, skipped in is_visible */
> +			   HWMON_I_INPUT,
> +			   /* 1-4: input voltage Channels */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,

[Severity: Low]
Should HWMON_I_ENABLE be included in these flags?

The driver implements logic in ina4230_write_enable() and hwmon_in_enable to
support dynamically enabling and disabling channels, but without the
HWMON_I_ENABLE flag here, the hwmon core will never create the corresponding
sysfs attributes, masking this feature regression.

[ ... ]
> +static int ina4230_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/* The driver will be reset, so use reset value */
> +	ina->reg_config1 =3D INA4230_CONFIG_DEFAULT;
> +	ina->reg_config2 =3D 0;
> +
> +	if (ina->single_shot)
> +		FIELD_MODIFY(INA4230_CONFIG1_MODE_MASK, &ina->reg_config1,
> +			     INA4230_MODE_BUS_SHUNT_SINGLE);
> +
> +	/* Disable channels if their inputs are disconnected */
> +	for (i =3D 0; i < INA4230_NUM_CHANNELS; i++) {
> +		if (ina->inputs[i].disconnected)
> +			ina->reg_config1 &=3D ~INA4230_CONFIG_CHx_EN(i);
> +	}
> +
> +	ina->pm_dev =3D dev;

[Severity: High]
Is the cached reg_config1 value ever written to the hardware during
initialization?

The driver modifies the cache for defaults, single-shot mode, and disconnec=
ted
channels, but there doesn't appear to be a regmap_write() or regcache_sync()
to push these changes to the physical device. The device might remain in its
default continuous mode with all channels active, leading to a state regres=
sion.

[ ... ]
> +static void ina4230_remove(struct i2c_client *client)
> +{
> +	struct ina4230_data *ina =3D dev_get_drvdata(&client->dev);
> +	int i;
> +
> +	pm_runtime_disable(ina->pm_dev);
> +	pm_runtime_set_suspended(ina->pm_dev);

[Severity: High]
Can sysfs attributes be accessed after pm_runtime_disable() is called here?

The sysfs nodes are managed by devres and will persist until after the remo=
ve
function completes. A concurrent sysfs read or write could attempt I2C traf=
fic
or trigger PM counter underflows on the logically removed device. Would it =
be
safer to use devm_pm_runtime_enable() to serialize the teardown and avoid t=
his
regression?

> +
> +	/* pm_runtime_put_noidle() for connected channels to balance get_sync */
> +	for (i =3D 0; i < INA4230_NUM_CHANNELS; i++) {
> +		if (!ina->inputs[i].disconnected)
> +			pm_runtime_put_noidle(ina->pm_dev);
> +	}
> +}

[Severity: Medium]
Does this teardown sequence handle disabled channels correctly?

The loop blindly calls pm_runtime_put_noidle() for all physically connected
channels. If a channel was previously disabled via sysfs (which already cal=
led
pm_runtime_put_sync()), this could drop the reference count below zero and
cause PM usage counter underflows. This regression also appears to exist in
the probe error path.

[ ... ]
> +static int ina4230_resume(struct device *dev)
> +{
> +	struct ina4230_data *ina =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(ina->regmap, false);
> +
> +	/* Software reset the chip */
> +	ret =3D regmap_field_write(ina->fields[F_RST], true);
> +	if (ret) {
> +		dev_err(dev, "Unable to reset device\n");
> +		return ret;
> +	}
> +
> +	/* Restore cached register values to hardware */
> +	ret =3D regcache_sync(ina->regmap);

[Severity: High]
Does writing true to F_RST bypass the regcache and prevent CONFIG2 from
being restored?

Sending the reset command through the active regmap alters the regcache ent=
ry
for the register containing F_RST and clears its dirty flag. When
regcache_sync() runs immediately after, it may consider that register clean
and skip restoring the calibration settings to the hardware, resulting in a
configuration regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260310-ina4230-v3=
-0-06ab3a77c570@flipper.net?part=3D2
