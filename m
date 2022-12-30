Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F70C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 22:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbiL3WNw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 17:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiL3WNw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 17:13:52 -0500
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93941D0CE
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 14:13:50 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 384CC24011E
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 23:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1672438429; bh=MYS1+39RoPeUo146rDmHm7q0bNzOTs7PDq6fYDL70FU=;
        h=Date:Subject:To:Cc:From:From;
        b=gQYePr0uTm+RW5FhweTf6/bKMDOFJipGmlU+32fhSG1WfWV8OaGJnot4KrKg1spRy
         vJez+j/9O4yly2xpbaHl8oCK9OtTefvOJWFwo9C76ZBtBF+IWBi6OXwMxU5KeG4Ea0
         eyJMuyTkC4c8HIfzAwOgHzEsQwjHN54enrTD/ScbwPKj2nnAwP8A3c5S5M+qwiOFMY
         tlZwgfjk7KXed835ZIdLW4RSMiNN2GEkp5HX2UjnUof0b7sgiBeQCeVOh6yBDLqmfI
         IOrL+e8go306vvBqYeoDVtlp6K+X0oUHB3sbaXw6dyU7TDoxhDZlm9CO9GOl8cRsM8
         MU6e8WLZAwIcQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4NkKKS36gBz9rxK;
        Fri, 30 Dec 2022 23:13:48 +0100 (CET)
Message-ID: <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
Date:   Fri, 30 Dec 2022 22:13:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
To:     Guenter Roeck <linux@roeck-us.net>,
        Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
 <20221230214855.GA3881237@roeck-us.net>
Content-Language: de-DE
From:   Sebastian Arnhold <sebastian.arnhold@posteo.de>
In-Reply-To: <20221230214855.GA3881237@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thank you very much for the patch, Guenter Roeck!

I just compiled it using the mainline Kernel as a basis, but 
"sensors-detect" still claims there are no sensors detected on my ASUS 
TUF GAMING X670E-PLUS WIFI.

Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
Found unknown chip with ID 0xd802
     (logical device B has address 0x290, could be sensors)

dmesg yields the following output:

[  465.372161] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
[  465.372166] ACPI Warning: SystemIO range 
0x0000000000000295-0x0000000000000296 conflicts with OpRegion 
0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20221020/utaddress-204)
[  465.372170] ACPI: OSL: Resource conflict; ACPI support missing from 
driver?

So the driver definitely works and recognizes the chip. Any idea why 
lm-sensors can't access it?

Thanks,
Sebastian


Am 30.12.22 um 22:48 schrieb Guenter Roeck:
> On Fri, Dec 30, 2022 at 09:34:23PM +0100, Christian Lamparter wrote:
>> Hi Guenter,
>>
>> On 12/30/22 18:50, Guenter Roeck wrote:
>>> On Fri, Dec 30, 2022 at 06:32:23PM +0100, Christian Lamparter wrote:
>>>> On 12/28/22 14:57, Guenter Roeck wrote:
>>>>> NCT6799D is mostly compatible to NCT6798D, with minor variations.
>>>>>
>>>>> Note that NCT6798D and NCT6799D have a new means to select temperature
>>>>> sources, and to report temperatures from those sources. This is not
>>>>> currently implemented, meaning that most likely not all temperatures
>>>>> are reported.
>>>>>
>>>>> Initial support. Compile tested only.
>>>> FYI: This ID is compatible with the NCT6796D-S on the ASRock X670E PG Lighting Mainboard.
>>>> (Previous discussion: "[PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S"
>>>> <https://www.spinics.net/lists/linux-hwmon/msg17785.html>)
>>>>
>>>> With this patch applied, the nct6775 module loads and produces the following output when loaded.
>>>>
>>>> | [28152.009197] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
>>>>
>>>> and lm-sensors also enumerates the sensors and finally all six fans.
>>>> So this is definitively an improvement over my patch.
>>>>
>>> Thanks a lot for testing. I'd suspect that NCT6796D-S was mislabeled
>>> in the user manual. That would not be the first time.
>> The chips sits behind the GPU now. But I made a blurry photo before
>> I added the GPU though :-). The IC's label shows "Nuvoton NCT6796D-S"
>> <https://gist.github.com/chunkeey/89aeb85d6f71e7a2da9344615303c203>
>> (the chip is soldered at an 45° angle, hence I rotated the picture)
>>
>> I got that MB because of the phoronix review:
>> <https://www.phoronix.com/review/asrock-x670e-pg>
>> (NB: The review also noted the missing sensor support...
>> But not for much longer ;-) )
>>
>> Michael Larabel also made (better) pictures:
>> <https://www.phoronix.com/image-viewer.php?id=asrock-x670e-pg&image=asrock_x670pglightning_3_lrg>
>>
>> (While not the same motherboard, this Japanese review site has a
>> really sharp picture from the ASRock X670E Taichi NCT6796D-S SuperIO
>> <https://www.gdm.or.jp/x670etaichi_57_1024x768>)
>>
>> That all being said: Other users in the github thread for the
>> lm-sensors project:
>> <https://github.com/lm-sensors/lm-sensors/issues/416#issuecomment-1276620580>
>> clearly stated that their ASUS X670E TUF came with a "NCT6799D-R".
>>
>> Obviously, I'm totally fine with what the module calls it:
>> "NCT6799D or compatible".
>>
>>>> |# sensors
>>>> |
>>>> |nct6799-isa-0290
>>>> |Adapter: ISA adapter
>>>> |in0:                   720.00 mV (min =  +0.00 V, max =  +1.74 V)
>>>> |in1:                     1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in2:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
>>>> |in3:                     3.28 V  (min =  +2.98 V, max =  +3.63 V)
>>>> |in4:                     1.65 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in5:                     1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in6:                     1.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in7:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
>>>> |in8:                     3.23 V  (min =  +2.70 V, max =  +3.63 V)
>>>> |in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in10:                  600.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in11:                  608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in12:                    1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in13:                  896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |in14:                    1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
>>>> |fan1:                   891 RPM  (min =    0 RPM)
>>>> |fan2:                     0 RPM  (min =    0 RPM)
>>>> |fan3:                  1345 RPM  (min =    0 RPM)
>>>> |fan4:                   774 RPM  (min =    0 RPM)
>>>> |fan5:                     0 RPM  (min =    0 RPM)
>>>> |fan7:                     0 RPM  (min =    0 RPM)
>>> Interesting. Do you have three fans connected, and the motherboard has
>>> seven fans ?
>> There are six 4-pin fan ports on the motherboard (the list above has fan7
>> but not fan6. So there are still in total: six fans).
>>
>> Three fans (well - one AIO with a pump and two extra fans) are permanently installed
>> into the case. But I have connected an old, external CPU-Fan just to check the function
>> of fan2,fan5 and fan7 tachometers. So this worked :).
>>
>>>> |SYSTIN:                 +29.5°C    sensor = thermistor
>>>> |CPUTIN:                 +29.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
>>>> |AUXTIN0:                 +4.0°C  (high = +67.0°C, hyst = +110.0°C)  sensor = thermistor
>>> Hmm, that hysteresis value seems wrong. I'll need to check if the
>>> register addresses are correct.
>> Do you have the datasheet? I'm looking for it (I've also asked Nuvoton).
>> But so far no response. If you need a register range dump,
>> please let me know.
> Nuvoton was nice enough to send me one, after telling them that I am
> the hardware monitoring maintainer and that I keep getting asked to
> add Linux support for this chip.
>
> I'll have to spend some time tracking down the hysteresis issue.
> I think there may be a bug in the code. Temperature registers have
> changed in NCT6798 and NCT6799. I only have systems with NCT6797,
> but it seems wrong there as well. I'll need to do some debugging.
>
>> (AFAIK, all AMD5 X670E broads have dual chipset "chips". I think CPUTIN is
>> one of the two "PROM21" chips. Don't know what AUXTIN0 is...)
>>>> |AUXTIN1:                +15.0°C    sensor = thermistor
>>>> |AUXTIN2:                +15.0°C    sensor = thermistor
>>>> |AUXTIN3:                +13.0°C    sensor = thermistor
>>> Looks like either those are not connected, or there is a temperature
>>> offset which is not applied, or it is set to wrong values (the chip
>>> does support temperature offset registers).
>> yes, I too think these are not connected. The values don't move, even after
>> a prolonged stresstest. Furthermore, neither the UEFI BIOS nor the Windows
>> utility has additional temperature gauges.
>>
> Ok, good to know.
>
> Thanks,
> Guenter
