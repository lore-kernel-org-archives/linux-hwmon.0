Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3349BC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 21:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiL3VtA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 16:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiL3Vs7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 16:48:59 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34718113
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 13:48:58 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id x44-20020a05683040ac00b006707c74330eso13786799ott.10
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 13:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOvZvw5Lt4Tkm7CRXi6jcu4F3055xCYFJE2b5rNHK3Y=;
        b=Gi/MlM5H0RpM90DLBwWAIZ2rA4dZI024Tmo5uInf/GJt76SnvY35u/go5kT1/ve+Fi
         1R3kOmGFUWq6E7qqKmIATNmJDpoYUsAjA45Ko571oy3SKW9p2bzY9fqk/HLubc2dk715
         +FDIMLOLw9HBTn2YY9gAA9WppbSRVkkY7IRfaxEXJMFaBXVO6r4/wv48U+YPP2sf8I+S
         XNENMqluf9UPGbUGFWVwjXB0ZkRIbtXqvsthCZgnHwJoapw47WQBr9QJS2KbhVWi3rJ+
         hlgy0YbIaEfDIF0cqBqrqvGrD7KDikFzwqjVUD5rwIRDhp0TMWZE9YtYTp0ApsIdRr/m
         687A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOvZvw5Lt4Tkm7CRXi6jcu4F3055xCYFJE2b5rNHK3Y=;
        b=XXzv1VT+ElfH4gDDz9mlUPosuHE5+cP/LUYGRyIv46U2TaN/ngstUCq6qrcLxMy9S4
         v6QKdPpdKL7poqxsJTcy+Ofj1c128r4C2bwZ3EyeFtMzhDHi55LQvyY51i6EOHc2GwkQ
         TQNuRsxxkrwDH9Y/OgqJUsdIT4GmYAM0TO9cfnc7jMvgYH2eVxEkde51nrJYKvhUCNXp
         sjkdrZrUoQB1FRxVK24TDJgzA0KKZyJzQX4BSbCpgQ7/MFKhErObZGKVnxUhxoyAG6y8
         G9q/K5R+MGvYRUaiWhVxF4TLhVsLznZIDgDMYTwGGTVz7ANJdArBvwbXQp4PPbZ+MdtZ
         LUhw==
X-Gm-Message-State: AFqh2kppGpY74JMBHQOa/+l4ivsaZsfdZtbH7fFHHihu/LEJ65Pa0Npz
        g1sRI941ZQxvMAuwGPRKIS3qPCatJlk=
X-Google-Smtp-Source: AMrXdXsxpSEcsp3+Grzsva5HVRu4Wb1CQgwg0OD+8otykY2Y4dl+Eq6TM/FaOKmdoNN8xIU6NU1YPQ==
X-Received: by 2002:a05:6830:160b:b0:670:5c6c:b59e with SMTP id g11-20020a056830160b00b006705c6cb59emr18183443otr.6.1672436937399;
        Fri, 30 Dec 2022 13:48:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u20-20020a9d4d94000000b0066871c3adb3sm10828436otk.28.2022.12.30.13.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 13:48:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 30 Dec 2022 13:48:55 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>,
        Sebastian Arnhold <sebastian.arnhold@posteo.de>
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Message-ID: <20221230214855.GA3881237@roeck-us.net>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 30, 2022 at 09:34:23PM +0100, Christian Lamparter wrote:
> Hi Guenter,
> 
> On 12/30/22 18:50, Guenter Roeck wrote:
> > On Fri, Dec 30, 2022 at 06:32:23PM +0100, Christian Lamparter wrote:
> >> On 12/28/22 14:57, Guenter Roeck wrote:
> >>> NCT6799D is mostly compatible to NCT6798D, with minor variations.
> >>>
> >>> Note that NCT6798D and NCT6799D have a new means to select temperature
> >>> sources, and to report temperatures from those sources. This is not
> >>> currently implemented, meaning that most likely not all temperatures
> >>> are reported.
> >>>
> >>> Initial support. Compile tested only.
> >>
> >> FYI: This ID is compatible with the NCT6796D-S on the ASRock X670E PG Lighting Mainboard.
> >> (Previous discussion: "[PATCH v1] hwmon: (nct6775) Add chip ID for NCT6796D-S"
> >> <https://www.spinics.net/lists/linux-hwmon/msg17785.html>)
> >>
> >> With this patch applied, the nct6775 module loads and produces the following output when loaded.
> >>
> >> | [28152.009197] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
> >>
> >> and lm-sensors also enumerates the sensors and finally all six fans.
> >> So this is definitively an improvement over my patch.
> >>
> >
> > Thanks a lot for testing. I'd suspect that NCT6796D-S was mislabeled
> > in the user manual. That would not be the first time.
> The chips sits behind the GPU now. But I made a blurry photo before
> I added the GPU though :-). The IC's label shows "Nuvoton NCT6796D-S"
> <https://gist.github.com/chunkeey/89aeb85d6f71e7a2da9344615303c203>
> (the chip is soldered at an 45° angle, hence I rotated the picture)
> 
> I got that MB because of the phoronix review:
> <https://www.phoronix.com/review/asrock-x670e-pg>
> (NB: The review also noted the missing sensor support...
> But not for much longer ;-) )
> 
> Michael Larabel also made (better) pictures:
> <https://www.phoronix.com/image-viewer.php?id=asrock-x670e-pg&image=asrock_x670pglightning_3_lrg>
> 
> (While not the same motherboard, this Japanese review site has a
> really sharp picture from the ASRock X670E Taichi NCT6796D-S SuperIO
> <https://www.gdm.or.jp/x670etaichi_57_1024x768>)
> 
> That all being said: Other users in the github thread for the
> lm-sensors project:
> <https://github.com/lm-sensors/lm-sensors/issues/416#issuecomment-1276620580>
> clearly stated that their ASUS X670E TUF came with a "NCT6799D-R".
> 
> Obviously, I'm totally fine with what the module calls it:
> "NCT6799D or compatible".
> 
> >> |# sensors
> >> |
> >> |nct6799-isa-0290
> >> |Adapter: ISA adapter
> >> |in0:                   720.00 mV (min =  +0.00 V, max =  +1.74 V)
> >> |in1:                     1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in2:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
> >> |in3:                     3.28 V  (min =  +2.98 V, max =  +3.63 V)
> >> |in4:                     1.65 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in5:                     1.05 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in6:                     1.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in7:                     3.39 V  (min =  +2.98 V, max =  +3.63 V)
> >> |in8:                     3.23 V  (min =  +2.70 V, max =  +3.63 V)
> >> |in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in10:                  600.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in11:                  608.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in12:                    1.04 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in13:                  896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |in14:                    1.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> >> |fan1:                   891 RPM  (min =    0 RPM)
> >> |fan2:                     0 RPM  (min =    0 RPM)
> >> |fan3:                  1345 RPM  (min =    0 RPM)
> >> |fan4:                   774 RPM  (min =    0 RPM)
> >> |fan5:                     0 RPM  (min =    0 RPM)
> >> |fan7:                     0 RPM  (min =    0 RPM)
> >
> > Interesting. Do you have three fans connected, and the motherboard has
> > seven fans ?
> 
> There are six 4-pin fan ports on the motherboard (the list above has fan7
> but not fan6. So there are still in total: six fans).
> 
> Three fans (well - one AIO with a pump and two extra fans) are permanently installed
> into the case. But I have connected an old, external CPU-Fan just to check the function
> of fan2,fan5 and fan7 tachometers. So this worked :).
> 
> >
> >> |SYSTIN:                 +29.5°C    sensor = thermistor
> >> |CPUTIN:                 +29.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
> >> |AUXTIN0:                 +4.0°C  (high = +67.0°C, hyst = +110.0°C)  sensor = thermistor
> >
> > Hmm, that hysteresis value seems wrong. I'll need to check if the
> > register addresses are correct.
> Do you have the datasheet? I'm looking for it (I've also asked Nuvoton).
> But so far no response. If you need a register range dump,
> please let me know.

Nuvoton was nice enough to send me one, after telling them that I am
the hardware monitoring maintainer and that I keep getting asked to
add Linux support for this chip. 

I'll have to spend some time tracking down the hysteresis issue.
I think there may be a bug in the code. Temperature registers have
changed in NCT6798 and NCT6799. I only have systems with NCT6797,
but it seems wrong there as well. I'll need to do some debugging.

> 
> (AFAIK, all AMD5 X670E broads have dual chipset "chips". I think CPUTIN is
> one of the two "PROM21" chips. Don't know what AUXTIN0 is...)
> >> |AUXTIN1:                +15.0°C    sensor = thermistor
> >> |AUXTIN2:                +15.0°C    sensor = thermistor
> >> |AUXTIN3:                +13.0°C    sensor = thermistor
> >
> > Looks like either those are not connected, or there is a temperature
> > offset which is not applied, or it is set to wrong values (the chip
> > does support temperature offset registers).
> yes, I too think these are not connected. The values don't move, even after
> a prolonged stresstest. Furthermore, neither the UEFI BIOS nor the Windows
> utility has additional temperature gauges.
> 
Ok, good to know.

Thanks,
Guenter
