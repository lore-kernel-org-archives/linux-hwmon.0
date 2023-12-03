Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPzos60p"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CF1C5
	for <linux-hwmon@vger.kernel.org>; Sun,  3 Dec 2023 15:03:37 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d3687a6574so36819847b3.2
        for <linux-hwmon@vger.kernel.org>; Sun, 03 Dec 2023 15:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701644616; x=1702249416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zelJLnC7ZqJCMPyhJLNTJFnx9+oguBrdvy9XXLywcG8=;
        b=GPzos60p1wR+TQVX1oEtPSQJYJIi40JrqbjQTpvqUq+pV74j7+lmPYuxzG6jWbPeMF
         TvMAIuWybGyTui7ZeGtOacIvTd7cW8C/j1H/2/pdaxdUz9gjXBXR5BlrTMVYWdYH/laf
         E8hDuIbENyawc7vaCbFvBjR93G6vUM+0gg6du7wk1QtVZ1H/RUiFQuYLfsPqDt63nmzj
         gk2Qb+uS9O/3RQoy99BVMvm++QFHJth3cu1IIj63hczkmThqKnnZ+/xq16TtTNg0pm95
         59Fqbbb5VpWuqNsTRu1MVqTv6vdBjpKaHJwaBYbJN4egWJMnHZnYBB12EEZT6v/6prog
         OITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701644616; x=1702249416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zelJLnC7ZqJCMPyhJLNTJFnx9+oguBrdvy9XXLywcG8=;
        b=oZo5Mk6RU03Hzbtw9uPlPVZkqISr0KjzJ8EqUs1B3yf0BvTHjwOggKRhi8qrnj3itM
         7Z9nCoA7PObLrCKRbKyN87wpT6qvB/nLr/dDF5vOh9nP/PAq5DuOmf4R4divxIQa3zKJ
         KAJShBhkHUaOAZ86f9pwyVxqs8iq5+DpJ5XBzJkmhhZtPh3w/zhnRZpy624gML7urcdL
         xfv8tAyjwmYnqgsIT70XKHtXeuAcLVdsDvtg3b/rXmObgOAS/XgNMp67Sez5Zebiro1I
         n0EBcpDlr/ZOG+7cNsj2lHPSe/vP9nengNy0CpfwvpTkbwyTklehlTJErTgVPiWukC12
         r46A==
X-Gm-Message-State: AOJu0Yxw9SVCZRhGVTN11bDnULstWrCz9akwpWuz24hV5gWkTsFMOt1g
	UqrNWQ0FHe6zPnJk0ox9kxPI+8Frd6hthPDjk7QUTEUwudWqa0FgYTA=
X-Google-Smtp-Source: AGHT+IFdxlA+4qAP1WmnqmhYuozBj+w898Qc95gW0TILxKBqTzyrlz5TWtLLbWm/9x5bymbWlpPzY28MzXA+ADc7Xwk=
X-Received: by 2002:a81:9b44:0:b0:5d7:1940:7d63 with SMTP id
 s65-20020a819b44000000b005d719407d63mr1931460ywg.58.1701644616523; Sun, 03
 Dec 2023 15:03:36 -0800 (PST)
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
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com> <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
In-Reply-To: <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 00:03:23 +0100
Message-ID: <CACRpkdYBXVt7KvWfPJj1OhPUB7-QJbKg+74zwnR_=0pszg9APA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 4:24=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.com>=
 wrote:

> > If a pins .direction_output() fails, .set_value() will not be called
> > on it either.
>
> This is where I lost you :(

devm_gpiod_get() (and similar interfaces) will set up the default mode for
the line, as input or output (with value, calling .direction_output) so mos=
t
likely it will fail already there, and the driver will not probe or
userspace client
will fail.

> So, I'm might be overcomplicating things but... Again,
> the case where someone wired up HW so that we can actually use the pin to=
 drive the
> line high (having an external pull up). In that case, If I return error, =
then I won't
> be able to effectively set the line high (as you said, set_value will not=
 be called
> on it either).
>
> Now, I do understand that if we have the line flagged as GPIO_OPEN_DRAIN,=
 then
> gpiolib will switch the line to input which means we will set the line in=
 high-z
> which means that if we have a pull up, then the line will be high. I mean=
, it works
> but it would be strange if someone wants to have the line as output high =
and after
> trying to set the it high, it sees the pin moving to input. But if this i=
s how it
> should be, fine by me.

What do you mean by "sees the pin moving to input".

If you mean electrically then yes, it goes to high-Z.

If you mean logically, as seen by software and GPIO and debugfs, not
really.

I think a good exercise to see how it works is to just walk through the
code in drivers/gpio/gpiolib.c for e.g.
gpiod_set_value()
gpiod_set_value_nocheck()
gpio_set_open_drain_value_commit()

>direction_input() is indeed called, but that is just a way of using the
hardware, logically, inside gpiolib, the line is handled as high.

> Yes, that is the only thing we have. Meaning that there is no hw setting =
to set the
> pins to open drain. Open drain is what they are. That is why I'm not seei=
ng the point
> in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.

For satisfying the logic. We have several cases where callbacks are
just returning a 0 error code for such corner cases, and as Andy points
out push-pull requests should return an error.

Yours,
Linus Walleij
