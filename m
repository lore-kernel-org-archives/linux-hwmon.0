Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F754C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 16:59:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AEEE20787
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 16:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbgE0Q7c (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 12:59:32 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:30475 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726978AbgE0Q7b (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 12:59:31 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id 163A4201D0;
        Wed, 27 May 2020 19:59:27 +0300 (MSK)
Date:   Wed, 27 May 2020 19:59:27 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
cc:     Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
Message-ID: <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Naveen Krishna Ch wrote:

> I tried on an octa core machine, must be Renoir
> vendor_id       : AuthenticAMD
> cpu family      : 23
> model           : 96

Yes, same here. The only difference I'm on a 6-core 4500U.
 
> On an idle system over a period of 500secs:
[snip]
> Power consumed by socket: 4.53539685 W
> Sum of power consumed by cores: 0.010953W

Yes, no problem for idle readings. I'm getting 2W/package on AC and
close to 0W on battery.


> On an system with AVX test running over a period of 500 secs:
> 
>                  At t=500sec    | At t= 0           | Diff of energy
>  | in Joules        | Power in Watts
> core 0     | 649348495     | 413687530    | 235660965       |
> 235.660965   | 0.47132193
> core 1     | 506880081     | 294882827    | 211997254       |
> 211.997254    | 0.423994508
> core 2     | 454804046     | 271046127    | 183757919       |
> 183.757919    | 0.367515838
> core 3     | 391508712     | 237531021    | 153977691       |
> 153.977691    | 0.307955382
> core 4     | 410336868     | 284410079    | 125926789       |
> 125.926789    | 0.251853578
> core 5     | 287569732     | 192306015    | 95263717         |
> 95.263717      | 0.190527434
> core 6     | 185909622     | 120556152    | 65353470         |
> 65.35347        | 0.13070694
> core 7     | 129932006     | 95385940      | 34546066         |
> 34.546066      | 0.069092132
> Socket 0 | 28399099655 |  24799819931 3599279724     | 3599.27972    |
> 7.198559448
> Power consumed by socket: 7.198559448 W
> Sum of power consumed by cores:  2.212968 W
> 
> Can you confirm this.

No, this isn't right. The workload is not stressing all cores, you're
reporting 235 J for core 0 and only 35 J for core 7.

If you are running the avx-turbo test, please run it like this:

  ./avx-turbo --iters 10000000 --spec avx256_fma_t/8

This will run AVX code on all 8 cores for about 1 second. To run it for longer,
increase the --iters argument.

Thanks.
Alexander
