Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5293BC43334
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Jul 2022 15:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235611AbiGVPN0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Jul 2022 11:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235681AbiGVPNU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Jul 2022 11:13:20 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E919A5C0
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Jul 2022 08:13:19 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d10so4689775pfd.9
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Jul 2022 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xPGyI3xzEHeoa7HA2eZbRsUxmhx3KSCJL3UzAyG2PAE=;
        b=PXxz5ORXrcoMB8LZGj3nvG7fMWCawQLBmMPLgONh5owPMuqTkHjnFCuzWOeeGvAKlj
         2gQ0LHgeao0bfPIEB44RZUFwNgG8fdecLozcNdlXGIFIY822DBMy6ER9sLsP7zrokp59
         cfINtly9q+k+N1uOZa1KvT/imN0wN4jlz0vIyxNv6Mpl3CWTNcSYqEauW7LiVQrCioiO
         WUximXLiMDS82jD/EFuWYXiZoehUta+7OIHdGA6vuQvBE/Y4qDeOls8WdrXan3xxi4/H
         n12hQ1Rc+xBSKu3zds0hSvCUl/ok1AiKjlqhebMjRos2j/Jc537P5QdzFcxygtgAC0Va
         Admg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xPGyI3xzEHeoa7HA2eZbRsUxmhx3KSCJL3UzAyG2PAE=;
        b=BrY1pphMj3qfynW7+YpKAZPcN8FLZThag0XJoimYO1FGI22/o3pSwrxbrEDcDynhM3
         MxCt8x+JQ3Ivxft8TniE2RXX6rLHf+Yz63jRM73RVetEgxnauLjjQgofaiLwZvjuTLWq
         /49a3aFNVHP2FMhAOA4xYujnD00UL9AWWND6vxcc9AkSM1J+6LTtajy2td42gzOjey5t
         nAOzqiFwLEokkKUWvs5bzDgBbWQieKqBoaaCEH4uYv1WXGvlnuN/GkioYbnjO8qVMT2C
         1475aZGUgQSqBqWrefpTFCPsu/wNaB6/KiIErfbVJcekr9IMGy2zrFXs2GkbSfmjUy74
         oeQQ==
X-Gm-Message-State: AJIora8dxUUKpdMSR55AZ0aYIbDyQvftajx4ziQrdJvBT8L8kwoh24wA
        jZoRs+BbMIObmMXNTJdzsF/+nUWTdApwgA==
X-Google-Smtp-Source: AGRyM1thTfnhLsaWMn1iB+gt2BvOE/FTDazOgnGEQkFNeCT4akHTcqNXtMLvyZSTDzm6wL2et/lyKg==
X-Received: by 2002:a63:65c2:0:b0:419:8146:b1a7 with SMTP id z185-20020a6365c2000000b004198146b1a7mr267605pgb.210.1658502798662;
        Fri, 22 Jul 2022 08:13:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13-20020a65684d000000b00419cde333eesm3498202pgt.64.2022.07.22.08.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 08:13:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9608658b-5110-5035-8c73-825b6b531d28@roeck-us.net>
Date:   Fri, 22 Jul 2022 08:13:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Roland Stigge <stigge@antcom.de>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>
References: <20220707161245.1229280-2-Naresh.Solanki@9elements.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220707161245.1229280-2-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/7/22 09:12, Naresh Solanki wrote:
> From: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

You didn't copy devicetree maintainers, so you won't get the necessary
Reviewed-by: tags.

Guenter

> ---
>   .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++++++++
>   1 file changed, 112 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..c845fb989af2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> @@ -0,0 +1,112 @@
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
> +required:
> +  - compatible
> +  - reg
> +  - "fan@0"
> +  - "fan@1"
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^fan@[0-1]$":
> +    type: object
> +    description: |
> +      Represents the two fans and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The fan number.
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +      pwm-polarity:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        default: 1
> +        description:
> +          PWM output is low at 100% duty cycle when this bit is set to zero. PWM
> +          output is high at 100% duty cycle when this bit is set to 1.
> +
> +      pulses-per-revolution:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2, 3, 4]
> +        default: 2
> +        description:
> +          Value specifying the number of pulses per revolution of the controlled
> +          FAN.
> +
> +      maxim,rpm-range:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [2000, 4000, 8000, 16000]
> +        default: 4000
> +        description:
> +          Scales the tachometer counter by setting the maximum (full-scale) value
> +          of the RPM range for max6639.
> +
> +    required:
> +      - reg
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      max6639@10 {
> +        compatible = "maxim,max6639";
> +        reg = <0x10>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan@0 {
> +          reg = <0x0>;
> +          pwm-polarity = <1>;
> +          pulses-per-revolution = <2>;
> +          maxim,rpm-range = <4000>;
> +        };
> +
> +        fan@1 {
> +          reg = <0x1>;
> +          pwm-polarity = <1>;
> +          pulses-per-revolution = <2>;
> +          maxim,rpm-range = <4000>;
> +        };
> +      };
> +    };
> +...

