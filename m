Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DA6C19F2D
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 03:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiHJDgp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 23:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiHJDga (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 23:36:30 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A150826AD5
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 20:36:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p125so9014750pfp.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 20:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc;
        bh=0E1LCva0/8ZWnBgcnHJsY/HQ+6RLpar+T9XDYLTwSCE=;
        b=Q422TC3SHE1CbpfRcxuwvVZevu5cG83DwDVMPZec6hysddf3zMEFoG9UQJUE+DoP1s
         uU6QBHSwDumZA8PA+LvjM/2E2p/Va1f0lyG6XINsnOdCkktMqPV4MhkcwpatySZuCxd3
         04vWmvwrWNxVKr1kozhi5nnYd6mewGwHeNmvWo0fndZVVwrkOKdMIaWN+5CmccDUuxmz
         +kaju5ss3JhUxWd11xCsVq+a8PcVy/e73mNm0+NTpCwuL2AWQj0byEaxVZmFzk7UvmvC
         KyOO1hz+XzKqmjxMcgYrCwqq9Qe4IpB9cpTyXxIRM8JxJUjL4f5buDDdzO2fYkSffjf4
         pD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc;
        bh=0E1LCva0/8ZWnBgcnHJsY/HQ+6RLpar+T9XDYLTwSCE=;
        b=mj7IqckBup0rSE+JkXlUPcw+g+OOPFbUrmkkM4KAD+081LimIFetLVZOuPhbl1b0Oe
         dofUCNC38CXDk6vHCivivcIWBzFOoI+j0Sw2ZCYqmDcLtf/htoeHmbTatrorWcLJS/xc
         wPdih1LCl6hiApgpq2ISKjMySM9rlwXxEHamVLuB8TNAojwr5uqDO4fqgXmt5S3OyWZj
         pCuRzUpLM6+TQbVS4A87Uo3D1iK/73817reIaJtHtba+yB8hULc5HS4OTN2lxZhKELE5
         6o69SgDlf/p1A4XG/0ycEa7jR/H15Dh1UuzU+HOILBZhOyyIVnlFirOENnTbQm2KIql6
         9tMQ==
X-Gm-Message-State: ACgBeo29D9jG8D6LXXT9ODvBjRDeA6W8sc4PAoR1MWsB0W8nXT5wjirf
        0FrPlVHG6XaqaAWw3Xp3nG0=
X-Google-Smtp-Source: AA6agR7iW7pK6twKkE6snOaxoKP9mVHYmS79sfzUIbu87dYkq8YSOfAIB7UsFeCRwoWrBvJgqZpKOA==
X-Received: by 2002:a63:494a:0:b0:41c:f29e:2a2e with SMTP id y10-20020a63494a000000b0041cf29e2a2emr20526590pgk.477.1660102589110;
        Tue, 09 Aug 2022 20:36:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10-20020a17090a7d0a00b001f4e0c71af4sm373554pjl.28.2022.08.09.20.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 20:36:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c53405c8-5a1c-9a68-2135-b8460b915091@roeck-us.net>
Date:   Tue, 9 Aug 2022 20:36:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, Zev Weiss <zev@bewilderbeest.net>,
        =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
 <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
 <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
 <2974b75e-bd89-3fe2-bcf6-96a9943905d9@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
In-Reply-To: <2974b75e-bd89-3fe2-bcf6-96a9943905d9@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/9/22 20:00, Armin Wolf wrote:
> Am 10.08.22 um 03:39 schrieb Zev Weiss:
> 
>> On Tue, Aug 09, 2022 at 04:50:20PM PDT, Zoltán Kővágó wrote:
>>> On 2022-08-10 00:34, Zev Weiss wrote:
>>>> On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zoltán Kővágó wrote:
>>>>> On 2022-08-09 22:56, Zev Weiss wrote:
>>>>>> On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> [1.] One line summary of the problem:
>>>>>>> NCT6775: suspend doesn't work after updating to Linux 5.19
>>>>>>>
>>>>>>> [2.] Full description of the problem/report:
>>>>>>> After updating my kernel from 5.18.11 to 5.19, I've noticed that
>>>>>>> resuming after suspend no longer works: fans start up, then about
>>>>>>> a second later, the computer just shuts down, leaving the USB
>>>>>>> ports powered up (normally it turns them off on shutdown). The
>>>>>>> screens don't turn on during this timeframe, so I can't see any
>>>>>>> useful log messages.
>>>>>>>
>>>>>>> Bisecting between 5.18 (where it still worked) and 5.19 lead me
>>>>>>> to commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon:
>>>>>>> (nct6775) Split core and platform driver" which looks like a
>>>>>>> refactor commit, but apparently it broke something.
>>>>>>>
>>>>>>
>>>>>> Hi Zoltán,
>>>>>>
>>>>>> Thanks for the thorough bug report.  You're right that that commit
>>>>>> was essentially just a refactor, though there was one slight
>>>>>> change to the nct6775_suspend() function introduced during the
>>>>>> review process that may perhaps have had some subtle unintended
>>>>>> side-effects.
>>>>>>
>>>>>> Can you test the following patch and report if it resolves the
>>>>>> problem?
>>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Zev
>>>>>
>>>>> Hi Zev,
>>>>>
>>>>> Thanks for the quick reply. Yes, it looks like your patch does
>>>>> solve the problem (I've applied it on top of 5.19 (after fighting
>>>>> with my mail client for a while) and suspended a few times, it's
>>>>> working so far).
>>>>>
>>>>> Regards,
>>>>> Zoltan
>>>>
>>>> Great, thanks.
>>>>
>>>> Guenter, it looks like nct6775_suspend() really does in fact need to
>>>> use nct6775_update_device() instead of dev_get_drvdata(), though
>>>> it's not immediately obvious to me why.  Though given that the bulk
>>>> of of the body of nct6775_update_device() is inside an 'if' block
>>>> that might not necessarily execute every time, I also wonder if it
>>>> might be vulnerable to exhibiting the same problem depending on timing.
>>>>
>>>> Zoltán, if you could try another experiment to try to gather some
>>>> data on that -- with the patch from my previous email still applied,
>>>> could you try suspending via:
>>>>
>>>>     $ cat
>>>> /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input &&
>>>> echo mem > /sys/power/state
>>>
>>> Tried it, three times in fact, and it worked fine every time. Looking
>>> at the dmesg, though, it looks like it needs a bit more than 1.5 sec
>>> to suspend. Where's that 1.5 sec limit defined? I will try to
>>> increase it tomorrow.
>>>
>>
>> The 1.5 second duration comes from this line in nct6775_update_device():
>>
>>   if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
>>
>> Each 'HZ' represents one second, so HZ + HZ / 2 = 1.5 sec; if you want
>> to lengthen it you could do e.g. 10 * HZ or something instead.
>>
>> Though as Guenter noted, one other possibility is that with the
>> previous (buggy) version nct6775_update_device() might never have
>> gotten called at all -- do you know if that might be the case on your
>> system?  (i.e.  do you have any userspace monitoring program or the
>> like that would have been reading from the nct6775 device's sensors?)
>> If something like that never ran between the driver getting loaded and
>> the system suspending, that might also (partially) explain things; to
>> test that out you could revert to the old buggy code and see if the
>> suspend problem still occurs if you explicitly run
>>
>>   $ cat /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input
>>
>> (or just 'sensors' if you've got the lm-sensors package installed).
>> That will
>> ensure that nct6775_update_device() gets called before the suspend
>> operation, which could help narrow things down further.
>>
> In case you are running a Debian-based distribution, please note that Debian unconditionally executes sensors on startup, something
> i discovered when the dell-smm-hwmon driver was causing issues on my machine.
> 
> So you may need to temporarily disable lm-sensors.service and/or /etc/init.d/lm-sensors for testing.
> 

The assumption was that the sensors command was _not_ executed prior
to suspend and that this triggers the problem. If it was executed at least
once and the crash on resume still happens, something else must be going
on. Either case, I think it is best to apply the patch suggested by Zev.
We can try to figure out the exact cause of the problem later. Zev, can
you send me a formal patch ? I would like to apply and send it to Linus
as soon as possible.

Thanks,
Guenter
