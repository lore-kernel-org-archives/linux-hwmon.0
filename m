Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0CDC55ABD
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 18:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4431620825
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 18:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGWDM0h0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgKJSc6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 13:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJSc5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 13:32:57 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EBFC0613D1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 10:32:57 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id i18so13539598ots.0
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 10:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NdElz3UPtQ41qPeh/RdxiDLbSt3NZnul5acE1iFie8w=;
        b=DGWDM0h0ZIZQ56PlN5p6zagk0OU+HwBh6l2S8mw2duGjNxGVuMx+HIIo7X/D+QRY0y
         dNs5Pe2tGgyHf5PqNFvuNmAR6OPreO0mhqc3cB2iD63bjBOkjbd+GyJP5R/rmr9uatu7
         Z/vBdoltS0mLGlbiJaVDMjpl+60YFzO2i6NcX54SzoTLWfnsor4SQYZ1+Jfgr497yQYV
         vQWBougGaGf+AgjZHNRloILsJ8a7+mnQMeqXu8s3H7fPyuJw8LiJ2Q8T3aQ+BxQ3jPDx
         eIv1JBmKEHHDY8kNtGnKpTO6u21qlt58DWSiIMwF0M4edtIo/rv51cEw546zHk4pc+Md
         c+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NdElz3UPtQ41qPeh/RdxiDLbSt3NZnul5acE1iFie8w=;
        b=pYHognDjbD28GUb6AE9p0m2dWAQ4cn8BON9ueQX1gjTz3pe1tWzU50z/3PkPgVTZge
         Cff2YmXhZSOJDhQkaSYp1o/AsG26tI9THsnG1kbhqV6kga9hJcTIRKB1PnQWsyD9j4jM
         qBwD+nYMjpPgTD0Dawbh9nrjkrw5YoBGDXPu69lKEAHIrtNB8tBcaCHHbTBKwjj2ypEc
         a8pM2cZ4GZkeVzOhWVBiFrSHok5IR0ddvv/Pg2JU3RZFl0VG22uVdVa0h4Y4/hPzZeF1
         4fRJ1MOFnsTLFbTb4up7S0J1jvmUG7Yb48EkKSvz1wnm7s4HhveHJglCTDBioyGTiOW7
         l1Xw==
X-Gm-Message-State: AOAM532zTCParAqvRTcTWHmz8qh79D9JpOJc1QtTHowGQ/0ALYjR5x5p
        kBcEy1FH777LzlI76pxeUJSiE1+rDP8=
X-Google-Smtp-Source: ABdhPJw8jOy1Z6O7lILOB3RIZ9YgImTEMf1Opq5ib0wXVJXKyBzyq9z0CJ5IogniJ1h8HSkQppnYtA==
X-Received: by 2002:a9d:2483:: with SMTP id z3mr15046570ota.140.1605033176884;
        Tue, 10 Nov 2020 10:32:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x190sm3298347oia.35.2020.11.10.10.32.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 10:32:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Nov 2020 10:32:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: pwm-fan: Fix RPM calculation
Message-ID: <20201110183254.GA24321@roeck-us.net>
References: <20201110175434.2591741-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110175434.2591741-1-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 10, 2020 at 05:54:34PM +0000, Paul Barker wrote:
> To convert the number of pulses counted into an RPM estimation, we need
> to divide by the width of our measurement interval instead of
> multiplying by it. If the width of the measurement interval is zero we
> don't update the RPM value to avoid dividing by zero.
> 
> We also don't need to do 64-bit division, with 32-bits we can handle a
> fan running at over 4 million RPM.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
> 
>   Changes from v2:
> 
>     * Don't update the RPM value if delta=0.
> 
>  drivers/hwmon/pwm-fan.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index bdba2143021a..d1fd50c32514 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -54,14 +54,15 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
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
> +	}
>  
>  	ctx->sample_start = ktime_get();

I know I am a bit nitpicking here, but should ctx->sample_start only be updated
if delta != 0 ? We don't reset pulses if delta == 0, meaning the next reading
will be based on the old start time (even if the difference was less than 1 ms). 

Thanks,
Guenter

>  	mod_timer(&ctx->rpm_timer, jiffies + HZ);
> 
> base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
> -- 
> 2.29.2
> 
