Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2NThVV+"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D8410E2
	for <linux-hwmon@vger.kernel.org>; Fri,  1 Dec 2023 05:40:52 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d3eb2d465cso9552647b3.3
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Dec 2023 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438052; x=1702042852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmzD/Pwnj4/GW+eUeoARZQwXmIhab44iqPTcsYVxQKE=;
        b=w2NThVV+NK/5VkAgg+rbds5EnG9RKAcngCI3bolCmc2vadUlu7HdLRXLA5PDL8mMZE
         oR3m4v6Q/+xXndfRI4zrPu1VVuYum1rZaWqKgHUSz+CQuluKNoGx1oezAXg6w+bsm1h2
         v6sVyITClTJFskCFC7nkCop5BM5dxp/ULnAgaV3va+UsTXlGUp8qnOQrxW+l3s+pzp4h
         lY3vFt3nTGuJ6WdUGDGv93p0/gFYajGa9QMV4HIoiBVK/fBXxXLonfg9/4Iz84fh3FBn
         spjf7DodlxVSEXBU6YIRlOV0e9zPe7xDmGIZn+yv8z2wkY7v7VFk93KeeVMubxPp5CpU
         RddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438052; x=1702042852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmzD/Pwnj4/GW+eUeoARZQwXmIhab44iqPTcsYVxQKE=;
        b=Zrnq2EU7Kk3gST1r5gu1bU6VkQdrztC8N03ZBpu7vbV7rirnKNEE+YFsYYW6dWOW5m
         fhoIycrMWmPHzICeXVW/YcCE8REg/YhXe+oQeOlIjMdXoA61TZ+nicn2oc72XeYwA2Ws
         g1BClXGUf9kBHxQxGAlcUfGnc6nhUMFIpQkDJpeSDd6+ZHf2SG8HLZ3oMvVqTJUBqbqg
         76SnTjRfgNOsoZKRkc2wu5iXxVOdCK4x0ff4OD0DcU+goZt2uVZgDGyBpCTF7PqVjWRH
         DOt+JeQ3hAqpNwkyqu+8DusECZdM5evo4l6m+9F1xZnrJEIcUgQBJPdWH5KCI2GAwmDB
         8jWw==
X-Gm-Message-State: AOJu0YyEhsngLtPNopeGVj1jRG2zlLWfFaBfMuIJUSe9hViIfqHnFaio
	TAEW4Po1FpOqGVXsDenzmJVvNDdv6JYLdWWYgcOBmA==
X-Google-Smtp-Source: AGHT+IHXo+ZspGO/+lcMWMYum6v8pXufI+NXWF3lLZalGuzPJDUc8Zv1kLb0t1FNv4AxtO7QzbUvP7DfFHh5xkyJ/3E=
X-Received: by 2002:a81:4322:0:b0:5d1:d1de:e8eb with SMTP id
 q34-20020a814322000000b005d1d1dee8ebmr11585906ywa.18.1701438052021; Fri, 01
 Dec 2023 05:40:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com> <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com> <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com> <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
In-Reply-To: <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Dec 2023 14:40:39 +0100
Message-ID: <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 1:34=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com>=
 wrote:
> On Thu, 2023-11-30 at 21:15 +0100, Linus Walleij wrote:

> I did not used libgpiod but I did tested it with gpio-sysfs. Well, I coul=
d
> effectively see the pull down behaviour but since my eval board has no pu=
ll-ups I
> could not drive the line high.

libgpiod has the upside of offering you to set the pull down and open
drain behaviour from userspace.

> > The gpiolib framework assumes we can do open drain emulation by
> > setting lines as input. It is used as fallback unless the hardware has
> > an explicit open drain setting.
>
> Yeah, I did look at that after you pointed that out. There's just somethi=
ng I'm still
> not getting. This HW has no explicit open drain setting because open drai=
n is all
> that it is. So, I guess we could just specify the flag in devicetree so g=
piolib could
> use the emulation
> but I wonder how would we have things in case we have the HW setup
> to drive the pin high (so having this as GPOs)?

If another device tree node uses:

foo-gpios =3D <&gpio0 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

The result will be that gpiolib will emulate open drain.

From userspace libgpiod can do the same request.

> > > Also got me thinking if a gpi vs gpo devicetree property would make s=
ense. But I
> > > would likely leave it more generic/relaxed for now (even though I thi=
nk you would
> > > need to be creative and actually use more HW to have the possibility =
of using
> > > these
> > > pins as GPIs and GPOs at the same time).
> >
> > We don't define that in the device tree currently, we just make the dri=
ver
> > not support output on input-only pins and vice versa, by returning erro=
r
> > codes on the .set_direction() callbacks.
>
> I see, but in this case, the pins could be outputs depending on the HW se=
tup but
> there's no way for us to know that in the driver.

We just specify the line in the device tree, and we just use it as
intended in the
driver, if it is present, whether that is as input or output.

We do not try to over-protect users from misusing GPIO lines that have just
one possible (electronic defined) mode. It would be over-engineering IMO.

> And given the fact that (I think)
> it's highly unlikely for pins like this to ever be GPIs and GPOs at the s=
ame time, I
> brought the devicetree property to define input and output only. So, roug=
hly, what I
> have in mind now for the chip is;
>
> .set_config() -> with PULL_DOWN and HIGH_IMPEDANCE support
> .direction_input() -> This is important for gpio1 where we do have an hw =
setting to
> set the direction. On the other pins I was thinking in just forcing high-=
z. Or maybe
> can I just rely on gpio_set_bias()?

No just write some default set-up into the registers, that's fine.
Or leave the power-on defaults.

> .direction_ouput() -> Would only matter for gpio1

The just return an error code for any other GPIO where this is called.

> .get/set_value() -> And in this case we just assume that high value might=
 or might
> not be possible (depending on the hw setup). Note that reading the pin st=
ate is
> always possible.

If a pins .direction_output() fails, .set_value() will not be called
on it either.

> This means that I assume we can have both directions but that is not real=
ly case and
> one needs to know what it is doing :). Or in cases like this, we just ign=
ore the
> possibility of having GPO's and we let gpiolib do the emulation?
>
> Sounds reasonable or not really how I should handle this open-drain only =
pins?

Open drain-only pins would be pins that can be set to electric LOW (grounde=
d)
or High-Z. Is this what we have?

That's indeed a bit of an oddity...

If you implement .set_config and handle PIN_CONFIG_DRIVE_OPEN_DRAIN
for these lines then I think gpiolib will do the right thing for you.

Yours,
Linus Walleij
