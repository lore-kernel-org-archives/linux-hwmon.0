Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399730;
	b=ZMbAlZFzs3Pm11C3bOAA2h7PvQEiIFk+M6kc0TmiIGthZ2W+VtzJBAiDjjHmSwR+gBHg
	 3vuRF+Q8XfNATsdW4GV7A/RfDuJBza9i0wHldZUCpOKNLTjUmBgfRSAmMEQp12CzLR2L5
	 FGg1uVRBICyjecv435H/Cfmb/XfFdjpdicBco76dlPSt2iGm1RHLrRjk+ajYIA86fTs0O
	 qWaI0aUXv8YpN8KLD052vNGDUQUiHlFUbOYmgGYvJrFdBcwn5fbr8aRIUBk84iHLhq8Lb
	 FHP+92jXnsvE0SavNE3eO0zVcURqYVSo8vflWSPEQecPzKPE2WVHXpGi6a4r0WbBfUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
	b=y40cqYZgv2Ggqjs3dGp7nCMX5fw8wyocri0P/zGtban4Q6hbEPVRRc47b/WX+4RBsvUc
	 dxCzpL2E4iROX484KPWqu+JeqB1trofmwgRDFWmgSh+N+FaEm3mZTRmdaOg6gB5r/SOHJ
	 3xP3HiTA6msJGxpAEPmcQZQPEAwJIIYqrNI8nkg6D4LtE6Zj9ZFNPYwyFDn0UX9NCldyG
	 prl1c3MmQyVnH3Wa6yjZZ2wrBcjAiRJyrU/FCP3Ri99i/bkJtRreCiu6K7uR/I6SiIhRT
	 imXAsRZEAbnu6UodjkI0MTuyfT+kCvEyq2N+hScE8TInJQTaMKin+vaFv5VciKchFYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CE606A32E
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591CE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so4095538a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 04:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794399727; cv=none;
        d=google.com; s=arc-20260327;
        b=ffHrkD+gwIeq2e1G/u1B/LltGE6k6dP7jzhBnemiND/10JGLn/hL/iPTxCGWHhsDqb
         kssilUywGJkzS2id1C/ZNSDDZKVYjlMlF1eceUkR1/iftrsZHAXm6hEJVfK+ABCFSa8V
         o1Y5hYZBYY2YBkLiAib8UszoBML3otL+8MA3tYDxgVvN94XOgvo473y2G61YVq7souBp
         LTFxI9DMr+EujmtwJAkYTwA7clwIduMbtFJxUtL1mfc7tZMHQyoGHqIEUSx6pxYPMa+i
         smPljZVk1Xprv6UgFDRDlzUuFK9eBNXPecE5wzpRLnWF3G/0x4DiKHN2QekAkad7ZDjD
         YZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        fh=p8ScKQZtjV+QJgVGpaRm2OuO4UqPXNXpwJ+lcz8470k=;
        b=GBZicSDah+MyEb9FgGaDCe4Ib+Meq8y9w1GuMHaSd8Pk8VHaK1Saeqj/R1uN9MBMFC
         fpXRfgR35bQW8IRxMEo81la9VfMNw094KYq2iZFVxK1uPWSSjIpldbT5yGip6uGLkDf6
         DUaKYhwUkcLEdwNwm6l8ngJVNhCKy0nQN0NVmc3qTdCn82Zm3mPJkeQ4667rv1zCX++u
         1H+v/NMOfZxS8A9OCzXHBSrIy4vpt85qJRv9rJ0dBNSfFVhOlTxQh0gCaTA9D1TTwQ+1
         s+1+GcMJvtDrS5/3LGvhnQEd2kB9Z+PRsQJtiK2HwJDsDUFCFajRPyW5DCDZm2zPBOov
         I56A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794399727; x=1795004527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=v2fr2S1DGDPqqGLXJM0kfi9ZIPOyU1UGWmpu0npSnLbA5WBR6hpH/rG4VU2hltU8zS
         za8CRsV2O3JrFsFAay/QLnZET+MOOqogxpuwOCnkNqfpmQ1OOjk6EHCFNLyYmjNRHzxx
         TjP2pgMjGCIpG4tTyOZQcbXI4Nnc6nxvSqEiTiO9cRC3v2Jnu9cqa92QLc3o61kNV3VX
         WVc98vaFKG2XP3+d7F6GrPJEPBz/iC8AXu7cLYI90LbSCgcfRB2tVGGcX908son6zGil
         OfTYJPETnoL6UbrB/bGrDwnZFdamGY1XML70HVqyz/T9w0IzqnV3VYZ+yUaWUciFuudI
         n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399727; x=1795004527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=UdnhFMBDKTQ8HAU799KVexyfahgOmHdf2g5jJ6/qY8liqMp45w/uV1ME89gHC4clhV
         qY3g+zI8QDoGZM0XtU3GWuM36EZHU6X59SCV0yqbR5PiA+jPmA0syGkLdPG4at4MJp73
         uUN3hKWPVYvrXBDbRiEHmqtNOfzCzg+nDxWRWU5a3j5EY7+jcrqSNBqDgZwnpZpSQcTF
         hcsh32nQze9BZZNbWpgqz+9ZPDP4RSWhWJ0kycuPPQ2ZJx3k5puWabfjylLerpa+oNf4
         8NJ1y7lQhyTCdo54HZ4fQ+TrysIGbMaoXk2i/6/wn1HAn3f4YwoYpg9oV6pvPrDNoCn1
         wNXw==
X-Forwarded-Encrypted: i=1; AL+hErG7y5I5/0yXHoTxCKcSB1T4io/e0AlBToDMUY9ICatevHkWRkbrgxmswJ2ZeIkwhLaEjeExpxTXKi1idA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+2kNl4W8QQPiHnRnGFqIcDhl57NSTXDQp1ggt8MAMTufNNjReF
	jLMudlRiFP4hhVOfzVCtRrRrnmJ4LPkJgTpw6JwmhTRpwYF8ab2mERPDgFjQ8Sl+QMT483s7ma0
	vpFyIPajBSF3CasJ5wwwwNkdKapO7Wms5QY0hxgz3vA==
X-Gm-Gg: AYBFou10nAaTJrbDRyyX2hupedkPteH0PSqHo//2NSNTBClcwEPZ6i4xWdr2ViG6LFt
	HIn0X/wFGMLwoZsXPiXsUFgnqty09ybr4s3nJdRk5oZA7K79AHArddP0FY9EincSD9JKPYmsvha
	pFjInkdvmtnfCgwNBWe0PTphIHdkHI2rJpoBaXocHIAWO8wKn6cAFleeT+3TbsNe40W5I+MDmU3
	H6ALDolEGOd1YrhiRINVyNSzny8z+lsGmNbKzps2YVNH0ldukK1RbOEXMNSAsznti2NJwavPpat
	MEmb2zitJ0TKptF2j24lfm6TJ0Tav2vwXOZTvykKoLhb908fK/y1lUtvCJ1tH2lMF3pdUaB8T3G
	2BdwXtYTbkwi3EyojFB7iaNCbEK4hUKF8L2GstvLGfi2xnSlQ55o/nVdnbTN3/q4hdZ6dO2Qxhg
	f5ZsEtpjKFaDX/eGYUqmom/RsgLnTu/uZglF9e/0XB5WEPOYZwrXrq0w==
X-Received: by 2002:a05:6402:2b92:b0:6b6:eefc:ae78 with SMTP id
 4fb4d7f45d1cf-6b777341867mr1845043a12.2.1794399727628; Wed, 11 Nov 2026
 04:22:07 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261110145414.GA3828324-robh@kernel.org>
In-Reply-To: <20261110145414.GA3828324-robh@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Nov 2026 13:21:56 +0100
X-Gm-Features: AclHuK-NDRpRb_jYg5FQQ5B5fgUCjjm_CP_VsQUIeOlFZDuAlC2eNYg1mYw5Bfg
Message-ID: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > The LAN969x fan controller has a PWM output and tachometer input in a
> > register block separate from the Sparx5-compatible temperature sensor.
> > Describe it with its own compatible and binding.
> >
> > The optional fan child specifies PWM period and polarity, tachometer
> > pulses per revolution, and thermal cooling levels.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > - Describe the fan controller in a separate binding and compatible.
> > - Keep the existing temperature-sensor binding unchanged.
> >
> >  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,l=
an9691-fan.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.ya=
ml
> > new file mode 100644
> > index 0000000000000..0b7d38a6d20ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yam=
l
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Fan Controller
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |
>
> Don't need '|'

Hi Rob,

Got it, will drop in v3.

>
> > +  LAN969x fan controller with a PWM output and tachometer input. The f=
an
> > +  child's pwms property references this node to specify the PWM period=
 and
> > +  polarity.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,lan9691-fan
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System reference clock
> > +
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
>
> Drop. That's already the max in fan-common.yaml. minimum should be added
> there too as 0 would never make sense.

Ok, will add 1 as minimum in fan-common.yaml as a separate commit in v3.

>
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
>
> The dependencies should also go in fan-common.yaml. Perhaps
> cooling-levels without #cooling-cells might make sense sometimes?

I removed cooling-levels requiring #cooling-cells, as it can
technically work without it, its not ideal, but it works.

I am not sure if its feasible for fan-common.yaml though as we already
have schemas for EMC2305, and more importantly
DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
that have #cooling-cells without cooling-levels.
EMC2305 driver even calculates cooling states without a levels table.

I would appreciate guidance on how to proceed with this.

Regards,
Robert

>
> Rob



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
