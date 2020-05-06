Return-Path: <SRS0=PMJT=6U=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE16C28CBC
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 May 2020 17:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5914D2080D
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 May 2020 17:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZP2JOAb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbgEFRMA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 May 2020 13:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgEFRL7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 May 2020 13:11:59 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F0FC061A0F
        for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2020 10:11:59 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t2so2005410lfc.3
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2020 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gnvuFF9fqpl/RjlykBcWuB9H7mz8GxmzVBsLYPszKoE=;
        b=TZP2JOAbmrYeFaFOuXTmNaoXZuzlIKKEb01uclQ1QGDByZekyfaE9JvxWKahEooFjQ
         FvNalUe2hCGV4K65dHnIgUI8dI56yCni2EpFzX/8kSyGLepHoo57AGKs6Ks4cI3YB4Pv
         ir/iKVb3k01obE5Qo3PPNvtMwmj3B1wrKIMJflVXnO5vSjG5vwkSWx20eXtPakqrPj5W
         UucMOXLkyH91fPaJzG0tVQ2v6mUf+WxT8a+VNFMyRhWKgEOBh4RL+ZwrBEqniXPBejwA
         b/aSMAcG1WNwylnL6v50aNpP/t8cZ0qvi92Pz0h3uZNIXcWdrbr925tyn74YYBccEa06
         jtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gnvuFF9fqpl/RjlykBcWuB9H7mz8GxmzVBsLYPszKoE=;
        b=LwkZZTIgyMpGwhfHXHdCdF0sojeieIlmmHM8UaW/sD79bsGvz73FdQ8fkdcRHrAtgg
         4e7OVfp6eT/WHv+1AeltBpHjGx9P+5LoDrYDG/tFI06C1pQgjk1aWg/UofZ5ubsTLTK8
         gYPIyi0lUNnkl/s1TASKo1lb6Snh+YbeeOLN3K5bIq/43JjVxmgrDxRYQgafex9FHcbY
         fX0eB7GJmSFb3m9XO7kC8fjN57+6w0i5LSPxq29wSipHus21VzStCaZ6AwQp011uv28L
         TZXxmOePhL1BJ5FBSk8j10BQE3yu9uREJHkK1PXW+qAkr/lwty2kg48EqUkpwCdGkxD2
         PzVQ==
X-Gm-Message-State: AGi0PuYX/M5BJXOuVh67/mZL5pxyBtDCA5r3jGW44Gw8wUq8KzUYCNkk
        c2j6P+V3i0HL0nyvw+LehooNFMitvlyU3RgL4RhXcA==
X-Google-Smtp-Source: APiQypJDqRJIF8hxikY9rhigc3ux/+xzYK7+srdvlNuTsB/HmiilKqZKwy2kYuBzrnRIXpgl2gqafhQuFUnnCVaIFAo=
X-Received: by 2002:ac2:5b5e:: with SMTP id i30mr602575lfp.161.1588785117873;
 Wed, 06 May 2020 10:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200501175003.28613-1-nchatrad@amd.com> <20200501175003.28613-2-nchatrad@amd.com>
 <20200506163324.GA89932@roeck-us.net>
In-Reply-To: <20200506163324.GA89932@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Wed, 6 May 2020 22:41:46 +0530
Message-ID: <CAHfPSqBJT1FYMxLMsF0GKFnQZfaKBKS6tydVX6tA5_eJutTd7w@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: (amd_energy) Add documentation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Wed, 6 May 2020 at 22:03, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, May 01, 2020 at 11:20:02PM +0530, Naveen Krishna Chatradhi wrote:
> > Document amd_energy driver with all chips supported by it.
> >
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > ---
> > Changes in v5: None
> >
> >  Documentation/hwmon/amd_energy.rst | 100 +++++++++++++++++++++++++++++
> >  Documentation/hwmon/index.rst      |   1 +
> >  2 files changed, 101 insertions(+)
> >  create mode 100644 Documentation/hwmon/amd_energy.rst
> >
> > diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
> > new file mode 100644
> > index 000000000000..2216c8b13e58
> > --- /dev/null
> > +++ b/Documentation/hwmon/amd_energy.rst
> > @@ -0,0 +1,100 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Kernel driver amd_energy
> > +==========================
> > +
> > +Supported chips:
> > +
> > +* AMD Family 17h Processors
> > +
> > +  Prefix: 'amd_energy'
> > +
> > +  Addresses used:  RAPL MSRs
> > +
> > +  Datasheets:
> > +
> > +  - Processor Programming Reference (PPR) for AMD Family 17h Model 01h, Revision B1 Processors
> > +
> > +     https://developer.amd.com/wp-content/resources/55570-B1_PUB.zip
> > +
> > +  - Preliminary Processor Programming Reference (PPR) for AMD Family 17h Model 31h, Revision B0 Processors
> > +
> > +     https://developer.amd.com/wp-content/resources/56176_ppr_Family_17h_Model_71h_B0_pub_Rev_3.06.zip
> > +
> > +Author: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > +
> > +Description
> > +-----------
> > +
> > +The Energy driver exposes the energy counters that are
> > +reported via the Running Average Power Limit (RAPL)
> > +Model-specific Registers (MSRs) via the hardware monitor
> > +(HWMON) sysfs interface.
> > +
> > +1. Power, Energy and Time Units
> > +   MSR_RAPL_POWER_UNIT/ C001_0299:
> > +   shared with all cores in the socket
> > +
> > +2. Energy consumed by each Core
> > +   MSR_CORE_ENERGY_STATUS/ C001_029A:
> > +   32-bitRO, Accumulator, core-level power reporting
> > +
> > +3. Energy consumed by Socket
> > +   MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
> > +   32-bitRO, Accumulator, socket-level power reporting,
> > +   shared with all cores in socket
> > +
> > +These registers are updated every 1ms and cleared on
> > +reset of the system.
> > +
> > +Energy Caluclation
> > +------------------
> > +
> > +Energy information (in Joules) is based on the multiplier,
> > +1/2^ESU; where ESU is an unsigned integer read from
> > +MSR_RAPL_POWER_UNIT register. Default value is 10000b,
> > +indicating energy status unit is 15.3 micro-Joules increment.
> > +
> > +Reported values are scaled as per the formula
> > +
> > +scaled value = ((1/2^ESU) * (Raw value) * 1000000UL) in Joules
> > +
> > +Users calculate power for a given domain by calculating
> > +     dEnergy/dTime for that domain.
> > +
> > +Socket energy accumulation
> > +--------------------------
> > +
> > +Current Socket energy status register is 32bit, assuming a 240W
> > +system, the register would wrap around in
> > +
> > +     2^32*15.3 e-6/240 = 273.80416512 secs to wrap(~4.5 mins)
> > +
> > +To improve the wrap around time, a kernel thread is implemented
> > +to accumulate the socket energy counter to a 64-bit counter. The
> > +kernel thread starts running during probe, wakes up at 100secs
>
> wakes up every 100 seconds
>
> > +and stops running in remove.
>
> stops running when the driver is removed.
Will correct them
>
> All counters need to be be updated by the kernel thread, not just the socket
> counter. If the socket counter can wrap in 4.5 minutes, the matching per-core
> counters on a 64-core system can wrap every 4.5 * 64 = 288 minutes, which
> isn't much better. This might be even worse on a system with fewer cores and
> higher per-core power.

Agreed, just need few clarifications though
1. Is it OK to implement another thread for cores alone, as it need not run as
frequently as the socket thread.
2. We have a scenario on servers, a thread accumulating energy for all 128 cores
might compromise the compute. So, i would like to provide a configuration
symbol or sysfs mechanism to enable/disable the core accumulation.

>
> > +
> > +A socket energy read would return the current register value
> > +added to the respective energy accumulator.
> > +
> > +Sysfs attributes
> > +----------------
> > +
> > +=============== ========  =====================================
> > +Attribute    Label     Description
> > +===============      ========  =====================================
> > +
> > +* For index N between [1] and [nr_cpus]
> > +
> > +===============      ========  ======================================
> > +energy[N]_input EcoreX         Core Energy   X = [0] to [nr_cpus - 1]
> > +                       Measured input core energy
> > +===============      ========  ======================================
> > +
> > +* For N between [nr_cpus] and [nr_cpus + nr_socks]
> > +
> > +===============      ========  ======================================
> > +energy[N]_input EsocketX  Socket Energy X = [0] to [nr_socks -1]
> > +                       Measured input socket energy
> > +=============== ========  ======================================
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> > index 8ef62fd39787..fc4b89810e67 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -39,6 +39,7 @@ Hardware Monitoring Kernel Drivers
> >     adt7470
> >     adt7475
> >     amc6821
> > +   amd_energy
> >     asb100
> >     asc7621
> >     aspeed-pwm-tacho



-- 
Shine bright,
(: Nav :)
