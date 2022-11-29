Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3CBC4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 15:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbiK2Pw3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 10:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiK2Pw2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 10:52:28 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C6DC46
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 07:52:27 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 140so14093992pfz.6
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 07:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUXPD428lBYhvSvCQztehA2Z3LbCwL5Ik8XHuLVfb/M=;
        b=CmCcjDj3JCqVJtYLhUw4QDs200UMxPYISi8vse95iApevLls+sDrHmvVzRIAqcTmh3
         8kI/5WcdO1uyn2GHEGW+1lOWH5jn4/Si2m/aePArWyrQ0cvzWbFMZGpGgQ91oNK/pqeB
         GK1NZOrrV4GyGZt+RBNYvKxvtmZi0kJZoTPvuUeGv2amsYPZbdfhwM05qHw5FOb54tkg
         5PVOfEo0vLuhjCbnGX5VDTFq39aqGGctyGxRfcoSAhAij7Csns+1E+1vZG7fxSaXYaHN
         fcSFj9uVAHRbi3RhWkTy5Fszw1LtWLgla2YVxx1VOZGUWZol3c4yYvJ8O0G5GqZ/k01S
         XRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUXPD428lBYhvSvCQztehA2Z3LbCwL5Ik8XHuLVfb/M=;
        b=aRAvOI3X4qcooucrGKdxzmbZl5R3BRzG6CxcnKlQ5DKPWPMK5NTrTrvPeHo07Vu4It
         1rE+7195Cw6AoE5g9W3RULqAB8EtuU7956EsBcax+D73cdwFWsEk5IFlMw6Cwag8v3R4
         fEOglz2+dlsO9750c/MztUnJdE+GyepNQgmp3WSv6DpRRwnk60mxRFziVQ+pKNBduQHn
         OtZjMGFNFdlPPdeciOXcDASQfud2xy3lIqDc5CUZ4Jp3iJioSudJuic5AEmo6nVGn2mo
         xDNGFHcEJ+jGwYyn3So9s7u6/794tu3+3qaohHvm4F72Viffx3WTj/y3Ty62Uw3zMdlB
         dsmw==
X-Gm-Message-State: ANoB5pn7UM+ZMoiauyjfKQXt0iMzIiOnOghgnPTHtbBEF9IIZvgWsce9
        1kRovfYjy5u5MDDNqrlIGJw+eiihz8gi+obP
X-Google-Smtp-Source: AA0mqf58k9X2ecMsq50j2paFChgEdufVtlAKglPxBmptmeIobeVtP6mbLKMyoJ1xZl86jybLkdSJlw==
X-Received: by 2002:a63:e411:0:b0:45f:b2a7:2659 with SMTP id a17-20020a63e411000000b0045fb2a72659mr33175657pgi.132.1669737147134;
        Tue, 29 Nov 2022 07:52:27 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b00176ba091cd3sm11073557plh.196.2022.11.29.07.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 07:52:26 -0800 (PST)
Message-ID: <dad4d480-8c72-46da-b0ad-4a8235bb03cf@9elements.com>
Date:   Tue, 29 Nov 2022 21:22:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add binding for max6639
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <b6943ec7-8fcd-08dc-605d-4a23629bc39c@linaro.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <b6943ec7-8fcd-08dc-605d-4a23629bc39c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Krzysztof,

On 29-11-2022 01:44 pm, Krzysztof Kozlowski wrote:
> On 21/11/2022 13:29, Naresh Solanki wrote:
>> From: Marcello Sylvester Bauer <sylv@sylv.io>
>>
>> Add Devicetree binding documentation for Maxim MAX6639 temperature
>> monitor with PWM fan-speed controller.
>>
>> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
>>   .../bindings/hwmon/maxim,max6639.yaml         | 93 +++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>> new file mode 100644
>> index 000000000000..da040b11d2ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max6639
>> +
>> +maintainers:
>> +  - Roland Stigge <stigge@antcom.de>
>> +
>> +description: |
>> +  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
>> +  fan-speed controller.  It monitors its own temperature and one external
>> +  diode-connected transistor or the temperatures of two external diode-connected
>> +  transistors, typically available in CPUs, FPGAs, or GPUs.
>> +
>> +  Datasheets:
>> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max6639
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  '#pwm-cells':
>> +    const: 3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +patternProperties:
>> +  "^fan@[0-1]$":
>> +    type: object
>> +    description: |
>> +      Represents the two fans and their specific configuration.
>> +
>> +    $ref: fan-common.yaml#
> 
> unevalauatedProperties: false
> 
Sure
>> +
>> +    properties:
>> +      reg:
>> +        description: |
>> +          The fan number.
>> +        items:
>> +          minimum: 0
>> +          maximum: 1
> 
> This is a bit unusual syntax. Drop "items", I think it should be more
> obvious.
> 
Sure
>> +
>> +    required:
>> +      - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        fan1: fan-controller@10 {
>> +            compatible = "maxim,max6639";
>> +            reg = <0x10>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            #pwm-cells = <3>;
>> +
>> +            fan@0 {
>> +                reg = <0x0>;
>> +                pulses-per-revolution = <2>;
>> +                max-rpm = <4000>;
>> +                target-rpm = <1000>;
>> +                pwms = <&fan1 0 25000 0>;
>> +            };
>> +
>> +            fan@1 {
>> +                reg = <0x1>;
>> +                pulses-per-revolution = <2>;
>> +                max-rpm = <8000>;
>> +                pwms = <&fan1 1 25000 0>;
>> +            };
>> +            };
> 
> Fix indentation.
>
Sure

>> +    };
>> +...
> 
> Best regards,
> Krzysztof
> 
Regards,
Naresh
