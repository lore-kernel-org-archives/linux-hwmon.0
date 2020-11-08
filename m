Return-Path: <SRS0=Oktm=EO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4403AC388F7
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Nov 2020 03:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB58E207C3
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Nov 2020 03:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc7Y6XUw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgKHDr0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Nov 2020 22:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgKHDr0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Nov 2020 22:47:26 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060B7C0613CF
        for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2020 19:47:26 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id w188so683400oib.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Nov 2020 19:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LEBUtMA1rbGCEQCDbR+cC9uGHtq8GeULnrll7o8Ex+s=;
        b=Sc7Y6XUwEoYN3NW4ymgtIfMOo9+3bRvrqZyHOn3yRA6/CdVXVZBXIAeD8zYph6aSr/
         87m7ETmlnYNWAh5W5JCy0K2UAFh8ODTgY7LT2+GzH2s7e5Jxe4ndhown352eXO1uaUO5
         LcOPGTwznLw3PGX/8QuIqOmZ2DbRHyVSIrvSKfnBwU/hj9Jedr6px48Rn/uSCTauDPcP
         m/1OK3JzbBafKTbhFqa8C2k8n/WlWTohmZ2xov6GVpXTBN50DaeJGdpNDrbaY8/sET2Y
         xzyPAdJhAwwsoi2KFTc3vdpwzajOzvdzfh4r1NtLjjZHOFUEChsrKSTwYkLcqKFWryLA
         7QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LEBUtMA1rbGCEQCDbR+cC9uGHtq8GeULnrll7o8Ex+s=;
        b=BJnfN3q0GAN4N6GLpU8AC0+2OBS7CEMsVQuhmteZRw5l6AQiBk+nW8UqvRvNCAFfj3
         LAR/KZGvJOS1fWq+s3X1kJiuQMY2f3fI+X3XQM4NhL+uyk17EA3la/lJdTo88pogdPcy
         9mi6i0W+gktswWz0LOmIqB4QoIdiyiOzdpPfSNaeScZpW+ua24aANjySYDFkwk2BlF6R
         Pyx89cTtusEnnVEBdIV6qeNMtcltwMXkltzuActLI1F9fZ80MAjXgxrd8TlunLNs8XUu
         tt9HFgD80XBGaSNP+um6rSxRmiaaW6PBrh+pNZ3oqlJc1va1y91c+YksoVW80XVhpCqF
         eyqw==
X-Gm-Message-State: AOAM533OTXv+rmO2X+1GH2qdIKSoNp/lv1d74csnFuVQ7Mu+TLnR+LRb
        by5ND1GHnl4vN/x1aZCuFmTkbFNcq4s=
X-Google-Smtp-Source: ABdhPJz8bNW/5PtlZSkHFaAc6zoZEdFVHiU6ouAZXdP1fvbXYf5vTLOOnMaWLEiRAo/is3MmxcpZNA==
X-Received: by 2002:aca:f4cf:: with SMTP id s198mr2376617oih.53.1604807245471;
        Sat, 07 Nov 2020 19:47:25 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8sm1566701otm.72.2020.11.07.19.47.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2020 19:47:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 7 Nov 2020 19:47:23 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: pwm-fan: Fix RPM calculation
Message-ID: <20201108034723.GA133975@roeck-us.net>
References: <20201105164146.182254-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105164146.182254-1-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 05, 2020 at 04:41:46PM +0000, Paul Barker wrote:
> To convert the number of pulses counted into an RPM estimation, we need
> to divide by the width of our measurement interval instead of
> multiplying by it.
> 
> We also don't need to do 64-bit division, with 32-bits we can handle a
> fan running at over 4 million RPM.
> 
> As the sample_timer() function is called once per second, delta will usually
> be just over 1000 and should never be zero, avoiding the risk of a divide by
> zero exception.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  drivers/hwmon/pwm-fan.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index bdba2143021a..2f2950629892 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -54,14 +54,13 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
>  static void sample_timer(struct timer_list *t)
>  {
>  	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> +	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
>  	int pulses;
> -	u64 tmp;
>  
>  	pulses = atomic_read(&ctx->pulses);
>  	atomic_sub(pulses, &ctx->pulses);
> -	tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
> -	do_div(tmp, ctx->pulses_per_revolution * 1000);
> -	ctx->rpm = tmp;
> +	ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
> +		(ctx->pulses_per_revolution * delta);

delta can, at least in theory, be 0. While that is quite unlikely to happen,
the code should handle this situation.

>  
>  	ctx->sample_start = ktime_get();
>  	mod_timer(&ctx->rpm_timer, jiffies + HZ);
