Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B42C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 13:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348752AbiETNfE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 09:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349821AbiETNfD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 09:35:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8F616A252
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 06:35:01 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y32so14356260lfa.6
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=69D+YW++MHNclxhmoeey4e8MxuVXH7gjgrPLCg8Fvps=;
        b=laP3lG1AW3H2ExBxVrqD7NrSHCAmKTYoc7xvAoAj4sZss+bPSlBg+s7373ROM/d7+n
         DFcK4qOJrMimpDkohZUpUizODbeuDNNwUd8onvJh+REDGjkXaVEkKzKxsYW7kqo2Qfb+
         PTYZuJLqclzTaoE2DJ3zyQrp+aEsoBLSV/wF04jphjQz0NSoj11oJMIqVoRmfeJ60XLN
         /jamq1q8JFSC4jV5VdHQUWBjx7n0Uqcpm2bsnCko+L8RteE4UpvZbvHlncCi7TacPRUU
         N18ayBUEZw2CqyPHwhiiLfcGlE2s9fPUqfbMGSJqATDqQXc5I64c8NdyQZqAP8v92C+f
         1HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=69D+YW++MHNclxhmoeey4e8MxuVXH7gjgrPLCg8Fvps=;
        b=5dzgS/ql5FYt55T58qgJTH0QdCwhHllAA+G/v7V8ktuveW953fE6dnLMQ0qKA3CDEN
         MPj640xK8QiOYR5KqHQClxQ3kU3GkTvz0QKYYFkCLqu+I1y5WEFYjv+l2L5YiHZRdFV7
         GDkeBFvuExx4/GgZChG2RKdOp9pdEBeXOJA7UEVQdslif1ekoGISBwooUSBeYRw7m1A8
         8WYu3jt05kl0HfbrAk9H13hJknl4hHSB6isWZOkkTsnfaoXJt1HQWPpEimhtUmk04zSz
         LXB99s+VLZGZSL2XDvlxvoywL3F6NCpoKFEctpIgrNRvckkVFRhFB5ZnX6Pxvzq3IBuV
         x9tQ==
X-Gm-Message-State: AOAM532rQCayKpiAGS54zMEqbf3shPqc+efRlCYAUdyW/sx1AanXtnw/
        y5qut4NFJTdIYErZZbWxlNDaQA==
X-Google-Smtp-Source: ABdhPJzqmPszJcZRXvOjBAV566VdlFtzlV4R3Bn7VkNgsJcs0BfFN+2qr/4VUbR5RI1DRihyTUGpgQ==
X-Received: by 2002:ac2:42d1:0:b0:474:68f:2e48 with SMTP id n17-20020ac242d1000000b00474068f2e48mr6815458lfl.215.1653053700025;
        Fri, 20 May 2022 06:35:00 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d25-20020ac244d9000000b0047255d21165sm664300lfm.148.2022.05.20.06.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 06:34:59 -0700 (PDT)
Message-ID: <a3e0fb6b-064a-c0a5-2189-488c6f19cb96@linaro.org>
Date:   Fri, 20 May 2022 15:34:58 +0200
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
 <0e0dd0a1-0312-46f0-40b3-d3d2576ef08f@linaro.org>
 <YoeWXEb+iNIpFZVR@t480s.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YoeWXEb+iNIpFZVR@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/05/2022 15:23, Slawomir Stepien wrote:
>>>>>  
>>>>> +patternProperties:
>>>>
>>>> Which models use this?
>>>
>>> This is used in tmp421 model.
>>
>> Then please add allOf:if:then disallowing the property for other models.
> 
> A misunderstanding. The channel node can be used by every device supported by lm90. At least each
> channel of each device can have label.

OK

> 
>>>>> +  "^channel@([0-2])$":
>>>>> +    type: object
>>>>> +    description: |
>>>>
>>>> No need for |
>>>
>>> Will fix in v2.
>>>
>>>>> +      Represents channels of the device and their specific configuration.
>>>>> +
>>>>> +    properties:
>>>>> +      reg:
>>>>> +        description: |
>>>>
>>>> The same.
>>>
>>> Will fix in v2.
>>>
>>>>> +          The channel number. 0 is local channel, 1-2 are remote channels.
>>>>> +        items:
>>>>> +          minimum: 0
>>>>> +          maximum: 2
>>>>> +
>>>>> +      label:
>>>>> +        description: |
>>>>
>>>> The same.
>>>
>>> Will fix in v2.
>>>
>>>>> +          A descriptive name for this channel, like "ambient" or "psu".
>>>>> +
>>>>> +      offset:
>>>>> +        description: |
>>>>
>>>> This does not look like standard property, so you need vendor and unit
>>>> suffix.
>>>
>>> Currently in lm90 we have support for devices that have different width (including sign) for offset
>>> register. We have 10 bits, 11 bits and 12 bits. Do I understand correctly that I can use the same
>>> vendor prefix if the width is the same? Just like "ti" was used for adi and ti in
>>> "ti,extended-range-enable"?
>>>
>>> For example:
>>>
>>> adi,10-bit-offset-millicelsius # (only for adt7481)
>>> adi,11-bit-offset-millicelsius # (for adt7461 but also for lm90 and others)
>>> ti,12-bit-offset-millicelsius  # (ti - since only tmp451 and tmp461 supports 12 bit)
>>
>> Wait, these are then strictly per-compatible, so there is no sense in DT
>> property at all.
> 
> But isn't the value of offset a hardware-design-time calculation? So if I have a piece of
> hardware that describes itself using device-tree, then offset information should be stored on the
> device-tree rather then be "calculated" by the software running on that piece of hardware?
> 
> And what if such piece of hardware has been changed (e.g. new PCB version) and now the offset are
> different? Then if device-tree is on hardware (e.g. on EEPROM) with new offsets, then software would
> not require a change to support this new hardware version.

OK, I misunderstood.

This should be only one property then, choose some reasonable vendor,
and in allOf:if:then you can put constraints about minimum/maximum
values per model.

Best regards,
Krzysztof
