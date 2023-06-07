Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384D1C7EE25
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jun 2023 18:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbjFGSZW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jun 2023 14:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjFGSZR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jun 2023 14:25:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002992136
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jun 2023 11:24:53 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977d7bdde43so191017966b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jun 2023 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686162292; x=1688754292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+spCigXAQRIdqC9/nyy7/kZk/7sQAU1c4Tph8TmT54=;
        b=LT0kG2jiJsVMEPPOaxwmqIUi/vnTheLo04FTvQXIMUDOn/CnRiDM7lZ7p8xkcQw3tf
         Tk7pHg+dlhlYNZl6PW/0qnghdM4Wd9GgcbRE7fqzgLKE8Df0w5Cn2VI1GtsRTtPVsoGY
         4iRfbPwtuhATBPYDgnweWT0skckkMj1FpuHhp60OIrnCv2p5SNxnHO7WaOu6z7Lhw3E+
         X6d4z6OE66cp4gCr1DasiVv55raqZdnreqT5WLPNVPfAVOyOU2vhht7OFWGQNZS8/Rpn
         CaMZzIn/hikSZS2BNJv3lEwBNtaetkoRJmuy+6eP//o6Klo9bU52C9ELQGeg0MT5QC5D
         nS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686162292; x=1688754292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+spCigXAQRIdqC9/nyy7/kZk/7sQAU1c4Tph8TmT54=;
        b=Pb0Q/h4EKPQpAF5fYkUByp6jKDfcDfc8KJDK4xdRXJ/32tjNNlkPbUQ+8j4FJJkU1Z
         1SFNETBYGcM4j2z/js1FFwWwa7xJATLvuswQoQaz7/PnHMFeQQ+YUyiupDi21GgQZy1r
         IZC09W23QVkQTdyC/+0e7nDJB6budtu7XlK5pNls0FrjxI8q2wqjVvkS259jRNcawM9b
         rUu1kR83n2M3Xd0OQk/qIhT6ti+nWNZeVcrovMPSQnWK4hLWAq/mP2j3H0Vpot5u4sLI
         zDgR49V8UesOCq3xYf//P7DuFv4x5AqxEBjQOLJwoVDs6H1DHVBJCar11+/J9p80alct
         NE1g==
X-Gm-Message-State: AC+VfDxbVUUCNOySQhJMQAl4uCEJVF883YBhNVXHucKy98rf/N0nfWsV
        8fgDvhQrEOFVUUbvSfooeGFY4w==
X-Google-Smtp-Source: ACHHUZ5Vy3AAyXDQFISoFmwiLXuHeOeJpM4SLeUgdY0CHPW20niXWGQiPoOwLBj4Ms9RNWvuj9WSGA==
X-Received: by 2002:a17:906:db08:b0:977:d468:827 with SMTP id xj8-20020a170906db0800b00977d4680827mr6284132ejb.17.1686162292040;
        Wed, 07 Jun 2023 11:24:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906149100b009764f0c5fe6sm6399462ejc.7.2023.06.07.11.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:24:51 -0700 (PDT)
Message-ID: <e0f63b9a-b8d2-9477-eac3-737c4059cfb7@linaro.org>
Date:   Wed, 7 Jun 2023 20:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Nuvoton NCT7362Y binding
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20230607101827.8544-4-zev@bewilderbeest.net>
 <20230607101827.8544-5-zev@bewilderbeest.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607101827.8544-5-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 07/06/2023 12:18, Zev Weiss wrote:
> This binding describes the NCT7362Y, a 16-channel fan/GPIO controller.

A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/hwmon/nuvoton,nct7362.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
> new file mode 100644
> index 000000000000..630dcce7a14c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7362.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NCT7362Y fan controller
> +
> +maintainers:
> +  - Zev Weiss <zev@bewilderbeest.net>
> +
> +description: |
> +  The Nuvoton NCT7362Y is an I2C fan controller with 16 pins that can
> +  be independently configured for PWM, fan tach, or GPIO
> +  functionality.  Each pin's functionality is represented by a child
> +  node.
> +
> +  The datasheet is not publicly available but can be requested from
> +  Nuvoton via their web site.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7362
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 16
> +
> +patternProperties:
> +  "^tach@([1-8]|1[0-7])$":

@9 is not valid? Aren't you using some non-numerical values?

> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: The pin number.
> +
> +      nuvoton,pulses-per-revolution:

Just "pulses-per-revolution"

https://lore.kernel.org/linux-devicetree/20221116213615.1256297-2-Naresh.Solanki@9elements.com/

> +        description: |
> +          The number of tach pulses per revolution of the fan.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        default: 2
> +
> +    required:
> +      - reg
> +
> +  "^pwm@([1-8]|1[0-7])$":
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: The pin number.

This is some plague of single-property-nodes... Aspeed also sends
something similar. Why the heck do you need empty nodes?

Drop entire node pwm.


> +    required:
> +      - reg
> +
> +  "^gpio@([1-8]|1[0-7])$":
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: The pin number.

Drop entire node gpio.

If this is pinctrl, then make it a pinctrl.

> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"

Best regards,
Krzysztof

