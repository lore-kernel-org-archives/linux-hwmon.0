Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoP0RXi8"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BC1129;
	Sat,  2 Dec 2023 01:42:13 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40bda47c489so5516015e9.3;
        Sat, 02 Dec 2023 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701510131; x=1702114931; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FaAu/x+A7UN/GndhHYNneN7G9/G1qwLOLVOxtI1ejMI=;
        b=PoP0RXi8BIC3TLVTQA8PqnTgbEcmmKL95Q6PXPYzIRdErccBV9pUpPCyY1PHPjHv3c
         cVUNIfkLy/Ur6eYNvJVJrBfyiAd/W617UxBFQw09wteJV8WMWIOLFpOV/hghzWXAI8V6
         jWlU2fhLXEZcMAPl9cVeM5lahzoF8Tl/MhQYepmrG73SCFX+qaO88ofbm4JaPc7gP72U
         IlpAsa2RqSUBRqfM6+ArsgQJJijb1wEFqSu0ZfZANicYOhYwevrjR1oQDW5Qx02ItG0Z
         +6dCnIKX2pbv52+NiWictwzVyoaBNXuLqFOnljkVW4GTqCzDcvV0upH8zHY3cqxItdc+
         32mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701510131; x=1702114931;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaAu/x+A7UN/GndhHYNneN7G9/G1qwLOLVOxtI1ejMI=;
        b=Dx0StZJP5tJdRe8SSQ5GMGHD2El5JjstgJzOtK5dud5ROzIH+o9wmyjKAQbbaPNTpH
         pzbssOeqWfrUm+BpFObSXvmgBSYRSThVA6NHByF+konpgzN+iad4rc35SVe/y2j/UKcB
         DvYci3uO9yj0jl3LvVGlcHar/nnuOnaNL6FmQ9f77xvcTn4AbtorlS9s+fY/VlVytptl
         9DmaaZpSbBY6UdW1TXLaeEzCYqVu3i9olxebamnZEyxHpaTJbtk4E2b1J4bNU77yG7uK
         Seu4jECGg3Lpn5iokGQg5FKXdTXHds50pr3VQcA68KgtKs4vYn1if54wJZ02wmrl6T5L
         pOgg==
X-Gm-Message-State: AOJu0YymB9qXfEqCZzE6/I9y3n6IqZ3xnMV6bVEIiQBpU1uLAICl/qSc
	GyrJcKofjlaqEJyxgJAG0tg=
X-Google-Smtp-Source: AGHT+IFEFVh21+tCuErfU35CGFAcnI22bHi4rdaaL6pM6opWmAqHhhPgK+Cxuh4iCYiFHydzsrB4sA==
X-Received: by 2002:a05:600c:3ac5:b0:402:ff8d:609b with SMTP id d5-20020a05600c3ac500b00402ff8d609bmr1028481wms.33.1701510131439;
        Sat, 02 Dec 2023 01:42:11 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b0040b481222e3sm11828195wmo.41.2023.12.02.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 01:42:11 -0800 (PST)
Message-ID: <ba123831d7956b0437158a6928ddafb4510ab62b.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 02 Dec 2023 10:42:10 +0100
In-Reply-To: <66454ca2-d5cb-4701-a237-03b3991a791f@roeck-us.net>
References: 
	<CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
	 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
	 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
	 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
	 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
	 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
	 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
	 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
	 <ZWoABzufPkdXnrMT@smile.fi.intel.com>
	 <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
	 <986fb7dc2a34602fa9c2d57a7a3e06a71cfdc0a0.camel@gmail.com>
	 <66454ca2-d5cb-4701-a237-03b3991a791f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-01 at 08:46 -0800, Guenter Roeck wrote:
> On 12/1/23 08:29, Nuno S=C3=A1 wrote:
> > On Fri, 2023-12-01 at 08:04 -0800, Guenter Roeck wrote:
> > > On 12/1/23 07:47, Andy Shevchenko wrote:
> > > > On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno S=C3=A1 wrote:
> > > > > On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:
> > > >=20
> > > > ...
> > > >=20
> > > > > Yes, that is the only thing we have. Meaning that there is no hw =
setting to
> > > > > set
> > > > > the
> > > > > pins to open drain. Open drain is what they are. That is why I'm =
not seeing
> > > > > the
> > > > > point
> > > > > in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
> > > >=20
> > > > At least you have to implement error for PUSH_PULL mode and other m=
odes,
> > > > so from the (core) software point of view the user should be able t=
o ask for
> > > > anything and get an answer from the certain driver that "hey, i do =
support
> > > > OD",
> > > > or "hey, push-pull can't be supported with this hw".
> > > >=20
> > >=20
> > > It seems to me that this is heading towards a mfd driver. I don't fee=
l
> > > comfortable
> > > with all that gpio specific code in the hwmon subsystem.
> > >=20
> > > Maybe I should request that all hwmon chips with gpio support must be
> > > implemented
> > > as mfd drivers. I'll have to think about that.
> > >=20
> > > Guenter
> > >=20
> >=20
> > Hopefully you don't ask that already for this driver...
> >=20
>=20
> Yes, I am, because the gpio part is getting way to complicated for embedd=
ing it
> into a hwmon driver.
>=20
Well, fair enough... I will then drop it for now. The priority is the hwmon=
 part as
that was the request from a customer. I'll only leave the pin functions tha=
t might be
relevant from a monitoring point of view.

Hopefully, I'll get into the gpio stuff later on. From a brief look, the au=
xiliary
bus might feet and easier than mfd.

- Nuno S=C3=A1

