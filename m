Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32631354C
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300359; cv=pass; b=JU4VdVhkvz2m46u9TLsGVJbc8plHqa3/+a7ETJ+eu/G61OlxL0nnYyiI2LWclSqBS6hvV8wpRG0KDe/3q3N3Ja5HOhuxqHdjfwc5aNj0AY3E13fgJR+nQ3ysQZLgU3ibP9oB4oEHuj0Of2sah1bAKSTb0+r5wyuuqx5ZF/dfXDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300359; c=relaxed/simple;
	bh=TWU8vryfQeA/MKw4NADKO2ArzyxCXV4H0Tgo3gyI/pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnnJd8NgjUawof9AaioNq5Zoeai7VdxwEzWzaKQBa/Nj6X2ana/1WHZqjrPRNzJhoQJEcj6rpwAIz4Iw1NjPb/TtGG5q89TjHEXlkUwY1l3XqZiDpb59l6dFGlL/r0bMisrz7REBDKQk7vPKVB8TgibMf4/iYOmCR2XxAWZGmxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg75JBAV; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg75JBAV"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1677c91969so57242166b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785300356; cv=none;
        d=google.com; s=arc-20260327;
        b=mQ73OqaSRcmQnK85hg09U6GT7P1o3yKvUCxQDnyOog2SjTtAk8eM+WQDrltEyz7gcZ
         EzrEjqjGJQF5hyqwXHzPKK57NX/j65z4JmhDEVzwpDWzWpWODKVoXhECTfgHwgz3dR9W
         fZ0sRIES2x1+3Wa0pcj4I2nA2DNR76fabEiPFebbU1425vNyKh4/uDIP8o/KM4jxny7A
         gI7EbFx93DzHrbfa+3MtbRNpCftyKDNVkDqQWez/uWdmbawhc4IDkY4KcB1mgQ4S/K8l
         YyaLcrBBNypxsj1WySYtjvrb3CRVADimV3Uw38rfyyAkXVjEyG581FdsOCzg3k85H1W8
         FRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kpGwAc/zS1Z5Ybg4YnxkG9yP5l6pon/d5qwt4j5rY3s=;
        fh=jeOVfAvPIH2J8BD4enG2a+p4PdtgiCvPNqB8x8rbOAI=;
        b=I9uE23Vn973abXIQRVO52Lq3KwfKy6Du5KowITyIKD1c707naZaJ+SyeGfZFBjDpSk
         RsQvUuMsryrlElwrrQ3FouadDp27CQPYTtPIfap5VOFDEXtXv/ZSGfP9eN3i6ZlY/xDy
         Pj4vjFvBaXQAqoKTwQ9oLQ3hMgQfqClLVoJgZ1LX59RcwPgvdEJ7sCs61Rcc8vy+8zkQ
         fiZSSqpHkw/48AENyM7Vffm1AeXOu7zAR0prcK7nGsSU/01Rx+UGcLt1sjtaN9ikgQvN
         fmdkD107LQ0ymmE/UZMWIMSE7BMY6hTis8C1gNrk7hXilyI8A9tFtUxvMLv+HA4chEs6
         gW1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300356; x=1785905156; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpGwAc/zS1Z5Ybg4YnxkG9yP5l6pon/d5qwt4j5rY3s=;
        b=hg75JBAVhes13FzVBTmeu8mnh4XqFQtBEx0bjuV7eoV/0syqJWyqKaKf54v2B7fQMn
         W54uHQhHuWAwloOvW5EBUZIcmIBi1xAacGP7jPbxCDbhJRhepoSI5BFu/ZVJPT0mKvwW
         k9b1QTGOEEWaEcIg76QMYpNUY9a9kB/83O0CIDvjKz5p52CCUSstHI3fv0QFYCGsoB1r
         mH4SPs2RtyqfjdYYApuaU+JTzYQ/PFlAr37vidxvr43sY2sGrW731sl28RrSU9KhUuMM
         jR5r1WHQYOLjtxTDJDqz3qTaB3E9zVO7BECmPBUyp3Z70i5+U3qZRFOrwL+tqbYTOU7w
         6JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300356; x=1785905156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpGwAc/zS1Z5Ybg4YnxkG9yP5l6pon/d5qwt4j5rY3s=;
        b=LPO8Tko6uQgn3Mn/mM0EZuNjQWD4YNBc45vYzDklaWmY5gYRPnF60b3G8x1i2IFjW9
         4SWnqgEVjxxVuzhnqzQSQv1fFl0i7Q2dLK61WJrroHPaF9X73OycrKkNi7uPr5FeTWCS
         MJ6/gAQvun4G0Pl66HmhHlRGfHzviBgOz32aDl4BUcD1WVNhndjgN024AricOsILsiax
         aMelpyxBl3YPUHr+6NPmZ5uedmPHTH2jy0rf0/2b//hz8UO52Fvru4mcMqNMARlFWgrv
         jEmvecCrR27n6xnJdQ/5GUb6uGqJ58NgwtHZ/NEGHx/Ufw+D2kJJTgGIshjwA3VqJC+y
         h89A==
X-Forwarded-Encrypted: i=1; AHgh+RouzC2Yf+ExI5FzWATtuv+WdthJ7lYR7nGlCvddkhkcCOvnFGgepKjmkdodcaAu2Dr1D5TnyKJCEFs2/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBtCRS56VxRb8o3ZSOuU4MoXY8/Uvi3+th9n0zb6ST1tg37wQ
	s9pL75DbKtPv0EkdEwlGVocQs3eAScv65Cvp9RqPRxrB23NsvFI3H4nvyeabPsh79ECEHp+vB2U
	h1mW61kR5qw++n4ww9uno8HlzE2WwoJk=
X-Gm-Gg: AR+sD13Bc6JHzrWeE6V/xpx+ZXqSkEcKZ7przB1vB+JAaZ/5tX7iwpW4izvrP0N9ZZy
	AGV5E/HyNLnGATgXncaRjqXEhps6s1Uab4q+ktuAtH0pV5ZUQf3dbjcJ3UmUBSSFNUmIW/pPRV5
	0Kr/3i67Sb68GAG9WUhyJWYbRNzY8M0ICo+yWPfaPLOLkBstsgCf8SzwxX9OJ/nEODMPc4NpuVA
	h+nOjsrmibTYB4cWrTedr3Bg73a4lyCHbNDWU34wUldkXi8ACuUn9QaApok+VKeFGbvoZSRJlY4
	Qa+HY1Hdv6V6UErqDFQyMdF6D8rNPYyQ16Ze7AK5QIfyr0wK/3s0vjwOKoBzKjuWQcKH4zCtqHp
	FIA==
X-Received: by 2002:a17:907:d408:b0:c1c:4d59:2b03 with SMTP id
 a640c23a62f3a-c1f71eae0e6mr258727366b.3.1785300355708; Tue, 28 Jul 2026
 21:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
 <20260728-adt7470_thermalzone-v3-1-d4586478cdba@gmail.com> <20260728-meteoric-quixotic-sunfish-0de2cb@quoll>
In-Reply-To: <20260728-meteoric-quixotic-sunfish-0de2cb@quoll>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 01:45:42 -0300
X-Gm-Features: AUfX_mzeoGI1TquWNmmBg4ZCCnURWWqxT7S385nR9H6VYiwBt6Kck6h22oP1jNU
Message-ID: <CAJq09z5CQgzzFahoiteh9ykjdbsYpP=QZ2AugzY4tQ79RpA-cg@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v3 1/4] dt-bindings: hwmon: adi,adt7470
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

> On Tue, Jul 28, 2026 at 12:07:09AM -0300, Luiz Angelo Daros de Luca wrote:
> > The Analog Devices ADT7470 is a multichannel temperature sensor and
> > PWM fan controller. It supports monitoring up to 10 external
> > temperature sensors and controlling up to 4 fans.
> >
> > Add the device tree binding documentation for it. This includes
> > support for the thermal framework by defining the "#thermal-sensor-cells"
> > property, and models the fan control lines as PWM channels by
> > defining the "#pwm-cells" property.
> >
> > Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > new file mode 100644
> > index 000000000000..bb2375a4a490
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADT7470 hwmon sensor
> > +
> > +maintainers:
> > +  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
> > +
> > +description:
> > +  Multi-channel temperature monitor and PWM fan controller.
> > +  It supports monitoring up to 10 external temperature sensors and
> > +  controlling up to four fans. The fan control lines are modeled
> > +  as standard PWM channels.
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,adt7470
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +    description:
> > +      See Documentation/devicetree/bindings/pwm/pwm.yaml for the
> > +      generic PWM binding description.
>
> Drop description.
>
> You OTOH, miss ref to pwm schema. Referencing here in description should
> raise you questions... And then use unevaluatedProperties.

I will drop the description and change to `unevaluatedProperties: false`.

Regarding the reference to the PWM schema, adding `$ref:
/schemas/pwm/pwm.yaml#` enforces the `$nodename` to match
`^pwm(@.*|-([0-9a-f]+))?$`. Since the ADT7470 is primarily a hardware
monitor, its node is typically named `sensor@...`,
`fan-controller@...` or `hwmon@...`. Importing `pwm.yaml` causes
`dtbs_check` to fail on existing node names because of this mismatch.

Since we cannot override the `$nodename` from an imported schema, what
is the preferred approach here? Should I skip the `$ref` to `pwm.yaml`
in this specific case, or is there an accepted workaround for sensors
acting as PWM providers?

> You most likely miss ref to thermal-sensor.yaml as well, but that would
> change the ABI since hwmon would fail on missing cells, right?

Yes, you are right. It would require #thermal-sensor-cells and the
device might not have a thermal sensor connected if it is used as a
pure fan controller. Likewise, it can also be used as a simple
analog-to-digital temperature adapter, with no fans connected (and
"#pwm-cells" might be missing).

To address this without breaking the ABI, we could add the ref
conditionally if "#thermal-sensor-cells" is present.

allOf:
 - if:
     required:
       - "#thermal-sensor-cells"
   then:
     $ref: /schemas/thermal/thermal-sensor.yaml#

I just don't know if it is ok to ref thermal-sensor but not pwm.

> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +    description:
> > +      Number of cells required to uniquely identify the temperature sensors.
>
> Drop sentence, you never need to explain standard properties. It only
> adds bloat and more places to fix/change if we do any refactoring.
>
> > +      Valid index values are 0 to 9, corresponding to temp1 through temp10.
>
> Only this is needed.

I'll keep only the sentence regarding the valid index values.

I'll send a v4 with the updates mostly because Sashiko-bot failed to
merge v3 with dependencies.

Regards,

Luiz
