Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66773394780;
	Mon, 20 Jul 2026 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517952; cv=none; b=Z2FVehuixMevWc5rkOXig13ETj2fR6LT3MAcG6XD5dVE1amaXa4WS85fiU2HdA/ZZWewOcGY5FGUyzWoGSpLPVYmjeM7Qy47kyY1Mvl+T7FBGu7Wvq/er1esQEhwmpQdEUkzcsGeI3o7dWuFSG+Gks3SPgjhmZ1J8LYwUEbOMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517952; c=relaxed/simple;
	bh=e3OqflRvxCGniHXVQkTRS8Vwyd4pp+0B+G+lt4FLTRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UbvZwTIx8JswddujAP5vKEkenJ350fADBFMyU63dgnYSGmmZVykYR91ZOfbc2JrAzQ4PgyO4en0fpg/z0Cee52T4qM2pzYbWFS24LDL++DoqeLklRMXln/snsEQMcYc+30UmMBM48MGXntsx4KcmrWBxh+UmBLtbt0MzcUz6reg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzdiGz62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzdiGz62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F891F000E9;
	Mon, 20 Jul 2026 03:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784517951;
	bh=nP5oph92XdCiFeovS8gGJ05Aykhvf7tdYIBg4WvE3Vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SzdiGz628iVswPsiVvGKOAvk2yElPyGZ7QE0ONZlPQ47unI6zqCxWObijEb4xrQoV
	 xxwf6ZntJ/a4r1ceyyRvYiOj0Oc/sUnedgOFf6nEhVN9S23xXYvb7vSif3ddxVeSS5
	 3su5Z6AE1+YJmwiBYEYJywQr+MwSTLg/xOUuoofQ/bVAokCiOUlaZ6grzhflTwQNFH
	 vT4DjNZi/bT5qgZ+V6DeKgDuGKIdLnE4DXwt9TJzG6Tyflk6lFCoqpz8NyLEH/0xJc
	 FqTf4CR+82OXlRrS0Bto3ZLuXuNIvJuh2BNiis4xSi/+chM+eYYV8SPehWTg9cegnS
	 JWzRa92Ism9qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-dev-max20830c-v3-2-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-2-9d06d27d6da3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:25:50 +0000
Message-Id: <20260720032550.A4F891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The voltage divider scaling calculation suffers from a 32-bit ad=
dition overflow and an unsafe 64-bit to 32-bit signed integer truncation be=
fore clamping.
--

--- Patch [2]: [PATCH v3 2/4] hwmon: (pmbus/max20830): add VOUT feedback re=
sistor scaling support ---
commit ac88893286286c633f117369db91c2cffd163afd
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support

This commit implements support for external voltage divider scaling using
the adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties. The
driver reads these values and applies the scaling formula to the raw VOUT
reading.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index cb2c23672166d..7a5e67bd33c0a 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c

[ ... ]

> +static int max20830_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
> +	const struct max20830_data *data =3D container_of(info, struct max20830=
_data, info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Apply voltage divider scaling if resistors are non-zero */
> +		if (data->vout_rfb1 && data->vout_rfb2) {
> +			ret =3D DIV_ROUND_CLOSEST_ULL((u64)ret * (data->vout_rfb1 +
> +						    data->vout_rfb2), data->vout_rfb2);
> +			ret =3D clamp_val(ret, 0, 0xFFFF);

[Severity: Medium]
Can this calculation suffer from a 32-bit addition overflow and an unsafe
64-bit to 32-bit signed integer truncation?

If data->vout_rfb1 and data->vout_rfb2 sum to more than 2^32 - 1, the 32-bit
addition will wrap around before the 64-bit multiplication.

Additionally, since ret is a signed 32-bit integer, if the 64-bit result
returned from DIV_ROUND_CLOSEST_ULL exceeds 2^31 - 1, the assignment to ret
will overflow into a negative integer. The clamp_val() macro will then
evaluate this negative number and incorrectly clamp it to 0 instead of
0xFFFF.

> +		}
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-dev-max208=
30c-v3-0-9d06d27d6da3@analog.com?part=3D2
