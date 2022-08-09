Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B43C19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 23:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiHIXu2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 19:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiHIXu0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 19:50:26 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463E5286CC
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 16:50:24 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id ay36-20020a05600c1e2400b003a4e30d7995so214812wmb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 16:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject:from:from:to:cc;
        bh=hL9kO6vUHX9ec02UDiFgJ9eKYb7yv8Q+GxjoDjIT8mg=;
        b=nAwwmQ6dpIYttbjp35yQ6pMaY8gK6MnKdALrQ41w+maeKn1ZHcQe49P3q/baghcPCd
         zJCk0CH5mkMa3E782f0xDyjutdM/217kjnyrvHRg+HDYBU8587P7P0s2h7BfNDPVb8Vn
         V7yjiTM90MraLd4Kn9FHH10IoTQifPCbFl7GNLg2rlVDulNAsyEvnQ74anfuwOE6FUEv
         +cvDj12m9dQb0xxdw4/AoGmMWt2JtneCk0lYEc1XKe59Ggj+xSlpU4cShbzlk7puHN9N
         3cKnLK+VdC8G+9BbpurjC3f/GhqZ0r7LXYoTIz0QVXY/+H1JbItn9SauyhYzIEO3kBjA
         eEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject:from:x-gm-message-state:from:to
         :cc;
        bh=hL9kO6vUHX9ec02UDiFgJ9eKYb7yv8Q+GxjoDjIT8mg=;
        b=fkM9j7TqmSa0d9yEP6Q+B+qad0B8XWDI24ndgSQhNj9pbK/pEkUVduTOXeXHN0obqI
         5+cC8Irx58JQDf+CjrjRYn0RZLL67EvK3vh8WN+EkRGGpW8+7i/L1R+7eoK+Sm+ibN/y
         VtynOH3s10V57r9AP9s3iZMkfNTzALBgvaBg2EK70CN24UvVY/HUwP4uyQruTIb87OLR
         Ho64PpuWdHd/QqI40NaQ8NbJpTGG/I0sYh8V1cmFOKYllqZutHpcnyifWIrpkiEp4fIU
         Db8o7kBiAdr/EeDbhFDhFTfA3hNDNIc2dUTTVbv7yU8jzfFYlwXDPWMi4RnlqlUkEj7M
         SxMQ==
X-Gm-Message-State: ACgBeo2jdJcZHRWlzR+sbKrijSO2yO54bpXs/e1p6LFoWoitF9iPfaCT
        UjbCX/wj69neLdFsIs2+08vbdyjMtSI=
X-Google-Smtp-Source: AA6agR6RPvJz8w21qjg0zwh4nqsxhrzMjRYUIfvROgS609LlX0TkqSPwAP++mvvlMbMa3qnHxiTUVw==
X-Received: by 2002:a05:600c:ad4:b0:3a5:50b2:f991 with SMTP id c20-20020a05600c0ad400b003a550b2f991mr414585wmr.146.1660089022762;
        Tue, 09 Aug 2022 16:50:22 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc::6? (2a01-036c-0116-43ce-0000-0000-0000-0006.pool6.digikabel.hu. [2a01:36c:116:43ce::6])
        by smtp.gmail.com with ESMTPSA id e39-20020a5d5967000000b002205cbc1c74sm14813676wri.101.2022.08.09.16.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 16:50:21 -0700 (PDT)
From:   "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <DirtY.iCE.hu@gmail.com>
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
Message-ID: <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
Date:   Wed, 10 Aug 2022 01:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:4.8) Goanna/20220224
 Interlink/52.9.8090a1
MIME-Version: 1.0
In-Reply-To: <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
Content-Type: multipart/mixed;
 boundary="------------8EDA4E4C6061DB4393C03B13"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is a multi-part message in MIME format.
--------------8EDA4E4C6061DB4393C03B13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022-08-10 00:34, Zev Weiss wrote:
> On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zoltán Kővágó wrote:
>> On 2022-08-09 22:56, Zev Weiss wrote:
>>> On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>>>> Hi,
>>>>
>>>> [1.] One line summary of the problem:
>>>> NCT6775: suspend doesn't work after updating to Linux 5.19
>>>>
>>>> [2.] Full description of the problem/report:
>>>> After updating my kernel from 5.18.11 to 5.19, I've noticed that 
>>>> resuming after suspend no longer works: fans start up, then about a 
>>>> second later, the computer just shuts down, leaving the USB ports 
>>>> powered up (normally it turns them off on shutdown). The screens 
>>>> don't turn on during this timeframe, so I can't see any useful log 
>>>> messages.
>>>>
>>>> Bisecting between 5.18 (where it still worked) and 5.19 lead me to 
>>>> commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon: (nct6775) 
>>>> Split core and platform driver" which looks like a refactor commit, 
>>>> but apparently it broke something.
>>>>
>>>
>>> Hi Zoltán,
>>>
>>> Thanks for the thorough bug report.  You're right that that commit 
>>> was essentially just a refactor, though there was one slight change 
>>> to the nct6775_suspend() function introduced during the review 
>>> process that may perhaps have had some subtle unintended side-effects.
>>>
>>> Can you test the following patch and report if it resolves the problem?
>>>
>>>
>>> Thanks,
>>> Zev
>>
>> Hi Zev,
>>
>> Thanks for the quick reply. Yes, it looks like your patch does solve 
>> the problem (I've applied it on top of 5.19 (after fighting with my 
>> mail client for a while) and suspended a few times, it's working so far).
>>
>> Regards,
>> Zoltan
> 
> Great, thanks.
> 
> Guenter, it looks like nct6775_suspend() really does in fact need to use 
> nct6775_update_device() instead of dev_get_drvdata(), though it's not 
> immediately obvious to me why.  Though given that the bulk of of the 
> body of nct6775_update_device() is inside an 'if' block that might not 
> necessarily execute every time, I also wonder if it might be vulnerable 
> to exhibiting the same problem depending on timing.
> 
> Zoltán, if you could try another experiment to try to gather some data 
> on that -- with the patch from my previous email still applied, could 
> you try suspending via:
> 
>      $ cat 
> /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input && echo 
> mem > /sys/power/state

Tried it, three times in fact, and it worked fine every time. Looking at 
the dmesg, though, it looks like it needs a bit more than 1.5 sec to 
suspend. Where's that 1.5 sec limit defined? I will try to increase it 
tomorrow.

Regards,
Zoltan

--------------8EDA4E4C6061DB4393C03B13
Content-Type: text/x-log; charset=UTF-8;
 name="dmesg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.log"

[ 4248.840743] PM: suspend entry (deep)
[ 4248.870251] Filesystems sync: 0.029 seconds
[ 4248.870305] Loading firmware: rtl_nic/rtl8125b-2.fw
[ 4248.870320] Loading firmware: amdgpu/polaris10_mc.bin
[ 4248.870324] Loading firmware: amdgpu/polaris10_pfp_2.bin
[ 4248.870324] Loading firmware: amdgpu/polaris10_me_2.bin
[ 4248.870332] Loading firmware: amdgpu/polaris10_rlc.bin
[ 4248.870331] Loading firmware: amdgpu/polaris10_ce_2.bin
[ 4248.870332] Loading firmware: amdgpu/polaris10_mec_2.bin
[ 4248.870334] Loading firmware: amdgpu/polaris10_mec2_2.bin
[ 4248.870337] Loading firmware: amdgpu/polaris10_sdma.bin
[ 4248.870338] Loading firmware: amdgpu/polaris10_sdma1.bin
[ 4248.870339] Loading firmware: amdgpu/polaris10_uvd.bin
[ 4248.870340] Loading firmware: amdgpu/polaris10_k_smc.bin
[ 4248.870341] Loading firmware: amdgpu/polaris10_vce.bin
[ 4248.870342] Loading firmware: amdgpu/navy_flounder_sos.bin
[ 4248.870343] Loading firmware: amdgpu/navy_flounder_ta.bin
[ 4248.870344] Loading firmware: amdgpu/navy_flounder_smc.bin
[ 4248.870346] Loading firmware: amdgpu/navy_flounder_dmcub.bin
[ 4248.870347] Loading firmware: amdgpu/navy_flounder_pfp.bin
[ 4248.870348] Loading firmware: amdgpu/navy_flounder_me.bin
[ 4248.870348] Loading firmware: amdgpu/navy_flounder_ce.bin
[ 4248.870349] Loading firmware: amdgpu/navy_flounder_rlc.bin
[ 4248.870350] Loading firmware: amdgpu/navy_flounder_mec.bin
[ 4248.870350] Loading firmware: amdgpu/navy_flounder_sdma.bin
[ 4248.870352] Loading firmware: amdgpu/navy_flounder_vcn.bin
[ 4248.870351] Loading firmware: amdgpu/navy_flounder_mec2.bin
[ 4248.977483] Freezing user space processes ... (elapsed 0.001 seconds) done.
[ 4248.978766] OOM killer disabled.
[ 4248.978768] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[ 4248.979919] printk: Suspending console(s) (use no_console_suspend to debug)
[ 4248.980771] r8169 0000:03:00.0 eth0: Link is Down
[ 4248.990975] sd 1:0:0:0: [sda] Synchronizing SCSI cache
[ 4248.991061] sd 1:0:0:0: [sda] Stopping disk
[ 4249.088481] [drm] free PSP TMR buffer
[ 4249.406971] amdgpu 0000:08:00.0: amdgpu: PCI CONFIG reset
[ 4249.408318] amdgpu 0000:0b:00.0: amdgpu: MODE1 reset
[ 4249.408322] amdgpu 0000:0b:00.0: amdgpu: GPU mode1 reset
[ 4249.408865] amdgpu 0000:0b:00.0: amdgpu: GPU smu mode1 reset
[ 4249.966981] ACPI: PM: Preparing to enter system sleep state S3
[ 4250.484183] ACPI: PM: Saving platform NVS memory
[ 4250.484251] Disabling non-boot CPUs ...
[ 4250.485740] smpboot: CPU 1 is now offline
[ 4250.488120] smpboot: CPU 2 is now offline
[ 4250.489771] smpboot: CPU 3 is now offline
[ 4250.491405] smpboot: CPU 4 is now offline
[ 4250.493129] smpboot: CPU 5 is now offline
[ 4250.494788] smpboot: CPU 6 is now offline
[ 4250.496353] smpboot: CPU 7 is now offline
[ 4250.497959] smpboot: CPU 8 is now offline
[ 4250.499704] smpboot: CPU 9 is now offline
[ 4250.501226] smpboot: CPU 10 is now offline
[ 4250.502751] smpboot: CPU 11 is now offline
[ 4250.504297] smpboot: CPU 12 is now offline
[ 4250.505822] smpboot: CPU 13 is now offline
[ 4250.507370] smpboot: CPU 14 is now offline
[ 4250.508832] smpboot: CPU 15 is now offline
[ 4250.510417] smpboot: CPU 16 is now offline
[ 4250.510511] Spectre V2 : Update user space SMT mitigation: STIBP off
[ 4250.511869] smpboot: CPU 17 is now offline
[ 4250.513373] smpboot: CPU 18 is now offline
[ 4250.514849] smpboot: CPU 19 is now offline
[ 4250.516272] smpboot: CPU 20 is now offline
[ 4250.517786] smpboot: CPU 21 is now offline
[ 4250.519228] smpboot: CPU 22 is now offline
[ 4250.520722] smpboot: CPU 23 is now offline
[ 4250.522197] smpboot: CPU 24 is now offline
[ 4250.523609] smpboot: CPU 25 is now offline
[ 4250.525114] smpboot: CPU 26 is now offline
[ 4250.526490] smpboot: CPU 27 is now offline
[ 4250.527915] smpboot: CPU 28 is now offline
[ 4250.529306] smpboot: CPU 29 is now offline
[ 4250.530724] smpboot: CPU 30 is now offline
[ 4250.532144] smpboot: CPU 31 is now offline
[ 4250.532524] ACPI: PM: Low-level resume complete
[ 4250.532546] ACPI: PM: Restoring platform NVS memory
[ 4250.532735] LVT offset 0 assigned for vector 0x400
[ 4250.533277] Enabling non-boot CPUs ...
[ 4250.533303] x86: Booting SMP configuration:
[ 4250.533304] smpboot: Booting Node 0 Processor 1 APIC 0x2
[ 4250.533430] microcode: CPU1: patch_level=0x0a201016
[ 4250.535718] ACPI: \_PR_.C002: Found 2 idle states
[ 4250.535840] CPU1 is up
[ 4250.535852] smpboot: Booting Node 0 Processor 2 APIC 0x4
[ 4250.535959] microcode: CPU2: patch_level=0x0a201016
[ 4250.538192] ACPI: \_PR_.C004: Found 2 idle states
[ 4250.538296] CPU2 is up
[ 4250.538306] smpboot: Booting Node 0 Processor 3 APIC 0x6
[ 4250.538414] microcode: CPU3: patch_level=0x0a201016
[ 4250.540636] ACPI: \_PR_.C006: Found 2 idle states
[ 4250.540756] CPU3 is up
[ 4250.540766] smpboot: Booting Node 0 Processor 4 APIC 0x8
[ 4250.540874] microcode: CPU4: patch_level=0x0a201016
[ 4250.543101] ACPI: \_PR_.C008: Found 2 idle states
[ 4250.543219] CPU4 is up
[ 4250.543228] smpboot: Booting Node 0 Processor 5 APIC 0xa
[ 4250.543336] microcode: CPU5: patch_level=0x0a201016
[ 4250.545561] ACPI: \_PR_.C00A: Found 2 idle states
[ 4250.545691] CPU5 is up
[ 4250.545700] smpboot: Booting Node 0 Processor 6 APIC 0xc
[ 4250.545811] microcode: CPU6: patch_level=0x0a201016
[ 4250.548033] ACPI: \_PR_.C00C: Found 2 idle states
[ 4250.548156] CPU6 is up
[ 4250.548165] smpboot: Booting Node 0 Processor 7 APIC 0xe
[ 4250.548274] microcode: CPU7: patch_level=0x0a201016
[ 4250.550497] ACPI: \_PR_.C00E: Found 2 idle states
[ 4250.550628] CPU7 is up
[ 4250.550639] smpboot: Booting Node 0 Processor 8 APIC 0x10
[ 4250.550788] microcode: CPU8: patch_level=0x0a201016
[ 4250.553040] ACPI: \_PR_.C010: Found 2 idle states
[ 4250.553194] CPU8 is up
[ 4250.553204] smpboot: Booting Node 0 Processor 9 APIC 0x12
[ 4250.553353] microcode: CPU9: patch_level=0x0a201016
[ 4250.555599] ACPI: \_PR_.C012: Found 2 idle states
[ 4250.555747] CPU9 is up
[ 4250.555757] smpboot: Booting Node 0 Processor 10 APIC 0x14
[ 4250.555905] microcode: CPU10: patch_level=0x0a201016
[ 4250.558152] ACPI: \_PR_.C014: Found 2 idle states
[ 4250.558298] CPU10 is up
[ 4250.558309] smpboot: Booting Node 0 Processor 11 APIC 0x16
[ 4250.558459] microcode: CPU11: patch_level=0x0a201016
[ 4250.560718] ACPI: \_PR_.C016: Found 2 idle states
[ 4250.560868] CPU11 is up
[ 4250.560879] smpboot: Booting Node 0 Processor 12 APIC 0x18
[ 4250.561028] microcode: CPU12: patch_level=0x0a201016
[ 4250.563272] ACPI: \_PR_.C018: Found 2 idle states
[ 4250.563427] CPU12 is up
[ 4250.563437] smpboot: Booting Node 0 Processor 13 APIC 0x1a
[ 4250.563586] microcode: CPU13: patch_level=0x0a201016
[ 4250.565841] ACPI: \_PR_.C01A: Found 2 idle states
[ 4250.566001] CPU13 is up
[ 4250.566011] smpboot: Booting Node 0 Processor 14 APIC 0x1c
[ 4250.566159] microcode: CPU14: patch_level=0x0a201016
[ 4250.568400] ACPI: \_PR_.C01C: Found 2 idle states
[ 4250.568565] CPU14 is up
[ 4250.568576] smpboot: Booting Node 0 Processor 15 APIC 0x1e
[ 4250.568725] microcode: CPU15: patch_level=0x0a201016
[ 4250.570981] ACPI: \_PR_.C01E: Found 2 idle states
[ 4250.571142] CPU15 is up
[ 4250.571152] smpboot: Booting Node 0 Processor 16 APIC 0x1
[ 4250.571291] microcode: CPU16: patch_level=0x0a201016
[ 4250.573530] ACPI: \_PR_.C001: Found 2 idle states
[ 4250.573759] Spectre V2 : Update user space SMT mitigation: STIBP always-on
[ 4250.573765] CPU16 is up
[ 4250.573779] smpboot: Booting Node 0 Processor 17 APIC 0x3
[ 4250.573887] microcode: CPU17: patch_level=0x0a201016
[ 4250.576138] ACPI: \_PR_.C003: Found 2 idle states
[ 4250.576330] CPU17 is up
[ 4250.576340] smpboot: Booting Node 0 Processor 18 APIC 0x5
[ 4250.576447] microcode: CPU18: patch_level=0x0a201016
[ 4250.578710] ACPI: \_PR_.C005: Found 2 idle states
[ 4250.578908] CPU18 is up
[ 4250.578918] smpboot: Booting Node 0 Processor 19 APIC 0x7
[ 4250.579025] microcode: CPU19: patch_level=0x0a201016
[ 4250.581268] ACPI: \_PR_.C007: Found 2 idle states
[ 4250.581473] CPU19 is up
[ 4250.581483] smpboot: Booting Node 0 Processor 20 APIC 0x9
[ 4250.581590] microcode: CPU20: patch_level=0x0a201016
[ 4250.583844] ACPI: \_PR_.C009: Found 2 idle states
[ 4250.584058] CPU20 is up
[ 4250.584067] smpboot: Booting Node 0 Processor 21 APIC 0xb
[ 4250.584175] microcode: CPU21: patch_level=0x0a201016
[ 4250.586418] ACPI: \_PR_.C00B: Found 2 idle states
[ 4250.586638] CPU21 is up
[ 4250.586648] smpboot: Booting Node 0 Processor 22 APIC 0xd
[ 4250.586754] microcode: CPU22: patch_level=0x0a201016
[ 4250.589013] ACPI: \_PR_.C00D: Found 2 idle states
[ 4250.589236] CPU22 is up
[ 4250.589245] smpboot: Booting Node 0 Processor 23 APIC 0xf
[ 4250.589353] microcode: CPU23: patch_level=0x0a201016
[ 4250.591596] ACPI: \_PR_.C00F: Found 2 idle states
[ 4250.591834] CPU23 is up
[ 4250.591843] smpboot: Booting Node 0 Processor 24 APIC 0x11
[ 4250.591986] microcode: CPU24: patch_level=0x0a201016
[ 4250.594245] ACPI: \_PR_.C011: Found 2 idle states
[ 4250.594493] CPU24 is up
[ 4250.594504] smpboot: Booting Node 0 Processor 25 APIC 0x13
[ 4250.594647] microcode: CPU25: patch_level=0x0a201016
[ 4250.596904] ACPI: \_PR_.C013: Found 2 idle states
[ 4250.597157] CPU25 is up
[ 4250.597167] smpboot: Booting Node 0 Processor 26 APIC 0x15
[ 4250.597310] microcode: CPU26: patch_level=0x0a201016
[ 4250.599596] ACPI: \_PR_.C015: Found 2 idle states
[ 4250.599858] CPU26 is up
[ 4250.599870] smpboot: Booting Node 0 Processor 27 APIC 0x17
[ 4250.600013] microcode: CPU27: patch_level=0x0a201016
[ 4250.602268] ACPI: \_PR_.C017: Found 2 idle states
[ 4250.602535] CPU27 is up
[ 4250.602546] smpboot: Booting Node 0 Processor 28 APIC 0x19
[ 4250.602692] microcode: CPU28: patch_level=0x0a201016
[ 4250.604970] ACPI: \_PR_.C019: Found 2 idle states
[ 4250.605242] CPU28 is up
[ 4250.605253] smpboot: Booting Node 0 Processor 29 APIC 0x1b
[ 4250.605396] microcode: CPU29: patch_level=0x0a201016
[ 4250.607663] ACPI: \_PR_.C01B: Found 2 idle states
[ 4250.607942] CPU29 is up
[ 4250.607952] smpboot: Booting Node 0 Processor 30 APIC 0x1d
[ 4250.608095] microcode: CPU30: patch_level=0x0a201016
[ 4250.610351] ACPI: \_PR_.C01D: Found 2 idle states
[ 4250.610643] CPU30 is up
[ 4250.610653] smpboot: Booting Node 0 Processor 31 APIC 0x1f
[ 4250.610800] microcode: CPU31: patch_level=0x0a201016
[ 4250.613089] ACPI: \_PR_.C01F: Found 2 idle states
[ 4250.613397] CPU31 is up
[ 4250.615024] ACPI: PM: Waking up from system sleep state S3
[ 4250.621087] sd 1:0:0:0: [sda] Starting disk
[ 4250.621211] [drm] PCIE GART of 512M enabled (table at 0x00000080008CA000).
[ 4250.621243] [drm] PSP is resuming...
[ 4250.622832] nvme nvme0: Shutdown timeout set to 10 seconds
[ 4250.628133] nvme nvme0: 32/0/0 default/read/poll queues
[ 4250.696827] [drm] reserve 0xa00000 from 0x82fe000000 for PSP TMR
[ 4250.742897] [drm] PCIE GART of 256M enabled (table at 0x000000F4008CA000).
[ 4250.784703] amdgpu 0000:0b:00.0: amdgpu: RAS: optional ras ta ucode is not available
[ 4250.786748] r8169 0000:03:00.0 eth0: Link is Down
[ 4250.797815] amdgpu 0000:0b:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
[ 4250.797816] amdgpu 0000:0b:00.0: amdgpu: SMU is resuming...
[ 4250.797820] amdgpu 0000:0b:00.0: amdgpu: smu driver if version = 0x0000000e, smu fw if version = 0x00000012, smu fw program = 0, version = 0x00413500 (65.53.0)
[ 4250.797822] amdgpu 0000:0b:00.0: amdgpu: SMU driver if version not matched
[ 4250.797869] amdgpu 0000:0b:00.0: amdgpu: use vbios provided pptable
[ 4250.845339] usb 5-4: reset high-speed USB device number 3 using xhci_hcd
[ 4250.858850] amdgpu 0000:0b:00.0: amdgpu: SMU is resumed successfully!
[ 4250.860030] [drm] DMUB hardware initialized: version=0x0202000F
[ 4250.909094] usb 3-4: reset full-speed USB device number 4 using xhci_hcd
[ 4250.929892] ata3: SATA link down (SStatus 0 SControl 300)
[ 4251.028762] br0: port 1(eth0) entered disabled state
[ 4251.155090] usb 3-5: reset full-speed USB device number 5 using xhci_hcd
[ 4251.193871] [drm] kiq ring mec 2 pipe 1 q 0
[ 4251.198962] [drm] VCN decode and encode initialized successfully(under DPG Mode).
[ 4251.199243] [drm] JPEG decode initialized successfully.
[ 4251.199262] amdgpu 0000:0b:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[ 4251.199263] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[ 4251.199264] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[ 4251.199264] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[ 4251.199265] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[ 4251.199265] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[ 4251.199266] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[ 4251.199266] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[ 4251.199267] amdgpu 0000:0b:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
[ 4251.199267] amdgpu 0000:0b:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
[ 4251.199268] amdgpu 0000:0b:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[ 4251.199268] amdgpu 0000:0b:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on hub 0
[ 4251.199269] amdgpu 0000:0b:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 1
[ 4251.199269] amdgpu 0000:0b:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on hub 1
[ 4251.199270] amdgpu 0000:0b:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on hub 1
[ 4251.199270] amdgpu 0000:0b:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 1
[ 4251.436704] [drm] Fence fallback timer expired on ring sdma0
[ 4251.940701] [drm] Fence fallback timer expired on ring sdma0
[ 4251.982227] [drm] UVD and UVD ENC initialized successfully.
[ 4252.083249] [drm] VCE initialized successfully.
[ 4253.361328] r8169 0000:03:00.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[ 4253.361334] br0: port 1(eth0) entered blocking state
[ 4253.361335] br0: port 1(eth0) entered forwarding state
[ 4255.961849] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[ 4256.025527] ata2.00: configured for UDMA/133
[ 4256.031075] OOM killer enabled.
[ 4256.031076] Restarting tasks ... done.
[ 4256.031357] random: crng reseeded on system resumption
[ 4256.035197] PM: suspend exit

--------------8EDA4E4C6061DB4393C03B13--
