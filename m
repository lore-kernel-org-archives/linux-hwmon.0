Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D5AC19F2D
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 00:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiHJAEE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 20:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiHJAEC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 20:04:02 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BAC80486
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 17:04:01 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o3-20020a17090a0a0300b001f7649cd317so550773pjo.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 17:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc;
        bh=97DkyvECvPNyNIYPxM5qoQxlvGGRMg2+0+FYe7I3FD0=;
        b=d1wnS4TvA2Vgd1gnZ62Qx08LSXJwCVz2m5+fTjFWTHIsOnr7E6scgcgWQzU7J7IMDD
         VVuLgjo2/1HDQeTy5qv6BIxqbxopLDXFjTcoOupHiP9vI3LV7ZT2waVX6bZYxA5EwLvp
         sQ/1VjCTkoAjRp2V8OUSD7+jrELt6nOmLAsgo5rFUVK2gxk4AQgc/zdnihMUPn1A+3Sb
         OxhGOuzZDW3Zt305PXbphiUJSVA4KMt7Iq62KkCIWtinWX8Qzr/X7xLAfZwHnSuWO+wV
         kT3YqUzDfTuawfOEbs9n68HWT9nsV/CK6o6iiAv0LH026BT/IU4K/JIKpd8mjn10aVUj
         0aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc;
        bh=97DkyvECvPNyNIYPxM5qoQxlvGGRMg2+0+FYe7I3FD0=;
        b=Z3JUU/D6bUAVCl8ZKVE3kHhNASrqhi6B/vwVsqgYd9KOXE8rRcNGq/i6368Pp3AZ8P
         t/566Nfs6ZZG/7AYwwD9KVazGGJE+VR7xPART0+YdsspFgoTkvjvG1FiAN8vVNbg+SQo
         e2uDwfWCru1DB69lOufwtO7nnn6v4eqvq/JuoMKK9+fODQAqq8pEEgRCTpb7PuVg46P9
         /wxC7ywIJEQgIyaai5kJDB5X7IGurZxak38l2IeHbjN4inhDncJbvOt/riBL460Hmd/9
         8BBFDs3gyvEzeEODInCoYZ8khdZM0z51GRrkdKhmAUa+DjRKu0XepuUpIdJMendsOsEK
         cpwA==
X-Gm-Message-State: ACgBeo1w/0NZi424Bm8PeusLWSuno5LMvKGzafVaSpgcBQombONi6GZn
        TCdy7Jo1KAHh092BrqmFbH1pWP3nzwA=
X-Google-Smtp-Source: AA6agR48GajOdx08WbjhoFDZiES/3a7K+FMBMTIqKovUutbUEoExrwSNNq8KFyCfjdDRByOAM7RRMw==
X-Received: by 2002:a17:90b:1c8b:b0:1f7:6139:6808 with SMTP id oo11-20020a17090b1c8b00b001f761396808mr891372pjb.246.1660089841231;
        Tue, 09 Aug 2022 17:04:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w125-20020a626283000000b0052ab602a7d0sm467608pfb.100.2022.08.09.17.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 17:04:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9264c0f4-cc46-7930-8693-6b6a24e3da5e@roeck-us.net>
Date:   Tue, 9 Aug 2022 17:03:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>,
        =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
In-Reply-To: <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/9/22 15:34, Zev Weiss wrote:
> On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zoltán Kővágó wrote:
>> On 2022-08-09 22:56, Zev Weiss wrote:
>>> On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>>>> Hi,
>>>>
>>>> [1.] One line summary of the problem:
>>>> NCT6775: suspend doesn't work after updating to Linux 5.19
>>>>
>>>> [2.] Full description of the problem/report:
>>>> After updating my kernel from 5.18.11 to 5.19, I've noticed that resuming after suspend no longer works: fans start up, then about a second later, the computer just shuts down, leaving the USB ports powered up (normally it turns them off on shutdown). The screens don't turn on during this timeframe, so I can't see any useful log messages.
>>>>
>>>> Bisecting between 5.18 (where it still worked) and 5.19 lead me to commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon: (nct6775) Split core and platform driver" which looks like a refactor commit, but apparently it broke something.
>>>>
>>>
>>> Hi Zoltán,
>>>
>>> Thanks for the thorough bug report.  You're right that that commit was essentially just a refactor, though there was one slight change to the nct6775_suspend() function introduced during the review process that may perhaps have had some subtle unintended side-effects.
>>>
>>> Can you test the following patch and report if it resolves the problem?
>>>
>>>
>>> Thanks,
>>> Zev
>>
>> Hi Zev,
>>
>> Thanks for the quick reply. Yes, it looks like your patch does solve the problem (I've applied it on top of 5.19 (after fighting with my mail client for a while) and suspended a few times, it's working so far).
>>
>> Regards,
>> Zoltan
> 
> Great, thanks.
> 
> Guenter, it looks like nct6775_suspend() really does in fact need to use nct6775_update_device() instead of dev_get_drvdata(), though it's not immediately obvious to me why.  Though given that the bulk of of the body of nct6775_update_device() is inside an 'if' block that might not necessarily execute every time, I also wonder if it might be vulnerable to exhibiting the same problem depending on timing.
> 

It isn't obvious to me either except ... is it possible that nct6775_update_device()
was never called (ie that the 'sensors' command was never executed) ?
That might just possibly explain the problem because in that case the values
restored in the resume() function were actually never read from the chip.

Guenter

> Zoltán, if you could try another experiment to try to gather some data on that -- with the patch from my previous email still applied, could you try suspending via:
> 
>      $ cat /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input && echo mem > /sys/power/state
> 
> and see if suspend is broken again?  The idea being to read from the hwmon device's sensors and then immediately suspend so that the nct6775_update_device() call from nct6775_suspend() falls within the driver's 1.5 second cache window and hence skips most of the work that function does.  If the same problem starts occurring again that way, it seems we've had essentially the same bug lurking for a while and the change in the patch you bisected to just made it happen consistently instead of unpredictably.  If suspend/resume continues working however, then I'm quite mystified, because the only other thing that's happening in that function is a mutex lock/unlock.
> 
> 
> Thanks,
> Zev
> 

