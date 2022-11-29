Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00240C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 08:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiK2IOa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 03:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiK2IO3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 03:14:29 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AAE317C0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 00:14:27 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a7so15907105ljq.12
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 00:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kE1+leaTmUxF3as6k1k34XuPsEzaU4M81bWmmSyPyc=;
        b=FnJImm3MAPYrhuNeNysTyfF6J4n/6xtSkbtq5TJrAuLXs4GLeHvASCojQ/YOmUPUMG
         J3AWu4tUpOkqc/J2qzzWwfwtER4QjyW3GFygGosCpnZRuj2SplXfptJpeXpQ6UGV/ntn
         wCc1gxgo30d/q/V1a7IkUa2xrTQRa1wDSTJi3feal4LT7ZKY/1+5LwkCLVIfQMPAQFwH
         kxaKXDAjYKuRAIKyfsaOiuC2Z2X/7UJ9byZSTOgjBaA0GPqH3ct0cXJYQsQc+tV79hF4
         HL2Lb9fWK71QrXQbpfWrEHFmoO+9XDGPCUD8D0uYgHWHsFogx49gTUDXrsplIWwULtvl
         zKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kE1+leaTmUxF3as6k1k34XuPsEzaU4M81bWmmSyPyc=;
        b=jBqRPSMuq/92A+bryhwszHVIoEN22QoAhKXEO8kvusBIVbkEqpL+ZpJAd6oV9lTqsl
         RPW1QWYPAmuiLUtUu6SIGBQcR4HvF8BwpfRFrq22vpchkfh2b27JhsxqwIBIpmAwme6d
         m/0QKOIMz3jje73Nuv2AhHtt/stM6HaGOV4YFz/974X1Ep6J2OmSdiYhBogdYKhVuY4b
         uT2EwO6LeVacgu7J6Ul2sy+QXtiaBPmI2cvqDY0RQrfTJ8Oy6PhxYSU3dLqVPErYL1+G
         84mTvCIMXH9+yjIfgVZQrsHJatjk6IWYv9MwKzd/VPAN7GGXvevw9dXaVfThAZvUhVvQ
         mrWw==
X-Gm-Message-State: ANoB5pnvVmLFGoGYb/PAutfvKwrZegXAlBvN6wq8D/1Qq4kiC3TK2WeA
        YKq3KVlN5q2Dy2F99+DIsYUUgw==
X-Google-Smtp-Source: AA0mqf6f3fHqp4Zh45KPm43PEvOBHHR93tmy53VTEEdhuG8MikJvFvIO3PRAQ6tGLrDX16BQluZJKQ==
X-Received: by 2002:a2e:b52e:0:b0:279:8991:60be with SMTP id z14-20020a2eb52e000000b00279899160bemr7275550ljm.419.1669709666341;
        Tue, 29 Nov 2022 00:14:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a6-20020a05651c010600b00279b9149325sm74006ljb.139.2022.11.29.00.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:14:25 -0800 (PST)
Message-ID: <b6943ec7-8fcd-08dc-605d-4a23629bc39c@linaro.org>
Date:   Tue, 29 Nov 2022 09:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add binding for max6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roland Stigge <stigge@antcom.de>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
References: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
 <20221121122932.2493174-3-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121122932.2493174-3-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/11/2022 13:29, Naresh Solanki wrote:
> From: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  .../bindings/hwmon/maxim,max6639.yaml         | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..da040b11d2ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max6639
> +
> +maintainers:
> +  - Roland Stigge <stigge@antcom.de>
> +
> +description: |
> +  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
> +  fan-speed controller.  It monitors its own temperature and one external
> +  diode-connected transistor or the temperatures of two external diode-connected
> +  transistors, typically available in CPUs, FPGAs, or GPUs.
> +
> +  Datasheets:
> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max6639
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#pwm-cells':
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^fan@[0-1]$":
> +    type: object
> +    description: |
> +      Represents the two fans and their specific configuration.
> +
> +    $ref: fan-common.yaml#

unevalauatedProperties: false

> +
> +    properties:
> +      reg:
> +        description: |
> +          The fan number.
> +        items:
> +          minimum: 0
> +          maximum: 1

This is a bit unusual syntax. Drop "items", I think it should be more
obvious.

> +
> +    required:
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan1: fan-controller@10 {
> +            compatible = "maxim,max6639";
> +            reg = <0x10>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #pwm-cells = <3>;
> +
> +            fan@0 {
> +                reg = <0x0>;
> +                pulses-per-revolution = <2>;
> +                max-rpm = <4000>;
> +                target-rpm = <1000>;
> +                pwms = <&fan1 0 25000 0>;
> +            };
> +
> +            fan@1 {
> +                reg = <0x1>;
> +                pulses-per-revolution = <2>;
> +                max-rpm = <8000>;
> +                pwms = <&fan1 1 25000 0>;
> +            };
> +            };

Fix indentation.

> +    };
> +...

Best regards,
Krzysztof

