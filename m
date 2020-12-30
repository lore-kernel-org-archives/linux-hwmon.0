Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AFBC433DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23DA420782
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgL3QTF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Dec 2020 11:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgL3QTF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 11:19:05 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AC4C06179C
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:18:24 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id d189so19087626oig.11
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aTqx2hUPCwh//oTxcsn+/X2wBX2KjVvnDy/Er/XdGuA=;
        b=nfb2JFiPyMVKIVADOdN0coGTRM2nXveBgAQAhjOdIKusvwdGySOFjKGudC42buOH/T
         U5WEGjDP7R8dp9szTXILPOHZi6k568yu5fmYsJXIvN1kpKbOEkw1OMhvt+hoVqPhXy2g
         LUkZDuwAfr75ProUOLhDD4gC2PvWLIiAOqzE/YOkkVfqCUOo4NZV+BPtw0eWQjwHdPtX
         ZxcdP+2g1kaMGtEEB8F8iZEwyFS02DrCsWn2qAnr8CZtom7hBGyVqVkp8RjMbEnaLy4V
         2FnnA+RTB2oMdyCz+VaknucgkoFA8KZna9RF6ypzgf1iH7G368LkXkaTxvyW5M7xVHS1
         6GQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=aTqx2hUPCwh//oTxcsn+/X2wBX2KjVvnDy/Er/XdGuA=;
        b=Lt04LXNn6629gDdYthPzspuKrWstGOSy7fDNyn05YiuwZ8JbqGEsUF8jwFEObhWKa1
         jdfYgn24X0CiONayLe6XsR8Uu/yZdSm/Iw4miYjKrWieiRiN6vQh95Zs0H2in9kTnb+G
         7LPx+bfRLvnbsMh64j8XI0Dl5HVNiSFQGApMI3p05kpJkZmpufMdc62V53QnQ0+e6l1d
         tqNahbkwayg2vXp5mrdrydVLfkYxaRv+60Zk8H4KqLcdVFIZ2+PLjRG2NnvncdqdLlav
         PH7X4D5u/Cup8q6dvzh2DOXUhfkFlqlNbFiY01WVVa0hq/ODF8k9KHtKCJCTWdQesj//
         DlzA==
X-Gm-Message-State: AOAM532v2lRY24uVxDGb/0Z3h+4SMQPOSPUJh0hC0/H4fHHYsy0kGkOm
        ttL8IhePx7onnPHlfND6qzY=
X-Google-Smtp-Source: ABdhPJwNFxjsVQRKDvidSr6D0NBM+PnwzTNLyYv/+5bwS6y7xQSEaX5awrK0jI/CGDEc3xMQNiuIlg==
X-Received: by 2002:aca:4355:: with SMTP id q82mr5594940oia.132.1609345104191;
        Wed, 30 Dec 2020 08:18:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5sm10537447otj.57.2020.12.30.08.18.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 08:18:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Dec 2020 08:18:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: pwm-fan: Support multiple fan tachometers
Message-ID: <20201230161822.GA102152@roeck-us.net>
References: <20201212195008.6036-1-pbarker@konsulko.com>
 <20201212195008.6036-3-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212195008.6036-3-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Dec 12, 2020 at 07:50:08PM +0000, Paul Barker wrote:
> The pwm-fan driver is extended to support multiple fan tachometer
> signals connected to GPIO inputs. This is intended to support the case
> where a single PWM output signal is routed to multiple fans, each of
> which have a tachometer output connected back to a GPIO pin.
> 
> The number of fan tachometer inputs is determined by the number of
> interrupt sources configured for the pwm-fan device. The number of
> pulses-per-revolution entries should match the number of interrupt
> sources so that each input has a value assigned.
> 
> The fan tachometer measurements are exposed as sysfs files fan1_input,
> fan2_input, etc up to the number of configured inputs.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pwm-fan.c | 91 ++++++++++++++++++++++++-----------------
>  1 file changed, 53 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 4a7f0e87b08f..cc64bae0ffa8 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -33,7 +33,8 @@ struct pwm_fan_ctx {
>  	struct pwm_device *pwm;
>  	struct regulator *reg_en;
>  
> -	struct pwm_fan_tach *tach;
> +	int tach_count;
> +	struct pwm_fan_tach *tachs;
>  	ktime_t sample_start;
>  	struct timer_list rpm_timer;
>  
> @@ -44,6 +45,7 @@ struct pwm_fan_ctx {
>  	struct thermal_cooling_device *cdev;
>  
>  	struct hwmon_chip_info info;
> +	struct hwmon_channel_info fan_channel;
>  };
>  
>  static const u32 pwm_fan_channel_config_pwm[] = {
> @@ -56,16 +58,6 @@ static const struct hwmon_channel_info pwm_fan_channel_pwm = {
>  	.config = pwm_fan_channel_config_pwm,
>  };
>  
> -static const u32 pwm_fan_channel_config_fan[] = {
> -	HWMON_F_INPUT,
> -	0
> -};
> -
> -static const struct hwmon_channel_info pwm_fan_channel_fan = {
> -	.type = hwmon_fan,
> -	.config = pwm_fan_channel_config_fan,
> -};
> -
>  /* This handler assumes self resetting edge triggered interrupt. */
>  static irqreturn_t pulse_handler(int irq, void *dev_id)
>  {
> @@ -79,15 +71,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
>  static void sample_timer(struct timer_list *t)
>  {
>  	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
> -	struct pwm_fan_tach *tach = ctx->tach;
>  	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
> -	int pulses;
> +	int i;
>  
>  	if (delta) {
> -		pulses = atomic_read(&tach->pulses);
> -		atomic_sub(pulses, &tach->pulses);
> -		tach->rpm = (unsigned int)(pulses * 1000 * 60) /
> -			(tach->pulses_per_revolution * delta);
> +		for (i = 0; i < ctx->tach_count; i++) {
> +			struct pwm_fan_tach *tach = &ctx->tachs[i];
> +			int pulses;
> +
> +			pulses = atomic_read(&tach->pulses);
> +			atomic_sub(pulses, &tach->pulses);
> +			tach->rpm = (unsigned int)(pulses * 1000 * 60) /
> +				(tach->pulses_per_revolution * delta);
> +		}
>  
>  		ctx->sample_start = ktime_get();
>  	}
> @@ -157,7 +153,7 @@ static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
>  		return 0;
>  
>  	case hwmon_fan:
> -		*val = ctx->tach->rpm;
> +		*val = ctx->tachs[channel].rpm;
>  		return 0;
>  
>  	default:
> @@ -304,8 +300,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	struct device *hwmon;
>  	int ret;
>  	struct pwm_state state = { };
> -	int tach_count;
>  	const struct hwmon_channel_info **channels;
> +	u32 *fan_channel_config;
> +	int channel_count = 1;	/* We always have a PWM channel. */
> +	int i;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -354,29 +352,41 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	tach_count = platform_irq_count(pdev);
> -	if (tach_count < 0)
> -		return dev_err_probe(dev, tach_count,
> +	ctx->tach_count = platform_irq_count(pdev);
> +	if (ctx->tach_count < 0)
> +		return dev_err_probe(dev, ctx->tach_count,
>  				     "Could not get number of fan tachometer inputs\n");
> +	dev_dbg(dev, "%d fan tachometer inputs\n", ctx->tach_count);
>  
> -	channels = devm_kcalloc(dev, tach_count + 2,
> +	if (ctx->tach_count) {
> +		channel_count++;	/* We also have a FAN channel. */
> +
> +		ctx->tachs = devm_kcalloc(dev, ctx->tach_count,
> +					  sizeof(struct pwm_fan_tach),
> +					  GFP_KERNEL);
> +		if (!ctx->tachs)
> +			return -ENOMEM;
> +
> +		ctx->fan_channel.type = hwmon_fan;
> +		fan_channel_config = devm_kcalloc(dev, ctx->tach_count + 1,
> +						  sizeof(u32), GFP_KERNEL);
> +		if (!fan_channel_config)
> +			return -ENOMEM;
> +		ctx->fan_channel.config = fan_channel_config;
> +	}
> +
> +	channels = devm_kcalloc(dev, channel_count + 1,
>  				sizeof(struct hwmon_channel_info *), GFP_KERNEL);
>  	if (!channels)
>  		return -ENOMEM;
>  
>  	channels[0] = &pwm_fan_channel_pwm;
>  
> -	if (tach_count > 0) {
> -		struct pwm_fan_tach *tach;
> +	for (i = 0; i < ctx->tach_count; i++) {
> +		struct pwm_fan_tach *tach = &ctx->tachs[i];
>  		u32 ppr = 2;
>  
> -		tach = devm_kzalloc(dev, sizeof(struct pwm_fan_tach),
> -					 GFP_KERNEL);
> -		if (!tach)
> -			return -ENOMEM;
> -		ctx->tach = tach;
> -
> -		tach->irq = platform_get_irq(pdev, 0);
> +		tach->irq = platform_get_irq(pdev, i);
>  		if (tach->irq == -EPROBE_DEFER)
>  			return tach->irq;
>  		if (tach->irq > 0) {
> @@ -390,22 +400,27 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> -		of_property_read_u32(dev->of_node,
> -				     "pulses-per-revolution",
> -				     &ppr);
> +		of_property_read_u32_index(dev->of_node,
> +					   "pulses-per-revolution",
> +					   i,
> +					   &ppr);
>  		tach->pulses_per_revolution = ppr;
>  		if (!tach->pulses_per_revolution) {
>  			dev_err(dev, "pulses-per-revolution can't be zero.\n");
>  			return -EINVAL;
>  		}
>  
> -		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
> -			tach->irq, tach->pulses_per_revolution);
> +		fan_channel_config[i] = HWMON_F_INPUT;
> +
> +		dev_dbg(dev, "tach%d: irq=%d, pulses_per_revolution=%d\n",
> +			i, tach->irq, tach->pulses_per_revolution);
> +	}
>  
> +	if (ctx->tach_count > 0) {
>  		ctx->sample_start = ktime_get();
>  		mod_timer(&ctx->rpm_timer, jiffies + HZ);
>  
> -		channels[1] = &pwm_fan_channel_fan;
> +		channels[1] = &ctx->fan_channel;
>  	}
>  
>  	ctx->info.ops = &pwm_fan_hwmon_ops;
