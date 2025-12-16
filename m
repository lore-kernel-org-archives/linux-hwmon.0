Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557A326D6E
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904482; cv=none; b=CxZ3Np7kWxgAgR1CLuYd64lziRM/1Q3d3pKUIWIO7xO5pnCRVQ3HnCrDSGA6xVM+nfb1mWh2Sq2w6HQqGADr/aHhlrQGdQ/GYfZcfEGLuDK8jOTFZ0iyGZhRSWp+RkkANdFcWsP03qDe9muGAVq2dSuQrl3OJKfJQhgf9/+nkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904482; c=relaxed/simple;
	bh=FwQQU5q3mw9YrloIZOuHcsfzqU/fokbOnsPKngY00gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbvYUi4faOaBiV+Gu7bGn4k1aICo/QsEBobqtCpfkVY++AbTQiPPr5nk0LQ8wHf2Dcp6ZyhrPboPjTa7Lbf2SUyDmK94t3NXKX4fF8r32UMmlQEB7jWa9L/VYj3KZMGfBWKkG57pq+DyVuL3YeoLZ7uYyTte8nZdUpZwSOvgVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=PppOmbxb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="PppOmbxb"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73161849e1so1112322766b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904479; x=1766509279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4BVhGwuqRhR0h5Wvfr3twMpRndihHjDu8cj/PGuiBM=;
        b=PppOmbxb80EB5BWDqMOWzKIl+rARgtVuOGGvE10xdcScqBqpQwNvNoJwkifNDuXNLT
         aZNTTwSkulA1LaRH3Qp4lq2HSpUL/jm/M4ThCBuX4mFTGcSwjOh22+iEi54+CleWofSe
         ED3XdtKCQw+hCkQo7nVipi1H7wrg+3HMSafcL5so3PvmfvrTYHcdESgLoOF0LUl7i/7n
         78BIi0e/lzQ6tx6+NQXo6ywtpxxzy0tiZBO02T5fx3/53gb+klSCvJe8T4M9w6G1QHLK
         rPCW4igTqm6sMu06QgAd8gGIuMK8vjcMolYlwdIfVOq/LvXgIAx1SIgNkXiKLmklvTYW
         tPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904479; x=1766509279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j4BVhGwuqRhR0h5Wvfr3twMpRndihHjDu8cj/PGuiBM=;
        b=YAekQp/DnM9+tyBgDTi7SAU8f88PNNVcsQNKZFSzoHWwJxhP2ltOHfKiyNXF2Md8dg
         XfbB+BsdJBBT40J5dDpTkrqlwYM1Uxhs78I/IsYwCEv3l39AcvCrS5qSmULKMvHbaXU7
         D0loQgvPIIIcr6KGRyYYo6T+kMDT57H57Cs6DIit+enDSNqU34Ggdv8Jo3ZgcKtvKtVc
         h326WoB0V4DRGQHT7YOl447FB6nrRgcwPCngTC3KsElKaDoyed6WEKYHrGs9wmn6HVOz
         wQzYWrrBHAi9CkbGus1ZwdDBJdozY7DrOMgqeMuBq4dYas2ojnEdvjWA6rp1CaVcXily
         VdVw==
X-Forwarded-Encrypted: i=1; AJvYcCXKxYqFpzJcqajJ21hLrFzNRcCP477TAFp5HiPB9K6+vyuySMkvcpoJJ+n6qyO7/Phs6I9+LlHfBc5zxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLM/jsTyps1AqL2jvONVZ8p6HDnPOOhmCyBiUufecXoNQK3cnI
	nB6M4fq+eUYFDq9NzHTD/uDutdP9XUg4y3fMlCc+qb1RH0LkinwcUABmsXXzyyQC+CxQzyzxNlv
	oapKAcWcCUzHVakaJEtbx7mWMDjAdxr1jO6tL5Ee2MA==
X-Gm-Gg: AY/fxX6d4NEhzym7HV8iAe8bGl7D9YLS7mVUJCfH70+OaVa6BsfzA/+qcb4QrQnM263
	dUQ7UNbnT4hsjyRcGyK/wHc1q/mMSNTc+RETGaOsqWeBR1NhuIgbjp+JJMRv8R/D9SF5SCYLNd8
	jkgT1yDaUsW7hdkCrTycU0d6jTqO6XJncA7ghSfXGSCYLY30SBkTdXa2/hVMcQ3F1aay6CcwGBe
	S0VdB7ag18SJdzOKJf1UNk1ekPU6ejp3Dli+sKoi7qIzCcasXborf/FX7bzGqQkicBIQ2VP
X-Google-Smtp-Source: AGHT+IFgWHsN8Jt+GNNh/GtbzMrps7YuiUN4HCSjrLSYBUNl98CacMkEeJqhHxiowRyslb2rMUAVRC886sKdRRnuksE=
X-Received: by 2002:a17:907:608c:b0:b74:352d:6dc1 with SMTP id
 a640c23a62f3a-b7d236b61b4mr1684820166b.28.1765904473954; Tue, 16 Dec 2025
 09:01:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-5-robert.marko@sartura.hr> <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
In-Reply-To: <fe15fcce-865a-4969-9b6f-95920fcaa5c7@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 18:01:02 +0100
X-Gm-Features: AQt7F2oP6MyGEflW0Nvuzwrgr5iXWpqv_VRgduC1yuFaCXQ7imivVtKDExK377E
Message-ID: <CA+HBbNGNMGRL11kdg14LwkiTazXJYXOZeVCKsmW6-XF6k5+sVA@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] dt-bindings: arm: microchip: move SparX-5 to
 generic Microchip binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Now that we have a generic Microchip binding, lets move SparX-5 as well=
 as
> > there is no reason to have specific binding file for each SoC series.
> >
> > The check for AXI node was dropped.
>
> Why?

According to Conor, it is pointless [1]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/#26691879

Regards,
Robert

>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/microchip,sparx5.yaml        | 67 -------------------
> >  .../devicetree/bindings/arm/microchip.yaml    | 22 ++++++
> >  2 files changed, 22 insertions(+), 67 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/microchip,spa=
rx5.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yam=
l b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> > deleted file mode 100644
> > index 9a0d54e9799c..000000000000
> > --- a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
> > +++ /dev/null
> > @@ -1,67 +0,0 @@
> > -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > -%YAML 1.2
> > ----
> > -$id: http://devicetree.org/schemas/arm/microchip,sparx5.yaml#
> > -$schema: http://devicetree.org/meta-schemas/core.yaml#
> > -
> > -title: Microchip Sparx5 Boards
> > -
> > -maintainers:
> > -  - Lars Povlsen <lars.povlsen@microchip.com>
> > -
> > -description: |+
> > -   The Microchip Sparx5 SoC is a ARMv8-based used in a family of
> > -   gigabit TSN-capable gigabit switches.
> > -
> > -   The SparX-5 Ethernet switch family provides a rich set of switching
> > -   features such as advanced TCAM-based VLAN and QoS processing
> > -   enabling delivery of differentiated services, and security through
> > -   TCAM-based frame processing using versatile content aware processor
> > -   (VCAP)
> > -
> > -properties:
> > -  $nodename:
> > -    const: '/'
> > -  compatible:
> > -    oneOf:
> > -      - description: The Sparx5 pcb125 board is a modular board,
> > -          which has both spi-nor and eMMC storage. The modular design
> > -          allows for connection of different network ports.
> > -        items:
> > -          - const: microchip,sparx5-pcb125
> > -          - const: microchip,sparx5
> > -
> > -      - description: The Sparx5 pcb134 is a pizzabox form factor
> > -          gigabit switch with 20 SFP ports. It features spi-nor and
> > -          either spi-nand or eMMC storage (mount option).
> > -        items:
> > -          - const: microchip,sparx5-pcb134
> > -          - const: microchip,sparx5
> > -
> > -      - description: The Sparx5 pcb135 is a pizzabox form factor
> > -          gigabit switch with 48+4 Cu ports. It features spi-nor and
> > -          either spi-nand or eMMC storage (mount option).
> > -        items:
> > -          - const: microchip,sparx5-pcb135
> > -          - const: microchip,sparx5
> > -
> > -  axi@600000000:
> > -    type: object
> > -    description: the root node in the Sparx5 platforms must contain
> > -      an axi bus child node. They are always at physical address
> > -      0x600000000 in all the Sparx5 variants.
> > -    properties:
> > -      compatible:
> > -        items:
> > -          - const: simple-bus
> > -
> > -    required:
> > -      - compatible
> > -
> > -required:
> > -  - compatible
> > -  - axi@600000000
>
> Nothing explains the rationale for doing this.
>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
