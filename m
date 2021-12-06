Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2037C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 00:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241800AbhLFAmE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 19:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241666AbhLFAmC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:42:02 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97197C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:38:34 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id t19so18478413oij.1
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=87V+xrhEuqmwUzt267qO2mmbsHXEzlDwcBLLXJiWZvI=;
        b=RL15uzBJk71r9nQ8b/af999vOHxasWqZN0zCtCCIstMO4dQisU5csMXIX2W51QwKYN
         hyhNbc/tAUnFfGqDa6/QsKpCk9SkrFaxGdPhWNhHgrJYaXy3r2MJsxbxdL6EWoDVD+HA
         1cANu8RE9IESjHU6iZuBjWno2FwydUPllvgQ2AqiXlvPajapmENXMFW0ZtEg21RkCNIc
         ykALZFvkYWdVSMIlTszC9yofog3kMjVOdSjp4uVlB4WpNEbmlsc5322ImLU6DuD1hBUl
         9E/tFtzVGorDxKSWF5Ze3oDOLyJQzn2lOayY1mU0aSMmF5JrzLc11NPTllP2cbJNNd+y
         D8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=87V+xrhEuqmwUzt267qO2mmbsHXEzlDwcBLLXJiWZvI=;
        b=IotNqlG7uFxgv27sABkPIfCuxYJOya2SyWhFS0TS5C//rkOAgZpTlyHxwyRTtABKf5
         285Tbg7q+xstfShty1LTW9btYb8IrvOTerp06ELkSuCph+n/Y+/eq/lFM0HUj+6IbVBm
         7R6gVBJxngTYMzBLXKoPqoIRbEI/Ai3ViMT/9AxHZjmQ2Lr0dFU4P7ghueYtg/R7d/gb
         6b2cszkOwxLGaeD4ZaPh5FxDIfl/unjimjP3k9SNIZRHJJ/qzbJImfKNHgpX66JE/HlT
         G39R529JutVayCJjOkIku/04PBtOOTm/VzrtCB9z7m6z9vatwzMjBMZ8Rv6AuyF8g/Sx
         59Qw==
X-Gm-Message-State: AOAM531MYaYIMLnwYmV2yIFLVnx1pALT/3a4M5OgqDR4pI2AlFbe3Tvu
        WMUg7vgVGi7Ok8RTxOarN04=
X-Google-Smtp-Source: ABdhPJxbzzDumfOkEFwZiwvgeYHTcpGDaMayLG9VA9XNz/UFp2HO0E7wn6B4Z+7nuUdu+K/YrtJCoQ==
X-Received: by 2002:aca:b382:: with SMTP id c124mr20354263oif.169.1638751113976;
        Sun, 05 Dec 2021 16:38:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id be12sm2448048oib.50.2021.12.05.16.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 16:38:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (ntc_thermistor): Inline OF data lookup in
 probe()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
References: <20211205235948.4167075-1-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cd5cf97d-95ea-081c-2763-b4c0676a729f@roeck-us.net>
Date:   Sun, 5 Dec 2021 16:38:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211205235948.4167075-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/5/21 3:59 PM, Linus Walleij wrote:
> There is no need to allocate the state container and look
> up DT properties in a separate function if OF is all we
> support. Inline it into probe().
> 

This is POV. Old fashioned as I am, I still prefer smaller
functions over large ones. Is there a _technical_ reason
for this change ?

Guenter

> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org> > ---
>   drivers/hwmon/ntc_thermistor.c | 76 ++++++++++++----------------------
>   1 file changed, 27 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index ed638ebd0923..44abcb8a2393 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -403,49 +403,6 @@ static const struct of_device_id ntc_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, ntc_match);
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
>   static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
>   {
>   	if (divisor == 0 && dividend == 0)
> @@ -641,20 +598,41 @@ static const struct hwmon_chip_info ntc_chip_info = {
>   static int ntc_thermistor_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
>   	const struct of_device_id *of_id =
>   			of_match_device(of_match_ptr(ntc_match), dev);
>   	const struct platform_device_id *pdev_id;
>   	struct device *hwmon_dev;
>   	struct ntc_data *data;
> +	enum iio_chan_type type;
> +	int ret;
>   
> -	data = ntc_thermistor_parse_dt(dev);
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->chan = devm_iio_channel_get(dev, NULL);
> +	if (IS_ERR(data->chan))
> +		return PTR_ERR(data->chan);
> +
> +	ret = iio_get_channel_type(data->chan, &type);
> +	if (ret < 0)
> +		return ret;
>   
> -	if (!data) {
> -		dev_err(dev, "No platform init data supplied.\n");
> +	if (type != IIO_VOLTAGE)
> +		return -EINVAL;
> +
> +	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
>   		return -ENODEV;
> -	}
> +	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
> +		return -ENODEV;
> +	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
> +		return -ENODEV;
> +
> +	if (of_find_property(np, "connected-positive", NULL))
> +		data->connect = NTC_CONNECTED_POSITIVE;
> +	else /* status change should be possible if not always on. */
> +		data->connect = NTC_CONNECTED_GROUND;
>   
>   	if (data->pullup_uv == 0 ||
>   	    (data->pullup_ohm == 0 && data->connect ==
> 

