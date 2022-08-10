Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C129C00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 08:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbiHJIWL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 04:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiHJIWK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 04:22:10 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C0C66A47
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 01:22:07 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id z17so16867708wrq.4
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from:from:to:cc;
        bh=ee717Tmta3kUauOPxzPDE9EoQsJDP2L/ulygFMbha8M=;
        b=qfk07WZwGTlWqhJCnQ+tNNbcBlpo+T9/Z2ahGhXJQlLyIO1IVlE3ScvbBgAX/pPZci
         PPMkWH9zfUuerGai5BY24Red9nnQvvpCjuciaPERyTSBLXNErGDfScUHGZdlVz/ooLfp
         9FwgZo1xTXIKdNP25aQZtC+3+8wNI+0iffFDa22U3kojlZrujkCnTR0q4DOHqNEAbXg2
         4dn068Jk8ACT12Uf7/IBqdw1KfCuUwT7GxRdRFdx6o1/rk1TYW7V5ZvDJHuWe5vuOdHI
         ykMvsfFUvDHKWsZ2VVOujo+GTuM43POGOG+M6vwDEltl8TEyoWiBwysyTNjfn+NoTNdg
         DdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from
         :x-gm-message-state:from:to:cc;
        bh=ee717Tmta3kUauOPxzPDE9EoQsJDP2L/ulygFMbha8M=;
        b=lxpqe5IVMC0XclF4IjGPTyAiriPGHQZWNhPrO2fvCRSysqTwsjs3y5rznuIaTvbCFZ
         d2vY7A77VWA53ZDhmeUK8BNN+z7yTo++T+dmNEGCVwrqGqKh9dmnuxNY+ra9EK1mq1Jf
         /bCwKAzHT+6XM03yQcVIDiJM6bb2qmAc/6eihhWekFZy1dmSGyoGnqlSV1X7clAq4HQY
         QRpi8gjdGhKbh7iqyYGzDtVSAPOreZQHAhRThVuj/BOxE5Hka1vlMBTmyzH8nON+4+aa
         eESSa6NsAL+ClycTrlLY1kSlFcITj+rYAxtHv47/B+e2vNnIWU6brq2IgsZ67TXfuN57
         uw2A==
X-Gm-Message-State: ACgBeo0fQ4647SQqOq2/zXnvc599ZrcHaSw9BRdLVckGuKbF7rdDfnOO
        qydi2nM3640Cn2+5mN67rBZvmBfadl4=
X-Google-Smtp-Source: AA6agR4Nc7yjXVXmbelz1kbyF+dgJLuphqxIVX7wYUeVl/EPUzAuzD4YZYak056xqzAFg+kEkNKUBg==
X-Received: by 2002:a5d:5a0f:0:b0:220:5930:dc65 with SMTP id bq15-20020a5d5a0f000000b002205930dc65mr15892935wrb.229.1660119725677;
        Wed, 10 Aug 2022 01:22:05 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc::6? (2a01-036c-0116-43ce-0000-0000-0000-0006.pool6.digikabel.hu. [2a01:36c:116:43ce::6])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b0021e491fd250sm15790667wrv.89.2022.08.10.01.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 01:22:04 -0700 (PDT)
From:   "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <DirtY.iCE.hu@gmail.com>
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
 <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
 <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
Message-ID: <a270a9d0-2ff7-5331-fdbc-b074ba8a750e@gmail.com>
Date:   Wed, 10 Aug 2022 10:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:4.8) Goanna/20220224
 Interlink/52.9.8090a1
MIME-Version: 1.0
In-Reply-To: <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2022-08-10 03:39, Zev Weiss wrote:
> On Tue, Aug 09, 2022 at 04:50:20PM PDT, Zoltán Kővágó wrote:
>> On 2022-08-10 00:34, Zev Weiss wrote:
>>> On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zoltán Kővágó wrote:
>>>> On 2022-08-09 22:56, Zev Weiss wrote:
>>>>> On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>>>>>> Hi,
>>>>>>
>>>>>> [1.] One line summary of the problem:
>>>>>> NCT6775: suspend doesn't work after updating to Linux 5.19
>>>>>>
>>>>>> [2.] Full description of the problem/report:
>>>>>> After updating my kernel from 5.18.11 to 5.19, I've noticed that 
>>>>>> resuming after suspend no longer works: fans start up, then about 
>>>>>> a second later, the computer just shuts down, leaving the USB 
>>>>>> ports powered up (normally it turns them off on shutdown). The 
>>>>>> screens don't turn on during this timeframe, so I can't see any 
>>>>>> useful log messages.
>>>>>>
>>>>>> Bisecting between 5.18 (where it still worked) and 5.19 lead me to 
>>>>>> commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon: (nct6775) 
>>>>>> Split core and platform driver" which looks like a refactor 
>>>>>> commit, but apparently it broke something.
>>>>>>
>>>>>
>>>>> Hi Zoltán,
>>>>>
>>>>> Thanks for the thorough bug report.  You're right that that commit 
>>>>> was essentially just a refactor, though there was one slight change 
>>>>> to the nct6775_suspend() function introduced during the review 
>>>>> process that may perhaps have had some subtle unintended side-effects.
>>>>>
>>>>> Can you test the following patch and report if it resolves the 
>>>>> problem?
>>>>>
>>>>>
>>>>> Thanks,
>>>>> Zev
>>>>
>>>> Hi Zev,
>>>>
>>>> Thanks for the quick reply. Yes, it looks like your patch does solve 
>>>> the problem (I've applied it on top of 5.19 (after fighting with my 
>>>> mail client for a while) and suspended a few times, it's working so 
>>>> far).
>>>>
>>>> Regards,
>>>> Zoltan
>>>
>>> Great, thanks.
>>>
>>> Guenter, it looks like nct6775_suspend() really does in fact need to 
>>> use nct6775_update_device() instead of dev_get_drvdata(), though it's 
>>> not immediately obvious to me why.  Though given that the bulk of of 
>>> the body of nct6775_update_device() is inside an 'if' block that 
>>> might not necessarily execute every time, I also wonder if it might 
>>> be vulnerable to exhibiting the same problem depending on timing.
>>>
>>> Zoltán, if you could try another experiment to try to gather some 
>>> data on that -- with the patch from my previous email still applied, 
>>> could you try suspending via:
>>>
>>>     $ cat 
>>> /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input && 
>>> echo mem > /sys/power/state
>>
>> Tried it, three times in fact, and it worked fine every time. Looking 
>> at the dmesg, though, it looks like it needs a bit more than 1.5 sec 
>> to suspend. Where's that 1.5 sec limit defined? I will try to increase 
>> it tomorrow.
>>
> 
> The 1.5 second duration comes from this line in nct6775_update_device():
> 
>    if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
> 
> Each 'HZ' represents one second, so HZ + HZ / 2 = 1.5 sec; if you want 
> to lengthen it you could do e.g. 10 * HZ or something instead.

Tried that, this isn't the problem.

> 
> Though as Guenter noted, one other possibility is that with the previous 
> (buggy) version nct6775_update_device() might never have gotten called 
> at all -- do you know if that might be the case on your system?  (i.e. 
> do you have any userspace monitoring program or the like that would have 
> been reading from the nct6775 device's sensors?)  If something like that 
> never ran between the driver getting loaded and the system suspending, 
> that might also (partially) explain things; to test that out you could 
> revert to the old buggy code and see if the suspend problem still occurs 
> if you explicitly run
> 
>    $ cat /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input
> 
> (or just 'sensors' if you've got the lm-sensors package installed).  
> That will
> ensure that nct6775_update_device() gets called before the suspend 
> operation, which could help narrow things down further.

Yup, this was it. It looks like I remembered it wrong and my monitoring 
widget in the end only used k10temp and not nct6798, so I could very 
easily suspend without any reads from nct6775 before (and that widget 
itself even only ran when I had an X session).

Regards,
Zoltan
