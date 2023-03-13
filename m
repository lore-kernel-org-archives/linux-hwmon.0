Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F63DC6FD19
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Mar 2023 14:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCMOKA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Mar 2023 10:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjCMOJz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Mar 2023 10:09:55 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E96E5D44E
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 07:09:55 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id g6so5034206iov.13
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678716594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1LIz2OGlCOJ6dgMlgHaMZREFSYHeK9wpuSU3KDoF5Q0=;
        b=OT6Y69bdIUR2yVEHdmZkJZKGj3oi/4d4SRpV7tTyAgdNjyKNJ4T80TuM0Uhl+3uEDu
         CeICLNgig+reXMDgCdICM8nr/fQ3RUzRz2vkeaTY00zLqzDt3kPqo9r8ianLnmtfGWuO
         eieUag83yAopgAsrhnXQw7GeJhFU+aBIYm+GstKgbPe15NrcySrVYWyzOP1Bnx+OSWUw
         j6ZOXk/C6u97KGHO+yXg3MV/rnICAtTxCxxbVbDXTgoD6laVgKnuDl8RGuVquhs7QhGl
         Sn+AjJ4B2X0my94G9I8BQ3tJo6LE6ZWJ4dza4XoeVsK0XoMHahzOOCRcVZhVFNX8+zNp
         36Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678716594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LIz2OGlCOJ6dgMlgHaMZREFSYHeK9wpuSU3KDoF5Q0=;
        b=DSBrh4XG6gcsNtOYy8RSGjvgBgGvsGH5JJS4bx1185I8E2/J3rfQCB3YQbAEYQYSNW
         zWTDhcn79HwOoGWE3EiyZxdIzprQcVM/Rn3hsPYbbR/96DPmkHMkD0ET4jknH0DSXGkt
         3koRQdbZQgVBT6EpVRcQoyF7zDMVONYfKHO2Q/RkmfrWwK59MpTyORWaT4D/Lns5Wd1o
         0jsIWLnGfy2XefuHJa4hsL5WD4b1WxRX6Afyi3p4h7T0WMHodCLBv4CB4pIkdA70cQUF
         QE3/9R4Rlx5X6jsbt6MubHgrXfPwHTPvwucJ5i0SKusQH1zrVAWMDWxtXaXREjAUgqvB
         uF0g==
X-Gm-Message-State: AO0yUKUQq/75pBEfqGR147GFQ7HiCfEmiMiOXATLGR7Iq9g1yjN6BJkm
        AM0kkkJNVIhI1hVtqfpkW2jwJi19AUI=
X-Google-Smtp-Source: AK7set/r6+P31qoA6E8HWdd956913CisvPgi/QrsI/QqfB8gnxlJj1cOn618PnqL31Cd1qAd0x7iCA==
X-Received: by 2002:a5d:924d:0:b0:74d:5d6:f30 with SMTP id e13-20020a5d924d000000b0074d05d60f30mr22937380iol.15.1678716594462;
        Mon, 13 Mar 2023 07:09:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14-20020a056638022e00b00400421e75b2sm1697569jaq.31.2023.03.13.07.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 07:09:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <73bbea71-dfd6-6599-fb3a-120c0ab52238@roeck-us.net>
Date:   Mon, 13 Mar 2023 07:09:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/3] hwmon (it87): Add scaling macro for recent ADC
 voltages
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20230312043137.1744885-1-frank@crawford.emu.id.au>
 <20230312043137.1744885-3-frank@crawford.emu.id.au>
 <0933980e-921d-1e0c-a0a2-b2b44a6882c0@roeck-us.net>
 <94fbde73aae0bf8de77918bfb89ca8e10582e4a2.camel@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <94fbde73aae0bf8de77918bfb89ca8e10582e4a2.camel@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/13/23 04:06, Frank Crawford wrote:
> On Sun, 2023-03-12 at 07:49 -0700, Guenter Roeck wrote:
>> On 3/11/23 20:31, Frank Crawford wrote:
>>> Generalise scaling to include all recent ADC values and match the
>>> labels
>>> for internal voltage sensor to match.
>>>
>>> This includes correction of an existing error for voltage scaling
>>> for
>>> chips that have 10.9mV ADCs, where scaling was not performed.
>>>
>>
>> That is really two patches (one patch per logical change). The bug
>> fix
>> should be the first patch of the series so it can be backported
>> to older kernels.
> 
> Okay, ignore this patch set and I'll resubmit them a totally separate
> patches.
> 
>>
>> In general please only introduce new code like the 11mv scaling
>> together
>> with code actually using it, or I can not apply it.
> 
> The minor problem with holding this off until it is actually used is
> that the chipset that uses it also has a lot of other changes, related
> to number of fans, etc, and I'm trying to introduce them all as small
> increments.  Otherwise I will need to submit a big patch with lots of
> unrelated pieces.
>

No, that would not be good either because it would be all but impossible
to review. Separate patches is perfect, it just has to be a single _series_
so that at the end it is all used.

Thanks,
Guenter

