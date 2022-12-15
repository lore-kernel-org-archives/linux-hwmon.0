Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C19C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Dec 2022 09:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiLOJms (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Dec 2022 04:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiLOJmr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Dec 2022 04:42:47 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2792262B
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Dec 2022 01:42:45 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id y4so9342307ljc.9
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Dec 2022 01:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1c6YumyS4LirPkE2EiFDdoLxIzHQgm/2rq5WAIZoQ8o=;
        b=O3iBuh7nktRUO/8kEkcXilITiNQtHPTd+dZN1cAOJ6oc/jeZWvHRlYmq+LnTv2NQvO
         jYKgr/JeluUEeh19h35ORE0cuFXz+msWFaC+FVoVQnMtflmba2YnXPF5uyIPp8a+fBQH
         2qioLJIUmwGKQvYa+T9AUsaJRbX/i8MH/NAx8kIkx4I8LfK/DiF+AukK4MxwOnGVfFK3
         b98QRvxBJrzPyhDpDksRgFoqSsTezDXvn5Obo7UeiCYGb3U4ACq2/CVnD1ukR6YZrTOi
         wIFpQB9oA6NjO80hjZ91QG52Uxzg4FCnc4LA1Z9YPMOc2b5TPeveL4SgVL5EfwB8cO/Z
         7U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1c6YumyS4LirPkE2EiFDdoLxIzHQgm/2rq5WAIZoQ8o=;
        b=f5RcijUIQHuBO8Y7LNMXhPYlnFLErbMgYYVQ3eNlsmbrzpKWAgF9ClYUDLeWb1r9om
         UlEEgZr1BPM48Jpx1mySx+t6JnCiKMvfd3zs+2Y0ZFOWwW3m5Lx7fglGD7vOXxuErl/y
         y68hSXVGwfejeCJTPAg8Wd6xwaDue5aXZ65zSwReGqHQazHHgcLdi1hgommuAbL1uUDf
         TlmMpNEdBoQepwfUWCZk4tqxGQ/QZ0F/IzgcipArPUflKyZ6ACIIh9pCjxMe3/eflAf6
         /2xQ3tgHz5gZzvO6Gp/U8kHQD2P7IWPgFawHpz6y47dOEqrBeeoi1Xxbux7ekKICt+sR
         p8lw==
X-Gm-Message-State: ANoB5pkLXKlPE7qJ/bRwqzqhug99zBzIw9OiHGJrK5O9adSAqHd51sdS
        Kp+KEHMy5xPPoMiCJ5Q7mj1qiQ==
X-Google-Smtp-Source: AA0mqf76wah0xtTgssC1ZTBK6yJI4EqsWNWD9XZUOw8NP+kSyslMhSsroYs6l4KXHcWU4bJ5bGNHAg==
X-Received: by 2002:a2e:b88e:0:b0:26f:db35:c047 with SMTP id r14-20020a2eb88e000000b0026fdb35c047mr8703618ljp.33.1671097364118;
        Thu, 15 Dec 2022 01:42:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i6-20020a2ea226000000b0027730261350sm800406ljm.131.2022.12.15.01.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 01:42:43 -0800 (PST)
Message-ID: <29f4e14f-a81a-d440-b564-5360f44c65c1@linaro.org>
Date:   Thu, 15 Dec 2022 10:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: adi,ltc2945: Add binding
Content-Language: en-US
To:     "Cormier, Jonathan" <jcormier@criticallink.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
References: <20221214220727.1350784-1-jcormier@criticallink.com>
 <20221214220727.1350784-2-jcormier@criticallink.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214220727.1350784-2-jcormier@criticallink.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 14/12/2022 23:07, Cormier, Jonathan wrote:

Missing commit msg. Describe hardware.



> Signed-off-by: "Cormier, Jonathan" <jcormier@criticallink.com>
> ---
>  .../bindings/hwmon/adi,ltc2945.yaml           | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
> new file mode 100644
> index 000000000000..9ca7a886dec8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc2945.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC2945 wide range i2c power monitor
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +description: |
> +  Analog Devices LTC2945 wide range i2c power monitor over I2C.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2945.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ltc2945

That's not a correct compatible. Missing vendor prefix.

> +
> +  reg:
> +    maxItems: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Shunt resistor value in micro-Ohms
> +    default: 1000
> +
> +required:
> +  - compatible
> +  - reg
> +
> +

Just one blank line.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +           #address-cells = <1>;
> +           #size-cells = <0>;

Use 4 spaces for example indentation.

> +
> +           ltc2945_i2c: ltc2945@6e {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +              compatible = "ltc2945";
> +              reg = <0x6e>;
> +              /* 10 milli-Ohm shunt resistor */
> +              shunt-resistor-micro-ohms = <10000>;
> +           };
> +    };
> +...

Best regards,
Krzysztof

