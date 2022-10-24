Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF756ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Oct 2022 11:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbiJXLdf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiJXLcm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Oct 2022 07:32:42 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F193257236
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 04:32:23 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-13ba9a4430cso2762873fac.11
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2TK1gMX82Afa+rVRIXaboBZFqq9zc/a9/1nsLg3HZ8=;
        b=qh1MRAW0kpLshBoRwyAZK3a7NMTap/aHIzbv6jY6L56IVmpYC0Ja0+4vTN9jZvIjWq
         qfT3jedqLedI9oLedfezuVGrvTyf+of7HkxizZvHEapMX7QbZWIKwQzZkawliBqKlLRS
         addtnXXJgkAerqrk1mJ82v1gC2ORKvreZHjBMSPeDMJJBogxPFrvAWrSBqTdnVVtundD
         Gdgy4yAk23FYm9lSSyhdIswCR++qmvpsvusejaj8gQvm19EP3CAw1XM7t3FpdyHubaJs
         FAf/MROGc+IthWBobDM9Eg0MQ65bIxSWrotUXun819mkQYsRuXTuSeLdDReEKwpeKyR1
         McBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2TK1gMX82Afa+rVRIXaboBZFqq9zc/a9/1nsLg3HZ8=;
        b=xzgfkj09AY0baLEkaLNl8E2Qp0EaHyFevEU4Nqjjc/YkXpWCGpbIGjex27SC4atiZX
         mrFE53HCs9cnK58x8Idsbr8IjTlZPhPQlX1r/Ocj8kPQVWGlGBCvxqYAjPBOUoQjgt3J
         tpzopT01W3GSncxFpM+H+9zpn8Ty5vlMwmg+lis0IQmF0pvB9oiekjNg8lYLnv6aBvjs
         +WX0UcvucZOUmObk2tyZ45q0hZ4Rwzvsq16ioHweSOKUlvRTNh8GPQ9SS0zFHEGzEpk+
         wB2vscmrDToQOpfRYnRG9j2HcLfOdd0vI15rNGpLFHFtmiREGh8rBAuX0Z9a3dID7yEv
         IC8Q==
X-Gm-Message-State: ACrzQf2F6rg3/wBTdjwvRDhPRheJnDwabuhN79ZruCgqJqGd9sdjuQky
        6LPEWmMwYb1frkRh08rUchU=
X-Google-Smtp-Source: AMsMyM5q39m2i70WnW9IAuz9DNVOExuSM3faI/BLLC7PATGXcArEXwC1s+KZNu5vL7LdxcGMW/TGDw==
X-Received: by 2002:a05:6870:41d2:b0:13b:83c0:e38f with SMTP id z18-20020a05687041d200b0013b83c0e38fmr4383404oac.227.1666611140118;
        Mon, 24 Oct 2022 04:32:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z20-20020a056871015400b0011f22e74d5fsm13881330oab.20.2022.10.24.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:32:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 24 Oct 2022 04:32:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] hwmon/occ: OCC sensors aren't arch-specific
Message-ID: <20221024113218.GA3800308@roeck-us.net>
References: <20221024081527.3842565-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024081527.3842565-1-jk@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 24, 2022 at 04:15:27PM +0800, Jeremy Kerr wrote:
> Commit c112d75840fb ("hwmon: OCC drivers are ARM-only") made the OCC
> sensor drivers not selectable on powerpc64:
> 
>   These drivers are for a BMC inside PowerPC servers. The BMC runs on
>   ARM hardware, so only propose the drivers on this architecture, unless
>   build-testing.
> 
> ... but we now have a powerpc64 BMC (still for a powerpc64 host), so
> drop the `depends on` that excludes building for this platform.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Should the original patch be reverted instead, and should the revert
be backported ? In other words, is this a bug fix which needs to be
applied to v6.1, or is it needed for v6.2+ only ?

Thanks,
Guenter

> ---
>  drivers/hwmon/occ/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index 35a7070db827..348c21100a37 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -6,7 +6,6 @@
>  config SENSORS_OCC_P8_I2C
>  	tristate "POWER8 OCC through I2C"
>  	depends on I2C
> -	depends on ARM || ARM64 || COMPILE_TEST
>  	select SENSORS_OCC
>  	help
>  	 This option enables support for monitoring sensors provided by the
> @@ -21,7 +20,6 @@ config SENSORS_OCC_P8_I2C
>  config SENSORS_OCC_P9_SBE
>  	tristate "POWER9 OCC through SBE"
>  	depends on FSI_OCC
> -	depends on ARM || ARM64 || COMPILE_TEST
>  	select SENSORS_OCC
>  	help
>  	 This option enables support for monitoring sensors provided by the
