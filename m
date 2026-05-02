Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447431E834
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716610; cv=none; b=XlqVLHqbjrLS2f+CzRvmWhoTZ/y37pkN/kiQ1ZlTPm1SQ8Z3p59nCOnKYbILUqD8ZSokBGB+5rkAnjuOWEpkpzoOgv5GpewnMGMKJQSqSQlfpa3v3hbP0aoYi722zh7YmIGhkthr92ieJkMs0YtBY8zyRnPStjYo+Kb9XyO7WSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716610; c=relaxed/simple;
	bh=pzPcvx7yCrqJdLHmjRlJR1nGW7z7thAfgaiPAh+Sejw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PVpWCR28HLG4mVeuqkxz0S9uhl7QzfNZSmBjeBzqzmkVfOsXH7yKcnYUvlKDBj1MMT62QlXJlvIp0BDH2ozcpKEDJa7KA/u3ABCXu0akoxTmzayvdWs+Gei+U8QUVHsR2nca1DvlCikDPO/QfFJA7LF7b6hOPtWgPwqOHjh/kJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETBPvY1k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETBPvY1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDF8C19425;
	Sat,  2 May 2026 10:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777716610;
	bh=pzPcvx7yCrqJdLHmjRlJR1nGW7z7thAfgaiPAh+Sejw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ETBPvY1kud25ZamDy7e7f5ZtNGFopQ7PLXDZmUQFaRgV2TaVknOCKH8RVe3d1vJ+u
	 z5rI3wt8laMAnx1yQssP2wNDzGjuu9SZ3tOBL9c0jnI2Dv341QC5sIe0ldQl7gKUU1
	 Du4v+nGPjZ3OqQn0M0wJ1n6D7k6QvrSwGNgRapLhm/HFPxhGffz1WysgkVQz98t2mO
	 1YtNLXnmxgV1lJGvPp4+vx8/vZoRWTEtKw0yHmebQSvtfj4+T36vbZWHw34Y4whY4Y
	 AOktHHJRM4WJ+wDlIfD6VWViF3YIGjsIREU9Pvonc/J0wZy7zaHy45zU54qFdyZ9pW
	 M+QfyJQzHgNzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502094524.3358193-2-markus.stockhausen@gmx.de>
References: <20260502094524.3358193-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 10:10:09 +0000
Message-Id: <20260502101009.DFDF8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The updated set_mask of 0x10C0 is byte-swapped over I2C and will f=
orce the sensor into single-shot mode instead of the intended continuous mo=
de.
- [High] The new alarm reporting logic is mathematically inverted, violatin=
g the hwmon ABI by returning 0 during an active alarm.
--

commit bef39cd430ab022cea5921c7c9e935e0fe939e92
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Fix AS6200 setup and alarm handling

This commit attempts to fix the AS6200 initialization by changing the set
mask to enable continuous conversion mode. It also modifies the alarm
handling logic with the intention of correctly reporting alarms regardless
of the configured polarity.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f1a1e5b888f6..4fd4288ae502 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -137,7 +137,7 @@ static const struct lm75_params device_params[] =3D {
>  	},
>  	[as6200] =3D {
>  		.config_reg_16bits =3D true,
> -		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
> +		.set_mask =3D 0x10C0,	/* 8 sample/s, 4 CF */

The intent described in the commit message is to clear bit 15 to disable
single-shot mode. However, won't this new mask still force the sensor into
single-shot mode over the wire?

The LM75 driver writes LM75_REG_CONF using i2c_smbus_write_word_data(),
which transmits data in little-endian order. The AS6200 is a big-endian I2C
sensor. When 0x10C0 is transmitted, the lower byte (0xC0) is sent first and
interpreted by the device as the MSB. Since 0xC0 is 11000000 in binary,
bit 15 remains set to 1.

[ ... ]

> @@ -416,7 +416,7 @@ static int lm75_read(struct device *dev, enum hwmon_s=
ensor_types type,
>  			switch (data->kind) {
>  			case as6200:
>  			case tmp112:
> -				*val =3D (regval >> 13) & 0x1;
> +				*val =3D !!(regval & BIT(13)) ^ !!(regval & BIT(2));

Does this logic correctly map to the hwmon ABI, which expects a value of 1
during an active alarm?

According to the sensor datasheets, the AL bit reflects the ALERT pin
directly.=20

If POL=3D0 (active low), the pin is low on alarm (AL=3D0), so 0 ^ 0 =3D 0.
If POL=3D1 (active high), the pin is high on alarm (AL=3D1), so 1 ^ 1 =3D 0.

In both cases, it appears this expression evaluates to 0 during an active
alarm and 1 during normal operation, inverting the expected hwmon behavior.

Additionally, does hardcoding BIT(13) and BIT(2) solidify an underlying
I2C byte-swapping behavior directly into the logic rather than fixing the
root cause?

>  				break;
>  			default:
>  				return -EINVAL;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502094524.3358=
193-1-markus.stockhausen@gmx.de?part=3D1
