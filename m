Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE76C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 18:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIYSuA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 14:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiIYSt6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 14:49:58 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3971A3B2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 11:49:57 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id s90-20020a17090a2f6300b00203a685a1aaso4864901pjd.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=EOidtejSwQQXBCOxPPbEYodcTu43Rvf/K8YTaw3HRYc=;
        b=N97+9+z6yrfcRPJTGkrUhe0+230Fx5izS5xyayX6YaJXGK/ZOvlFAg5BjoAJ3TavKz
         2LjFVPPu4acu0UlUeka7xWgP27y43PgvGuktoQKdzG+0YcD8UQgZz7f5GcTuos6nnAtC
         +qxvOIo29m73nWBJbbTaSvyIFiX+vG9vGNpiCUTPAFvMs+RscZil7/aLcqF0mkx4iwYW
         XaO3+1YnWN+h0TLkX/icDlHloJAZnBfgXfimbsFWZexN/s3/Efnp5K98MnV5QT5gvBbY
         fDXK4orkyXvFazPtqpkLbrx4EpdpZyJ9nwqWtA4bz7tl/CeFCHHt3u3l0xQIPa35cw2A
         Bfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EOidtejSwQQXBCOxPPbEYodcTu43Rvf/K8YTaw3HRYc=;
        b=eQLPMApmy6O/JVR8h/jlS4OAU8yt1DERWgdJ0m1FJ5IunzKnFWH4BcwGL3t2XVmIIl
         KKj1lRdTHtggMO9/XWM0k82xcQxZ08GYtqwndwfjI3Ahca5i4vgHKNCltZS3/PuVrVPV
         8QacRcktyP2kzPyFHz4T1evkc5WOPKHw+d4OGk4M+AsNtuGF3POLxh/NJWb2DAExI6cC
         XYhtzf8sirhKPgplN9bIYtv4DlKLDkvgh4lz7N2ZIgrWZ0OGysA7+oxs7l3iygxTcAor
         B/O/Sdbyq8mla9WyvQSM1A6kHcKyYaOUGCyZ2+b2sZDjBaR7Hfop5hWHxawMjb1vrTlD
         cWfQ==
X-Gm-Message-State: ACrzQf2ZD3e/DzAPWwfQCIdBPd2GdFI7IJPIaqRGGI6CnVtUFpwyaec+
        lqt16MA1Vm1rV3fXJDlyTjc=
X-Google-Smtp-Source: AMsMyM6KfOpMVK1K8jWbxiWMpNYHq94OS0DQcS/1F5nso3AMIaYnvC33v4A9CQptbrR2TcLeuBNxNw==
X-Received: by 2002:a17:90b:1642:b0:203:1630:c54d with SMTP id il2-20020a17090b164200b002031630c54dmr31874884pjb.122.1664131797030;
        Sun, 25 Sep 2022 11:49:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 143-20020a621695000000b0052d2b55be32sm10544573pfw.171.2022.09.25.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 11:49:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Sep 2022 11:49:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Roland Stigge <stigge@antcom.de>,
        =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
        Ninad Malwade <nmalwade@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 05/18] hwmon: (gpio-fan) Switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Message-ID: <20220925184954.GA2856297@roeck-us.net>
References: <20220925172759.3573439-1-jic23@kernel.org>
 <20220925172759.3573439-6-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220925172759.3573439-6-jic23@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 25, 2022 at 06:27:46PM +0100, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> These newer PM macros allow the compiler to see what code it can remove
> if !CONFIG_PM_SLEEP. This allows the removal of messy #ifdef barriers whilst
> achieving the same result.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

This patch resulted in build errors.

Building m68k:allmodconfig ... failed
--------------
Error log:
drivers/hwmon/gpio-fan.c: In function 'gpio_fan_suspend':
drivers/hwmon/gpio-fan.c:565:27: error: 'struct gpio_fan_data' has no member named 'resume_speed'

There was an #ifdef CONFIG_PM_SLEEP in struct gpio_fan_data which had
to be dropped. I took care of that.

Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index fbf3f5a4ecb6..b05aedd20b4f 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -557,7 +557,6 @@ static void gpio_fan_shutdown(struct platform_device *pdev)
>  		set_fan_speed(fan_data, 0);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int gpio_fan_suspend(struct device *dev)
>  {
>  	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
> @@ -580,18 +579,14 @@ static int gpio_fan_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
> -#define GPIO_FAN_PM	(&gpio_fan_pm)
> -#else
> -#define GPIO_FAN_PM	NULL
> -#endif
> +static DEFINE_SIMPLE_DEV_PM_OPS(gpio_fan_pm, gpio_fan_suspend, gpio_fan_resume);
>  
>  static struct platform_driver gpio_fan_driver = {
>  	.probe		= gpio_fan_probe,
>  	.shutdown	= gpio_fan_shutdown,
>  	.driver	= {
>  		.name	= "gpio-fan",
> -		.pm	= GPIO_FAN_PM,
> +		.pm	= pm_sleep_ptr(&gpio_fan_pm),
>  		.of_match_table = of_match_ptr(of_gpio_fan_match),
>  	},
>  };
