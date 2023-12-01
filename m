Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILR7TR3X"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F7B6;
	Fri,  1 Dec 2023 07:24:38 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b4d9e81deso21598065e9.0;
        Fri, 01 Dec 2023 07:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701444277; x=1702049077; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kUVggj7H05+jc8KV6s86Fymv9Fiq8TZ5cXBdF9FzLWo=;
        b=ILR7TR3XiPuJMnaoaVcGy3GtvUKfqCETyLKkEG70/TIkgj/yb0wK/m5/WAT4zFGAXK
         MhDXdsX0NQd0YC8i2mg8Ri9d2q7DOrAWH0qNdA/AGjgDc3zwebGfKgJPUaCEhxnvwSg0
         FH32MyojsvnDpq60NQ8IWfeq+cUP4Kt4h0qUlxwkZlv+Lwey2T4ZkaweqWemNqmPPRuJ
         QL/jRn+qcYlhP0zXw4a7H77O71cqjKjoaIGVlsufEgFHdxlCgAD6RkEXhzYXZj1XPmkt
         CxcwIizm4Tr4sU8tJJ57e+/g30EcIBZPzORYKnp9L5Rmb95SgfuOH8BSGt4rBUvG7ZUH
         6/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701444277; x=1702049077;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUVggj7H05+jc8KV6s86Fymv9Fiq8TZ5cXBdF9FzLWo=;
        b=CdlBcTiKfz82pFyPRMpSwc4Xd/LUMFqJf3bp4coi8uXzxS9+LJqmcq6rJFrSjRi5Aa
         l/tbVxIrXjsLtMfeeUrdjNTW74M3crZFKOwzQ2iZM0kVU8MX+ri6EovCjWSfm9qC4mdu
         afHQOJkzoe2To7yaFcc+lNNuuFj+56xoUzXZ3B4vWpvaVANy5Gzb3TG/0lui2l9STq/T
         /NQ/DqiqB15QUF8Q4y6q7cT6f3f4lFgqVp5ZWs5CzUB8NLK4NO88Zvr+2InlzxyrDrwd
         /FIeFfo8r9+Rzk6jVj14Xdzd9Ehm/9sQPw/MVQOSrUeHuTYa1nSnCzZfgS/9l6g+nuK8
         bYAw==
X-Gm-Message-State: AOJu0YxaGz1leqKWLsYjVJKapzDvMutEwqDHwVXgtP8chrpakay8yHHP
	xy6jemlQUaz25TLhZTXlaPkUnifmwgDFfDF0
X-Google-Smtp-Source: AGHT+IEplOaTQtqhczQb1eabTMF5zobNELu9zQKblW4Avk6rbJ9kS0zpLL1gPinKGHMVX1Vrpp7Q7A==
X-Received: by 2002:a05:600c:16d3:b0:408:fe93:a2f7 with SMTP id l19-20020a05600c16d300b00408fe93a2f7mr434619wmn.37.1701444276733;
        Fri, 01 Dec 2023 07:24:36 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id fm24-20020a05600c0c1800b0040b3e26872dsm9680717wmb.8.2023.12.01.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:24:36 -0800 (PST)
Message-ID: <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 01 Dec 2023 16:24:35 +0100
In-Reply-To: <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
	 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
	 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
	 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
	 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
	 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
	 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:
> On Fri, Dec 1, 2023 at 1:34=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
> > On Thu, 2023-11-30 at 21:15 +0100, Linus Walleij wrote:
>=20
> > I did not used libgpiod but I did tested it with gpio-sysfs. Well, I co=
uld
> > effectively see the pull down behaviour but since my eval board has no =
pull-ups I
> > could not drive the line high.
>=20
> libgpiod has the upside of offering you to set the pull down and open
> drain behaviour from userspace.
>=20

Yeah, I can also just come up with a minimal test driver and devicetree.

> > > The gpiolib framework assumes we can do open drain emulation by
> > > setting lines as input. It is used as fallback unless the hardware ha=
s
> > > an explicit open drain setting.
> >=20
> > Yeah, I did look at that after you pointed that out. There's just somet=
hing I'm
> > still
> > not getting. This HW has no explicit open drain setting because open dr=
ain is all
> > that it is. So, I guess we could just specify the flag in devicetree so=
 gpiolib
> > could
> > use the emulation
> > but I wonder how would we have things in case we have the HW setup
> > to drive the pin high (so having this as GPOs)?
>=20
> If another device tree node uses:
>=20
> foo-gpios =3D <&gpio0 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>=20
> The result will be that gpiolib will emulate open drain.
>=20
> From userspace libgpiod can do the same request.
>=20
> > > > Also got me thinking if a gpi vs gpo devicetree property would make=
 sense.
> > > > But I
> > > > would likely leave it more generic/relaxed for now (even though I t=
hink you
> > > > would
> > > > need to be creative and actually use more HW to have the possibilit=
y of using
> > > > these
> > > > pins as GPIs and GPOs at the same time).
> > >=20
> > > We don't define that in the device tree currently, we just make the d=
river
> > > not support output on input-only pins and vice versa, by returning er=
ror
> > > codes on the .set_direction() callbacks.
> >=20
> > I see, but in this case, the pins could be outputs depending on the HW =
setup but
> > there's no way for us to know that in the driver.
>=20
> We just specify the line in the device tree, and we just use it as
> intended in the
> driver, if it is present, whether that is as input or output.
>=20
> We do not try to over-protect users from misusing GPIO lines that have ju=
st
> one possible (electronic defined) mode. It would be over-engineering IMO.
>=20

Fair enough...

> > And given the fact that (I think)
> > it's highly unlikely for pins like this to ever be GPIs and GPOs at the=
 same
> > time, I
> > brought the devicetree property to define input and output only. So, ro=
ughly,
> > what I
> > have in mind now for the chip is;
> >=20
> > .set_config() -> with PULL_DOWN and HIGH_IMPEDANCE support
> > .direction_input() -> This is important for gpio1 where we do have an h=
w setting
> > to
> > set the direction. On the other pins I was thinking in just forcing hig=
h-z. Or
> > maybe
> > can I just rely on gpio_set_bias()?
>=20
> No just write some default set-up into the registers, that's fine.
> Or leave the power-on defaults.
>=20
> > .direction_ouput() -> Would only matter for gpio1
>=20
> The just return an error code for any other GPIO where this is called.
>=20
> > .get/set_value() -> And in this case we just assume that high value mig=
ht or
> > might
> > not be possible (depending on the hw setup). Note that reading the pin =
state is
> > always possible.
>=20
> If a pins .direction_output() fails, .set_value() will not be called
> on it either.

This is where I lost you :(. So, I'm might be overcomplicating things but..=
. Again,
the case where someone wired up HW so that we can actually use the pin to d=
rive the
line high (having an external pull up). In that case, If I return error, th=
en I won't
be able to effectively set the line high (as you said, set_value will not b=
e called
on it either).

Now, I do understand that if we have the line flagged as GPIO_OPEN_DRAIN, t=
hen
gpiolib will switch the line to input which means we will set the line in h=
igh-z
which means that if we have a pull up, then the line will be high. I mean, =
it works
but it would be strange if someone wants to have the line as output high an=
d after
trying to set the it high, it sees the pin moving to input.=C2=A0But if thi=
s is how it
should be, fine by me.

I do understand this is the definition of open drain so I guess someone sho=
uld know
what to expect when operating with pins like this.

>=20
> > This means that I assume we can have both directions but that is not re=
ally case
> > and
> > one needs to know what it is doing :). Or in cases like this, we just i=
gnore the
> > possibility of having GPO's and we let gpiolib do the emulation?
> >=20
> > Sounds reasonable or not really how I should handle this open-drain onl=
y pins?
>=20
> Open drain-only pins would be pins that can be set to electric LOW (groun=
ded)
> or High-Z. Is this what we have?
>=20

Yes, that is the only thing we have. Meaning that there is no hw setting to=
 set the
pins to open drain. Open drain is what they are. That is why I'm not seeing=
 the point
in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.

Anyways, I'll try to have something cooked next week. I'll be slow since th=
e winter
(not even there yet) in Germany already got me!


- Nuno S=C3=A1
