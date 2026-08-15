Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D53909B5
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Aug 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836824; cv=none; b=Uh7FFXQKHmMOm1MlS4KDBJkExIW69WHfhVOkncPDSe4a9OijCgNk5eHLaVTi8vufcnT4lk2U3oFhO4A69dXYdBucT8B/Pc2V4xzWLCy7cne4mIMuRzdNz+nQ9afGbOlMG2U+wxYY7x66QPM3mY5AjHU/EF+KHYAcfFZiHjmGt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836824; c=relaxed/simple;
	bh=D0ArGaaQlzoTK6u/tk7GucX+FD6hMkGq8pnwwCFfoUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kmlYTcmFR3p73QeYM0CSuSXvcwkxTFsVf5tv0hEXl3eGyUWTJ9Otg+0P4uH6lD8WWWpfNSf332CEggTsB/4cIPau96L0ivYL8fyK0BeTWf8jSV9pykOgjs0zhpY+MF47dchM45xE6D4oPpFP0z28atLyTuzCZTQXvEgyJNs8fyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXsmRv0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXsmRv0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F9E1F000E9;
	Sat, 15 Aug 2026 23:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786836820;
	bh=27htYfQktPLG+VwRbb5Snm+toZONziIiJWD1nQfrbGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cXsmRv0PcNbamDHj9LDcx3ODZVkVyUN026RBTvVEaYKGG6Chs/qvpN2ckaY1GZF78
	 6x0SiXqb2VOnBOIyL+ftL+zbey3NqmQi29vaAg3uzFd0tVQLWAYViRcSgHzs4sDYBz
	 n+pXdxRlrRf6fzhXtiRqpBrLwSyauBvIKcri46BdCJaBOWTkwkrlUanMc/drg+Exdg
	 Q0+tJu8tack/3ceJ606nR9Twy6GdMLlWjQ5VfkOhEBhH3G0sqOYGHZqAAEJtyYCH1M
	 hqKAJiaFdBcV3QO/Qm9CsO7owswLBNc4Z0tr8r3WrCf/dYX45xflSq6l0uO5i0BxvK
	 ellw1F8pS3OSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: Add fan monitoring support for HONOR FMI-XX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Dubrovskih" <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260815232405.2107574-1-testname142@gmail.com>
References: <20260812192242.859307-1-testname142@gmail.com>
 <20260813091411.1186193-1-testname142@gmail.com>
 <20260815232405.2107574-1-testname142@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:33:40 +0000
Message-Id: <20260815233340.A7F9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `SENSORS_HONOR_FMI` Kconfig option is missing a dependency on `=
ACPI`.
--

--- Patch [1]: [PATCH v3] hwmon: Add fan monitoring support for HONOR FMI-X=
X ---
commit 049ec54bdd36a31d06eb1fb6aa8b9f74bd2a4a59
Author: Nikita Dubrovskih <testname142@gmail.com>

hwmon: Add fan monitoring support for HONOR FMI-XX
   =20
The HONOR FMI-XX firmware exposes a serialized \GFNS ACPI method to return
fan speeds. This commit adds a DMI-restricted, read-only hwmon driver to
monitor these speeds, without exposing direct Embedded Controller access.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d599..8a11a304d2fd2 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
[ ... ]
> @@ -2785,6 +2785,16 @@ config SENSORS_ASUS_EC
>  	  This driver can also be built as a module. If so, the module
>  	  will be called asus_ec_sensors.
> =20
> +config SENSORS_HONOR_FMI
> +	tristate "HONOR FMI-XX fan monitor"
> +	depends on X86

[Severity: Low]
Does this Kconfig entry need a dependency on ACPI?

Without CONFIG_ACPI, ACPICA core functions like acpi_get_handle() are
replaced with static inline stubs that return AE_NOT_CONFIGURED. This means
the driver probe function will unconditionally fail with -ENODEV, and the
driver effectively becomes dead code when configured this way.

> +	help
> +	  If you say yes here, you get support for fan speed monitoring on
> +	  the HONOR FMI-XX laptop through its firmware ACPI method.
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815232405.2107=
574-1-testname142@gmail.com?part=3D1
