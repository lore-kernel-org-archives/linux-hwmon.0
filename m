Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849CAC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Dec 2021 17:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhLGRhN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Dec 2021 12:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhLGRhN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Dec 2021 12:37:13 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDA4C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Dec 2021 09:33:42 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bk14so28985145oib.7
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Dec 2021 09:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dNdGGD7ewSCxRUT0HMwoiu28jtI8Pk7heYHuHLDQoWk=;
        b=qxBFNJ3osb3K41jeYgRfth4iW5YuLa/iXrQ7eJTciYkcWQ2UWOBhTUmFljNicVkqnV
         KrCqrUowhmcBvpSXM+O/6XEIthsTcKXQHXWvlhkghUFSGVSHi22J6RDyWkRhTAebkf0I
         ldVvYeBo2KQM2RVjjeDCFp2MWApxcv8SciOdGE4bZ7exgibn4iI9rh2gEMU6joGNElBS
         bWai9ZBh/KbunzgajaACW6FEE+S3vZK0HRh1zIl8QiisPX09cLoDroSuMGE+wT49k/sJ
         XuNgvOitH/0XTyO52csQuquRyAoGk2zrnl4zdU3arnnGuwrOo4IGpulnCGIyn0pQDykT
         UNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=dNdGGD7ewSCxRUT0HMwoiu28jtI8Pk7heYHuHLDQoWk=;
        b=7fU4udMOCTynof1GRscK613TqunvsdqPvtK5zXmMDprAoGIjtgKZmsERwxYu3wNDsF
         VMiy2VucT7MMHZjvD3fZUWTT6fr6OKZltQrj0+nO4A20cxaL4qsvhSsNpuUWBmDV9nSb
         ip7gpqtVIzY4YVt+Ha3B1y1Dzdz0ehFrqCkxhe9anX9IiKoxv+98m3plaQzp9fkYDc2O
         nusqhIfRecybUataYi5uCNrITeSXRzRSmsfyeGWdyNL63pilofEbKtpMPFvHdJ32CwNb
         9e8gjHuh7aVcOqswLlxnewYBteTh3w12QyWg2dxEUei7WzJsi+CyHDyImoWVfhj5h9c5
         lvbw==
X-Gm-Message-State: AOAM530AHyrgQ2/z48kPezx9RZBE4QgS6zNPQXN+0tkp5Scz/Q/ybXyr
        3E5ZGRUkQXJREC9j+M0ivTnUWVW9tbc=
X-Google-Smtp-Source: ABdhPJzN/98eU5cIHJ21iVnMdaIZfgjv7PTkEmqcSLuufDYyozVCJA9khdGWAzjKpc9kliZ9LJIkpQ==
X-Received: by 2002:a05:6808:228a:: with SMTP id bo10mr6549882oib.72.1638898421907;
        Tue, 07 Dec 2021 09:33:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j187sm57105oih.5.2021.12.07.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:33:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Dec 2021 09:33:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: Re: [PATCH 3/3] hwmon: (ntc_thermistor): Move DT matches to the
 driver block
Message-ID: <20211207173339.GA659203@roeck-us.net>
References: <20211205235948.4167075-1-linus.walleij@linaro.org>
 <20211205235948.4167075-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205235948.4167075-3-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 06, 2021 at 12:59:48AM +0100, Linus Walleij wrote:
> This moves the device tree match data toward the end of the
> driver which is the convention, here we can also add ACPI
> and similar match data in a conforming manner.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ntc_thermistor.c | 70 +++++++++++++++++-----------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index 246e109db462..a3588ec12ca5 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -368,41 +368,6 @@ static int ntc_adc_iio_read(struct ntc_data *data)
>  	return uv;
>  }
>  
> -static const struct of_device_id ntc_match[] = {
> -	{ .compatible = "epcos,b57330v2103",
> -		.data = &ntc_thermistor_id[NTC_B57330V2103]},
> -	{ .compatible = "epcos,b57891s0103",
> -		.data = &ntc_thermistor_id[NTC_B57891S0103] },
> -	{ .compatible = "murata,ncp03wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
> -	{ .compatible = "murata,ncp03wf104",
> -		.data = &ntc_thermistor_id[NTC_NCP03WF104] },
> -	{ .compatible = "murata,ncp15wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
> -	{ .compatible = "murata,ncp15wl333",
> -		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
> -	{ .compatible = "murata,ncp15xh103",
> -		.data = &ntc_thermistor_id[NTC_NCP15XH103] },
> -	{ .compatible = "murata,ncp18wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
> -	{ .compatible = "murata,ncp21wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
> -
> -	/* Usage of vendor name "ntc" is deprecated */
> -	{ .compatible = "ntc,ncp03wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
> -	{ .compatible = "ntc,ncp15wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
> -	{ .compatible = "ntc,ncp15wl333",
> -		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
> -	{ .compatible = "ntc,ncp18wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
> -	{ .compatible = "ntc,ncp21wb473",
> -		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, ntc_match);
> -
>  static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
>  {
>  	if (divisor == 0 && dividend == 0)
> @@ -671,6 +636,41 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct of_device_id ntc_match[] = {
> +	{ .compatible = "epcos,b57330v2103",
> +		.data = &ntc_thermistor_id[NTC_B57330V2103]},
> +	{ .compatible = "epcos,b57891s0103",
> +		.data = &ntc_thermistor_id[NTC_B57891S0103] },
> +	{ .compatible = "murata,ncp03wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
> +	{ .compatible = "murata,ncp03wf104",
> +		.data = &ntc_thermistor_id[NTC_NCP03WF104] },
> +	{ .compatible = "murata,ncp15wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
> +	{ .compatible = "murata,ncp15wl333",
> +		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
> +	{ .compatible = "murata,ncp15xh103",
> +		.data = &ntc_thermistor_id[NTC_NCP15XH103] },
> +	{ .compatible = "murata,ncp18wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
> +	{ .compatible = "murata,ncp21wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
> +
> +	/* Usage of vendor name "ntc" is deprecated */
> +	{ .compatible = "ntc,ncp03wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
> +	{ .compatible = "ntc,ncp15wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
> +	{ .compatible = "ntc,ncp15wl333",
> +		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
> +	{ .compatible = "ntc,ncp18wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
> +	{ .compatible = "ntc,ncp21wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ntc_match);
> +
>  static struct platform_driver ntc_thermistor_driver = {
>  	.driver = {
>  		.name = "ntc-thermistor",
