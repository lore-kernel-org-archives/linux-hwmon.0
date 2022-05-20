Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E13FC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 14:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350068AbiETODA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 10:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236471AbiETOC7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 10:02:59 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8578BD34;
        Fri, 20 May 2022 07:02:57 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id s18-20020a056830149200b006063fef3e17so5566798otq.12;
        Fri, 20 May 2022 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=ZKkLWsoUsSPOA2KbMtjT5T7tAoo146nUvvtE4Y8gg8c=;
        b=XYYUOHx1nfXnzsBbbCz090BXwHXtLyHQnAtIsvqTZ/aqoj6fmw7vfhFBWUzZcuSudw
         Xv8LRiAY5K/VbNW0REDjqnXgX9AqKOpO2edOqEeU7zbEfj7a+bD43rBlZyKPB3n5PINa
         zYG7T7MUzyAfT8se2b8XpYmJlMuXWJKc95+aT87OSnQl6SlstmXWzfEZI6tvM9ajxA0a
         rBMmHKOzobxAQC71/wYIh28SG8wStYDbCJ7m7n/pzdw4gYNcItdM7BRaTHM6GjCn4itw
         UMkEAkXlAdR3+5SYc0pA2KwJor649VN6GIgmUv/7nQVZb1eBI6OvfpKVENqg6KFk4owb
         H8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=ZKkLWsoUsSPOA2KbMtjT5T7tAoo146nUvvtE4Y8gg8c=;
        b=21d4b98MVmBVO2gWMBld6RM+Lmo28IAqMKNdMn1XiSdoqlWd+bim3fQl/FCpLB9Y42
         aocsLuy0EBlU3YTj43g0QxkThs1Si+xQPqERolIEeaVeQT/5GQqJFxUaRdOnTqthQem8
         gUiEghGYKeqiLGFGTHkniQZBw7UpGN0d/joy3VvJuX5UU5K4JPIfTy8qTllxSePnuJj0
         WxePiTJXq6oiv/1iz/XCMFOXaaFLMmZuvbOTEX+tAm7qpYOzCcb02zet9dh9A4LPV67T
         KkUZSmSbOtDaS7p6mtWMXZFuqMwcijJyAdqURLCZ/Skv5PXe3EKgHkR3H9LxrDFVmX8X
         IqaQ==
X-Gm-Message-State: AOAM531XLKt8XIw57eXW4Hashs36iBAC9G67vHWbDYHDXGHDUukJouzx
        OZdOY50T0hfWAECfHIp0SHs=
X-Google-Smtp-Source: ABdhPJyT2IU4pED5UARbQ7RLo9rOXrQ6THIvhT7UtRkLzw4i830Hku/bfcbWMWTqlqee0hF3JF4ZmA==
X-Received: by 2002:a9d:482:0:b0:5cd:57a1:8082 with SMTP id 2-20020a9d0482000000b005cd57a18082mr4094388otm.360.1653055376760;
        Fri, 20 May 2022 07:02:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d44-20020a056870d2ac00b000f218150563sm393414oae.10.2022.05.20.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:02:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59822666-744c-044b-65d2-ec186513dfc4@roeck-us.net>
Date:   Fri, 20 May 2022 07:02:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
 <YoeLuffNoUoNx2Bc@t480s.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
In-Reply-To: <YoeLuffNoUoNx2Bc@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/20/22 05:38, Slawomir Stepien wrote:
> On maj 20, 2022 12:13, Krzysztof Kozlowski wrote:
>> On 20/05/2022 11:32, Slawomir Stepien wrote:
>>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>>
>>> Add binding description for temperature channels. Currently, support for
>>> label and offset is implemented.
>>>
>>> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
>>> ---
>>>   .../bindings/hwmon/national,lm90.yaml         | 39 +++++++++++++++++++
>>>   1 file changed, 39 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> index 066c02541fcf..9a5aa78d4db1 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>>> @@ -62,6 +62,37 @@ required:
>>>   
>>>   additionalProperties: false
>>>   
>>> +patternProperties:
>>
>> Which models use this?
> 
> This is used in tmp421 model.
> 

The driver does not support tmp421; I assume you mean tmp481.

If we are talking about the temperature offset register, and use my patch
series as base, it would be:

ADM1023, ADM1032, ADT7461, ADT7461A, ADT7481, ADT7482, ADT7483, G781, LM90,
LM99, MAX6680, MAX6681, NCT72, NCT218, NCT214, NCT1008, W83L771, SA56004,
TMP451, TMP461.

I may have missed some.

Guenter
