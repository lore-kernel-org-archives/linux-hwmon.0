Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03295C43334
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 18:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346697AbiFESHB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 14:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346726AbiFESG6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 14:06:58 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED08A45E;
        Sun,  5 Jun 2022 11:06:54 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-e5e433d66dso16745803fac.5;
        Sun, 05 Jun 2022 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lWkL01OdfZmv+OrKy4aQJZQNtxfRq4UfuFzKkcvu2Es=;
        b=andW+coNEKNwqQaBoO5ztr/esPwF83mkBXgVaYfdprxIPO89BhY9KJvmgjvZBCEv8i
         VxdQLRd2+LJw/vTIKfmxcCJQjGkbrdsMsjoM43koLexCCm7SnLw1ZuXMLedyoZX7zVbX
         nVdQKKYcTMSKbjXfNqjKyqKFvEHLsb5p+2+buGNdr3Wx5ypWpHSSIaH0FpN8o0hP+HVh
         COTiPhcusEnhMZEHvnTXU4CidZErlwZ6c0XNlCdeYL1ULPEvecZRE29nOo5KIxTei0Je
         FWZhtDe9Rbq/a8FXGYtzJDdB6GtL2PnQfEe7o+56PEFPvrCy1oZjqjQbH+Zb4z5HkxIv
         pDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lWkL01OdfZmv+OrKy4aQJZQNtxfRq4UfuFzKkcvu2Es=;
        b=xb+pQaQaYJYVwgEiXptBxov05wIUH+5o3J3cR29/ZBwuhLRz2Kc8YbqkJQwx9MYIh8
         RuaFHCrJRQedYTBuo2J9jNV7iQLnTYPGP2ZMJuA1wsSYcVf08xe4/+BaDBU0tSh7Z2xn
         Bth81W0fOg6xhBbgnMQ03iV+50AINPxDi3BfEeR815RuqkYz+iSwhbz8PxkyWgNLkSRi
         GTMvQ2zum499IthscouFBKqXIEIghl3dWXH2w7vMmavJZYBzXPgcgEvQYZUz0Y7nT65D
         lP6YWLSto08GylqKm5pJI+gg3szOWrJEUuA9Ak2knhopCf2fKk8Rm/cGS8gk19wpTLV9
         uBjQ==
X-Gm-Message-State: AOAM531VeCccW/elfBRhlEqczeVhVZrNTBO86VAlEB4UhJm0iCi3duZl
        ftJVS3aUH7Kc8rc7F//WRek=
X-Google-Smtp-Source: ABdhPJxv2NjfCxcvEGPx8wqDpbjbud+1k/Qv+nuRrfkvySqZ6ge0VSvG+pTQkVgEq5J7p2Ui74XeOQ==
X-Received: by 2002:a05:6870:b383:b0:e9:2fea:2148 with SMTP id w3-20020a056870b38300b000e92fea2148mr27199385oap.103.1654452414264;
        Sun, 05 Jun 2022 11:06:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s42-20020a05683043aa00b0060613c844adsm6601119otv.10.2022.06.05.11.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 11:06:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 11:06:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 6/7] hwmon: (lm90) Read the channel's label from
 device-tree
Message-ID: <20220605180652.GA3151812@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-7-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-7-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:56AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Try to read the channel's label from device-tree. Having label in
> device-tree node is not mandatory.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm90.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 82b020ffd490..3837c4ab5833 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -688,6 +688,7 @@ struct lm90_data {
>  	struct device *hwmon_dev;
>  	u32 chip_config[2];
>  	u32 channel_config[MAX_CHANNELS + 1];
> +	const char *channel_label[MAX_CHANNELS];
>  	struct hwmon_channel_info chip_info;
>  	struct hwmon_channel_info temp_info;
>  	const struct hwmon_channel_info *info[3];
> @@ -1610,6 +1611,7 @@ static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
>  	case hwmon_temp_emergency_alarm:
>  	case hwmon_temp_emergency_hyst:
>  	case hwmon_temp_fault:
> +	case hwmon_temp_label:
>  		return 0444;
>  	case hwmon_temp_min:
>  	case hwmon_temp_max:
> @@ -1729,6 +1731,16 @@ static int lm90_read(struct device *dev, enum hwmon_sensor_types type,
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
> @@ -2634,10 +2646,63 @@ static void lm90_regulator_disable(void *regulator)
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
> +		dev_err(dev, "invalid reg property value %d in %pOFn\n", id, child);
> +		return -EINVAL;
> +	}
> +
> +	err = of_property_read_string(child, "label", &data->channel_label[id]);
> +	if (err == -ENODATA || err == -EILSEQ) {
> +		dev_err(dev, "invalid label property in %pOFn\n", child);
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
>  
>  static const struct hwmon_ops lm90_ops = {
>  	.is_visible = lm90_is_visible,
>  	.read = lm90_read,
> +	.read_string = lm90_read_string,
>  	.write = lm90_write,
>  };
>  
> @@ -2775,6 +2840,13 @@ static int lm90_probe(struct i2c_client *client)
>  	/* Set maximum conversion rate */
>  	data->max_convrate = lm90_params[data->kind].max_convrate;
>  
> +	/* Parse device-tree channel information */
> +	if (client->dev.of_node) {
> +		err = lm90_parse_dt_channel_info(client, data);
> +		if (err)
> +			return err;
> +	}
> +
>  	/* Initialize the LM90 chip */
>  	err = lm90_init_client(client, data);
>  	if (err < 0) {
