Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF62A36B931
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024214; cv=none; b=N8WGuZup1kPujnBoGexDO7Xn6y/kB8TuExjoTroTX07iwwJ/sINwf2Hx8nn7VlwAZ6pwAe9QH5YuIBTx9ihRIdhAV1ciPvQHsjFrHJsf5uLl+jymAEkDxOCgHwzkA0u454b4A6NcCZVdDcFTOiY7mTzMMLzVE3rNaa1TenpmMqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024214; c=relaxed/simple;
	bh=inm2ht2aYTQwjmYxhPSlrEk4tSvS/jUCLhPsVIFWc8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUqmgCtuTr7K6PWcYS2NL12eckflmQeeBsbiDA42/PWRt1Ga+P66tvIkL0DYONppzLO+OdYfhdqJuG8OcQ9/K/2eXeUER33Eo6iHidZGNBcEyNLeVpLcPfkLPBL7ivHEvv2o2xzk8JOnP65b079G/7wqoPWYMj6hNZnkI5s8+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW9HgHaz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW9HgHaz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D631F000E9;
	Sat, 29 Aug 2026 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788024212;
	bh=QF0pcX/UZLTMZlnuku4oO+KkEDPqzp6LzG5JGfLD/yI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dW9HgHazytm2q4ZlbY87wM7s5iIS1rCxH1WGLv8s9Ndl2y39/+D/RDyBJgxqQTTpF
	 B8nsVaWeUW/JChz6VnAp6/TgA6vbIrdYYRvsWeLmSpAwGeb3s/T+IMw79haT2Lz1wP
	 ZMYqNafoiWN3NQYxPaRYkgG0LkexgdXhlRF+MDkbZjTfWTEhjHXIn6NUlxVRl0kNRf
	 xM6hahwl4+hNgruxNASK4aVJ1u/pcWYlQOhm/z+PULUQCDfw2ZDpZ1LEpI8vUvpMsI
	 eC5Xt3UGVLBBS9iXNiBzSLCzhV04O6QXSY2hcIJVqi5737zS0ZnyIcMif6ccWxF+ca
	 ONLPXg/+qjN9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: it87: add IT8613E support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829170545.33401-5-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829170545.33401-5-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 17:23:31 +0000
Message-Id: <20260829172332.51D631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The IT8613E configuration specifies support for 6 temperature se=
nsors (num_temp_limit =3D 6), but omits the FEAT_SIX_TEMP feature flag, sil=
ently disabling sensors 4-6.

Pre-existing issues:
- [High] set_temp_type and get_temp_type corrupt and misinterpret IT87_REG_=
TEMP_ENABLE for temperature sensors 4, 5, and 6 due to incorrect bit-shifts=
 exceeding the intended sensor bounds (0-2).
--

commit 62e828013c359cc9aa023fe24c4b5b0736549b6b
Author: benoit.masson <yahoo@perenite.com>

hwmon: it87: add IT8613E support
   =20
Teach the Super I/O probe path to recognize IT8613E and add its complete
hardware monitoring configuration. Add feature flags, temperature resource
counts, 11 mV ADC scaling, the IT8665-style PWM register map, and GPIO
pin-mux checks. Document the chip in the hwmon guide.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e44ec65c76f03..67a94761d1c89 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
[ ... ]
> @@ -549,6 +552,19 @@ static const struct it87_devices it87_devices[] =3D {
>  		.num_temp_map =3D 4,
>  		.peci_mask =3D 0x07,
>  	},
> +	[it8613] =3D {
> +		.name =3D "it8613",
> +		.model =3D "IT8613E",
> +		.features =3D FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
> +		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
> +		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
> +		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,

[Severity: Medium]
Does this missing feature flag permanently disable sensors 4-6?

The IT8613E configuration specifies support for 6 temperature sensors with
num_temp_limit =3D 6, but the FEAT_SIX_TEMP feature flag is omitted here.
Without FEAT_SIX_TEMP, the probe logic in it87_probe() will not enable
the extra temperature sensors, leaving sensors 4-6 completely inaccessible
in sysfs:

drivers/hwmon/it87.c:it87_probe() {
    ...
	} else if (has_six_temp(data)) {
		u8 reg =3D it87_read_value(data, IT87_REG_TEMP456_ENABLE);

		/* Check for additional temperature sensors */
		if ((reg & 0x03) >=3D 0x02)
			data->has_temp |=3D BIT(3);
    ...
}

> +		.reg_pwm =3D IT87_REG_PWM_8665,
> +		.num_temp_limit =3D 6,

[Severity: High]
This is a pre-existing issue, but configuring 6 temperature sensors exposes
an out-of-bounds bitwise shift bug in get_temp_type() and set_temp_type().

When querying or setting types for sensors 4-6 (indices 3-5), get_temp_type=
()
misinterprets the configuration by reading bits 3-8 of IT87_REG_TEMP_ENABLE,
which belong to sensors 1-3:

drivers/hwmon/it87.c:get_temp_type() {
    ...
	else if (reg & BIT(index))
		type =3D 3;	/* thermal diode */
	else if (reg & BIT(index + 3))
		type =3D 4;	/* thermistor */
    ...
}

If those attributes become visible, set_temp_type() will apply out-of-bounds
bitwise shifts to IT87_REG_TEMP_ENABLE:

drivers/hwmon/it87.c:set_temp_type() {
    ...
	reg =3D it87_read_value(data, IT87_REG_TEMP_ENABLE);
	reg &=3D ~(1 << nr);
	reg &=3D ~(8 << nr);
	...
	if (val =3D=3D 3)
		reg |=3D 1 << nr;
	else if (val =3D=3D 4)
		reg |=3D 8 << nr;
    ...
}

Can this corrupt the chip configuration? Using unbounded nr indices (3-5)
will overwrite unrelated sensor configuration bits instead of targeting the
correct register, severely breaking thermal monitoring configuration for the
primary sensors and potentially leading to dangerous misbehavior in automat=
ed
fan control.

> +		.num_temp_offset =3D 6,
> +		.num_temp_map =3D 6,
> +		.peci_mask =3D 0x07,
> +	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829170545.3340=
1-1-jerome.tollet@gmail.com?part=3D4
