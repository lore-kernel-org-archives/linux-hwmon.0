Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A27C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 14:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EC5D207D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 14:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgE0OI6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 10:08:58 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:26940 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726938AbgE0OI6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 10:08:58 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id B0FBB201D0;
        Wed, 27 May 2020 17:08:55 +0300 (MSK)
Date:   Wed, 27 May 2020 17:08:55 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
Message-ID: <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Guenter Roeck wrote:

> >> I understand that. If you anticipate that the module may be inserted after a
> >> wraparound, the driver should populate 'prev_value' with actual counter
> >> values instead of zeros. That way the driver will properly accumulate
> >> energy over time it's been inserted. As implemented, the driver counts
> >> energy since boot time, minus unknown amount lost to wraparounds if the
> >> driver was loaded too late.
> > No problem if this module is built into the kernel.
> > If this module is inserted at later point, unless the user keeps the
> > counters since
> > the boot and provide it as an input during the module insert (we can
> > implement this).
> 
> I won't accept such a parameter. If you may recall, I did bring this up as
> reason why I abandoned the matching change for the coretemp driver, predicting
> that people would complain about it. Now they do. Not surprising. We (and you)
> will have to live with it.

I'm not exactly complaining, I'm proposing a solution: at probe time, populate
prev_value members with MSR values instead of zeros. That way, the module will
correctly count energy over the time it's been loaded. It can be unloaded and
reloaded freely, and doing so would allow to easily measure energy across large
spans of time, which sounds like an improvement.

I can try to cook a corresponding patch if that sounds alright.

Cheers.
Alexander
