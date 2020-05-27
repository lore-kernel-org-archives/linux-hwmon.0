Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6E3C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 03:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7509E2075F
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 03:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t8VRkqXh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgE0DDj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 May 2020 23:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgE0DDi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 May 2020 23:03:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81023C061A0F
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2020 20:03:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w10so27130758ljo.0
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2020 20:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mNw+nS/xLNb33fSrwOKWs7wynQ4jW6R41uFReVuglnM=;
        b=t8VRkqXh6ZFgfj6BG+YfzA06MGgl6p48EK/YDHEbJ0TaXMOdbYxVDnAJcHn2NsVJ9m
         f+CGMQaQx6eiBJyFARx4aJkMJLTpiGjps4ggOue03fAXZpwIKJu68vZzrtAKZFB2Bals
         kvzDyymYtg3ZNh5whhm1O7ruu5KvLVtzEKdzYJpoA2KCBMlVuUgghbxBUC2IyLubVthE
         7p4KXs3Kxw+8RHUfilMH+im3fB0jG9XFTqr2IRoYvHp5u/7DgsRKHjl2c+8cnIO4yVkx
         ZjHiS6AtbLAQ3rPJaFZoP7fCFt0cev+s83GU9v2ZGS4agqAmtlV5QG3rX7x8kpKqHSyN
         Hmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNw+nS/xLNb33fSrwOKWs7wynQ4jW6R41uFReVuglnM=;
        b=JZ39ayRNc9+uopWKtSK9eD+xdayRdtsLmJFhrbianjygcgc6UeWYDRR8K8rejxqSz3
         eQQdDFm5xgzU7ej0gSULoAQR6T/aqrd8JkRVu/LklBA3WYl694qlB0asOsFK8OuyKLQr
         aXg8Nn+2rOqUlM2QGUmboGaQiPB2zeBJYtZv+JdMOOQiq1S194f72o0Xr/UeImV5t/P0
         4Boknw0J1tnSwi9eged8u8a5gNTJbDQ1fYRaiNeuiZ5ElptuvEad3VVjRTuqwp7aHoLY
         5sdsG5DWawyd5LLb2Izhr3E08D5pn1Rujcukt15JiwlvcY+cJIUCHK588k2zbLBlvb6t
         TtfQ==
X-Gm-Message-State: AOAM530eanOR+eg2c8m7QnUyZGHXdayhJCki72sIRMFIjlX8H6jGdYit
        kf3GCODkjYplHzuvtQ9R8Los8iwhprD3eN6FI1pQCcgw
X-Google-Smtp-Source: ABdhPJxHRtgNwWZHOxTN4MLH+vmyEvI/a9AYD3IiFzld1twHmrw7lo5QDXAKRKTsSXOF5XSicUs6O1Xe3NiM4n9zchU=
X-Received: by 2002:a2e:7504:: with SMTP id q4mr1753915ljc.339.1590548616758;
 Tue, 26 May 2020 20:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
In-Reply-To: <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Wed, 27 May 2020 08:33:25 +0530
Message-ID: <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
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

Hi Alexander,

Thanks for using the driver.

On Wed, 27 May 2020 at 04:07, Alexander Monakov <amonakov@ispras.ru> wrote:
>
> On Fri, 22 May 2020, Naveen Krishna Ch wrote:
>
> > > This version looks ok, and it looks like there are no more
> > > unexpected counter wraps either. Series applied to hwmon-next.
> >
> > Thank you for your guidance and support.
>
> Thank you, looking forward to using this driver. Meanwhile, I have
> a couple of questions about AMD RAPL counters.
>
> The documentation says the PKG_ENERGY_STAT MSR is instantiated per CCD
> and L3 complex, implying that energy is accumulated for 3 or 4 cores
> in an L3 complex.
>
> However your patch reads that MSR per socket, and from testing on my
> Ryzen 4500U CPU I can confirm that the MSR gives the same value when
> accessed from each core. Therefore I think your code is correct and
> the documentation is wrong, can you confirm?
I confirmed this with the hardware folks, the definition of package has
changed with the chiplet design. May be the documentation needs an update.

>
> Next, I'm seeing paradoxical results when attempting to test accuracy
> of the counters. When running an AVX workload on 6 cores, I see
> CORE_ENERGY_STAT MSR reporting values just above 9 Watts per core, with
> 55 Watts in total, and yet PKG_ENERGY_STAT reporting only 30 Watts.
> This is clearly a contradiction since package energy must be at least
> the sum of core energy readings. Furthermore, this is happening on a
> 18 W CPU in a laptop, which definitely cannot sustain 55 Watts, and
> even 30 Watts seems too high.
>
> Can you clarify how the counters work and under what conditions they
> give accurate readings?

These registers are 32bit counters, they might wrap-around quite faster at
high work loads. So, we used a kernel thread to accumulate the values of
each core and socket to 64bit values.

Depending on when the module is inserted in the system, the initial values
of the counters could be different and we do not have a way to know, how
many time the registers are wrapped around in the past.

Difference of Energy over Time is the best way to use this information.
For example:
at t1 = 0, Read the register before starting the job, say E1.
at t2= 300secs, Read the register after the completion of the job, say E2.
power consumed = (E2-E1)/(t2 - t1) in Watts.

In our evaluation, the sum of the energy consumption of cores of a socket was
always less (actually far lesser) than the socket energy consumption.

One other thing could be the enumeration of the cores of a package in the
Desktop/Laptop systems might need different handling in the read. I will check
this.

>
> Thanks.
> Alexander

-- 
Shine bright,
(: Nav :)
