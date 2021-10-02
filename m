Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1E8C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 14:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B58561AA9
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 14:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhJBOK2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Oct 2021 10:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhJBOK2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Oct 2021 10:10:28 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BD7C0613EC;
        Sat,  2 Oct 2021 07:08:42 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so15267130ota.13;
        Sat, 02 Oct 2021 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HIo7VbIdBnuqt1PYA6Sd4OFam7/hvLGf4H98L+2uwOU=;
        b=SgkhhF00206tHurs7zwfykFGo7gFtdx4A6QRoQSbFvFIi89Xe3DgcZ5UPNKna4fe3X
         dBkJdHm9beiZ1Y52vAu21ucmPMhXUKWZj1eNlEPwf688ejbUK4QLF3xiicEZI/C5CVdh
         lrRmfUbUsa4dVx9/3rMwUv1mWPn8qfms1KDvqJnX8Eg0Dc5yAtvpvL5+8iTMI1MdjAZG
         Qubhpmrn6Ta7hwHyslqT92cC1hLvy8Oado6bcmAmv2Ab2wlAae2TThw+AuNWcs7pAdGF
         QHpmo/QTy0VGRDlSE3psLmk4DoR8DeS02YU7Alwo4EGgOsuSiriMqMZoEQDzUUE89zWL
         307g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HIo7VbIdBnuqt1PYA6Sd4OFam7/hvLGf4H98L+2uwOU=;
        b=61k6F3GL2Tbq4EJX45FaSKMhq6cExlOYyuf6jO+BNPCttgApGi3EMdXWPl9XBIjes6
         xhXsAwBhyfJnG/gQ+kHk2etZqLqVHgxefVRVkFuTOqssMS2vFSJ9LwXP0oDIGwWz5UQC
         jKmJPwV/tH0NscRBtffk6dxxLcNhaNs/uPyKoxtcVfS1XMEYb6802YW4hS2g2YX/PxCh
         GNy3KHHsN86i1bgdBl4MA3qkacLgwPCfUNk/XFJtJpMKjcJpXz9ZYZ4jMBQ4xODvPpGF
         9pMQvb3ei7Jwm2HziJgIKToyNk/nTeNq3zFWY1v9Au9q+cpjLyDpOslxQtsK0cBnDbnL
         bqBg==
X-Gm-Message-State: AOAM530bNM+iX8i66+h1sTjC34Gz1D+2zAQt3PgiOdCAaGC+u7FNRhBX
        SzYwQc+EzE68nVXsuKIr2bU=
X-Google-Smtp-Source: ABdhPJzmmJq5xBlHNIfeLEYb5lP/hF2kq7eFHYL8FBtyGAohXdE4tNNNNIctCtNm23jRwksNcTavqw==
X-Received: by 2002:a9d:802:: with SMTP id 2mr2752901oty.33.1633183721458;
        Sat, 02 Oct 2021 07:08:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p18sm1825355otk.7.2021.10.02.07.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 07:08:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 07:08:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 04/11] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <20211002140839.GB34532@roeck-us.net>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <b2aa14df2092e86191986cd558b48ee6536aa47d.1632984254.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2aa14df2092e86191986cd558b48ee6536aa47d.1632984254.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 30, 2021 at 08:59:36AM +0200, Krzysztof Adamski wrote:
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
> index f3d59ea347e3..7feef60a592c 100644
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
> +	if (i > MAX_CHANNELS) {

I think this needs to be >=. MAX_CHANNELS is 4, the array size
is 4, and i == 4 will write after the end of the array.

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
> -- 
> 2.31.1
> 
