Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586342DFF4
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107949; cv=none; b=evsk2QsT/aLmzTpJyObkp85s8AD0Um1XOR7rL4KbpIBdbcS3Hf4kxtJ3bJsXJCiKTTqDdZdxUxPd++NQhhQyqJPNbJ7NB1TMlyoEbV2Mvcr9gZgu2O2hol485/A4+XJ2VeOAJN4jkUMFdbaZKEi0eTtJ/lM7O7QMCaghM9QbWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107949; c=relaxed/simple;
	bh=ZP51grzLqX2IyA03ooRGLusMnPJAzMJMoRqVC5fo8UQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L6UEAJvXwVVQzk8dY/QNUfvIjgwzqXag1sJqCG+T6kd6xrX5GOS/uKiO+Z486hYajAwMkydTsuFJY5JqQaTYhHwIFuu+t6ohps4EC/5GYLfyxxMzoA/swna/Ir4KCrCdCq6AZlcDLWjOpCkTx11UJfiLbsbheu17Zz/jN45rdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZpHD+Z8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZpHD+Z8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208061F00899;
	Wed, 10 Jun 2026 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781107948;
	bh=rSnaiaMtmaNlBWtjQ7O95p+oa6X1s9L/JeMVeGksFwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZpHD+Z8TXzW9xrXees0fK5JovREoGR08Sz/0b3SVHKE/7lAWFEUzthaWDhf57y1K
	 ODkWPCVOstqgUwPwiTbGT0vNTYJrvjwENejF1LoPou1kiUXZKs2Qhs97guqMma9ZZE
	 P9GwihX5j0bAv8sbi08+OiFRK7SqLyV4K6Cz8PSkzD5Wu/dTJk7fp0eeo0t9Z5sK1p
	 W0Xk/0MTcWpQjyQkbirJZidtl95L8xnQv2/TtiGy0EmJvezHmYJpTZuhw67iEVccRG
	 J7Za+vFeldH28U7TwfBzCTabiyJta0V80v9sslg/fHyYwtuWDlWFd1RlUOVsacdshd
	 osN4PEH0MnxWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ina2xx) Fix overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610155732.12686-1-linux@roeck-us.net>
References: <20260610155732.12686-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:12:27 +0000
Message-Id: <20260610161228.208061F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing integer overflow in INA2XX_CURRENT read calculation o=
n 32-bit platforms.
- [High] Pre-existing integer overflow in INA2XX_CURRENT alert limit conver=
sion on 32-bit platforms.
- [High] Pre-existing integer overflow in sy24655_average_power_read calcul=
ation on 32-bit platforms.
--

commit 9e5ee5483a3c4bc84b89199266642adb73bf1c08
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ina2xx) Fix overflow issues

This commit fixes multiple integer overflow issues in the ina2xx driver
that occurred on 32-bit platforms. It addresses incorrect clamping and
signed 32-bit arithmetic overflows when calculating power, shunt voltage,
and bus voltage, and updates the return type of ina2xx_get_value() to long.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 613ffb622b7c4..12ae874d0e197 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -283,7 +284,7 @@ static int ina2xx_get_value(struct ina2xx_data *data,=
 u8 reg,
>  		val =3D DIV_ROUND_CLOSEST(val, 1000);
>  		break;
>  	case INA2XX_POWER:
> -		val =3D regval * data->power_lsb_uW;
> +		val =3D clamp_val((u64)regval * data->power_lsb_uW, 0, LONG_MAX);
>  		break;
>  	case INA2XX_CURRENT:
>  		/* signed register, result in mA */
>  		val =3D ((s16)regval >> data->config->current_shift) *
>  		  data->current_lsb_uA;

[Severity: High]
This isn't a bug introduced by this patch, but does this calculation overfl=
ow
on 32-bit platforms?

On 32-bit systems, long is 32-bit signed. For configurations with small
shunts, current_lsb_uA can be very large (e.g., 40,000,000). When multiplied
by a large regval, the product can reach 1.3 trillion, massively exceeding
LONG_MAX (2.14 billion).

This will silently overflow the 32-bit signed math, wrapping to a negative
value, which causes the subsystem to report radically incorrect (negative)
currents, potentially causing automated power capping or thermal safety scr=
ipts
to fail to throttle the system under load.

>  		val =3D DIV_ROUND_CLOSEST(val, 1000);
>  		break;

[ ... ]

> @@ -380,17 +381,17 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *=
data, int reg, long val)
>  {
>  	switch (reg) {

[ ... ]

>  	case INA2XX_BUS_VOLTAGE:
> -		val =3D clamp_val(val, 0, 200000);
> +		val =3D clamp_val(val, 0, 130000);
>  		val =3D (val * 1000) << data->config->bus_voltage_shift;
>  		val =3D DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
>  		return clamp_val(val, 0, USHRT_MAX);
>  	case INA2XX_POWER:
> -		val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
> +		val =3D clamp_val(val, 0, LONG_MAX - data->power_lsb_uW);
>  		val =3D DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
>  		return clamp_val(val, 0, USHRT_MAX);
>  	case INA2XX_CURRENT:
>  		val =3D clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
>  		/* signed register, result in mA */
>  		val =3D DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
>  		val <<=3D data->config->current_shift;

[Severity: High]
This is a pre-existing issue, but can this left-shift silently overflow the
32-bit signed long before the final hardware clamp?

If a large limit is provided to effectively disable the alert (e.g.,
INT_MAX / 1000), the intermediate value after DIV_ROUND_CLOSEST can be large
(e.g., 200,000,000). When left-shifted by current_shift (e.g., 4 for INA234=
),
it becomes 3.2 billion, exceeding LONG_MAX and wrapping to a negative numbe=
r.

The subsequent clamp_val() incorrectly clamps this negative value to
SHRT_MIN (-32768) rather than saturating at the maximum positive limit, whi=
ch
would program a permanent false alert into the hardware and cause continuous
spurious interrupts that can trigger unwanted system shutdowns.

>  		return clamp_val(val, SHRT_MIN, SHRT_MAX);
>  	default:

I also noticed a pre-existing issue in sy24655_average_power_read()
where a similar multiplication overflow occurs on 32-bit systems:

drivers/hwmon/ina2xx.c:sy24655_average_power_read() {
    ...
	if (sample_count <=3D 0) {
		*val =3D 0;
		return 0;
	}

	*val =3D DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb=
_uW;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the accumulator quotient
multiplied by power_lsb_uW overflow the 32-bit signed math before
assignment?

The accumulator can reach 16,777,215. When multiplied by a typical
power_lsb_uW (e.g., 25,000), the product reaches ~419 billion, far
exceeding LONG_MAX (2.14 billion).

Because average power readings are critical for thermal and power managemen=
t,
returning invalid or wrapped negative data could cause the system to fail to
throttle under heavy load.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610155732.1268=
6-1-linux@roeck-us.net?part=3D1
