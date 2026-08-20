Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F144BC9A
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232074; cv=none; b=WusDz4PWC+EYy4cRWtHXS8sAkDqDlmJVc5odHa5ucV1eFoWMj4FMWALOQtAT03NmOvtf0fvkimMH5Y68xl2mL1dKBhnWdLD1+Z6UvHFHuzceEgJUxpi9twMA8RnMhfHNBD8h392+bfrSqaQkK8rK5k6qctkmg02l6BW5dZsLSjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232074; c=relaxed/simple;
	bh=P3pOqzqIMXM8Bb3BQl4oWxHjyj2CD1Iy1uKm1keznfk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=upKCPHdAWlWgUQZavbMczEM8wSHK1St+z4F1LA309IY65Xv5qqSUNMu7AFcpfBQGsK6tZ/RiiLnfcqnAw/YmKnapxzN9d8kwHDrixRXpqbJ7Gq4v5uEbUmiu9a1/8P1zbZG2+SXKeaEL+JrGcV+iF4VEteY3XzJuh3l8zM5XJFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxP9O+LP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxP9O+LP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA69C1F00A3A;
	Thu, 20 Aug 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232072;
	bh=jFGvAx49xLW7nd04CCGh4FE0G9vmx2OnO647yLjz7/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxP9O+LPnhWushu7QR2Viv+mEC1Eo0GXjvRatMl5Rcd6G4epM3dVavlBMM4awCIy9
	 nps6MbffnHMDJnp/4Cr4SqOpvsFzMdLHHzmY3SS57EtAqo5be2OUT6j6R70PDK799/
	 1hesVsooRzgIFnLZ/wp2Cku9bDJmlI5ZFX5aq45OTWU1FRLKDD7O5L95YM/lpm9H6c
	 YO+ZsaIIzIhHrsViyRjGzZBlhbskzYzrWJShE4ZZ77+xn9Yq9GZDreD258QNe7f1rr
	 8aaXHqjNbhQPGqRqzhbsIkbdNjgCEJ2WiJVUtsTsBbdTg8I0HstLuToKFLwKQBIG0P
	 2wU2UwSEcXYAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (ina2xx) Parameterize ina2xx_data in
 ina226_alert_read()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-2-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-2-fdce35abc41e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:21:12 +0000
Message-Id: <20260820132112.AA69C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Arithmetic overflows and incorrect clamping logic cause alert limi=
ts to be wrongly configured to 0 instead of maximum for shunt voltage and p=
ower alerts on 32-bit systems.
--

--- Patch [2]: [PATCH v2 2/4] hwmon: (ina2xx) Parameterize ina2xx_data in i=
na226_alert_read() ---
commit 034555c6bd153d8c094cfb7d04cc7d98d34d3774
Author: Jared Kangas <jkangas@redhat.com>

hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()

This commit updates ina226_alert_read() to take a struct ina2xx_data pointer
instead of a struct regmap pointer. This aligns its parameters with
ina226_alert_limit_read() and ina226_alert_limit_write().

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index f6c63ce1ef193..c56e42432673f 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -476,12 +476,12 @@ static int ina2xx_chip_read(struct device *dev, u32=
 attr, long *val)
>  	return 0;
>  }
> =20
> -static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
> +static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *v=
al)
>  {
>  	unsigned int regval;
>  	int ret;

[ ... ]

[Severity: High]
This is a pre-existing issue, and was not introduced by the patch under rev=
iew,
but does ina226_alert_to_reg() have arithmetic overflows and incorrect clam=
ping
logic on 32-bit systems?

When a user or configuration script sets a valid power limit or a large shu=
nt
voltage limit on a 32-bit system, it appears the values might collapse to z=
ero:

drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
    ...
	case INA2XX_SHUNT_VOLTAGE:
		val =3D clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
		val *=3D data->config->shunt_div;
		val <<=3D data->config->shunt_voltage_shift;
		return clamp_val(val, 0, SHRT_MAX);
    ...
	case INA2XX_POWER:
		val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
		val =3D DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
		return clamp_val(val, 0, USHRT_MAX);
    ...
}

For INA2XX_POWER, could UINT_MAX - data->power_lsb_uW implicitly cast to a
negative long upper bound in the clamp_val macro, forcing all limits to
negative?

And for INA2XX_SHUNT_VOLTAGE, is the clamp mistakenly using multiplication
(SHRT_MAX * data->config->shunt_div) instead of division, allowing large va=
lues
that later overflow a signed 32-bit long multiplication?

In both cases, it looks like the final step clamps the negative intermediate
value to 0, which could cause immediate false hardware alerts if the alert =
pin
is wired to hardware reset logic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-upstream-i=
na2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com?part=3D2
