Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362AAC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 10:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236205AbiETKPI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 06:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346515AbiETKPH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 06:15:07 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D34FA88B2
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 03:15:05 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bx33so9106314ljb.12
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VByhnDQJjyit3XbvoILIz79WkuHOVOnt4ThORqkI0rY=;
        b=BTiq2RjVXei6JDjuFbPEbimPE/lhY95DCNsNd7SVzIa+Yk35+TfBN8g/85Uwa/LJf8
         CgnmmPrJeBCt6ZbUeR5mfovOeWBwUrAV5rMLpjeIjiqNY/6OkogOEXtWijjE04bK3qG2
         XD41UGhT9NMftPISwpqf4vJ1Y381yS2IUthwalNVoBpwUmQcibKwn8x0E4M6Tx88BLdZ
         oPOXYOGY2QeOi5MDz7HsuNV1nGqbWcR1YAgWMx4HjiHNIjtmqyEE0aEoAzZew7i2pgut
         vqO63gBX9sUIgqHpP6N7sk0kc6joxmbH5GCZIt/7uRL77soYpG2C3rJV9f4rf5uezLLI
         B3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VByhnDQJjyit3XbvoILIz79WkuHOVOnt4ThORqkI0rY=;
        b=elAa8FoYSYZ34F3S7Z6pmBLSFO/hm3SkpoCKQ1qnGmVlrjjJk1Zn1QAwIktiFww1i5
         gFzs8FWrS4IvTpVF1QqNiFc1+l60jEstlMxZcCAdcpMYgpXYSX0iz9pIK06Vo+aqu1TG
         EXIuqJfyi7legxaD++NU6ahJyZdFHf90Tw501QYrho5/mWTOQ/O+T/9Bgoc4yGHAZALW
         KZ+E8TcDC3ioT/Kkxqq3ZGjcJnky/Ij0Ofp0JwruoRr6/d7ZUf0YifjsEpVR4VyT1Wkl
         2UOd9VeTHBUOjwoXEV1N6QZYMa0M2RPI1wUznC5X03EEz/eU4kGVBG+PwpYTOEexwfzd
         poBg==
X-Gm-Message-State: AOAM5333Tz3I1AQocl/VdUK3gpozcqWSfBtRlGXYXnquH722zl9Tl75h
        0xX2vCZYWerzDbolSy5yahUXaQ==
X-Google-Smtp-Source: ABdhPJxADUhzCOxS4ratvgNbNzTEr268BvZS1UpghTV3rQkah4DNfW3tdrTKaqKTg6PaRA9wygjLBA==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id n5-20020a2e82c5000000b00247e81f8b02mr5256193ljh.90.1653041703999;
        Fri, 20 May 2022 03:15:03 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12-20020ac255ac000000b0047255d210fcsm607984lfg.43.2022.05.20.03.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 03:15:03 -0700 (PDT)
Message-ID: <bb833b7d-d3c1-0f63-019c-439ed0ec9aad@linaro.org>
Date:   Fri, 20 May 2022 12:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 7/8] hwmon: (lm90) read the channel's label from
 device-tree
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-8-sst@poczta.fm>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520093243.2523749-8-sst@poczta.fm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/05/2022 11:32, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Try to read the channel's label from device-tree. Having label in
> device-tree node is not mandatory.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> ---
>  drivers/hwmon/lm90.c | 70 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 67d48707a8d6..e81cc21e525f 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -525,6 +525,7 @@ struct lm90_data {
>  	struct i2c_client *client;
>  	struct device *hwmon_dev;
>  	u32 channel_config[MAX_CHANNELS + 1];
> +	const char *channel_label[MAX_CHANNELS];
>  	struct hwmon_channel_info temp_info;
>  	const struct hwmon_channel_info *info[MAX_CHANNELS];
>  	struct hwmon_chip_info chip;
> @@ -1393,6 +1394,7 @@ static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
>  	case hwmon_temp_emergency_alarm:
>  	case hwmon_temp_emergency_hyst:
>  	case hwmon_temp_fault:
> +	case hwmon_temp_label:
>  		return 0444;
>  	case hwmon_temp_min:
>  	case hwmon_temp_max:
> @@ -1486,6 +1488,16 @@ static int lm90_read(struct device *dev, enum hwmon_sensor_types type,
>  	}
>  }
>  
> +static int lm90_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, const char **str)
> +{
> +	struct lm90_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->channel_label[channel];
> +
> +	return 0;
> +}
> +
>  static int lm90_write(struct device *dev, enum hwmon_sensor_types type,
>  		      u32 attr, int channel, long val)
>  {
> @@ -1904,10 +1916,64 @@ static void lm90_regulator_disable(void *regulator)
>  	regulator_disable(regulator);
>  }
>  
> +static int lm90_probe_channel_from_dt(struct i2c_client *client,
> +				      struct device_node *child,
> +				      struct lm90_data *data)
> +{
> +	u32 id;
> +	int err;
> +	struct device *dev = &client->dev;
> +
> +	err = of_property_read_u32(child, "reg", &id);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return err;
> +	}
> +
> +	if (id >= MAX_CHANNELS) {
> +		dev_err(dev, "invalid reg %d in %pOFn\n", id, child);
> +		return -EINVAL;
> +	}
> +
> +	err = of_property_read_string(child, "label", &data->channel_label[id]);
> +	if (err == -ENODATA || err == -EILSEQ) {
> +		dev_err(dev, "invalid label in %pOFn\n", child);

You did not make it a required property, so why failing?

> +		return err;
> +	}
> +
> +	if (data->channel_label[id])
> +		data->channel_config[id] |= HWMON_T_LABEL;
> +
> +	return 0;
> +}
> +
> +static int lm90_parse_dt_channel_info(struct i2c_client *client,
> +				      struct lm90_data *data)
> +{
> +	int err;
> +	struct device_node *child;
> +	struct device *dev = &client->dev;
> +	const struct device_node *np = dev->of_node;
> +
> +	for_each_child_of_node(np, child) {
> +		if (strcmp(child->name, "channel"))
> +			continue;
> +
> +		err = lm90_probe_channel_from_dt(client, child, data);
> +		if (err) {
> +			of_node_put(child);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  

No need for double blank lines.

>  static const struct hwmon_ops lm90_ops = {
>  	.is_visible = lm90_is_visible,
>  	.read = lm90_read,
> +	.read_string = lm90_read_string,
>  	.write = lm90_write,
>  };
>  
> @@ -2027,6 +2093,10 @@ static int lm90_probe(struct i2c_client *client)
>  					return err;
>  			}
>  		}
> +
> +		err = lm90_parse_dt_channel_info(client, data);
> +		if (err)
> +			return err;
>  	}
>  
>  	/* Initialize the LM90 chip */


Best regards,
Krzysztof
