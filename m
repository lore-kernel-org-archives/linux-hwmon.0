Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862EC25771;
	Thu, 13 Aug 2026 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657184; cv=none; b=TlArhG1hz/qr9ZJ0txBEIDkGo3hJxxcL7gMX7eZHPsylwl9oL27Har7vCwoGip2POOn3part0UTFFfDrV9nYfvbjSLNS1So7+x60wvCBWL8PyUZ2d2HcmYWf5QTaFIN+DKaTxPMszgG3qETZSJQnQ3Xr1LFEYEDxN08bWOU8YQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657184; c=relaxed/simple;
	bh=mrHePe7Mkv0szeIxwOphEjK9QSx+1coTrhs19uOc+sw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZdkBuViG+mD2ylPJYbLf/7ckGfgkxkwskW1tMzmxUe/DEgpKaSV7TLHbkcDJ8kwKZVV5Zm0RrCyDxpPHIQnjgLqEa+P1WIqdhXKubbiNmc6Q0Od5Nc/vkOpH3J/LxcYoRoi3P5EScGrSsbVWX4qSPp6iUPB4ieCr30s6cS+D6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmFO9UUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmFO9UUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A161F000E9;
	Thu, 13 Aug 2026 21:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657183;
	bh=1U/hSU3FY/mr//k7Xu0mXWotsBJI3qLTh0vQoRYy630=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JmFO9UUg3xDwWLhEYWYxk3fnvWXApVbg3gQ1z5Y6RYiEp2Id6jkDQp1h7IrFiE0Zx
	 eB/J5t09CP8PjuMoqDiRpAh2bfQtn0EhJ1spZupCeK4M92xjueoBfsqXktiym91fwk
	 BB/tvRwx28Vent2lTHHn+7sMpg8Vao9RwEAJ/BUmjgNznqjXhiniv3ZarMPbK1yyHz
	 WDXqQ6wX4LvibSqyfcvl93d5E56wT6yA5PcnD2aUaJ9WZaf2asckDDoOywtlgYyf/v
	 J5JOs49NG8xYFKpP87QJd7wxEox/6XbM1aYSN81Ryw+SgXrdFdRi2LHcSHhQ9V5JWy
	 I+IZj4mHSApFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] hwmon: temperature: add support for EMC1812
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marius Cristea" <marius.cristea@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260310-hw_mon-emc1812-v8-2-bc155727e0d2@microchip.com>
References: <20260310-hw_mon-emc1812-v8-2-bc155727e0d2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:39:41 +0000
Message-Id: <20260813213942.85A161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Changing the temperature range format to offset-64 without rewriti=
ng limit registers causes spurious THERM pin assertions.
- [Medium] Unconditional write to the EXT2 Beta Configuration register on c=
hips lacking an EXT2 channel.
- [Medium] Driver erroneously rejects valid device trees that fully describ=
e all physical channels.
--

--- Patch [2]: [PATCH v8 2/2] hwmon: temperature: add support for EMC1812 -=
--
commit 916836a5ccfc6cb9e93591ec739ea81756bca76b
Author: Marius Cristea <marius.cristea@microchip.com>
Date:   Tue Mar 10 14:50:46 2026 +0000

    hwmon: temperature: add support for EMC1812
   =20
    This is the hwmon driver for Microchip EMC1812/13/14/15/33
    Multichannel Low-Voltage Remote Diode Sensor Family.

> diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
> --- /dev/null
> +++ b/drivers/hwmon/emc1812.c
[ ... ]
> +static int emc1812_init(struct emc1812_data *priv)
> +{
> +	int ret;
> +	u8 val;
> +
> +	/*
> +	 * Set default values in registers. APDD, RECD12 and RECD34 are active
> +	 * on 0. Set ALERT pin to be in comparator mode.
> +	 * Set the device to be in Run (Active) state and converting on all
> +	 * channels.
> +	 * Don't change conversion rate. After reset, default is 4 conversions/=
seconds.
> +	 * The temperature measurement range is -64=C2=B0C to +191.875=C2=B0C.
> +	 */
> +	val =3D FIELD_PREP(EMC1812_CFG_MSKAL, 1) |
> +	      FIELD_PREP(EMC1812_CFG_RS, 0) |
> +	      FIELD_PREP(EMC1812_CFG_ATTHM, 1) |
> +	      FIELD_PREP(EMC1812_CFG_RECD12, !priv->recd12_en) |
> +	      FIELD_PREP(EMC1812_CFG_RECD34, !priv->recd34_en) |
> +	      FIELD_PREP(EMC1812_CFG_RANGE, 1) |
> +	      FIELD_PREP(EMC1812_CFG_DA_ENA, 0) |
> +	      FIELD_PREP(EMC1812_CFG_APDD, !priv->apdd_en);
> +
> +	ret =3D regmap_write(priv->regmap, EMC1812_CFG_ADDR, val);

[Severity: High]
When setting the EMC1812_CFG_RANGE bit to 1, the data format changes to a
-64 to 191 degree range. If the limit registers aren't rewritten to match t=
his
new offset, will the existing defaults (such as 85 degrees) be misinterpret=
ed
by the hardware as a much lower temperature (like 21 degrees), causing spur=
ious
thermal limit alarms or hardware shutdowns on driver load?

> +	if (ret)
> +		return ret;
[ ... ]
> +	/* Enables the beta compensation factor auto-detection function for bet=
a1 and beta2 */
> +	ret =3D regmap_write(priv->regmap, EMC1812_EXT1_BETA_CONFIG_ADDR,
> +			   EMC1812_BETA_LOCK_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(priv->regmap, EMC1812_EXT2_BETA_CONFIG_ADDR,
> +			   EMC1812_BETA_LOCK_VAL);

[Severity: Medium]
Does this unconditional write to EMC1812_EXT2_BETA_CONFIG_ADDR cause
communication errors or unpredictable behavior on chips like the EMC1812
that only have one external channel?

Unlike the ideality factor logic below, there doesn't seem to be a check
for the number of supported channels here before writing to the second
external channel's configuration register.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int emc1812_parse_fw_config(struct emc1812_data *data, struct dev=
ice *dev)
> +{
> +	unsigned int reg_nr =3D 0;
> +	int num_channels, ret;
> +
> +	/* To be able to load the driver in case we don't have device tree */
> +	if (!dev_fwnode(dev)) {
> +		data->active_ch_mask =3D BIT(data->chip->phys_channels) - 1;
> +		return 0;
> +	}
> +
> +	data->apdd_en =3D device_property_read_bool(dev, "microchip,enable-anti=
-parallel");
> +	data->recd12_en =3D device_property_read_bool(dev, "microchip,parasitic=
-res-on-channel1-2");
> +	data->recd34_en =3D device_property_read_bool(dev, "microchip,parasitic=
-res-on-channel3-4");
> +
> +	num_channels =3D device_get_child_node_count(dev) + 1;
> +
> +	if (num_channels > data->chip->phys_channels)
> +		return dev_err_probe(dev, -EINVAL, "More channels than the chip suppor=
ts\n");

[Severity: Medium]
If a device tree explicitly defines a node for the internal channel (reg=3D=
0),
will this reject the valid configuration?

By unconditionally adding 1 to device_get_child_node_count(), num_channels
will equal phys_channels + 1 for a fully described device tree, which seems
like it would erroneously trigger this error path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260310-hw_mon-emc=
1812-v8-0-bc155727e0d2@microchip.com?part=3D2
