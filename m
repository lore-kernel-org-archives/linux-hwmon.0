Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95A63C3C0B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445934; cv=pass; b=s9AhDnH2Au0q9pe3ukDVcZ11oenlE4MXICQE7HwAU2Hly/H5Y7sEkU7q3/S1M53hEUASBxWvA0ztzqp2QPIwARDJxvnNkkTvE3J8sOWeTMILvI14tURcBoUZpTUs150pQ6TAQecYJ2n6YQxeGDVIDoR+Q+1t7QDn64A6zI4xm6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445934; c=relaxed/simple;
	bh=iEk4wpw9FQcrEvdQXfSWeVmHqPtsb28Pgjf6F+uacz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7Klp8uMR9wKuYuBQwKI9sTM2xrIS5VS/EbQtxO4BJRgq92azt44YjggpBj0CHLLQ2q0LqE15Px5ESegogcvgvKFpUfzdOwnrRGRbDc2YZc1m9tC8NogEcJLmOTL5KfDD7Q2fPupC9uoXbZ0sMfWM/wTvkvPJphqJY+xS9htNLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDHdSGWU; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDHdSGWU"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c52d920b8so29689566b.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 14:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785445930; cv=none;
        d=google.com; s=arc-20260327;
        b=L/qoO77bpf1Z00OVrmaeaZ8Oysn/LtrPDRbA8einq0V/cOBB+Z1MJu+tDbtghaK3Kj
         vWh0Acj5UjwRqFx6BG4AwS3CevKARaxnO27S+lbDoePTPU9le/Lx+8j4JgZeqc6voRt8
         51hgOmC+J7NI/Lpo+cfI6TA81wJb40ul/eZ2oNdNBoWQqSek3FIkG8r/XpFkMrVsK7kz
         vzUpTy1aXe5dLdbISDz/yfAg1TIsJwVbOh0V0lNBK3oVj5gxBW7LUFoI1lXRa12X6Ruv
         xw+HSifhS+WC8IsaOHdhmLf7K3Hg6AABnkUVtbBmOeSn5CI4tRogSWH/sghk35jQJOMa
         w8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dc/ptklzYhJxPB/24UBcqyDH7hAbMtvydGT0r8k5oY=;
        fh=XWKyAh04+KrdsvxrSFHLSug+u+AuIb8WgosV+dK6Lyw=;
        b=QR0RkrFQo3wW4os2dj5ZDFBcu00Ht+Pzym999XsxnVfZCoPGOsgufxCz4KZqjZFc0L
         OGKBN2ABSVPGHqQzxYJEidL/OqMzHnY4/fp0uiwxvI5C3FKrtFD+9kSjl+/Lm75fbNTO
         0R71eviL0F1paVuq6LimrIxniGgaxhW8q9C6M1bpF5wDzkvaMi5jruk7caFCfXAQh0hO
         jej3eEXD1HSDOReQIhuu5au/3nxJLTd277dvGtaPpIUIG0qijGCEyqDZHwWrLc1m3ZZK
         dqnhwQ9Bx5KcrCCbe8E5AVDtikPYTc2fiDhlPnOOG7/dEDLmI6/ttXQi1Ywi2ZKW32h5
         G+Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785445930; x=1786050730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dc/ptklzYhJxPB/24UBcqyDH7hAbMtvydGT0r8k5oY=;
        b=XDHdSGWUjdgbK9XtauMeau0k5VXlRL5iUpIHnjb4TLgA9+tEh7OumZq5xH7NIfJOQl
         52pHqsLeJPynQvpbf8xjGfI2wEq2LvG2RF95Vj6LQ6eyLuEio6MgS28RZj/C7xDgkYTS
         zkUrgjo8lWqYr/xhnFNF4wScB9iH9JbuPfXHVAbD0qZJmYusr4U0hcZ6e01eJB+ngCyQ
         W4bF8jAKzN1bSZsJdfz3rsxa+eArP11uzSb1Jf4J7XfoOpHZD6dUGLETk5XAAPGRuIF+
         okBYtqHsWNep+W+GgGiKt+ia5jFXOKQ7R9a17u3m1wHK4UIQnquIbrQFb4l46m6m9g8B
         W8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785445930; x=1786050730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dc/ptklzYhJxPB/24UBcqyDH7hAbMtvydGT0r8k5oY=;
        b=PhjuqIZLouTn7ENbUWvE9mkBIEfG7V/dbnmZAMRzVcHH16X+ORCFpMT0j63qNo6l1O
         ncXjo3qGEQpuN5LJfM9QnZs4bLzpTYRqKyG8HCALGeLwsNlehOuzwxqCDXvYhqGzqxIJ
         9uzqvJEe0lIkOplG1FE2zafrTZIbdd6XXtuvJuuVGajcCUpEpyhpxUowc9z83kLOg4e+
         fhfrx+7I/uG+FNDO7SsZv2Au/YaFrHqHa6O8t+M7Lp+h3xeYKUTPIm3JFIrZJrUFUXlo
         hUidw5EJqO0goOInhkQ/d+Y7kJT3q0xZs1lpWQU3gtj+DI2IvDRcqxrQCCQh7z0q+TtV
         M0Eg==
X-Forwarded-Encrypted: i=1; AHgh+RpYWN1NEQaAw3teMeHdOqNKX1g/9YIJJdIR3rk2X6ROb4Mz7YMYxxtJ0z5xgE3SL7WtjG3+MCD6cJaPkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yCOHKcGBB+SKWGzgrSxOLOSEU0WfljapLzA2EWu1VC1jUosS
	8vtkkCG4EsEiExttl69+jlhxkV5sEFXqvXs8Y2Ytzq/+sZ+feJX4iWmgvSBU1evmlI9ITPvDtMc
	HqQZWQRxa/mN5zaHLKFMdMNvRgWtud80=
X-Gm-Gg: AR+sD11JVrbFlT57DVqY4fHYHCqtfjOoEsslxL8YBFnD4ayJ6IB0YRhuK3rL8wvugkU
	6/n8p0m4Mv/qJufqyp036AaSCGv68UJGj3ZNfqhtVIYfwkYEYVJS5Ze65w3DAH7O0XYVeCbtfwu
	5m+gVcbxk/WJ4YsMGRADQ/iIU9Qr82uxtHbt6JD6ErKwe2wYhBa3Y9MsA+QBYx97PYfLGLnKgzy
	EnnFMWlhU7E3w+kcCkemNPfA0Z9JIJSe3yO/RqWDeZ/IrzkLIYPfjVUjhcWhp1mIbnN9rjO/HxW
	K9aSlvfrzPN9AqiYluukngkfODqLCnuiV8L5aA53skK/r7lVCOALTCVCa0raq5eGkBO4u+xRNpp
	2
X-Received: by 2002:a17:907:d0f:b0:c1c:3705:dde9 with SMTP id
 a640c23a62f3a-c1fa580990cmr214119066b.64.1785445929666; Thu, 30 Jul 2026
 14:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
 <20260728-adt7470_thermalzone-v3-1-d4586478cdba@gmail.com>
 <20260728-meteoric-quixotic-sunfish-0de2cb@quoll> <CAJq09z5CQgzzFahoiteh9ykjdbsYpP=QZ2AugzY4tQ79RpA-cg@mail.gmail.com>
 <6cc03c4c-2d88-46f2-aee4-adb769d10cbd@kernel.org> <05b7f116-25a9-49b3-a31c-15eb4e6ec838@roeck-us.net>
In-Reply-To: <05b7f116-25a9-49b3-a31c-15eb4e6ec838@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:11:57 -0300
X-Gm-Features: AUfX_mz2XCdOnosHGQc59ddl9-gEcC1_EFpjzuEeLq-UVrlScXWGcDPbsI2vkYk
Message-ID: <CAJq09z5GL16qQ6smjEHsiYxpXn6MaBkibwsvSR66cJ4kEx1M6Q@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v3 1/4] dt-bindings: hwmon: adi,adt7470
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 30 de jul. de 2026 =C3=A0s 12:38, Guenter Roeck
<linux@roeck-us.net> escreveu:
>
> On 7/29/26 23:17, Krzysztof Kozlowski wrote:
> > On 29/07/2026 06:45, Luiz Angelo Daros de Luca wrote:
> >> Hi Krzysztof,
> >>
> >> Thanks for the review.
> >>
> >>> On Tue, Jul 28, 2026 at 12:07:09AM -0300, Luiz Angelo Daros de Luca w=
rote:
> >>>> The Analog Devices ADT7470 is a multichannel temperature sensor and
> >>>> PWM fan controller. It supports monitoring up to 10 external
> >>>> temperature sensors and controlling up to 4 fans.
> >>>>
> >>>> Add the device tree binding documentation for it. This includes
> >>>> support for the thermal framework by defining the "#thermal-sensor-c=
ells"
> >>>> property, and models the fan control lines as PWM channels by
> >>>> defining the "#pwm-cells" property.
> >>>>
> >>>> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> >>>> ---
> >>>>   .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 55 ++++++++++=
++++++++++++
> >>>>   1 file changed, 55 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yam=
l b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..bb2375a4a490
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> >>>> @@ -0,0 +1,55 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Analog Devices ADT7470 hwmon sensor
> >>>> +
> >>>> +maintainers:
> >>>> +  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
> >>>> +
> >>>> +description:
> >>>> +  Multi-channel temperature monitor and PWM fan controller.
> >>>> +  It supports monitoring up to 10 external temperature sensors and
> >>>> +  controlling up to four fans. The fan control lines are modeled
> >>>> +  as standard PWM channels.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: adi,adt7470
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  "#pwm-cells":
> >>>> +    const: 3
> >>>> +    description:
> >>>> +      See Documentation/devicetree/bindings/pwm/pwm.yaml for the
> >>>> +      generic PWM binding description.
> >>>
> >>> Drop description.
> >>>
> >>> You OTOH, miss ref to pwm schema. Referencing here in description sho=
uld
> >>> raise you questions... And then use unevaluatedProperties.
> >>
> >> I will drop the description and change to `unevaluatedProperties: fals=
e`.
> >>
> >> Regarding the reference to the PWM schema, adding `$ref:
> >> /schemas/pwm/pwm.yaml#` enforces the `$nodename` to match
> >> `^pwm(@.*|-([0-9a-f]+))?$`. Since the ADT7470 is primarily a hardware
> >> monitor, its node is typically named `sensor@...`,
> >> `fan-controller@...` or `hwmon@...`. Importing `pwm.yaml` causes
> >> `dtbs_check` to fail on existing node names because of this mismatch.
> >
> > If it is a fan-controller then it should use common fan schema, because
> > you might be missing several properties.
> >
> > Device having PWM outputs alone does not make it a fan controller, thou=
gh.
>
> It is a fan controller. The logic used here is the opposite:
> It has pwm outputs to control the fans, therefore it should be modeled as
> pwm controller and use pwm controller bindings (to clarify, this is not
> my logic, but both DT and PWM maintainers insist on it).

Hi Guenter, Hi Krzysztof,

Thanks for your review. You are both right about the nature of this
device. While the manufacturer markets the ADT7470 as a "PWM fan
controller" (and it does have internal closed-loop capabilities), the
physical pins are multi-functional. They can act as generic PWM
outputs or even GPIOs. Because of this flexibility, tying the binding
to `fan-common.yaml` would be too restrictive.

On my specific hardware (Edgecore switches), the vendor bypassed the
ADT7470's internal temperature sensors entirely. The fans must be
controlled by the main SoC's thermal zone (or any other userland
daemon/script).

Regarding the architecture, while I looked at the `emc2305` approach,
delegating the actual fan management to the time-proven `pwm-fan`
driver allows us to avoid reinventing the wheel (like cooling device
registration and state management) inside the adt7470 driver. It also
keeps the standard PWM consumer/provider relationship clear in the DT.
It still feels strange that emc2305 declares #pwm-cells and its
subdriver fans pwm properties and they do not work as a pwm
controller. Other drivers, like aspeed-g6-pwm-tach (with similar
bindings) do both: use a fan subdriver controlled by hwmon sysfs and
register itself as pwmchip. But this is exactly what Guenter asked me
to avoid.

> > Since we cannot override the `$nodename` from an imported schema, what
> > is the preferred approach here? Should I skip the `$ref` to `pwm.yaml`
> > in this specific case, or is there an accepted workaround for sensors
> > acting as PWM providers?
>
> You can skip the pwm.yaml in such case.

OK. Thanks.

> >> You most likely miss ref to thermal-sensor.yaml as well, but that woul=
d
> >> change the ABI since hwmon would fail on missing cells, right?
> >
> > Yes, you are right. It would require #thermal-sensor-cells and the
> > device might not have a thermal sensor connected if it is used as a
> > pure fan controller. Likewise, it can also be used as a simple
> > analog-to-digital temperature adapter, with no fans connected (and
> > "#pwm-cells" might be missing).
> >
> > To address this without breaking the ABI, we could add the ref
> > conditionally if "#thermal-sensor-cells" is present.
> >
> > allOf:
> >  - if:
> >      required:
> >        - "#thermal-sensor-cells"
> >    then:
> >      $ref: /schemas/thermal/thermal-sensor.yaml#
> >
> > I just don't know if it is ok to ref thermal-sensor but not pwm.
>
> Feels ok.

Thanks.

I'm sending v5 soon with the current approach. If needed I can revert
back to the subdriver/cooling device directly in the adt7470 (as in my
v1). In any case, both approaches share the same #pwm-cells but the
subdriver would require a new fans property.

Best Regards,

Luiz
