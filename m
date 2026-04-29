Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CDA1E4AF
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487735; cv=none; b=CR9+KORwBWs3lBoo5HJEgrbaNOJPaw/bZ7fihb4CYVPdvNKZl8pZjUFthY90fDuBGtIXb4GLijYIxEGuH5QXWgULruhbvYuL1rAaMEXKu+cHR3qMkHkXH6eXapNnp+yKHBqyAMRollbLMIEuyWgH4Q+1HH9puJ5tGrF9fS95BhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487735; c=relaxed/simple;
	bh=QKLWotSfeg/SzO5VaXrpooBNDL9+xuXPBRKgS3uXNTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eGK2kLDSFsmA76HISev1eFbJPuZddtWQr4vi1yU2mbHOiuYJMeAkg0cEzcUfRPNBqJOXCR66v09m1juHqv4iGesVPGm//U0/C/bQ4DmqDeRHV9oOykZ2M92UW+UK8eu+FcWgVzpXymfmA6MfmXWCo9k/lEbDh+wNzZ1GBTT3Pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnRySTPa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnRySTPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A77C19425;
	Wed, 29 Apr 2026 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777487734;
	bh=QKLWotSfeg/SzO5VaXrpooBNDL9+xuXPBRKgS3uXNTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UnRySTPa5i0clXjkDG7o8PfLcWDDv1BK1Lv37rZ68SICBarEVh/XEQB/qtJ5DyBBo
	 gzo5x7OytvFPMSja9669yKkKMOFM09iEjt4JoXrY3NIFmhDaWRe4XRoQSKdLC6sPPK
	 +HpHNyXSaRFu1XTfImpdwpdtqqrao8T4ZwrQYFn7IDcM8aYmvNxDUotflLQmbGoLMa
	 0IT+TaTsIfrI8Hx9x+AS2l3erqGS1mw1JlsTsqWn8I7bIgPIjJIgTg8CBzjnUGddKk
	 bNd1VfEEwrdiSyXaOP2sQ0+0Dm8IlAqwVyqHCnvfBiyFshJDGYQWbu5RGUgOXZAP4v
	 8lGQBtgUIGYIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] hwmon: temperature: add support for EMC1812
Reply-To: sashiko@lists.linux.dev
To: "Marius Cristea" <marius.cristea@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-hw_mon-emc1812-v10-2-a8ca1d779502@microchip.com>
References: <20260429-hw_mon-emc1812-v10-2-a8ca1d779502@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 18:35:34 +0000
Message-Id: <20260429183534.B9A77C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] `emc1812_is_visible()` returns `-EOPNOTSUPP` instead of `0` to h=
ide unsupported channels, exposing them with garbage sysfs permissions.
- [Medium] Incorrect bit indices are used when checking the active channels=
 to configure the ideality factors, leading to an off-by-one error.
- [Low] Variables of type `int` are passed to `regmap_read()`, which expect=
s an `unsigned int *`, causing `-Wpointer-sign` compiler warnings.
--

commit 334894f6ed5a53fe9f4a36ce3c196060e9967729
Author: Marius Cristea <marius.cristea@microchip.com>

hwmon: temperature: add support for EMC1812

This commit introduces the hardware monitoring driver for the Microchip
EMC1812/13/14/15/33 family of remote diode temperature sensors.

> diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
> index 000000000000..94e2709a566f
> --- /dev/null
> +++ b/drivers/hwmon/emc1812.c

[ ... ]

> +static umode_t emc1812_is_visible(const void *_data, enum hwmon_sensor_t=
ypes type,
> +				  u32 attr, int channel)
> +{
> +	const struct emc1812_data *data =3D _data;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		/* Don't show channels which are not physically available */
> +		if (channel >=3D data->chip->phys_channels)
> +			return -EOPNOTSUPP;

Does this correctly hide the unsupported channels?

The hwmon core interprets the returned umode_t value as file permissions.
Returning a negative error code like -EOPNOTSUPP results in a large
positive non-zero value, which unintentionally creates sysfs attributes
with malformed permissions instead of hiding them. It seems returning 0
would properly hide the attributes.

[ ... ]

> +static int emc1812_read_reg(struct device *dev, struct emc1812_data *dat=
a, u32 attr,
> +			    int channel, long *val)
> +{
> +	int hyst, ret;
> +
> +	switch (attr) {

[ ... ]

> +	case hwmon_temp_max_hyst:
> +		ret =3D emc1812_get_limit_temp(data, channel, temp_max, val);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D regmap_read(data->regmap, EMC1812_THRM_HYS_ADDR, &hyst);

Does this trigger a -Wpointer-sign compiler warning? The regmap_read API
expects an unsigned int pointer, but the hyst variable is declared as a sig=
ned
int.

[ ... ]

> +static int emc1812_set_hyst(struct emc1812_data *data, int channel, int =
val)
> +{
> +	int hyst, ret;
> +	int limit;
> +
> +	/* Critical register is 8bits long and keeps only integer part of tempe=
rature */
> +	ret =3D regmap_read(data->regmap, emc1812_temp_crit_regs[channel], &lim=
it);

Similar to the above, limit is declared as a signed int. Does passing it
here cause a pointer signedness mismatch warning?

[ ... ]

> +static int emc1812_init(struct emc1812_data *priv)
> +{
> +	int i, ret;
> +	u8 val;

[ ... ]

> +	/* Set the ideality factor only for the channels enabled on the chip */
> +	if (test_bit(2, &priv->active_ch_mask)) {
> +		ret =3D regmap_write(priv->regmap, EMC1812_EXT1_IDEALITY_FACTOR_ADDR,
> +				   EMC1812_DEFAULT_IDEALITY_FACTOR);

Since channel 0 corresponds to the internal diode, shouldn't EXT1 correspond
to bit 1, EXT2 to bit 2, and so on?

If so, checking bit 2 for EXT1 (and continuing up to bit 5 for EXT4) will r=
esult
in an off-by-one misalignment. This means EXT1 won't be configured if only
channel 1 is active, and the out-of-bounds bit 5 will be checked for EXT4 s=
ince
the bitmask has a maximum of 5 channels.

[ ... ]

> +static int emc1812_chip_identify(struct emc1812_data *data, struct i2c_c=
lient *client)
> +{
> +	const struct emc1812_features *chip;
> +	struct device *dev =3D &client->dev;
> +	int ret, tmp;
> +
> +	ret =3D regmap_read(data->regmap, EMC1812_PRODUCT_ID_ADDR, &tmp);

This also passes a signed int pointer to regmap_read. Can tmp be declared
as an unsigned int to avoid compiler warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-hw_mon-emc=
1812-v10-0-a8ca1d779502@microchip.com?part=3D2
