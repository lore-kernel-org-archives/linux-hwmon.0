Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7D1C07545
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 02:21:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbjJYCVh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Oct 2023 22:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjJYCVh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2023 22:21:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131F79C
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1698200479; x=1698805279; i=w_armin@gmx.de;
        bh=nc3GJk6UgWSkGgkRrWJspqjPE6qp0FMfT8Jm7D58mag=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=rQ1B0JtvHDu9/i8djkC0KafxFghFLDC5jcYwaUQdXNCOAajc0Q+nMUIqcSr65gWD
         CfWj4iXCG71rN7ZFrP1eF9YgJAGP2vUgOQ0X4wMm+PVc9TCYOBM0yW8VMQe16K8HE
         QdA/cPhhPblxiIfXVXxXAltgYshQizqXPsaU+EswgG/LWo+ISN1zF6AlVzd/CvvhY
         917t95MFAquSKE7oNwcNKPTOBjUDsSYQU6WzOaPmw7In4LIHCr0KqSCoKwekAJPt1
         Uk+4qNhmXYDpfQ4JdXLBhnRQvzSpGvj8d128FGlYG0YVwwl3O99JIytKThtvX4N2I
         eg3dZyys/uJ2RvFFWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1qsz4j3pUV-006LIW; Wed, 25
 Oct 2023 04:21:18 +0200
Message-ID: <9774e5d6-9f40-42e2-9961-8ad276d0de3f@gmx.de>
Date:   Wed, 25 Oct 2023 04:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sch5627 on Fujitsu Celsius W280
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ian Nartowicz <deadbeef@nartowicz.co.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20231024150438.68dd079b@debian.org>
 <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
 <7d9b4557-5e4b-44ea-be6f-2d23632dcf77@gmx.de>
 <48d6b407-5431-4cb9-a43f-d0ca767d8a13@roeck-us.net>
Content-Language: en-US
From:   Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <48d6b407-5431-4cb9-a43f-d0ca767d8a13@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rk3JUQTX5t4Afb5gNblIhC+7oP5QzFHsGKY0PzHcazqW3PAgp61
 Y17ehnfK4V70NXwwbFjrBCY+K4t5fA+1EAMJN9EHYwXAIG0DiWAYPkMcEFaebNWND/Q+sNc
 81R1Tu4+J/pasq45hNTsnD+xmSU3ZURnYRJU4eB9J66FxbUhLKx1q5sJwU/Wxn03FKQIHf7
 D1pTb+JuX233ukOsYEjkA==
UI-OutboundReport: notjunk:1;M01:P0:yaOPfeWbugM=;CqnvrDeDzMX0ypDizX47AppUTKQ
 JN73bfN8wb4lckR9sBIul4prD4uhSDzMBnbOnlNmEKuxhsEj00BHJ9TggpkqLC3bDVyVuVBCK
 8wjf2Cl0bbR8NrAVMJTlF45uTJbZ03zwIaQawKxClUXjk8QxDAQ4kbx1rPEoclZbO9O0E0nEP
 4W+2vKnZfneobYFUMX2gU50PN8+1GAL2j70nSSr2WR8lJ6825ZyZ1Ilb9eDw7af00eTD/ygz0
 Uxhs56gQfyHE5UbY3CN/uHKZuof9xVbD21OM4tBrSWdLH9Qil4r+Qx4pfFMGzvYxiARVZhYCX
 5R/owNBLDyA7jLXWfVJTrP4ji/D16grbNf4+UAX34sq0ZMtFhmymq2ORd/TA9ZltK6XabKA1r
 SN9F5G5LCaetwNCS4ry2XeJUyFynUlaKWDIAm25J7XEkHcLMyKnwQCnv+zRXVmVW5VDBngMd1
 51wWs72R8Rt4tc8RWe237F+zB1K12q6J/CVga9KcSQUSxYYX2jmvLN5T1Z8W5NfOpKixIaXI5
 Wfe+kPdsUVXYBMAIQMOrly7OGOC4/mmTDyo4cIYL8nupc4NYPtEVvR20YEujndk7pWTrGae49
 jTcYeRWm4+SuwzzKsWE5dpjKQ2C9DjtSStLo0st5UK33iZcVlOIEuyTkibtp6O6JdpzlCZN8/
 SpFclTgMgZzOSmkKPP7Z0pTT/0DB4a6rGm2aAjH88fS5+GDuJ9kWR1R5on9xoRc82+bthZVzX
 OrrGiOqbfc1zsgi5IKx/TGysE8azlx3CkhOWf/+Aq/kfjLFd/Kp7MOyVvjmnXMG9XiOMDqpFk
 39evjA3a88JqPhekY4EdIOQmm41Jrk8WPwimo9FDsoxVVnHC6Q6VeyxOm93KTT5kMzvMhuDO2
 m3QtULDjsGb83/wNJz91r2e0fbkqsxMpuAsiVLEd+DkT7U5OXi6JaA2EmbrKhm4ua1lt1o9ly
 ckiCWwyAvThifBV6JpvjKnjHQYA=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 24.10.23 um 20:21 schrieb Guenter Roeck:

> On Tue, Oct 24, 2023 at 07:42:11PM +0200, Armin Wolf wrote:
>> Am 24.10.23 um 16:48 schrieb Guenter Roeck:
>>
>>> On 10/24/23 07:04, Ian Nartowicz wrote:
>>>> I just upgraded a Celsius W280 to the 6.1 kernel and noticed that
>>>> hardware
>>>> monitoring was gone.=C2=A0 Was working in 5.10.=C2=A0 When I added it=
 to the
>>>> dmi_override_table, it started working again (with a slightly
>>>> different device
>>>> name).=C2=A0 dmidecode shows it as an on board device, type other, st=
atus
>>>> disabled
>>>> (just the watchdog?), and description "SMsC SuperI/O".
>>>>
>>> Weird, this is the second private e-mail I get in a single day.
>>> Is there some information out there suggesting that kernel maintainers
>>> should be contacted without copying the mailing list ? If so, tell the=
m
>>> it is wrong. As warning to everyone, I won't reply any further
>>> to private e-mails like this.
>>>
>>> Looking at the code, try adding ignore_dmi=3D1 as module parameter whe=
n
>>> loading the driver. I think commit 393935baa45e5c messed it up and
>>> prevents the driver from loading if the parameter is not provided.
>>> Maybe the conditions in sch56xx_init() are wrong or too generic.
>>> Armin, any comments ? Do we need to revert your patch ?
>>>
>>> Guenter
>>>
>> I think so, it seems that the DMI devices are not always present.
>> We better revert the DMI autodetection patch to prevent anymore
>> regressions like this.
>>
> Not sure what I'd need to revert. Would it be all of the following ?
>
> fd2d53c367ae hwmon: (sch56xx-common) Add DMI override table
> 393935baa45e hwmon: (sch56xx-common) Add automatic module loading on sup=
ported devices

Those two commits should be reverted. The other commit is still useful wit=
hout the DMI
autoloading, since it allows user to just load sch56xx-common without havi=
ng to load
sch5627/sch5636 manually afterwards.

> 4db3c09228a0 hwmon: (sch56xx) Autoload modules on platform device creati=
on
>
> Alternatively, we could add Celsius W280 to the dmi override table.
> After all, the code has been present since 6.1, and the functional
> gain seems to be sufficient. Adding W280 with a Fixes: tag pointing
> to fd2d53c367ae would make more sense to me than reverting the above
> patches.

I fear that there are far more machines suffering from this exact same iss=
ue.
It seems to me now that the DMI device is only optional, possibly to signa=
l the
availability of some sort of management technology of which the hwmon inte=
rface
seems to be part of.

We could solve this problem by somehow making it possible to send uevents =
if
DMI onboard devices are detected. They could then be used to load the nece=
ssary
drivers.

However since we currently cannot do this, i would revert the two patches =
for
the time being.

Armin Wolf

>
> Guenter
