Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB4E3C8700
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738210; cv=none; b=a1T9MavBbKauHuoDtcEqyOfMnfo8PgWQyWrBnoTCxtz61eeRlu1Jo+vjzzmL53eJZeYyWL0JxwjYjkUNAM2u5HJGCRljv0udPRjjFRMBYNQGBWLhzvgwnWmZt+PG1VT9oGFydyOTj5MzWi3+T/ugyAlxro8jE6BqLN4gRzz+NDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738210; c=relaxed/simple;
	bh=2mnef+m1SvFeUIqQa0pHPYhBYGiEuiEO4WyUcPgesfU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hDs0eLau1sKhf6kHF5omzfJtvWM2WPapkFz4ynh4K2BqPz72R4ixJ153MiIJ1OWhzmh1jlv5L2kasoghaP2VhlIvcU4dxc+RSvAuON2sHN2vO6UNWQOkWSlkFmev0OiDOpB/hFQE2GldsnT0DtjnJNbOlQlwVbpBAxK9XwWhaFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5w3bYbr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5w3bYbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A30C4CEF7;
	Thu,  9 Apr 2026 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738209;
	bh=2mnef+m1SvFeUIqQa0pHPYhBYGiEuiEO4WyUcPgesfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=b5w3bYbrV73bwY99LUyUESyeaIUTs7BN+PLyw/x1gFzOU+mKvhXregfW9BZoPs3X2
	 cdJ2jFJkPp6QJPXK6GEy94CnajFDZQszgnSWf2J/PxKhJg8pv6Dnw3keK13h95lX39
	 Be9gCeb23Jjm9xQ5/AEqoZR6jedsaWQ+1VHKhMLs6zPEXzbwbJ1fP6yrLjSGiGuyeR
	 x3ZRf8L6h3oFEAB7sQCG0IUVa1Mogo9yWObKfOZ5r0ig1VBNz05XAPffy0Gx35OjkV
	 i9ANh7oWyDqvM+KURk2hnIMP0GeCtxiKiNUTw6aoJSoLF3tGK+kLV3e4POyS4Dl/44
	 BhkytHGd3D6tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-13-akhilrajeev@nvidia.com>
References: <20260409105747.48158-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 12:36:48 +0000
Message-Id: <20260409123649.83A30C4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Low] Unmet Kconfig dependencies and build failures when CONFIG_I3C=3Dm a=
nd CONFIG_I2C=3Dn.
--

commit f34d2926473bc2c3d9a64dd532178bd0f77d003d
Author: Akhil R <akhilrajeev@nvidia.com>

hwmon: spd5118: Add I3C support

This commit adds I3C support to the SPD5118 driver, introducing a regmap
config and an I3C probe function, matching via OF.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index fb847ab40ab4f..d1c660d2e2c10 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2298,12 +2298,15 @@ config SENSORS_INA3221
> =20
>  config SENSORS_SPD5118
>  	tristate "SPD5118 Compliant Temperature Sensors"
> -	depends on I2C
> +	depends on I3C_OR_I2C
>  	select REGMAP_I2C

Will this cause an unmet dependency warning? If CONFIG_I3C=3Dm and
CONFIG_I2C=3Dn, the dependency on I3C_OR_I2C is satisfied, but REGMAP_I2C
is unconditionally selected without its dependency on I2C being met.

> +	select REGMAP_I3C if I3C
>  	help

[ ... ]

> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 8fdde35e68cd3..db66028d2f590 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c

[ ... ]

> @@ -701,7 +723,39 @@ static struct i2c_driver spd5118_i2c_driver =3D {
>  	.address_list	=3D IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2=
c : NULL,
>  };
> =20
> -module_i2c_driver(spd5118_i2c_driver);
> +/* I3C */

[ ... ]

> +static struct i3c_driver spd5118_i3c_driver =3D {
> +	.driver =3D {
> +		.name	=3D "spd5118_i3c",
> +		.of_match_table =3D spd5118_of_ids,
> +		.pm =3D pm_sleep_ptr(&spd5118_pm_ops),
> +	},
> +	.probe		=3D spd5118_i3c_probe,
> +};
> +
> +module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);

Can this lead to a build failure when CONFIG_I2C is disabled?=20

The module_i3c_i2c_driver() macro expands to i3c_i2c_driver_register(), whi=
ch
unconditionally calls i2c_add_driver(). However, when CONFIG_I2C=3Dn,
i2c_add_driver() isn't defined in linux/i2c.h as it lacks a fallback stub,
which could result in an implicit declaration error during compilation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D12
