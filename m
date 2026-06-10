Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86FB3B14D2;
	Wed, 10 Jun 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081040; cv=none; b=K55lymTTJ8riSDodX31dHkbVXPgH+DoE2A4znUdRVcNkOO1NotZiEN6ACkd7Y13XOlG5YqgkANusKAJaflNFeQt3A6RVReC0+PhEKUUxQX8e2DjC3N3GW2KYDdXcCPoZ2CY3r/wVgxL4QzhrhbrdEjpORoRwefjTJZj81/QldCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081040; c=relaxed/simple;
	bh=ndGGQizaN8LwgxWI7bf1q8+LUqXP7xA/MgizEu2gOwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dfVwHeh9Zu9DkuMeSrervvEuxaJKFGz57Z2Y/04isFUVzQlTJvR6Nm6Mcbgu9MOj7iLh9WSjNdckkOBuBYhX49QMv5wxZY5IUse/igxTP2pqz6s0XqFwI4U4gYZW1i7txagEQt9HViNs8ct0vKU6HSqnhv0yZv0591hA8Bb2dPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2XoSJVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2XoSJVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62271F00893;
	Wed, 10 Jun 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081038;
	bh=R/vd/mzszqC9YRY/ygZRWCmnsryp/1Z1JI1tOwENpy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2XoSJVfSpOLnOEyNRcUAnUzDvrGTbH6eMfNRd59+R8UIfZ6Bva/Ux3B2Q6iOhnCa
	 xzZb1N7z57R20MkfU8Fn1JeQzafK3eOMtcQggXb4LwYSw2jTgqw25pAg3iPCn3OCq7
	 U2a3a+A1DZanFpfTQ/1dAJIQArIcwgM/ji91dP3jnlB1phnfurjpOx18X5PptxJr+S
	 +SvkcjXLuBW8Bm3lDOOEeBDXolNa/0mZULYJu1mClhUKw5b6UpeSFzGX054xTUdcHm
	 r0SloC+PRW3yE4G1BvPo7fEzyB/NYSewYuAO6e5WAxwTaWuoQNl6C1ZTbvjAWd/R4C
	 6mY0IZyyPXngg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: ina2xx: support ina232
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:43:57 +0000
Message-Id: <20260610084357.C62271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The INA232 configuration implicitly omits `.has_update_interval =
=3D true`, silently disabling sysfs update interval configuration.

Pre-existing issues:
- [High] Multiple alert limit calculations in `ina226_alert_to_reg` suffer =
from integer overflows and signedness mismatches on 32-bit systems, causing=
 hardware limits to be incorrectly programmed.
- [High] Integer overflow in power calculations inside `ina2xx_get_value()`=
 incorrectly returns negative power measurements at higher loads.
--

commit 553d30269962c93d687fffb0c6e1dcc15cbdf020
Author: Martino Facchin <m.facchin@arduino.cc>
Subject: hwmon: ina2xx: support ina232

This commit adds support for the INA232 current and power monitor. It defin=
es
the INA232 configuration values and adds the device to the corresponding i2c
and device tree identification tables.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 613ffb622b7c4..122e7aa4fdfff 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c

[ ... ]

> @@ -196,6 +197,17 @@ static const struct ina2xx_config ina2xx_config[] =
=3D {
>  		.current_shift =3D 4,
>  		.has_update_interval =3D true,
>  	},
> +	[ina232] =3D {
> +		.config_default =3D INA226_CONFIG_DEFAULT,
> +		.calibration_value =3D 2048,
> +		.shunt_div =3D 400,
> +		.bus_voltage_shift =3D 0,
> +		.bus_voltage_lsb =3D 1600,
> +		.power_lsb_factor =3D 32,

[Severity: High]
This is a pre-existing issue, but can the power calculation overflow when
using larger power_lsb_factor values like the one added here for INA232?

In ina2xx_get_value(), the INA2XX_POWER calculation is:

    val =3D regval * data->power_lsb_uW;

The result is returned as a signed 32-bit int. For the INA232 with a common
2mOhm shunt, power_lsb_uW becomes 40,000. When the 16-bit regval exceeds
53,687, the product exceeds INT_MAX. This overflows the 32-bit signed math,
wrapping to a negative integer and reporting erroneous negative power
readings to userspace.

[Severity: High]
This is also a pre-existing issue, but do the alert limit calculations in
ina226_alert_to_reg() cause hardware limits to be incorrectly programmed on
32-bit systems?

For INA2XX_POWER, the upper bound is clamped:

    val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);

clamp_val() implicitly casts the upper bound to a 32-bit signed long on
32-bit platforms. This results in a negative number, meaning any valid
power limit is clamped to a negative value and ultimately programmed as 0.

Similarly, for INA2XX_SHUNT_VOLTAGE, the initial clamp uses SHRT_MAX *
shunt_div instead of division. The subsequent multiplication:

    val *=3D data->config->shunt_div;

overflows LONG_MAX on 32-bit platforms for high inputs, wrapping to a
negative value and also programming the hardware limit to 0.

Additionally, for INA2XX_BUS_VOLTAGE on parts with bus_voltage_shift > 0,
the calculation (val * 1000) << shift can exceed LONG_MAX for limits over
~134V, wrapping to negative and setting the limit to 0.

> +		.has_alerts =3D true,
> +		.has_ishunt =3D false,
> +		.has_power_average =3D false,
> +	},

[Severity: Medium]
Does this configuration intentionally omit the update interval?

Because has_update_interval is not explicitly set, it defaults to false.
This hides the hwmon_chip_update_interval sysfs attribute, preventing
adjustments to the averaging time despite the INA232 sharing the INA226
register layout.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-monza-ina2=
32-v1-0-925b0d12771b@oss.qualcomm.com?part=3D2
