Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B119BC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 May 2022 09:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236453AbiEPJXc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 05:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242139AbiEPJXb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 05:23:31 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB892611E
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 02:23:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s27so17360839ljd.2
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NvydcHlnhdK9kc4OfVqFwwIvpGjIQUnM+1HuEKYA8RM=;
        b=Q8iuflZ5AZJhoe8B5r30/nWl6OxiJJ3YM6kuLmwCi43LhMwNJtxzA8V5jl5r1sSUYU
         r3ioZ5kmI4VPe3Hw1kx8VGlTNUGEvgH0qtL8UED5yzH36uBdV4JNRkQipThbRxjB+DKl
         odUH6KBd9wGWC1d0UlA94JCDrAf/fJBTKwMkM2BYbXIuNYE6q7aIRl1nCGspUK52qwZc
         ErRXrRqOznIqnl231VhYKhNw2/xGgYQ/xkr8X4whwIe5l6zC0TodYLOx45AlLZU7FOYD
         xLwOkKD2Jk5i8zMhAuacPXky1t7YbXt5Af6LN5HpuBWQggOUQGQF8vk1ZAb/XL5tAeGV
         k2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NvydcHlnhdK9kc4OfVqFwwIvpGjIQUnM+1HuEKYA8RM=;
        b=PrHSQ8BJPoNN4G6yPbyqHNxxu3igniMQI+0RgvUsZFS+9PqgSHDcH1tQ8IudVoUnMl
         nBzKFqZuJLvB5LlS1zSkZAAJ3mkDWX2E1QVO/aLlE289ejAaL8qARDtQDvBBZkkg8w7f
         ovtkOqrVJfGJI/gk/fUw16qt78N6/8mnA5KHTzSzM14qHtVugkTM1NVIfIX2TWE0dH+X
         J0gOENKscc2JxqRd1HjNWXoposl9JcQlLYe2jand38YVKNYYtbHayO+8UwQgUyrfVghy
         5VxXw9PxO8JTsEZog7h3UWuBdu20Js26Ku7m/KNucqmONynByg2dz/W/KY1WYXBpYF2S
         gL/w==
X-Gm-Message-State: AOAM532PKBADZNZLx90lidTyZdFBt2s0VJbF1T381MzFEYHdzxeQVMcn
        sdD5Nd6E5+9oxUEKgshLHeaO3m8hZ1DGKrlo
X-Google-Smtp-Source: ABdhPJyrVikHvibMc5X5b0rdYgB3XLL1YjeMbVTCRJh7+3ZVBcwUMxH0dvLhK8QFngvSbMyPEXhhiQ==
X-Received: by 2002:a2e:a4ce:0:b0:24f:3a5f:1205 with SMTP id p14-20020a2ea4ce000000b0024f3a5f1205mr2500518ljm.485.1652693001803;
        Mon, 16 May 2022 02:23:21 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h19-20020a2e9013000000b00250a09889a1sm1501878ljg.16.2022.05.16.02.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 02:23:21 -0700 (PDT)
Message-ID: <73e198d3-41ed-a462-d60a-8f5445a69395@linaro.org>
Date:   Mon, 16 May 2022 11:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
 <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
 <b895f874-c8b8-3889-c7c9-0c0494e9bae0@linaro.org>
 <85d1ed0b-1e1f-bee7-9b0f-fbbf50921ad0@roeck-us.net>
 <15cb434a-7a64-58bb-083c-fa7aeacae672@linaro.org>
 <DB9PR06MB7289FE0306B5E021321B6FFFF7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB9PR06MB7289FE0306B5E021321B6FFFF7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 16/05/2022 11:15, Holger Brunck wrote:
>> On 11/05/2022 19:40, Guenter Roeck wrote:
>>>> Me neither. Just pick one matching the device actually using this
>>>> property. If all of them are using it, how about keeping old "national"
>>>> or it's owner "ti"? If not all of them are using it, then this would
>>>> need "allOf:if:then" restricting where the property is (not) applicable.
>>>>
>>>
>>> It is only applicable for tmp451, tmp461, and adt7461[a], so it looks
>>> like "allOf:if:then" will be needed.
>>
>> Yes, please.
>>
> 
> ok I will have a look.
> 
> I noticed that tmp461 is missing at all in the yaml file, so this needs to be
> added too. Should this go into a separate patch?

That one was about adding extended range, so yes - adding more
compatibles or other features should be in separate patches.


Best regards,
Krzysztof
