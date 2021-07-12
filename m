Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97815C07E96
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 02:38:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 768E661042
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 02:38:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhGLClR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Jul 2021 22:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhGLClR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Jul 2021 22:41:17 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE95C0613DD
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Jul 2021 19:38:28 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u15so3802121oiw.3
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Jul 2021 19:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KS/WXdoFRhWg8zOtZXHSUihAx5jukM9Bl5Drhfzc7qg=;
        b=Dtf6g27+BVcItSXnT0ytc3mJer5WgHs5hq+/a5ay9RFUMFMj71e8gD954oqNCIC0an
         eiwhDOpgIZlRCuQwOd2DUwwc7Gqa3m+m+wZSt+1SUs3AlZ1oWM7t+MJZi1wftdyDTCZw
         9Nd6AOzphtfQd+H4uYNgIuGqXjBGYfgGEy2wWp8QSs7ppHWwO3OeG3Ib70Fyc9CksvjR
         DNrnh1XJZcrU6og2Q1jO8+RDWeAI45yEyvyrVv/jokYhaT2kcdIBr7MJsxIdqkHCmxHb
         zGwtdIwg87cJZSc1RcauO4whJu+nLugBGLqYRYnx7MElZcaXvSvETNUWi5YU+UtMtyG/
         HxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KS/WXdoFRhWg8zOtZXHSUihAx5jukM9Bl5Drhfzc7qg=;
        b=PQtrnQKNGwUkYF2SE741m3C5qfPhCgMbuqakhXE8MwKjcMAALbLXN4xMj0r0RjxA4E
         zV5CLpg3RMkoBbcRhEjbuvicZ5WEiqJfrP3Dwj0ciVma9iQh/ToOoYAJPDjpmgbw/uEo
         vWjfHAgFK5ii11SVoY6Uu4T/2Hxu7mvD3FjI9OsK0j0WZ7rKpTZB3UxVOnxPcdmlttvt
         I2klSWacfALvO+vosJi3dgfcrEVxiE2RF814DiliE1MFbl0grL/gFUQZ2gNgn06N1zwZ
         XMKAHx2uypSpxDredkJ3ARVf6Nd/DIh3jWVr1M/SCW5MKPbyJZOkko3lKEuiSidTbzoj
         yC5A==
X-Gm-Message-State: AOAM532nflkoM9/A/dEX0yyjU5NvfUr3PxjbLuizwhe/b9op3bEKwVsG
        SKVOJnKPFHv45GeGYESy7+Y=
X-Google-Smtp-Source: ABdhPJy/OXfIpCvFhwlx1y6uduDy1ZJgXazkOgcllqa5uZ6AZUdbXGiw+lE/eYAyTDuhL3xONvLnPQ==
X-Received: by 2002:a05:6808:9b2:: with SMTP id e18mr17137517oig.3.1626057507193;
        Sun, 11 Jul 2021 19:38:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 68sm2782458otd.74.2021.07.11.19.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 19:38:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 11 Jul 2021 19:38:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS
Message-ID: <20210712023825.GA3552025@roeck-us.net>
References: <20210709184501.6546-1-W_Armin@gmx.de>
 <20210709184501.6546-4-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709184501.6546-4-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 09, 2021 at 08:45:01PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use SIMPLE_DEV_PM_OPS() to also assign poweroff
> and thaw callbacks. Remove the now obsolete checking
> of CONFIG_PM too.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

0-day says:

drivers/hwmon/w83627ehf.c:1954:6: error: 'struct w83627ehf_data' has no member named 'vbat'

.... and there was me thinking that this code was at least compile tested.
Apparently not. Sigh. I dropped this patch.

Guenter

> ---
>  drivers/hwmon/w83627ehf.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 19af84574324..243b9bd8d64f 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1946,8 +1946,7 @@ static int __init w83627ehf_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
> 
> -#ifdef CONFIG_PM
> -static int w83627ehf_suspend(struct device *dev)
> +static int __maybe_unused w83627ehf_suspend(struct device *dev)
>  {
>  	struct w83627ehf_data *data = w83627ehf_update_device(dev);
> 
> @@ -1958,7 +1957,7 @@ static int w83627ehf_suspend(struct device *dev)
>  	return 0;
>  }
> 
> -static int w83627ehf_resume(struct device *dev)
> +static int __maybe_unused w83627ehf_resume(struct device *dev)
>  {
>  	struct w83627ehf_data *data = dev_get_drvdata(dev);
>  	int i;
> @@ -2013,22 +2012,12 @@ static int w83627ehf_resume(struct device *dev)
>  	return 0;
>  }
> 
> -static const struct dev_pm_ops w83627ehf_dev_pm_ops = {
> -	.suspend = w83627ehf_suspend,
> -	.resume = w83627ehf_resume,
> -	.freeze = w83627ehf_suspend,
> -	.restore = w83627ehf_resume,
> -};
> -
> -#define W83627EHF_DEV_PM_OPS	(&w83627ehf_dev_pm_ops)
> -#else
> -#define W83627EHF_DEV_PM_OPS	NULL
> -#endif /* CONFIG_PM */
> +static SIMPLE_DEV_PM_OPS(w83627ehf_dev_pm_ops, w83627ehf_suspend, w83627ehf_resume);
> 
>  static struct platform_driver w83627ehf_driver = {
>  	.driver = {
>  		.name	= DRVNAME,
> -		.pm	= W83627EHF_DEV_PM_OPS,
> +		.pm	= &w83627ehf_dev_pm_ops,
>  	},
>  };
