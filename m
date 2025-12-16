Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7BC33D6D2
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891002; cv=none; b=CK7EXe/qsHLi9d19OafLfYZ8BGLXs4Fe/NXI9Zjp3UJkT6ywhiIA4cXER4xT6LJiD0eDpO7n1hoMF1IWTiv0WUuG8d1zImKGje664021GQekTJuIPA7+WzqIPuTAfD3Z8HZ80QIDxDQ84P2gouC0g30psGB8o3tahL27b9jPxlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891002; c=relaxed/simple;
	bh=ie+AJbWUF5jtAMvd+Vk2sYgjyzBsY+yVmjQ8OwD7xm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HcZh4C2a2IzwCQOaitBTP6L2r5p2WDMoaGJfRQadENpBgWCz/Le3KnmRsTU7Pd49Jdh+1npWCSptkQgmU1J0PeEI+wGybgz8tx1S72IbnCguAyZ5nN1XK3M90xgeTOj9ylLc4hPuOGdaM93x43sz9mnC2re8n0SNxK/CWaBoPok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQH7mhPy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQH7mhPy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so43945885e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 05:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765890997; x=1766495797; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9wEQyxMelFUxIKkKjwpqNdvXFJKNGJ/TVkTqrb2W9yo=;
        b=cQH7mhPyhODzTUmWb7AP/SnvcqSZ5JMfmdA4afCm/ROKeT3lGClRoS0+cl1yaZCpxx
         CTyXx0njdamGeS1tnUawkfAYin1ifKRgRi+7OynH0fS3CJpqBfmxzT+zo7Het1J15BWX
         ytsDp8nqbEU2UqE+iCN1wZvsgnYw+wlgircupK3NlZe1iBUmtmvgQu7dJAde8fXegKaP
         CoBv+u5RrgAwbho+dEApk4Z9wDzEeP61FYKMzfKud38xmco0HqXfVWsycu5+wkqt3gzu
         f2KLe+FPCjlU2ycNjJ47lWsDh95mrGJUgbqYKmKCQiCqV6JLP5HAv7Tm19TeH9dmUGw6
         CcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765890997; x=1766495797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wEQyxMelFUxIKkKjwpqNdvXFJKNGJ/TVkTqrb2W9yo=;
        b=gIaWQB7B2YssyEGMMMml8vl31r7hSpyeTkYpOF6bd7tpZII1dGoBJALUmbrXDeyc6X
         61EEuwmdzKif1e8PboCoXqnqdhKtSir1OOAOuLAr1HWX3BSRdUL+DJCDp1Bk1vpUgj1v
         WDiquSs5My9Lvwu+62dmC6W9+TY5pKKQh29V3DSBDM47sRP+TGSAv8VUjHJAQYGPKhkk
         At1tHD3g+u8tqjn/bOauj9RtvFjYfzCW5zDEn0HvT5UPPpBs3dZ0HO00/UwQbxLi10pc
         HnjONmkKQ8lbnNjiWy//GsXGeHi+CG8bVmnlDphMdEAjE3dB/AmhpwE+MInreXNZVIeP
         PoNw==
X-Forwarded-Encrypted: i=1; AJvYcCWzHRTBi9GDNyzp0ziisUi8Wx1e8pp8Lwi5h2zwVvHBKb7KKVFjknJTQW0Wiwibl0g/0QsZKggW8gMeIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHfHq3/KKkkd+d3X6HYUx+cGwFEgtRh115zPLMszIB2vkx2U8s
	M0E8ypA83W6Sq0AjFFa5b7Jsy/DKchJ1PtoK/hAk6Tg/IhX+V7Yr8AQ+
X-Gm-Gg: AY/fxX4nD272f0octWATDcnBF48LR/IISdbYCwjC2Byc0+7o/RyKCUElKnPeCs3ivFE
	LSADDWIvpYjt+BJnW8jP9dYnGLoGRJoya9WwRKlKCxFWoe0vOCItO1Bagk0re0bBrT6KTz/lKSk
	gmLgfCs8rQBZgqlICBtUsBH+0CEqYOmxel8AzG8slOJIAYrvd+fmvTrtegQg65HNZ1tJ8P2GI+c
	J1X2cXMb0a7Un66Sum2sqW9aKKQNdGF1YWSkKPmlMdath4fyF6j8AY/oKc73WH4oMX4OpZhzotd
	jv+vlMjLzDNtBu1D1hYjYxcNFOFYfFRqQukg4zhWheWKFjGwokWoIx10jiSyge+pZKYIu3WiWS1
	Q339a9rMyiIBIXt4T+k8DBz8MDigOXDlSn+N8uBnA6uejpYBfC79W44fBiD2Xq9V4Cxr3xNsaG9
	vlU8B5NNEwpG3xwpalK0o=
X-Google-Smtp-Source: AGHT+IFBWulMuxuU7oloQiW42dIOzblQOJkSMSYM3mkR4FEHTZuiqpMj0PdGHiwFPjZwBQ0pemM/Ww==
X-Received: by 2002:a05:600c:4f4a:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47a8f8a717dmr161923995e9.7.1765890996571;
        Tue, 16 Dec 2025 05:16:36 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6e5baasm257873965e9.13.2025.12.16.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:16:36 -0800 (PST)
Message-ID: <50bea4bef338490cae92f61a8cc9a555db4529c2.camel@gmail.com>
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Date: Tue, 16 Dec 2025 13:17:17 +0000
In-Reply-To: <ca659699-e5f8-436f-bfdb-d0d250d34fca@roeck-us.net>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
	 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
	 <c9cb3a2b-da6b-42a6-87b0-7a2b780f5ad8@roeck-us.net>
	 <56a6c6a1b800090522a61eea5141aa8c986faea1.camel@gmail.com>
	 <ca659699-e5f8-436f-bfdb-d0d250d34fca@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-12 at 09:07 -0800, Guenter Roeck wrote:
> On 12/12/25 08:50, Nuno S=C3=A1 wrote:
> > On Thu, 2025-12-11 at 09:56 -0800, Guenter Roeck wrote:
> > > On 12/4/25 08:15, Nuno S=C3=A1 via B4 Relay wrote:
> > > > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > >=20
> > > > Support the LTC4283 How Swap Controller. The device features progra=
mmable
> > > > current limit with foldback and independently adjustable inrush cur=
rent to
> > > > optimize the MOSFET safe operating area (SOA). The SOA timer limits=
 MOSFET
> > > > temperature rise for reliable protection against overstresses.
> > > >=20
> > > > An I2C interface and onboard ADC allow monitoring of board current,
> > > > voltage, power, energy, and fault status.
> > > >=20
> > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > ---
> > > ...
> > > > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > > > new file mode 100644
> > > > index 000000000000..d79432678b84
> > > > --- /dev/null
> > > > +++ b/drivers/hwmon/ltc4283.c
> > > ...
> > > > +
> > > > +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *s=
t,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> > > > +{
> > > > +	__be16 in;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D regmap_bulk_read(st->map, reg, &in, sizeof(in));
> > >=20
> > > I had a look into the regmap code. In its current implementation,
> > > that will work as long as
> > > 1) regmap is configured to not cache anything
> > > 2) the I2C controller supports I2C_FUNC_SMBUS_I2C_BLOCK
> > >=20
> >=20
> > Possibly dumb question... what would be the issue about doing multiple
> > regmap reads if we can't do the bulk?=C2=A0That would be my naive appro=
ach in
> > the driver if I'm not going to use the bulk API.
> >=20
>=20
> You mean on the same address ? I don't have the chip to check, but I am q=
uite
> sure that it would return the 1st byte again.
>=20
> FWIW, in the lm92 driver I used a regmap_bus to solve pretty much the sam=
e
> problem.
>=20
>=20

Ok, I know understand the issue. We do have real word registers (though the=
 energy
spans 6 registers IIRC) in which case the regmap bulk fallback would fail. =
So I do
agree with you that relying on regmap implementation details is questionabl=
e so
I'll add my own bus.

But the above made me start thinking about how we should handle
i2c_check_functionality()? For this device, I2C_FUNC_SMBUS_WORD_DATA and
I2C_FUNC_SMBUS_BYTE_DATA (can we have word without byte??) are the minimum =
the
controller needs to support. So I could add the below:

if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
				    | I2C_FUNC_SMBUS_WORD_DATA))
		return -ENODEV;

But can't we have I2C_FUNC_I2C (or even I2C_FUNC_SMBUS_I2C_BLOCK) without
supporting SMBUS?

I mean, I can so something similar to what's being done in regmap-i2c but m=
aybe
that's too much? I'm leaning in that direction though...


This made me wonder, again, about ltc4282 but in there word registers are i=
n
fact reg and reg + 1.

- Nuno S=C3=A1
