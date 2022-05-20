Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DB6C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 12:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348591AbiETMrN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 08:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239160AbiETMrM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 08:47:12 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD05679398
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 05:47:10 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id e4so8997390ljb.13
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6XjZCY756KPit2Ss8z2BIiQdnfZ6Pvc8gtf2ue1/+6k=;
        b=vDO+00dTVaD5pXExs+VhEQBJsjL9ZgRmUN2i8NroXb/Lc1Ck0ZJ/xPUBzXkwSp0Biq
         0z995sBqPSAGxFvKILSw8MX4jhDQI2OVuHtU9Jy7aS0ales7e5WqynDTuLdlqSqvl04C
         7DNswUskS/DRAHkzCpFE7rb6H9lXP2SKw+9Ktcus3I90x/2okqGhtoCjoKsh2egk4Bnz
         pza4W7dkEZnZprqZ7KzxB8TLsQgTP64gc9evLU1r53LNp1qyDw5Y8dPdEMLfb5rMqH5a
         eqd1Rx7lmMReZN26uiVE9Uqoy6Kf2nkKor+lJG2G831hNtKpD/5yCRU2FpJPyPZZ9MAU
         HWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6XjZCY756KPit2Ss8z2BIiQdnfZ6Pvc8gtf2ue1/+6k=;
        b=CS8qNGXe2VvVi2MXEp1uL3NsAqu7uNEB6OBLT9qy1pkYJIL4Q6FTiRbG2PM/0e5eiK
         dV1zIV44NUTv41JSH113GMUET4vF3bXJgP2LdmZbCdYty0OxxKOMSV/Q3Y5V5QxBg9s0
         r4Nik8CbUkQwSzUDgclEaEn0SoLKOyb5siO+11Ll71G7fisrI44fINwzU12XtYj9kHF5
         xDpXf5cPP/2JQMy2iRTf09cGQ2CaqMhrVFkLZBE915V0R+kmLvXGLrPJ6i+wB3pxpziU
         tsDexd/lkFqfOTJuWPXi3OicnhBcVTjrA5CEAtiBC+OlGE4LqEMzlcGvkcTe/mosNF6k
         /KyA==
X-Gm-Message-State: AOAM5304wBWQ15ZRW6NLWKtWWt7TkLE2IEVwnObREvULN9sz5bdv/aBk
        Ek2VxZar9RkshXpykbxJkLddvg==
X-Google-Smtp-Source: ABdhPJzSMwcLqnffUq2TA8e/v4JG+J7i+J339pLj5B4YgUwzCEaHgMJU1oxdENxuhmlLzt2dzVc8Cw==
X-Received: by 2002:a2e:9941:0:b0:247:dce8:b0ec with SMTP id r1-20020a2e9941000000b00247dce8b0ecmr5588141ljj.404.1653050829034;
        Fri, 20 May 2022 05:47:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q7-20020ac25287000000b0047255d211f4sm646717lfm.291.2022.05.20.05.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:47:08 -0700 (PDT)
Message-ID: <0e0dd0a1-0312-46f0-40b3-d3d2576ef08f@linaro.org>
Date:   Fri, 20 May 2022 14:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
 <YoeLuffNoUoNx2Bc@t480s.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YoeLuffNoUoNx2Bc@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/05/2022 14:38, Slawomir Stepien wrote:
> On maj 20, 2022 12:13, Krzysztof Kozlowski wrote:
>> On 20/05/2022 11:32, Slawomir Stepien wrote:
>>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>>
>>> Add binding description for temperature channels. Currently, support for
>>> label and offset is implemented.
>>>
>>> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
>>> ---
>>>  .../bindings/hwmon/national,lm90.yaml         | 39 +++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> index 066c02541fcf..9a5aa78d4db1 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> @@ -62,6 +62,37 @@ required:
>>>  
>>>  additionalProperties: false
>>>  
>>> +patternProperties:
>>
>> Which models use this?
> 
> This is used in tmp421 model.

Then please add allOf:if:then disallowing the property for other models.

> 
>>> +  "^channel@([0-2])$":
>>> +    type: object
>>> +    description: |
>>
>> No need for |
> 
> Will fix in v2.
> 
>>> +      Represents channels of the device and their specific configuration.
>>> +
>>> +    properties:
>>> +      reg:
>>> +        description: |
>>
>> The same.
> 
> Will fix in v2.
> 
>>> +          The channel number. 0 is local channel, 1-2 are remote channels.
>>> +        items:
>>> +          minimum: 0
>>> +          maximum: 2
>>> +
>>> +      label:
>>> +        description: |
>>
>> The same.
> 
> Will fix in v2.
> 
>>> +          A descriptive name for this channel, like "ambient" or "psu".
>>> +
>>> +      offset:
>>> +        description: |
>>
>> This does not look like standard property, so you need vendor and unit
>> suffix.
> 
> Currently in lm90 we have support for devices that have different width (including sign) for offset
> register. We have 10 bits, 11 bits and 12 bits. Do I understand correctly that I can use the same
> vendor prefix if the width is the same? Just like "ti" was used for adi and ti in
> "ti,extended-range-enable"?
> 
> For example:
> 
> adi,10-bit-offset-millicelsius # (only for adt7481)
> adi,11-bit-offset-millicelsius # (for adt7461 but also for lm90 and others)
> ti,12-bit-offset-millicelsius  # (ti - since only tmp451 and tmp461 supports 12 bit)

Wait, these are then strictly per-compatible, so there is no sense in DT
property at all.

> 
>>> +          The value (millidegree Celsius) to be programmed in the channel specific offset register
>>> +          (if supported by device).
>>
>> You described programming model which should not be put in the bindings.
>> Please describe the hardware.
> 
> I am also not sure about the "-millicelsius" in example above. From device point-of-view, this
> offset is just two's complement, so is it more desirable to have the values here as just bytes
> rather than millicelsius?

No, the programming model of a device can change and should be
abstracted to hardware property.

> 
>>> +          For remote channels only.
>>> +        $ref: /schemas/types.yaml#/definitions/int32
>>> +        default: 0
>>> +
>>> +    required:
>>> +      - reg
>>> +
>>> +    additionalProperties: false
>>> +
>>>  examples:
>>>    - |
>>>      #include <dt-bindings/interrupt-controller/irq.h>
>>> @@ -76,5 +107,13 @@ examples:
>>>              vcc-supply = <&palmas_ldo6_reg>;
>>>              interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>>>              #thermal-sensor-cells = <1>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>> I assume you tested the bindings with dt_bindings_check?
>>
>> I have some doubts, as this should fail.
> 
> I did. All was fine. What should fail here?

This:

linux/out/Documentation/devicetree/bindings/hwmon/national,lm90.example.dtb:
sensor@4c: '#address-cells', '#size-cells' do not match any of the
regexes: '^channel@([0-2])$', 'pinctrl-[0-9]+'

	From schema:
linux/linux/Documentation/devicetree/bindings/hwmon/national,lm90.yaml


So no, you did not test it. Asking reviewer to perform a test which you
can do by yourself is a huge waste of reviewers time.

Best regards,
Krzysztof
