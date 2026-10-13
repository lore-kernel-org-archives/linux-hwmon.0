Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745655208C0
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911328; cv=pass; b=lcE0V4uPg2zdL8b5PQ30fLflBTrVkxOTm8PuxWgyxb5zTjZ/yo33c6Kp+TmuSk1CrxyZeP14BHwNgEDsdHEfS9CQ44YOb+LUccr809ENyPTLZ+MYl8VQTdap3umt2+FEFuPZo+q++BF4jn7eVeSnBCrYG90w1vHCi2hCPisbEVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911328; c=relaxed/simple;
	bh=2EjnKvFrsHd7xz3u3FLsyf8hhAt+T8peyaRydRnO0bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0Z6vobS7VS5k+1LU1iFZGxlpkLo35UOLTHyscGzVLK4DGqrRPJWlM03ke9VCLIZcoWSvRS9qMBd2Y2Xr8ayiLLKavftgKcb0f6uvClaHDTEqGKyCK3RYiv1nAgZSzpUB87TjmtDpJILo5QFSAEQiwozR3KPwzApoOm7l7NrEoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JdkOt909; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JdkOt909"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so1764183a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 10:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791911326; cv=none;
        d=google.com; s=arc-20260327;
        b=PcXJALUYLAzcLQ4n6OMTZq53id/CVZoPEmFxr0Th2JxpxMMIGgPhzBg+OLdsSspZVL
         NKPswICZ06iYxh4oWS5LfOcYFqSXevH3yi5LqU7CqPD9wuPQMBSP+pS/aIchShUUy19v
         YLsOOc7adZ4atee8zLUBT+9UPQ9uoppltd/U3XkATLfcKzCHIDjD3ZRf4FFG8LH48jzA
         Zg4wiGIIkf32MDRA0nbXUUjd2nVwpLeotVzJveyUO6YXvSgTx2ODPBJZQ7TEBbFM4nJa
         n1otg369aFJr5oY56sQ+NRiCJVoTbvtaGgqpzqv3KqUjiv+0NiIAA/QT9LfCZ+hjNqMk
         QHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        fh=xpKfJTbLoIpwrlccmK8QvZ7M9Tkh1jgP9MjqUSRk83U=;
        b=hqQt2UXUpovqlDMfW02z4LV/GxBuDuHo6sFT2y0M8PjjIkiXWhN4ctt1UFgi7EgXiC
         JwCCIHBe4IEiohPP+mNCY4kmUP443R4ICT6IEXaZm+rasrM/PEfzoYt5mMzS4LiRVvjk
         2Mi2MZyKg/mxNTNoR6r8DnrURH8vLk7Lk2BujIICyG9CM/jA2eXWaqOss1SZWQEBeKNr
         HtHm4E8gyw4uDUCUNrNDTbxFEoFEmsUkmVoBIPf2lmaq9nMvUkcTtCLVXLPbrbpphwg4
         HoBgaZudahv+MpRPTdoyCpA/q9OLv0ujZDOFIGfCxSUZALkmxuU6pvedMyHgWDVi6QwW
         ygXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791911326; x=1792516126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        b=JdkOt909zR6N0W/wAFCpGLxBesW1V3jwfJDcy4WGjQsWLkljfNR4aIJiHzAVVmIlLD
         UNzo5ppwDK9eUmw+e8INPT+A3z8HJ7oGqJaEYcTBhikQDRnbEHvQClZU8eE+isjJPQQj
         OGGtp7XTEYGqpS8HmaeHQ5MOO6LJDZqB27rIKy2CcLhAgx8X8j23M2ej2z9SZW1P7sXn
         PlQensYSlc2edSFj0CVzUHvr2GW3XN/clRuLugPnEkSDTboo9fR+9rWetNd+rgdjEaJ8
         OyuPy4drAUWTEzja+gWx7emAbyBAvp+d46WOj38VyZI5gf4TfmRbmkUej3/zDRPSMN56
         XtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911326; x=1792516126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        b=Hv2+K9x8HqBX3isnp2+mKTlynhDpMSyP7h9NF5PsXUlgBXJvdlf1JXIoJYFad2O0ap
         YI3lL5av3Z6mFEOPOHWleCWxInpFopFfjBR+AnPFmPb+wCxbGOGKo2sXbH3EmIvHejXg
         xwhXeZA92vFcs9BpxxXi6mIDSePI8/wtfa4hadiY6CSCUMCoVRdRh8b6JrkccnFVTS5l
         T6loGca3WHJved+PPwbhjEPkxKgmtPNl8jvvKE7QQi5eogobVwhQNRQ3UhJlp51HliIm
         BXRMzbf0VnO2RCR57aaI6tj43I03kjhK9SX2ojXooJQU7IVB17qN/95Vv0RvrFGujPn2
         8cFg==
X-Forwarded-Encrypted: i=1; AKwUvBzIXu2nWEbfVyDj/Ke1lGDo6YrTsvgOJTc5Zb1MbUU2MZ2JdHEvuWZgiixuM2jZdcpaLFlSAsrZWKEV+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqDn+Met8cyVZuvkKQneC7G54JlXLVj1N9KPv0KIBtWxBPiuiO
	KNn1fkK8Wx5FrRM1OaB71ZY5AA1IALs9jmZfMNeM4EMNMlAU7nKKJsKuB9oogRc1sdedIETp169
	g2091KpyA52C8KfBsp+HutJw3Als+2p6OGAvdZZejyg==
X-Gm-Gg: AYBFou1kcVI9ZJeHOlSVB7JE/PGNCVm7xU46moT5MymoiiU8WSyq3NLAFINTx1hvbaH
	GWg8oV7FpwcGO6eDuaE8OCTZHxyUsupddpwhbpXPPqcpwCXPSzX2e5vAxrUQyJE1KPzMw5yya1U
	lCzvyEx/GLL/iSHsY8VDXCrCDct3wtWgIxyenLUlVLDYBV4ZM56UF5hNazCNekbslIkrm9kAz+Z
	8rp3njc96HDI+mhhsfRefXQitHlMPcOH0BLZykgPwih8K66+Vq3nVLZcMqGc1F9TU0qmGFuhXOg
	k9S2NajRPbLeydNfP0NUuCnrwMgUStPN0loqI+IfTUxa4s3tSt9+lcZ74NfU9yzFMP7oRYMMhRQ
	/m+W6HDRRnww8azkMRu4fP2vyrzFl49BtJVk=
X-Received: by 2002:a17:90b:2ccb:b0:3ab:17b6:9a93 with SMTP id
 98e67ed59e1d1-3ab3afcdc6emr11412675a91.52.1791911325665; Tue, 13 Oct 2026
 10:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013125735.1542349-1-robert.marko@sartura.hr> <20261013-stylized-plethora-2a9e27545adb@spud>
In-Reply-To: <20261013-stylized-plethora-2a9e27545adb@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Oct 2026 19:08:34 +0200
X-Gm-Features: AclHuK9pPURsd7YCVT-est8rnkCB1X5dbN9hPBM8kNfyB8V38NvJe0-SENxgn8E
Message-ID: <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	lars.povlsen@microchip.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> > LAN969x integrates a PWM fan controller with a tachometer input in
> > addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> > hardware-monitor compatible and describe the second register region.
> >
> > Describe the fan as a child node using a two-cell PWM specifier for the
> > period and standard polarity flags. The child also carries the optional
> > tachometer pulses-per-revolution and thermal cooling properties.
> >
> > Keep the existing microchip,lan9691-temp compatible for device tree ABI
> > compatibility.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-t=
emp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.ya=
ml
> > index 611fcadb1e771..e91c2a3ccd3c9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yam=
l
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yam=
l
> > @@ -4,13 +4,15 @@
> >  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Microchip Sparx5 Temperature Monitor
> > +title: Microchip Sparx5 Hardware Monitor
> >
> >  maintainers:
> >    - Lars Povlsen <lars.povlsen@microchip.com>
> >
> >  description: |
> > -  Microchip Sparx5 embedded temperature monitor
> > +  Microchip Sparx5 temperature monitor with a fan controller on LAN969=
x.
> > +  The fan child's pwms property references this node to specify the
> > +  PWM period and polarity.
> >
> >  properties:
> >    compatible:
> > @@ -18,11 +20,19 @@ properties:
> >        - const: microchip,sparx5-temp
> >        - items:
> >            - enum:
> > +              - microchip,lan9691-hwmon
> >                - microchip,lan9691-temp
> >            - const: microchip,sparx5-temp
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: temp
> > +      - const: fan
> >
> >    clocks:
> >      items:
> > @@ -31,11 +41,67 @@ properties:
> >    '#thermal-sensor-cells':
> >      const: 0
> >
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
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: microchip,lan9691-hwmon
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        reg-names:
> > +          minItems: 2
> > +      required:
> > +        - '#pwm-cells'
> > +        - reg-names
> > +    else:
> > +      properties:
> > +        '#pwm-cells': false
> > +        fan: false
> > +        reg:
> > +          maxItems: 1
> > +        reg-names:
> > +          maxItems: 1
> > +
> >  additionalProperties: false
> >
> >  examples:
> > @@ -46,3 +112,21 @@ examples:
> >          #thermal-sensor-cells =3D <0>;
> >          clocks =3D <&sys_clk>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    hwmon: hwmon@e2020100 {
> > +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-te=
mp";
> > +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;
>
> Are these actually the same device? These are somewhat disparate
> register regions - and the second is at a very odd offset.

Not really, they can be separately configured and have their own register s=
pace.

I did not see a point in separate drivers, but we could model these as
separate DT
nodes with their individual bindings if that is more appropriate.

Regards,
Robert

>
> Thanks,
> Conor.
>
> > +        reg-names =3D "temp", "fan";
> > +        #pwm-cells =3D <2>;
> > +        #thermal-sensor-cells =3D <0>;
> > +        clocks =3D <&sys_clk>;
> > +
> > +        fan {
> > +            pwms =3D <&hwmon 40000 PWM_POLARITY_INVERTED>;
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
