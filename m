Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B735AC01
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137559; cv=none; b=X1CuMTY6prbnZ1M42EOgxfCflwKpVPMv7qPUnVHs1SLKbMH4wlKqVgosc1GQ+FaFpfl5QdZHUJRs14F1pA94sEbEBofClWgCsfdeqIotB+dMYJkJ+31KX1LSovtxQ+gHbiFMxMp6YkMOVoFpX9Uf1vw9T4ZIdU98V0GCSNqSnUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137559; c=relaxed/simple;
	bh=yO8SEtnIFHqa+3nBK4glViqtt2pxgJWgHXC9XVlcqBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=az4Mi9trzEmOjwivYTNwXi7uDiNxHP3h2oe0H4fS/DPHqRGIudUNpJEhBEfYyZkP9Qy46EVzSRd1kvrjuSajYfbKqKy1gwq62MQWXuSvuTciD2vZFwz/4IfBL1NZe/ep20LtHcdeW9EL1sJzE2wOb/YS66/Ks6KBnuP0kmlxIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgqGc8Vd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgqGc8Vd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAFA1F000E9;
	Mon, 22 Jun 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137557;
	bh=TRgGYOGQfX3d4XNPLQfgIdEi0mJyMq1wrK+F1lfeYAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IgqGc8Vd5kSRAGw0LEqd2CDhWpPQ1LINXERa/BNRACIRR8PWMeWgOwedY4v0/kV7m
	 bIVAGY3wyK/zUOxDlHil4qcp7vpczWWACKnJcI9FHDcLaCiz8UEspAoRI8I39hHo0S
	 PQ0bsQAC1bkIGd899PYcBOfCAqnXHs4/evw+82kjfIwR8uIasSmRpjggnwjLs1/PH9
	 jWezIvIf97pfSqXLLoTyKtOtdUhOSkha+fsSCAcP2h8bVZJyGEjDyuDiyUJmIe+4Q1
	 CBRyicL/N3S3LcnHRw2KmZqi82de/Tp7DK0oQf+b8zPVW20NAC5IPL2WquZJ8BtPhD
	 cmW02yCcF2dag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/8] hwmon/misc: amd-sbi: Move core sbtsi support
 from hwmon to misc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-2-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:12:36 +0000
Message-Id: <20260622141237.5EAFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Auxiliary device ID collision prevents probing multiple sensors wi=
th identical addresses on different buses.
- [Low] SENSORS_SBTSI selects AMD_SBTSI but fails to inherit its dependenci=
es, causing Kconfig unmet dependency warnings and potential build failures.
--

commit 66b0cf6c2e144993bdd6fedccce15184c3257aaf
Author: Prathima <Prathima.Lk@amd.com>

hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc

This commit moves the SBTSI core functionality out of the hwmon subsystem
and into drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
It registers an auxiliary device that the hwmon driver can bind to.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e4c4f2b09732d..8f204cf49b6e0 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1963,7 +1963,7 @@ config SENSORS_SL28CPLD
> =20
>  config SENSORS_SBTSI
>  	tristate "Emulated SB-TSI temperature sensor"
> -	depends on I2C
> +	select AMD_SBTSI

[Severity: Low]
Will this cause a Kconfig unmet dependency warning?

Because the target config depends on I2C and ARM || ARM64 || COMPILE_TEST,
selecting it here without those same dependencies means SENSORS_SBTSI can
be enabled on unsupported architectures or when I2C is disabled.

This forces the target to be built despite its unsatisfied dependencies,
which could lead to build or link errors.

>  	help
>  	  If you say yes here you get support for emulated temperature
>  	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.

[ ... ]

> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> new file mode 100644
> index 0000000000000..dfdd730b906af
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi.c
> @@ -0,0 +1,134 @@

[ ... ]

> +static int sbtsi_create_hwmon_adev(struct device *dev, u8 dev_addr)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev =3D kzalloc_obj(*adev);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name =3D AMD_SBTSI_AUX_HWMON;
> +	/*
> +	 * In a multi-socket system, otherwise identical devices do not
> +	 * share the same static address; each instance has its own address,
> +	 * which must be supplied via the device tree (DTS).
> +	 */
> +	adev->id =3D dev_addr;

[Severity: High]
Does this risk a sysfs name collision on systems with multiple I2C buses?

If multiple independent I2C buses each have a sensor at the same address,
the assigned id will be identical for both.

Because the auxiliary device name is constructed as
amd-sbtsi.temp-sensor.<id>, the second device to probe might fail the
device addition with a sysfs duplicate name warning, leaving the sensor
unusable.

Could a globally unique ID be generated here instead, perhaps using the
IDA framework?

> +	adev->dev.parent =3D dev;
> +	adev->dev.release =3D sbtsi_adev_release;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D1
