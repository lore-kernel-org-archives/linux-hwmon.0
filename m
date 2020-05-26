Return-Path: <SRS0=2tA6=7I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E9BC433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 May 2020 22:37:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 482B6208C3
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 May 2020 22:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404484AbgEZWhd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 May 2020 18:37:33 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:26459 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404483AbgEZWhc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 May 2020 18:37:32 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id 368F6201D0;
        Wed, 27 May 2020 01:37:30 +0300 (MSK)
Date:   Wed, 27 May 2020 01:37:30 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
cc:     Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
Message-ID: <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 22 May 2020, Naveen Krishna Ch wrote:

> > This version looks ok, and it looks like there are no more
> > unexpected counter wraps either. Series applied to hwmon-next.
> 
> Thank you for your guidance and support.

Thank you, looking forward to using this driver. Meanwhile, I have
a couple of questions about AMD RAPL counters.

The documentation says the PKG_ENERGY_STAT MSR is instantiated per CCD
and L3 complex, implying that energy is accumulated for 3 or 4 cores
in an L3 complex.

However your patch reads that MSR per socket, and from testing on my
Ryzen 4500U CPU I can confirm that the MSR gives the same value when
accessed from each core. Therefore I think your code is correct and
the documentation is wrong, can you confirm?

Next, I'm seeing paradoxical results when attempting to test accuracy
of the counters. When running an AVX workload on 6 cores, I see
CORE_ENERGY_STAT MSR reporting values just above 9 Watts per core, with
55 Watts in total, and yet PKG_ENERGY_STAT reporting only 30 Watts.
This is clearly a contradiction since package energy must be at least 
the sum of core energy readings. Furthermore, this is happening on a
18 W CPU in a laptop, which definitely cannot sustain 55 Watts, and
even 30 Watts seems too high.

Can you clarify how the counters work and under what conditions they
give accurate readings?

Thanks.
Alexander
