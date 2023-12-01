Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V88bd3f9"
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8A193;
	Fri,  1 Dec 2023 04:34:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bc57d81f4so2984512e87.2;
        Fri, 01 Dec 2023 04:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701434077; x=1702038877; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HqjPi2c26FO8riCIkRZo+6kjvVvVd5rH9WoCN/QR8E0=;
        b=V88bd3f9nqNOB/B05ll297P8FESOmkLPvUrcM2GDJgOV6Q2oz85dAy051XpkrBBrZp
         ZwoEEKLzL7HPFNzT/MrehKinz9oygFafX2TWmzfEb+ccRKnFX5AXru14/BTcwa0SzyM/
         XeOaoTK/i1pSFPp8ktaeVGwbl3EsRriLcV3G4fxYSU+utxblxk1yO5VXTuchJPNA8fWK
         B2UIXEgx61zEXUjT98k/a6BZqcfmy/sGoU0aPF0YYX6XLyuIWLjN6SRLDKafF+BZDSRo
         mYk/c/SnVqeiN0rPcJfiF0YdIEyETeE1PWt0jHZqKZot3Y+3hpo2RmBNK5e1m0FkuQkd
         TlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701434077; x=1702038877;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqjPi2c26FO8riCIkRZo+6kjvVvVd5rH9WoCN/QR8E0=;
        b=WKL1yZldBS3e9mhQ9cAV0DNVzy7nmKjdcLtYJIrCA7KU7yx1EmEI5hjHwK/R0E70pH
         mr45IgcyqHsxyqJlrmnMS4OyiYBbTXYRqHaJRLLuQGMajk8EqjqQqycblhYBMU5dNuak
         kLtann6X4huR2sTzz64EXLsz4fcQMkYrqIL4lkdOFiLC3F9K0dAVpjbtgspFnjl/MZDO
         ZiL3l8FXG0MgcmOMl346w9drYjGx3vhxLJIedB9xWMgfxx9Hr8uFou9ukgw7E1IyI+Zc
         Oe/9I0sYPootvpPIKsx799FKIj6dJS/BCk+5VAa1YCJIBncVkMdjfXv1HAAypc6Cq92S
         XDfw==
X-Gm-Message-State: AOJu0YwQ4HXR88IXVLQPVErdSvRDmjbsiDnmIyBCDgT8IRgdN3/ifI58
	JEneNzO5eamtwGvKL2jFo0Id6+vD8yoNri3m
X-Google-Smtp-Source: AGHT+IG+Wbfy4/7TMf7z57T535o1ZlgFV1rvK5jkxHMgF9T294gohh6DpsSmWDVNbxIPduwulxffXw==
X-Received: by 2002:ac2:515b:0:b0:50b:bcd1:306d with SMTP id q27-20020ac2515b000000b0050bbcd1306dmr510128lfd.59.1701434076699;
        Fri, 01 Dec 2023 04:34:36 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c20cb00b0040a3f9862e3sm2342723wmm.1.2023.12.01.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:34:36 -0800 (PST)
Message-ID: <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 01 Dec 2023 13:34:35 +0100
In-Reply-To: <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
	 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
	 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
	 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
	 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2023-11-30 at 21:15 +0100, Linus Walleij wrote:
> On Thu, Nov 30, 2023 at 4:20=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.c=
om> wrote:
>=20
> > Well, I did spent some time on the gpio thing so I would like to have i=
t in but
> > yeah,
> > no hard feelings if it does not go in.
>=20
> I think it's a good idea to include it, especially if you can, in the
> commit message,
> illustrate how you test it with the libgpiod toolset. If you can test it =
all the
> way such that you have real hardware connected to real electronics where
> you can observe the values on these pins or read them: even better.
>=20
> GPIOs tend to get used, and then we are prepared.
>=20

Yeah, I would also like to have this in but since I'm adding the driver to =
hwmon,
I'll leave the final word to Guenter.

I did not used libgpiod but I did tested it with gpio-sysfs. Well, I could
effectively see the pull down behaviour but since my eval board has no pull=
-ups I
could not drive the line high.

> > So, I actually talk with some hw guys and the pull_low is not really li=
ke a
> > pull_low
> > resistor.
>=20
> We usually call it pull down, so the PIN_CONFIG_BIAS_PULL_DOWN
> config property.
>=20
> This is vital to e.g. create a bit-banged I2C link, which is something I
> suspect could be useful on this hardware.
>=20
> > These pins are effectively an open drain. Which means, setting them as
> > input means setting them in high-z (turning off the mosffet) - and I do=
 have a
> > bug in
> > my code regarding this -
>=20
> The gpiolib framework assumes we can do open drain emulation by
> setting lines as input. It is used as fallback unless the hardware has
> an explicit open drain setting.

Yeah, I did look at that after you pointed that out. There's just something=
 I'm still
not getting. This HW has no explicit open drain setting because open drain =
is all
that it is. So, I guess we could just specify the flag in devicetree so gpi=
olib could
use the emulation but I wonder how would we have things in case we have the=
 HW setup
to drive the pin high (so having this as GPOs)?
>=20
> > Or if you want them as outputs you can set the level low
> > (and it will always be low - just turn on the mosffet) or you can also =
set high-z
> > which means it will be either low or high depending on your external ci=
rcuitry.
> > The
> > point is, you can still have your pin acting as a normal gpo if you acc=
ommodate
> > your
> > circuitry for it (can also use these pins for things like buses).
>=20
> Yeah that is just standard open drain behaviour, by the book.
> Also documented in
> https://docs.kernel.org/driver-api/gpio/driver.html
> under the heading "GPIO lines with open drain/source support".
>=20
> > Also got me thinking if a gpi vs gpo devicetree property would make sen=
se. But I
> > would likely leave it more generic/relaxed for now (even though I think=
 you would
> > need to be creative and actually use more HW to have the possibility of=
 using
> > these
> > pins as GPIs and GPOs at the same time).
>=20
> We don't define that in the device tree currently, we just make the drive=
r
> not support output on input-only pins and vice versa, by returning error
> codes on the .set_direction() callbacks.
>=20

I see, but in this case, the pins could be outputs depending on the HW setu=
p but
there's no way for us to know that in the driver. And given the fact that (=
I think)
it's highly unlikely for pins like this to ever be GPIs and GPOs at the sam=
e time, I
brought the devicetree property to define input and output only. So, roughl=
y, what I
have in mind now for the chip is;

.set_config() -> with PULL_DOWN and HIGH_IMPEDANCE support
.direction_input() -> This is important for gpio1 where we do have an hw se=
tting to
set the direction. On the other pins I was thinking in just forcing high-z.=
 Or maybe
can I just rely on gpio_set_bias()?
.direction_ouput() -> Would only matter for gpio1
.get/set_value() -> And in this case we just assume that high value might o=
r might
not be possible (depending on the hw setup). Note that reading the pin stat=
e is
always possible.

This means that I assume we can have both directions but that is not really=
 case and
one needs to know what it is doing :). Or in cases like this, we just ignor=
e the
possibility of having GPO's and we let gpiolib do the emulation?

Sounds reasonable or not really how I should handle this open-drain only pi=
ns?

Thanks for the help!
- Nuno S=C3=A1

