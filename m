Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502423559CA
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435124; cv=none; b=EnHY5SMhtrL/SoxFlCpgqqsu1Kik6K/UiqgvZXM6On/2n9qXCV7RjaNjGX0vmpyFRjqda+NwpQtsiHcjxzftE30QtBX2DyREk3DN4LuSTdJLuzee+BWeMnJImqYA2POF0gjloAo/W+yG7g2HXqyK0nHFx0LWVziUrcNWB45P3Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435124; c=relaxed/simple;
	bh=236iEsCstzJNsfm7z0pai+MVAd4FXfBTnzj0JuaFRtU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SQ0o/h6wWRrWxfDdpzZEDH+tRV4EjiX725IzevnvAd5iSi9pYRZmOuD7heZ6qWwnA3y24aKyS6FrCe7m+53rl3DclQ1RibtJPIWUOuVB7fWnjRK9Of2BcjxJicpiDO+PKmnYtY8U16dY3B0gGvQWmyepgm5sfI9yvryhReBgPnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcdV09go; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcdV09go"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D95F1F000E9;
	Fri, 22 May 2026 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779435123;
	bh=HgPAJcgjWQzDcM87zXJgw/BfDFYMZTEstG7tkeu7hSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HcdV09gohlmNhl6x2uC+/zij2hrAmfimPe5HMd+jrUAE1KoH7QEfmWeAKjZVHoFsi
	 mZ/LYTdotjeSPJjDJzlgXbnowZ14rwmJ6XbWQtONpKB4+deRh/1gnjOlLoufEXbWDJ
	 szWnkxCCLmiuF2NUaZbjNuiMOcUIF4dMscTGNOQsuMbfQ17Mu7V+b1n2eJvmTbouhx
	 UeZwg1ne5gTfKzA7UEtxvKhIRPyibKjbe0W7Cei1wRDyf2PkN+W9Bqrr/XDlCAH4v0
	 XMGx5znjeyRv4k5dn4du7GKUL9x8HQlaMzIadQrTDOfA9hfCmwMi/e0cvZSPhu1WOl
	 hoOeIT4M0wMhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: ina238: add support for samples and
 update_interval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260522-hwmon-ina238-add-samples-update-interval-v1-1-e1acfceb447e@advastore.com>
References: <20260522-hwmon-ina238-add-samples-update-interval-v1-1-e1acfceb447e@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 07:32:02 +0000
Message-Id: <20260522073202.9D95F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `update_interval` read and write handlers ignore the averagi=
ng count (`samples`), misrepresenting the sensor update rate and contradict=
ing the commit message.
- [Medium] The `update_interval` input from userspace is not clamped before=
 multiplication, leading to integer overflow and architecture-dependent inc=
orrect behavior.
- [Low] `HWMON_CHANNEL_INFO` for `hwmon_chip` uses a comma instead of a bit=
wise OR, improperly splitting chip attributes across different logical chan=
nels.
--

commit 55e741f49c21a7f0a90668a195509e88a803ff6d
Author: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

hwmon: ina238: add support for samples and update_interval

This commit exposes the INA238 conversion time and averaging count fields
via standard hwmon chip attributes samples and update_interval. A per-chip
conversion-time lookup table is introduced along with caching of the
ADC_CONFIG register to optimize write operations.

> diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
> index ff67b03189f73..7bc18e5445b27 100644
> --- a/drivers/hwmon/ina238.c
> +++ b/drivers/hwmon/ina238.c
[ ... ]
> @@ -261,6 +296,83 @@ static int ina228_read_voltage(struct ina238_data *d=
ata, int channel, long *val)
>  	return 0;
>  }
> =20
> +/* Converting ADC_CONFIG register value to update_interval in usec */
> +static inline u32 ina238_reg_to_interval_us(struct ina238_data *data)
> +{
> +	const u16 *ct =3D data->config->conv_time;
> +	u32 vbusct =3D ct[(data->adc_config & INA238_ADC_CONFIG_VBUSCT_MASK) >>
> +			INA238_ADC_CONFIG_VBUSCT_SHIFT];
> +	u32 vshct  =3D ct[(data->adc_config & INA238_ADC_CONFIG_VSHCT_MASK) >>
> +			INA238_ADC_CONFIG_VSHCT_SHIFT];
> +	u32 vtct   =3D ct[(data->adc_config & INA238_ADC_CONFIG_VTCT_MASK) >>
> +			INA238_ADC_CONFIG_VTCT_SHIFT];
> +
> +	return vbusct + vshct + vtct;
> +}

[Severity: Medium]
Does this calculation miss the averaging count (samples)?

The hwmon sysfs ABI expects the physical update interval to be the interval
at which readings are updated (i.e., raw conversion time * averaging count).

Also, the commit message states that writing takes "the current averaging
count into account", but the current implementation appears to ignore it
when computing update_interval.

While a later patch (hwmon: ina238: use microseconds for update_interval)
updates the commit message to claim independence from averaging, the code
here still violates the hwmon ABI definition.

[ ... ]
> +static int ina238_write_chip(struct device *dev, u32 attr, long val)
> +{
> +	struct ina238_data *data =3D dev_get_drvdata(dev);
> +	u16 adc_config;
> +	int idx, ret;
> +
> +	switch (attr) {
[ ... ]
> +	case hwmon_chip_update_interval:
> +		val =3D ina238_interval_ms_to_conv_time(val);

[Severity: Medium]
Could this lack of clamping lead to an integer overflow and
architecture-dependent incorrect behavior?

If userspace provides a negative value, DIV_ROUND_CLOSEST in
ina238_interval_ms_to_conv_time() produces a negative result that is
returned as a u32 (e.g., 4294967295).

When assigned back to long val here, a 64-bit system zero-extends this to a
massive positive number, causing find_closest() to select the maximum
conversion time. On a 32-bit system, the value remains negative, selecting
the minimum conversion time.

Although the signed integer overflow of interval * 1000 is removed by a
later patch, the lack of clamping still violates the hwmon guideline to
check for overflows and underflows in arithmetic calculations.

> +		idx =3D find_closest(val, data->config->conv_time,
> +				   ARRAY_SIZE(ina238_conv_time));
> +		adc_config =3D (data->adc_config &
> +			      ~(INA238_ADC_CONFIG_VBUSCT_MASK |
> +				INA238_ADC_CONFIG_VSHCT_MASK |
> +				INA238_ADC_CONFIG_VTCT_MASK)) |
> +			     ((u16)idx << INA238_ADC_CONFIG_VBUSCT_SHIFT) |
> +			     ((u16)idx << INA238_ADC_CONFIG_VSHCT_SHIFT) |
> +			     ((u16)idx << INA238_ADC_CONFIG_VTCT_SHIFT);
> +		ret =3D regmap_write(data->regmap, INA238_ADC_CONFIG, adc_config);
> +		if (ret)
> +			return ret;
> +		data->adc_config =3D adc_config;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
[ ... ]
> @@ -692,6 +816,9 @@ static umode_t ina238_is_visible(const void *drvdata,
>  				HWMON_I_MIN | HWMON_I_MIN_ALARM)
> =20
>  static const struct hwmon_channel_info * const ina238_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_SAMPLES,
> +			   HWMON_C_UPDATE_INTERVAL),

[Severity: Low]
Should these attributes be combined using a bitwise OR instead of a comma?

Using a comma separates these into distinct logical channels in the
underlying structure (i.e., samples on channel 0, update_interval on
channel 1).

While the hwmon core still creates the attributes properly because chip
names don't use channel indices, it violates the intended API contract.

The standard practice is to combine attributes for a single logical channel
with a bitwise OR:

HWMON_C_SAMPLES | HWMON_C_UPDATE_INTERVAL

>  	HWMON_CHANNEL_INFO(in,
>  			   /* 0: shunt voltage */
>  			   INA238_HWMON_IN_CONFIG,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-hwmon-ina2=
38-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com?part=3D1
