Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F7BC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 14:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348701AbiBKOU3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Feb 2022 09:20:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348401AbiBKOU3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Feb 2022 09:20:29 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0899E188
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Feb 2022 06:20:28 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 4so9644965oil.11
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Feb 2022 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=optCp0u1Rsl+6lCMis/6UUhLJIbC9/ji1UYanQNnZ3Q=;
        b=azrhEqHG3Pr/CbPbl7ECGcYYQGRBIdXvyfoo7Gih3zpgdDL+i9jTtDjJHQB4aahT8g
         Zyu2GMj/TAcfOIEiTfai/qL/t5VRriLpIZ/mlgguTn1OTD3UE2QP2OPK8+0xQJoZLCjx
         NQ767ots3AEuBQ7Twot+Mvpx/exYYduXH3YFVqoZefyThlgwJTNcWHvMH/2djzF8w7O3
         fvgZyhaKmGyCfR0EU3qehV4xqExO8vvj9GuorqCJLouhqbyFT8idZIG+O0vEaL2nC+k6
         mljD+OE6Zjx5xBYKnUGQnpXi9a/ZMs8wjwGYGZ5HStq/hesbKADeO7hgOFOIeqroS8l2
         eTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=optCp0u1Rsl+6lCMis/6UUhLJIbC9/ji1UYanQNnZ3Q=;
        b=o+sjJrNEvMtJm08npgW/eVOiOGa86Vjal6PrrqPA73vHRmFH89zMCCL2+93meFr5o7
         MJZ4Pbn5MjoVlfjVZfl9rxSHwTCtcTWSCKYQ6oUlGvE+NGWBlpcuGE7T0JdC/RD8NWJu
         lOrsT2cIYvdw3WojJkagKokDW73tM7Xsruz+IjlTIZ1DAjZUZMET5HYj4D2/2jP1ZQb+
         EJi0o1TFLwBww+UxIkRm+2V5Fqrmp0Uycareq8+XR9sPGXNWCQCJxppnY+4xvtXZXId5
         9vam603jvTk73PSbLQxf6DBSI9DwNWo+e2AImGf2wZjAEKM/Wv2rCqyAjHG9H86vyITn
         cd0A==
X-Gm-Message-State: AOAM5306sHxdjDrFfhTmO7VJIejJ1357kSGbrElkW0rSP93ZcCikaark
        JdZZyD6RCC9oDeaImaIVNjA=
X-Google-Smtp-Source: ABdhPJwayPojRUTICEF/Yvaf6jie2eTaV/q9zgejZFiM/BaZajoSq3J+6aELLJPgVj0JUsT4d3HbTw==
X-Received: by 2002:a05:6808:1c8:: with SMTP id x8mr261579oic.265.1644589227343;
        Fri, 11 Feb 2022 06:20:27 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm9050002otn.65.2022.02.11.06.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 06:20:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3539e9a3-36e7-9cc2-47bf-c0fe78b28568@roeck-us.net>
Date:   Fri, 11 Feb 2022 06:20:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Agathe Porte <agathe.porte@nokia.com>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
 <20220209155308.88938-2-agathe.porte@nokia.com>
 <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
 <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464
 sensor chip
In-Reply-To: <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/11/22 02:11, Agathe Porte wrote:
> Hi Guenter,
> 
> Le 11/02/2022 à 06:16, Guenter Roeck a écrit :
>> On 2/9/22 07:53, Agathe Porte wrote:
>>> Add support for Texas Instruments TMP464 temperature sensor IC.
>>>
>>> TI's TMP464 is an I2C temperature sensor chip. This chip is
>>> similar to TI's TMP421 chip, but with 16bit-wide registers (instead
>>> of 8bit-wide registers). The chip have one local sensor and four
>>> remote sensors.
>>>
>>> Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
>>> Acked-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>
>> First, please _never_ send a new version of a patch or patch series
>> as response to an older version. I almost missed this version of the series.
> 
> I should have sent it without In-reply-to to the ML?
> 
> I have used the following example from git send-email --help as reference, but I was probably wrong:
> 

Please see Documentation/process/submitting-patches.rst,
"Explicit In-Reply-To headers".

>>           So for example when --thread and --no-chain-reply-to are specified, the second and
>>            subsequent patches will be replies to the first one like in the illustration below
>>            where [PATCH v2 0/3] is in reply to [PATCH 0/2]:
>>
>>                [PATCH 0/2] Here is what I did...
>>                  [PATCH 1/2] Clean up and tests
>>                  [PATCH 2/2] Implementation
>>                  [PATCH v2 0/3] Here is a reroll
>>                    [PATCH v2 1/3] Clean up
>>                    [PATCH v2 2/3] New tests
>>                    [PATCH v2 3/3] Implementation
> 
>>
>> Second, I really dislike continuing this driver without all the attibutes
>> making it valuable as hwmon driver, and I really want to drop local caching
>> and use regmap instead. I can not get a TMP464 (they appear to be sold out
>> until 2023 everywhere I checked, and I can not even get a sample from TI
>> either). However, I ordered and - according to Fedex - should get an
>> evaluation board for TMP468 tomorrow. Before we keep going back and
>> forth, I'd prefer to use that chip to add support for all attributes (or
>> in other words take the driver from here). Would that be ok with you ?
> This looks fine for me, as long as copyright is kept if you plan to reuse what I have proposed here. I have asked a colleague in the hardware team to unsolder a few of them from dismissed boards since they are hard to find due to the component shortage. I will ask you a delivery address using my personal email with a proper GPG key when I will be in possession of the chips. Would that be OK to you?

Sounds good.

>>
>> Additional comment inline.
> 
> Since you are planning on taking over this driver I think I will not propose a v3 driver. However I will try to fix the comments in our local version as a learning opportunity. Please Cc me and Krzysztof when posting your implementation so that we can backport it in our system.

Sure, will do.

Thanks,
Guenter
