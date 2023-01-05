Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB2BC3DA7D
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Jan 2023 12:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbjAEMqV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 5 Jan 2023 07:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232072AbjAEMqP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 5 Jan 2023 07:46:15 -0500
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F06443A27
        for <linux-hwmon@vger.kernel.org>; Thu,  5 Jan 2023 04:46:13 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 880972403EE
        for <linux-hwmon@vger.kernel.org>; Thu,  5 Jan 2023 13:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1672922771; bh=CnA3qdEWCR7KtqQJ4O+LFKT7n4VrUdRkiEoU27jo+48=;
        h=Date:Subject:To:Cc:From:From;
        b=IFr+2Xe3hUMri6YsP9QRpQRWyO2424Zsf4eCxZng5lJsW3X6xlWrQqLzon7gfbiMn
         bZep9SxtK1QhKVTCfKWsCbWtGasVvaF2wd1Hvx3IJjOSNryXHpDnrfVUbS4hiShpgg
         jbU1M264AzX/u2UnA9EzzTPY5EeocW/5H+kzAovIsDWkz7Igi1s1jvYhSE2QtbmhMD
         sqXAgntS+1le5FUXMxXXsw7FMulIjHwYGI6IbzmwwUcbyw9RAxOI54l0NIHKUENrSp
         XfbvjG4Nu+IlRXXsHPdcpG8/oiIp3BCbbdEOSwPpw1z101riV6T4+GKUsT72gQXqXQ
         kjJNCsF6SPZ/Q==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4NnmRh2f8xz6tmV;
        Thu,  5 Jan 2023 13:46:08 +0100 (CET)
Message-ID: <767c4090-007c-a819-e047-11971ea9cc17@posteo.de>
Date:   Thu,  5 Jan 2023 12:46:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
 <20221230214855.GA3881237@roeck-us.net>
 <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
 <73d1eb21-6cb9-a60f-218b-af129c2cb7a4@gmail.com>
 <3ba37e2d-413b-4d7d-e99b-8e0a53bd7f4e@posteo.de>
 <20230104034136.GA228903@roeck-us.net>
Content-Language: de-DE
From:   Sebastian Arnhold <sebastian.arnhold@posteo.de>
In-Reply-To: <20230104034136.GA228903@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter & friends,

I'm such an idiot! The patch works, of course. I did everything 
correctly and then simply forgot to load the module. :D

Adding "acpi_enforce_resources=lax" is necessary for my system, but then 
it works! Other people on the lm-sensors project report that, too. So 
the driver seems to be working for a first release.

Watching my fanspeeds with the "Vitals" GNOME extension and generating 
fancurves with pwmconfig/fanspeed as we speak! Awesome!

Now we should get it into the Linux kernel for the next release asap. 
I've heard on Phoronix that the driver additions queque for Kernel 6.3 
has now begun. I don't think there would be any negative side effects, 
since the module was based on the datasheet. Some values seem to be off, 
though - I'll attach my "sensors" output.

Thank you all very much! :)
Sebastian


nct6799-isa-0290
Adapter: ISA adapter
in0:                      840.00 mV (min =  +0.00 V, max =  +1.74 V)
in1:                      1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in2:                        3.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in3:                        3.33 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in4:                      992.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in5:                        1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in6:                      472.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in7:                        3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in8:                        3.30 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in9:                        1.66 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in10:                     560.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in11:                     552.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in12:                       1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in13:                     216.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in14:                       2.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
fan1:                      607 RPM  (min =    0 RPM)
fan2:                        0 RPM  (min =    0 RPM)
fan3:                        0 RPM  (min =    0 RPM)
fan4:                      910 RPM  (min =    0 RPM)
fan5:                      625 RPM  (min =    0 RPM)
fan6:                        0 RPM  (min =    0 RPM)
fan7:                        0 RPM  (min =    0 RPM)
SYSTIN:                    +34.0°C  (high = +80.0°C, hyst = +75.0°C)  
sensor = thermistor
CPUTIN:                    +40.5°C  (high = +80.0°C, hyst = +75.0°C)  
sensor = thermistor
AUXTIN0:                   +61.0°C    sensor = thermistor
AUXTIN1:                   +19.0°C    sensor = thermistor
AUXTIN2:                   +20.0°C    sensor = thermistor
AUXTIN3:                   -62.0°C    sensor = thermistor
PECI Agent 0 Calibration:  +40.5°C
PCH_CHIP_CPU_MAX_TEMP:      +0.0°C
PCH_CHIP_TEMP:              +0.0°C
PCH_CPU_TEMP:               +0.0°C
TSI0_TEMP:                 +50.6°C
intrusion0:               ALARM
intrusion1:               OK
beep_enable:              disabled


Am 04.01.23 um 04:41 schrieb Guenter Roeck:
> On Sat, Dec 31, 2022 at 11:42:57PM +0000, Sebastian Arnhold wrote:
>> I tried to add acpi_enforce_resources=lax, but sadly, it does not solve the
>> problem.
>>
> What do you see in the kernel log after adding that ?
>
> Thanks,
> Guenter
>
>> Maybe Ahmad can help add support for the board?
>>
>> Thanks,
>> Sebastian
>>
>> Am 30.12.22 um 23:58 schrieb Christian Lamparter:
>>> Hi Sebastian,
>>>
>>> On 12/30/22 23:13, Sebastian Arnhold wrote:
>>>> Thank you very much for the patch, Guenter Roeck!
>>>>
>>>> I just compiled it using the mainline Kernel as a basis, but
>>>> "sensors-detect" still claims there are no sensors detected on my
>>>> ASUS TUF GAMING X670E-PLUS WIFI.
>>> Unfortunately, this might be because ASUS has some "new" ideas :/.
>>> See this RFC from Ahmad back from October (Author is in Cc)
>>> for an in-depth view why this is happening:
>>>
>>> https://patchwork.kernel.org/project/linux-hwmon/patch/20221018173428.71080-1-ahmad@khalifa.ws/
>>>
>>>
>>> Regards,
>>> Christian
>>>
