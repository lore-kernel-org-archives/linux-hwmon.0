Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D01C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 15:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 914772084C
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 15:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbgE0PMV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 11:12:21 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:30073 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388922AbgE0PMU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 11:12:20 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id DC44E201D0;
        Wed, 27 May 2020 18:12:15 +0300 (MSK)
Date:   Wed, 27 May 2020 18:12:15 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <20200527144838.GA209591@roeck-us.net>
Message-ID: <alpine.LNX.2.20.13.2005271755070.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru> <20200527144838.GA209591@roeck-us.net>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Guenter Roeck wrote:

> > I'm not exactly complaining, I'm proposing a solution: at probe time, populate
> > prev_value members with MSR values instead of zeros. That way, the module will
> > correctly count energy over the time it's been loaded. It can be unloaded and
> > reloaded freely, and doing so would allow to easily measure energy across large
> > spans of time, which sounds like an improvement.
> > 
> That would ignore energy accumulated from before the driver was loaded, and
> would thus trigger another set of complaints.

That doesn't sound right. There's no way for the driver to be sure that the
counters did not wrap around before it was loaded. Here's a few scenarios
how such wraparound is possible:

- while the user was messing in the bootloader for a few minutes
- if the user kexec'd a new kernel
- if the counters were not reset during a warm reboot

Ignoring initial values of the counters is generally the right thing to do.
In the specific circumstances when the user wants to measure energy used
since machine power-up, and they know the boot happened so quick the counters
did not wrap around, they can easily script that with e.g. the rdmsr tool.
Or perhaps the driver could pr_info the initial values at probe time.

Have such complaints already appeared in practice?

Also note that documentation doesn't promise that counters start from zero
at power-up time, although that's of course a natural assumption.


> A slight improvement might be to add up core energy counters when loading
> the driver, compare it against the package counter, and pick the larger
> value for the initial package counter(s). This would at least ensure that
> the package counter is never less than the sum of the core counters.

No, fudging the initial reading like this wouldn't help, because I was
pointing out how core counters increment quicker than the package counter;
i.e. even if the kernel fudged the initial values, they would still grow
contradictory quick enough (on some workloads).

Alexander
