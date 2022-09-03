Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC71ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 15:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbiICPsI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 11:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiICPsI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 11:48:08 -0400
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF4C4D24F
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 08:48:05 -0700 (PDT)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
        by shout01.mail.de (Postfix) with ESMTP id 291A0A0921;
        Sat,  3 Sep 2022 17:48:04 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
        by postfix01.mail.de (Postfix) with ESMTP id 0D67F802AA;
        Sat,  3 Sep 2022 17:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
        s=mailde202009; t=1662220084;
        bh=qnLXldbbRNrpwwKggZJ1cYuKOG/REwW5WeEzLTD+op8=;
        h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
        b=c4eJVrPU4yqAlYUnN9yHty1uV7DZbs1kCNvm2hbiDsnvnAdKS+br+a/xrGjniJURl
         ZGZPeWg9i/mcvssMV+3lDk9ZENLxptrCC2x+vgBbG5ebjFIvhjEvE38mYJGHSkia+p
         YDg810tS+nXH6uuCiCdGGW3+0XTmeFALV6VMwxhclJPKiKUkd59n6liP+OE/d9HMM/
         asvedgyt52t8+F05HyhqkdNhyw7eC5GXbbk+RQHH/vtZSMe1ji0Lv5SE43MBe3Ura8
         Uxafy6elZU8fPKt+HtYt6IPfgA4B0QS9t+RurGrxuC07ptdfA9GpXDGRncNfhS7wUo
         oJMyojppg4OJw==
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp03.mail.de (Postfix) with ESMTPSA id D2378A0312;
        Sat,  3 Sep 2022 17:48:02 +0200 (CEST)
Message-ID: <166ca420-27a0-a86d-8d1d-e20a87d62cd4@my.mail.de>
Date:   Sat, 3 Sep 2022 17:48:02 +0200
MIME-Version: 1.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
From:   Christopher Klooz <py0xc3@my.mail.de>
In-Reply-To: <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1746
X-purgate-ID: 154282::1662220083-1DFFF25E-5D00F629/0/0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 03/09/2022 17:13, Eugene Shalygin wrote:
> Guenter,
>
> yes, there is a patch that I don't really understand, but it fixes a
> very similar problem:
> https://bugzilla.kernel.org/show_bug.cgi?id=216412 I will test today
> that change with a hardware where it needs to autoload and submit the
> patch if it works.
>
> Best regards,
> Eugene
I have forwarded the patch to the Fedora users experiencing the issue, 
one seems to currently try it. I will let you know if I get a feedback 
(https://ask.fedoraproject.org/t/battery-indicator-not-working-properly/25946/28).
>
> On Sat, 3 Sept 2022 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 9/3/22 04:00, Christopher Klooz wrote:
>>> Hi Eugene,
>>>
>>> Currently, we have user reports of at least 4 Fedora installations that have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
>>>
>>> All issues can be solved by blacklisting asus_ec_sensors.
>>>
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
>>>
>>> The bugzilla report contains kernel logs of two machines, one with nvidia-driver and one without a tainted kernel.
>>>
>>> The report and the contained ask.fedora link contain some elaborations of how the issue manifests at the users' machines. The major issue is a wrong output of battery power percentage (in one case it gets stuck, in the other cases is becomes erratic). Also, in one case it has effects on suspending (see the report).
>>>
>>> On the Internet, there are already reports from other Linux distributions noting the issue and the same solution (blacklisting).
>>>
>> Eugene,
>>
>> do you have an immediate idea other than reverting the patch pointed to in the bug report ?
>>
>> Thanks,
>> Guenter
>>
