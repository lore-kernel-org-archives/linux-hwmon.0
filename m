Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E87C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5D5F61409
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhEJPiv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 11:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235233AbhEJPho (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 11:37:44 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCDFC06138D
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:36:25 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id z3so14928482oib.5
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BYCcHGaEuVF3Fq1InwW4d4iVQs9Qtb4O3NNfFiMglrY=;
        b=RhceWzmAEHYdi2NvYBCs38gU4W6tdYzJgjw3ASZc7GSm6eH27ZhQJQzwuvslVQfXm5
         o88PDIJBfK2fS8jSBieBwCMZopYaRJpoSAmHr1JoYYgfr74uA7wxLDrPCFaWjq37dD0Z
         jdAiNlL99Di6R5pWgOVeIyC396Vh8LPRT5YAEWC81/u/y/oObaBWKYdlPWeeFhxbqMQG
         Bn5B/YxGPyb0hJ7zojLE9XWbdI6sYRAgR4VOWIj8xAZpw+XCaVLTbNqgy/eDTfq8PX0A
         iLGC6M5668NxpD51jDR9ZEhgdb7mFp4fXbN/ZtA5mItsk5D+HAVgVQRKVHNNk4dqoMie
         SFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=BYCcHGaEuVF3Fq1InwW4d4iVQs9Qtb4O3NNfFiMglrY=;
        b=Cvenmt7T/AhS9boDbyQFuc2CqNczBU2UUV2qgTbMpgn7HfRCSUdwwtgyAiPg8DJvxA
         84CGerfDNlvKXjKHxURzk4uc1EojWP5Guul7cTQEn6IsBh/2zMB+P1TR7SYwpAvRka2c
         eQiGB27sn0eZl0Ex/ILLKWbD19e0296ovE18huLvGiew+HN0kv5B5kTnitodJX2OdWtz
         OQY0O+RBp52bv1sTmR3nBmb0e61O5aNN3f2xmsKEbCtpaMuQldEHMg3esj2Lx+pa2vWP
         gd0apW+d+cOU7/AyTHmAimbfAH4d49ri6vA7AsfwCJf04R7GXeSIyDev2zk5u0rxxUWT
         wW/w==
X-Gm-Message-State: AOAM530PdJyG29pl4/uNDy/9t3+ghu29P5Sb70LEHKJ9Umf0p0xf2oEn
        0HXlG+9r94WjcU3RVNjcsT33iX5rsaQ=
X-Google-Smtp-Source: ABdhPJyywrLlZcr1/ymngp8CvTKAhM5OKWJfFLQ3hovb/j7oO3OWTYUA96I4WdglqZ/2ZVqe9fFmfg==
X-Received: by 2002:aca:afd3:: with SMTP id y202mr27122092oie.90.1620660985082;
        Mon, 10 May 2021 08:36:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm2638997oiv.19.2021.05.10.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:36:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 08:36:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     hdegoede@redhat.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2 3/4] hwmon: (sch56xx-common) Use helper function
Message-ID: <20210510153623.GC3212231@roeck-us.net>
References: <20210508131457.12780-1-W_Armin@gmx.de>
 <20210508131457.12780-4-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508131457.12780-4-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 08, 2021 at 03:14:56PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use watchdog_set_nowayout() to process param
> setting and change param type to bool.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied. Unrelated comment below.

> ---
>  drivers/hwmon/sch56xx-common.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
> index 0b3250fc57b8..180801f80118 100644
> --- a/drivers/hwmon/sch56xx-common.c
> +++ b/drivers/hwmon/sch56xx-common.c
> @@ -20,8 +20,8 @@
>  #include "sch56xx-common.h"
> 
>  /* Insmod parameters */
> -static int nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, int, 0);
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
> @@ -420,8 +420,7 @@ void sch56xx_watchdog_register(struct device *parent, u16 addr, u32 revision,
>  	data->wddev.timeout = 60;
>  	data->wddev.min_timeout = 1;
>  	data->wddev.max_timeout = 255 * 60;
> -	if (nowayout)
> -		set_bit(WDOG_NO_WAY_OUT, &data->wddev.status);
> +	watchdog_set_nowayout(&data->wddev, nowayout);
>  	if (output_enable & SCH56XX_WDOG_OUTPUT_ENABLE)
>  		set_bit(WDOG_ACTIVE, &data->wddev.status);
> 
This should really set WDOG_HW_RUNNING.

Guenter
