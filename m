Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794186384;
	b=0Ftro9vDcnwBO33g7/xVDXVTqEd8ed9erzwc0SubJv03GuuECRPcEtUN0yH/EgoHV3/V
	 YBzYDkBZUa336Awp6u2l2dhhxDCoCxkZTZuyqXAP4mBdIFfLlZYiVoeP69CQGBEFLYDIw
	 KJ8rJAXLp9qpzKmI+mzP9P+TqtP3srLuv5INpk1Foho2LdnA/Q72NkoeCMoI2iAiEDUMc
	 3NiLMlW/RfOCcxBEXspfz9kq9d/d8ldlx+xU6UiuIK0qet0PpxvC19IWa5qEp87+6Wo1U
	 ze0oLsihOhJJgmpJ3An68IOjJuULnEq/w1caRBP9s461Rv0HlODUR0nind8mCpsKuHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794186384;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0ccSxYjxGzAtaHzkcwmwCf630xLQpL/NmFnj7j12J9Q=;
	b=kJLUmAtal8J4wbkH7M+4UknFCiomCAwAnxR9oJ/BnfyYPEfzQ5k59QUcHe2FL63s0zOC
	 PwxzdNIPE09bMWUkwCprPJ3WKtHZOnIYePsI9TFeBpoEqrKSCrDhy/wLkO0M0CBLWkUms
	 J1h8kjJHwgmEv6NkubXBgQXiWiJ/JV3oGdqRhYUg8dczM1vXZZeUtmUj0IZlAmsIAz/3x
	 H8pel+y2oqENylqEF/Erq7MZZS5cYM2g+MW664OzK9FEdW3djNKQUpm0z7M6JefFLlcme
	 1+LMFde1dW28Ab20kPzdWBD3T3bpccu34fyoSYQyTPZQPD9UNuftgDQX1sePZxrxoLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvOHLJpr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CD606A31C;
	Mon,  9 Nov 2026 01:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvOHLJpr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5435A1F0089F;
	Mon,  9 Nov 2026 01:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794186383;
	bh=0ccSxYjxGzAtaHzkcwmwCf630xLQpL/NmFnj7j12J9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RvOHLJpreStcLHwPG1Apj8qYNLgt2617Q3dKPvODU1JDDgNnxMDRd+YYEMcR0dKrG
	 H7cHnPj48xbU3tC0tS5uNYGt8zR5vwPRaALUWAg+0zVZErkmQiIWJthtPZ3yZKbnaU
	 HbijEEViBqHo4Yo2QBR4cDF5jbkf+I6c3zQOlzGeWrEg6g/7C+OlHk3VzBF4wR+emo
	 N6VrqFEKyJ2SjfhfV4n6LIFzgTDmnF1ELEFvonDXnEaBFeCkpJPlXoDNW3iXyQgUl7
	 Gn2xZmzJBEYH8Ga20ILrxfvgHQGPKieEGXeOcDRvwngA+6i6fIXpcloaKDpW/UTMNh
	 QcbTk7sdryg1g==
Message-ID: <sashiko-outbox-204280@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4284 swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-staging-ltc4284-v2-2-14a270a38f7b@analog.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-2-14a270a38f7b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 01:06:22 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: ltc4283: missing default radc fallback in ltc4283_setup()
--

commit c323a5fb63d971c9df83e57980902ef0c39f7d96
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: ltc4283: Add support for the LTC4284 swap controller

This commit adds support for the LTC4284 hot swap controller to the ltc4283
hwmon driver, handling its dual current sense channels and dedicated ADC
power sense resistor.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> index 9ec409bc26482..a8587beed853a 100644
> --- a/drivers/hwmon/ltc4283.c
> +++ b/drivers/hwmon/ltc4283.c
[ ... ]
> @@ -1240,6 +1335,27 @@ static const u32 ltc4283_fet_bad_delay[] =3D {
>  	256, 512, 1002, 2005
>  };
> =20
> +static int ltc4283_read_resistor(struct device *dev, const char *prop,
> +				 u32 *val, bool optional)
> +{
> +	int ret;
> +
> +	ret =3D device_property_read_u32(dev, prop, val);
> +	if (ret) {
> +		if (optional)
> +			return 0;
> +		return dev_err_probe(dev, ret, "Failed to read %s\n", prop);
> +	}
> +
> +	if (*val < LTC4283_MIN_RSENSE || *val > LTC4283_MAX_RSENSE)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "%s(%u) too small or too large [%u %u]\n",
> +				     prop, *val, LTC4283_MIN_RSENSE,
> +				     LTC4283_MAX_RSENSE);
> +	*val /=3D CENTI;
> +	return 0;
> +}
> +
>  static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
>  {
>  	u32 val;
> @@ -1252,24 +1368,38 @@ static int ltc4283_setup(struct ltc4283_hwmon *st=
, struct device *dev)
> =20
>  	/*
>  	 * Default to LTC4283_MIN_RSENSE so we can probe without FW properties.
> -	 */
> -	st->rsense =3D LTC4283_MIN_RSENSE;
> -	ret =3D device_property_read_u32(dev, "adi,rsense-nano-ohms",
> -				       &st->rsense);
> -	if (!ret) {
> -		if (st->rsense < LTC4283_MIN_RSENSE || st->rsense > LTC4283_MAX_RSENSE)
> -			return dev_err_probe(dev, -EINVAL,
> -					     "adi,rsense-nano-ohms(%u) too small or too large [%u %u]\n",
> -					     st->rsense, LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE);
> -	}
> -
> -	/*
>  	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which
>  	 * means we need nano in the bindings. However, to make things easier to
>  	 * handle (with respect to overflows) we divide it by 100 as we don't
>  	 * really need the last two digits.
>  	 */
> -	st->rsense /=3D CENTI;
> +	st->rsense =3D LTC4283_MIN_RSENSE / CENTI;
> +	ret =3D ltc4283_read_resistor(dev, "adi,rsense-nano-ohms", &st->rsense,=
 true);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * For LTC4284, rsense is for SENSE1, rsense2 for SENSE2, and radc is
> +	 * the effective sense resistance for ADC+- pin.
> +	 */
> +	if (st->info->id =3D=3D ID_LTC4284) {
> +		ret =3D ltc4283_read_resistor(dev, "adi,rsense2-nano-ohms",
> +					    &st->rsense2, true);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ltc4283_read_resistor(dev, "adi,radc-nano-ohms",
> +					    &st->radc, false);
> +		if (ret)
> +			return ret;

[Severity: Low]
Should st->radc also default to LTC4283_MIN_RSENSE / CENTI and treat
"adi,radc-nano-ohms" as optional?

Unlike st->rsense, passing optional =3D false here causes an LTC4284 device
instantiated via ltc4283_i2c_id without firmware properties to fail probe
in ltc4283_setup().  Defaulting st->radc to LTC4283_MIN_RSENSE / CENTI
would allow LTC4284 to probe without firmware properties just like LTC4283
and would also make the optional parameter to ltc4283_read_resistor()
unnecessary.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-staging-lt=
c4284-v2-0-14a270a38f7b@analog.com?part=3D2
