Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5001430BB98
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Dec 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486112; cv=none; b=o7gT8vQ9PBlEExJ2nku6E/QYwQmURYhEkRnA5iN/CYT9Z8TVGy5gfNiHA9/xkxXS78N/tZvQn1uWFZBuIfnwznGS9tCAGHeKwP1qvoTvx2DlPIZLGuV+zTbacwLuBptmnj6XaPE7qTKsYXA12F6wqJdXRO8nqaDdZuLn6eCwQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486112; c=relaxed/simple;
	bh=nhnhn/ujbA1yivMUlMSXRd1v6Sz4LmmXkvWUytEJhUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdbGl52mTif7g/LCUZah1w1CgHQKTx04XtczdVnV+WLpJ9K8cwWwu29AzAOqSUx66R1IY9AiziEeUn3EwLdxlXU4C9VoNVSSn6W1IqU3Mb1v+aX9GBrtLYcqo5857XNdIKjCbjl6oEd3N9oLh11RZGPQtzZlfkRuRsKoTYuksUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=GF2uS7wi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="GF2uS7wi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1013743566b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Dec 2025 02:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766486106; x=1767090906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWwHgDUayFaSdSqe2T6d6UFJFmjd2ZLae5KHc+yXH7I=;
        b=GF2uS7wiRyhBmf1kLR0gIF3Rip3N0z7rurwMgvhBqXkpElhZHM//c4ztfkOfl34VXQ
         1X14GkorXLzezj84xr2Y/dQLW+EfbQhQVOVhtnuM3M454FOIn2PNXJXS36N8bH/whQBV
         zY0fHit1GfAmUbUyKlPfmB88R6AoVgxYJryPviR3Xhc9pr/mmX1utNgHaFZ5HiT/+TFT
         EPfJeiatuCcTI+Wko2Rrfq/cDBpi0ycNUhFAp5hGmFIf/u3Ol72pdr/MxF3qgwek5A2i
         SlQTW3sCFS0UxINftvR9ief03PbV1fiyjZferC+QgdFvMpknr46FIg9k8YC+cFlkaq8w
         fJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486106; x=1767090906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWwHgDUayFaSdSqe2T6d6UFJFmjd2ZLae5KHc+yXH7I=;
        b=C2nNWRftnB3/tY/i4X/P1KDlPo/qNXx0stAzILTlQ0AP4Hu1RHx1CyKV5txwzp794x
         oJwcPYV8YZjtg1OHfGVpJ9r4296hx5j0vJxEGICLRphjZPT7MIK9y67I5AiKVtMKY260
         WxBNMdy1vlcZjg+wFiS7j17+YMSIGFbMYcOt8wTkG4hZEMkcWvmPgc0OulaAAfrI2hug
         MmhmWgqWtChcvKQpNJoljoOxauRvNZbDDQiqlyNRvcj6+9KB0CFU4EanqgXX6eyDybUd
         jegNgEPQv8nI1S0+1Q/7VoaHnlBxbRj9h6Fiu1kqHhIhobBwF6K4WCrrMfwfdyzFYzz2
         mO1g==
X-Forwarded-Encrypted: i=1; AJvYcCVcd2JP2ZijPNHnIU4WXLY+GyjlkrIi1sxpI8ia3rTmlgYRZ6pAupO/VIEnIOX/4JNY/0B4adc5bdwp1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJwtT9eEfyhyjYkgMjwf/EjAn9AEAgMeZuxuvQHfD/35oI2KR
	U8MEZUf2/2AoVKpRM4oe4t1bINXFn67ef0KOno0L6/a8scW9vorCitA0qhOymXe5U7sgJFeKr8w
	Djfrap6WeGoFUOEJ+v26IZkYyxaVvRE9ZUVi0PhTA4g==
X-Gm-Gg: AY/fxX5ZKxmqBY70W2zwNyFIjrQjq0IVKNlRZDCCqbYMt/ULiqqHRZ2sxqbh96AG0fN
	wfKcyCgdwVFR0DcP8Q8nxox7h7sn+ReMSnDLfJNMLMmpyvIg75AkZM8wNDFye8gxDB7qHXa7ERD
	zMGEMMUco/2OID+zsDonue3o2BWVzx5pJSSh/+gNQQgdTHZMHetqjU4FfdGl8loBy6+crtqhmYL
	6o2Y1XXaaQD97EIBN7wmxIX1QjcU+NKdhYoXkVWuCuOVaBdvwBPn+RWoId9i3oQpj/BJJd4w6R9
	Z3XWaHUaDn5knXP3umCuMm7402BSE51SH43ECIUon5fl9E6nkQ==
X-Google-Smtp-Source: AGHT+IEJHssgBNa10sdxlMZ0RfBcXjnBKXrp4KRUpqNBX0cKMLRNtJZXOvlDmXwgBRgg1wr13xel6K2BxjWOkHuOL+E=
X-Received: by 2002:a17:907:a45:b0:b81:ec7c:31fd with SMTP id
 a640c23a62f3a-b81ec7c321bmr332573366b.13.1766486105902; Tue, 23 Dec 2025
 02:35:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-18-robert.marko@sartura.hr> <20251216-endorse-password-ae692dda5a9c@spud>
In-Reply-To: <20251216-endorse-password-ae692dda5a9c@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 23 Dec 2025 11:34:55 +0100
X-Gm-Features: AQt7F2rp1ybXWw2BWzfekoJJeczrMeV1nO2lvHuguNeXKU1awsBcuKjFcFE-_B8
Message-ID: <CA+HBbNF-=W7A3Joftsqn+A6s170sqOZ77jpS105s5HPqkskQzA@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] dt-bindings: arm: microchip: document EV23X71A board
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
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, mwalle@kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 6:32=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Dec 15, 2025 at 05:35:35PM +0100, Robert Marko wrote:
> > Microchip EV23X71A board is an LAN9696 based evaluation board.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  Documentation/devicetree/bindings/arm/microchip.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b/Doc=
umentation/devicetree/bindings/arm/microchip.yaml
> > index 910ecc11d5d7..b20441edaac7 100644
> > --- a/Documentation/devicetree/bindings/arm/microchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > @@ -239,6 +239,14 @@ properties:
> >            - const: microchip,lan9668
> >            - const: microchip,lan966
> >
> > +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> > +          Ethernet development system board.
> > +      - items:
> > +          - enum:
> > +              - microchip,ev23x71a
> > +              - microchip,lan9696
>
> This looks wrong, unless "microchip,lan9696" is a board (which I suspect
> it isn't).

Hi,
No, LAN9696 is the exact SoC SKU used on the board.
I will drop it in v3.

Regards
Robert
>
> > +          - const: microchip,lan9691
> > +
> >        - description: The Sparx5 pcb125 board is a modular board,
> >            which has both spi-nor and eMMC storage. The modular design
> >            allows for connection of different network ports.
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
