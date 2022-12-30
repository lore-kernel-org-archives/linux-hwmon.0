Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C0EC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 20:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiL3Ue2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 15:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiL3Ue1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 15:34:27 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325B81C122
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 12:34:26 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id w1so8569448wrt.8
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNyl68UzJGjrptP2vUd2iIonedSHFxgdHeshjpu6V70=;
        b=HsajQBwBmR0bjEcGV6EyVyO4/U6x1wOD+4pp5Wvhv91O+q66IVoElH3yoF4XIcdq0s
         ig7i9NIKekQs0odvmmx3pvL3UnKK/ybampeJ1F3xWY9WVYJQxLt2+7l0QDwnf8KnDMeH
         5wKBnHgxrA9ew/sK2gxIXhw10Juyd0IaWBCOjuA63oHV+cKC+r+KUhEUkRD8SOwRNMKd
         rFeN07Lyjlj50goFtjT8BGgrjR4CNHUk35KC4IuyEguMQZwoe0k6+4Mp6b05D1NVvO1V
         U2Aj5uo7caP9x4qXa4UORDWKam3xLpegLtcMEdRxQGB6iQmjNlJAc/OBI+66s6mcJ2EY
         Yx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNyl68UzJGjrptP2vUd2iIonedSHFxgdHeshjpu6V70=;
        b=oItAwXQWyHAwduI076RJ6U3WVmkkRO11nKRwYftmaGdNsFlPUX0zXFyTKnfkF3DzPr
         NXQb37J0Sq1uN41KgjXyU92lF5B1aou3obvTRyBYAKqKlHs0P2PE7uomY3rkUOmH+wJ2
         H/qd2zXU4sfaFiK7YMeifBtygu0Zz5vE8zpDms61g6F3BvGY0YVExkp2mDV7U5gaTmDq
         9jd7olU7FY+ApHuOUNSYG6+cjhPUoNvPdMDmfqIKgMPTZ9T0OVzzih2AjfV/0Oj39Egs
         3nzUO3Xat+G4/2zDKRiygDx5F3fYnnEJ/otBbhx7bYAy08RvcQgNW3o4NJwcpmXc8FNm
         a7Ug==
X-Gm-Message-State: AFqh2krmASgC3oC2knnNnO9YrO1IRqIMYOlucntDIW+xicNhuFGfryhu
        JPZ2j86g9nmvmFEO9BBPFfc=
X-Google-Smtp-Source: AMrXdXu2GWoLQ4GICemL3QbFJpL3eKdWAvSM5z6pCWR5VukYX/8w44sIcmvQPkGU5GhEVKrB2aqzcQ==
X-Received: by 2002:adf:fc51:0:b0:27d:ddaa:8bd8 with SMTP id e17-20020adffc51000000b0027dddaa8bd8mr12042031wrs.13.1672432464577;
        Fri, 30 Dec 2022 12:34:24 -0800 (PST)
Received: from shift.daheim (pd9e2923a.dip0.t-ipconnect.de. [217.226.146.58])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm21465010wrm.55.2022.12.30.12.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:34:24 -0800 (PST)
Received: from localhost ([127.0.0.1])
        by shift.daheim with esmtp (Exim 4.96)
        (envelope-from <chunkeey@gmail.com>)
        id 1pBM59-000BCb-2m;
        Fri, 30 Dec 2022 21:34:23 +0100
Message-ID: <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
Date:   Fri, 30 Dec 2022 21:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Content-Language: de-DE
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>,
        Sebastian Arnhold <sebastian.arnhold@posteo.de>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
From:   Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20221230175021.GA1136102@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 12/30/22 18:50, Guenter Roeck wrote:
 > On Fri, Dec 30, 2022 at 06:32:23PM +0100, Christian Lamparter wrote:
 >> On 12/28/22 14:57, Guenter Roeck wrote:
 >>> NCT6799D is mostly compatible to NCT6798D, with minor variations.
 >>>
 >>> Note that NCT6798D and NCT6799D have a new means to select temperature
 >>> sources, and to report temperatures from those sources. This is not
 >>> currently implemented, meaning that most likely not all temperatures
 >>> are reported.
 >>>
 >>> Initial support. Compile tested only.
 >>
 >> FYI: This ID is compatible with the NCT6796D-S on the ASRock X670E PG Lighting Mainboard.
 >> (Previous discussion: "[PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S"
 >> <https://www.spinics.net/lists/linux-hwmon/msg17785.html>)
 >>
 >> With this patch applied, the nct6775 module loads and produces the following output when loaded.
 >>
 >> | [28152.009197] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
 >>
 >> and lm-sensors also enumerates the sensors and finally all six fans.
 >> So this is definitively an improvement over my patch.
 >>
 >
 > Thanks a lot for testing. I'd suspect that NCT6796D-S was mislabeled
 > in the user manual. That would not be the first time.
The chips sits behind the GPU now. But I made a blurry photo before
I added the GPU though :-). The IC's label shows "Nuvoton NCT6796D-S"
<https://gist.github.com/chunkeey/89aeb85d6f71e7a2da9344615303c203>
(the chip is soldered at an 45° angle, hence I rotated the picture)

I got that MB because of the phoronix review:
<https://www.phoronix.com/review/asrock-x670e-pg>
(NB: The review also noted the missing sensor support...
But not for much longer ;-) )

Michael Larabel also made (better) pictures:
<https://www.phoronix.com/image-viewer.php?id=asrock-x670e-pg&image=asrock_x670pglightning_3_lrg>

(While not the same motherboard, this Japanese review site has a
really sharp picture from the ASRock X670E Taichi NCT6796D-S SuperIO
<https://www.gdm.or.jp/x670etaichi_57_1024x768>)

That all being said: Other users in the github thread for the
lm-sensors project:
<https://github.com/lm-sensors/lm-sensors/issues/416#issuecomment-1276620580>
clearly stated that their ASUS X670E TUF came with a "NCT6799D-R".

Obviously, I'm totally fine with what the module calls it:
"NCT6799D or compatible".

 >> |# sensors
 >> |
 >> |nct6799-isa-0290
 >> |Adapter: ISA adapter
 >> |in0:                   720.00 mV (min =  +0.00 V, max =  +1.74 V)
 >> |in1:                     1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in2:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
 >> |in3:                     3.28 V  (min =  +2.98 V, max =  +3.63 V)
 >> |in4:                     1.65 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in5:                     1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in6:                     1.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in7:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
 >> |in8:                     3.23 V  (min =  +2.70 V, max =  +3.63 V)
 >> |in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in10:                  600.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in11:                  608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in12:                    1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in13:                  896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |in14:                    1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
 >> |fan1:                   891 RPM  (min =    0 RPM)
 >> |fan2:                     0 RPM  (min =    0 RPM)
 >> |fan3:                  1345 RPM  (min =    0 RPM)
 >> |fan4:                   774 RPM  (min =    0 RPM)
 >> |fan5:                     0 RPM  (min =    0 RPM)
 >> |fan7:                     0 RPM  (min =    0 RPM)
 >
 > Interesting. Do you have three fans connected, and the motherboard has
 > seven fans ?

There are six 4-pin fan ports on the motherboard (the list above has fan7
but not fan6. So there are still in total: six fans).

Three fans (well - one AIO with a pump and two extra fans) are permanently installed
into the case. But I have connected an old, external CPU-Fan just to check the function
of fan2,fan5 and fan7 tachometers. So this worked :).

 >
 >> |SYSTIN:                 +29.5°C    sensor = thermistor
 >> |CPUTIN:                 +29.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
 >> |AUXTIN0:                 +4.0°C  (high = +67.0°C, hyst = +110.0°C)  sensor = thermistor
 >
 > Hmm, that hysteresis value seems wrong. I'll need to check if the
 > register addresses are correct.
Do you have the datasheet? I'm looking for it (I've also asked Nuvoton).
But so far no response. If you need a register range dump,
please let me know.

(AFAIK, all AMD5 X670E broads have dual chipset "chips". I think CPUTIN is
one of the two "PROM21" chips. Don't know what AUXTIN0 is...)
 >> |AUXTIN1:                +15.0°C    sensor = thermistor
 >> |AUXTIN2:                +15.0°C    sensor = thermistor
 >> |AUXTIN3:                +13.0°C    sensor = thermistor
 >
 > Looks like either those are not connected, or there is a temperature
 > offset which is not applied, or it is set to wrong values (the chip
 > does support temperature offset registers).
yes, I too think these are not connected. The values don't move, even after
a prolonged stresstest. Furthermore, neither the UEFI BIOS nor the Windows
utility has additional temperature gauges.

Regards,
Christian
