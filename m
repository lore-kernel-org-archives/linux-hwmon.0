Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077C2D3725
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025180; cv=none; b=AinHnbCCFSXUZD9fYOx+SaE4hHOD8lwXKCM6CnQgv11geJMtAGebDeIovl9JCZQ2YONsvt4qHSpoGsROy1KSo+no9LC4CP0ki1kNePUei2PO8JHdilc7l911Vd+eVcPA8kJT5wTPHf6HCr3XgREACBkTQgEXqXEQfAz73/ol71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025180; c=relaxed/simple;
	bh=JZW9FqOgKNlGr+OVdZAsl+iLG1my67/IDZ5nsGYYj8U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jgsoNj5F8LGTTKpSupFUozJAanaL94fmiGHFTjmNkzLMKbyb2m1NiXhas4yeUswRoA2geLhMbby4PWcBzLPpo0iPdQDeAVBIaUBYOUApncvvrIt2X31wlOMmwV7QKR+Hft9yTVGxxexT16CXAdlSIgCz8JT6ViwvE95YAR2g4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prp5a7r0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prp5a7r0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3920014f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 01:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770025177; x=1770629977; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NG9zIsElX5WbHaxck+/ant7kO4MYK49Qj1cyBalqLVE=;
        b=Prp5a7r08hNeA/bvpK1pRqjkdwlud3a+1wNYX5JXd9F4BbxGYu4q44XjjQ9s7Gaiq/
         ht/zFSAZW46p39/dsE3OZvFzmhP2PmQBm236uvqWZ+XM9lOK/4XcseZNcFk9RstZ3lUV
         AcYYJjbSjOuiLDiHl0EzMfLw0tpjysycrZSEIHKn/lZxjIO24DOHWjxRfU9G9zPwTxb+
         23gS4ChkRa5SVAX7y0W4QtAcpWrkVC9XCkRhwCw1x/bhvV5qvAp/PvS9Vr4Rhn3qV2rB
         WH60EwZIVKLpykSqp13RdlFlQnyh42tG/2iJ+U6s/teaoIc1YqRcGwegpj0Gqt/QuIKe
         5rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025177; x=1770629977;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NG9zIsElX5WbHaxck+/ant7kO4MYK49Qj1cyBalqLVE=;
        b=aSbFgKKuEN9g9l2nciaubTRvHmQwSihvUSHBR3iB3AF6NOChC+QB7e0BoorUAeKrU8
         lZt7APNx5IqYcbKdURxZmnWiRNDRS+DpkqziyOvnQAT2GGz/C6d0J40w57++tCXnvIvD
         jyURqEvoSRWGpV3mIBfDGcybqMTiVluAyOOVSl71tQlacuw6+ubO3+1TFQ1RA5vXy4kU
         9dqtwx0swuvl+u40dEzhf8BjCeokh2OczUHiXhJGVWFjVJiBae9aCDmWsPqE1RyngLXW
         2VBkE0/ZFYe5usxj4sDqZvb7kgB2gLMSPAS8eSUq7zetAJibnto8TBg0f/gl6sr44MEN
         cbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXcjvqFJjYt2fkFZiru3yGPyMxwUMdA000uDfp+YF6gjJINCko1IXedtVIikxiogVTrA6CB62VaoF0Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo17qmf1VC2LNoz8+YJCGL4LArdut90m37VY0HCunta1pSQIjX
	5qlVxzzVje1T/C5eGxN1AheYs0/LzupVabMklmgSXs5yVpYQWVUWtLZC
X-Gm-Gg: AZuq6aJcICWgbERv5hSXoO76sTj/5EtBdZh/0Va25BviVPjPxTFPfQbxD3TXYVlXAar
	vHBH0iabw1SKb2Xn0PUhaD2wP0RNmr7VVVSzuSDlg6SqXxn/mciXdB2eOwBsXupopz3JTGRhyxm
	sa+lq143eRXJYQ2GTQupvxbsd3c5KvqHsGlV6yRI4aPDtmHEB6mihrkC8/Lpp2eBYrbJu06kzox
	J9U1Zz0OaF5G7q82DM9W1JQxVpjC9ppudILlItTkFhH1LciBai1S6QCKGFxmgNCww6sIUSJWRZy
	bQPlff6Tj+AkqzK62Gjste1DSwCg6Kqa6lao18Q3Ou1hPYl0SX2niQuaDsBYoaRnE3s/X3i9NV1
	AVaDUMvKkb312S0cvRAzjcZzK4Ai2W/rQ0xMFYQvMfX+h+iBOeMMSi+DTw1pvl2o2nqdEhOlB67
	7+UsqRuuvDMDeRDio9070=
X-Received: by 2002:a5d:5885:0:b0:430:f6bc:2f8a with SMTP id ffacd0b85a97d-435f3aac95fmr17351963f8f.47.1770025176575;
        Mon, 02 Feb 2026 01:39:36 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e13235f5sm41242186f8f.29.2026.02.02.01.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:39:36 -0800 (PST)
Message-ID: <0f6c51ed27643a7fc94df0a40c476326cfeb0043.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jean Delvare	 <jdelvare@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)"	 <robh@kernel.org>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>
Date: Mon, 02 Feb 2026 09:40:18 +0000
In-Reply-To: <e2208717-0f47-48d6-9cf2-20196e13a3d0@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
	 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
	 <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
	 <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
	 <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>
	 <e2208717-0f47-48d6-9cf2-20196e13a3d0@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-28 at 10:22 -0800, Guenter Roeck wrote:
> On Wed, Jan 28, 2026 at 06:07:24PM +0000, Nuno S=C3=A1 wrote:
> > > [ ... ]
> > >=20
> > > > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > > > +				=C2=A0=C2=A0 u32 reg, long *val)
> > > > +{
> > > > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA =
* MILLI;
> > > > +	unsigned int __raw;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D regmap_read(st->map_word, reg, &__raw);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/*
> > > > +	 * Power is given by:
> > > > +	 *=C2=A0=C2=A0=C2=A0=C2=A0 P =3D CODE(16b) * 32.768mV * 2.048V / =
(2^16 * Rsense)
> > > > +	 */
> > > > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->=
rsense);
> > >=20
> > > Does this overflow *val on 32-bit systems if the calculated power exc=
eeds
> > > 2000 Watts (approx 2^31 microWatts)?=C2=A0 The intermediate calculati=
on is
> > > u64, but the result is assigned to a signed long.
> > >=20
> >=20
> > I'll have to double check this one but IIRC 2000W is not a realistic va=
lue for
> > these applications. One thing that could overflow is power_max given th=
at the default
> > register value is 0xff but we do write the proper max value depending o=
n
> > rsense (I actually need to check how will this behave in case we use a =
default
> > rsense value - ie with no DT property).
> >=20
>=20
> I have been wondering if I should introduce a hwmon_power64 sensor type, =
similar to
> hwmon_energy64. WDYT ?
>=20

No strong opinion. As I said, not sure if it's needed here but OTOH given t=
hat power is
microWatts I guess it's a matter of time. Anyways, if you do it, I might as=
 well just play safe
and use it in here (and ltc4282 should also be converted - likely).

- Nuno S=C3=A1
