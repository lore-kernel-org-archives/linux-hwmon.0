Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771ADC00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 22:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbiHJW4M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 18:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiHJW4L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 18:56:11 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967855F10F
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 15:56:10 -0700 (PDT)
Received: from hatter.bewilderbeest.net (97-113-235-229.tukw.qwest.net [97.113.235.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EB291716;
        Wed, 10 Aug 2022 15:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1660172170;
        bh=/6B+OTYFtYyfz2uN3Agj8l2FJlCJE3YKL5j5x1QesOY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PuuOsZROV+EpXEXyNeQ4b+rSpBreO2Rh++YGtUCpCSg7qqvQojlcUSYY6D2U5vg5g
         9/pkWnqXqMuGADyCszE/6jFVxT8nf8f6p3kvS6oEDSWDgPKPJ3FYR/w4oh8w+aWoWH
         qO13Z/CJPRCZLQ4C0z7OC4GZ4tMrjaY8OpRJKDns=
Date:   Wed, 10 Aug 2022 15:56:08 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Armin Wolf <W_Armin@gmx.de>,
        =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
Message-ID: <YvQ3iMpRjEkvZ/Av@hatter.bewilderbeest.net>
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
 <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
 <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
 <2974b75e-bd89-3fe2-bcf6-96a9943905d9@gmx.de>
 <c53405c8-5a1c-9a68-2135-b8460b915091@roeck-us.net>
 <YvNKI1ADmFYEsurd@hatter.bewilderbeest.net>
 <e1086de8-e58c-0aa2-cc42-6ea8958c795e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1086de8-e58c-0aa2-cc42-6ea8958c795e@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 10, 2022 at 12:33:43AM PDT, Guenter Roeck wrote:
>On 8/9/22 23:03, Zev Weiss wrote:
>>On Tue, Aug 09, 2022 at 08:36:24PM PDT, Guenter Roeck wrote:
>>>On 8/9/22 20:00, Armin Wolf wrote:
>>>>Am 10.08.22 um 03:39 schrieb Zev Weiss:
>>>>
>>>>>On Tue, Aug 09, 2022 at 04:50:20PM PDT, Zoltán Kővágó wrote:
>>>>>>On 2022-08-10 00:34, Zev Weiss wrote:
>>>>>>>On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zoltán Kővágó wrote:
>>>>>>>>On 2022-08-09 22:56, Zev Weiss wrote:
>>>>>>>>>On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>>>>>>>>>>Hi,
>>>>>>>>>>
>>>>>>>>>>[1.] One line summary of the problem:
>>>>>>>>>>NCT6775: suspend doesn't work after updating to Linux 5.19
>>>>>>>>>>
>>>>>>>>>>[2.] Full description of the problem/report:
>>>>>>>>>>After updating my kernel from 5.18.11 to 5.19, I've noticed that
>>>>>>>>>>resuming after suspend no longer works: fans start up, then about
>>>>>>>>>>a second later, the computer just shuts down, leaving the USB
>>>>>>>>>>ports powered up (normally it turns them off on shutdown). The
>>>>>>>>>>screens don't turn on during this timeframe, so I can't see any
>>>>>>>>>>useful log messages.
>>>>>>>>>>
>>>>>>>>>>Bisecting between 5.18 (where it still worked) and 5.19 lead me
>>>>>>>>>>to commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon:
>>>>>>>>>>(nct6775) Split core and platform driver" which looks like a
>>>>>>>>>>refactor commit, but apparently it broke something.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>Hi Zoltán,
>>>>>>>>>
>>>>>>>>>Thanks for the thorough bug report.  You're right that that commit
>>>>>>>>>was essentially just a refactor, though there was one slight
>>>>>>>>>change to the nct6775_suspend() function introduced during the
>>>>>>>>>review process that may perhaps have had some subtle unintended
>>>>>>>>>side-effects.
>>>>>>>>>
>>>>>>>>>Can you test the following patch and report if it resolves the
>>>>>>>>>problem?
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>Thanks,
>>>>>>>>>Zev
>>>>>>>>
>>>>>>>>Hi Zev,
>>>>>>>>
>>>>>>>>Thanks for the quick reply. Yes, it looks like your patch does
>>>>>>>>solve the problem (I've applied it on top of 5.19 (after fighting
>>>>>>>>with my mail client for a while) and suspended a few times, it's
>>>>>>>>working so far).
>>>>>>>>
>>>>>>>>Regards,
>>>>>>>>Zoltan
>>>>>>>
>>>>>>>Great, thanks.
>>>>>>>
>>>>>>>Guenter, it looks like nct6775_suspend() really does in fact need to
>>>>>>>use nct6775_update_device() instead of dev_get_drvdata(), though
>>>>>>>it's not immediately obvious to me why.  Though given that the bulk
>>>>>>>of of the body of nct6775_update_device() is inside an 'if' block
>>>>>>>that might not necessarily execute every time, I also wonder if it
>>>>>>>might be vulnerable to exhibiting the same problem depending on timing.
>>>>>>>
>>>>>>>Zoltán, if you could try another experiment to try to gather some
>>>>>>>data on that -- with the patch from my previous email still applied,
>>>>>>>could you try suspending via:
>>>>>>>
>>>>>>>    $ cat
>>>>>>>/sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input &&
>>>>>>>echo mem > /sys/power/state
>>>>>>
>>>>>>Tried it, three times in fact, and it worked fine every time. Looking
>>>>>>at the dmesg, though, it looks like it needs a bit more than 1.5 sec
>>>>>>to suspend. Where's that 1.5 sec limit defined? I will try to
>>>>>>increase it tomorrow.
>>>>>>
>>>>>
>>>>>The 1.5 second duration comes from this line in nct6775_update_device():
>>>>>
>>>>>  if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
>>>>>
>>>>>Each 'HZ' represents one second, so HZ + HZ / 2 = 1.5 sec; if you want
>>>>>to lengthen it you could do e.g. 10 * HZ or something instead.
>>>>>
>>>>>Though as Guenter noted, one other possibility is that with the
>>>>>previous (buggy) version nct6775_update_device() might never have
>>>>>gotten called at all -- do you know if that might be the case on your
>>>>>system?  (i.e.  do you have any userspace monitoring program or the
>>>>>like that would have been reading from the nct6775 device's sensors?)
>>>>>If something like that never ran between the driver getting loaded and
>>>>>the system suspending, that might also (partially) explain things; to
>>>>>test that out you could revert to the old buggy code and see if the
>>>>>suspend problem still occurs if you explicitly run
>>>>>
>>>>>  $ cat /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input
>>>>>
>>>>>(or just 'sensors' if you've got the lm-sensors package installed).
>>>>>That will
>>>>>ensure that nct6775_update_device() gets called before the suspend
>>>>>operation, which could help narrow things down further.
>>>>>
>>>>In case you are running a Debian-based distribution, please note that Debian unconditionally executes sensors on startup, something
>>>>i discovered when the dell-smm-hwmon driver was causing issues on my machine.
>>>>
>>>>So you may need to temporarily disable lm-sensors.service and/or /etc/init.d/lm-sensors for testing.
>>>>
>>
>>I'm not sure offhand what it does in that area, but Zoltán's initial bug report indicated that the problem occurred on Gentoo, FWIW.
>>
>>>
>>>The assumption was that the sensors command was _not_ executed prior
>>>to suspend and that this triggers the problem. If it was executed at least
>>>once and the crash on resume still happens, something else must be going
>>>on. Either case, I think it is best to apply the patch suggested by Zev.
>>>We can try to figure out the exact cause of the problem later. Zev, can
>>>you send me a formal patch ? I would like to apply and send it to Linus
>>>as soon as possible.
>>>
>>
>>Ack, patch sent.
>>
>> From what we've seen so far though, it seems likely (if for no other reason than that if this _isn't_ the cause there must be something truly weird going on) that the problem stems from nct6775_update_device() simply having never been called at all.  If we can confirm that that's the case, should we perhaps just add an unconditional call to nct6775_update_device() at the end of nct6775_probe(), and revert the patch I just sent so as to avoid the single-consumer symbol export?
>>
>
>I thought about calling it in probe, but I don't really like it because
>it would slow down boot.

True, that's a fair point.

>Let's introduce a namespace (say, NCT6775) instead.
>Change all EXPORT_SYMBOL_GPL(x) to EXPORT_SYMBOL_NS_GPL(x, NCT6775) and
>add MODULE_IMPORT_NS(NCT6775) to nct6775-platform.c and nct6775-i2c.c.
>This will ensure that the exported symbols can only be called from the
>nct6775 code.
>

nct6775-core.c currently has DEFAULT_SYMBOL_NAMESPACE #defined to 
HWMON_NCT6775 (and the platform and i2c drivers are using 
MODULE_IMPORT_NS(HWMON_NCT6775)), so I think that's already in place -- 
I guess we can just leave it as is with the patch that's now upstream 
then.


Zev

