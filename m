Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC23C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AE9D20780
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgL3QSu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Dec 2020 11:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgL3QSu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 11:18:50 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B77CC06179B
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:18:10 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id x23so3798473oop.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Niq9uGw2Gn+HoflvSpDW2ElojGvxeblOZnC6RN++OyU=;
        b=q7zU+MYICZG7TD1ptEIN+vlndPcRR8FPMXcWooC0eMFCfLosde948NfftELX1GATKr
         fon0kWb85MEpi27g7hV620V9Gni8LQkMoe9Id+i10Ee1Ww0s7OHvfXSj5XJ4f7diuGSm
         AuiTHdzpKgCNyZdMPiwQCcr773sJHiIzVLeQJFn11H8z1uac2+MIKT/hTacmmx4AO83p
         D4bB6LtPHmfq0LMJFziwUDBz57nSR4frALnnHA1o3F0G7xhvvyB6BB8Neu10mK3rkn08
         ej40aDmVz1Mv7EjGI4e4yzDynu/xVvUsKSkCSsa1TEEJAQ4WWNo/mEipgsQ5awqIPzJ/
         B7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Niq9uGw2Gn+HoflvSpDW2ElojGvxeblOZnC6RN++OyU=;
        b=n3ckh85o5tLzsB4nKfFb2jOnEJk1fk0mPj+/2eFVm7NsK3h0ZpHBXHeUu4w48i7HYz
         yTCkV2gk3zI1lf3jwcOmrRTDgmYyv/+IdrX/k64YljvzU2CXLYHeP1pMn8lro57eURur
         by9fj4wu1UiRSor9juev4Nht/KbAv7IvkPpEZ4FbnD4Lh+LqemfXM8CEACHm3vVZD0rH
         nWcEBqGh/ZtLVMA/RMnjh4fB+BiZvOGGVL9qBVV/41nOaJKNABiOHsCue2vVAlDQ3CfH
         aEKhEvII5aMl6gDj4a5AXYq4ayVE67DrgnORtKLtfw/FhDZsi/ORi7eNoHrFvylLMqFS
         COhA==
X-Gm-Message-State: AOAM533f48eHfEcxjDFm5rrOJv2NBJ5rcNiS6l2mmRz0wQ3yCaBBGKXn
        +TDm+JvwvTBqXmbORRR12XA=
X-Google-Smtp-Source: ABdhPJz0q5Cb37xNEryx2woUa57cujZB8Tr+OyTJY4hyOptFzWhHweIL8grUyS3ugW3Jap4Xzcaj2Q==
X-Received: by 2002:a4a:b987:: with SMTP id e7mr19188463oop.92.1609345089505;
        Wed, 30 Dec 2020 08:18:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a52sm9487234otc.46.2020.12.30.08.18.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 08:18:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Dec 2020 08:18:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: pwm-fan: Store tach data separately
Message-ID: <20201230161807.GA102122@roeck-us.net>
References: <20201212195008.6036-1-pbarker@konsulko.com>
 <20201212195008.6036-2-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212195008.6036-2-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Dec 12, 2020 at 07:50:07PM +0000, Paul Barker wrote:
> The data for the (optional) fan tachometer input is moved to a separate
> structure which is only allocated if an input is actually configured.
> 
> After this change the pulse IRQ handler takes a pointer to the
> tachometer data structure instead of the whole device context.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pwm-fan.c | 52 +++++++++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 777439f48c14..4a7f0e87b08f 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -21,15 +21,19 @@
>  
>  #define MAX_PWM 255
>  
> +struct pwm_fan_tach {
> +	int irq;
> +	atomic_t pulses;
> +	unsigned int rpm;
> +	u8 pulses_per_revolution;
> +};
> +
>  struct pwm_fan_ctx {
>  	struct mutex lock;
>  	struct pwm_device *pwm;
>  	struct regulator *reg_en;
>  
> -	int irq;
> -	atomic_t pulses;
> -	unsigned int rpm;
> -	u8 pulses_per_revolution;
> +	struct pwm_fan_tach *tach;
>  	ktime_t sample_start;
>  	struct timer_list rpm_timer;
>  
> @@ -65,9 +69,9 @@ static const struct hwmon_channel_info pwm_fan_channel_fan = {
>  /* This handler assumes self resetting edge triggered interrupt. */
>  static irqreturn_t pulse_handler(int irq, void *dev_id)
>  {
> -	struct pwm_fan_ctx *ctx = dev_id;
> +	struct pwm_fan_tach *tach = dev_id;
>  
> -	atomic_inc(&ctx->pulses);
> +	atomic_inc(&tach->pulses);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -75,14 +79,15 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
>  static void sample_timer(struct timer_list *t)
>  {
>  	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> +	struct pwm_fan_tach *tach = ctx->tach;
>  	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
>  	int pulses;
>  
>  	if (delta) {
> -		pulses = atomic_read(&ctx->pulses);
> -		atomic_sub(pulses, &ctx->pulses);
> -		ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
> -			(ctx->pulses_per_revolution * delta);
> +		pulses = atomic_read(&tach->pulses);
> +		atomic_sub(pulses, &tach->pulses);
> +		tach->rpm = (unsigned int)(pulses * 1000 * 60) /
> +			(tach->pulses_per_revolution * delta);
>  
>  		ctx->sample_start = ktime_get();
>  	}
> @@ -152,7 +157,7 @@ static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
>  		return 0;
>  
>  	case hwmon_fan:
> -		*val = ctx->rpm;
> +		*val = ctx->tach->rpm;
>  		return 0;
>  
>  	default:
> @@ -362,14 +367,21 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	channels[0] = &pwm_fan_channel_pwm;
>  
>  	if (tach_count > 0) {
> +		struct pwm_fan_tach *tach;
>  		u32 ppr = 2;
>  
> -		ctx->irq = platform_get_irq(pdev, 0);
> -		if (ctx->irq == -EPROBE_DEFER)
> -			return ctx->irq;
> -		if (ctx->irq > 0) {
> -			ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
> -					       pdev->name, ctx);
> +		tach = devm_kzalloc(dev, sizeof(struct pwm_fan_tach),
> +					 GFP_KERNEL);
> +		if (!tach)
> +			return -ENOMEM;
> +		ctx->tach = tach;
> +
> +		tach->irq = platform_get_irq(pdev, 0);
> +		if (tach->irq == -EPROBE_DEFER)
> +			return tach->irq;
> +		if (tach->irq > 0) {
> +			ret = devm_request_irq(dev, tach->irq, pulse_handler, 0,
> +					       pdev->name, tach);
>  			if (ret) {
>  				dev_err(dev,
>  					"Failed to request interrupt: %d\n",
> @@ -381,14 +393,14 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  		of_property_read_u32(dev->of_node,
>  				     "pulses-per-revolution",
>  				     &ppr);
> -		ctx->pulses_per_revolution = ppr;
> -		if (!ctx->pulses_per_revolution) {
> +		tach->pulses_per_revolution = ppr;
> +		if (!tach->pulses_per_revolution) {
>  			dev_err(dev, "pulses-per-revolution can't be zero.\n");
>  			return -EINVAL;
>  		}
>  
>  		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
> -			ctx->irq, ctx->pulses_per_revolution);
> +			tach->irq, tach->pulses_per_revolution);
>  
>  		ctx->sample_start = ktime_get();
>  		mod_timer(&ctx->rpm_timer, jiffies + HZ);
