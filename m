Return-Path: <SRS0=izHe=U7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF730C06510
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75742208C4
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLHogHMD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGBNjD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Jul 2019 09:39:03 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46837 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfGBNjD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Jul 2019 09:39:03 -0400
Received: by mail-pf1-f193.google.com with SMTP id 81so8257870pfy.13
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Jul 2019 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Jk1UFvAEtjMo1M8DjIhCG71HQaMae3liFObfGh0h5cs=;
        b=rLHogHMDRv/7Q6pNER625XB7sMugNzYl1yhEzoH/mVariM03J1mdpvIZWEzTKZgABo
         kCcf2n8+8omL0vvJ/O5mXHitMxZ8AOl4AoDLYj7jO+ufRtxIGwjFe6hGjkD3RLAb/m1s
         y+VvOJsauTdva+KqioqLRjcYMw8yRvaTb78diaG8EcwkmnQBAxdAIGtEgfXuOIZlx2xa
         Kdtqr+hH/62l82w63K7KSRiBQ6ZDID2vRYzHILtbWwRCTxy3SNved3MgmpMaeTk4K0rV
         xqlCGXlJ+RbqLlvacS+Cy5/hVV5JxflAtOPMOws1R6VqoorvG1SGF7JJPnYH7bqafQa7
         EzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=Jk1UFvAEtjMo1M8DjIhCG71HQaMae3liFObfGh0h5cs=;
        b=OqVGlKMT3lAIX7el07K757fPwqs9oUBKlgBW/TFMUyaJXeHyYz3nNJ99HW2UMS1i/c
         g+4ibkuXYvfyxTr3EkOcJxTk2kP4E6czwo5zFgDlFvsoKKqX7KXs776XjdVFpshzf/01
         xsPsp2OgvU0nrWWQQUST8e2lQsAk82PKBxV5vU6LUiWhpbMIM2bfMiIyaG/AfMJwbUQK
         hVpmpf0gON6+GMLBLjGOjJc0yFQveQ0DGpBxu0tvJBDwNYHtNvxTuOfia44F9i3zXbT2
         wA3BE1DmDDELXKIKQe1qg98FFlaLOUVgbUSSKuO2RotXfP7VorQLM+vxbrpaDNSWOMF6
         IyWQ==
X-Gm-Message-State: APjAAAUtCzE+W6G9Il2NfJZrzkidwSjKNb+U2pUktfyoHyy35Ch6EzFG
        cBw32w0hmDYghWgSkKdSQmEEilDW
X-Google-Smtp-Source: APXvYqwAcGaKqLgCTJag30mGDU4VhCrcAmanUOs7smMOtfY1AfMB8hTuJ14ojAlA7SJPzdAP/t+o2A==
X-Received: by 2002:a63:1208:: with SMTP id h8mr29630743pgl.377.1562074742432;
        Tue, 02 Jul 2019 06:39:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d26sm16003178pfn.29.2019.07.02.06.39.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 06:39:01 -0700 (PDT)
Date:   Tue, 2 Jul 2019 06:39:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     cschneider@radiodata.biz
Cc:     linux-hwmon@vger.kernel.org, christian@ch-sc.de
Subject: Re: [PATCH 1/2] hwmon: gpio-fan: move fan_alarm_init after
 devm_hwmon_device_register_with_groups
Message-ID: <20190702133900.GA32068@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 02, 2019 at 03:23:37PM +0200, cschneider@radiodata.biz wrote:
> From: Christian Schneider <cschneider@radiodata.biz>
> 
> This makes it possible to use the hwmon_dev in fan_alarm_notify(). Otherwise
> it would be possible, that a interupt arrives and fan_alarm_notify() is
> executed, before hwmon_dev is initialized.
> 
> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 84753680a4e8..a962a9ee7225 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -510,13 +510,6 @@ static int gpio_fan_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, fan_data);
>  	mutex_init(&fan_data->lock);
>  
> -	/* Configure alarm GPIO if available. */
> -	if (fan_data->alarm_gpio) {
> -		err = fan_alarm_init(fan_data);
> -		if (err)
> -			return err;
> -	}
> -
>  	/* Configure control GPIOs if available. */
>  	if (fan_data->gpios && fan_data->num_gpios > 0) {
>  		if (!fan_data->speed || fan_data->num_speed <= 1)
> @@ -535,6 +528,13 @@ static int gpio_fan_probe(struct platform_device *pdev)
>  	if (IS_ERR(fan_data->hwmon_dev))
>  		return PTR_ERR(fan_data->hwmon_dev);
>  
> +	/* Configure alarm GPIO if available. */
> +	if (fan_data->alarm_gpio) {
> +		err = fan_alarm_init(fan_data);
> +		if (err)
> +			return err;
> +	}
> +
>  	/* Optional cooling device register for Device tree platforms */
>  	fan_data->cdev = devm_thermal_of_cooling_device_register(dev, np,
>  				"gpio-fan", fan_data, &gpio_fan_cool_ops);
> -- 
> 2.22.0
> 
