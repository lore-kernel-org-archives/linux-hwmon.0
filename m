Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8F0C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 10:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19B602073B
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 10:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5wsusbB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgE0Kf0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 06:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729354AbgE0Kf0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 06:35:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B7DC061A0F
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 03:35:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k5so28236177lji.11
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmQDIHvHWpwLJLRYU68r/svefXsubj0Qewn79WLhi7U=;
        b=m5wsusbBI4skRZcR1jlcWozi4Qt8mywU831Lr8ZqP3thoW5pzVBaTghJCaUW5cnzNT
         CWsMKtWJuBvEoUdgaU88S1q/haaD0jA1RvWZKWsxraxMGmqE17OyOhDvFQmakLMKoGtl
         8G/++84rzRKxYpqyeRqT75e2hEx9KF05Fp052fze039zWjIzz7g34C7V+t4uW/IJHdqm
         D1jUIPTEp6VbX/iWdi19NoiRw/ocp4NAAKE56+uRG224TMulTkmM85GvdvpJjaDFkO8D
         r4+k0W2TzcVSz/qyIyQhHN/xpINFN0FXoKQYRCWAwCiJ9VVP9rElN4YnPmXEqjuLFsV0
         8nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmQDIHvHWpwLJLRYU68r/svefXsubj0Qewn79WLhi7U=;
        b=NfLVP6BlUZ0GKoAcxC+v3cOfuVVSshQAi82lPrUN+zXFxpd07cRrBnOh21/wLOXJ/e
         iYBgi7M2FfBrG/nTzDMNT2nazPUAar1OXVpvokS9Ogc1jWkkL57Oc4vXDcA5uHj9cSpQ
         1b3iz2yDZRhbkm1ywQdl8TJDIbrHfFGqX2NDKyy/09QKbD+YErDQccM/T2Fz3lt+2Mtx
         N0oZp0HQf6aPTNdVtgeNQqwFa97FMjN9qaWJjJ05Ipz0y4ytaWjjXzfas8PtSe1EosvV
         0k4SSjJp9/5NZtEVpphFL3hYDALVa6ONYf8rk8woCZTv7zWuB7e0OyDCCJqLhRELbK4+
         SfcQ==
X-Gm-Message-State: AOAM532/T5U5lr3ZwwOTqQH4wURqGF2se8jTg/JWd8KdLIHb7WJz1z/y
        JgCZvLLeNkSTjUdw58S9t6Zkcvlg9TlwWC8Eyj4=
X-Google-Smtp-Source: ABdhPJwosbiyS1a63tYhImPTKt+vTsIXl2ta6t2LV6FoKdLoUCUR0X11gLwJgyaXD+XTTm+pqzdRZRI9C7h1qCzNo3U=
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr2624787ljg.203.1590575720476;
 Wed, 27 May 2020 03:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
In-Reply-To: <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Wed, 27 May 2020 16:05:08 +0530
Message-ID: <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy counters
To:     Alexander Monakov <amonakov@ispras.ru>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Alexander

On Wed, 27 May 2020 at 12:29, Alexander Monakov <amonakov@ispras.ru> wrote:
>
> On Wed, 27 May 2020, Naveen Krishna Ch wrote:
>
> > These registers are 32bit counters, they might wrap-around quite faster at
> > high work loads. So, we used a kernel thread to accumulate the values of
> > each core and socket to 64bit values.
> >
> > Depending on when the module is inserted in the system, the initial values
> > of the counters could be different and we do not have a way to know, how
> > many time the registers are wrapped around in the past.
>
> I understand that. If you anticipate that the module may be inserted after a
> wraparound, the driver should populate 'prev_value' with actual counter
> values instead of zeros. That way the driver will properly accumulate
> energy over time it's been inserted. As implemented, the driver counts
> energy since boot time, minus unknown amount lost to wraparounds if the
> driver was loaded too late.
No problem if this module is built into the kernel.
If this module is inserted at later point, unless the user keeps the
counters since
the boot and provide it as an input during the module insert (we can
implement this).
There is no other way to provide the lost count.

> In my case I observed the contradictory readings over a period of several
> seconds where no wraparound was possible.
>
> > In our evaluation, the sum of the energy consumption of cores of a socket was
> > always less (actually far lesser) than the socket energy consumption.
>
> Did you try on laptop CPUs (Renoir SoC, Ryzen 4x00U marketing name)? You also
> might need specific workloads to observe the issue, I first found it with a
> small hand-written test, and then found a bigger discrepancy with AVX test
> from https://github.com/travisdowns/avx-turbo

I tried on an octa core machine, must be Renoir
vendor_id       : AuthenticAMD
cpu family      : 23
model           : 96

On an idle system over a period of 500secs:

                   At t=500sec   | At t= 0             | Diff of
energy |  in Joules   | Power in Watts
core 0      | 650186538     | 649712585      | 473953          |
0.473953 J  | 0.000947906 W
core 1      | 507792434     | 507131301      | 661133          |
0.661133 J  | 0.001322266 W
core 2      | 455706497     | 455163970      | 542527          |
0.542527 J  | 0.001085054 W
core 3      | 392240356     | 391740417      | 499939          |
0.499939 J  | 0.000999878 W
core 4      | 411461654      | 410687881      | 773773         |
0.773773 J  | 0.001547546 W
core 5      | 288821884      | 288071395      | 750489         |
0.750489 J  | 0.001500978 W
core 6      | 186975219      | 186250793      | 724426         |
0.724426 J  | 0.001448852 W
core 7      | 131509216      | 130458816      | 1050400       | 1.0504
J      | 0.0021008 W
Socket 0  | 31638431930  |  29370733505 | 2267698425 |  2267.698 J |
4.53539685 W
Power consumed by socket: 4.53539685 W
Sum of power consumed by cores: 0.010953W

On an system with AVX test running over a period of 500 secs:

                 At t=500sec    | At t= 0           | Diff of energy
 | in Joules        | Power in Watts
core 0     | 649348495     | 413687530    | 235660965       |
235.660965   | 0.47132193
core 1     | 506880081     | 294882827    | 211997254       |
211.997254    | 0.423994508
core 2     | 454804046     | 271046127    | 183757919       |
183.757919    | 0.367515838
core 3     | 391508712     | 237531021    | 153977691       |
153.977691    | 0.307955382
core 4     | 410336868     | 284410079    | 125926789       |
125.926789    | 0.251853578
core 5     | 287569732     | 192306015    | 95263717         |
95.263717      | 0.190527434
core 6     | 185909622     | 120556152    | 65353470         |
65.35347        | 0.13070694
core 7     | 129932006     | 95385940      | 34546066         |
34.546066      | 0.069092132
Socket 0 | 28399099655 |  24799819931 3599279724     | 3599.27972    |
7.198559448
Power consumed by socket: 7.198559448 W
Sum of power consumed by cores:  2.212968 W

Can you confirm this.
>
> Alexander



-- 
Shine bright,
(: Nav :)
