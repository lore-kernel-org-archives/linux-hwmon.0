Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3004C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 16:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFBB720899
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 16:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgE0QlN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 12:41:13 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:26319 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729189AbgE0QlN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 12:41:13 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id 49F50201D0;
        Wed, 27 May 2020 19:41:09 +0300 (MSK)
Date:   Wed, 27 May 2020 19:41:09 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <01990ace-a66a-2ada-5c97-a47a57bc90de@roeck-us.net>
Message-ID: <alpine.LNX.2.20.13.2005271905490.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru> <20200527144838.GA209591@roeck-us.net> <alpine.LNX.2.20.13.2005271755070.18802@monopod.intra.ispras.ru> <01990ace-a66a-2ada-5c97-a47a57bc90de@roeck-us.net>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Guenter Roeck wrote:

> This exchange is exactly what I was concerned about when this driver
> was first submitted. I should have known better, and I should not
> have accepted it. Right now I seriously wonder if I should revert/drop
> it. Any arguments/thoughts why I _shouldn't_ do that ?

Let me apologize and explain my perspective.

These AMD MSRs have been previously wired up in the turbostat tool, and
very recently another developer submitted a patch to wire up the package
energy counter MSR for use with perf.

Unlike the above, this driver is submitted by AMD. As I have noticed a
substantial issue (sum of core counters contradicting the package counter),
I have attempted to report it in this thread. Since AMD is submitting the
code, I was hoping to get their attention to the issue, and ideally get
some explanations about how the counters work and to what extent we can
expect them to be accurate.

I think most of the discussion about (not) ignoring initial counter
values was in part caused by misunderstanding exactly what issue I was
reporting. After all, it's not so important if the driver accurately
captures boot-time energy use, if the counters are not trustworthy.

I don't have an answer to your question (whether you should keep the
driver). I hope you see where I'm coming from. I'm not quite aware of
the history with coretemp driver, so if all this caused you extra
headaches, I apologize for my part in the mess.

Alexander
