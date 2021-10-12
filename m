Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B74C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9DF260E0C
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbhJLOpV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLOpU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:45:20 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1966CC061570;
        Tue, 12 Oct 2021 07:43:19 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w10-20020a056830280a00b0054e4e6c85a6so17119997otu.5;
        Tue, 12 Oct 2021 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8v6cFxeRvBL37bRziMvLgeF/CGIsLy/Go3clB8ACYFA=;
        b=QJ6u6/su9OHcdDxBkUIiIY5akJUDmLuYOU/gHwx9hD+Mw14Ml5CvnPxBaqgC7lKc3B
         sdpJ4UrNkuFF6124UIuCfwBCoeo8PLiUxDPNccrNadPZdnp3yj0vlREk4IFzKjZlUW92
         m7G+JkRzfZaOs7aprbGUFAoGkl948/qayzDv0Hv6UH323QBYDZrutnlU3H+ZGpgvnjsD
         CjUf2+gldCEHketLq2GVsH4iw5JnF7qNgpI9pqATfRl+/gQsKhyowEZR31SE59DjikX0
         0pKdg7CBP1lMRmh9dh8Piq7a7+wCfOiHb2nRFrP4t9WR6N4So5k9OHl4s6VROAfylig2
         Oe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8v6cFxeRvBL37bRziMvLgeF/CGIsLy/Go3clB8ACYFA=;
        b=guVFAmnb9g6jqUC04PJQ8T4CBXGCGCDGUj90WPeg7tFi4X7t6p6KUNoN1NwZs5UfQc
         /2Voaros4ahva9Kgk/4kD/K4wIKSQ+8vTr8gzTw3csyqBJeaKhFxUi8LoTlQImcMusiX
         0MM1XXrFLlsQ+usVLzoiuRZto2amcsh8l1lTzKknyVUnqzsMqSrh10/h3eBuxZNkOFUk
         NYve46RN2l5JKFbZTl8A23X/BlLMI+SJnb7SiHk4qvfgqTt3GUM9JLdAOoO6jC071m6a
         BIscf0WrDS8YDRyet+4r6TE/OAYAa2ZdbOMZApeck4/picQNxHtJ6mcerwmy4/C3i7yi
         LRsw==
X-Gm-Message-State: AOAM5309GoMJmt/GVf/mGNXBiOVbpMFOq0PEJ+GwzENA4H/gu4z+OvAa
        wd479xrVVfbckc6ujdhKimnOeDT9ngo=
X-Google-Smtp-Source: ABdhPJychzGw22EPOBUkh3CW0x27WYBmhrkcgUw5FtU9ph7QMJhKqLiQUmpBkl8x/A0+2F+lls4/og==
X-Received: by 2002:a05:6830:2329:: with SMTP id q9mr12122619otg.229.1634049798258;
        Tue, 12 Oct 2021 07:43:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm2370233otn.16.2021.10.12.07.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 07:43:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 07/10] hwmon: (tmp421) support HWMON_T_ENABLE
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <3b8d00c549996739b2d6fb4394241916fdf0743e.1634029538.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ca03e671-c8d2-86cb-7bbd-7c23eb9d8a8c@roeck-us.net>
Date:   Tue, 12 Oct 2021 07:43:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3b8d00c549996739b2d6fb4394241916fdf0743e.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/12/21 2:29 AM, Krzysztof Adamski wrote:
> Since the recent patches added possibility of disabling sensor channels
> via DT, it only make sense to allow controlling that from userspace via
> HWMON_T_ENABLE mechanism. This patches adds support for that.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 35 +++++++++++++++++++++++++++++++----
>   1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 45cb197cd277..133eca1f2650 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -200,21 +200,27 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>   	if (ret)
>   		return ret;
>   
> -	if (!tmp421->channel[channel].enabled)
> -		return -ENODATA;
> -
>   	switch (attr) {
>   	case hwmon_temp_input:
> +		if (!tmp421->channel[channel].enabled)
> +			return -ENODATA;
> +
>   		*val = temp_from_raw(tmp421->channel[channel].temp,
>   				     tmp421->config & TMP421_CONFIG_RANGE);
> +

Please drop those empty lines for consistency with the code below.

>   		return 0;
>   	case hwmon_temp_fault:
> +		if (!tmp421->channel[channel].enabled)
> +			return -ENODATA;
>   		/*
>   		 * Any of OPEN or /PVLD bits indicate a hardware mulfunction
>   		 * and the conversion result may be incorrect
>   		 */
>   		*val = !!(tmp421->channel[channel].temp & 0x03);
>   		return 0;
> +	case hwmon_temp_enable:
> +		*val = tmp421->channel[channel].enabled;
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -231,6 +237,24 @@ static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
>   	return 0;
>   }
>   
> +static int tmp421_write(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long val)
> +{
> +	struct tmp421_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:

Please check for attr here. Checking the type (which is always
hwmon_temp) is misleading.

> +		data->channel[channel].enabled = val;
> +		ret = tmp421_enable_channels(data);
> +		break;
> +	default:
> +	    ret = -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
>   static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>   				 u32 attr, int channel)
>   {
> @@ -240,6 +264,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>   		return 0444;
>   	case hwmon_temp_label:
>   		return 0444;
> +	case hwmon_temp_enable:
> +		return 0644;
>   	default:
>   		return 0;
>   	}
> @@ -397,6 +423,7 @@ static const struct hwmon_ops tmp421_ops = {
>   	.is_visible = tmp421_is_visible,
>   	.read = tmp421_read,
>   	.read_string = tmp421_read_string,
> +	.write = tmp421_write,
>   };
>   
>   static int tmp421_probe(struct i2c_client *client)
> @@ -419,7 +446,7 @@ static int tmp421_probe(struct i2c_client *client)
>   	data->client = client;
>   
>   	for (i = 0; i < data->channels; i++) {
> -		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
> +		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_ENABLE;
>   		data->channel[i].enabled = true;
>   	}
>   
> 

