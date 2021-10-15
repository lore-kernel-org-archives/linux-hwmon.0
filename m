Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21CAC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A34856120A
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243416AbhJOWzq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243413AbhJOWzp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:55:45 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3B3C061570;
        Fri, 15 Oct 2021 15:53:38 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id o4so15137247oia.10;
        Fri, 15 Oct 2021 15:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e/MRwa06xwEbfh7kLggkjiWDj+gahr4cpp2UtJ6mTUU=;
        b=Sm5o9RZxDgHphhtQULoA3RogzPXviLEGWjbz7b1nRRw1TBYZAvKJzoYb07cQpmHclE
         0cJea2zPqnaaAytSQTjb44wLBf4SfG9alh2RAySC/rLC6FMG+QiMyGWxAR71nuqYZHfR
         NnP400mv6E5LptOTJoRDrZiar+OrHJiOQGMWrXCeXCFAh3hp4H1/Byk48BzUbqfPNvhA
         HfSTSiiqlWF36VKVQcrcFDzgjI+vs7sb78+xsKYiM4TLGDiGHkWmKKv1xkscOVuPpzE7
         ou1820+g0cf0TFfgSUGllK1umZ0r5d+m+rl0oKAKsL1K+qZ/Ui+h66bOYXRu9IKqZwt5
         6o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=e/MRwa06xwEbfh7kLggkjiWDj+gahr4cpp2UtJ6mTUU=;
        b=WRTybh6vzaUFCrVRWME6tyfyLk7RnRQPjjUv2S6Mu1a31cTz2rcXX06P71+z16NK82
         JKeoAPk7we3FIqJf8YvvN6WNqdpo/5ndvSZkBEVOjClp0DDeBrHXRUp5cHFigXQNkoYZ
         z0mSmd2NdcLYDLWJzL6aS34M6wmWaMugaZIxU9+Zcrq5XXx+lkbi0kgnXoDe3WXSGzcX
         EJ1Ck5opoIOHzklhoOxYuPC3D/E3BKDqsGvDQ85v8fWbKLcp6S1LHhxyO8n133C8DE42
         hczmQTNyv28GGMmkQ+I9HnUqBZnsaMj+iRnTZBbunOHLrwkgjvE+ZQDNLIteZ4YVW97H
         Epvg==
X-Gm-Message-State: AOAM533QeNm5IKIF09whv5JsktyZiMfRG6ssrtwyx7sRMpApi1UaK0mb
        ViPy3PmhZnNjcME30nmdX/s=
X-Google-Smtp-Source: ABdhPJyigA7odhCjieVTo8B6TOJzXx5rtRQjQywUDUu+cWVlO5MkSNw4Na3Pt64wZbuECtgYrqnMSw==
X-Received: by 2002:a05:6808:1597:: with SMTP id t23mr4252627oiw.78.1634338418076;
        Fri, 15 Oct 2021 15:53:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e16sm1442040oie.17.2021.10.15.15.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:53:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:53:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/9] hwmon: (tmp421) support HWMON_T_ENABLE
Message-ID: <20211015225336.GA1485522@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <a64c22e7323bd5a083f37aaaca91a745ac1beef3.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64c22e7323bd5a083f37aaaca91a745ac1beef3.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:09:58PM +0200, Krzysztof Adamski wrote:
> Since the recent patches added possibility of disabling sensor channels
> via DT, it only make sense to allow controlling that from userspace via
> HWMON_T_ENABLE mechanism. This patches adds support for that.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied, with the usual fixup.

Guenter

> ---
>  drivers/hwmon/tmp421.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index b402e81ae5d5..2e20c558fcb0 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -203,21 +203,25 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  	if (ret)
>  		return ret;
>  
> -	if (!tmp421->channel[channel].enabled)
> -		return -ENODATA;
> -
>  	switch (attr) {
>  	case hwmon_temp_input:
> +		if (!tmp421->channel[channel].enabled)
> +			return -ENODATA;
>  		*val = temp_from_raw(tmp421->channel[channel].temp,
>  				     tmp421->config & TMP421_CONFIG_RANGE);
>  		return 0;
>  	case hwmon_temp_fault:
> +		if (!tmp421->channel[channel].enabled)
> +			return -ENODATA;
>  		/*
>  		 * Any of OPEN or /PVLD bits indicate a hardware mulfunction
>  		 * and the conversion result may be incorrect
>  		 */
>  		*val = !!(tmp421->channel[channel].temp & 0x03);
>  		return 0;
> +	case hwmon_temp_enable:
> +		*val = tmp421->channel[channel].enabled;
> +		return 0;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -234,6 +238,24 @@ static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
>  	return 0;
>  }
>  
> +static int tmp421_write(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long val)
> +{
> +	struct tmp421_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_enable:
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
>  static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  				 u32 attr, int channel)
>  {
> @@ -243,6 +265,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  		return 0444;
>  	case hwmon_temp_label:
>  		return 0444;
> +	case hwmon_temp_enable:
> +		return 0644;
>  	default:
>  		return 0;
>  	}
> @@ -402,6 +426,7 @@ static const struct hwmon_ops tmp421_ops = {
>  	.is_visible = tmp421_is_visible,
>  	.read = tmp421_read,
>  	.read_string = tmp421_read_string,
> +	.write = tmp421_write,
>  };
>  
>  static int tmp421_probe(struct i2c_client *client)
> @@ -424,7 +449,7 @@ static int tmp421_probe(struct i2c_client *client)
>  	data->client = client;
>  
>  	for (i = 0; i < data->channels; i++) {
> -		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
> +		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_ENABLE;
>  		data->channel[i].enabled = true;
>  	}
>  
