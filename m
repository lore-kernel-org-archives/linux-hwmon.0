Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9E2D8382
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904201; cv=none; b=j0WNfpnWLO6NLTP1qCYhyVnPSmu9iKWt09ch+YnxuHpcL4kL6EdATLGszT+49swUWdSlMIdsJIer7Fxcq5x+arRTIlbAvnbtPJ5tnPiKZHYFQ6IBs8BODuNsurWMP0ZPh8FKffy5D4gNPlpRZGlTQSxrJXPIZPeroikPQD+0piQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904201; c=relaxed/simple;
	bh=Q8UWsSe4myl6JsHqQXZQYvioe1R/IQ7hZDIpoW4Rb/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiMhrJDHuzWIa0Lxu19cQEbOmhmGz5tRc27lx451C+ZDWyQKac3LFXPM85KtVsyZKu2befNoV2VNAK0jxLkEmIg7/u3/j9vEFyYtknTfsgPxzUHwDhjzpSp016U6M0N2/A+kC9ekkKd72vzrJlXoKAh+W5DNgt37G//sPA7lCX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Qid3TSMc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Qid3TSMc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7633027cb2so850998466b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 08:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904198; x=1766508998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=Qid3TSMc2CTDUoYp7rtMstObA1qRdYvskyb1BlbMHK5zjCyHPt0DApQPZfuHEqcMjK
         4ebj5xzSYZjaaMnNIBjpfsG06JrL59KOU+Uyf15lXaCja8qm/h+HipTZ/Du5KxSUw7f8
         ipfxtuyubumE1AHktxqxeC21PO+G3alf33Pc6Uq4aZX3vlHjVdR2UhdJdA+22tx8YvTV
         pskakovS9WyvSJlrdaW9fjKsENtN+GfZPhaY8EZiuQIaIepca58Ys7iHZLhP939usp0p
         A8LF4E6d7GR8xKYNIZb5T81jwZ9o8lOi6NoXdBui3Lami5tXUVQmvWTAncsSltzJG5lH
         F6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904198; x=1766508998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=CW9NiKEl9vTrKc+bqzCfZQFt7GKuPDlsSUNVjZ5blFnYJjOt0Gd7/U4+5Ot7sZqPpu
         IyXs3n3X31i/h9CgIr4LN0Gerzj2V8AF+9n5MuJOyOiGsVxzAFDm3AtVGfXEzj5HTXFL
         KnGYnsg5ywsL7gOeZOYMv2zEMxU9s/8vrl9HTd6TulpSjfkAnVbhp/5lNtiC1Dx7i20I
         5fgyP6HSvNvrawfvZomjqWsXI0+rxT6yyYjapXqucTFlZln3U4q2zB5aWANVzqENeFIk
         hFfqyG0GAl53gmwElcEBcWMT7F45F9En/chJ36I00Ju6tl8KnN++RnJ4dTkHZaOKP3yv
         rz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpXoXCmy5pBNIceAdFu7Fg92kOvNobQz2fIg+J/Dq6AM2LWK/7PRr3sD5nLKNMTc/cxXJbCoT+wUBcTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9KUwlWNdWm8sUB5im8dEvm1WKBpbKAJTTKzz6Ru9EzGvvi7bh
	kMwt1+1iA3JAgSLCHDoDV2xSMtkORFWWYiYzSwGyUxiikf6y/v4lpFW2raWMLYTf5bWFWtao/qR
	AmFlBizWKvxQ2FJTmAgPeLXlxGxABpZTtuZi04xnBAQ==
X-Gm-Gg: AY/fxX6obfCfJHZ+58DD5ouuFbad/etGcjn+1VHfZ+WlO1imVhf83+qmrwTH4/6xLuY
	BpRTL9WZGKxaPvKhTCbvjfZl9a1Oouf4x1gJYkphn3pE/8Q/a4MNxMlLP14Qbp7Q0m4TsunMBJu
	F2VUSXwjWO78RpQ4rrr6hXT8+NzwGCkxauxK94VQezElorMQmhW/7Wtm9z8c6+7jzvRh8eNWI2a
	gJyaQAq8pGyHRTLqtUNRnI8tWIHUUa5WJ5AHHZtCANpyA7ptLC0ux8vNaTkkM4v3jdWln0I
X-Google-Smtp-Source: AGHT+IEe8IRzlnpv6us5Kh+xr3yaMQ8uOrd9bT9YETlEwP5WNPrUGdjkFlMhzeEA5DOez3HUYl6RwAjZzXtLufIttIA=
X-Received: by 2002:a17:907:2d28:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b7d236ff5fbmr1632649866b.28.1765904192972; Tue, 16 Dec 2025
 08:56:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <202512161628415e9896d1@mail.local>
In-Reply-To: <202512161628415e9896d1@mail.local>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:56:20 +0100
X-Gm-Features: AQt7F2rO9yn5Ak9EU9SF12LWH7YDPd4rf09lvsuy-j2tIJy7_yg0e1grszJzZqk
Message-ID: <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
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

On Tue, Dec 16, 2025 at 5:29=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
> Both lines of SoCs are designed by different business units and are
> wildly different and while both business units are currently owned by
> the same company, there are no guarantees this will stay this way so I
> would simply avoid merging both.

Hi Alexandre,

The merge was requested by Conor instead of adding a new binding for LAN969=
x [1]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/{atmel-at91.yaml =3D> microchip.yaml}       | 7 ++---=
--
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >  rename Documentation/devicetree/bindings/arm/{atmel-at91.yaml =3D> mic=
rochip.yaml} (98%)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Do=
cumentation/devicetree/bindings/arm/microchip.yaml
> > similarity index 98%
> > rename from Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > rename to Documentation/devicetree/bindings/arm/microchip.yaml
> > index 88edca9b84d2..3c76f5b585fc 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > @@ -1,19 +1,16 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
> > +$id: http://devicetree.org/schemas/arm/microchip.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Atmel AT91.
> > +title: Microchip platforms
> >
> >  maintainers:
> >    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> >    - Claudiu Beznea <claudiu.beznea@microchip.com>
> >    - Nicolas Ferre <nicolas.ferre@microchip.com>
> >
> > -description: |
> > -  Boards with a SoC of the Atmel AT91 or SMART family shall have the f=
ollowing
> > -
> >  properties:
> >    $nodename:
> >      const: '/'
> > --
> > 2.52.0
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
