Return-Path: <SRS0=qJgv=7K=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C70FC433DF
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 May 2020 04:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 056B42078B
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 May 2020 04:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbT/dpfC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgE1EMC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 May 2020 00:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgE1EMC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 May 2020 00:12:02 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291F3C05BD1E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 21:12:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 202so15755782lfe.5
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 21:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5CAlTgwBVvI1wBI5cKEmYCi0twI2vkrHSRXRgSY2ang=;
        b=KbT/dpfCDFX77P2CKJ0MlBUPPVk1GsVobHSn0pncSTQ/VC46krxggmolpfGzIPqfK0
         FXi7lc5t3s7RWVloomrlmG4PryEoQHsl9uLYfJPVaUh48fx5y6LmgpMR2ESfyl8NrRSM
         dQXV9xQlJBBVcl+L7rgkOBAAtqpCWDDBE7Vn0jAIQcm6u/ncUso5zTGCKGgixHMGlNRK
         iTFIj7dzxNIwe84X1iXZC41BfQYLxVPn9dhE20G122C58RGuZyjJS5C4eh+2afHU4dtG
         l4aMd9rMmNFrWTiQH1FxFrCFejf0E60Bk8mrVJasp6GjVwSyroel0BBnLaAEdp2pcDYc
         MeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CAlTgwBVvI1wBI5cKEmYCi0twI2vkrHSRXRgSY2ang=;
        b=had5+6YHPG55eTyxOnvSM3Xm4vjgsZqS+EI3xZFj8QBFJDmzkgeyVP9UwCz0HxWBWw
         0RGuVBzIKxqIAuh9o3VkkSO4kA8M+TN0iC0Ct3lNcMpH2yTjrhafB0auh/V1NMYqBu+N
         L7FS2ZrkW2lfsmUH/iTUkAOvQO29a7OccQyieAOum4XJbvEqGKOVQmdTo+nQolqe6CXw
         AsZlm4o6+K55/cqAlZIgVt4k4QvbXv9z7YUHIETA4RTtscar9BwsDvpbbgoggMq5vbWx
         jqaJRsZIaMigkxCJO/dgNcH/VU0h4HyxhV6wASlhNONZgQIRbj+noPgWMtnrrZUlLUYO
         /69g==
X-Gm-Message-State: AOAM531hnGcx59mZfLKOoiYfK385bVpK43aGAMxE9w5EGkoLuxQdB/Ft
        YVNKqFOvoxs481HS90mf8cm1rGH0ZgmaLihnTO+fqQ==
X-Google-Smtp-Source: ABdhPJxPCVuAFQfZn1jTTI97GwXRcIEtoXLOMYJ2NswE6VoKKMH3bz102TiIn+2ml3VoExp62d7RSeSQjAcKs6Cner0=
X-Received: by 2002:ac2:53a2:: with SMTP id j2mr575176lfh.139.1590639120527;
 Wed, 27 May 2020 21:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
In-Reply-To: <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Thu, 28 May 2020 09:41:49 +0530
Message-ID: <CAHfPSqAYBKXJkG21hqjyuRN8X+HqaX5df6ByeSRoMycBeVU48A@mail.gmail.com>
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

On Wed, 27 May 2020 at 22:29, Alexander Monakov <amonakov@ispras.ru> wrote:
>
> On Wed, 27 May 2020, Naveen Krishna Ch wrote:
>
> > I tried on an octa core machine, must be Renoir
> > vendor_id       : AuthenticAMD
> > cpu family      : 23
> > model           : 96
>
> Yes, same here. The only difference I'm on a 6-core 4500U.
>
> > On an idle system over a period of 500secs:
> [snip]
> > Power consumed by socket: 4.53539685 W
> > Sum of power consumed by cores: 0.010953W
>
> Yes, no problem for idle readings. I'm getting 2W/package on AC and
> close to 0W on battery.
>
>
> > On an system with AVX test running over a period of 500 secs:
> >
> >                  At t=500sec    | At t= 0           | Diff of energy
> >  | in Joules        | Power in Watts
> > core 0     | 649348495     | 413687530    | 235660965       |
> > 235.660965   | 0.47132193
> > core 1     | 506880081     | 294882827    | 211997254       |
> > 211.997254    | 0.423994508
> > core 2     | 454804046     | 271046127    | 183757919       |
> > 183.757919    | 0.367515838
> > core 3     | 391508712     | 237531021    | 153977691       |
> > 153.977691    | 0.307955382
> > core 4     | 410336868     | 284410079    | 125926789       |
> > 125.926789    | 0.251853578
> > core 5     | 287569732     | 192306015    | 95263717         |
> > 95.263717      | 0.190527434
> > core 6     | 185909622     | 120556152    | 65353470         |
> > 65.35347        | 0.13070694
> > core 7     | 129932006     | 95385940      | 34546066         |
> > 34.546066      | 0.069092132
> > Socket 0 | 28399099655 |  24799819931 3599279724     | 3599.27972    |
> > 7.198559448
> > Power consumed by socket: 7.198559448 W
> > Sum of power consumed by cores:  2.212968 W
> >
> > Can you confirm this.
>
> No, this isn't right. The workload is not stressing all cores, you're
> reporting 235 J for core 0 and only 35 J for core 7.
>
> If you are running the avx-turbo test, please run it like this:
>
>   ./avx-turbo --iters 10000000 --spec avx256_fma_t/8
>
> This will run AVX code on all 8 cores for about 1 second. To run it for longer,
> increase the --iters argument.
I ran with all cores loaded now and i see that
sum of diff of energy consumed by all cores is greater than the diff of
socket energy consumed in 100secs.

Kindly, give me time. I will come back with some explanation or solution.
>
> Thanks.
> Alexander



-- 
Shine bright,
(: Nav :)
