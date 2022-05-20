Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DBDC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 14:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350219AbiETOWt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 10:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345975AbiETOWs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 10:22:48 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8135599680;
        Fri, 20 May 2022 07:22:46 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-e656032735so10536591fac.0;
        Fri, 20 May 2022 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=NNG0/cFL3AeUZtl53fmWMe05hES2gJFL9P71rTMoX34=;
        b=caIEzkmbjlnUED+MjaA8/1SLAhysfVtiBZXt6nwAjPbJn4KpN/L+ZNGo7r8pDJmH4q
         7SGagIWE2XXt4EawrvWlg8Csih2m/WHp5ViwMm24KIJF/OB19drkEXElYxWoC2bYi+kY
         rCsdrhj5My7zR0Qwa8gQpSzw3iCb5TX2pYN0Gs0GpzQlxRMEVjH1qUJ9322Tqb1P3mdW
         sR+wY2ceJAFBAl6WWGxwefIV5r8nft/z62vwcrxpnr6YgW4ZnOv6Sed7JKpyZIdF6e7Q
         nSX1c6X26Gm7MsKm4dDItAfRazNN+jFPwWCAerqrAnTkAXL/sHrLEZVv1zkBouIx4lrE
         EWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=NNG0/cFL3AeUZtl53fmWMe05hES2gJFL9P71rTMoX34=;
        b=RTmVVFq/ua92xU777+g1UjJd4ny1p2fCq159wkmlPR9qV3XM8vBOyUdlNBxL4TqMdr
         XY6Jt93b1G3Adx43yDezXm/ih/tMnYVzQWEg+8yRpvvAl6q+ylHOfdUJYY+w8KtIGz4W
         bh/9yH+6KA2jLFGfjXIBG1qrNcC8W4p0xRbPyzh/X/1uZotQpr/bu2O/l1AHVhi1ewxI
         fM5wj72v+zGRfhqUbiC2w47EMR9EFHhSn+O/a8WeF1Bz0au4vwrPswj4N7jBQ1yZ+eS/
         LXRp2jX6AfvRhvv/IphAFT4VngT/I4syrQyFjg3LUVAy3m1I1YFeuzLPEjSqw+gZ6a0B
         8G2w==
X-Gm-Message-State: AOAM531h93Y/hb7O2h4pabAFCvv/5vILCWwcG9zqf/rE3gkduc2gmZAv
        AnuhDgMXdkExOGvluQKDMEM=
X-Google-Smtp-Source: ABdhPJxpz/w0SPG1qGQ8p307VYi+CirvgZUTrGfFgR66aMj3TAHJLlIAjPU8VrjziY90zN2O91iv0w==
X-Received: by 2002:a05:6870:b30a:b0:f1:90bb:d4ae with SMTP id a10-20020a056870b30a00b000f190bbd4aemr5594991oao.299.1653056565512;
        Fri, 20 May 2022 07:22:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p21-20020a4a8e95000000b0040e5ff4a737sm986099ook.26.2022.05.20.07.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:22:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f124cbcb-3fca-3f1c-f47e-730f15c1f074@roeck-us.net>
Date:   Fri, 20 May 2022 07:22:42 -0700
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
 <0b84d109-d6be-dfba-99bb-0b7136af875e@roeck-us.net>
 <b5ff0f2c-d741-6dec-c306-b54cb5075ccf@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
In-Reply-To: <b5ff0f2c-d741-6dec-c306-b54cb5075ccf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/20/22 07:09, Krzysztof Kozlowski wrote:
> On 20/05/2022 15:42, Guenter Roeck wrote:
>>>
>>>> +          A descriptive name for this channel, like "ambient" or "psu".
>>>> +
>>>> +      offset:
>>>> +        description: |
>>>
>>> This does not look like standard property, so you need vendor and unit
>>> suffix.
>>>
>>
>> Temperature offset is a standard property for temperature sensor
> 
> The original description was strictly connected to registers, so that
> one as not a standard. It seems it was just a wording...
> 
>> chips with external channels, implemented by a diode or transistor.
>> Making it non-standard will mean that we'll have lots of
>> "vendor,offset" properties, one each for each vendor selling
>> temperature sensor chips with external channels. This gets
>> more complicated here because the lm90 driver does support chips
>> from several different vendors. Almost all of them support
>> this functionality. Which vendor do you select in this case ?
>>
>> I would suggest to use temperature-offset-milliseconds, though.
> 
> Yes, this sounds good. Just not seconds but millicelsius, I guess?
> 

Uuh, yes. Sorry, must be too early in the morning here.

>>
>>>> +          The value (millidegree Celsius) to be programmed in the channel specific offset register
>>>> +          (if supported by device).
>>>
>>> You described programming model which should not be put in the bindings.
>>> Please describe the hardware.
>>>
>>
>> It is a configuration value, which is hardware dependent because
>> it depends on the temperature diode or transistor connected to the chip.
> 
> Sure, so this could be reworded "Offset against some base value for each
> channel temperature", or something similar (you know better than me).
> Referring to registers and where exactly this should be programmed in
> the device is related to device programming model, not to bindings.
> 

Maybe something like "Temperature offset to be added to or
subtracted from remote temperature measurements".

Thanks,
Guenter
