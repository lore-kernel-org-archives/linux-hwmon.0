Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEABBC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 17:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239603AbiFERvj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 13:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiFERvi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 13:51:38 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5425040A19
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jun 2022 10:51:37 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r206so17012092oib.8
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jun 2022 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qcVDUPiLuSAt0kYopdfp3YMs8P4AP56SLOO9auq4zwA=;
        b=EB4vv5aeEi2pBmZyk6oesDGsg6tpTZh+qTZ/FLwRbTah3MGYTBcawtTNZNSOlX+2mB
         aAJF9YYZwk5zG1cL2TJ9NISPz210R7z00VAOi+uqDhzPvzxGnqDWC1d2TztDjyheiC2r
         1iHijMLRqSbLEwdxyRV2kGDdSfoXKBGbK0JIYquXeRTVGr1JWg2MDKGSFakWOtaSn+dN
         fN3Ovx4crmcGpTLI9RGlM+/5KkWmeFbUK1ODEh1agheBOnTsNsAAKm7AQV/u5pP7Kc4y
         JcYvKHtFKQXGKJb2K0LJOEsYt1zlaOldl7mrXj9Lzzd9s7GM1QVA/SQcDCG8Tf+viuaP
         Zr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=qcVDUPiLuSAt0kYopdfp3YMs8P4AP56SLOO9auq4zwA=;
        b=ERPNcvQsXiVT7mcEIOBZ1v/TzqHllxFZPrDS2HHWSO0KPuQJkuERxyhX23dwn+nBVT
         eumQ64iz+TCl6+h1/sQlR2DBmLw58yuEq1iWGCPQFD9gbjLRni68UzTiOnpjHjQ1TfsF
         wVXMpHssWhJcmX9QEme7gTpxSXGSqwxjsDO/ZAsxHRjFXCl+eoCd9eV+OSUoTR6/tPMR
         vsFfukMo+ZrjTncJiob2T4E15E2uNuBn+Juu2q4YXQlPMDWmlaAUh25g2E0zYCIKDBua
         y1b2B3pyRE0CUFqhc3/rjUuS/g21YtD9vMJpbkk7DJYHHnBKTG5B3oZp/R5RkPOWWVE1
         IZUw==
X-Gm-Message-State: AOAM530Ps0vtOiKnXLbnMXGHN5J9OogNeEyko4g25Nukw8yIuehY9BSq
        Kc5ITsrVt4dIVIskWVZWO/byvc3vk5Y=
X-Google-Smtp-Source: ABdhPJzFoBwVGXYbQQp6Nw1q3aI40Fj4WE1FqrpOCh82wgZP5a8HnPzP6fl9VXYOTqpGnmDh9Qc/Zw==
X-Received: by 2002:a05:6808:2308:b0:32e:9200:c3f7 with SMTP id bn8-20020a056808230800b0032e9200c3f7mr955620oib.6.1654451496708;
        Sun, 05 Jun 2022 10:51:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k17-20020a4ae291000000b0035f627ac898sm6706440oot.10.2022.06.05.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 10:51:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 10:51:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: Allow to compile ASB100 and FSCHMD on !X86
Message-ID: <20220605175135.GA3150561@roeck-us.net>
References: <20220527153445.1871086-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220527153445.1871086-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 27, 2022 at 05:34:45PM +0200, Uwe Kleine-König wrote:
> The two drivers compile just fine on ARCH=arm. Allow to select
> these drivers if COMPILE_TEST is enabled.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index f2b038fa3b84..ccd0df5e6b5e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -378,7 +378,7 @@ config SENSORS_ARM_SCPI
>  
>  config SENSORS_ASB100
>  	tristate "Asus ASB100 Bach"
> -	depends on X86 && I2C
> +	depends on (X86 || COMPILE_TEST) && I2C
>  	select HWMON_VID
>  	help
>  	  If you say yes here you get support for the ASB100 Bach sensor
> @@ -621,7 +621,7 @@ config SENSORS_MC13783_ADC
>  
>  config SENSORS_FSCHMD
>  	tristate "Fujitsu Siemens Computers sensor chips"
> -	depends on X86 && I2C
> +	depends on (X86 || COMPILE_TEST) && I2C
>  	help
>  	  If you say yes here you get support for the following Fujitsu
>  	  Siemens Computers (FSC) sensor chips: Poseidon, Scylla, Hermes,
