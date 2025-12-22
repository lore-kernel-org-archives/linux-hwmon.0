Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E333B6F9
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Dec 2025 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433449; cv=none; b=XqPMikei2f9GI0UXTwcr29DuYgO8iUc1UY3c3zJ640WgjwnbVDpW0zEMVCPy5ZO53EMOroF2XHrG5HO9luXdj1t1k41fo3W4ww9yXpCdZkQP25pY7Nox77GBayJQSklBE/RM0YjJbSHgL5LAszUTfVtoULkJunyMpRFj2PrbxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433449; c=relaxed/simple;
	bh=gqq7zNg4tUJJ0SmUCTR/rfb6bSKF7C5JMh5yMLNWhsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgWLhntH6sCY8LXX+wXWJTMHmtO81WWMQHDuxmd8s7TQXio+TfhbLAaCakIbRs9HKvHpTruQmiT1bL/YoYmx5AL6IwTDUPWD2Q8J8XM+kygYe8qTJ+zoZrNePUJVGzi25VrQ9epHJpIpVelyK0Ltg4xOZfjpmYZ3LBrkZs4OQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=pFZJUB+P; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="pFZJUB+P"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7636c96b9aso747847266b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Dec 2025 11:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766433445; x=1767038245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1Ffz7SUjA9uiSla9hHoS8dAeCi7tewQV/vP2Eehn8A=;
        b=pFZJUB+PHZWLjPcQpowiytkshEGhxGj5eXPYicVBekCOyv5edtd/D/8QBRD4WducvS
         rVpLJLuIAiUIWS2Km205Ah9T/sgmRQOZ9OER7gw0sEWH7OPUrzpo5AnmT6KDq00vmhqT
         rBAs+UNDSUzDVSyWeqrZ7/t88wbpQXA7+rjHwGcjOD8V5mBeydw3VSesk/wA0KPiQC2/
         tjj+RokSHTTJfyDwGuAWCGrrUkqM8ridBPmhsAs205vnT73lATgHhsCYpiusiPmgDrnx
         3SiCZo4Noj8qZLChLZyEKiDBavbPc5IJU72tnwwaSUuh+9kbmKY3J/twONeia8BofiN+
         Y9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433445; x=1767038245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1Ffz7SUjA9uiSla9hHoS8dAeCi7tewQV/vP2Eehn8A=;
        b=mr+9R4KUdNB+1XTOGK1V5hfrdDeejB/fEhVwk7g7G8v9kb6deZSbUirO+IVdqPQeLB
         qT88+aJp3WNIPbfNCiouhrbYKct8rhhbHbT3uH2q+mxTNSFtxsVIwL4NoTDKFyiUfToK
         m96XOOChwT735dDe6pxUJvOoadL9miFg9VDpfHEJCi8t5iry8kI7hBgKbW/BIaRXLxkr
         5zGc+8Ftc6pxTgNs0G37Xa0QfEBszBpDCcnien+8n78hns13rhSOiLGxNlVXj6h/4/mn
         nqxIrPqs684EuK/Jo/ZefF1oPwwaPhmz6S0qiOiweNLeWHmYYSRQ5iBTA4dr9gmAPwWG
         tXkA==
X-Forwarded-Encrypted: i=1; AJvYcCUG3wUWnTU7+LGkLeVPpglEF8JwZg8wmhvF54ODKulntp+6RT9FStKM7r/nOzIqZywVQv0P8vE9YiPyvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBsaOYqW/dd/Cl6Y368J8uJp6HoC4/TA/BjHWJg27M915yRJa
	GIIfkgYusIY3+lfdV1/Ey6CpbkeeXg5bNOAl4yeMArwxZQiu4G30OILyAi3WCyqdQpk5ysRDAKU
	ftZsNWhenae0UoU+uSKghQu9k7Zlb/4hvM74QiJr07Q==
X-Gm-Gg: AY/fxX67oy1ddROp0g+FIWZoTcpkH5j012B2X/ZKCi7/V+W2b71+OEUuahWq/g5d/Z6
	Sx1cuhfY+sB60jiUyo/1o9jeXNZIV55qgO6RTfd+oGYz/vVI0vBJtstfwi1oVxO29dr8602zKhr
	Q+Jv/M5pv/RH1fG3SPBJngxpw/DalHBfVgIBf3hKx+zAxAPf9PKInNGydb6U1UBn1gWdMJ8/XAf
	RNg6CbfiOFPXscQHx+JFMoYLkVQpvdhJoX1KwM4upAm6eqC6ilcpB0RfZ/InTWHNC2nDwy2RAbk
	88VbXXzQzR2tnw9Ni6oDR9VMLrwQ/PXvETUkhgPYmY4tfbG5yA==
X-Google-Smtp-Source: AGHT+IEdtGGJL6owR7mmmwSv2zTvtla84ek3MFk4eZNiNP2lYiWN2sfcs6M8h0fxDoYpaxxvqE+4ieXBeUSoFs/4WBA=
X-Received: by 2002:a17:907:3ccb:b0:b73:8cea:62bb with SMTP id
 a640c23a62f3a-b80371a3d87mr1355933366b.31.1766433444769; Mon, 22 Dec 2025
 11:57:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-16-robert.marko@sartura.hr> <20251216-payback-ceremony-cfb7adad8ef1@spud>
In-Reply-To: <20251216-payback-ceremony-cfb7adad8ef1@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 22 Dec 2025 20:57:14 +0100
X-Gm-Features: AQt7F2rDm7ZgyJ9ixNo09GJcdYbsF1DFNHNC0FIPR01SjncTPp1tTulCOrRyRyg
Message-ID: <CA+HBbNESUZ6KB0BbpZUMfh1rjZTZMgY1SwmFQbx+CRP+a_1x9g@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Conor Dooley <conor@kernel.org>
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

On Tue, Dec 16, 2025 at 6:34=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Dec 15, 2025 at 05:35:33PM +0100, Robert Marko wrote:
> > Document LAN969x compatibles for SGPIO.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5=
-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sg=
pio.yaml
> > index fa47732d7cef..9fbbafcdc063 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.=
yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.=
yaml
> > @@ -21,10 +21,15 @@ properties:
> >      pattern: '^gpio@[0-9a-f]+$'
> >
> >    compatible:
> > -    enum:
> > -      - microchip,sparx5-sgpio
> > -      - mscc,ocelot-sgpio
> > -      - mscc,luton-sgpio
> > +    oneOf:
> > +      - enum:
> > +          - microchip,sparx5-sgpio
> > +          - mscc,ocelot-sgpio
> > +          - mscc,luton-sgpio
> > +      - items:
> > +          - enum:
> > +              - microchip,lan9691-sgpio
> > +          - const: microchip,sparx5-sgpio
> >
> >    '#address-cells':
> >      const: 1
> > @@ -80,7 +85,12 @@ patternProperties:
> >      type: object
> >      properties:
> >        compatible:
> > -        const: microchip,sparx5-sgpio-bank
>
> This should just be able to become "compatible: contains: const: microchi=
p,sparx5-sgpio-bank.
> pw-bot: changes-requested

Hi Conor,
I have tried using contains, but it would fail to match with the
following error:
arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb:
/axi/gpio@e2010230/gpio@0: failed to match any schema with compatible:
['microchip,lan9691-sgpio-bank', 'microchip,sparx5-sgpio-bank']
arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb:
/axi/gpio@e2010230/gpio@1: failed to match any schema with compatible:
['microchip,lan9691-sgpio-bank', 'microchip,sparx5-sgpio-bank']

Regards,
Robert
>
> > +        oneOf:
> > +          - items:
> > +              - enum:
> > +                  - microchip,lan9691-sgpio-bank
> > +              - const: microchip,sparx5-sgpio-bank
> > +          - const: microchip,sparx5-sgpio-bank
> >
> >        reg:
> >          description: |
> > --
> > 2.52.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
