Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B37AC19F2A
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 Aug 2022 15:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbiHGPCd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 Aug 2022 11:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbiHGPCc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 Aug 2022 11:02:32 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C3F6263
        for <linux-hwmon@vger.kernel.org>; Sun,  7 Aug 2022 08:02:31 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g12so6147723pfb.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Aug 2022 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZLrT+SYuYyrSNZJ4rIuWgT9eGjJ0lroXecUAQVDE4NU=;
        b=YK6IhcjnGvxOgufslTR1eSsFMT3ZlK5xrm+GKO/rZd/2PctU4DreZv4pTq7yrb3+y4
         W2lILp0VYB+3E8r0j0n//BEXDvg1sRUII0DgmMN6hVj+1jBI+APlpTLRfuTrx+XMSUWo
         cKI9JORiCQMCkAiUhMN4dJG+v2Wopko0xvsdfq5056/vmrs5K8XNOttkI96322mhdSJK
         And/LZx/1h5Ubj01NFDDPDaEzucnjwK4uxaHtl1mB7kba927eqi6jZ3fZVuuob19tEz2
         WHq9eUhsu/H3wWkMnBOlTLWjb/6Bt0k4RtInGwWBG1nnoOaEILhHJu22dltONBI0AXC4
         EgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZLrT+SYuYyrSNZJ4rIuWgT9eGjJ0lroXecUAQVDE4NU=;
        b=gvAFjGe6GTlz/VL1oBMVm6B2CuPY2SIB6ld1PTwlUlXKd2/qY6Rcc5SU1ufl6H2hQ7
         fDP6/EEibWBAx4sNZvZlEEVJL9o2oWPBaRNWEipFuRgVmg2OljQ1G4NqLEMflt/xAjMe
         VwKI/YFdZ7nweJt3tACtF4obIp735xtSQQa9mNbgkMQ6bWEdrLJ2oltBDQc1jrWJo2vD
         T23HaQzBWse3C4fJnnaNkPi0RlNmQ7/aHiHfDNne/S3KFbJ/eD3+zKoEpIU9xXsgO5e2
         gMCdRVzSwp707qIZcnwNn3oAOD/Y+fxJLYzMpp/PvEHt2uGbRt5X41OhehvE9r/ue0o9
         7ECg==
X-Gm-Message-State: ACgBeo3JvzjlDGwnq1fXhNz9FXR36WwZqeItxr5Foq2RP6+XAXaxnrW0
        Jhf6HbwUND25zCTpsTNUMxY=
X-Google-Smtp-Source: AA6agR48NUvw1x5BxFuh8rYRZe6hnS+0hd6TykhYwtdwdW9tPMlmZYttuFC7lq7YLAD79xVvAgpnBA==
X-Received: by 2002:a62:6497:0:b0:52e:e0cd:1963 with SMTP id y145-20020a626497000000b0052ee0cd1963mr8159557pfb.58.1659884550448;
        Sun, 07 Aug 2022 08:02:30 -0700 (PDT)
Received: from [192.168.122.100] (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
        by smtp.gmail.com with ESMTPSA id x194-20020a6286cb000000b0052abfc4b4a4sm6994313pfd.12.2022.08.07.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 08:02:29 -0700 (PDT)
Message-ID: <eb1722e2-8ce6-c30e-8728-8ab5e616413d@gmail.com>
Date:   Mon, 8 Aug 2022 00:02:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] nvme: hwmon: Add support for throttling temperature
 feature
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <20220806054606.7280-1-ikegami.t@gmail.com>
 <20220806083113.GA3986075@roeck-us.net>
 <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
 <354484dd-bf1f-8339-c68a-f950fb72d3f7@gmx.de>
From:   Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <354484dd-bf1f-8339-c68a-f950fb72d3f7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 2022/08/07 5:19, Armin Wolf wrote:
> Am 06.08.22 um 13:58 schrieb Tokunori Ikegami:
>
>> Note: Sorry let me resend the mail below as text format since it was
>> not delivered to the mailing lists as contained HTML subpart.
>>
>> Hi,
>>
>> Thanks for your comments.
>>
>> On 2022/08/06 17:31, Guenter Roeck wrote:
>>> On Sat, Aug 06, 2022 at 02:46:06PM +0900, Tokunori Ikegami wrote:
>>>> NVMe drives support host controlled thermal management feature as
>>>> optional.
>>>> The thermal management temperature are different from the
>>>> temperature threshold.
>>>> So add functionality to set the throttling temperature values.
>>>>
>>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>>
>> I think actually the suggested attributes are not met with the
>> throttling temperatures as below.
>>
>>   temp[1-*]_emergency: Temperature emergency max value, for chips
>> supporting more than two upper temperature limits.
>>   temp[1-*]_lcrit: Temperature critical min value, typically lower
>> than corresponding temp_min values.
>>
>>   Thermal Management Temperature 1 (TMT1): This field specifies the
>> temperature, in Kelvins, when the controller begins to transition to
>> lower power active power states or performs vendor specific thermal
>> management actions while minimizing the impact on performance (e.g.,
>> light throttling) in order to attempt to reduce the Composite
>> Temperature.
>>   Thermal Management Temperature 2 (TMT2): This field specifies the
>> temperature, in Kelvins, when the controller begins to transition to
>> lower power active power states or perform vendor specific thermal
>> management actions regardless of the impact on performance (e.g.,
>> heavy throttling) in order to attempt to reduce the Composite
>> Temperature.
>>
> Maybe those two throttle thresholds could be represented by tempX_crit 
> and tempX_emergency,
> the special throttle effect could be documented in the drivers 
> documentation.
>
> Since tempX_crit is already used to report CCTEMP, maybe this value 
> could be reported with tempX_rated_max instead?
> As far as i know, CCTEMP is the maximum composite temperature rating 
> of the NVME device, so reporting is as tempX_rated_max would make sense.

Thanks for your advice. But actually the throttle thresholds is lower 
than both the current tempX_max and tempX_crit by default so it seems 
that it is difficult to use the current tempX values for the throttle 
thresholds.

Regards,
Ikegami

>
> Armin Wolf
>
>>> NACK. There are several existing limit attributes which can be used
>>> for this purpose. I would suggest to use EMERGENCY and LCRIT 
>>> attributes.
>>>
>>> Furthermore, one can not just extend the hwmon ABI without discussion,
>>> much less as part of a patch introducing its use. Any attribute
>>> introduced
>>> into the ABI must benefit more than one device, and a matching
>>> implementation in the sensors command and the lm-sensors library is
>>> expected.
>>
>> Sorry I am not sure about the hwmon ABI situation but if possible
>> could you please consider or discuss to extend the attributes from
>> this patch review since the suggested attributes seem difficult to use
>> instead? (Is it difficult?)
>> By the way I have already created the lm-sensors pull request below.
>>   <https://github.com/lm-sensors/lm-sensors/pull/406>
>>
>> Regards,
>> Ikegami
>>
>>>
>>> Guenter
