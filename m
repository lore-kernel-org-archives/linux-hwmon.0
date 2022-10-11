Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0752AC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Oct 2022 16:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiJKQa4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Oct 2022 12:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiJKQaz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Oct 2022 12:30:55 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5828320A
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 09:30:52 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id y10so1712449qvo.11
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pU7/qLIZlRJ/R4mlvFCeovRRngxUjH1RreDTH1YVmlo=;
        b=uLYDIRRsPAZYmXDXRk4eSOoc1hU4DF+sIPs0UQMjQx8IuTIC14QtqaSv3kZhTBCNP0
         LN6xMOzn3kQqzfR2wNfXOBd/L43VF9ilAs/jcdTp91t6hkNCuv43AINdilHrZf3F6HuF
         nRQq/JxT3O01uO+i/Emf+EUCuvxnvxGRz7d/XhoZJMaWCisG2L2Ro8Dl9sgibVLhcEsF
         aF0x/XmtrmXGQW9wjMQ0G03tQC9aefcI3bEdwDK5PhAdVzlAymL0MLobBNjMZm4rYcxQ
         EC8nccyBBoSBk4sVdweGtK5YA3vUJgiRP4rqfQnqGV61sqHNbVsd8acDUZiITfovVjDp
         9u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pU7/qLIZlRJ/R4mlvFCeovRRngxUjH1RreDTH1YVmlo=;
        b=npt9Lv9A++kHciBQaYVx3zkdnDl/Otqik1nVHWqZXBtjW4YCm7I+m/brF7sJ86Q636
         Kz4y+SgjQN/91Wl+O6XzY7HY1fS2KZRQ4Xsd2M2cCXITe5Td/KjBWt+nUO8wGw8ogXkG
         4qsYyaVeKI6oy80L1wQIPZnADCcyQkSin1urj5IkyHOASKIq6bjMvsdTlKxnYxQk+tAQ
         EsM9OOIL+sTFd8D//qRgYxTVJYGcvHi+6AklnCBhPawJSQVum8prOkqxdTUK+NdkGEhX
         GCZrEc540RO8QTcbZax0K1UdcpzdPz8XPG2zLjMrVwAqDVJBBi6m+4hVwA01hkb6L1tk
         z8xQ==
X-Gm-Message-State: ACrzQf0CtJtSWib3r0Cv7g+2pJ/ZhrnqG8r1aqcw2P5Wb+ViwmnCspjI
        xgYLaBVhYCX06X129LSUy3SlyA==
X-Google-Smtp-Source: AMsMyM6SMPep1DkKp9q4NOokgXy8tqKkhzu7TqOCch26H7ieS9xI2hl+9/rIJZqTjKucCn9yA6HpYQ==
X-Received: by 2002:a05:6214:29e3:b0:4b3:f368:de31 with SMTP id jv3-20020a05621429e300b004b3f368de31mr10568879qvb.127.1665505852023;
        Tue, 11 Oct 2022 09:30:52 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id x14-20020a05620a448e00b006b949afa980sm13732634qkp.56.2022.10.11.09.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 09:30:51 -0700 (PDT)
Message-ID: <b0519e16-7826-a043-d0a4-7a2f43d0ae94@linaro.org>
Date:   Tue, 11 Oct 2022 12:28:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/3] dt-bindings: hwmon: Add binding for max6639
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
References: <20221011104739.53262-1-Naresh.Solanki@9elements.com>
 <20221011104739.53262-3-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011104739.53262-3-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/10/2022 06:47, Naresh Solanki wrote:
> From: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  .../bindings/hwmon/maxim,max6639.yaml         | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..bbefb0a57ab3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> @@ -0,0 +1,116 @@
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
> +
> +patternProperties:
> +  "^ot[0-1]_indication$":

No underscores in names.

> +    type: boolean
> +    default: false
> +    description:
> +      If true then enable OT pin indication.

Description copies the name of property. Not really useful. Describe
that it does.

Why this has 0 and 1 numbers? Isn't it connected with fan?

> +
> +  "^therm[0-1]_indication$":
> +    type: boolean
> +    default: false
> +    description:
> +      If true then enable THERM pin indication.

Ditto

> +
> +  "^fan@[0-1]$":

[01]
The same in other cases.

> +    type: object
> +    description: |
> +      Represents the two fans and their specific configuration.
> +
> +    $ref: fan-common.yaml#
> +
> +    properties:
> +      reg:
> +        description: |
> +          The fan number.
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +      maxim,fan-spin-up:
> +        type: boolean
> +        description:
> +          If true then whnever the fan starts up from zero drive, it

whenever
run spell-check

> +          is driven with 100% duty cycle for 2s to ensure that it
> +          starts.
> +
> +      maxim,full-speed-on-therm:
> +        type: boolean
> +        description:
> +          If true then force fan to full speed if THERM pin goes low.
> +
> +      maxim,fanfail_indication:

No underscores

> +        type: boolean
> +        description:
> +          If true then enable fanfail pin indication.

Missing blank line

> +    required:
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      max6639@10 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "maxim,max6639";
> +        reg = <0x10>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan@0 {
> +          reg = <0x0>;
> +          pulses-per-revolution = <2>;
> +          max-rpm = <4000>;
> +          pwm-frequency = <25000>;
> +        };
> +
> +        fan@1 {
> +          reg = <0x1>;
> +          pulses-per-revolution = <2>;
> +          max-rpm = <32000>;
> +          pwm-frequency = <25000>;
> +        };
> +      };
> +    };
> +...

Best regards,
Krzysztof

