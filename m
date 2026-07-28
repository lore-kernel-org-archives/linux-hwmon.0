Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30D9EEBB;
	Tue, 28 Jul 2026 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204425; cv=none; b=AZ0K0MtHrnyk6hXRVzstwejSXLj0J3cZnhWnQwJLFwoXxkaXhduSaSScucYHpOsMXuiNixOo5KQAG8dcqjnFLu77a4Qruw0rYuHhaKq7lfYnQaG2OL6zeKQCl3HjygkB+kMaDM0gb/SxcU4cHWBdd7xPk/CGgdFZlsrsjFvLLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204425; c=relaxed/simple;
	bh=3Y0g2bnDEdcGauw7YZvKlio2gTT8dLk1spgy+8YRzXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cxbmHLzCbEwA73RHfyBc79K/cVCnT21z+RPZDmQdtyzsP7T8x1EvcvrLFDcYncaFj8r3l597xvYU8pxPVpsmLYpzVIVgaoA2NP22HhCUyO4FdQpkb84jIEj+/x/Fl3tlxyhbm9uOR1bFFGumuge2ACNf9p6BVR3H2+OiZkmQKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgMxq0Of; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgMxq0Of"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC111F00AC4;
	Tue, 28 Jul 2026 02:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785204424;
	bh=SRikNmPrjpiLSVoOjSCX2mGYflervAyXrRzbO/FiJdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AgMxq0OfLYiGl+CuokykYWGIyrkIX4dHssvQbVmqUoXUYMKY+GkoN1ULyv/B+ocwi
	 wm+xNSkYfkzKM5zQKMQTCP9x8P8IOmN6FNaEQHSdejnl6r46v7jncTGhhZf/1cFXb8
	 i+OUtt7hMr+aAt3rA1jnv8zPz/DTB6FfUkiypZf0p/ApvQPj00EqKwB9aJXtvz9FLe
	 NlzpozYI7IeUyEJzNVECzWSCJkNMD+FatZ5MlhbHDs/xAl3yFY7qkWFALWyRrf1Fcr
	 xBRtGue9Lvk69XSCiMJmE7cOnRHwmMTTz1TwoxjtEnfBSh7RF8m77QuqGGoB6ptY/V
	 CzgCsjx25YamQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728015857.193890-2-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
 <20260728015857.193890-2-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 02:07:03 +0000
Message-Id: <20260728020703.EFC111F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The static array `tps25990_base_info` is missing the `const` qua=
lifier, placing it in mutable `.data` memory instead of read-only `.rodata`.
- [Low] The `tps25990_i2c_id` array uses positional initializers, which vio=
lates the I2C subsystem's coding guidelines.
--

--- Patch [1]: [PATCH v5 1/3] hwmon: (pmbus/tps25990): Rework driver for mu=
lti-device support ---
commit 7c6d03feb4ad36395a77df5021ef6a8c6f2df2a8
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus/tps25990): Rework driver for multi-device support

This commit reworks the tps25990 driver to allow adding support for new
devices. It introduces a chip enumeration and a data structure to hold
per-device measurement coefficients.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 9d318e6509abf..490dcd2a5fa51 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
[ ... ]
> -static const struct pmbus_driver_info tps25990_base_info =3D {
> -	.pages =3D 1,
[ ... ]
> -#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
> -	.reg_desc =3D tps25990_reg_desc,
> -	.num_regulators =3D ARRAY_SIZE(tps25990_reg_desc),
> -#endif
> -};
> -
> +static struct pmbus_driver_info tps25990_base_info[] =3D {
> +	[tps25990] =3D {
> +		.pages =3D 1,

[Severity: Medium]
Should this array be declared const?

The previous single structure was const, but the new array drops the const
qualifier. Leaving tps25990_base_info mutable places the struct's function
pointers in mutable .data memory instead of read-only .rodata.

[ ... ]
>  static const struct i2c_device_id tps25990_i2c_id[] =3D {
> -	{ .name =3D "tps25990" },
> -	{ }
> +	{ "tps25990", tps25990 },
> +	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);

[Severity: Low]
Does this code run counter to the I2C subsystem coding guidelines?

The guidelines specify that initialized arrays of type struct i2c_device_id
must use named initializers, but this patch changes the initialization to
use positional initializers instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728015857.1938=
90-1-sbogdanov@baylibre.com?part=3D1
