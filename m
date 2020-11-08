Return-Path: <SRS0=Oktm=EO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25555C388F9
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Nov 2020 13:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE134206ED
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Nov 2020 13:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="FzbJzPvb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgKHNPT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 8 Nov 2020 08:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbgKHNPL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Nov 2020 08:15:11 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B94C0613CF
        for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2020 05:15:09 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id t143so7025313oif.10
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2020 05:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cYrqsTooYU/auvHZdRL07ywN+M7emjCxxZZXk3cycKs=;
        b=FzbJzPvbiKvL2dRd2U3TgOm7Yh4g7VFibRieyN+vrzRJZhK8/dolO/itNVNycRTZwW
         swQyQJ+qRIppwDvBbkkouWkeZFyYqKl406cYrwwfwO0BLQE9Ip6erB7RJcYMuLEf3lj3
         PG3E3GhmvV0DfDh0RYRihhOFhokIUjZ/D3THI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cYrqsTooYU/auvHZdRL07ywN+M7emjCxxZZXk3cycKs=;
        b=tCKTZJST/Ub/zqMC7BiTE6cF3+6oklicZ9HYsrSCheOZXkm1vifF4NKtJOddv0R42z
         dhjLMrD8Ut+veMtobLs+VuFi0+lUTlAt4gO4KcrUgj+VjJnbx3hDOlWuOLYezaTEM3YN
         ZFX38ZhoPI2ko46nLKEiN9umQn+7j+DhPm9g8CxLq9DzCmC1HCHO12mPNcgzlZKy4EtO
         Fo6mpOtkVnzm1YolFLn2Q2nQZ/opIluiSR0Bh8wAnn4c6tSu2bgaan5/uPpuO/4vcwAf
         GBb2kPDy5eMxqXSxOsrUpKU0Ndk9fbRzXvcrFmycr9SiQddz6UPP68rmX3FcmI49jCD6
         fZHA==
X-Gm-Message-State: AOAM530FR3LzhrPqW7Xb8XRyA3WJXgUqm6yHfUaR1B6v7WCIVOKQe0WG
        HMhrbHmnfl5w/UsMev89yNp3h+mFPjpZL0MYv6C8y4Ddy0c=
X-Google-Smtp-Source: ABdhPJxCPgBkaAEM4Un8i+Eu9OGz6bOZmbfiNgxDQkV9g53fG6PW3uvor6e1KRWknT3ivZPhds82wmy5dM9H/uXh5OY=
X-Received: by 2002:aca:5505:: with SMTP id j5mr5513005oib.6.1604841308794;
 Sun, 08 Nov 2020 05:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20201105164146.182254-1-pbarker@konsulko.com> <20201108034723.GA133975@roeck-us.net>
In-Reply-To: <20201108034723.GA133975@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Sun, 8 Nov 2020 13:14:58 +0000
Message-ID: <CAM9ZRVsUC3L3ZOjPPfQXiqD-J+3cCSEpeZDLDidGSWBXLZGaNw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: pwm-fan: Fix RPM calculation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 8 Nov 2020 at 03:47, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Nov 05, 2020 at 04:41:46PM +0000, Paul Barker wrote:
> > To convert the number of pulses counted into an RPM estimation, we need
> > to divide by the width of our measurement interval instead of
> > multiplying by it.
> >
> > We also don't need to do 64-bit division, with 32-bits we can handle a
> > fan running at over 4 million RPM.
> >
> > As the sample_timer() function is called once per second, delta will usually
> > be just over 1000 and should never be zero, avoiding the risk of a divide by
> > zero exception.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  drivers/hwmon/pwm-fan.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> > index bdba2143021a..2f2950629892 100644
> > --- a/drivers/hwmon/pwm-fan.c
> > +++ b/drivers/hwmon/pwm-fan.c
> > @@ -54,14 +54,13 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
> >  static void sample_timer(struct timer_list *t)
> >  {
> >       struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> > +     unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
> >       int pulses;
> > -     u64 tmp;
> >
> >       pulses = atomic_read(&ctx->pulses);
> >       atomic_sub(pulses, &ctx->pulses);
> > -     tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
> > -     do_div(tmp, ctx->pulses_per_revolution * 1000);
> > -     ctx->rpm = tmp;
> > +     ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
> > +             (ctx->pulses_per_revolution * delta);
>
> delta can, at least in theory, be 0. While that is quite unlikely to happen,
> the code should handle this situation.

I'll send a v3 which bails out if delta=0.

Thanks,

-- 
Paul Barker
Konsulko Group
