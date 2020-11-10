Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B13BC388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 16:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2909B206E3
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 16:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Z4DNtDAE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgKJQVB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 11:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbgKJQVB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 11:21:01 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B9BC0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 08:21:00 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id t16so14941816oie.11
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KME7O7z4Yh3NrRNDrIjhC4JwDcG28uMLKR06t+G4bXs=;
        b=Z4DNtDAEMUtndVCro11Rs4akeUH4O1S3MPLovvyfOkPHpdnNTP9KmmhXscrxcFEVQ4
         dfm+3x0nqYUmHEjIXuqGeIpx8TvEn+2zSVPEvC54HdZyAr9lzYR4bK440CmVvJXxRb5y
         s/vCXydP4n+2A74THcxdkiQfhjRSSRCZkrdS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KME7O7z4Yh3NrRNDrIjhC4JwDcG28uMLKR06t+G4bXs=;
        b=awCOpdvii3zwO9WDra1QDnlxig2CIkfUAsxADKEHt5m9/qgtFzbjQZnrwn0Rv80Z/5
         mhQDoFuibxbqTsxChDDiJbLcVetOjLji1ieouEOZKUhVczGM1snn+zabSNEaCtxp/I05
         BU3ol/ozSkzMiBpZDBFs8HYDiBQRri32oI5E4GJzmuP2iKOU4Cf3GMqziFGdtX9Q8xaD
         7IF1VZXVj1HO4boQDGlW6Xn+lx1Z0C6lNBpeqHAI6rMgKc5s/oRtXPvXdpF51w7HXH1O
         HDq94q5+zrKmVfhbKYNvvqhFajrsx6mj8HKncQIRmbI4nv6yj38IIFKO6fyHkL8gI7cC
         3i4A==
X-Gm-Message-State: AOAM531EykHeTipYUtXn4YG7ywxHWXMrbs9rUt1shkMsgfZ9tgJiz3Pl
        ey/AqbXWD+At+si48MDt7HwC5vCj/c++UF/BghWw+Q==
X-Google-Smtp-Source: ABdhPJzFb1vOg+vA/11FpJEgI4O7yHn0YM6OJMWNczO8Y5mZBJY/+TVi1zXXwX9eVZ4+PEoUIUcrXviEqw6oPNQJSlY=
X-Received: by 2002:aca:b288:: with SMTP id b130mr3101091oif.152.1605025259468;
 Tue, 10 Nov 2020 08:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20201110112817.52549-1-pbarker@konsulko.com> <20201110112817.52549-3-pbarker@konsulko.com>
 <20201110160826.GC17288@roeck-us.net>
In-Reply-To: <20201110160826.GC17288@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Tue, 10 Nov 2020 16:20:48 +0000
Message-ID: <CAM9ZRVsQHPLDCMcjq7WDAdC15qQfHbU15o3bOT5P-y-WOnNuxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: pwm-fan: Fix RPM calculation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 10 Nov 2020 at 16:08, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Nov 10, 2020 at 11:28:17AM +0000, Paul Barker wrote:
> > To convert the number of pulses counted into an RPM estimation, we need
> > to divide by the width of our measurement interval instead of
> > multiplying by it. If the width of the measurement interval is zero we
> > bail out instead of dividing by it.
> >
> > We also don't need to do 64-bit division, with 32-bits we can handle a
> > fan running at over 4 million RPM.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  drivers/hwmon/pwm-fan.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> > index edc0453be25a..24cfed4d625e 100644
> > --- a/drivers/hwmon/pwm-fan.c
> > +++ b/drivers/hwmon/pwm-fan.c
> > @@ -55,14 +55,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
> >  static void sample_timer(struct timer_list *t)
> >  {
> >       struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> > +     unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
> >       int pulses;
> > -     u64 tmp;
> >
> > -     pulses = atomic_read(&ctx->pulses);
> > -     atomic_sub(pulses, &ctx->pulses);
> > -     tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
> > -     do_div(tmp, ctx->pulses_per_revolution * 1000);
> > -     ctx->rpm = tmp;
> > +     if (delta) {
> > +             pulses = atomic_read(&ctx->pulses);
> > +             atomic_sub(pulses, &ctx->pulses);
> > +             ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
> > +                     (ctx->pulses_per_revolution * delta);
> > +     } else {
> > +             dev_err(ctx->dev,
> > +                     "Cannot determine fan RPM as time delta is zero\n");
> > +             ctx->rpm = 0;
>
> I don't think that warrants an error message. At best it should be a debug
> message, but even that seems not worth it. I would suggest to not update
> rpm if that happens. After all, it is pretty much a theoretic case.

My thought process was that setting an RPM value of zero would be
confusing - it could be caused due to fan failure or due to this
(theoretical) error. I'm happy to drop the error message though - is
the patch acceptable other than that?

-- 
Paul Barker
Konsulko Group
