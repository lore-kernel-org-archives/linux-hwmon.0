Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314A6C83F16
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Aug 2023 08:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbjHZIxi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Aug 2023 04:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjHZIxI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Aug 2023 04:53:08 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3695C198
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Aug 2023 01:53:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99cdb0fd093so206148166b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Aug 2023 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693039983; x=1693644783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrES3XKC44v3tZqigZZ+43EHjB3HiHp45anmtNLpWb8=;
        b=xhuiGTqKkkulvez86oquvsGfDIiVNINbSPgb6neoSYbEF7CLGFlI8p1Wq6JdJvhjW/
         iROyHkBKtz7P1wa0d8bgQ3wtU5viJi5PvZhTuaPGTvFnVQuLhyMyVHlTpCiGDo9KePyh
         l7LpMA/9XRKLePWYkodKdZE0t6zSv1o7fsXmubs6j3pgsRldI2Rbm+40/K6TLxcEuQs8
         6fs4uSQg0ZWXwYqX4G2QX9w8Mmfa+0KtlbFiOVJhLwjuIrpWga/J68RuGf6RaX3jzC/7
         Bs5h7tHWIS/7YCtiFqW/DjwxTGfsD+UM29cSsLBgOtQY19O2XF88U5mNLwYdx9GI4tll
         6dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693039983; x=1693644783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrES3XKC44v3tZqigZZ+43EHjB3HiHp45anmtNLpWb8=;
        b=jgQj8Xmelka2eiqQIRYgM8SsffltUPMDDB+WQBEkKDpzrbLseiZOYDRk+cjYUVN6mG
         F8bDUKffCc29+AP/HWLgAj0rq68Xm3tiN3sSKut76HfaFJeoZLvHKM9369xn41+/Gjea
         ScTLzSoPxlaYkwB0F+N9pMQ6r8fBB+BME21+cn9h3RYXoHfvXW3UKiFP8yBCnGuGGZUF
         Eb9MUkl2aOb38K+m21NEFXjhHdepmSOpHxNLSwTW7fIw0BHKzHi1DZ+d2mcrxgAYvTTr
         nS/R5zSt5mycSoP+jzM6oIotXM7wJorA2XJzERPrUBuGw0qn/01vIQWrlhbEwagg1HXR
         efOQ==
X-Gm-Message-State: AOJu0YytEua47jiEntOpE5s+Jb0vzuD4VtJPAiDXXgGeyVuLXbsstQh2
        l0VY9HGBY+d/T5T2gFba3aUDnA==
X-Google-Smtp-Source: AGHT+IEL8IWddWkFP1+eqMSXVqduyzRv/8Qwgpzc9D/F86qWWJZz/ClkQWXdL7u0I8ISBLcG5UCN5Q==
X-Received: by 2002:a17:906:10c:b0:9a2:185b:5376 with SMTP id 12-20020a170906010c00b009a2185b5376mr4664148eje.49.1693039983449;
        Sat, 26 Aug 2023 01:53:03 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906b21200b009926928d486sm1904581ejz.35.2023.08.26.01.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 01:53:03 -0700 (PDT)
Message-ID: <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
Date:   Sat, 26 Aug 2023 10:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-2-nmalwade@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825164249.22860-2-nmalwade@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 25/08/2023 18:42, Ninad Malwade wrote:
> Convert the TI INA3221 bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> ---

This is v2, so where is the changelog?

>  .../devicetree/bindings/hwmon/ina3221.txt     |  54 ---------
>  .../devicetree/bindings/hwmon/ti,ina3221.yaml | 109 ++++++++++++++++++
>  2 files changed, 109 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> 

...

> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> new file mode 100644
> index 000000000000..0c6d41423d8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: GPL-2.0-only

I assume you do not use standard license because of copying the description?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,ina3221.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments INA3221 Current and Voltage Monitor
> +
> +maintainers:
> +  - Jean Delvare <jdelvare@suse.com>
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +properties:
> +  compatible:
> +    const: ti,ina3221
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,single-shot:
> +    description: |
> +      This chip has two power modes: single-shot (chip takes one measurement
> +      and then shuts itself down) and continuous (chip takes continuous
> +      measurements). The continuous mode is more reliable and suitable for
> +      hardware monitor type device, but the single-shot mode is more power-
> +      friendly and useful for battery-powered device which cares power
> +      consumptions while still needs some measurements occasionally.
> +
> +      If this property is present, the single-shot mode will be used, instead
> +      of the default continuous one for monitoring.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  "#address-cells":
> +    description: Required only if a child node is present.
> +    const: 1
> +
> +  "#size-cells":
> +    description: Required only if a child node is present.
> +    const: 0
> +
> +patternProperties:
> +  "^input@[0-2]$":
> +    description: The node contains optional child nodes for three channels.
> +      Each child node describes the information of input source.
> +    type: object
> +    properties:
> +      reg:
> +        description: Must be 0, 1 and 2, corresponding to the IN1, IN2 or IN3
> +          ports of the INA3221, respectively.
> +        enum: [ 0, 1, 2 ]
> +
> +      label:
> +        description: name of the input source
> +
> +      shunt-resistor-micro-ohms:
> +        description: shunt resistor value in micro-Ohm
> +
> +    additionalProperties: false

This should be rather after type:object for readability.

> +
> +    required:
> +      - reg
> +
> +additionalProperties: false

And this please keep like in example schema, so after required:.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    i2c@3160000 {
> +        compatible = "nvidia,tegra186-i2c";
> +        reg = <0x03160000 0x10000>;
> +        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&bpmp TEGRA186_CLK_I2C1>;
> +        clock-names = "div-clk";
> +        resets = <&bpmp TEGRA186_RESET_I2C1>;
> +        reset-names = "i2c";

Drop all this. Not related, You only need i2c node with address/size-cells.

> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ina3221@40 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            compatible = "ti,ina3221";
> +            reg = <0x40>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            input@0 {
> +                reg = <0x0>;
> +                status = "disabled";

Why is this node present? Binding said nodes are optional, so I assume
it can be just skipped. If all children must be there, then you should
actually require them in the binding (and mention it briefly in commit msg).

> +            };
Best regards,
Krzysztof

