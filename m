Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e26qgxaZ"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860D910E2;
	Thu, 30 Nov 2023 07:20:16 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b472f98b1so8847355e9.3;
        Thu, 30 Nov 2023 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701357615; x=1701962415; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dylAbfVwWrPST5LX+rEqHAryAoBScVn+W4WcHE2nEOI=;
        b=e26qgxaZQUw751NfhOtt2Cu+BCrQDrZRYA+SFoWKihDg4n8FiCmuQia4rC9ur0BCfk
         FfQ8rXxNnxguzwSZGBOyp3wb5zlh6aaljjXBSCp76TIyLBBWSJVD+/sZaew6u6DfsSML
         a8bNneSUHrP6XmLSo6IeT82AHdvdYfVShdxzr9qHmTu6K4a6eh0oAsr+ifYEtR4/Y9IA
         2IqEJSVSa0K9rR+tPtSeMjDrJ7htq2ibNWm27ky4WFuoChJcwqfPwSh7kPPrkGvyzoDd
         QBT/jo+/GOF+7f92PKD1DY+jUlIkS4BwAFnKyYr+nhSxW1CkFlAP+aswnpSoBbCL3AGd
         I5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357615; x=1701962415;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dylAbfVwWrPST5LX+rEqHAryAoBScVn+W4WcHE2nEOI=;
        b=RpToGzawPTJ+xPF40fnKp3owl2pepu8Lw+6ghCKjPwBS5p3UO4+aOgmJQLMO24knB4
         LZNTXPCNQr8mw/40hmfczUxtwt31wlvjr6RdBiPGgjS+Es3uMrLOF5W+e2bi7OEjCp3W
         6E2CE2mPa3lov/TCGMgPkhsJsmzJQ7x8i+ZuKZxOacXWx0TM/G0qUmv4z5yN7HnWExzK
         Ee7yxV0DGl3msj4Ph/YPRu8k3RwnVdHWfJDOntfMY/JCvAO7YonO1FIleg4XLshfW2au
         psndsy+IkJHjcCVzGWTvPmUkuTl5ZtCrOu2FFceghB/PZUzDtaM6uCasx0QvG42hzpJU
         nZ9w==
X-Gm-Message-State: AOJu0YyjbMS0FVhiaIwGO1nWD+U9IQmxcUQfFQ2idQq/IvwpNzxab7Rz
	SQtyiGMsN2gzX1bZsGCP3Ok=
X-Google-Smtp-Source: AGHT+IHaU+1NLBkGRIORteHD1wkr7Lf2zALQw4P5g1GtV9KJP/jQi+BhEliYHWpBOtLQe2de1htcFw==
X-Received: by 2002:a05:6000:401f:b0:332:eee9:6e7f with SMTP id cp31-20020a056000401f00b00332eee96e7fmr13332710wrb.56.1701357614546;
        Thu, 30 Nov 2023 07:20:14 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id dd16-20020a0560001e9000b00332cc24a59bsm1760782wrb.109.2023.11.30.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:13 -0800 (PST)
Message-ID: <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 16:20:13 +0100
In-Reply-To: <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
	 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
	 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2023-11-30 at 15:36 +0200, Andy Shevchenko wrote:
> On Thu, Nov 30, 2023 at 11:20:32AM +0100, Nuno S=C3=A1 wrote:
> > On Wed, 2023-11-29 at 21:55 +0100, Linus Walleij wrote:
> > > On Wed, Nov 29, 2023 at 5:08=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gma=
il.com> wrote:
> > >=20
> > > > Cool, I actually thought that having the direction + get/set stuff =
would be
> > > > weird
> > > > given the fact that we can only PULL_LOW or HIGH_Z the pins.
> > >=20
> > > There are several drivers in the kernel that implement .set_config(),
> > > it's existing and should be enabled if it has uses.
> >=20
> > Yeah, it might make sense to support it specially for the input case. A=
FAICT, if
> > I
> > use the .set_config() (but from a quick look I think we will need to ad=
d support
> > for
> > it in gpiolib for the high-z configuration), then I can't use the gpio_=
regmap
> > stuff.
> > As the driver stands I don't think I could do it anyways because settin=
g gpio2-3
> > and
> > alert requires to write 0 on the register rather than 1. But again, I'm=
 still
> > very
> > suspicious about the whole thing. The datasheet states:
> >=20
> > "GPIO1-GPIO3 and ALERT all have comparators monitoring
> > the voltage on these pins with a threshold of 1.28V even when
> > the pins are configured as outputs."
> >=20
> > But we can't really set the direction for gpio2-3 and the alert pins (o=
nly
> > getting
> > the level and setting it as PULL_LOW or HIGH_Z. gpio1 is the only one w=
here we
> > can
> > configure it as input or open drain ouput. Bah, I'll try to see if some=
one
> > internally
> > can shed some light on this.
>=20
> I have better proposal. If these GPIOs are not needed for the main
> functionality of the hardware, can we just left it out for now and implem=
ent
> later if required?
>=20

Well, I did spent some time on the gpio thing so I would like to have it in=
 but yeah,
no hard feelings if it does not go in.

So, I actually talk with some hw guys and the pull_low is not really like a=
 pull_low
resistor. These pins are effectively an open drain. Which means, setting th=
em as
input means setting them in high-z (turning off the mosffet) - and I do hav=
e a bug in
my code regarding this - Or if you want them as outputs you can set the lev=
el low
(and it will always be low - just turn on the mosffet) or you can also set =
high-z
which means it will be either low or high depending on your external circui=
try. The
point is, you can still have your pin acting as a normal gpo if you accommo=
date your
circuitry for it (can also use these pins for things like buses).

Also got me thinking if a gpi vs gpo devicetree property would make sense. =
But I
would likely leave it more generic/relaxed for now (even though I think you=
 would
need to be creative and actually use more HW to have the possibility of usi=
ng these
pins as GPIs and GPOs at the same time).

- Nuno S=C3=A1
