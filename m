Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97123C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 13:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349910AbiETNm5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 09:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343596AbiETNm4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 09:42:56 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1120AFACD;
        Fri, 20 May 2022 06:42:55 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-f18e6ff0f6so10299782fac.11;
        Fri, 20 May 2022 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=4sjnV/DDCWmm3iG72Xau4YVUbPuvXBST7UIstJ3zKyA=;
        b=RmQVVuk1z/crRTK+8bBhne4wsV9v6WxV6hoD/iWd3BBBrwWL8BlsEnNcGelF9w/gTm
         YBq+rMks5nekVULzkzf37PLerXBVr0gsXHIMprywWjv6EO6s7K1qMB8nIimcaOGSfIay
         teaP3IQ4M6Jmgtr5tRJGKu3UZy5bBly8zzxm3A/8N7OYykVe1g+QUpJg6+NjH5z4hjXL
         EyyJqGMiET6p3i9L67tLLe6/oPFTgSOiT2XTkXGMzWztTeapbbpgpTZmoLotn8JvInjr
         T1ZWHIf09nRpEpDVbFPzeqi7s+5FtGRW1WCyhI0RKMUPpFq3oeJX6Yl3penVX5jXSmRv
         eqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=4sjnV/DDCWmm3iG72Xau4YVUbPuvXBST7UIstJ3zKyA=;
        b=RA+f0k/U+EDmk7AHRybE9EjcZJ+V0bB6+ZBq4RTY/0giR0/lwXJ7oGw8S/WqXkMSJ7
         6WtSVbTVxdvBOHZ7CmsX0PyzfovDtcne5V3M/0FK7yr8KSDSjoDJ+rym96m5T9Hsk2al
         ilKe2QqeZejqHnrigJ70QYevgNBtDlzh6Pby8sOYDZaDeQkSbM72RQDQryV69soVw2dh
         Ji6rjD1Ywgdx07Z7rVeElTcfS2N/HpEp15ab+i+8Sbb3pT0zTq0jH068ZYZ5VfXBSeu1
         SEAzKLL/99VTholb4X41BHYggt+qgtW5NV5ihAXGB71/1Ap7H+TLeTRm7BOjYsuuPZ2W
         GsqQ==
X-Gm-Message-State: AOAM5310DqqWxGeOYDAXtt4zR2o5Wj66RaHYyP/FnKt2KR7cNxX9w/zH
        RAVjsOo8g+aOXcvNp+G3Zi0=
X-Google-Smtp-Source: ABdhPJyK4r8T/x4abpb56C3DNWPOFu/dlI7orXYwBBiiVXZ8Ef9Dh0kqk91Zx24yBVsQq89ztSnBDg==
X-Received: by 2002:a05:6870:6011:b0:e6:5604:d757 with SMTP id t17-20020a056870601100b000e65604d757mr5816104oaa.204.1653054174188;
        Fri, 20 May 2022 06:42:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o83-20020acabe56000000b0032603df9d24sm959574oif.47.2022.05.20.06.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 06:42:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0b84d109-d6be-dfba-99bb-0b7136af875e@roeck-us.net>
Date:   Fri, 20 May 2022 06:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Slawomir Stepien <sst@poczta.fm>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
In-Reply-To: <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/20/22 03:13, Krzysztof Kozlowski wrote:
> On 20/05/2022 11:32, Slawomir Stepien wrote:
>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>
>> Add binding description for temperature channels. Currently, support for
>> label and offset is implemented.
>>
>> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
>> ---
>>   .../bindings/hwmon/national,lm90.yaml         | 39 +++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> index 066c02541fcf..9a5aa78d4db1 100644
>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> @@ -62,6 +62,37 @@ required:
>>   
>>   additionalProperties: false
>>   
>> +patternProperties:
> 
> Which models use this?
> 
>> +  "^channel@([0-2])$":
>> +    type: object
>> +    description: |
> 
> No need for |
> 
>> +      Represents channels of the device and their specific configuration.
>> +
>> +    properties:
>> +      reg:
>> +        description: |
> 
> The same.
> 
>> +          The channel number. 0 is local channel, 1-2 are remote channels.
>> +        items:
>> +          minimum: 0
>> +          maximum: 2
>> +
>> +      label:
>> +        description: |
> 
> The same.
> 
>> +          A descriptive name for this channel, like "ambient" or "psu".
>> +
>> +      offset:
>> +        description: |
> 
> This does not look like standard property, so you need vendor and unit
> suffix.
> 

Temperature offset is a standard property for temperature sensor
chips with external channels, implemented by a diode or transistor.
Making it non-standard will mean that we'll have lots of
"vendor,offset" properties, one each for each vendor selling
temperature sensor chips with external channels. This gets
more complicated here because the lm90 driver does support chips
from several different vendors. Almost all of them support
this functionality. Which vendor do you select in this case ?

I would suggest to use temperature-offset-milliseconds, though.

>> +          The value (millidegree Celsius) to be programmed in the channel specific offset register
>> +          (if supported by device).
> 
> You described programming model which should not be put in the bindings.
> Please describe the hardware.
> 

It is a configuration value, which is hardware dependent because
it depends on the temperature diode or transistor connected to the chip.

Guenter

>> +          For remote channels only.
>> +        $ref: /schemas/types.yaml#/definitions/int32
>> +        default: 0
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/interrupt-controller/irq.h>
>> @@ -76,5 +107,13 @@ examples:
>>               vcc-supply = <&palmas_ldo6_reg>;
>>               interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>>               #thermal-sensor-cells = <1>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
> I assume you tested the bindings with dt_bindings_check?
> 
> I have some doubts, as this should fail.
> 
>> +
>> +            channel@0 {
>> +                reg = <0x0>;
>> +                label = "internal";
>> +                offset = <1000>;
>> +            };
>>           };
>>       };
> 
> 
> Best regards,
> Krzysztof

