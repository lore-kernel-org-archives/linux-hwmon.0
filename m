Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9073C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 17:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70F3F2076E
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 17:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="bf7yodsa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJRfY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJRfY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 12:35:24 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC49C0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 09:35:22 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id t142so3287638oot.7
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 09:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DcfBuBNHNhazI2gU6DMKRS7C520xaNVWIOlgm4dzHbk=;
        b=bf7yodsa2ngB1UbwkSFc0DUvjZxoXSuVQJCsP3egY8IUn7hUqyjZHJynZMXcTDTRe+
         mlxFfjdtSaegTAoDzevkuBhrnWcbcPIupB0V/HvRB14LZaEUgYUtr9ZBQDG17SV4Qqu0
         GUCGEma2BgsVPy7MF6U9rp7Ge46TWn4j/bt/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DcfBuBNHNhazI2gU6DMKRS7C520xaNVWIOlgm4dzHbk=;
        b=bpAMsmazi0JkFTED+93SuPLtUohPvItLk74WAs20Hqu9Mk5G6YfYV/YN5/A3w//at1
         ez9shwKtezKkyyZ76VeHmjQmDYbtFLcOOFYMQF/hibl50iyOPxYTFPnX3v1twJdRP/0P
         LsycAopB7YkupyyjpfN0Tbv2/Ctf/ZRWsZlAJ9qLkgPLochM1jAD8MYa9+d6p+lPAZTn
         qca4Q9GZ+InDMrtO3pbfR20Fi2/4oBoUm3T7Jq8R/1t5LrLw7ohUCBDQ6INdA/Sr3OCv
         kbSTPaYXMkZ/7adQA1+/59oUab+GQOoUBAXBd/QhMf3q1a0Bwaim+dgfjAR7yIbqmiO6
         I5TQ==
X-Gm-Message-State: AOAM533cGJvC6Dsg/jCM/Mnq2dtPbBxoC0F+iarMJvzfbDrpDrwDGNyH
        Wo1mwe6/BXBnTVYE8DRGHJzONVTX315s9paOKgzztg==
X-Google-Smtp-Source: ABdhPJxPSNBQ95NgBugN74aqVT9gJx4669nBcT9d8TK/ofnkUg08jJc3aUJCZW5+w67fGNGupNm5IBjHbGvCgr6f170=
X-Received: by 2002:a4a:5182:: with SMTP id s124mr14310986ooa.88.1605029721908;
 Tue, 10 Nov 2020 09:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20201110112817.52549-1-pbarker@konsulko.com> <20201110112817.52549-3-pbarker@konsulko.com>
 <20201110160826.GC17288@roeck-us.net> <CAM9ZRVsQHPLDCMcjq7WDAdC15qQfHbU15o3bOT5P-y-WOnNuxg@mail.gmail.com>
 <a4d22b1f-0203-74e0-71d3-3f106c62d32e@roeck-us.net>
In-Reply-To: <a4d22b1f-0203-74e0-71d3-3f106c62d32e@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Tue, 10 Nov 2020 17:35:11 +0000
Message-ID: <CAM9ZRVuKghfMMiaUe6ndO2Z-vKxtLc=dMJgZw11JfBwtPoMoMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: pwm-fan: Fix RPM calculation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 10 Nov 2020 at 17:32, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/10/20 8:20 AM, Paul Barker wrote:
> > On Tue, 10 Nov 2020 at 16:08, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Tue, Nov 10, 2020 at 11:28:17AM +0000, Paul Barker wrote:
> >>> To convert the number of pulses counted into an RPM estimation, we need
> >>> to divide by the width of our measurement interval instead of
> >>> multiplying by it. If the width of the measurement interval is zero we
> >>> bail out instead of dividing by it.
> >>>
> >>> We also don't need to do 64-bit division, with 32-bits we can handle a
> >>> fan running at over 4 million RPM.
> >>>
> >>> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> >>> ---
> >>>  drivers/hwmon/pwm-fan.c | 17 +++++++++++------
> >>>  1 file changed, 11 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> >>> index edc0453be25a..24cfed4d625e 100644
> >>> --- a/drivers/hwmon/pwm-fan.c
> >>> +++ b/drivers/hwmon/pwm-fan.c
> >>> @@ -55,14 +55,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
> >>>  static void sample_timer(struct timer_list *t)
> >>>  {
> >>>       struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> >>> +     unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
> >>>       int pulses;
> >>> -     u64 tmp;
> >>>
> >>> -     pulses = atomic_read(&ctx->pulses);
> >>> -     atomic_sub(pulses, &ctx->pulses);
> >>> -     tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
> >>> -     do_div(tmp, ctx->pulses_per_revolution * 1000);
> >>> -     ctx->rpm = tmp;
> >>> +     if (delta) {
> >>> +             pulses = atomic_read(&ctx->pulses);
> >>> +             atomic_sub(pulses, &ctx->pulses);
> >>> +             ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
> >>> +                     (ctx->pulses_per_revolution * delta);
> >>> +     } else {
> >>> +             dev_err(ctx->dev,
> >>> +                     "Cannot determine fan RPM as time delta is zero\n");
> >>> +             ctx->rpm = 0;
> >>
> >> I don't think that warrants an error message. At best it should be a debug
> >> message, but even that seems not worth it. I would suggest to not update
> >> rpm if that happens. After all, it is pretty much a theoretic case.
> >
> > My thought process was that setting an RPM value of zero would be
> > confusing - it could be caused due to fan failure or due to this
> > (theoretical) error. I'm happy to drop the error message though - is
>
> Yes, that is why I suggested to keep the old speed in that situation.
> After all, it _will_ be updated shortly afterwards. Either case, people
> won't typically look into the kernel log if they see the 0 rpm.

Ah, I misunderstood your earlier reply then. Yes - this makes sense,
clearly I haven't had enough coffee as that solution should have been
obvious!

v4 incoming.

-- 
Paul Barker
Konsulko Group
