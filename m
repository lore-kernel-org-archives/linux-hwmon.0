Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C14C433ED
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BC5C61221
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239083AbhELXMc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 19:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443876AbhELWhE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 18:37:04 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BFB3C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 15:35:54 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso21336281ots.10
        for <linux-hwmon@vger.kernel.org>; Wed, 12 May 2021 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VFxAybqzdj//Ke4Thm2x8IErXUzMjyKKR6lbo9aUcWM=;
        b=XY5fBxtiy8NBFiobcEwbfwLHg26WLhEByRGtYQjpvmVvj9q/VjBzOLz/i4oZsagetn
         nrN2rHFZ48wsSBU8SZz+nXaUd0CtO+SgRHlpfmQIe6MhbLUeSGWPGKWOVrB2EhKpStzg
         18LdZ3COu0uMYyuberuq3YYjOZcyB+z9Z8O6ZKzte2psB8Zx0FERdIt3a0oZAAe/6QjL
         z65WZ+4lLNkipQXW09FmcuZtdmB41z2Itla4/C7Naw6VE9+z2PPcGhHyr7OTzZ2F3gHJ
         lk7UFqrG7/l8TGPsW5rF9acBuy6wGCumTEniFh91gW8kQFyz+VsBt4kOWsGkI4tyOPEy
         TzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VFxAybqzdj//Ke4Thm2x8IErXUzMjyKKR6lbo9aUcWM=;
        b=lkqMR+PpHawo2HHaKwCVLZYqcGwh+nKUbRATUloDKpgpX3BDsf6MlFSnXUaP0Kk6y+
         0fFYKP79/XThBWfE04GBsa4bnkNXrsmZ/6y833EIKw2s5oCK1yhA9gMHtb5PKfxDPFSA
         2cHm27iegMw5Dbr/FGi6DB74FNuglBNWRYauDC4zJoUlgfyAXMM8IFiVQ4r8bQLZ5FA+
         Lmvqk+SNzqbUTYk4gd1+F/W+bIXnmKC4VILjrVge0C3JnwsSfN7dF1Y/XMoj3kHwpcWb
         VdfDEqiQZ3olKUE7TkGpQisyT67YhCMpBpMF/3qkVsuvnz1IAkrs8Z91Hcpvppt3JpbN
         jR4g==
X-Gm-Message-State: AOAM533EJ2tq6pin8oQGvua1kAHSsi0aCcm0sL/F+SOpPumbY4V35VAn
        E0qtQSAusZ3Atmv87bFPh97TQLcRufc=
X-Google-Smtp-Source: ABdhPJyXWRtphVXF3ZiG3u+V7wT1DpP0L/svN4leQh1BaBZVt1nVj5a0f/8+RYdEDBlmOlSPmZKPDg==
X-Received: by 2002:a9d:7b57:: with SMTP id f23mr32343068oto.150.1620858954034;
        Wed, 12 May 2021 15:35:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a4sm275577oib.17.2021.05.12.15.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 15:35:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20210311073302.221954-1-linux@roeck-us.net>
 <20210311073302.221954-3-linux@roeck-us.net>
 <590366ea-2c8c-8d92-171a-87807dedabd6@alliedtelesis.co.nz>
 <b853d6b2-11df-bedf-ccc0-dbb1cb88ffb3@roeck-us.net>
Message-ID: <33828125-bf2d-294f-a519-226c39e13efa@roeck-us.net>
Date:   Wed, 12 May 2021 15:35:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b853d6b2-11df-bedf-ccc0-dbb1cb88ffb3@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/12/21 3:09 PM, Guenter Roeck wrote:
> On 5/12/21 2:54 PM, Chris Packham wrote:
>> Hi Guenter,
>>
>> On 11/03/21 8:33 pm, Guenter Roeck wrote:
>>> Also use regmap for register caching. This change reduces code and
>>> data size by more than 40%.
>>>
>>> While at it, fixed some warnings reported by checkpatch.
>>>
>>> Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> I've just been informed by our QA team that it looks like the
>> configuration of limits (e.g. by writing to sysfs) has been broken.
>> Probably by this change. I'm just starting to dig into it now but I
>> though I'd give you a heads up.
>>
> 
> Thanks for the heads up.
> 
> It looks like voltage maximum writes use the wrong register,
> ADM9240_REG_IN instead of ADM9240_REG_IN_MAX.
> Odd, I'd have assumed that my module test code catches that.
> I'll have to check why it doesn't.
> 

Yes, turns out my module test script does not catch that situation.
It tries to find the value range and determines that there is no range
(because all writes are into the wrong register). I'll have to fix that.

> Anyway, anything more specific ?
> 
I'll wait for your response before submitting a patch.

Guenter
