Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D98C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Dec 2021 17:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240052AbhLGRg5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Dec 2021 12:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbhLGRg4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Dec 2021 12:36:56 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3392FC061574
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Dec 2021 09:33:26 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id 7so28939511oip.12
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Dec 2021 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Lyf5A38Hp33oeiztMGFlmQK5XnpfjNYOOrUh80IM2w=;
        b=lYir2H694VAdsF7WjA8bs6d7J9XlB+mWIg+srNQWOLF1U5ydCuxxzfovYUBdKr7Tkx
         GIggPvKhelQFuUABA5/BlSzK0jBQG6AtgiS+neAWoLSedPpcuVnJrxlgnFlS8+Zqz+vZ
         aVwlletpCZSstc9IoIQyQmeT7zZXuqklsXofhR42Dt/Ysk1jAosLAsujiwtQnzILx89I
         MhAzg1uTeGJ4ZbLWbXZq2L9UeE3DKs8Ka8M7bun2MQpULc5AikOlTkkk5kyWqRTFL4Yv
         zIyi+fYDXlM+62vAbRwQdB8/i7FAevJF4xWqwM6uBhZo1dz11XZNzF1nUaoxTTVbbsST
         HD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=1Lyf5A38Hp33oeiztMGFlmQK5XnpfjNYOOrUh80IM2w=;
        b=w45TgPK1iReH2B643ZNPdnR2ugxfSmO8pObeziz5x7kg714IbIbFKJWR7GVvt7kwBH
         zp1pV00JpDVppa2jyr0KPMARBb3/gcSaiBC//xbvgwXnLA7yaz9fftzujYUnjXvRw6dQ
         YCqQyYPSsmSP+tlNqMP5Vyd1BFYly5tMIDXAfM8o1JHtpPZMyr2NlU430REqEjOxNzOe
         SvOOmMdG7xyO0oUwC1LGwlO/jF2QITK6WMikmvITGijCgYnjKXtZ4mVBH0yeRSdxg+iK
         bhY1kH29SibdGsqUbrpcQlqXsdOc20M12/nDdKkpc+TxR2ovo6a33aAd/wlWnXMZwrS9
         2CHw==
X-Gm-Message-State: AOAM532aVb44QRMgFXQT9HU3SA2aIN+MBgmB4wt2xfjgszakNjjwO68y
        fb04ZaticfDTB1WL1ld0lrhV7sQgwUA=
X-Google-Smtp-Source: ABdhPJwHsJYwoUAvpnxlgOF6Ym+dtQyCtWWYXkX/ij2k7M2QU6f7VvGs5v7yPFNSUGnCg/Vy8wq3sA==
X-Received: by 2002:a05:6808:205:: with SMTP id l5mr6429793oie.164.1638898405508;
        Tue, 07 Dec 2021 09:33:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m22sm86986ooj.8.2021.12.07.09.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:33:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Dec 2021 09:33:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: Re: [PATCH 2/3 v2] hwmon: (ntc_thermistor): Switch to generic
 firmware props
Message-ID: <20211207173322.GA659106@roeck-us.net>
References: <20211206020423.62402-1-linus.walleij@linaro.org>
 <20211206020423.62402-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206020423.62402-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 06, 2021 at 03:04:22AM +0100, Linus Walleij wrote:
> This switches to retrieveing the configuration of the NTC
> from generic firmware properties so that we get neutral from
> device tree: now ACPI or, more importantly, software nodes
> can be used to spawn NTC devices provided they have the
> required properties.
> 
> This was inspired by the similar changes made to the IIO
> drivers.
> 
> This was tested on the Ux500 HREF with the NTC devices
> probing from device tree just as fine after this as before.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,
Guenter

> ---
> ChangeLog v1->v2:
> - Rebase on the changes keeping the props parsing code in
>   a separate function.
> ---
>  drivers/hwmon/ntc_thermistor.c | 36 ++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index 12435ef66530..0c8b3dbcb38b 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -9,10 +9,10 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/math64.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/fixp-arith.h>
>  #include <linux/iio/consumer.h>
>  #include <linux/hwmon.h>
> @@ -595,12 +595,11 @@ static const struct hwmon_chip_info ntc_chip_info = {
>  	.info = ntc_info,
>  };
>  
> -static int ntc_thermistor_parse_dt(struct device *dev,
> -				   struct ntc_data *data)
> +static int ntc_thermistor_parse_props(struct device *dev,
> +				      struct ntc_data *data)
>  {
>  	struct iio_channel *chan;
>  	enum iio_chan_type type;
> -	struct device_node *np = dev->of_node;
>  	int ret;
>  
>  	chan = devm_iio_channel_get(dev, NULL);
> @@ -614,14 +613,19 @@ static int ntc_thermistor_parse_dt(struct device *dev,
>  	if (type != IIO_VOLTAGE)
>  		return -EINVAL;
>  
> -	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
> -		return -ENODEV;
> -	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
> -		return -ENODEV;
> -	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
> -		return -ENODEV;
> +	ret = device_property_read_u32(dev, "pullup-uv", &data->pullup_uv);
> +	if (ret)
> +		return dev_err_probe(dev,  ret, "pullup-uv not specified\n");
> +
> +	ret = device_property_read_u32(dev, "pullup-ohm", &data->pullup_ohm);
> +	if (ret)
> +		return dev_err_probe(dev,  ret, "pullup-ohm not specified\n");
> +
> +	ret = device_property_read_u32(dev, "pulldown-ohm", &data->pulldown_ohm);
> +	if (ret)
> +		return dev_err_probe(dev,  ret, "pulldown-ohm not specified\n");
>  
> -	if (of_find_property(np, "connected-positive", NULL))
> +	if (device_property_read_bool(dev, "connected-positive"))
>  		data->connect = NTC_CONNECTED_POSITIVE;
>  	else /* status change should be possible if not always on. */
>  		data->connect = NTC_CONNECTED_GROUND;
> @@ -634,8 +638,6 @@ static int ntc_thermistor_parse_dt(struct device *dev,
>  static int ntc_thermistor_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	const struct of_device_id *of_id =
> -			of_match_device(of_match_ptr(ntc_match), dev);
>  	const struct platform_device_id *pdev_id;
>  	struct device *hwmon_dev;
>  	struct ntc_data *data;
> @@ -645,7 +647,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	ret = ntc_thermistor_parse_dt(dev, data);
> +	ret = ntc_thermistor_parse_props(dev, data);
>  	if (ret)
>  		return ret;
>  
> @@ -660,7 +662,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
> +	pdev_id = device_get_match_data(dev);
>  
>  	if (pdev_id->driver_data >= ARRAY_SIZE(ntc_type)) {
>  		dev_err(dev, "Unknown device type: %lu(%s)\n",
> @@ -688,7 +690,7 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
>  static struct platform_driver ntc_thermistor_driver = {
>  	.driver = {
>  		.name = "ntc-thermistor",
> -		.of_match_table = of_match_ptr(ntc_match),
> +		.of_match_table = ntc_match,
>  	},
>  	.probe = ntc_thermistor_probe,
>  	.id_table = ntc_thermistor_id,
