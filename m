Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27523AB98
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Dec 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765558202; cv=none; b=kUBuWYaeB8Xka5nAo0m8hZRTDYq2LtxfY5vc7UHw1xHfEm3lvC/MNTSEecpGjBuHwsDQvTlo0+0ZVlVLZnf4QfsAVNWTbUpOukxTyWpnDe1Ci11bUJqL6OIzcTQ7GEFUfiRohRu5Xr4Mn/3u80eoE6972JKep5RR09EyQSTvxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765558202; c=relaxed/simple;
	bh=UfTqUYVlH6JJezxE02WMaTDMov6J1EqwxG6wSFYCvwQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SxIrpU/EvA1wsTZIgBks8/6YA+TL0R+cjxc2aMP7Qv5Qy/r7cSoBQnxmZhc+aXWUD32KztZp7uDapF6PweGTHWJu2MXsD62pftZgrj5z1aS4lv4z8b2eSwm6z8tRpl6jXyx1VaVCe44V70AVte5M5eW/LOssA7qm3NFBEj42gtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzn2AuVY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzn2AuVY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso6960525e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Dec 2025 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765558198; x=1766162998; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PZPqbz7TOBgko/Hla8XUW3S+0lBGp/7OqAvJDlub6lU=;
        b=lzn2AuVY26gwdImNQfRlIKlo2ZJRSDSf+KinFLyyWmuRm1jV8ujEDboElOm4Od9F6c
         0CcVlL+FQYOFQIxomfwTNDvsZIgtvjnhDNl7NlrDumdVdLUIsuIiAIpNLzgJcYenx2uR
         iWomIpjcFEI8AYRic1Tb7hq9vjkRKEkiMpcCdUc9DCXm7mw4HNJVh/Yu/zwVpfcTQdXU
         so0Qww8IKbekpHgtXPUOwGkSyOJqDvLS2oUQOs3jNRrKaNjv7dGsGo5SMbMV5dlXqOcc
         KBr9J9cKEIa5MyVbQzk3AUtbu9tZIwzqol8o7YQaGt9Iv5pLgbhYIR+aW8ZGNaCo03nR
         dMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765558198; x=1766162998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZPqbz7TOBgko/Hla8XUW3S+0lBGp/7OqAvJDlub6lU=;
        b=e9AHnxMBw/86cMCUGXpvq8L7TYm29bvC+gV9YWAAgV/3SndG3ZLusSKuxN+0xZIG1d
         JndqbL0qJZduuHoRCfMr2ztop5C0vPp1r5XqGHAjvlXjoS8LCBNJPgHVXwgdoQ1r+DVs
         4+oGZSJFczPFXCfuD5RpSdFqGIcMdziQhgj2Vnpn3tLE8pwi57LBmT1hA5DPd+/Cqyyv
         2EDTLwhNrWeajtJW0pN2jF2UMB5lU47c97tzqtWdlQrStqMAu0kCyN5+KzoeFT9haDXK
         wgrMj12yUcjp+IZezOk5aY/MbY4kay5w0KM0j1oszXjwWcQMCdvN/rA/aT5XBcapFHcZ
         I2XA==
X-Forwarded-Encrypted: i=1; AJvYcCUJmT3Oxj2yWLGhe48cWKemOdMBf3kRQlQ3mjJwk9NT+NFL5xpCyilSBmb9cLaVrf13F/wzvLbVQC5wzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRfPt/DubhM5pTKIlcdYOC28DTJ5RC4gK1XiM6EdslbK9CggT
	olU2r1rR1/kaSxPEx0kwqzL1/l9QEJDvnHNoKYj4YnG7CxJRF7+V+CJZgirs0b0c7W0=
X-Gm-Gg: AY/fxX58g57tmH5mNxCVYsIUyld8tUnxVVeS2txhQqD5QHM6K1S79WO6qZdrxowHrLZ
	tpsINKC7QJ3cLRRnGS/0fJF43YG7siYO3tiG393r17BR4HNJttnJ1qdwm5eaPl6w/s2/xtdhlIZ
	CCj8qFaqY/1sfdGtq2gFrDDkoE+1CQRWP7RcLDFHdBJoWViA06KSJDuceFYdd/TPpqiEy5uLU+c
	ko2HIfvsljMVqXYmtMXUh6x9vj9joTlx94Ntnmb9PLn+GA7BGxCqEWOnBJPrJrjK3P90Xt6zjxU
	c1G8G1dE4cPC9PsKxktEQrs9ckATqBV2eWNUYgwD34gPP3KlHaefQtZ/vNqJsr39Mha82GMduoP
	AF7EvdJPfWCtDt3DRUKsJMauVyorsbYTif9qfYfcIqtUYGvxY+/iM3QEnKNmevEZZkh/7tBXL/N
	VAZViHD/ZoNBdsq2EGdVQ=
X-Google-Smtp-Source: AGHT+IHtZMgglKAk4R8+0M+7aDLFMijPt5gozxzmISoQwpRsEMx37DIzleuM9f/I4lIUnptB6FxMbg==
X-Received: by 2002:a05:600c:4f84:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-47a8f8a7f7amr31251535e9.6.1765558197375;
        Fri, 12 Dec 2025 08:49:57 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6f3a46sm42566015e9.15.2025.12.12.08.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 08:49:57 -0800 (PST)
Message-ID: <56a6c6a1b800090522a61eea5141aa8c986faea1.camel@gmail.com>
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
Date: Fri, 12 Dec 2025 16:50:37 +0000
In-Reply-To: <c9cb3a2b-da6b-42a6-87b0-7a2b780f5ad8@roeck-us.net>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
	 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
	 <c9cb3a2b-da6b-42a6-87b0-7a2b780f5ad8@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-12-11 at 09:56 -0800, Guenter Roeck wrote:
> On 12/4/25 08:15, Nuno S=C3=A1 via B4 Relay wrote:
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > Support the LTC4283 How Swap Controller. The device features programmab=
le
> > current limit with foldback and independently adjustable inrush current=
 to
> > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOS=
FET
> > temperature rise for reliable protection against overstresses.
> >=20
> > An I2C interface and onboard ADC allow monitoring of board current,
> > voltage, power, energy, and fault status.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
> ...
> > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > new file mode 100644
> > index 000000000000..d79432678b84
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4283.c
> ...
> > +
> > +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> > +{
> > +	__be16 in;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, reg, &in, sizeof(in));
>=20
> I had a look into the regmap code. In its current implementation,
> that will work as long as
> 1) regmap is configured to not cache anything
> 2) the I2C controller supports I2C_FUNC_SMBUS_I2C_BLOCK
>=20

Possibly dumb question... what would be the issue about doing multiple
regmap reads if we can't do the bulk?=C2=A0That would be my naive approach =
in
the driver if I'm not going to use the bulk API.

- Nuno S=C3=A1
