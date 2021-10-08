Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8C8C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 14:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19F0860FD7
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 14:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhJHOSo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 10:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhJHOSo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 10:18:44 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3717C061570
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 07:16:48 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so7352469ote.8
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mNwzWCTYLcVnxTwksJVSWxc3txmu1I0BmYiFZPWJ7oo=;
        b=SiHOfFRQ7PRD8PpM5JiKVN1MzEq8e/BEZw4sQAAdFQbPhXPFIotHcqzmCnFhSBBr09
         uGcKSJaXGEY2Q4pwAzjljp1NytIdo/p5LSBJoOz7GG38IiSTFXf0JBl7n/hzAE2VHCBs
         S/ADHe39K0jfnMrbuPyou5wdPNA3aq6yTkrnrPLKy+W30K2y+wLC/+82t3jbps5VyPhG
         ciDmxqp3cCkPGjhiJhtSB77lMp7eB+G58yTeU0Hxa3VX/Xo5gBwQ5mtpGvK5ONW08Yqp
         xzIYzzNovyEfE6xsONJBZQ68S+DFM+Vod61sIbObGOqjwJMXBcJjOAlfRyTDb/4yxa48
         Mudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=mNwzWCTYLcVnxTwksJVSWxc3txmu1I0BmYiFZPWJ7oo=;
        b=DWucHtJWzgQz64cET8aGXLmcsGTgqvZvFQ84JZHHFiwrFRhV1e1aaA/S6PK780KxaF
         C6ijKfAUBlkfQfRcq1YNlZGQTiRulX8O2pAy48s/Y1N8IGLaRMGMMBA0LNE8UQPcBfg3
         /p8H6c1W/Ew2horu7ZeYtGqXWZMtZibvPsS5xnNJk9kj9o5q7dcxPAidhO2DnpZ343Om
         mwcs2zOPTSrGqnU+laRmIcDBD2HSvwlOeXb4Rx6L2/qlBQW1/h1aRwRJtoXU5WYSMXDa
         pJbhhfjUaQvoMzO33ikod6Q5KSmBiiacvkexgGmHmxzxRoRVBL4jekQ05f13eXzd7KbY
         +kKg==
X-Gm-Message-State: AOAM532MOx2XK6J5yVzqAGsm33UL7SEpMtqUpJdV5hpZI2XxA9wmJfzQ
        NXJIkG1pA1kLL0RqOVGdags=
X-Google-Smtp-Source: ABdhPJwd7ouKhVexOa22sEhO2wXrgATV2Fg7ZUlqzwzqrRN8pl8lH10kyvV045pEvsg90XLSWBwr7A==
X-Received: by 2002:a05:6830:2429:: with SMTP id k9mr4592805ots.61.1633702608281;
        Fri, 08 Oct 2021 07:16:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2sm520229ooa.20.2021.10.08.07.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 07:16:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Oct 2021 07:16:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next 2/2] hwmon: (mlxreg-fan) Support distinctive
 names per different cooling devices
Message-ID: <20211008141646.GA2181795@roeck-us.net>
References: <20210926053541.1806937-1-vadimp@nvidia.com>
 <20210926053541.1806937-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926053541.1806937-3-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 26, 2021 at 08:35:41AM +0300, Vadim Pasternak wrote:
> Provide different names for cooling devices registration to allow
> binding each cooling devices to relevant thermal zone. Thus, specific
> cooling device can be associated with related thermal sensor by setting
> thermal cooling device type for example to "mlxreg_fan2" and passing
> this type to thermal_zone_bind_cooling_device() through 'cdev->type'.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/mlxreg-fan.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 8e5cd6991929..4a8becdb0d58 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -263,6 +263,13 @@ mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
>  	return 0;
>  }
>  
> +static char *mlxreg_fan_name[] = {
> +	"mlxreg_fan",
> +	"mlxreg_fan1",
> +	"mlxreg_fan2",
> +	"mlxreg_fan3",
> +};
> +
>  static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(fan,
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
> @@ -565,8 +572,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
>  		if (!pwm->connected)
>  			continue;
>  		pwm->fan = fan;
> -		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, "mlxreg_fan", pwm,
> -								    &mlxreg_fan_cooling_ops);
> +		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, mlxreg_fan_name[i],
> +								    pwm, &mlxreg_fan_cooling_ops);
>  		if (IS_ERR(pwm->cdev)) {
>  			dev_err(dev, "Failed to register cooling device\n");
>  			return PTR_ERR(pwm->cdev);
