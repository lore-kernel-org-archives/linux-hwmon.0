Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8B2C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 16:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D5272076E
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 16:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDdnrcmO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgKJQI2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 11:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730468AbgKJQI2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 11:08:28 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC36C0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 08:08:28 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id j7so14895471oie.12
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jeuq/wXEaBoKVC6CTknep5AhN1m+4mUH8xVOpbBMyF4=;
        b=PDdnrcmO5ya6bdRRstV1s3IE4uPgP7wQo2N3rAt5u0EHd+7S9UHU0X2XSYwM4ueN89
         bmXQ0+5+FfKucZbaLAxhtE4JY6X9tIKAwp1Nbe4GZDSIcHWM/yVHhXh/257Ag1L///wI
         HVbn7v+Jygz5YMxLjhbtrZCIoYQrGb3WlmaLYKqfycWAMdhVLZoKp6qYSAAy6G0N1K40
         6PehArj55qIsAKZ/pVeN5fKuGipQQv8yat3egIU/Ey03SSAfehsn3yzR9IerTblL98A7
         hc2n45mMsowAFEOx+yOn6KtdvoIkK9i4mIJ62Z1dLAWJQgkkfGskKk8204+wSX0Z3vdA
         wVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jeuq/wXEaBoKVC6CTknep5AhN1m+4mUH8xVOpbBMyF4=;
        b=o6TvJYFXhB1Htu9CD8Y36+OPLuIItBFrySkH0/uGDWd3aCeEVIpv7Ueza22LANnkP8
         37S7jgaxqoNIVnx9C41rNN6GGMX8SrkOg4MFCqoertQDplicE5IxkYzIrbgOmQvNKGeS
         HBr52sLExL3n2IryDx2+WtPW5muxFMFcfww0HHVDTh08yGl1o0W0Gmo2eUV07/MkbIpm
         NZo8B7JEtwYIgmgOe9Ug64ng8rJWl8o0/ZKxSdj4jfIPZ0pZeQRhMJATaxAaAu7cRmwA
         B4ffYDvjHcaocIskj6+TyeisLX/gsWigx1NdvaajbwFuCv9c/5lOTR8/wOb4keUiljof
         mL8Q==
X-Gm-Message-State: AOAM532YC9j0Dncw0o26YlqkJ5Fkx/+gG1vS9hp1LO0xQtITCdgT+g7l
        VWiS/yP+tJi1f71nlL1lWqfR09PL68c=
X-Google-Smtp-Source: ABdhPJz2GsERQbbZjp+7tBDD4ln/osXtgkQLvTZwa3D4zKTewE07UVXVfE78qOrWhvMA1/kCK9BD5A==
X-Received: by 2002:aca:5885:: with SMTP id m127mr3287614oib.5.1605024507718;
        Tue, 10 Nov 2020 08:08:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n15sm3356669otj.41.2020.11.10.08.08.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 08:08:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Nov 2020 08:08:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: pwm-fan: Fix RPM calculation
Message-ID: <20201110160826.GC17288@roeck-us.net>
References: <20201110112817.52549-1-pbarker@konsulko.com>
 <20201110112817.52549-3-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110112817.52549-3-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 10, 2020 at 11:28:17AM +0000, Paul Barker wrote:
> To convert the number of pulses counted into an RPM estimation, we need
> to divide by the width of our measurement interval instead of
> multiplying by it. If the width of the measurement interval is zero we
> bail out instead of dividing by it.
> 
> We also don't need to do 64-bit division, with 32-bits we can handle a
> fan running at over 4 million RPM.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  drivers/hwmon/pwm-fan.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index edc0453be25a..24cfed4d625e 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -55,14 +55,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
>  static void sample_timer(struct timer_list *t)
>  {
>  	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> +	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
>  	int pulses;
> -	u64 tmp;
>  
> -	pulses = atomic_read(&ctx->pulses);
> -	atomic_sub(pulses, &ctx->pulses);
> -	tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
> -	do_div(tmp, ctx->pulses_per_revolution * 1000);
> -	ctx->rpm = tmp;
> +	if (delta) {
> +		pulses = atomic_read(&ctx->pulses);
> +		atomic_sub(pulses, &ctx->pulses);
> +		ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
> +			(ctx->pulses_per_revolution * delta);
> +	} else {
> +		dev_err(ctx->dev,
> +			"Cannot determine fan RPM as time delta is zero\n");
> +		ctx->rpm = 0;

I don't think that warrants an error message. At best it should be a debug
message, but even that seems not worth it. I would suggest to not update
rpm if that happens. After all, it is pretty much a theoretic case.

Guenter


> +	}
>  
>  	ctx->sample_start = ktime_get();
>  	mod_timer(&ctx->rpm_timer, jiffies + HZ);
> -- 
> 2.29.2
> 
