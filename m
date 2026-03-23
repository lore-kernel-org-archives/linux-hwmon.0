Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B55F3C2764
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279012; cv=none; b=EYfiGYe7ydeSXdbG1MwIOAK91puNEdIyOUqg1aSZjBvDaTZHEK16uNPAzUg/3T2qYFBN04L1NnkMmgN8EGgs6Df8rAMUZag9g+Ke095tFcy+kcgT12QJJXTQVow2fb+22N5Z3olhgAgDt9jAeRZW6+WYnG8xmnThljMEWOLSi+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279012; c=relaxed/simple;
	bh=YSmf7SfS+dyoKK/ONc677DunC4obvmMT1f04tsDKnmw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dLioEevRcAA0EI2UbDXSRLLJVSEo3el/XYzf7/OU2vyUICqjouMmjXhhbDDAcFNziIX7LBbwnzQ5t/rvYgSlmN6hV93ij7PAY4fcwskuryw8e+/4QMN/UgyaDPpBmZhDjvKn999QmhSmE3QgIiMFeHU2/MooQJxMc2ewHGijkyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVkBF4Ok; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVkBF4Ok"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so3199699f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774279010; x=1774883810; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JNANK6Rws1vPjepUbdhCzlW9rrYItMAN/Gh+hzvMyN8=;
        b=SVkBF4OkFL0iko6YQO829KDX4ElyXVFFl8ngecxNpqqLQx9TeBYWjct80wb1y04X8s
         lL6o3MV42WBJryML8GJnPdO2bmc8wGuBZDrxP0SK9PYMnerL6M7VD799eag/8UGbQ/9l
         PmELcO9s9YCQQoTlSi3QgruFV7YWaVFZefooz20sdIyalIkY5qfP00SjbsxKQqqI+poc
         bC7Jk7mYTqefgMKfJjdnvTfnC+mKjbdx8V3bHMEPkKuh2dosTDJjVljKZGxNGTh2BM6y
         EVVUUcGd+dgXu1e5xxVpcrykrIYFbl++MBeENhPa82qVdBI4WpGgRKI03cpSgEqwppiy
         EOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279010; x=1774883810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNANK6Rws1vPjepUbdhCzlW9rrYItMAN/Gh+hzvMyN8=;
        b=XGmP+uSHQn31hmrS0tDrGfh6B7+/bV9rgM5kRsfsJBSu1CQgyqYwkdxYxLkPVigNB8
         N1zO8A6U/OD3v8g1msbbcUYUgX+qmLuW8xI5DEG/YULUT1KB9k0As8m+zD1rhXIFaVNO
         lt3+NGvZTkpHsvPx3eSgUimTbOwAhPFyacOaQUDZ4RJ2zV7PP6O7d1VjOC7E9XOqrOzU
         iDtmru7896oAcKYfu4y8HtyQmOaN7WnD14piyh6bgNsBID84crHn5pHb/BG7nsz+Z+B0
         AuDIprdD0K0TWCVqEwna+SCOmF5NNr/lQcSPxTDGibnSJzIyrKh/GmOzVKJeu5pg6AP5
         FupA==
X-Forwarded-Encrypted: i=1; AJvYcCWKf7jHkvAU6SMlLZkIfBwXspC3IXBULGvHn2lOEe/NjPdh+o44FukOO8XxO7mINsKFp5r5hyeQWh/K8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLdjMh7W1NXLQLQKfVLi7mtpQssvU9hjzj41sq3iefpEca7kaS
	K66vcReSa2wAvd35nhnBZjQLFcoOS4EJiLSWwtLo/CmtyU1WWG733HRN
X-Gm-Gg: ATEYQzyAkXgHrSlLDPmxNClsu2d5advva4IKZGF6Yni3ojWMxK0tbmgfwSy/+HF8rTA
	bF4E0070p3WRNyDIPEKngQ0P7ZNcqrR7HiTvrUTOLfZHbSc8SBEAJq3E+7qh500wd0Yke4RWXAV
	PD8ZU2fY2NEOweN4FmSfdQtTjthVUArpGtv6mOf5nQqXPFpu6CKiiU0iP9P04wvOsKa1k2zEDnH
	qja8xZtG+V6toelqHXDiom8QFYwrh23w3jYGQX4RZ5cWRnglWk/OrI8rLrQzIcseUEfHiHYSADF
	YR3je9oJMFwt1h4Yegwp6guEpAy9mpvEZw5qnqz17XWGd7zOuQbegz9QvDNk7mqxG0vzfFbWQwS
	q7CvAG5PXku/ak+FBOlFBjfBIXaPPNevLGDNE2DQJsGpmejGzrrsfrdhuRsNUwV4aTJnHCFe6oz
	ieV41LoGnEBx5J7kMsBgb+wgEi+kCT882BbKNhB+CppA==
X-Received: by 2002:a05:6000:250f:b0:43b:4dd4:684f with SMTP id ffacd0b85a97d-43b6428b52amr20099451f8f.47.1774279009482;
        Mon, 23 Mar 2026 08:16:49 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm31561116f8f.17.2026.03.23.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:16:48 -0700 (PDT)
Message-ID: <63baaa6ea6ce7a8534046fea3d9f14fdb26f87a3.camel@gmail.com>
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
Date: Mon, 23 Mar 2026 15:17:34 +0000
In-Reply-To: <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
	 <20260314-ltc4283-support-v7-1-1cda48e93802@analog.com>
	 <c395fad0-ca24-448a-a77f-ddac1cd9f809@roeck-us.net>
	 <77cd7e879a10df791d9d5eb1f16f1654e9904199.camel@gmail.com>
	 <453dbd6c-c68d-4977-8418-a898008b0fe7@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-23 at 07:33 -0700, Guenter Roeck wrote:
> [ ...]
> > > > +=C2=A0 adi,pgio1-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O1 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpio]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > +
> > > > +=C2=A0 adi,pgio2-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O2 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good, power_good, gpio, a=
ctive_current_limiting]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good
> > > > +
> > > > +=C2=A0 adi,pgio3-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O3 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_power_good_input, power_good_in=
put, gpio]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_power_good_input
> > > > +
> > > > +=C2=A0 adi,pgio4-func:
> > > > +=C2=A0=C2=A0=C2=A0 description: Configures the function of the PGI=
O4 pin.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > > > +=C2=A0=C2=A0=C2=A0 enum: [inverted_external_fault, external_fault,=
 gpio]
> > > > +=C2=A0=C2=A0=C2=A0 default: inverted_external_fault
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio1:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO1 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio2:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO2 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio3:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO3 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > > +
> > > > +=C2=A0 adi,gpio-on-adio4:
> > > > +=C2=A0=C2=A0=C2=A0 description: If set, the ADIO4 pin is used as a=
 GPIO.
> > > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > >=20
> > > Does this dependency block force a redundant specification of adi,pgi=
o4-func?
> > > The default for adi,pgio4-func is inverted_external_fault, which mean=
s the
> > > default hardware state already supports external fault features.
> > > If a device tree legitimately omits adi,pgio4-func to rely on that de=
fault,
> > > will it fail schema validation here since the dependencies keyword st=
rictly
> > > checks for the literal presence of properties without injecting defau=
lts?
> >=20
> > Fair point. I guess it will fail but the alternative is to not have any=
 constrain at all so
> > maybe worth it to be explicit in here?
> >=20
>=20
> I don't claim to understand how to define devicetree properties, but
>=20
> adi,pgio4-func =3D <"gpio">
>=20
> and
>=20
> adi,gpio-on-adio4;
>=20
> seem to be equivalent to me, and omitting the first property (because

Not exactly. ADIO4 and PGIO4 are different pins and can be both configured
as GPIOs. ADIO is a boolean because they are either monitored by the ADC (d=
efault)
or configured as GPIOs. PGIOs can have additional configurations and hence =
the
enum.

- Nuno S=C3=A1

> it defaults to inverted_external_fault) would cause the second to fail.
> So either both would be necessary or none. If that is correct, what is
> the point of having the adi,gpio-on-adio4 property in the first place ?
>=20
> In other words, what is the difference between
> 	adi,pgio4-func =3D <"gpio">;
> 	adi,gpio-on-adio4;
>=20
> and
> 	adi,pgio4-func =3D <"gpio">;
> (with no boolean property) ?

>=20
> Thanks,
> Guenter
