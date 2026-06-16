Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F63161AB;
	Tue, 16 Jun 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593165; cv=none; b=MFOKEapB3isU1X2abWp7AmDxgzInUJz7avH7DI2f62CmrXR+s1p4mcH5Op+Fpg4M8EQRw8n7Mu5yDOIndBPAdj5LvdUpus/c2WoSXCLHUwurFWOpLxaC9/ZLh5xZFNZ0f5e5z10boXRuIl5+owBca+W4r2lLRWx+YgGuiHnEErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593165; c=relaxed/simple;
	bh=9ISMaZ6jnROMnObxIEM/56rPNJwLX/dEy5GIOF+ZYSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMpe/rKXdze0uq0ZipDpN7mTUZnjdUZGcbNUo1t12QenhwrFNj/W0zMZhYwhVmAT1RejVmiLSIdNuopZTA/ycPQuXcCLUm4L6MEAyQgN9o7ksrhht7s44QHIH2JV03X134QIJNh1BvTGhZZB8/+ZuU2wWBiy6lwqfcG3+i+rrnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU9R/VA9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU9R/VA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF651F000E9;
	Tue, 16 Jun 2026 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781593164;
	bh=CbssHl86QMfxv13tSUtJPa0uu+o3ryA5UnVLvNRs7z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cU9R/VA9mcEWVW+P6T+zYalHgzLYhEQKhPE7udO1uxwBjQdA5z9Jl4KtWH7v2hpbM
	 ynGNp6qPGcBMa6hI8mkFYr06sGzm6WGeEIXDJ0pqgYgvVr4SRGrtFZZK4C4kgxF6Lq
	 uRhXDzEFx5LI9pe4PSZFG6xMRf0B3wd97qrACWN4YXv6MCj6WS5Ve+8wRtKNoaq34r
	 PBVWV4rjO/Iga0U0NuQCXWqTtQKvr1YnC3PUtgPD/8nxorfu/UZjAoO2CzMBbeZbSW
	 jeDq2a7Mnflt7fSvsvYQPsyPp78G/U9Ru1TNgjtvx0gGZ80pyd9aiBs/Iz3d/udm88
	 VBoNVMUqGpu8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] hwmon: adm1275: Support module auto-loading
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
References: <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:59:23 +0000
Message-Id: <20260616065923.CAF651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message incorrectly references `spi_device_id` instead o=
f `i2c_device_id`.

Pre-existing issues:
- [High] The newly added `adm1275_of_match` table is incomplete, leaving mo=
dule auto-loading broken for the majority of supported devices.
--

commit ed700404448bb29c6f451edcac6e84d5a0f95644
Author: Matti Vaittinen <mazziesaccount@gmail.com>

    hwmon: adm1275: Support module auto-loading

This commit adds an of_device_id table to the adm1275 driver to enable
automatic module loading when devices are parsed from the device tree
at boot.

>     hwmon: adm1275: Support module auto-loading
>    =20
>     Populating the spi_device_id -table is not enough to make the

[Severity: Low]
This isn't a bug, but there's a typo in the commit message. The driver
is an I2C driver and uses an i2c_device_id table, not an spi_device_id
table.

[ ... ]

> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 9e21dd4083e94..c27bb0e493547 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -927,9 +927,17 @@ static int adm1275_probe(struct i2c_client *client)
>  	return pmbus_do_probe(client, info);
>  }
> =20
> +static const struct of_device_id adm1275_of_match[] =3D {
> +	{ .compatible =3D "rohm,bd12780", },
> +	{ .compatible =3D "rohm,bd12790", },

[Severity: High]
This is a pre-existing issue, but the newly added adm1275_of_match
table appears to be incomplete.

Since udev relies on the of_device_id table to export the correct
MODALIAS for auto-loading, wouldn't omitting the other devices
supported by this driver (such as adm1075, adm1275, adm1276) leave
auto-loading broken for those devices on DT systems?

Should we include compatible strings for the rest of the supported
hardware here to ensure they also benefit from module auto-loading?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, adm1275_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D7
