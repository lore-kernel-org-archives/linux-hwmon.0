Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F819465;
	Mon, 13 Nov 2023 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crSdqiZZ"
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC06E10D0;
	Mon, 13 Nov 2023 01:29:22 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so6893722a12.3;
        Mon, 13 Nov 2023 01:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699867761; x=1700472561; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yp/7ptDRFOzrMZAZ9KuQqrD9cMa6e2wJsBv3cHoElh4=;
        b=crSdqiZZ0A/rVOZ0Q+6Kf5HJGxf2V38QPmzfFG0wSJatGeraMNkY41yd8574mlvYun
         6lZpwBqZD3uGnqk0cAqO83H+zshk3lqcfGkf0G0f5dILjRc3YocQHHYGZQ30SyWGD96P
         SoCIqiajp54xpmxizPitYSDkmDIlwGanctZDoqRaQdtSatHhXghjzZPAP4DXcouk/8+f
         9zWu7tMlMUp044gky7JxIt3TNzW76RdQe+x0gRGzi9xfoiaMum6BDy0NW9nIJ+u2emaM
         qtlm3FJSaWsAiMLu92Id5pkabqwPAgOYGfEjdB7KfrsRW6RuVHrv3wsvf8SNb64mBr8J
         rSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699867761; x=1700472561;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yp/7ptDRFOzrMZAZ9KuQqrD9cMa6e2wJsBv3cHoElh4=;
        b=laBFf0pXvSUhm8k/Bk5Gq46f5LbB/+WPhQy+ZmLDjlacF46dHDdBdw2cceaiZX76qa
         kTbEZh8DeCdyGVbIyVBG4DgMbxfUXvBlQgof9/mfPb9ri2JTAz9mwSTtUrPm8WIhcNv+
         38z8g6qrgbuI9m+1XyHtlMVLEBHHflDTfS9z2Eg6Cz/VGKwRfWPAbzlH+tvrRlXM7N3t
         1uZDNCddKxoOsmfhoSZ1EUdJxSBmJKHrVqZJqHzRvAjUSW5r5QNbCG5vroahd6zXQ45/
         ULNmqxwIw8AcGRziv0l5CuhFljl2pW7sOBf3C7Wm08/dt45MBmNrHDKtLkSDzjF2k3qX
         7Lwg==
X-Gm-Message-State: AOJu0Yxb3Nz4noAoJ5q2mmLBs14XWK0P30jmKl0icmsIDKH78GmSaw5+
	RuH9zVtcMYNpT56a1GCca2M=
X-Google-Smtp-Source: AGHT+IFVG2pZq11wz3Bd3neJ2lHMGSdI343lJ6Z2gg806knE5K3Dl9+kugaX5lYyaeLqBQgfLqiyEw==
X-Received: by 2002:a17:906:b49:b0:9bf:d65d:dc0f with SMTP id v9-20020a1709060b4900b009bfd65ddc0fmr5342968ejg.4.1699867761036;
        Mon, 13 Nov 2023 01:29:21 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:361b:8f29:1cbf:5e69? (p200300f6ef1b2000361b8f291cbf5e69.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:361b:8f29:1cbf:5e69])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709063b5100b009e6e82939f9sm3698732ejf.26.2023.11.13.01.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 01:29:20 -0800 (PST)
Message-ID: <65060d844b4cdab02079a05286b506740623ed53.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add LTC4282 bindings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan
 Corbet <corbet@lwn.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Linus Walleij
 <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>,  Andy Shevchenko <andy@kernel.org>, Jean Delvare
 <jdelvare@suse.com>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 13 Nov 2023 10:32:17 +0100
In-Reply-To: <20231110-astronomy-nicotine-02c798d42910@roley>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
	 <20231110151905.1659873-2-nuno.sa@analog.com>
	 <20231110-astronomy-nicotine-02c798d42910@roley>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-11-10 at 18:42 +0000, Conor Dooley wrote:
> Yo,
>=20
> On Fri, Nov 10, 2023 at 04:18:45PM +0100, Nuno Sa wrote:
> > Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
> > Compatible Monitoring.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0.../bindings/hwmon/adi,ltc4282.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 228 ++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 6 +
> > =C2=A02 files changed, 234 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/hwmon/adi,lt=
c4282.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > new file mode 100644
> > index 000000000000..0a5d540f014e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > @@ -0,0 +1,228 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices LTC4282 I2C High Current Hot Swap Controller ove=
r I2C
> > +
> > +maintainers:
> > +=C2=A0 - Nuno Sa <nuno.sa@analog.com>
> > +
> > +description: |
> > +=C2=A0 Analog Devices LTC4282 I2C High Current Hot Swap Controller ove=
r I2C.
> > +
> > +=C2=A0
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ltc=
4282.pdf
> > +
> > +
>=20
> Extra blank line here FYI.
>=20

Right...

> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ltc4282
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 vdd-supply: true
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 adi,clkout-mode:
> > +=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Controls in which mode the CLKOUT PIN s=
hould work:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 - Configures the CLKOUT p=
in to output the internal system clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 - Configures the CLKOUT p=
in to output the internal conversion
> > time
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0 enum: [0, 1]
>=20
> I really am not a fan of these types of properties. Part of me says that
> if you're outputting clocks from this device, then you should be a clock
> controller. How do consumers of this @clkout@ pin get the rate of the
> clock?

I explained it to Guenter as he also argued about this. I'll wait for more
feedback but it's likely this will just turn into a clock provider, yes.

> I'd kinda be expecting to see a clocks property with a maxItems of 1 and
> clock-names with two, mutually exclusive, options.
>=20
> The other part says, and it applies in multiple places here, that having
> integer properties with non-integer meanings is a poor ABI. I'd be vastly
> happier if the various instances in this file became enums of strings,
> or $re=E2=94=A4evant-unit so that a dts containing these properties is
> immediately understandable.

Well, I think you're mentioning the 'gpio-mode' 'and under/over-voltage-
dividers'. I think for both it's clear that having the relevant units is no=
t
feasible (at least I'm not seeing a way of properly do it). As for the stri=
ngs,
well, I don't have any much to argue other than:

1) It's pattern seen in a lot of bindings - yes, that's not an excuse to co=
py
bad/wrong things over new bindings - but, honestly, it's the first time I h=
ave
someone complaining about it so I never thought it was wrong.

2) It makes much more easier to handle the properties in the driver (yeah, =
I
know that, as far as you're concerned, this does not matter to you :))

So yeah, if you insist on it, no strong reasons on my side to not do it. As=
 long
as I see some consistency down the road :)).


- Nuno S=C3=A1
