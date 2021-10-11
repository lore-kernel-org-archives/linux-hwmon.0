Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB0DC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 14:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1C3760F38
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 14:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhJKOgY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbhJKOgY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 10:36:24 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A033C06161C
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 07:34:24 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id w9-20020a4adec9000000b002b696945457so4938184oou.10
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Oct 2021 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vyQAJNQV7vGV7usTQ0OI6uuDToowEWKPWUrEgDT0Ejc=;
        b=gqMdrIXUs8RNnK18ExMevkIenY+Zf5RpXDblubN9mSFAvC6FxO7YoYx7Gz22e81Hc9
         zrvBXVKx4mnkeV+FdoMIfRvlSFNwD2jonPQnuTL9mYW5DhRwa/4M3PRWGAVxBnIsXPe6
         Rv9RgiF5gNffW8aXky8MaFwxz0etE/c9NalQTukMLXclr9jPL7F2f84GgyxawTdBH1MC
         EtkPW5k0JYIWC4Ez2TnS3VoG4ZVaXYprlLTgo2lcYxYlhUfUO7pPNEEtyPBqIusZNVSN
         NzxLY39KWFC5Fk1uYST1PHP/cKFEe/6N32RKveYaveaCdE4jfdeZCbYe65rnAQalIZWt
         D6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=vyQAJNQV7vGV7usTQ0OI6uuDToowEWKPWUrEgDT0Ejc=;
        b=bjVbcSCAQADuGROFpeGR5DDzPEp1SgMFHrV9lnHegzJevGuV6uspdOlDzZst83UZrY
         mC3+Wp6ZN4Qgvb/2vQHDe7f7URiM3H/GTUiRBrwHTazOURUQi3ZT2z5vjeMRgThADrpc
         wiTMxecRf8FmVHIfZDkjo6F5ess9gRR/9CLkEcs+4N3Ji20PK8lBcfyae14koXSsy+n5
         vsdSoqVNUgFnysI0Z3w7ruSsf0x3+EvsbvxZpUU/QgNuhMcpbasavo9Bo0DMdkNT+Qlr
         vU4fW9GjGia0mOzBW5zTcfLQQscPqd7YkJrLgMs9tP27aGIo2dMqMLfDDAVoyvEepxDq
         Ov2A==
X-Gm-Message-State: AOAM53125Ik6ndxkxB1kxwmeYuu8hghEHoUO8r3XUbwtOxBSxg9VFwMU
        8TG8CKebM9wSL4FzSExmD/SYk+Vyn/o=
X-Google-Smtp-Source: ABdhPJwHPQf2dkAa/HjLjkW0OqQ76Hn+msI/3VUPOJPy+37kVUoVFrRNogXGi8g2EUps/rpqAcyQPw==
X-Received: by 2002:a4a:b64b:: with SMTP id f11mr19299992ooo.18.1633962863461;
        Mon, 11 Oct 2021 07:34:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q129sm341432oig.2.2021.10.11.07.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 07:34:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 11 Oct 2021 07:34:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Message-ID: <20211011143421.GA2374570@roeck-us.net>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923023448.4190-1-akinobu.mita@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 23, 2021 at 11:34:47AM +0900, Akinobu Mita wrote:
> This adds an optional property "retain-state-shutdown" as requested by
> Billy Tsai.
> 
> Billy said:
>  "Our platform is BMC that will use a PWM-FAN driver to control the fan
>  on the managed host. In our case, we do not want to stop the fan when
>  the BMC is reboot, which may cause the temperature of the managed host
>  not to be lowered."
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

For my reference (waiting for DT property approval):

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/hwmon/pwm-fan.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 17518b4cab1b..1ea0d0562c28 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -38,6 +38,7 @@ struct pwm_fan_ctx {
>  	struct pwm_fan_tach *tachs;
>  	ktime_t sample_start;
>  	struct timer_list rpm_timer;
> +	bool retain_state_shutdown;
>  
>  	unsigned int pwm_value;
>  	unsigned int pwm_fan_state;
> @@ -312,6 +313,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  	mutex_init(&ctx->lock);
>  
> +	ctx->retain_state_shutdown =
> +		of_property_read_bool(dev->of_node, "retain-state-shutdown");
> +
>  	ctx->pwm = devm_of_pwm_get(dev, dev->of_node, NULL);
>  	if (IS_ERR(ctx->pwm))
>  		return dev_err_probe(dev, PTR_ERR(ctx->pwm), "Could not get PWM\n");
> @@ -492,7 +496,10 @@ static int pwm_fan_disable(struct device *dev)
>  
>  static void pwm_fan_shutdown(struct platform_device *pdev)
>  {
> -	pwm_fan_disable(&pdev->dev);
> +	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
> +
> +	if (!ctx->retain_state_shutdown)
> +		pwm_fan_disable(&pdev->dev);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
