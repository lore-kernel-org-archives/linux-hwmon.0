Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFCBC6377D
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 15:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66BE261279
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 15:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhGVPPv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jul 2021 11:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbhGVPPu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jul 2021 11:15:50 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7F6C0613C1
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jul 2021 08:56:24 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so5695441otq.11
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jul 2021 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DIIOyXChM3alyUlG92tKw2jq2FPPGswCZIUIBqodVbo=;
        b=l5a6agbGZmsjrh/xoLXruFBQNH5DYYWfHT0C+BtGKmsFT7HaOn25v4YmRddXjZEqXh
         SkyNKBJNQ+j0vRlhkwwdsZ4pOK4fEeB48kulsaSK7RUCZgoOQzw6AnfUnCpps2fjjG89
         skCBiR7Cl6rVvEorY5E/voqTHkfgC+OYxeeFAhLacMYNhcvs6Mv83+XNCFuQXNZl6B92
         lxQQRKzRouVXPzSfj1ERoOB7Guf0laeEQSfczEkoYgVCCDAtinNbhzYW7niLkwHu1pOF
         TKsdu73qtzQ/GXKQSOo3i67cAyh47FR467KkTcCbqLvKycyUxkS87PO//9o6IMIo+A1P
         I64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=DIIOyXChM3alyUlG92tKw2jq2FPPGswCZIUIBqodVbo=;
        b=tpAE+/lmzlXKjhoBj6sBa6ijltwjxVtlZDlj8flA1QPxVHC4JywusznMrwzsLwmk/7
         gmWFUfoCN3C5oi91rnmI11/vxUG50NFA+r7aK6gHaUZhOV6wvkukD+k7l6JLbPsnrXFe
         NmkaWGhpXQpgPeFuS6BZ1cUQbxquuCZjknHAbQgwTJUEG9OJc17vkNlIljP75di8oOOM
         Lg7/oAwLA2gdbH1iBu6jsb/+2aGlr4bu/MS/0F+T/hDn/O1OpFBmvMECmP23xjidc2cX
         VV/QEBAf+WjlVsOYwmgxEghzJuPXBge0vflqaQ1VexNWKzRNIdPY/L66veNGmhr1v9H7
         cdJw==
X-Gm-Message-State: AOAM531nwUjNPwaGwY1UNhGdKyWZGEsjjpxV8Dr4caYCNEFO/1VjB83O
        AMEoLzJo4FaMOk20wxMslFI=
X-Google-Smtp-Source: ABdhPJwyAYQdUN2+xKAmI6MUIxKbWWQPPmz8b+9J+v1lYBam5XkoQwMAV5u4NEJ14+sFvYMStTtSjQ==
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr254467ota.263.1626969382837;
        Thu, 22 Jul 2021 08:56:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m129sm5511590oif.15.2021.07.22.08.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 08:56:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 22 Jul 2021 08:56:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS
Message-ID: <20210722155621.GA3369842@roeck-us.net>
References: <20210721192519.28784-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721192519.28784-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 21, 2021 at 09:25:19PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use SIMPLE_DEV_PM_OPS() to also assign poweroff
> and thaw callbacks. Remove the now obsolete checking
> of CONFIG_PM too.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> changes in v2:
> - remove last check of CONFIG_PM
> ---
>  drivers/hwmon/w83627ehf.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 19af84574324..3cea66c58c25 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -372,12 +372,10 @@ struct w83627ehf_data {
>  	u8 temp3_val_only:1;
>  	u8 have_vid:1;
> 
> -#ifdef CONFIG_PM
>  	/* Remember extra register values over suspend/resume */
>  	u8 vbat;
>  	u8 fandiv1;
>  	u8 fandiv2;
> -#endif
>  };
> 
>  struct w83627ehf_sio_data {
> @@ -1946,8 +1944,7 @@ static int __init w83627ehf_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
> 
> -#ifdef CONFIG_PM
> -static int w83627ehf_suspend(struct device *dev)
> +static int __maybe_unused w83627ehf_suspend(struct device *dev)
>  {
>  	struct w83627ehf_data *data = w83627ehf_update_device(dev);
> 
> @@ -1958,7 +1955,7 @@ static int w83627ehf_suspend(struct device *dev)
>  	return 0;
>  }
> 
> -static int w83627ehf_resume(struct device *dev)
> +static int __maybe_unused w83627ehf_resume(struct device *dev)
>  {
>  	struct w83627ehf_data *data = dev_get_drvdata(dev);
>  	int i;
> @@ -2013,22 +2010,12 @@ static int w83627ehf_resume(struct device *dev)
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
