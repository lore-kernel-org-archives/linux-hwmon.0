Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39B291F;
	Tue, 14 Nov 2023 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H62js26N"
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF2D1A5;
	Tue, 14 Nov 2023 00:33:12 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9e623356e59so569366566b.0;
        Tue, 14 Nov 2023 00:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699950791; x=1700555591; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YKuTpCPN16vLxqtxNUoO64nlEyO6OP4oo4zEgiC+VFo=;
        b=H62js26NeVAoKg/n0v9GTffUyJgNu896aMz8x1OoQpgWh6+LCfhbNwO/zKGxhiL3eQ
         g5Wt9yUDLwPLt1Q3mgpO1AiCO3Fz8xzZ3o5oY+c5VCPCwsQsbjpWwMwWgB8/uld9UOjx
         BpLhe6i9ZfjoRodvegfymsqb0KRrcWvL8fZeFY0fJre43HNQ4dsyzc7v/xCDv89L3HRt
         7z1/pB9Ll1RFYNg/mL/TeVkMWNbyNTEVFLanVFCFbJq3tyPXacXXRvxWake8NCjssL1S
         SnanwEyjtGhqtUfvCWDaVAfpGG6IZRMF1ysnUQEyZggcYcMq7iFrEaZ14bf1Xs3CPRUU
         Hgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699950791; x=1700555591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKuTpCPN16vLxqtxNUoO64nlEyO6OP4oo4zEgiC+VFo=;
        b=c0Q+sgcn5AXSSsPzAdwl/GsUuUAuWYuF+xgnvp1fkHKIFlXK2MsQFd8tRiovpCxzsI
         0rY5FRpOrhPzNzsYPDRuq+49nCNLEy5GDzjSNxwDsWZpIQ1lHuXmU+K7Ss77CwWHX4KC
         W5OoZBNJ2yr3o4uL+SVVvPFzvdRvY4j1xS9zfx66BRa1YbR5LcWUxjHF1b6eeOEn94Y5
         AOoumryjaxIuzv/5WLjRphId+qEKgddUWtSV+qErXM17+N3dGEAE5sJWRk/aZajI1p/q
         Z9ojI+pzgTXl4lXKRboi4e+gfpoa0P7E2vTmRrd4qFWtCe8ggPnB8fS6uoaYnaZZ+Bkr
         gNXg==
X-Gm-Message-State: AOJu0Yz/zPrVCod4HAzPHCerR7voAdjXseKAbRDJsvya4etZz/ruuWpU
	LjGL5e7kp/1xlBNfLneLCzasQ7HQWnyecXiT2oY=
X-Google-Smtp-Source: AGHT+IEB9op4P/sigur1MvKvXtbr8TVcL/3UGnaMQfq+6vpzHk5HudqjhagJMT47mz52OydRN0ypiA==
X-Received: by 2002:a17:906:7185:b0:9e3:85c9:11dc with SMTP id h5-20020a170906718500b009e385c911dcmr6132334ejk.32.1699950790794;
        Tue, 14 Nov 2023 00:33:10 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:361b:8f29:1cbf:5e69? (p200300f6ef1b2000361b8f291cbf5e69.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:361b:8f29:1cbf:5e69])
        by smtp.gmail.com with ESMTPSA id pj19-20020a170906d79300b0099ce025f8ccsm5176315ejb.186.2023.11.14.00.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 00:33:10 -0800 (PST)
Message-ID: <fc3304423a57ca8acb40ecf8d2fb641aa280a8c1.camel@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Guenter Roeck <linux@roeck-us.net>, Rob
 Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,  Conor
 Dooley <conor+dt@kernel.org>
Date: Tue, 14 Nov 2023 09:36:07 +0100
In-Reply-To: <ZVJPbV2469kjqbHu@smile.fi.intel.com>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
	 <20231110151905.1659873-3-nuno.sa@analog.com>
	 <ZU5fYY81L_qSmQWq@smile.fi.intel.com>
	 <581aec9c6313e3885aae8b1e12dfcc9f392716db.camel@gmail.com>
	 <ZVJPbV2469kjqbHu@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-11-13 at 18:31 +0200, Andy Shevchenko wrote:
> On Mon, Nov 13, 2023 at 11:13:44AM +0100, Nuno S=C3=A1 wrote:
> > On Fri, 2023-11-10 at 18:50 +0200, Andy Shevchenko wrote:
> > > On Fri, Nov 10, 2023 at 04:18:46PM +0100, Nuno Sa wrote:
>=20
> ...
>=20
> > > > +/*
> > > > + * relaxed version of FIELD_PREP() to be used when mask is not a
> > > > compile
> > > > time constant
> > > > + * u32_encode_bits() can't also be used as the compiler needs to b=
e
> > > > able to
> > > > evaluate
> > > > + * mask at compile time.
> > > > + */
> > > > +#define LTC4282_FIELD_PREP(m, v)	(((v) << (ffs(m) - 1)) & (m))
> > >=20
> > > Can we name it accordingly as done in other places, and TBH it's a ti=
me to
> > > move
> > > it to the header. (At least I know about two more implementations of
> > > this).
> >=20
> > Not sure what you mean? Is there some other drivers doing it already? I=
'll,
> > anyways, wait on more feedback for the GPIO stuff because we might end =
up
> > not
> > needing it...
>=20
> $ git grep -n 'define field_prep'
>=20
> ...
>=20
> > > > +	/* GPIO_2,3 and the ALERT pin require setting the bit to 1 to
> > > > pull
> > > > down the line */
> > > > +	if (!gpio->active_high)
> > >=20
> > > Hmm... Why do you need a separate flag for this? Shouldn't be describ=
ed or
> > > autodetected somehow?
> >=20
> > Well, if a consumer as an active high gpio, it expects to call
> > gpiod_set_value(..., 1) and the line to assert, right? To have that, we=
 need
> > to
> > write 0 on the device register for some of the pins.
>=20
> It doesn't matter, the GPIO (not _raw) APIs are using logical levels, 1 =
=E2=80=94
> activate,
> 0 =E2=80=94 deactivate.
>=20
> > And the same story is true for active low. gpiod_set_value(..., 0) will=
 have
> > the
> > gpiolib to automatically invert the value and we get 1 in the callback.
>=20
> Yes, but why do you have that flag in the structure?

Because one of the pins (GPIO_1) has the opposite behavior...

>=20
> > > > +		val =3D !val;
>=20
> ...
>=20
> > > > +	*val =3D DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs,
> > > > U16_MAX);
> > >=20
> > > I'm wondering if you can do some trick to "divide" actually to 2^16 s=
o, it
> > > will
> > > not use division op at all?
> >=20
> > Hmm, not sure if it will be obvious but you mean something like:
> >=20
> > *val =3D (be16_to_cpu(in) * (u64)fs) >> 16;
> >=20
> > Is this what you mean? If so, we`ll loose the "CLOSEST" handling... Not=
 so
> > sure
> > if we need to be "that" performant in such a code path. But Guenter can=
 also
> > share his opinion...
>=20
> 	*val =3D DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs + (BIT(16) -
> 1), BIT(16));
>=20
> will give the same result without division, no?
> What you need is to make sure that the multiplication won't get closer to
> U64_MAX, which seems not the case here (max 48-bit number).

Hmm, I must be missing something but you're still using DIV_ROUND_CLOSEST_U=
LL().
So, I guess you're rely on some formula optimization that removes the divis=
ion
(I'm honestly seeing it) but the result won't be exactly the same (off by 1=
).
Again, this is not a fast path (AFAIK) and this is a typical formula to get=
 a
value from an ADC so I'm not sure making any super "smart" tricks to make t=
his
run faster beats readability.

But, I'm still not seeing what you mean so I might change my mind...

>=20
> Ditto for all other similar cases which I already pointed out.
>=20
> ...
>=20
> > > > +	u64 temp =3D=C2=A0 DECA * 40ULL * st->vfs_out * 1 << 16, temp_2;
>=20
> > >=20
> > > "* BIT(16)" / "* BIT_ULL(16)" ?
> >=20
> > Well, I can just place the number as in the formula. Not too keen on th=
e
> > BIT()
> > macros as this is not really a mask.
>=20
> I'm not sure I got this. The << 16 neither a plain number and BIT() is eq=
ually

Well, I do agree with << 16 part...

> good. With power of two it's most likely that this is due to internal
> implementation of the firmware or hardware, so again BIT() can be still g=
ood
> enough to show that.
>=20

I'm still not convinced honestly... I see plain numbers to be a good fit an=
d
they match exactly with the DS. I just see things like BIT(), GENMASK, BITM=
AP
and the likes to be used on masks.

But I don't really care so unless Guenter has some opinion I can make as yo=
u
suggest...

- Nuno S=C3=A1

