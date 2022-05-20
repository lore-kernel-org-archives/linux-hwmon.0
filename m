Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DA3C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 14:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346616AbiETOJq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 10:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbiETOJq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 10:09:46 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7CB15F6D9
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 07:09:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w14so14479752lfl.13
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vuard3BQ666lW15aUwYrkgb69w+ZvJIZ35EbD+Vs+zo=;
        b=SMr1ToApPMAr9Z5v6I9b4LxuG57q3qN1bc0VWC2SBLBJ+mgdsPuBtTXHo8p8sK7Zex
         b1mSJzkATNbMBnZAh56xU5yBq5+iH2qWh0Z39zovRtV16d7H0NmOESjttleG9spSaUBD
         aMtSK//VkCE6aZgZwGBzW4ye/GXHVY+oLOKWbeD58Zd/OVN36L8jH1vN/Si36HlrNk7v
         k2WMQ+VgbaRJmFS+T4gS8Gm4sQHgbzJ0JnUWGZ4y/jXp/ljgNKHhW0bdcRp4UMNwyIDR
         aDs0PSA7khqyokgSEEmHAXXJiuzCwWsKemRwd+vDgIzPmIBrqlkn+cBOIpT+aoIEcmMw
         g77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vuard3BQ666lW15aUwYrkgb69w+ZvJIZ35EbD+Vs+zo=;
        b=AB8XtMviy2uxg23HXcfwWTDWu/6WHp3mlr7SXcWu1wH9h4T1Gs71wsxXzpC0voy3MP
         jn//ZV0rZUUHW/07Von9zAC2fJ4XR73nMWw3rkyIfv/HReg7lFKBcLj3/JHlI7p0dnrN
         R77p3GT2jL6G3i6pBnjzEPEyM5Uk0w0CLOFaNvo2iS9cs0p4KTiMnaou3zP9ierG5YM5
         kYn7cZvhFpPi+4QCHdwiopvykKZC/2BYQspXgtYTh3R7cVyk72XEIxL1chr3askaOMjW
         tBF6HDC2W1BuIxX/eJYyKZjk1+K+AIF7YvvPcqzQjJwfpNNuWtmH1SqH5smyYmTOvaEh
         oz9w==
X-Gm-Message-State: AOAM530NhWxXL6zmg+XdmibX51bY2xlrDrsdpoQeL5cff0GGXKZeixGA
        KK2IDEShIdZ7MuulRWWw1ugX0A==
X-Google-Smtp-Source: ABdhPJxxF1FwBSixCKHv92Vfo4lkEASO1M7bSD7Y9WkXBg51EB/xFL5QKddl2zfo7G9YgSwk4F5+Uw==
X-Received: by 2002:a05:6512:280e:b0:473:a0c9:5bdf with SMTP id cf14-20020a056512280e00b00473a0c95bdfmr6999980lfb.337.1653055783140;
        Fri, 20 May 2022 07:09:43 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m12-20020ac2424c000000b00473c87152bcsm673434lfl.127.2022.05.20.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:09:42 -0700 (PDT)
Message-ID: <b5ff0f2c-d741-6dec-c306-b54cb5075ccf@linaro.org>
Date:   Fri, 20 May 2022 16:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0b84d109-d6be-dfba-99bb-0b7136af875e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/05/2022 15:42, Guenter Roeck wrote:
>>
>>> +          A descriptive name for this channel, like "ambient" or "psu".
>>> +
>>> +      offset:
>>> +        description: |
>>
>> This does not look like standard property, so you need vendor and unit
>> suffix.
>>
> 
> Temperature offset is a standard property for temperature sensor

The original description was strictly connected to registers, so that
one as not a standard. It seems it was just a wording...

> chips with external channels, implemented by a diode or transistor.
> Making it non-standard will mean that we'll have lots of
> "vendor,offset" properties, one each for each vendor selling
> temperature sensor chips with external channels. This gets
> more complicated here because the lm90 driver does support chips
> from several different vendors. Almost all of them support
> this functionality. Which vendor do you select in this case ?
> 
> I would suggest to use temperature-offset-milliseconds, though.

Yes, this sounds good. Just not seconds but millicelsius, I guess?

> 
>>> +          The value (millidegree Celsius) to be programmed in the channel specific offset register
>>> +          (if supported by device).
>>
>> You described programming model which should not be put in the bindings.
>> Please describe the hardware.
>>
> 
> It is a configuration value, which is hardware dependent because
> it depends on the temperature diode or transistor connected to the chip.

Sure, so this could be reworded "Offset against some base value for each
channel temperature", or something similar (you know better than me).
Referring to registers and where exactly this should be programmed in
the device is related to device programming model, not to bindings.

Best regards,
Krzysztof
