Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028B362143
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 23:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782775985; cv=none; b=pg3GZzwQQi9W+FLDWJJEfshrlzuZF/gEUp0c9Lwa+TjSHMVo8gFEONREU2/t+MljL8mWsSnQ/8QYC7c1oIDVFqlaRD83XKrUIf8B/iZVjAKTr9MjLU0gSmhxhn+aF8AbG4ZAdB1e1/J7jKU9IlSf5heKwMU9fIoEPPjlL9pJRNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782775985; c=relaxed/simple;
	bh=Pq3FR9e8WBuqkdXFgXPx7/JplipIP06Ab/5vkNaijuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bz9+Ez9sNLa10zTjhmhqYAITKWi3tS1xeXBFXdl7vXcRD+yHCOa5znUi2NBzKzYNinzp1g7RghFjoCR11MScZjcc9aY6b6pp0KecF5tzHFoldYM1A8VAbQQa5rfpf2pN6xTtfKunXvQC3h+wLkUBdaQuWXXvlf71yYuQvCMtKng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gW3SU6Xg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gW3SU6Xg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9AD1F000E9;
	Mon, 29 Jun 2026 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782775984;
	bh=amTHdrHrlVQRupHJvCAEMXKVk+m4lmBvg2nSoItkIj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gW3SU6XgUYRK95jWKPGzzvjjlCyjAHMN0YVHW6LhuUkpDVYN+R9q2MU6P7DmKAAnK
	 bzfwifB2bAzd1EZRKa8Yzhr4G/5r8SNMw7sHeFT4mAhIYakeHYXqFK2V9ebGT+oWuu
	 SCUPTM8adZH0X4VF0tPDbUBUFLrUkCnR8Ywq0o/K6OE441M/CXF3ttVfQxBTQITABF
	 mMLg8PUYWXa6qFuAADOrchoh6vWUQlfMK8jEdTOi0GB12ByzdHOrY5rfCBy+uiJcVP
	 sP/akJEBvXaHtsInlGwFVzoDAmF6zC46LqQTD5mR0j7OzBvUoPcQEr92xM+eVvJ1k5
	 qGQCPasRNiMkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Guard fan RPM calculation
 against divide-by-zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629232305.2013406-1-linux@roeck-us.net>
References: <20260629232305.2013406-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 23:33:03 +0000
Message-Id: <20260629233303.CB9AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver maintains a single global `tach_divisor` variable share=
d across all fan channels, causing cross-channel corruption of RPM calculat=
ions.
- [High] Out-of-bounds array write and MMIO access when `tach-ch` values fr=
om the device tree exceed the maximum allowed channels.
--

commit f0b2d4a2512939274908261753aaf7016a48ac2e
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (aspeed-g6-pwm-tach) Guard fan RPM calculation against divide-by-zero

This commit fixes a potential divide-by-zero exception in the
aspeed-g6-pwm-tacho driver. It checks if the calculated tach_div is zero
before calling do_div() and sets the rpm to zero instead, preventing a
kernel panic on invalid tachometer values.

> diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6=
-pwm-tach.c
> index 4f6e6d440dd40..5d611a8e52690 100644
> --- a/drivers/hwmon/aspeed-g6-pwm-tach.c
> +++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
> @@ -293,7 +293,10 @@ static int aspeed_tach_val_to_rpm(struct aspeed_pwm_=
tach_data *priv, u32 tach_va
>  		priv->clk_rate, tach_val, tach_div);
> =20
>  	rpm =3D (u64)priv->clk_rate * 60;
> -	do_div(rpm, tach_div);
> +	if (tach_div)

[Severity: High]
This is a pre-existing issue, but does this driver maintain a single global
tach_divisor shared across all fan channels?

Looking at the calculation of tach_div earlier in aspeed_tach_val_to_rpm():

tach_div =3D tach_val * priv->tach_divisor * DEFAULT_FAN_PULSE_PR;

It appears priv->tach_divisor is a single scalar variable in
aspeed_pwm_tach_data rather than a per-channel array. If a user or thermal
daemon writes to hwmon_fan_div for one channel in aspeed_tach_hwmon_write(),
it overwrites this global priv->tach_divisor.

Subsequent RPM reads for all other channels would then use this overwritten
value instead of their respective hardware-configured divisors, potentially
misleading thermal management daemons with incorrect fan speeds.

> +		do_div(rpm, tach_div);
> +	else
> +		rpm =3D 0;
> =20
>  	return (int)rpm;
>  }

[Severity: High]
This is another pre-existing issue in this driver, but is there a risk of
out-of-bounds array writes and MMIO accesses when reading tach-ch values
from the device tree?

In aspeed_create_fan_monitor(), the driver reads raw channel numbers:

ret =3D of_property_read_u8_array(child, "tach-ch", tach_ch, count);

Then in aspeed_present_fan_tach(), it uses the unvalidated channel value
to index into the statically-sized tach_present array:

priv->tach_present[ch] =3D true;

It also uses the unvalidated channel value to calculate MMIO offsets:

val =3D readl(priv->base + TACH_ASPEED_CTRL(ch));

If the device tree provides a channel number that exceeds the maximum
allowed channels, could this corrupt adjacent memory and trigger
out-of-bounds MMIO accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629232305.2013=
406-1-linux@roeck-us.net?part=3D1
