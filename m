Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB2EC25B0D
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 03:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiHJDBL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 23:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiHJDA7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 23:00:59 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4224648EA9
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 20:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1660100438;
        bh=iB01wQcbWUbjsR976jlTZDE2bZGFHlfjE56BwUlK/FU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=YSWiq7oj4I/obUgMEaRrOxg1/6kRTJ8oXkmU3x86riDsSDEYBHIcFjezzzGhgFfY0
         XxPcGpnLLkhf6lxYu3kH88+DABiRFIgLpOY5764yf4MQoeqL/uAzIBxAr+U2UfTR34
         xFKLgykZVYLJao8+It9+x8FwQYfSHlOaMXNrCwt8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bWr-1nLQbF1H2h-010a6d; Wed, 10
 Aug 2022 05:00:38 +0200
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
To:     Zev Weiss <zev@bewilderbeest.net>,
        =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
 <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
 <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <2974b75e-bd89-3fe2-bcf6-96a9943905d9@gmx.de>
Date:   Wed, 10 Aug 2022 05:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:1lXJ/WucIFaw5IMUoS/VFYr2zvHnqMYwDoPZVqZ0s22oCIkT6Vq
 V+2pGVuIt815Wax3t5pIQideVtvwUxyPx0WODEmadRynarpAPIySbJC7Gc+PmIGu80WcBHQ
 UvgjcYNUasVHBZSDZL+o6TApBin9wDgGEW1+q5Fkivt9qbLC6lnqsjne+bpD0S/e3mitV6v
 CJXorZgP0nVio09E8931A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5vEpyjalwQk=:GDWRDedR90M3TahBbiogTW
 jUEIaCMi/wwYFh58e7geqHwU1/558b6yEcGIvifuN0fnbvPCAgICNKlu22WXGqEkfgux3Dbqn
 98d8N0VeMIIRo3kMP62aGmTGimHCrqL0dtTF9cdw6F9Krj2WXEU3f8nnY8RAdPPYxxF0dkqtj
 BAeffrWDNoyPrz0vVytQc8SLfijD33vH52dfYu/XI1XzzB7GF7CXV7HUOw7ylEpk58es78vkz
 DFKyn6papaYD9F+uKfaFf1h57TNNDQfnh+16WUr58sLFBA8eEGauimpATqEMGnQ1t7wjV4QS7
 U/NSkF/m3Q//uGrVhU1lGjceVcZW9LtOn7stmGr2XoqZeg4Otp2HiIc/iZZsR904KPajX8Jm3
 lb3iN1rCULJHfsCffMPQfbl3Z3dbhahmheP9f/FPfRYPb5s+QNLVjIiNE8S7/oRmHgnCKfgQi
 8B/0gOKShq6NSKiANmAA89kQIsO9VQg+gaHoPQnVd7BlYA2jhZTF05jz97NaznkhenoXJTcJN
 eBQfuiZExRs543YxA8prdD8e1kpIRzJognkkv7vEqk1TJSyoNEGU6OksN6lUY+6P92pWMP7Iu
 BpO6/lIHKC9KBSFdu63bnISMDFAQEm9lIUJ6yCY2mA0mimLJwljy/DSsiZQ1dAWmwBG0c8UD1
 dBVfb3C3UJpZMlKm7c0HexugNzW32++42R05fZCLfeFkpusblwhm1Fm4o5sbNEh1SgQlK8N8h
 qTw45eZuHUtoFlCRh2+SjIA/ZFH/3rbnDs/Ebc9Q2fKfB+76rlvvlisXDJhAX5MAWkFRM59MS
 fN8riTesq6omk2EpUbe3Ol9ccth3IKi2L9E0uVy3TLR9Ct+7E5yE31uWMw75ST4Kx0Y0LCe/p
 kBZHAM0NtBOeE56NDUWH6zS9ZwYBk/TTccMlYcgHqhkVSRejwD7SESeX9gTmnQnrZsfq/Db8x
 PyceuHwRz+F8oUfWGGqGiIbldAbCcnn3txKDb2w4OSjC9WMKNS8lCQBSTkUnf2svEn2ISWswU
 d4YB+9cFV4aE1AXlwt12wz1Q/1cF1U+insmDULWI+x3wB+FCByJlAZCjur7UnoRxvywhELtnb
 j6cZph6VjtQw1kswXJxwxogCxEqIPhD9S+fctMe898pb+vsm1JPR6vA5Q==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 10.08.22 um 03:39 schrieb Zev Weiss:

> On Tue, Aug 09, 2022 at 04:50:20PM PDT, Zolt=C3=A1n K=C5=91v=C3=A1g=C3=
=B3 wrote:
>> On 2022-08-10 00:34, Zev Weiss wrote:
>>> On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zolt=C3=A1n K=C5=91v=C3=A1g=C3=
=B3 wrote:
>>>> On 2022-08-09 22:56, Zev Weiss wrote:
>>>>> On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zolt=C3=A1n K=C5=91v=C3=A1g=
=C3=B3 wrote:
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
>>>>>> Bisecting between 5.18 (where it still worked) and 5.19 lead me
>>>>>> to commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon:
>>>>>> (nct6775) Split core and platform driver" which looks like a
>>>>>> refactor commit, but apparently it broke something.
>>>>>>
>>>>>
>>>>> Hi Zolt=C3=A1n,
>>>>>
>>>>> Thanks for the thorough bug report.=C2=A0 You're right that that com=
mit
>>>>> was essentially just a refactor, though there was one slight
>>>>> change to the nct6775_suspend() function introduced during the
>>>>> review process that may perhaps have had some subtle unintended
>>>>> side-effects.
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
>>>> Thanks for the quick reply. Yes, it looks like your patch does
>>>> solve the problem (I've applied it on top of 5.19 (after fighting
>>>> with my mail client for a while) and suspended a few times, it's
>>>> working so far).
>>>>
>>>> Regards,
>>>> Zoltan
>>>
>>> Great, thanks.
>>>
>>> Guenter, it looks like nct6775_suspend() really does in fact need to
>>> use nct6775_update_device() instead of dev_get_drvdata(), though
>>> it's not immediately obvious to me why.=C2=A0 Though given that the bu=
lk
>>> of of the body of nct6775_update_device() is inside an 'if' block
>>> that might not necessarily execute every time, I also wonder if it
>>> might be vulnerable to exhibiting the same problem depending on timing=
.
>>>
>>> Zolt=C3=A1n, if you could try another experiment to try to gather some
>>> data on that -- with the patch from my previous email still applied,
>>> could you try suspending via:
>>>
>>> =C2=A0=C2=A0=C2=A0 $ cat
>>> /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input &&
>>> echo mem > /sys/power/state
>>
>> Tried it, three times in fact, and it worked fine every time. Looking
>> at the dmesg, though, it looks like it needs a bit more than 1.5 sec
>> to suspend. Where's that 1.5 sec limit defined? I will try to
>> increase it tomorrow.
>>
>
> The 1.5 second duration comes from this line in nct6775_update_device():
>
> =C2=A0 if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
>
> Each 'HZ' represents one second, so HZ + HZ / 2 =3D 1.5 sec; if you want
> to lengthen it you could do e.g. 10 * HZ or something instead.
>
> Though as Guenter noted, one other possibility is that with the
> previous (buggy) version nct6775_update_device() might never have
> gotten called at all -- do you know if that might be the case on your
> system?=C2=A0 (i.e.=C2=A0 do you have any userspace monitoring program o=
r the
> like that would have been reading from the nct6775 device's sensors?)=C2=
=A0
> If something like that never ran between the driver getting loaded and
> the system suspending, that might also (partially) explain things; to
> test that out you could revert to the old buggy code and see if the
> suspend problem still occurs if you explicitly run
>
> =C2=A0 $ cat /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_=
input
>
> (or just 'sensors' if you've got the lm-sensors package installed).=C2=
=A0
> That will
> ensure that nct6775_update_device() gets called before the suspend
> operation, which could help narrow things down further.
>
In case you are running a Debian-based distribution, please note that Debi=
an unconditionally executes sensors on startup, something
i discovered when the dell-smm-hwmon driver was causing issues on my machi=
ne.

So you may need to temporarily disable lm-sensors.service and/or /etc/init=
.d/lm-sensors for testing.

Armin Wolf

>
> Thanks,
> Zev
>
