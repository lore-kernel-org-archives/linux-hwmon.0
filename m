Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156BBC43460
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6D97613EE
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbhELXNB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 19:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444057AbhELWx1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 18:53:27 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464C3C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 15:52:00 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id z3so22448634oib.5
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 15:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nVhqUixHli8D1EWLHW6ImrXdOz/yIW/2vspI69mdxBo=;
        b=W1xf2b1eXQ6fYsRE/Ed2LZETDhm+oz3Y42uHBvXznTV4L7SnK8apeKWyWRIwP+2mpT
         t0vLDtjptMTT2fX8uzuN16GSlld8Inbyymiuzi66nPPcL03imReOfOQh+CqPvCZS6vTC
         mDxFp3wiXlWDywCUZUDh0tX8+Dw40j7D83r2Pw44VVBSemkF2IrOWIpet27VuMthTHGB
         TBCdzdx3pq4CJl0iT0Sg/+ZzkE3gtGCUiYh5GqeJSh00WWut7M9yEK5AV7OrkG0Ky8MO
         yAuA8mxlSQ2YnfFSYzhoWOp49CFPz+Pj/D2BAeo44WCFE7ZMVYlwW4FEMxvk4zXSIf4f
         0ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nVhqUixHli8D1EWLHW6ImrXdOz/yIW/2vspI69mdxBo=;
        b=Z5JJh9RHymyzKi4Ji5xq0IV1cUSgRxNsEjyGT8EUxCLjLrDGX33PjydUP91FxK0SwH
         rrcnfP1CyrQ1GUt3kX6+OPYFqcRsSvcGGqOvEEbjmzTr+UNJSsnpO0N2llrclvl5AcxH
         W6kAPRR1Imih1xgE0CN5MrKUu+WIoh24Etris5yg6NfdY1xMLN9lBn8aimtDoF786wTJ
         zmWeF1MCJmBtfe0TOUwfJxD7Eck7xAIJhWAVwYhtkUtKGC01d4ajl2LmVdkMIIdLs1Zy
         qcLzUzTyVOuFYiV27abFM0LEOUgBQgnpKoqs4+faztp0mxg1fi4VBmdtGkakhtr5gfuj
         1xNg==
X-Gm-Message-State: AOAM532+La3KYR/1h5yEppfNbUrGfEtgh5uXtTGTAWb2vFITfw52WIzv
        O+cS8hqNyBoS/o6/3qr27fg2+41Pncc=
X-Google-Smtp-Source: ABdhPJwpUu0isw2O+CggRNQqLEFgsNMbIBL7HuhxUB9FVs8Pehwh158qTqeeVOIeIAXTnuecFhAdpw==
X-Received: by 2002:aca:3ec6:: with SMTP id l189mr27517556oia.8.1620859919571;
        Wed, 12 May 2021 15:51:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q24sm303206otg.81.2021.05.12.15.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 15:51:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20210311073302.221954-1-linux@roeck-us.net>
 <20210311073302.221954-3-linux@roeck-us.net>
 <590366ea-2c8c-8d92-171a-87807dedabd6@alliedtelesis.co.nz>
 <b853d6b2-11df-bedf-ccc0-dbb1cb88ffb3@roeck-us.net>
 <33828125-bf2d-294f-a519-226c39e13efa@roeck-us.net>
 <c7bafe28-2017-dfe2-f897-914df05a286b@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8401b580-66f4-c4f1-a5d5-41c66530eaca@roeck-us.net>
Date:   Wed, 12 May 2021 15:51:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c7bafe28-2017-dfe2-f897-914df05a286b@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/12/21 3:41 PM, Chris Packham wrote:
> 
> On 13/05/21 10:35 am, Guenter Roeck wrote:
>> On 5/12/21 3:09 PM, Guenter Roeck wrote:
>>> On 5/12/21 2:54 PM, Chris Packham wrote:
>>>> Hi Guenter,
>>>>
>>>> On 11/03/21 8:33 pm, Guenter Roeck wrote:
>>>>> Also use regmap for register caching. This change reduces code and
>>>>> data size by more than 40%.
>>>>>
>>>>> While at it, fixed some warnings reported by checkpatch.
>>>>>
>>>>> Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> I've just been informed by our QA team that it looks like the
>>>> configuration of limits (e.g. by writing to sysfs) has been broken.
>>>> Probably by this change. I'm just starting to dig into it now but I
>>>> though I'd give you a heads up.
>>>>
>>>
>>> Thanks for the heads up.
>>>
>>> It looks like voltage maximum writes use the wrong register,
>>> ADM9240_REG_IN instead of ADM9240_REG_IN_MAX.
>>> Odd, I'd have assumed that my module test code catches that.
>>> I'll have to check why it doesn't.
>>>
>>
>> Yes, turns out my module test script does not catch that situation.
>> It tries to find the value range and determines that there is no range
>> (because all writes are into the wrong register). I'll have to fix that.
>>
>>> Anyway, anything more specific ?
>>>
>> I'll wait for your response before submitting a patch.
>>
> I agree that the writes to max aren't working. Haven't checked min.
> 
> [root@awplus flash]# cat /sys/class/hwmon/hwmon0/in5_max
> 3586
> [root@awplus flash]# echo 1097 >/sys/class/hwmon/hwmon0/in5_max
> [root@awplus flash]# cat /sys/class/hwmon/hwmon0/in5_max
> 3586
> 

Anything else ? I got a patch ready to fix that, but I would prefer to
fix everything in one go if possible. My (fixed) module test script
doesn't pick up other problems, but obviously we can't really trust it.

Thanks,
Guenter
