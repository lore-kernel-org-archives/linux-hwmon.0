Return-Path: <SRS0=PMJT=6U=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4787FC28CBC
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 May 2020 19:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1434420CC7
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 May 2020 19:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL6BJtMp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgEFT1Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 May 2020 15:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbgEFT1Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 May 2020 15:27:16 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DA2C061A0F
        for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2020 12:27:16 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x15so1541915pfa.1
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2020 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oyh2ivZYxh3iBBOEYorJcVLNULttrWaS+tzJWGoE9JA=;
        b=NL6BJtMp9ATv58IpsehSlXa2GvvDEsYjG6IeK5g2HhnTtDYFYjTgNbWsLzNvr6wHwG
         GYfNP1PfUOXxFPkzTemw9N71RWpr38ddJYMp9qrxGei3l10lrQ63pLiGRvX5sCWEN7wt
         CL986UT/58Ud3EPytRQybkN8Vawb2dHlAPreaERyUr8AQZJtD2No8XIk6lqhvLqBtN0K
         WwNAp6Kh7ozX5EBIcOfNnsjzAcmblaxw7rlCdll6SHYYGmzNQrbmmZ7I7FaZYeaoDLEa
         BNaoZHpcem65NmIvXChsuDIoTiL0ppRjIytcWcDkm9+h4jkQ4sSu6BnIuxyYQvVtXzOp
         OkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oyh2ivZYxh3iBBOEYorJcVLNULttrWaS+tzJWGoE9JA=;
        b=P16GR2yvSkWyuq8GHYnMoW52MedleDTEXT+GCciGkgTrBwCNAe/mSwAZf3H3eTcMmv
         QeTE4aSf5B6/D3EnSR0hvXhKKmEyTTkX1fXVOF2hV2ub84CRRT5mEsy9GtE/fsRVAoDU
         TTMMoM/Nz1A2ddj0jygaTFrPpuFabcmet+/M4T9QMPDiu0dHKAzvKTNpUjBhpXMvXr67
         KpK7/oUjLRyJXlHhwIlrndikiSuVrYQhH71EaA+ieSlgyijuGOBTY1UM8tQC3+foAUb5
         W/FPnBYf3E9eyKh/aE4R3Qw0veCB4GY8AtZTeuRsy24x4r7j5RJK+W/L18rhDvXoZEHg
         Q8Fw==
X-Gm-Message-State: AGi0PuZktD7pQKidjQdQJ0pZgHyjzRV0Xc61D00Pkv6GTbee1dhLGhhQ
        3x6aRjtCHvQuNkcb9qnNkAcnJyIp
X-Google-Smtp-Source: APiQypKksyp1lBupaZaZxfbWYaqNxQSyJ00A68SSrTjN47hbOPg1gPLGM4ViftjZ5x/savmhKjh5uA==
X-Received: by 2002:a62:1c97:: with SMTP id c145mr10414271pfc.68.1588793235402;
        Wed, 06 May 2020 12:27:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a12sm2497811pfr.28.2020.05.06.12.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 12:27:14 -0700 (PDT)
Subject: Re: [PATCH 2/3] hwmon: (amd_energy) Add documentation
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200501175003.28613-1-nchatrad@amd.com>
 <20200501175003.28613-2-nchatrad@amd.com>
 <20200506163324.GA89932@roeck-us.net>
 <CAHfPSqBJT1FYMxLMsF0GKFnQZfaKBKS6tydVX6tA5_eJutTd7w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <498b7568-3b59-35f7-79d4-a6e4a972aec0@roeck-us.net>
Date:   Wed, 6 May 2020 12:27:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHfPSqBJT1FYMxLMsF0GKFnQZfaKBKS6tydVX6tA5_eJutTd7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 5/6/20 10:11 AM, Naveen Krishna Ch wrote:
> Hi Guenter
> 
> On Wed, 6 May 2020 at 22:03, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, May 01, 2020 at 11:20:02PM +0530, Naveen Krishna Chatradhi wrote:
>>> Document amd_energy driver with all chips supported by it.
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>> ---
>>> Changes in v5: None
>>>
>>>  Documentation/hwmon/amd_energy.rst | 100 +++++++++++++++++++++++++++++
>>>  Documentation/hwmon/index.rst      |   1 +
>>>  2 files changed, 101 insertions(+)
>>>  create mode 100644 Documentation/hwmon/amd_energy.rst
>>>
>>> diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
>>> new file mode 100644
>>> index 000000000000..2216c8b13e58
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/amd_energy.rst
>>> @@ -0,0 +1,100 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +Kernel driver amd_energy
>>> +==========================
>>> +
>>> +Supported chips:
>>> +
>>> +* AMD Family 17h Processors
>>> +
>>> +  Prefix: 'amd_energy'
>>> +
>>> +  Addresses used:  RAPL MSRs
>>> +
>>> +  Datasheets:
>>> +
>>> +  - Processor Programming Reference (PPR) for AMD Family 17h Model 01h, Revision B1 Processors
>>> +
>>> +     https://developer.amd.com/wp-content/resources/55570-B1_PUB.zip
>>> +
>>> +  - Preliminary Processor Programming Reference (PPR) for AMD Family 17h Model 31h, Revision B0 Processors
>>> +
>>> +     https://developer.amd.com/wp-content/resources/56176_ppr_Family_17h_Model_71h_B0_pub_Rev_3.06.zip
>>> +
>>> +Author: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +The Energy driver exposes the energy counters that are
>>> +reported via the Running Average Power Limit (RAPL)
>>> +Model-specific Registers (MSRs) via the hardware monitor
>>> +(HWMON) sysfs interface.
>>> +
>>> +1. Power, Energy and Time Units
>>> +   MSR_RAPL_POWER_UNIT/ C001_0299:
>>> +   shared with all cores in the socket
>>> +
>>> +2. Energy consumed by each Core
>>> +   MSR_CORE_ENERGY_STATUS/ C001_029A:
>>> +   32-bitRO, Accumulator, core-level power reporting
>>> +
>>> +3. Energy consumed by Socket
>>> +   MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
>>> +   32-bitRO, Accumulator, socket-level power reporting,
>>> +   shared with all cores in socket
>>> +
>>> +These registers are updated every 1ms and cleared on
>>> +reset of the system.
>>> +
>>> +Energy Caluclation
>>> +------------------
>>> +
>>> +Energy information (in Joules) is based on the multiplier,
>>> +1/2^ESU; where ESU is an unsigned integer read from
>>> +MSR_RAPL_POWER_UNIT register. Default value is 10000b,
>>> +indicating energy status unit is 15.3 micro-Joules increment.
>>> +
>>> +Reported values are scaled as per the formula
>>> +
>>> +scaled value = ((1/2^ESU) * (Raw value) * 1000000UL) in Joules
>>> +
>>> +Users calculate power for a given domain by calculating
>>> +     dEnergy/dTime for that domain.
>>> +
>>> +Socket energy accumulation
>>> +--------------------------
>>> +
>>> +Current Socket energy status register is 32bit, assuming a 240W
>>> +system, the register would wrap around in
>>> +
>>> +     2^32*15.3 e-6/240 = 273.80416512 secs to wrap(~4.5 mins)
>>> +
>>> +To improve the wrap around time, a kernel thread is implemented
>>> +to accumulate the socket energy counter to a 64-bit counter. The
>>> +kernel thread starts running during probe, wakes up at 100secs
>>
>> wakes up every 100 seconds
>>
>>> +and stops running in remove.
>>
>> stops running when the driver is removed.
> Will correct them
>>
>> All counters need to be be updated by the kernel thread, not just the socket
>> counter. If the socket counter can wrap in 4.5 minutes, the matching per-core
>> counters on a 64-core system can wrap every 4.5 * 64 = 288 minutes, which
>> isn't much better. This might be even worse on a system with fewer cores and
>> higher per-core power.
> 
> Agreed, just need few clarifications though
> 1. Is it OK to implement another thread for cores alone, as it need not run as
> frequently as the socket thread.

Your call, but personally I think it is not worth the overhead; see below.

> 2. We have a scenario on servers, a thread accumulating energy for all 128 cores
> might compromise the compute. So, i would like to provide a configuration
> symbol or sysfs mechanism to enable/disable the core accumulation.
> 

Another option would be to use a single thread but only update a single core
per socket at a time. If the socket thread needs to run every N seconds,
one would assume that the core thread only needs to run every N * (number
of cores) seconds (assuming that it uses the same scale). If so, reading
the data for one core (or maybe a couple of cores if the scale is different)
plus the data for the socket should not be that expensive.

If that is not acceptable, it might make more sense to blacklist the driver
entirely in such situations; without accumulation the reported values are
pretty much worthless.

Thanks,
Guenter

>>
>>> +
>>> +A socket energy read would return the current register value
>>> +added to the respective energy accumulator.
>>> +
>>> +Sysfs attributes
>>> +----------------
>>> +
>>> +=============== ========  =====================================
>>> +Attribute    Label     Description
>>> +===============      ========  =====================================
>>> +
>>> +* For index N between [1] and [nr_cpus]
>>> +
>>> +===============      ========  ======================================
>>> +energy[N]_input EcoreX         Core Energy   X = [0] to [nr_cpus - 1]
>>> +                       Measured input core energy
>>> +===============      ========  ======================================
>>> +
>>> +* For N between [nr_cpus] and [nr_cpus + nr_socks]
>>> +
>>> +===============      ========  ======================================
>>> +energy[N]_input EsocketX  Socket Energy X = [0] to [nr_socks -1]
>>> +                       Measured input socket energy
>>> +=============== ========  ======================================
>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>>> index 8ef62fd39787..fc4b89810e67 100644
>>> --- a/Documentation/hwmon/index.rst
>>> +++ b/Documentation/hwmon/index.rst
>>> @@ -39,6 +39,7 @@ Hardware Monitoring Kernel Drivers
>>>     adt7470
>>>     adt7475
>>>     amc6821
>>> +   amd_energy
>>>     asb100
>>>     asc7621
>>>     aspeed-pwm-tacho
> 
> 
> 

