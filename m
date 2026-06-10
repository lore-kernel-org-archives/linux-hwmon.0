Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F331716B
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 21:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125927; cv=none; b=lwiEmitsEzuRxkCGNXbVNO2SYw4Tr1MnphRC42yNA2wASEUOUgIx3mYa8t4z+Kc3x7TRRGKYqMxFa5Pqlmr/j9n9rj/XmEJQa9ROrpFZyTCyY1GWOfjicaH3i2eHOR/TrwaVVg4TncG5vhHWaZdsQawwvqEbdQ9wN4Y/Pbw1lYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125927; c=relaxed/simple;
	bh=14eGUkoK50jimC8L+wnpVmrvZetGRaAxZcppij4hPuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBiCtMrzUfpKOcA/TobrRPFRThdCfN2ZVsjok5PYCgKuaVLZIn/0kuHeDVwI+j+tFFwnpLWmkkJJVkOSlJjXjZK2UzqwCzYItt3waaSR90xAREsZN3kLdhaKcKkgBhvsmDqRS3StN+7AFIvA5dnsQtM9Ydfs/Ar9IAh9Fjh6Jow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R++lc0aP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R++lc0aP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDD01F00893;
	Wed, 10 Jun 2026 21:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781125926;
	bh=h6iNfyzcZP7v2D5eWvx75azX4l4eI9Cf/7YW2ZqnxA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R++lc0aPiLzqzod9JaDVVdTjahEHOxVXkLgNyDetHSN1os8BzAT3uDyOlnJ1ScIOr
	 XX2els38CBHQoPAUmQ2N3gOsbhnrIQIpZ2WSvUTGs/WONdMwuXalddbDde6pGp4pJm
	 KHEUp11xbcErlE6GLchqs9gW2hyJayr0ba//OhaJ5zwtzaL1kmcn9ZZ6bWrFo2nFIA
	 lfV4vec/5iOsNt4Nt/V7UQkhz9Kloe4UQb7pi0NTDSQLz6wmDYeDZoQxWbm8V7c/s3
	 51cCX29hiXYvfP3Bb/ERVU0J/EQr8qnqiNx1QIKkWpUOd3jr+CVAxElwKFR3qq1fSb
	 DajraLF96EWfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (ina2xx) Fix overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610210140.43657-1-linux@roeck-us.net>
References: <20260610210140.43657-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 21:12:05 +0000
Message-Id: <20260610211206.1CDD01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Build breakage: Using `DIV_ROUND_CLOSEST()` with an `s64` dividend =
causes a linker error (`undefined reference to '__divdi3'`) on 32-bit platf=
orms.

Pre-existing issues:
- [High] Arithmetic overflow in `ina226_alert_to_reg()` during `DIV_ROUND_C=
LOSEST` intermediate calculation on 32-bit platforms.
--

commit 2efec75618467bc75c51301a14034dc4018a9013
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ina2xx) Fix overflow issues

This patch aims to fix multiple overflow issues in the ina2xx driver,
specifically when calculating power, voltage, and current values on 32-bit
platforms. It introduces 64-bit variables and clamped limits to prevent
numbers from wrapping around.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 613ffb622b7c4..b2f543b89f9e8 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c

[ ... ]

> @@ -283,13 +285,13 @@ static int ina2xx_get_value(struct ina2xx_data *dat=
a, u8 reg,
>  		val =3D DIV_ROUND_CLOSEST(val, 1000);
>  		break;
>  	case INA2XX_POWER:
> -		val =3D regval * data->power_lsb_uW;
> +		val =3D clamp_val((u64)regval * data->power_lsb_uW, 0, LONG_MAX);
>  		break;
>  	case INA2XX_CURRENT:
>  		/* signed register, result in mA */
> -		val =3D ((s16)regval >> data->config->current_shift) *
> +		val64 =3D (s64)((s16)regval >> data->config->current_shift) *
>  		  data->current_lsb_uA;
> -		val =3D DIV_ROUND_CLOSEST(val, 1000);
> +		val =3D clamp_val(DIV_ROUND_CLOSEST(val64, 1000), LONG_MIN, LONG_MAX);

[Severity: Low]
Does this cause a build failure on 32-bit platforms?

The variable val64 is an s64, and DIV_ROUND_CLOSEST relies on the native
division operator. Doing a 64-bit signed division by a non-power-of-2
constant like 1000 typically causes a linker error (undefined reference to
__divdi3) because the kernel does not link against libgcc.

Should this use div_s64() instead?

[ ... ]

> @@ -378,23 +380,26 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *=
data, int reg, long val)
>  	case INA2XX_POWER:
> -		val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
> +		val =3D clamp_val(val, 0, LONG_MAX - data->power_lsb_uW);
>  		val =3D DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
>  		return clamp_val(val, 0, USHRT_MAX);
>  	case INA2XX_CURRENT:
> -		val =3D clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
> +		limit =3D (INT_MAX / 1000) >> data->config->current_shift;
> +		val =3D clamp_val(val, -limit, limit);
>  		/* signed register, result in mA */
>  		val =3D DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);

[Severity: High]
This is a pre-existing issue, but can the intermediate calculation inside
DIV_ROUND_CLOSEST overflow the 32-bit signed integer?

The macro internally performs:
(val * 1000) + (data->current_lsb_uA / 2)

On 32-bit systems where long is 32-bit, val * 1000 can be up to
2,147,483,000. If data->current_lsb_uA is large (e.g., 40,000,000 as noted
in the commit message), adding current_lsb_uA / 2 (20,000,000) yields
2,167,483,000.

This exceeds LONG_MAX (2,147,483,647) and silently wraps to a negative
value. Will this result in a large positive limit requested by the user
being incorrectly programmed as a negative limit in hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610210140.4365=
7-1-linux@roeck-us.net?part=3D1
