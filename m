Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D81AC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Oct 2022 13:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiJENQc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Oct 2022 09:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiJENQb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Oct 2022 09:16:31 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987D879638
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Oct 2022 06:16:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id e18so22922996edj.3
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Oct 2022 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mzwnm047GWUEy8Gr4IBSDc4HWnR7mCcNMXv8/AXaSHM=;
        b=Sgw7kibjRUew1kKZAYu1iILRcZSbw2ZHReFe4LLeT8WGXMdnIsLmOtPHiPQMddLnHv
         VgQYo+KbYuCes7vL/5O7Q9tiKPEpMRVR54y+WOgtgO7cMTzc3h4UvVGKJpER46DTiYf4
         vaxafjj3zR02M5pPd8al+L490g0tM/F3+PIIWApwp+Glqht7IuWvOu3A4E9wZaW0hriN
         Fnjw61w1PexJ2r7KRVCtmWxT+maxeKZ6sBVmZC2fWtu8FT6RKIc3UA2L0fQKx2NQM8vU
         toEkAVLgRUpNuPeNnLxbS7Zu869iDFj3bzdisG/2xxprvCKvjVkQsE5WSws3tG4ZUTEk
         mYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mzwnm047GWUEy8Gr4IBSDc4HWnR7mCcNMXv8/AXaSHM=;
        b=rnK54eIOwKOTg7uiwwhvg11x2i4NeWZ38s7xU4QW2l+vIam22hrpk4S78ht2WpfuPh
         adzWqififRPf3m9T0YzVy+ctuXwssSwz1hGrcnjuxOowlmyfwBI8EtxpvXraBu6cBbYL
         d2d0Lntei3PpgmWoSt1pG7X/w6xNdjuoZ23QgTIpKMiTfELvf1fIz1cdPiMy/6i0b7yY
         Kgg13SUwDXfBmJdRFZhPnJpghgq0wOyFZFPLK4Ac2Da4flATe/BBjEj2WxM+Cz6Yqji1
         v/p3M+zDLI8xQIMHg+28vDjqo97RiRFQigovOuGstDyO1hEQlIWxpw1BdBY7c2dgQqfp
         YvMQ==
X-Gm-Message-State: ACrzQf2XY/IhaboFKccNLGPptaWL6x75bV/e2TL/clOsrlCClYjdQv5L
        C4rUVi7IIzdvc2MpN1Fe71T9Vh5joQS93LHxiODH0Q==
X-Google-Smtp-Source: AMsMyM4TPr49jvyXNw6/x/L/W14/KnLz5KALjrRfn/0GUjyx6n6X5alhXutwUz+8ZdWMRWXMWVeVyntvBKG4hkb9RrE=
X-Received: by 2002:a05:6402:90c:b0:457:b5ce:5f18 with SMTP id
 g12-20020a056402090c00b00457b5ce5f18mr29128877edz.309.1664975787933; Wed, 05
 Oct 2022 06:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220922050718.1079651-1-Naresh.Solanki@9elements.com>
 <20220922050718.1079651-2-Naresh.Solanki@9elements.com> <20220929193251.GA2606428-robh@kernel.org>
In-Reply-To: <20220929193251.GA2606428-robh@kernel.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Wed, 5 Oct 2022 18:46:16 +0530
Message-ID: <CABqG17hf7QhJuHO60V=ue8ev7cSnikr0nntkLAQkqnfyPc31xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roland Stigge <stigge@antcom.de>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

I can add common fan bindings.
Below are the properties that I can think of:
max-rpm, pulse-per-revolution
Let me know what you think.

Regards,
Naresh Solanki



On Fri, 30 Sept 2022 at 01:02, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 22, 2022 at 07:07:17AM +0200, Naresh Solanki wrote:
> > From: Marcello Sylvester Bauer <sylv@sylv.io>
> >
> > Add Devicetree binding documentation for Maxim MAX6639 temperature
> > monitor with PWM fan-speed controller.
> >
> > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ---
> >  .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > new file mode 100644
> > index 000000000000..c845fb989af2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim max6639
> > +
> > +maintainers:
> > +  - Roland Stigge <stigge@antcom.de>
> > +
> > +description: |
> > +  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
> > +  fan-speed controller.  It monitors its own temperature and one external
> > +  diode-connected transistor or the temperatures of two external diode-connected
> > +  transistors, typically available in CPUs, FPGAs, or GPUs.
> > +
> > +  Datasheets:
> > +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - maxim,max6639
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "fan@0"
> > +  - "fan@1"
> > +
> > +additionalProperties: false
> > +
> > +patternProperties:
> > +  "^fan@[0-1]$":
> > +    type: object
> > +    description: |
> > +      Represents the two fans and their specific configuration.
> > +
> > +    properties:
> > +      reg:
> > +        description: |
> > +          The fan number.
>
> Addresses are a property of the parent (the fan controller), not the
> fan.
>
> > +        items:
> > +          minimum: 0
> > +          maximum: 1
> > +
> > +      pwm-polarity:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        default: 1
> > +        description:
> > +          PWM output is low at 100% duty cycle when this bit is set to zero. PWM
> > +          output is high at 100% duty cycle when this bit is set to 1.
>
> IIRC, the PWM binding provides for this. The parent should probably be a
> PWM provider.
>
> > +
> > +      pulses-per-revolution:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [1, 2, 3, 4]
> > +        default: 2
> > +        description:
> > +          Value specifying the number of pulses per revolution of the controlled
> > +          FAN.
> > +
> > +      maxim,rpm-range:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [2000, 4000, 8000, 16000]
> > +        default: 4000
> > +        description:
> > +          Scales the tachometer counter by setting the maximum (full-scale) value
> > +          of the RPM range for max6639.
>
> Is this a property of the fan? How is this maxim specific?
>
>
> The bigger issue here is we need a common fan binding. I'm not inclined
> to accept any more fan controller bindings with fan properties until we
> do.
>
> Rob
