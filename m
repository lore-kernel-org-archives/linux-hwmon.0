Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1A18FC97;
	Thu, 11 Jun 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187546; cv=none; b=CND55zlNqzurR8HXPUcRooHBB8BJJli+NhvzPzwkQG7/NLZjN6DHOWLG8r/lIxMUz5xI+wzRiNaHLkHhwdL64mZ0U3P8LnF4yo/Zf2OGAYYa5iggVSKveIz6PuPF9+YL5LaRJ0BNqs8G2c7nsGMqk3bq+a1a//ScQJk21B7D98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187546; c=relaxed/simple;
	bh=BEP8vt47lMibPi5rraOMux9WZgsqrDGbpToFR83WiLU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qyXJNMgcWzeZ5r95WOFxFKCUaX6ga7B6puIdp2Ynl08HBi/+/3R61xwj2VxA/kSZTrVTQiGw5AQJcCX/Gmmnx8VA4umJ/8v8/fRL9gGwrdLBG0/Tkj4EW56uHoUlMOo6FTdUrH7owsSo9hjbuFKX5L8SBGvOHvMNWwsFYZNfE4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuNTYufQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuNTYufQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8821C1F00893;
	Thu, 11 Jun 2026 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187544;
	bh=UfLlXnqFthU2IAGGsWz5h/p8ob89v+Kkme73oAvJqOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fuNTYufQMznXm7mLbg6X5DaPb4I1aQE8Elei2qcEKpASzV0gVaejanguuyPykC1o5
	 tHF2aGfX+YNLJHhDRS6Cw+HFKw8cMM28OS50qnAKfE6CBn2t6v1ghdOlhbdMrh9kTY
	 hukLN8j+KU/m2mW2NDF+c7NwTvtIQ+YgokV/tKTXhK32Kx3jHPhgITY1j4+HJTYl5j
	 kdsc8jE8zkMgU6Xb+x9OqrK6vltzCYRL13SPL+AZ/qTM0kB6NQ37OqnpHtLE0j6qLj
	 9pvyq748QW6+xM4cpezc3yQX9/GhN968z+B3GaCzLZaYfmdaoY6tsyAgB2bgm/Bi4A
	 GjkRXkRlrTi6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 14:19:03 +0000
Message-Id: <20260611141904.8821C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Power alert limit calculation always evaluates to 0 on 32-bit syst=
ems due to `UINT_MAX` underflow when cast to a signed long.
- [High] Setting a high bus voltage alert limit on 32-bit systems causes si=
gned integer overflow for chips with a high `bus_voltage_shift`.
- [High] Arithmetic overflow and truncation in power and current reading ca=
lculations due to 32-bit signed integer limits.
--

commit 1860bedc8e47e2aefaa388ad7ade74649ff17da9
Author: Martino Facchin <m.facchin@arduino.cc>

hwmon: ina2xx: support ina232

The INA232 is a current/power monitor. It shares the same register
layout as the INA2xx and uses the INA226 default configuration, but
differs in its electrical characteristics.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 613ffb622b7c4..fc2319ad99fc3 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -196,6 +197,20 @@ static const struct ina2xx_config ina2xx_config[] =
=3D {
>  		.current_shift =3D 4,
>  		.has_update_interval =3D true,
>  	},
> +	[ina232] =3D {
> +		.config_default =3D INA226_CONFIG_DEFAULT,
> +		.calibration_value =3D 2048,
> +		.shunt_div =3D 400,
> +		.shunt_voltage_shift =3D 0,
> +		.bus_voltage_shift =3D 0,
> +		.bus_voltage_lsb =3D 1600,
> +		.power_lsb_factor =3D 32,
> +		.has_alerts =3D true,
> +		.has_ishunt =3D false,
> +		.has_power_average =3D false,
> +		.current_shift =3D 0,
> +		.has_update_interval =3D true,
> +	},

[Severity: High]
This is a pre-existing issue, but does power alert configuration work corre=
ctly
on 32-bit systems?

In ina226_alert_to_reg() for INA2XX_POWER, the limit is clamped using:

        val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
        val =3D DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
        return clamp_val(val, 0, USHRT_MAX);

The clamp_val() macro casts its limit arguments to the type of val, which is
a signed long. On 32-bit systems, UINT_MAX - data->power_lsb_uW evaluates to
a negative value.

Because the maximum limit is negative, clamp_val() forces any positive input
to this negative limit, and the final clamp_val(..., 0, USHRT_MAX) will
unconditionally return 0, silently disabling or instantly triggering alerts.

[Severity: High]
This isn't a bug introduced by this patch, but could setting high bus volta=
ge
alerts on 32-bit systems cause an integer overflow?

In ina226_alert_to_reg() for INA2XX_BUS_VOLTAGE, the value is calculated as:

        val =3D clamp_val(val, 0, 200000);
        val =3D (val * 1000) << data->config->bus_voltage_shift;

For chips with a high bus_voltage_shift like the INA234 (shift =3D 4), a va=
lid
high input limit such as 150,000 mV evaluates to (150,000 * 1000) << 4,
which equals 2,400,000,000.

On 32-bit architectures, this exceeds the maximum positive value for a
signed long, overflowing into a negative number. The subsequent clamp to
USHRT_MAX then limits this to 0, converting legitimate high voltage limits
to 0.

[Severity: High]
This is a pre-existing issue, but does this calculation overflow for systems
measuring high loads with low-value shunt resistors?

In ina2xx_get_value(), the calculation is stored in a 32-bit signed integer:

static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
                            unsigned int regval)
{
        int val;
        ...
        case INA2XX_POWER:
                val =3D regval * data->power_lsb_uW;
                break;

For a system using a 1 mOhm shunt, power_lsb_uW might be 80,000. If regval
is large (e.g., 65535), the product exceeds INT_MAX.

This overflows on 32-bit systems or truncates when assigned to the 32-bit
integer val on 64-bit systems, causing the driver to report completely
incorrect and often large negative values.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-monza-ina2=
32-v2-0-e4375ce652d0@oss.qualcomm.com?part=3D2
