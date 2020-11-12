Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EB0C2D0A3
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 14:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32EA922201
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 14:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioIBfqd1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgKLO5Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 09:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLO5Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 09:57:25 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E713C0613D1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 06:57:25 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id z16so5811197otq.6
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cpTtNvq4ZhxMlLNfqNd0XNUjhBDz3O7BvGq+ZKB+XM8=;
        b=ioIBfqd1X76KzfbUifXYfBrr1+byKv/QatTWNxYyy7ZWSbdxIONgxA31rKzdaQDAGC
         S0s/fXc05UagUWzrY4M237BjQoKSNawbmbWaELroSqfij5hEt8JULeYbTVzRWZFhw7jj
         dasYityHDHY0vvL217QwF/eW9tR0X9NKmkI4ow78bDoZNQc3NXmCEDDyBQ2K//vjylmZ
         nh4Tm3p0Sf9RKLMiN6+cv2kbzBmv+BwgpFMYNSNr+wF6ONWsJOmpDZ8JGZVgmDjaWN/R
         s49fqE7oEtut7DDKRQH6UNsu1XonVGRdYEUutqvcwZQf+wyyGRVXv8Is0p5O3/ppJdZr
         uYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cpTtNvq4ZhxMlLNfqNd0XNUjhBDz3O7BvGq+ZKB+XM8=;
        b=U6TFLv3yEgTQiAKj+VRCM7tQHT/W/LXwATpREwlPRYg+ceMqFmUfaSyjfHCgS7XP/O
         gFypLlAvDu17ri0YutUUC6wWZmhJ52Fco0pXT1ssIJ9xjFqW/AYPzhky4RhuDddmufJH
         UUcWOlhXukyqa+2L+gTzSO+pKJsNpZ+YR1F4yKHhh0jGHAXafbUSmhLU0ToPFexVD+dP
         GlDvO38qHoqmW8y0X441x0lpZ+pxp26EAl9QET/rkg/UqUBdefGTLagL7FHB0qffORx2
         2luwMFpFRC7AHwVHnwRjcssssK6o5IWpkgeJ3m8/78LEX6cJmtI9+ozA+VW3H5/4Lmew
         mu6A==
X-Gm-Message-State: AOAM531GZ/QD7cxEfXnaRV3klLp/R6Tn8hbXd8+klYKuqM34lNT535oH
        wmxqBLPW+hLVS01vMXRZLvU=
X-Google-Smtp-Source: ABdhPJygjjFhcjusmSr8eB3vUWGgYu3/L2+dC8TvwJEICM3AHxYoWnz3Lj9HU5e6FbwQbXiazbgCMg==
X-Received: by 2002:a9d:4716:: with SMTP id a22mr20848547otf.82.1605193044587;
        Thu, 12 Nov 2020 06:57:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n21sm1153080oie.15.2020.11.12.06.57.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Nov 2020 06:57:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 12 Nov 2020 06:57:21 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5] hwmon: pwm-fan: Fix RPM calculation
Message-ID: <20201112145721.GA238476@roeck-us.net>
References: <20201111164643.7087-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111164643.7087-1-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 11, 2020 at 04:46:43PM +0000, Paul Barker wrote:
> To convert the number of pulses counted into an RPM estimation, we need
> to divide by the width of our measurement interval instead of
> multiplying by it. If the width of the measurement interval is zero we
> don't update the RPM value to avoid dividing by zero.
> 
> We also don't need to do 64-bit division, with 32-bits we can handle a
> fan running at over 4 million RPM.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Applied.

Thanks,
Guenter

> ---
> 
>   Changes from v4:
> 
>     * Don't update ctx->sample_start if delta=0.
> 
>   Changes from v2:
> 
>     * Don't update the RPM value if delta=0.
> 
>  drivers/hwmon/pwm-fan.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> 
> base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index bdba2143021a..1f63807c0399 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -54,16 +54,18 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
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
> +
> +		ctx->sample_start = ktime_get();
> +	}
>  
> -	ctx->sample_start = ktime_get();
>  	mod_timer(&ctx->rpm_timer, jiffies + HZ);
>  }
>  
