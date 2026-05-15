Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC263955F2
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854936; cv=none; b=javFupvWHLsWn4ORMQ2OuFJV4VXXvoedmVWfRqW33p/JAi4wHffAiCbq4QINC8lzWVNFXGOmvlYRhx3++XZk1G/PwpihqrhYNKo7EcX2nQi7SnMMBmyvS5O2FYFojDz0ze5OSyb0VOtv/2vKfPN5EcYGhlKdT92DKMnzONDLAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854936; c=relaxed/simple;
	bh=SKDmdjpcsn1+r5Jvh/JInilj+DZS0vkrqUUYSNW0muI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LCrTvqHtrnoxmhnc98D0/3UtiQJ1RAHCs/w0vgkMdA4IZ7p1DzIfN9fxBBbmrl02NJT7Po9CW4LyNG8V25KRTH53fC+OVaTeOnHYTdqpSL9SBQCFS3MWYOx0O216FHIrBzcqzxMEMCuNrTJmH3wFNRCd01IRckKL580HtN4sdro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/+45s+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/+45s+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD9EC2BCB0;
	Fri, 15 May 2026 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778854936;
	bh=SKDmdjpcsn1+r5Jvh/JInilj+DZS0vkrqUUYSNW0muI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=s/+45s+yyMKvaru8B2ifb94KmPJbjKpbpiIUuTSpOFSIvIf46rvcxX/NrzBZV9wgn
	 357IdNi9J9qGT5EWcPsLiBk+8h1pmBI026mtmgLcXogwtysg1Bpj8zpkdCIpEHiYhy
	 6WvW/CSMvVbzGUaiJX/Zszz5F/Vu4EuTCIMJdKdDG6j7aZKmr6LusoP5fxtRgPGGyr
	 ZzhngnUf1q/DZ6nzalxOSaVYX1RuOjgQD8aN7mqOZhZwbQFfrJ73mO/X/ovW22oYTo
	 Kd9SwBV/FLufnJ/tnEeSYyFwrN8rDs7s95wgUlosrObXquuaf0zYLlrO8aVrj5jNWM
	 AFf3FR/c/TEGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] hwmon/misc: amd-sbi: Move core sbtsi support
 from hwmon to misc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515134506.397649-2-Akshay.Gupta@amd.com>
References: <20260515134506.397649-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 14:22:15 +0000
Message-Id: <20260515142215.9CD9EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Auxiliary device ID collision prevents probe of multiple SB-TSI se=
nsors
- [Medium] Kconfig dependency change causes silent loss of the hwmon driver=
 on kernel upgrades
--

commit fe75a41fdaa2ec32654699f9128ef6e13b7c7140
Author: Prathima <Prathima.Lk@amd.com>

hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc

This commit moves the core Side-Band Temperature Sensor Interface (SBTSI)
logic into drivers/misc/amd-sbi/tsi.c. It registers an auxiliary device per
target so that the hwmon driver can bind to it while allowing other consume=
rs
to reuse the core functionality.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 14e4cea48acc4..6fa51e6ef6ff4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1939,7 +1939,7 @@ config SENSORS_SL28CPLD
> =20
>  config SENSORS_SBTSI
>  	tristate "Emulated SB-TSI temperature sensor"
> -	depends on I2C
> +	depends on AMD_SBTSI

Is there a risk that this dependency change could silently disable the
hwmon driver on kernel upgrades?

Because CONFIG_AMD_SBTSI has no default value, an unattended configuration
update like make olddefconfig might drop CONFIG_SENSORS_SBTSI entirely due
to unmet dependencies.

Could CONFIG_AMD_SBTSI be selected by CONFIG_SENSORS_SBTSI instead, or use
a default strategy to ensure existing user configurations are preserved?

[ ... ]

> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> new file mode 100644
> index 0000000000000..ee22167855505
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi.c

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
> +	adev->id =3D dev_addr;

Could this assignment to adev->id cause a collision on multi-socket AMD
systems?

It looks like auxiliary device names are constructed globally as
modname.name.id by __auxiliary_device_add().

If multi-socket systems have identical sensors at the same I2C address
(for example, 0x4c) on different I2C adapters, probing the second sensor
might result in a duplicate sysfs name and cause device_add() to fail with
-EEXIST.

Should the driver allocate a globally unique instance ID for each
auxiliary device using an IDA, rather than relying solely on the I2C
address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515134506.3976=
49-1-Akshay.Gupta@amd.com?part=3D1
