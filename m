Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8V6eqrj"
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655DD101;
	Mon,  4 Dec 2023 00:53:13 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33338c67d20so1658050f8f.0;
        Mon, 04 Dec 2023 00:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701679991; x=1702284791; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a8U8FDgV2kJRNizasnA0RIYG3htVkBqbfELVizQ8fYE=;
        b=U8V6eqrjQn/cZy6N+G7NJ83cHXzs6uuzrxq7IXLrlEIr2zX0BsaMLFgoxxCdffyjkk
         NQ5QHEKy6BhsF3Mt+xK20fyCJrXMsL/hN2g/oVPx6jUbf7cB3qs6oiqTs/A7sizV+h6I
         C1wBotfoBHenwREFCAMVucTjhruDQMvGKOwdySCRc5FHNFJKpadnNzjs8Eq1zcoOIHPj
         dgIAgE1ZeCDDUunxHpYP5yWfo6wDaZclpmbrjYv3gasObrl2Vv3bK53Cab5OKOX2vUwB
         o+RPkv9bRPO5VnQTvH/5lYb5rggrQcgGvk0dwNGm+8AQc/I4ZlAY9Au/FOJy7fKT3894
         RLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679991; x=1702284791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8U8FDgV2kJRNizasnA0RIYG3htVkBqbfELVizQ8fYE=;
        b=sEgroibOiVBF7DaaFynFB01dUhyNtcfA/GzXeZzO5UFiKXJbKQZQ/P3WndclOPoRV/
         2r6vgU/62cBM3EQK4sXKl7cW1JHO0XtO8za5WyyovdMmvrMJbkxJ+zLCgj++kR8+WdJ/
         lIcXLyEDrOWnnpCZBwN+8PKJgkKhLAsNdxeneM4FRvRgwqgalkfTJymmw1zdflk6ffTv
         w/goTSRMYmYz1i4fuIHGl9lamKrXzdNxuV3AKfsuZ4MJ2Bmr8qriI8sa0im+ctAgg/v0
         4PjI8GHjysRC2WkPaKukDvU34sEIcRPEJVYFNEWJxib5NZ/Iom6WMKkMZub+U6SYBwIG
         +tMA==
X-Gm-Message-State: AOJu0Yx1ORJSUx9GwSOuVHnZ6r1jN9tl5yp/NSUZdkM6THByVpbMSTr+
	IOnXu46y0tZE+SNnrmec9zE=
X-Google-Smtp-Source: AGHT+IG0Nm8uobkZ7fuXeNb1VG2jgOv+y9cbRZbS+9o13GgReT/Aq5/hyQJO0ZQnIX+Z0sjCXFDweA==
X-Received: by 2002:a7b:cd0a:0:b0:40b:5e59:da94 with SMTP id f10-20020a7bcd0a000000b0040b5e59da94mr1978664wmj.167.1701679990885;
        Mon, 04 Dec 2023 00:53:10 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003fefaf299b6sm14132838wmn.38.2023.12.04.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:53:10 -0800 (PST)
Message-ID: <edc0fe0abf55212131cc1e0ca064df64e8ba14bb.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 04 Dec 2023 09:53:09 +0100
In-Reply-To: <CACRpkdYBXVt7KvWfPJj1OhPUB7-QJbKg+74zwnR_=0pszg9APA@mail.gmail.com>
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
	 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
	 <CACRpkdYBXVt7KvWfPJj1OhPUB7-QJbKg+74zwnR_=0pszg9APA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-12-04 at 00:03 +0100, Linus Walleij wrote:
> On Fri, Dec 1, 2023 at 4:24=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>=20
> > > If a pins .direction_output() fails, .set_value() will not be called
> > > on it either.
> >=20
> > This is where I lost you :(
>=20
> devm_gpiod_get() (and similar interfaces) will set up the default mode fo=
r
> the line, as input or output (with value, calling .direction_output) so m=
ost
> likely it will fail already there, and the driver will not probe or
> userspace client
> will fail.
>=20
> > So, I'm might be overcomplicating things but... Again,
> > the case where someone wired up HW so that we can actually use the pin =
to drive
> > the
> > line high (having an external pull up). In that case, If I return error=
, then I
> > won't
> > be able to effectively set the line high (as you said, set_value will n=
ot be
> > called
> > on it either).
> >=20
> > Now, I do understand that if we have the line flagged as GPIO_OPEN_DRAI=
N, then
> > gpiolib will switch the line to input which means we will set the line =
in high-z
> > which means that if we have a pull up, then the line will be high. I me=
an, it
> > works
> > but it would be strange if someone wants to have the line as output hig=
h and
> > after
> > trying to set the it high, it sees the pin moving to input. But if this=
 is how it
> > should be, fine by me.
>=20
> What do you mean by "sees the pin moving to input".
>=20
> If you mean electrically then yes, it goes to high-Z.
>=20

Ohh, I know where my failure was!! I was reading gpiod_direction_output(des=
c, 1) and
following it only till gpiod_direction_input(desc). I was completely missin=
g the
'set_output_flag' jump... All understood now :)

> If you mean logically, as seen by software and GPIO and debugfs, not
> really.
>=20
> I think a good exercise to see how it works is to just walk through the
> code in drivers/gpio/gpiolib.c for e.g.
> gpiod_set_value()
> gpiod_set_value_nocheck()
> gpio_set_open_drain_value_commit()
>=20

Hmm, by looking into those, it made me think that I should not even need to=
 implement
the .set() callback...
>=20

Thanks for all your help!
- Nuno S=C3=A1
