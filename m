Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B551A74C;
	Tue,  8 Sep 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859688; cv=none; b=Ariv563i+yoEE1IzfoCxhCGyPrhOz4Bq6AOqRTAaq2IT1quA+SA6SnW1SzzxVwGiVdJyDOEj/nhjkY/oqAJaMEXiMF1pPIfEfmzyYCfnrfYUswDDWGmOegsbFKdbf2d4miINnwbaf/Hp+tbuS1rSHnNn/BZeFOJaiiDKjHCyhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859688; c=relaxed/simple;
	bh=anKXb2/mw2cM/NRT0bOuM5llujwO+s+QSMlAjWdsOoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eKB/fD9vnVSnqRp5xVaq0YuXCQp1FDAyRPEX3ftAq2NMtGgUiD0RT8eFxoxQvZ006xkK4jBgk5PmLZ/EaM2BauOrs/UPpYeaVKQS/yn6lg9C/ytA2731tO9cpP518kOlWoywaDRIE/PGAj1clm3cW2Ao1srunRIkKoz2TuDSlsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EObH7ZOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EObH7ZOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15781F00A3F;
	Tue,  8 Sep 2026 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859686;
	bh=eWhX/94QFhYIeWrTPucUi8kWwVwJz4lNZq22M50v2J8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EObH7ZOm6B2esM419X41p7YBFTIq8pbB6WhEVUbnpDaY29uPwVlnFMmYB2KNxUMr8
	 kI3FRVebsRAGwHkVSFPA3zOjIKzrz2Pdo+vHBkpj3RN74uaMj0Lljjc5drsbODWM7a
	 WcniHGNF0YpS3Ln5oVrKPxTrSgJ14reGi82KlGZ5ct6zl0H72GrnBwImRlXABfCvtz
	 /3BGtsGoFVO3GvvuD6Qg3OIVjqflUPC7q/QLYmjSA7EsrayXkStinO/xVzFWRYCwT1
	 +bzMVmq1nOlHzeB2s1J/9tzrbFxTOvU5oiHtUd699Ov0fIxexQFWSEzUtUOaJSQ9TQ
	 cbXpTFKlyVLnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908091752.5508-3-okerixx@gmail.com>
References: <20260908091752.5508-1-okerixx@gmail.com>
 <20260908091752.5508-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:28:05 +0000
Message-Id: <20260908092805.E15781F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Hardware monitoring device registered directly from a platform d=
river outside of drivers/hwmon/.
- [Low] Missing dependency on CONFIG_INPUT in Kconfig.
--

commit f4e16083031d59790bcde21682359e0fb96b3392
Author: Oleg Keri <okerixx@gmail.com>

platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

This commit adds a new embedded controller driver for the Lenovo Yoga Slim
7x Gen 11 laptop. It exposes thermistors, battery cell voltages, and CPU
fan speed as hardware monitoring channels, as well as keyboard backlight and
hotkey input events.

> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index e32e01b2a9bdd..9d8e875413fa6 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -90,6 +90,28 @@ config EC_LENOVO_THINKPAD_T14S
> =20
>  	  Say M or Y here to include this support.
> =20
> +config EC_LENOVO_YOGA_SLIM7X_GEN11
> +	tristate "Lenovo Yoga Slim 7x Gen 11 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on HWMON
> +	select NEW_LEDS
> +	select LEDS_CLASS

[Severity: Low]
Does this Kconfig entry need a dependency on INPUT?

If CONFIG_EC_LENOVO_YOGA_SLIM7X_GEN11 is built-in (=3Dy) but CONFIG_INPUT is
built as a module (=3Dm), will this cause a linker error since the driver
unconditionally calls input_register_device() and devm_input_allocate_devic=
e()
in yoga_ec_register_keys()?

[ ... ]

> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drive=
rs/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> new file mode 100644
> index 0000000000000..521a7fb8f3562
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

[ ... ]

> +static int yoga_ec_probe(struct i2c_client *client)
> +{

[ ... ]

> +	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", e=
c,
> +						     &yoga_ec_chip_info, NULL);

[Severity: Medium]
Does this violate the hardware monitoring subsystem layout rules?

The hwmon architectural guidelines specify that if the main functionality of
a chip is not hardware monitoring, its hardware monitoring functionality
should be implemented as an auxiliary device driver, and that driver should
reside in drivers/hwmon/.

Registering the hwmon device directly from this platform driver in
drivers/platform/arm64/ bypasses these layering boundaries. Should this be
split into an auxiliary device architecture for the hwmon components?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908091752.5508=
-1-okerixx@gmail.com?part=3D2
