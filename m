Return-Path: <SRS0=PMJT=6U=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3ADC28CBC
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 May 2020 16:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7273208E4
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 May 2020 16:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1o8ZZj7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbgEFQd1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 May 2020 12:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729443AbgEFQd0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 6 May 2020 12:33:26 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B990AC061A0F
        for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2020 09:33:26 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id a4so1346889pgc.0
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2020 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZbHmTmMJs93+n317sqqkODIESCS08taR0ZzyXx/RKWs=;
        b=K1o8ZZj7mjO8gHFJSs1ssNvNBigRuMnjUmkpNuXh2IR6Ji8Y6aSvdCAu1/PLLX42/x
         IXcgeaHELjv98aFwiM0CHggzZg2G1iY40r0fjaaBhQ+YCr2uSTpyM5N2X7gEyCAgMkgS
         MWT8Bqoe6Xg6WhILuP24akbPjHDczcC75ddJIf/oVJSBqklU9pYXuAJhB9VJ3xEv3AsH
         AN4amtCNA42exX1JXC7Ou0adMKhBJeJw15OyFvBX502oPkoHzKiZyYfYOzURZTKOHTsN
         E0vYG8Rokfr+P5jGEBhQzw26QUuuQa0Ft5y0mg9a50SvVfuhF9dspWVwM0OZYrmGoqQt
         2jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZbHmTmMJs93+n317sqqkODIESCS08taR0ZzyXx/RKWs=;
        b=NVk6zmRfsL1CE5rMXAgag2MnXFYZZwg+cORjIn51sLhV7xRm/Sl0uhN8fLX+fvr0KT
         S9D4AzBt1KMAAKJGv5luwASqn7Uw01EmVemvVcwgb6Hp9XhM2zIhx+4WI7UlGdZ7KQ8y
         FdTmFnovD9z/8+Yk8Gsgd67NqKP0SKpE176i20LCZo2T7lp0nOt42H2P/cqMgUCN1PuE
         l39HzzrH6M4Yonw7LfvLBqqXXywifCNv8Frdaq2N9vuiOCWAKkB3Yz+zhwVekKUUuP9O
         R1X/JE6K0aSCL9KmeRSCkZGMba2wWd+hJZ2+NF9WwZAsxTcjq8tYgIJ2LHKROx3qRbjO
         5qkg==
X-Gm-Message-State: AGi0PuaxQdZBoz69TjkGZ74jZdTvBhzda3NxtxDC3me1Ppm4SMaaXANG
        LHyacgRzi8QNYRIaspzGVR8=
X-Google-Smtp-Source: APiQypJKQfy/pxw2Py2MgwsNzYu0tQ0niD6YzSQn1nqVvgGbQyF6GjjzOq9v3JVE74lS9/g7TFRI8Q==
X-Received: by 2002:a63:4383:: with SMTP id q125mr7295235pga.27.1588782806105;
        Wed, 06 May 2020 09:33:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7sm1963890pgs.13.2020.05.06.09.33.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 09:33:25 -0700 (PDT)
Date:   Wed, 6 May 2020 09:33:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH 2/3] hwmon: (amd_energy) Add documentation
Message-ID: <20200506163324.GA89932@roeck-us.net>
References: <20200501175003.28613-1-nchatrad@amd.com>
 <20200501175003.28613-2-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501175003.28613-2-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 01, 2020 at 11:20:02PM +0530, Naveen Krishna Chatradhi wrote:
> Document amd_energy driver with all chips supported by it.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes in v5: None
> 
>  Documentation/hwmon/amd_energy.rst | 100 +++++++++++++++++++++++++++++
>  Documentation/hwmon/index.rst      |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/hwmon/amd_energy.rst
> 
> diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
> new file mode 100644
> index 000000000000..2216c8b13e58
> --- /dev/null
> +++ b/Documentation/hwmon/amd_energy.rst
> @@ -0,0 +1,100 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver amd_energy
> +==========================
> +
> +Supported chips:
> +
> +* AMD Family 17h Processors
> +
> +  Prefix: 'amd_energy'
> +
> +  Addresses used:  RAPL MSRs
> +
> +  Datasheets:
> +
> +  - Processor Programming Reference (PPR) for AMD Family 17h Model 01h, Revision B1 Processors
> +
> +	https://developer.amd.com/wp-content/resources/55570-B1_PUB.zip
> +
> +  - Preliminary Processor Programming Reference (PPR) for AMD Family 17h Model 31h, Revision B0 Processors
> +
> +	https://developer.amd.com/wp-content/resources/56176_ppr_Family_17h_Model_71h_B0_pub_Rev_3.06.zip
> +
> +Author: Naveen Krishna Chatradhi <nchatrad@amd.com>
> +
> +Description
> +-----------
> +
> +The Energy driver exposes the energy counters that are
> +reported via the Running Average Power Limit (RAPL)
> +Model-specific Registers (MSRs) via the hardware monitor
> +(HWMON) sysfs interface.
> +
> +1. Power, Energy and Time Units
> +   MSR_RAPL_POWER_UNIT/ C001_0299:
> +   shared with all cores in the socket
> +
> +2. Energy consumed by each Core
> +   MSR_CORE_ENERGY_STATUS/ C001_029A:
> +   32-bitRO, Accumulator, core-level power reporting
> +
> +3. Energy consumed by Socket
> +   MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
> +   32-bitRO, Accumulator, socket-level power reporting,
> +   shared with all cores in socket
> +
> +These registers are updated every 1ms and cleared on
> +reset of the system.
> +
> +Energy Caluclation
> +------------------
> +
> +Energy information (in Joules) is based on the multiplier,
> +1/2^ESU; where ESU is an unsigned integer read from
> +MSR_RAPL_POWER_UNIT register. Default value is 10000b,
> +indicating energy status unit is 15.3 micro-Joules increment.
> +
> +Reported values are scaled as per the formula
> +
> +scaled value = ((1/2^ESU) * (Raw value) * 1000000UL) in Joules
> +
> +Users calculate power for a given domain by calculating
> +	dEnergy/dTime for that domain.
> +
> +Socket energy accumulation
> +--------------------------
> +
> +Current Socket energy status register is 32bit, assuming a 240W
> +system, the register would wrap around in
> +
> +	2^32*15.3 e-6/240 = 273.80416512 secs to wrap(~4.5 mins)
> +
> +To improve the wrap around time, a kernel thread is implemented
> +to accumulate the socket energy counter to a 64-bit counter. The
> +kernel thread starts running during probe, wakes up at 100secs

wakes up every 100 seconds

> +and stops running in remove.

stops running when the driver is removed.

All counters need to be be updated by the kernel thread, not just the socket
counter. If the socket counter can wrap in 4.5 minutes, the matching per-core
counters on a 64-core system can wrap every 4.5 * 64 = 288 minutes, which
isn't much better. This might be even worse on a system with fewer cores and
higher per-core power.

> +
> +A socket energy read would return the current register value
> +added to the respective energy accumulator.
> +
> +Sysfs attributes
> +----------------
> +
> +=============== ========  =====================================
> +Attribute	Label	  Description
> +===============	========  =====================================
> +
> +* For index N between [1] and [nr_cpus]
> +
> +===============	========  ======================================
> +energy[N]_input EcoreX	  Core Energy   X = [0] to [nr_cpus - 1]
> +			  Measured input core energy
> +===============	========  ======================================
> +
> +* For N between [nr_cpus] and [nr_cpus + nr_socks]
> +
> +===============	========  ======================================
> +energy[N]_input EsocketX  Socket Energy X = [0] to [nr_socks -1]
> +			  Measured input socket energy
> +=============== ========  ======================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8ef62fd39787..fc4b89810e67 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -39,6 +39,7 @@ Hardware Monitoring Kernel Drivers
>     adt7470
>     adt7475
>     amc6821
> +   amd_energy
>     asb100
>     asc7621
>     aspeed-pwm-tacho
