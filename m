Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191C93F9F41
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167134; cv=none; b=CCh8b+MvCrKL8ViaBiSRvEFKPldpW/uTN8A98XbEWyOzg6pOB57bBtMWsA5mYrkzXH9j+DODrr+cu+7JbrgzVw77acewZEgbk3PN7Ps80+vGOVpTphk7pTGk13cAqTmvNsPsnfVTfdmA02A5Q5YrIdtGRGv9jdLwmE3BFIM8sv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167134; c=relaxed/simple;
	bh=WqsYGvqy1lSoXEbCICLvQ5xvIrc5Ffnp9uo1uuZnsRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mS3zR1zb/Pk0hmfIlGO6hMc05hwA9RAqKBJcLXEXnQncpEXr+SUPZZiLNreUiWPFVcnT+JQpE/2W7hJMmlusFVRC4ENO/T3pyTY74lLDqovkTRiTWCwK6Gi/D+VVCRFCkSzf5n9xBxQBA6P39o1pMOa4hhuWaC66YnfFjU9WUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCKRtmMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCKRtmMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D495C2BCB2
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778167133;
	bh=WqsYGvqy1lSoXEbCICLvQ5xvIrc5Ffnp9uo1uuZnsRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HCKRtmMWF1spuZeUGiLwj6RIpdrpEVOspNACrmRyE1I85YPOotLpGdDhK2Rd4vdk3
	 JupRjWA32kRXqAAYTnWErqs9CftohVa/Z+Rs5V5vwbc/UPHrXwRRpEXLVxQJ18pGka
	 l+tRo8RY5L6efOK+WWgLJFc7V04o89rKt9OUm61Vgot43S5Oh6cY6UXb7m2JRIMFFd
	 1LNT7U2Thie1DEdh1Rk4rk9rhC+5i0gYENj4PipAtEqTFi8fvrskiOHdzCOeeSKPpF
	 szZlCrwqK+Ct9d2+MAjOHk7F+BSNwpgnwdGOeL/GJ4nZWCwSXinDZ1nayU0d1AKhsb
	 WNQ6DtGlLYwaw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso1650141a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2026 08:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TW99TMd7l5WLxdNGGw049N2w7cC4ZuX8hnKWC58afMzYj9x+2fsSlTZTOhR4EQklGzOsr2J/enQa1kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jHiasjm0w9DaQ6z+hdaLz6twkAUQzIclqDLPs7ujGe4hwNJ6
	i+r+EzIr8WsoQoJkj7Od26hqvsqm2mXG/eKeuzQhcblhXNYLJRpRU8T+nnXagFD5dU/msNOBQhv
	+Q3r14Dgh1k9kwdk68/uaLvBOL8MVeg==
X-Received: by 2002:a05:6402:3511:b0:678:a507:e81b with SMTP id
 4fb4d7f45d1cf-67d6489fad4mr4544910a12.21.1778167132175; Thu, 07 May 2026
 08:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
 <20260428082337.743546-2-changhuang.liang@starfivetech.com>
 <20260506012556.GB248179-robh@kernel.org> <ZQ4PR01MB12029EC472A080E254DC8444F23C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB12029EC472A080E254DC8444F23C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 10:18:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKueRr+teYz=yW_wOZvVCSJ3w5B1DnqdT4uR+iXjpsE8A@mail.gmail.com>
X-Gm-Features: AVHnY4IozLPi8zNfD1H5_ih9Khc3mIqKuXRGjhrfYp9Dg_K4y-EgQ1OIRt8qgLI
Message-ID: <CAL_JsqKueRr+teYz=yW_wOZvVCSJ3w5B1DnqdT4uR+iXjpsE8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:36=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> Hi, Rob
>
> Thanks for the review.
>
> > On Tue, Apr 28, 2026 at 01:23:36AM -0700, Changhuang Liang wrote:
> > > Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tac=
h
> > > controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../hwmon/starfive,jhb100-fan-tach.yaml       | 98
> > +++++++++++++++++++
> > >  1 file changed, 98 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> > >
> > > diff --git
> > >
> > a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yam
> > > l
> > >
> > b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yam
> > > l
> > > new file mode 100644
> > > index 000000000000..fdc8539ec804
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach
> > > +++ .yaml
> > > @@ -0,0 +1,98 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JHB100 Fan-Tach controller
> > > +
> > > +maintainers:
> > > +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> > > +
> > > +description:
> > > +  The StarFive Fan-Tach controller can support up to 16 fan tach inp=
ut.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - starfive,jhb100-fan-tach
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^fan@[0-9]+$":
> >
> > Unit-addresses are hex.
> >
> > > +    $ref: fan-common.yaml#
> > > +    unevaluatedProperties: false
> > > +    required:
> > > +      - reg
> > > +      - tach-ch
> >
> > You need constraints on the 'reg' values. Also, what does 'reg'
> > represent in this case?
>
> "reg" is only used to distinguish between different fan instances.
>
> >
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - resets
> > > +  - interrupts
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    fan-tach-controller@11be0000 {
> > > +        compatible =3D "starfive,jhb100-fan-tach";
> > > +        reg =3D <0x11be0000 0x400>;
> > > +        interrupts =3D <128>;
> > > +        clocks =3D <&per2crg 33>;
> > > +        resets =3D <&per2crg 5>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        fan@0 {
> > > +            reg =3D <0>;
> > > +            tach-ch =3D /bits/ 8 <0x0>, <0x8>;
> >
> > How do you have 1 fan with 2 tach signals?
>
> On our platform, two fans share one PWM channel. It seems there was a mis=
understanding earlier.
> I will change it to the form of one tach per fan.

I think you have to leave it like this as you can't have 2 fan nodes
at the same address. Just need to fix the size.

Rob
