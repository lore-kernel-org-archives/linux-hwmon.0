Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308920;
	b=TsQ4mkf48xNET3SG0YQPErur2JDdKLuqzOgVT+mfxtUwol/ZUYfzn1nuWqyNTeCilsR3
	 L0NkaSnDoJ/iMWXcf+eZXaLDIXw28eOLM+pd6M2k+WNdWl4SwdH8ceE0RVzrgBo+8Sfa6
	 Stp5cSDA6KCsdbdsjXjlhKSgIg+m0hPlrYD7BfDmUMf9aLNW0Ij/D91e1E5dWEZxq2Yz8
	 h4OWebb271eChFIsWCqm6cyv/M55hX2Vuc+bBas04q+EDa6iHY0iQVuCBLsTWFW78HBaq
	 NZ++2RO2H6EkiuT1ILtHoFH9rjdtAyvATVNfSzDDJz08cDpdr49itmrYeCeTtq9BqBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
	b=RJJTr1i1ViqRdm1jKK0uAIR7v/L4dBUhubY/z/t8Cd0mddYelneB5Fp3fDq1ktZ8m51l
	 BGUzkWwLNZtt3jvqVgs9hOP6be3v6hoxTybqtZDkAVL2yeS5UfgyPrLJucYIzmpNcKkPE
	 0CIDHB1h1LIWRmkJ9/2vN1z62LRdE/4nT8PVqeyxVTlIrFuPfn1DQMA0fnIN/dZbcUboZ
	 cjKGQlFVDB7lAK/vGC07YCzA+YCuosB6kGBZo3Pj79SvJ05X5DktoxBr9haKRHRcgP/75
	 JamB945QpgIOu5A0ohrD2Lq2i18EBdalf314VzrW2AMS1dMZEhC+y8Czl2boUxXslNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D8606A326
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so2445865a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 03:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308919; cv=none;
        d=google.com; s=arc-20260327;
        b=bixGlrL6Xfc4Mzc2tUfxGc8FlLjLVuVj9gD4KThQf7ZN7km/8ndOJTp3Nv6dQnmHoj
         /8R5w4C4ukxdEM3G8TP9cSxUCUfnNpnzKdDRt6kvJkDZTLkT2woex2yyjyBzaeqzMQIi
         a0to8wR6mGWhKue+veWJOc/gD+udAy9TeOC6MbEVCtAtoJPqlbomJWBggMePDmcyNxCz
         dhakvY9tRIR/D2MsmwZXMwk8lYtXleywq9BKGaitfzsUyzwbdBzNQmib1Z3Hbzg/HI8i
         cAJZXGAKSrQJOdI5VkR/iXQrP08q5Nx4fVI4Xtx/vkTkB/zeVJgbX07X0FgJnXL7x57z
         h81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        fh=gJ1xQw4B754HEWgpbh0t3MwkPqulLNZlLMOYVxkLVwY=;
        b=cwhsP+jch7Oljc1Gkt1m9og4zmRwqza6IhJ0xQxsqf8SaO+E5z0LjPR/ELxKqbLmEa
         VWkLlAU91mIkD6SZ1gA24QCDUS4R7ZoaxHXaUK4axV0Guj+OMdrij9MW3j8ZS8g5wKbE
         ++ddvC1p+HuscbUNzgDBC2MnnFr6JMlo3jVIWdGK6gtw/X3qZs5wobdKjL7PkG19Ci3y
         9fOBbLt9h72H2QR2/crgqnXvmaiphVOEK6MfbgVVEENDSKf2B8QTOfYEQuQgoosToXKO
         wXOcab3NDu2pn/cHtC7gfnY9+5sfF9vseoIU5ONB4Qiy0w6JFVwlqjTR1gcHBDFocaOm
         inAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794308919; x=1794913719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=ATKIgBb3COVMm0Tw1w7BDFap2wFE6VMsRLY2235EcBgQAjfRBai5tHoO3eoczAZeoI
         xPdVkX39CeT5yr1cYxHCog+l7w5Hwu7wkCc0QnKOYyetnIk62HwOV/jznD9K3sSLeJt0
         Z/Kzjl9Z3GVZIBudJbyaTUK0lUVTxZaDxnmta2GG+H3zek8cExt0msDIAvnFHFSwods/
         ObTfA9iFJRdlGC7NNUI576c2U+/dUHaVlleic9c45qwALBXEvrhV/qXUTrS8jNDd3IrV
         X5mjz0zyizKVWEbVILgr5V56bXtHj5pSivuh4rxQ17Y54pUph1yxkZB/nGpMZO62SgLM
         tsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308919; x=1794913719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=k77qwcmcwMUKXYrwjBLnGpQsSW6HHmYkFEvN9Cy6bIeVjXGHfs8ZaMigcbXIbx+p+y
         vuRwPosQRSIDa7jbI4UWc/OPifwF1tyEk69o8k+HaIGXGoL28925u47WXpTYeo5DTpXL
         WI0JroFK93xJV9b+xbAq/j+bSQy0gK0SvPvUD3/6hiFOj2GWMjxE038j0vA6P66yNctb
         sjL4smttmK8aDnqkX3EiQfZp6Su0rXJR9y/lD1+NbcrkrFOal98bBHUnlQk3p4wCdoSX
         ehMbnTwUIEjI2CKQzrKH0XwbCPHIGKBV/Ms8FB5Um1cW51AxjeGNz9DZZoRqgixZEXYj
         enRA==
X-Forwarded-Encrypted: i=1; AL+hErEmzKL9y58mkFYsreyP4TLuruVAHrChN3/TVOw+iSnktqVGZ478uBKo5vrJ+efpWTQU8heeOlWR2LylFg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+O9/P4PqLp+iSlSmpBD4frdWmLCn27kn6MrlEDFB7E7I9hJyVF
	UF8qdJ86676Xl2+pnSNH8tJPot4Sh7weIOvDdyrvnjFf0Y8xY+Kes7NeXoCPqu3h/IS/NOqa8GO
	OjynK52l/CTPAQym0A8XU6YhjRh1o78YNjGlBqg3c/g==
X-Gm-Gg: AYBFou1yBRuFNa3Sbn8YwQVSjm7V3yP+cM1OUFcf20nr06h/P6PziwIB+iQwhP5w0Ew
	ixRyqOxUeSwD7QRpa9DwqQJsj278I1U26JY09z2rfuuN4wRAkpYfeklHBnPNdt82UketJoJcM+4
	xe5hYcPMC/l9swkIoqmwGVFU0TNbEHelGPSA3/IbcDBZLDg4/chVTfwK+VZfbl85wgeYeucnLC7
	KhlhKs2n/qZR0Axz/FcCYTF6HTGtZv2xsrfQoeCmSJTSl8ZGs66ei1hf92UZF7HZy2rgbPHilp6
	130GePxYoM/o27vcP1HHzzysV+9It4vUvOcnsKyOQiaMAsnUu0gPFcURA3RFLeXFfbQFGu/W5qu
	Bshu8T+JTO1mWQbfvg1rEz3eahM+aP/Ki+vIkcuC/Bd6KvsiUQlINedKpikFGLXBr2ZphwG8wcu
	jit9XQVpkvYbpLYmHykgh+tlnmibALdrVKpBvwoM1JObkOc+MYkhYSSQ==
X-Received: by 2002:a05:6402:1d54:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7564f6f76mr2116289a12.31.1794308918607; Tue, 10 Nov 2026
 03:08:38 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261109-mulch-mountain-118fd114a797@spud>
In-Reply-To: <20261109-mulch-mountain-118fd114a797@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 12:08:27 +0100
X-Gm-Features: AclHuK8rAj1SvZu7uW13wrFXg8Ofz7g_PIsRsWgsTldu6tOuG_htfxW5SgQtu6M
Message-ID: <CA+HBbNGUig8q_U075xXc62opOvK7wz0er1c6ROxGnKYKTrwWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
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
>
> So, I think that this device has been modelled incorrectly from the
> outset. "devcpu_gcb" should probably be a syscon/simplemfd, as least
> going off of what I see in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb
> and the fact that we see silly offsets in the dts:
>                 reset: reset-controller@e201000c {
>                         reg =3D <0xe201000c 0x4>;
>                 };
>
>                 gpio: pinctrl@e20100d4 {
>                         reg =3D <0xe20100d4 0xd4>,
>                               <0xe2010370 0xa8>;
>                 };
>
>                 mdio0: mdio@e20101a8 {
>                         reg =3D <0xe20101a8 0x24>;
>                 };
>
>                 mdio1: mdio@e20101cc {
>                         reg =3D <0xe20101cc 0x24>;
>                 };
>
>                 sgpio: gpio@e2010230 {
>                         reg =3D <0xe2010230 0x118>;
>                 };
> That ship has sailed I think though, so I'm not going to ask you to
> rework this whole device.
>
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
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#pwm-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    fanctrl: fan-controller@e2010348 {
> > +        compatible =3D "microchip,lan9691-fan";
> > +        reg =3D <0xe2010348 0xc>;
>
> btw, how do I translate the addresses you have here to those in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb,fan_ctrl
> ? Or are you looking at a register map in a different form?

Hi Conor,
Microchip has cml-utils, which allows exporting the registers and
masks automatically, its part of the public SDK.

Or you can get the address from the register map you linked, its just
posted as word addresses, so multiply by 4.
So for DEVCPU_GCB:FAN_CTRL
- default offset: 0x38800000
- DEVCPU_GCB target offset: 0x4000
- FAN_CTRL base =3D 0xd2

And you get:
(0x38800000 + 0x4000 + 0xd2) =C3=97 4 =3D 0xe2010348

Or you can just task your LLM agent to do the math since its quite annoying=
.

Regards,
Robert

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Cheers,
> Conor.
>
> > +        clocks =3D <&sys_clk>;
> > +        #pwm-cells =3D <2>;
> > +
> > +        fan {
> > +            pwms =3D <&fanctrl 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --
> > 2.56.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
