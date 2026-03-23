Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD3282F33
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281989; cv=none; b=JfeClHQtEdp5vBxBUs4pnwXy/omePKwKAHyRQ5/DFjWoqrw3TsU7Ov05HLiBfwLOuTF9R2v8ybIFJswI63U768+ZF5r3RR7+LicIiUqVaKDD/YLD4v2OjPe20zWzOKIJQBiTMFEDBGomSHyolbymOv/FlDMJmiLOeLxLlMgqTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281989; c=relaxed/simple;
	bh=Z/LmWnslyMEA8KuS1V4Xy1sI8gOsop003nSeTpsLEAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K1WfToi0PM8W5gNVmpC6Q78f9FmmTrQGFXGwe3QKRIrzGSQHqLp/6lNtO9Jqz6FzGSBqOr+pJgiAs1AENJ8b+4A1M7e0TJbEDef2Nn1rGKU3F2qgDVBH3CfwVYyUBvlXv41EAJVcUNq8tV7nJ/yuu5OkXqPgfawaiGNK8k/IBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkHyyJVk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkHyyJVk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso50087445e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281985; x=1774886785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZ+8+0X30kHk32CK+85EMrU3OFRM220+pzBDKFOaV7I=;
        b=UkHyyJVkpURCccfu4FgMmG+38Vo9SZf7KCxtdSbAfvboG4SzQAkCPb9dr3PrYINV1o
         zFH256SA8yYsZ6lD+Pq/nOCsvETvekJq3/WonN68fHaQYjomZ931ZwibpWlh4kPMy0uZ
         WTPVULbC2/mX8IsumKPD90dQchmq+LIWFnX7W4y30/HHKwKLsKUJcIDqX8BiCDilhbWA
         k7Tmtp22BeQ1CI05HR8D3sG/4VDQKAcVo+BpgLKDunJSn5cjAicCnBItOQOJPxzfPJHS
         c7Rrk761SDhBKouRNpRHWoWIjhuSZ/nm28Cq/Hel5RvsY57oy1lvRgq0C72drLLAuDD0
         seow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281985; x=1774886785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ+8+0X30kHk32CK+85EMrU3OFRM220+pzBDKFOaV7I=;
        b=EbsLtZeb467Y6G/o/Jd6J2sa2x7maVwpUqdQAdFgrhYkfwIdDvkmFPWC1B8pjfUYIJ
         zOJC2iuk4hiNrXsY7osyHM3BSXkXV4NN9KdtJJpRBVypuaabB/3kZMP0NoQNxt/JT0zH
         24wwQKkE+dZD7DCHofrLC4bMZautOr++a/AVdUu3U6J+NVvihAhe/kwtnlLh/p/qeCHl
         IeMUK5QD1inxGkteRhOI/OsAPOrOpIWb67lOh3B6sLtbpBV92CTow2MJ6lZLlx98WAUv
         hCUlpiPO9Pnn+gfooOFV/iYuY5q8nRCuIxYoo8stP/PQoRX2YxdDdQZ6y8pQ8gauSODs
         uJjg==
X-Forwarded-Encrypted: i=1; AJvYcCVU9yXUldCidX+qGNHQf9dZys+uENrgigf0JYR7UJElyN/KcqdFu2/BsEI/Uyin7opLy7s5kLiu92yuSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWIVfcG9xOTWwgQMeUlZ6HG7Tm+5koMI449apcVjyuc2hUqLi
	f19A2HW8LhKCH9GjezbN91JN4CFfXyIo5suoOY34K/awyotWlIDp5UOL
X-Gm-Gg: ATEYQzz7zD21WnS8loiZst96EwXCKrc+/qkBTLWE/WFg8sl0yu2nISM9trwuzokPcmu
	5j6hrmBIGu3Gv+vG2wfi1CqpC4ky3igKdKqTvEL3ArCyZUfX7V9mX4x67ItNnLZnGlGoYryv1+g
	0CTyN484PX3HjxxFWDffP4UmS2PMGDvRmwc9asIwfAmYeXO2AuWP5TsBihH5O4Qq/75ZxGufejh
	V+Q4dHyOpv2t6Xd8WlTziLcscENcfh1PL9WgpIwOQbXT9Lh6ej5RUW8lbw17oEjxzst64wqBIYU
	lskgpgg/LF/U3K/VGDHUKPoTNHhWYmuBR1muE9vLxYzmbpHT13g86WM5XhvqQ9s+3reI04uRB2j
	w3yyf3lTxubqKw2bNZrlUngucsqEkTOrokcbkOx3EnogXdeOLne18bnPNOrznSzhu0BsT91tFnS
	TguvqhppSHPhDkGv3NGwVc/0l1Kq7QB5H9Mk2A+iEd9A==
X-Received: by 2002:a05:600c:6096:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4870f1fc5e2mr1845745e9.8.1774281985360;
        Mon, 23 Mar 2026 09:06:25 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm469841175e9.1.2026.03.23.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:06:25 -0700 (PDT)
Message-ID: <ff6a81b9fdefa6b6156f1af39943312d6a445145.camel@gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 16:07:11 +0000
In-Reply-To: <821aafb4-d1a8-4611-addc-5bff4f1e187e@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
	 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
	 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
	 <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
	 <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
	 <63baaa6ea6ce7a8534046fea3d9f14fdb26f87a3.camel@gmail.com>
	 <821aafb4-d1a8-4611-addc-5bff4f1e187e@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-23 at 08:27 -0700, Guenter Roeck wrote:
> On 3/23/26 08:17, Nuno S=C3=A1 wrote:
> > On Mon, 2026-03-23 at 07:33 -0700, Guenter Roeck wrote:
> > > [ ...]
> > > > > > +=C2=A0 adi,pgio1-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO1 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpi=
o]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > > > +
> > > > > > +=C2=A0 adi,pgio2-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO2 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpi=
o, active_current_limiting]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > > > +
> > > > > > +=C2=A0 adi,pgio3-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO3 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good_input, power_goo=
d_input, gpio]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good_input
> > > > > > +
> > > > > > +=C2=A0 adi,pgio4-func:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the=
 PGIO4 pin.
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/stri=
ng
> > > > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_external_fault, external_fa=
ult, gpio]
> > > > > > +=C2=A0=C2=A0=C2=A0 default: inverted_external_fault
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio1:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO1 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio2:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO2 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio3:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO3 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > > > +
> > > > > > +=C2=A0 adi,gpio-on-adio4:
> > > > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO4 pin is used =
as a GPIO.
> > > > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > >=20
> > > > > Does this dependency block force a redundant specification of adi=
,pgio4-func?
> > > > > The default for adi,pgio4-func is inverted_external_fault, which =
means the
> > > > > default hardware state already supports external fault features.
> > > > > If a device tree legitimately omits adi,pgio4-func to rely on tha=
t default,
> > > > > will it fail schema validation here since the dependencies keywor=
d strictly
> > > > > checks for the literal presence of properties without injecting d=
efaults?
> > > >=20
> > > > Fair point. I guess it will fail but the alternative is to not have=
 any constrain at all so
> > > > maybe worth it to be explicit in here?
> > > >=20
> > >=20
> > > I don't claim to understand how to define devicetree properties, but
> > >=20
> > > adi,pgio4-func =3D <"gpio">
> > >=20
> > > and
> > >=20
> > > adi,gpio-on-adio4;
> > >=20
> > > seem to be equivalent to me, and omitting the first property (because
> >=20
> > Not exactly. ADIO4 and PGIO4 are different pins and can be both configu=
red
> > as GPIOs. ADIO is a boolean because they are either monitored by the AD=
C (default)
> > or configured as GPIOs. PGIOs can have additional configurations and he=
nce the
> > enum.
> >=20
>=20
> Ah, I didn't realize the small "A" vs. "G" difference (and apparently
> I don't understand what the AI is complaining about ;-). Sorry for the no=
ise.
>=20

My understanding about the AI complain is the below dependencies:

+  adi,external-fault-retry-enable:
+    - adi,pgio4-func
+  adi,external-fault-fet-off-enable:
+    - adi,pgio4-func

The default value (omitting the property) is a valid case to use any of the=
 above two
flags but with the above, omitting the property and adding the flag should =
result in
an error when validating the binding (because of the dependency). That is w=
hy I replied
with

"Fair point. I guess it will fail but the alternative is to not have any co=
nstrain at all so
maybe worth it to be explicit in here?"


- Nuno S=C3=A1

