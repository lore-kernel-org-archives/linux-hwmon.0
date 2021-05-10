Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAF2C43461
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CBB060FE4
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhEJPix (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 11:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235856AbhEJPhw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 11:37:52 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1DBC06138E
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:36:45 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so3558892ool.1
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dj4AbxGKoTpbO/GoOWWdHrDeeTZ/LTM+1aUGonG9gXs=;
        b=sSLVzsm7c8np1NXmEJUct38MvrYXSuJcAku2AwVmMcwYO5ZkiFXnJPnuRuB3QxlDq1
         mf4Dk6g9q5P94mHozLZZQF29YV98ts17eAQRQCIfNEHxXjlpvDMDCsABzvonJHFiNZxC
         Ya9rgqHhBwssYNk8hooUeA5bXgjYuQnIv8vVl0DV5n3YPRryviWWA/S2whsQ6NuwaV+z
         KmXQsfSt5lJ06XyfuhooZYHRBlqnomed3e5EJAE1gB1FK90y/ylt9ffTt6WpnX+Qylht
         xk+YSGksG9fc+GCUeUyZVdR/KoVJYU/o06NgjfAIAW6ihj0bRF5U1s7kEbbszyYITEVc
         JJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=dj4AbxGKoTpbO/GoOWWdHrDeeTZ/LTM+1aUGonG9gXs=;
        b=MzDeatGP/Z9JqnJZ0QAURNMAL31aOSDPf50v2cZfErLFxhOcorIapgiNUBiW+nbe1B
         /BAAcDR0iWKFoOgoYjvLAnrfyzCDkrHS7NyU7A6JMgjaMhkPT400yQmxD86FvnHD7kRP
         FdQyc5sqZGrAYX3H7dSCeR+5FDgBc3wBXjNtwItF0KJ7uO3ZBnT6Xvh58XiqP9ZWAdAC
         xkqUv8dNFBHZxm+bQ4Z1S7V2hyhzLgJGsMAqCQiluEHOkB3Duqd/MhF4ZioVg4stpzlR
         lJsPYWAgogo+MePwfFazWU3MsK2WklHoakNYe/cF0DWuZkFMennjqjxhNTkfUua065AR
         mzjg==
X-Gm-Message-State: AOAM533yBc+WTvTnhWSmeJTF6J9hLJjHYiNY5R4eyQ0+LquVx/eSjF61
        Im6raSJCgFKF6BFBXjM4Gd0=
X-Google-Smtp-Source: ABdhPJz6ac+f90OE5FUSQyC9oWtq072llvcxlV79Zft8QYMDsFG139ze7BgDnJgZyk4jguwc5kO8zQ==
X-Received: by 2002:a4a:e512:: with SMTP id r18mr19244315oot.40.1620661005184;
        Mon, 10 May 2021 08:36:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u207sm2658163oie.56.2021.05.10.08.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:36:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 08:36:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     hdegoede@redhat.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2 4/4] hwmon: (sch56xx-common) Simplify
 sch56xx_device_add
Message-ID: <20210510153643.GD3212231@roeck-us.net>
References: <20210508131457.12780-1-W_Armin@gmx.de>
 <20210508131457.12780-5-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508131457.12780-5-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 08, 2021 at 03:14:57PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use platform_device_register_simple() instead of
> manually calling platform_device_alloc()/platform_device_add().
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/sch56xx-common.c | 27 ++++-----------------------
>  1 file changed, 4 insertions(+), 23 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
> index 180801f80118..5307fda73e70 100644
> --- a/drivers/hwmon/sch56xx-common.c
> +++ b/drivers/hwmon/sch56xx-common.c
> @@ -506,37 +506,18 @@ static int __init sch56xx_device_add(int address, const char *name)
>  	struct resource res = {
>  		.start	= address,
>  		.end	= address + REGION_LENGTH - 1,
> +		.name	= name,
>  		.flags	= IORESOURCE_IO,
>  	};
>  	int err;
> 
> -	sch56xx_pdev = platform_device_alloc(name, address);
> -	if (!sch56xx_pdev)
> -		return -ENOMEM;
> -
> -	res.name = sch56xx_pdev->name;
>  	err = acpi_check_resource_conflict(&res);
>  	if (err)
> -		goto exit_device_put;
> -
> -	err = platform_device_add_resources(sch56xx_pdev, &res, 1);
> -	if (err) {
> -		pr_err("Device resource addition failed\n");
> -		goto exit_device_put;
> -	}
> -
> -	err = platform_device_add(sch56xx_pdev);
> -	if (err) {
> -		pr_err("Device addition failed\n");
> -		goto exit_device_put;
> -	}
> -
> -	return 0;
> +		return err;
> 
> -exit_device_put:
> -	platform_device_put(sch56xx_pdev);
> +	sch56xx_pdev = platform_device_register_simple(name, -1, &res, 1);
> 
> -	return err;
> +	return PTR_ERR_OR_ZERO(sch56xx_pdev);
>  }
> 
>  static int __init sch56xx_init(void)
