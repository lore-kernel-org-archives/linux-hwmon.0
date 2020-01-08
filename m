Return-Path: <SRS0=XJeT=25=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01A3C33CA2
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jan 2020 16:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6844206F0
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jan 2020 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578500015;
	bh=wfA0RgqOGZiXS9s9Zj3yv92iIIXZZ9gM5zABPwDN1jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=q1s9nlsONu8DU8jf6YDf0ORgu4KqkhaGlBAfJif/FIex2k3VOn500CVPEBrzKsG48
	 HknAsgo4muR1m0WZN9KBQuH30eSc5sX/v2N1mqUQHEIt3b2MSXjximoFQaQhnnPhmo
	 A4Y9cGv+kONrV+vGJ+BDMqcUTUWqz7m2eYdK2xbk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgAHQNf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:13:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36677 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbgAHQNf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jan 2020 11:13:35 -0500
Received: by mail-oi1-f196.google.com with SMTP id c16so3104902oic.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jan 2020 08:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6A9p8VArf1P33xI9fyJ0iKzLLi4HFeo/bhHGTXLA584=;
        b=osNbVhPOPLZ88yCdRqMd2FUTzxulcRzrM4G2wD59jWYfAb1PSp+F0JpeY32U+/uf+G
         E8ykEZyyO9Z4OblvCy+5b2QNWSvGBd7Y/Cg1FTGOl07ol83KJLhc3RiSfM9fGPvnbb8W
         NEdrUAPcsyU1KeE6q94512FIQH535h6zX3z0U/7HrltzS++yuOT/bcl22UzpA9EtvEQa
         1Fd6q4prIdmjGhd6cg5e74gIt7jIJ4MpMTzXN6/oDSDSo0r3IVqwHDa7Bukv/976d4kV
         y860s2AkvRyzuV/gPMjSHXk57oQJD6MRQ2+xK360ZTdVH5DSWkRdUvE3u2jVCAZ2K30T
         m3hg==
X-Gm-Message-State: APjAAAVzAKQ4ErRGdNN1BCcqYl11To6FQalOHWqtvI1crmJJwNWiBWqx
        wgGQ//JL1JkaltTN5iP4OtkQHDU=
X-Google-Smtp-Source: APXvYqw8KwB9cFyiUN8qPLVQeNO6aRadV4ZMPu+Ar6f+PvRZZVBo8KhrtJpwQfy6P3NTXCBkpdPBJg==
X-Received: by 2002:aca:f5c1:: with SMTP id t184mr3755023oih.23.1578500013565;
        Wed, 08 Jan 2020 08:13:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e6sm1225977otl.12.2020.01.08.08.13.32
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:13:32 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:13:31 -0600
Date:   Wed, 8 Jan 2020 10:13:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to stop fan on shutdown
Message-ID: <20200108161331.GA18546@bogus>
References: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
 <1577023823-9615-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577023823-9615-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Dec 22, 2019 at 11:10:22PM +0900, Akinobu Mita wrote:
> The pwm-fan driver leaves the fun running when shutting down the system.
> (On the other hand the gpio-fan driver stops it.)

Seemms like we should have consistent behavior independent of what the 
underlying implementation uses. Is there actually a case you'd want to 
leave the fan on? It seems strange to disable in suspend and leave on in 
shutdown.

Wouldn't the shutdown state depend if the PWM off state is high or low? 
IIRC, i.MX PWM has a quirk that the PWM disabled state is high. Doesn't 
it also depend on what the PWM driver does in shutdown?

Rob

> 
> This adds an optional property "disable-state-shutdown" in case someone
> wants to stop the fun running when shutting down the system.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Kamil Debski <kamil@wypas.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/hwmon/pwm-fan.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 42ffd2e..8775d37 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -33,6 +33,7 @@ struct pwm_fan_ctx {
>  	u8 pulses_per_revolution;
>  	ktime_t sample_start;
>  	struct timer_list rpm_timer;
> +	bool disable_state_shutdown;
>  
>  	unsigned int pwm_value;
>  	unsigned int pwm_fan_state;
> @@ -292,6 +293,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  	mutex_init(&ctx->lock);
>  
> +	ctx->disable_state_shutdown =
> +		of_property_read_bool(dev->of_node, "disable-state-shutdown");
> +
>  	ctx->pwm = devm_of_pwm_get(dev, dev->of_node, NULL);
>  	if (IS_ERR(ctx->pwm)) {
>  		ret = PTR_ERR(ctx->pwm);
> @@ -390,8 +394,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int pwm_fan_suspend(struct device *dev)
> +static int pwm_fan_disable(struct device *dev)
>  {
>  	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
>  	struct pwm_args args;
> @@ -418,6 +421,22 @@ static int pwm_fan_suspend(struct device *dev)
>  	return 0;
>  }
>  
> +static void pwm_fan_shutdown(struct platform_device *pdev)
> +{
> +	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
> +
> +	if (!ctx->disable_state_shutdown)
> +		return;
> +
> +	pwm_fan_disable(&pdev->dev);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int pwm_fan_suspend(struct device *dev)
> +{
> +	return pwm_fan_disable(dev);
> +}
> +
>  static int pwm_fan_resume(struct device *dev)
>  {
>  	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> @@ -455,6 +474,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_fan_match);
>  
>  static struct platform_driver pwm_fan_driver = {
>  	.probe		= pwm_fan_probe,
> +	.shutdown	= pwm_fan_shutdown,
>  	.driver	= {
>  		.name		= "pwm-fan",
>  		.pm		= &pwm_fan_pm,
> -- 
> 2.7.4
> 
