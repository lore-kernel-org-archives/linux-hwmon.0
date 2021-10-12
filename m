Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7FAC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:31:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1578D60240
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbhJLOdB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237299AbhJLOdA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:33:00 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AC8C06174E;
        Tue, 12 Oct 2021 07:30:58 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id z11so29322480oih.1;
        Tue, 12 Oct 2021 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=62/HSu28w9fyX+3Gdf1eH70UJnQvaTefHYnc62GBnR8=;
        b=FpY3R06Vinegv3TSinn8gWQkPhQFTlLrXMDS1x4s7ifr6YffK91RLhevDfnMpC2eo3
         +G8cCzs6sp6PZHxn/vl0W7oHdvGHyXYnZbPuf1apnaK6W2uB17DXc2KwrM/4JCUv+HuI
         G7e7ZG8s6nwdWa9tY86O8ZGGYLPwMPLRd5ttZorAHPKFGu7b+b+bXj/epl2/BTIIF1mJ
         vbnW+hLwjsk4Q5V0E/9y702sj1pyAm0LTrWvls7MI/EL35XC+IRpTPJQLHhIuOwkkdKt
         chScs0CuGzmbq3KP/WFDHFF00IbZTdgCDUNJrllaOhwG79CN6iLd9vfogftPFXKzaOR6
         e//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=62/HSu28w9fyX+3Gdf1eH70UJnQvaTefHYnc62GBnR8=;
        b=c/1kF1MJ1KYvLyErZ8H0iM/+BDR26aTVe9EdYTbD2GvyAAuUox1d/j5s/yDXhjxP0i
         Lzz8nPBHdHRIhiyz7mN0dBdLiQRslPJv2LgBdR1UM0rMaZ8SkAKiu3jZf7rZTRCbRan9
         t/wzEoahq6nh69UBOAN4BhKJD/REVaqTb32rKRvQ3ptKHwCEKzvNnEcSqTf9HMlsUiQD
         nt7QheC/me7tNQm9eWsymTyYjgi7yAOdRsoH2uWkzNVaZ7yCfdzUaw5VoQA4o6WAyO14
         dBN/4U7+60uz29jEJyPOIcL8mYWX3hKDYXWG0cJrkiWEkIvBGP/nGM7kuSV5AWJvyep3
         scFA==
X-Gm-Message-State: AOAM531rQsFcFsWX/BF4i8yF4ECEyg1QdhHn7a7/aclhhv3Bdm9hR5sc
        fC/DMfUzKIUtW+Rg7/HWoYI=
X-Google-Smtp-Source: ABdhPJzoBSjS7lqMEPaFxwZgNTYnIRKNJ8EtyU47IyW0Uklx0/PuwTRZfMtgLu2qVH+B/DJNe6HduQ==
X-Received: by 2002:a05:6808:2310:: with SMTP id bn16mr3793538oib.159.1634049057819;
        Tue, 12 Oct 2021 07:30:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n18sm2389109oig.16.2021.10.12.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:30:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 12 Oct 2021 07:30:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 03/10] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <20211012143056.GA773275@roeck-us.net>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <887624ff580a34d3bb16d03228234bcd1635f3e2.1634029538.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <887624ff580a34d3bb16d03228234bcd1635f3e2.1634029538.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 12, 2021 at 11:27:14AM +0200, Krzysztof Adamski wrote:
> tmp42x is a multichannel temperature sensor with several external
> channels. Since those channels can be used to connect diodes placed
> anywhere in the system, their meaning will vary depending on the
> project. For this case, the hwmon framework has an idea of labels which
> allows us to assign the meaning to each channel.
> 
> The similar concept is already implemented in ina3221 - the label for
> each channel can be defined via device tree. See commit a9e9dd9c6de5
> ("hwmon: (ina3221) Read channel input source info from DT")
> 
> This patch adds support for similar feature to tmp421.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  drivers/hwmon/tmp421.c | 61 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 707310d616a4..ab64d9825ca4 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
>  MODULE_DEVICE_TABLE(of, tmp421_of_match);
>  
>  struct tmp421_channel {
> +	const char *label;
>  	s16 temp;
>  };
>  
> @@ -187,6 +188,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  
>  }
>  
> +static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, const char **str)
> +{
> +	struct tmp421_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->channel[channel].label;
> +
> +	return 0;
> +}
> +
>  static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  				 u32 attr, int channel)
>  {
> @@ -194,6 +205,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  	case hwmon_temp_fault:
>  	case hwmon_temp_input:
>  		return 0444;
> +	case hwmon_temp_label:
> +		return 0444;
>  	default:
>  		return 0;
>  	}
> @@ -286,9 +299,53 @@ static int tmp421_detect(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static int tmp421_probe_child_from_dt(struct i2c_client *client,
> +				      struct device_node *child,
> +				      struct tmp421_data *data)
> +
> +{
> +	struct device *dev = &client->dev;
> +	u32 i;
> +	int err;
> +
> +	err = of_property_read_u32(child, "reg", &i);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return err;
> +	}
> +
> +	if (i >= MAX_CHANNELS) {

I think this needs to compare against data->channels. Otherwise, if
unsupported channels are listed in dt (say, reg==0x2 with tmp421),
we would end up with label attributes for those channels.

> +		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
> +		return -EINVAL;
> +	}
> +
> +	of_property_read_string(child, "label", &data->channel[i].label);
> +	if (data->channel[i].label)
> +		data->temp_config[i] |= HWMON_T_LABEL;
> +
> +	return 0;
> +}
> +
> +static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
> +{
> +	struct device *dev = &client->dev;
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int err;
> +
> +	for_each_child_of_node(np, child) {
> +		err = tmp421_probe_child_from_dt(client, child, data);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct hwmon_ops tmp421_ops = {
>  	.is_visible = tmp421_is_visible,
>  	.read = tmp421_read,
> +	.read_string = tmp421_read_string,
>  };
>  
>  static int tmp421_probe(struct i2c_client *client)
> @@ -317,6 +374,10 @@ static int tmp421_probe(struct i2c_client *client)
>  	for (i = 0; i < data->channels; i++)
>  		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
>  
> +	err = tmp421_probe_from_dt(client, data);
> +	if (err)
> +		return err;
> +
>  	data->chip.ops = &tmp421_ops;
>  	data->chip.info = data->info;
>  
