Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFF2C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Dec 2021 17:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240016AbhLGRgf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Dec 2021 12:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhLGRge (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Dec 2021 12:36:34 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB20C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Dec 2021 09:33:04 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso19096105otf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Dec 2021 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=afcqqvGe3oE5huko7HjJXYpeV+s7PUFD0/spTUHweSk=;
        b=fICSTwo9v1SUBBTmUoB9xIfqIhl1PrgXSfA/SC1IpkgGhq8nrf2Ufgl99c4xuc+QQK
         dlSnhW2bpQGqQeUVhIFLlxSazS+BXUhGlTBlANOIzNlS4qRzf7faQNJR8/xy/7f69IKg
         UR4KtC1PZ3MUYzpn3zwWIagdd7EcoaTDDwH9aYjlxesAASN4iVPYQfb3+wBuXVTTTm9X
         xqOHmr2KE9ZVxwP+Ekl9xikZCVmZSuA2B5i+Pmgb8+Tnk/ZKxnIXB8nfJTocVgcd0qTe
         bROPkZmx6yg58sGxplhfKLpL3oyvVoKsAdWTBkVC5rVvmhDygGvotzp9fVsXD5EPkI+8
         BAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=afcqqvGe3oE5huko7HjJXYpeV+s7PUFD0/spTUHweSk=;
        b=j8TzGTeweeRvuod+0LcTTHMmLbe2DyS6T7pFy2YCEEGvtsfnFd834isuJcmCRr8RRW
         Ao/Jdm8wx1Z8Pf1k2tPCOeryEZQnkqtZd5fG6IJ2Nqq5OdGEiThY997Cddn2fL+gTTl/
         Yo0BBgfC08bBiqcbuJAkNZz8mSlsyOztkp47l5z6ftzkdLrCxvOzWe3awpfsy9cXzSJ6
         vTNuOsufaA8iLnNSaWkoBar4nubqGlWexBRI3aBCXq8uWzVMdkaKxgoStuqvDJHrhbjn
         4VB4x/qYj8yDz1mieVj+sGJM3XGHUqnUBpwo4RcsFo3KEcEOQpsoxSF/qhDHdAHgnxMv
         580g==
X-Gm-Message-State: AOAM532hBD2E2jwC9aME+HKmctCJaf+YsBOPw5L3oN7ficN2Gr93tVvs
        7QQVxxYR/0eKY1L0Y34P+kYRgXAtQic=
X-Google-Smtp-Source: ABdhPJwmkIJ7kZwyhuTPZH8jtv2z3Up0ryrr/i5k6eMxEtvfmQv7oemiVVaFa30mlXh+Wwbyx33j7w==
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr36286509ots.7.1638898383559;
        Tue, 07 Dec 2021 09:33:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3sm75574oiw.8.2021.12.07.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:33:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Dec 2021 09:33:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: Re: [PATCH 1/3 v2] hwmon: (ntc_thermistor): Move and refactor DT
 parsing
Message-ID: <20211207173301.GA658961@roeck-us.net>
References: <20211206020423.62402-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206020423.62402-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 06, 2021 at 03:04:21AM +0100, Linus Walleij wrote:
> Move the parsing of the DT config right above probe().
> 
> Allocate the state container for the driver in probe()
> instead of inside the DT config parsing function: as a
> result return an int instead of a pointer.
> 
> Drop the check for !np: we can only probe from DT right
> now so no risk of ending up here.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,
Guenter

> ---
> ChangeLog v1->v2:
> - Instead of inlining the DT probing, keep the separate
>   function, but move out the state container allocation
>   and return an int.
> ---
>  drivers/hwmon/ntc_thermistor.c | 93 ++++++++++++++++------------------
>  1 file changed, 43 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index ed638ebd0923..12435ef66530 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -403,49 +403,6 @@ static const struct of_device_id ntc_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ntc_match);
>  
> -static struct ntc_data *ntc_thermistor_parse_dt(struct device *dev)
> -{
> -	struct ntc_data *data;
> -	struct iio_channel *chan;
> -	enum iio_chan_type type;
> -	struct device_node *np = dev->of_node;
> -	int ret;
> -
> -	if (!np)
> -		return NULL;
> -
> -	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return ERR_PTR(-ENOMEM);
> -
> -	chan = devm_iio_channel_get(dev, NULL);
> -	if (IS_ERR(chan))
> -		return ERR_CAST(chan);
> -
> -	ret = iio_get_channel_type(chan, &type);
> -	if (ret < 0)
> -		return ERR_PTR(ret);
> -
> -	if (type != IIO_VOLTAGE)
> -		return ERR_PTR(-EINVAL);
> -
> -	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
> -		return ERR_PTR(-ENODEV);
> -	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
> -		return ERR_PTR(-ENODEV);
> -	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
> -		return ERR_PTR(-ENODEV);
> -
> -	if (of_find_property(np, "connected-positive", NULL))
> -		data->connect = NTC_CONNECTED_POSITIVE;
> -	else /* status change should be possible if not always on. */
> -		data->connect = NTC_CONNECTED_GROUND;
> -
> -	data->chan = chan;
> -
> -	return data;
> -}
> -
>  static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
>  {
>  	if (divisor == 0 && dividend == 0)
> @@ -638,6 +595,42 @@ static const struct hwmon_chip_info ntc_chip_info = {
>  	.info = ntc_info,
>  };
>  
> +static int ntc_thermistor_parse_dt(struct device *dev,
> +				   struct ntc_data *data)
> +{
> +	struct iio_channel *chan;
> +	enum iio_chan_type type;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	chan = devm_iio_channel_get(dev, NULL);
> +	if (IS_ERR(chan))
> +		return PTR_ERR(chan);
> +
> +	ret = iio_get_channel_type(chan, &type);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (type != IIO_VOLTAGE)
> +		return -EINVAL;
> +
> +	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
> +		return -ENODEV;
> +	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
> +		return -ENODEV;
> +	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
> +		return -ENODEV;
> +
> +	if (of_find_property(np, "connected-positive", NULL))
> +		data->connect = NTC_CONNECTED_POSITIVE;
> +	else /* status change should be possible if not always on. */
> +		data->connect = NTC_CONNECTED_GROUND;
> +
> +	data->chan = chan;
> +
> +	return 0;
> +}
> +
>  static int ntc_thermistor_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -646,15 +639,15 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
>  	const struct platform_device_id *pdev_id;
>  	struct device *hwmon_dev;
>  	struct ntc_data *data;
> +	int ret;
>  
> -	data = ntc_thermistor_parse_dt(dev);
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
>  
> -	if (!data) {
> -		dev_err(dev, "No platform init data supplied.\n");
> -		return -ENODEV;
> -	}
> +	ret = ntc_thermistor_parse_dt(dev, data);
> +	if (ret)
> +		return ret;
>  
>  	if (data->pullup_uv == 0 ||
>  	    (data->pullup_ohm == 0 && data->connect ==
