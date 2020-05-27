Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D46DC433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 17:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13AEF20890
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 17:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731225AbgE0RMc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 13:12:32 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:25882 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731223AbgE0RMc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 13:12:32 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id 07261201D0;
        Wed, 27 May 2020 20:12:30 +0300 (MSK)
Date:   Wed, 27 May 2020 20:12:30 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <d7c06251-05ff-9355-23f3-99adc4e85e85@roeck-us.net>
Message-ID: <alpine.LNX.2.20.13.2005272008210.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru> <20200527144838.GA209591@roeck-us.net> <alpine.LNX.2.20.13.2005271755070.18802@monopod.intra.ispras.ru> <01990ace-a66a-2ada-5c97-a47a57bc90de@roeck-us.net> <alpine.LNX.2.20.13.2005271905490.18802@monopod.intra.ispras.ru>
 <d7c06251-05ff-9355-23f3-99adc4e85e85@roeck-us.net>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Guenter Roeck wrote:

> My prediction was that we would see endless arguments about this,
> with one set of people arguing one way, another set of people
> arguing the other way, and both being extremely passionate
> about it. You have already proven my point.

Sorry :/  Personally I'd be okay with either approach. I even think
it's possible to find a middle ground by mentioning boot-time energy
use with pr_info or such at probe time, and then counting from zero.

My main goal here is to get answers about contradictory counters.

Cheers.
Alexander
