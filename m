Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSquDEio"
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C8AA6;
	Fri,  1 Dec 2023 08:30:02 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bc57d81f4so3376335e87.2;
        Fri, 01 Dec 2023 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701448200; x=1702053000; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dFefFz1OVaIHAsA8Y38i5DLqKPmhksNklsfRnGvZD2c=;
        b=NSquDEiohXCLLOeBwzNm1KMrzTCWY38Lfn/+g1Rk0am/8as02T7gTUedvIq/DqzMXl
         f034Hvc7Rt8hMme00Zhiut7XCo2AXs+xoe03yUgsFDZU8vJ6pqM7yzS8zWellkAHNFb4
         1sVVkiNT5zlPqXOmwC7i43ZM4cQL3J4Y69QTXw6vbstCsqbX0O30bWKMiqnS0U1F0TUz
         0nSY08Vj+5rotzc7JCLEOQeJc3v980UdrstEkmZD8BxB31cEb6pWzjqG6ITQbpxlhRk1
         sBAnnjSgGZy+gluQMzoBqyFJoNblcsoq8yWTRA+1pTaeOXyMNMU25VE1ORkDGTKUh4J0
         dANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701448200; x=1702053000;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFefFz1OVaIHAsA8Y38i5DLqKPmhksNklsfRnGvZD2c=;
        b=mXeL6deScbX8Va13SFMd3zRCRzbXNle7NN8qdECHEhTo0aaXtO7nWsOZNAT+TL+oOn
         W+lLi52WuEArA/bGfNMNr53HKpG7g0n8FcH3Pw+TK2geq3KVuoQC8+tfcxF7dd2GKavi
         zTbdtD5viYbx8EY7/knIvYJPpkf4+ZadcSrrewaBVdVt47stgEDo3wEJ18WRoIvw7nXo
         +N44MVXivhO73dS/sGJP5x6Ei1KWQZz01Y2LnztPbTOJEp454xYGrivWrMe/qQNXroAj
         iANACtR2/aO3TtOIGEt7aMhhFPC4C2nmS3HwLOymVBY957L0NCLtGgsdcv2p6/vHgPKj
         4IXg==
X-Gm-Message-State: AOJu0YzYtOgKmOjN2SO0uh3xqo6AkGhys4Rjasi/pJ22M2buttb6EQ6D
	BlE4dL5UZThbbUy98+l363g=
X-Google-Smtp-Source: AGHT+IH6A7Ayd5CUO8BtVfFgMPWLdgJcUR9DOX3B2KB8NzVW5GO5ca0HFG8Igw4RYbpfYBlcdj6+tQ==
X-Received: by 2002:a05:6512:304f:b0:50b:d764:2908 with SMTP id b15-20020a056512304f00b0050bd7642908mr783635lfb.160.1701448200213;
        Fri, 01 Dec 2023 08:30:00 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0040b36ad5413sm5863088wmq.46.2023.12.01.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:29:59 -0800 (PST)
Message-ID: <986fb7dc2a34602fa9c2d57a7a3e06a71cfdc0a0.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 01 Dec 2023 17:29:59 +0100
In-Reply-To: <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-01 at 08:04 -0800, Guenter Roeck wrote:
> On 12/1/23 07:47, Andy Shevchenko wrote:
> > On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno S=C3=A1 wrote:
> > > On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:
> >=20
> > ...
> >=20
> > > Yes, that is the only thing we have. Meaning that there is no hw sett=
ing to set
> > > the
> > > pins to open drain. Open drain is what they are. That is why I'm not =
seeing the
> > > point
> > > in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
> >=20
> > At least you have to implement error for PUSH_PULL mode and other modes=
,
> > so from the (core) software point of view the user should be able to as=
k for
> > anything and get an answer from the certain driver that "hey, i do supp=
ort OD",
> > or "hey, push-pull can't be supported with this hw".
> >=20
>=20
> It seems to me that this is heading towards a mfd driver. I don't feel co=
mfortable
> with all that gpio specific code in the hwmon subsystem.
>=20
> Maybe I should request that all hwmon chips with gpio support must be imp=
lemented
> as mfd drivers. I'll have to think about that.
>=20
> Guenter
>=20

Hopefully you don't ask that already for this driver...

I mean, I guess It could be done but having this is as mfd will make it mor=
e
difficult to handle the pins. Because if we look at the bindings we can see=
 that
these pins might only be relevant to the hwmon driver and not even be used =
as gpios.
But being an mfd, I don't think there's any requirement like one of the dri=
vers can
only exist if the other is also there. So making the gpio driver depend on =
the hwmon
would be weird. I might be overcomplicating but things can get messy if we =
want to
make it right in the gpio driver:

* If the hwmon is not reachable then we could just assume we can use the 4 =
pins as
gpios freely.
* If the hwmon is reachable then we need some kind of syncup to make sure w=
e dont use
a pin as gpio if the hwmon driver wants to use it. Things can get even more=
 shady if
we think one driver being a module and the other being built-in.

Or maybe we can also just have an array property in the gpio driver to expl=
icitly set
the pins we want as gpios. Then if the user messes up and we have a config =
overlaps
one of the driver fails probing...

Or maybe Andy's auxiliary bus suggestion might be more suitable (not really=
 familiar
with it).

- Nuno S=C3=A1
