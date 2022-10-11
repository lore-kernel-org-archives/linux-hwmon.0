Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400C0C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Oct 2022 19:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJKTr0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Oct 2022 15:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiJKTrY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Oct 2022 15:47:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53CD855B9
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 12:47:18 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bj12so33622617ejb.13
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZc6YAet+7QEfjXBOIDZ+tWznKgzcO1Ajj5p9dp+Zjg=;
        b=Kil03nu7trwLJrrgQ166hvwg7HgVGGgGF5T9Kkl37/McGJLHyMJ6sursBMyO2QrgwK
         mLGxajAb8akzoIMUShD72CREarjKECm4mOLvwjBdjVPNA8ANwlTrPskfAb1t2+vkdJ7I
         ImaxIfuu/6smc/0gV/zYDJA1eSluZY0ufWzldhrBPB/1xnANbVaOfTuwA1VU7zsTxiuW
         jqXMFi4v8Wh7JBcA/B9/nJ6Yk5+2e6n816H3luE4oyKSoCmTwc2uK3t9x9aC+Mjb1Kmp
         ihJAVxZCwU6O3NYImj1msheyeunCPegBjjZnaXdTkA+EeFm9QwaXZUIH8RXw7sD9iZz4
         rMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZc6YAet+7QEfjXBOIDZ+tWznKgzcO1Ajj5p9dp+Zjg=;
        b=Zt/G7sSCVtldIa/cUo9F6fLGClcC/BjU7XPNs78l+Aow9zHhgU6zMyvMa9mNWfnm1A
         sM2gXccZ+VhRpABYNpQAMWw7Jp/GIIU8JdkgeMQaU4K9mVHEK12S0v7xcnkIEqyKcN5I
         C4JZdgebWmE6H62Uzw/Ar/9eoEihtZqeL8qbWPOoD5uyACPaD1VCgLzGAoPwhZZuGStq
         35vS+EY8uWDapGB7qSVH1+QWNreS2H1qpM6knL8za2erEUWx7XhEX9uDoNEldqXMwdAh
         kza+fUqcbqCrdrGiw0qrurCgSsciMASaULR0VlqjDEfMuXtwRtxe6Ovwrzh2pycZc57V
         AxfA==
X-Gm-Message-State: ACrzQf26zBuTkFMJawEpUYK8xwyKzZZWYa0jXczsQTWCFfEvVmZS7r2W
        6BgUmnUVB48ecAH8dXugm9P6LsjKVaTfhG2pNJB+CQ==
X-Google-Smtp-Source: AMsMyM6a6WJKZGcu8dQgWz9fRfQEeXweJ9kuQ6VEvpXvJAi8SRSicVSkEnQwBzn3b5BRpdDOubA1uDcuZyhhLAoW8d0=
X-Received: by 2002:a17:906:ef8c:b0:78d:4a00:7c7b with SMTP id
 ze12-20020a170906ef8c00b0078d4a007c7bmr20385805ejb.187.1665517637383; Tue, 11
 Oct 2022 12:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221011104739.53262-1-Naresh.Solanki@9elements.com>
 <20221011104739.53262-2-Naresh.Solanki@9elements.com> <CAL_JsqLmzcM2m6iU_hvy8=a1QP=Xm9HU0U=R_GkO4UxW+Fn=fQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLmzcM2m6iU_hvy8=a1QP=Xm9HU0U=R_GkO4UxW+Fn=fQ@mail.gmail.com>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Wed, 12 Oct 2022 01:17:06 +0530
Message-ID: <CABqG17i7=htO9pBf_62zzXTNuJgH_jCmzKXETEC9Oi5SJ9mm2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob, Guenter, Krzysztof,

I want to align with the implementation for the fan dt schema.

Current implementation is intending to use fan-common.yaml only for the purpose
of defining fan property as I felt this is the best way. This is how
other drivers have approached(eg: leds)

With this fan-controller driver will configure the chip  based on fan
characteristics accordingly.
target-rpm/default-rpm is included in it to enable driver configure
fan controllers during driver
probe.

Fan datasheets do specify the pwm frequency used to evaluate its
characteristic. That is the reason I've
included pwm-frequency here which fan-controller drivers can use &
initialize pwm frequency accordingly.

I'm ok with other approaches so do provide your perspective.

Regards,
Naresh Solanki

On Wed, 12 Oct 2022 at 00:35, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Oct 11, 2022 at 5:47 AM Naresh Solanki
> <naresh.solanki@9elements.com> wrote:
> >
> > Add common fan properties bindings to a schema.
> >
> > Bindings for fan controllers can reference the common schema for the
> > fan
> >
> > child nodes:
> >
> >   patternProperties:
> >     "^fan@[0-2]":
> >       type: object
> >       allOf:
>
> Don't allOf here.
>
> >         - $ref: fan-common.yaml#
> >
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ---
> >  .../devicetree/bindings/hwmon/fan-common.yaml | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> > new file mode 100644
> > index 000000000000..abc8375da646
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
>
> Dual license with BSD-2-Clause.
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common fan properties
> > +
> > +maintainers:
> > +  - Naresh Solanki <naresh.solanki@9elements.com>
> > +
> > +properties:
> > +  max-rpm:
> > +    description:
> > +      Max RPM supported by fan
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  pulse-per-revolution:
>
> The already in use property is 'pulses-per-revolution'.
>
> > +    description:
> > +      The number of pulse from fan sensor per revolution.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> I assume there's a known set of values various fans have?
>
> > +
> > +  target-rpm:
> > +    description:
> > +      Target RPM the fan should be configured during driver probe.
>
> Which driver? I think 'default-rpm' would be a better name.
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  pwm-frequency:
> > +    description:
> > +      PWM frequency for fan.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  pwm-polarity-inverse:
> > +    description:
> > +      PWM polarity for fan.
> > +    type: boolean
>
> Both of these properties are handled by the PWM binding already. I
> think this should use it even though the PWMs are just connected to
> the child nodes. There's always the possibility that someone hooks up
> a fan controller PWM to something else besides a fan.
>
> > +
> > +  label:
> > +    description:
> > +      Optional fan label
> > +    $ref: /schemas/types.yaml#/definitions/string
>
> Doesn't a fan need power? 'fan-supply' is already in use, so that could be used.
>
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
>
> Drop the example here as you have it in the max6639 schema.
>
> > +
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        fan-controller@30 {
> > +            compatible = "maxim,max6639";
> > +            reg = <0x30>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            fan@0 {
> > +                reg = <0>;
> > +                label = "CPU0_Fan";
> > +                max-rpm = <32000>;
> > +                pulse-per-revolution = <2>;
> > +                target-rpm = <2000>;
> > +                pwm-frequency = <25000>;
> > +            };
> > +
> > +            fan@1 {
> > +                reg = <1>;
> > +                label = "PCIe0_Fan";
> > +                max-rpm = <32000>;
> > +                pulse-per-revolution = <2>;
> > +                target-rpm = <2000>;
> > +                pwm-frequency = <25000>;
> > +            };
> > +
> > +        };
> > +    };
> > +
> > +...
> >
> > base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
> > --
> > 2.37.3
> >
