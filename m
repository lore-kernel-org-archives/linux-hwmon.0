Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7196C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 18:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244033AbiBESXG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 13:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239916AbiBESXG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 13:23:06 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027BBC061348
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Feb 2022 10:23:04 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id c7-20020a4ad207000000b002e7ab4185d2so8705581oos.6
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Feb 2022 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SFBLOxRp0dPSuZJA+8Ky6FtrmZOD6vV9uEhp/4wOnsY=;
        b=CtzepP/TYkrs8n3kTxcl1LZeTuL2n78ea4wILK2EG8cVYpXT0So72+BNUNBqNs3v/l
         9gVGKew7JyBB6mt1jUNBR7mChrzbhIcYGXfFi0xN+11vjyxCiAcoVkf82zaguDcnvvfD
         9kM5dpCWVKBdA9R3oQa2MNhAv8pAwCZpbWKYPBVR3VGk8+ta8FTJGycYj3lylMgKAJh3
         L6ER4BGV7YaTM6YDTghzrj1MueeNRxY2lLr8jrVLNPhIj0D0//pXyskzhteDOuQxb/FM
         8ouIbYdZdBBbBfh8I7NK8LBK1tAfuoSBj/ZE4+mfWCk0b/33tyqOR58GYLLkgZZLkt8m
         hNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SFBLOxRp0dPSuZJA+8Ky6FtrmZOD6vV9uEhp/4wOnsY=;
        b=ioZF+LMBxhqJPzwELeQ2q4pQfuuGouQiYroOR1Bo6ox6Pppt2uwplnWZueduNvXUT3
         ai0gGIWpYtYdlQy/MwU5f692cHIr4PMhitpGUCUSo2BrStQ5EiYS2J1tX2pU4c9W1xd4
         +S+VJw/WHCaf7rThpQlxprQbt+bk03ew5akLUoYBPvj6cj4vvZxXmheP1iOeNbkAYoan
         S5zV7/50cErUu6J00tk1wbedRZXVhZ5CZfT2cNmsj2c3fjqc3yDFG8RRDT+ifQVxnLwl
         /kQMc+lvb1S3rEHZND5o5nNRRzRZOg64cv8MX0duFqpNcvJm6bL49wI0R8YE2+qzEYA5
         FTUg==
X-Gm-Message-State: AOAM531OigX2INP3H2TVTrbVfsWqRypL5GAcP6ArZlT3rgxJPIbVGY1s
        1AGDCG8sY72uQ1Zl2Zxe0PZEo5HRjkff2g==
X-Google-Smtp-Source: ABdhPJxadFQDJK7INRy/NpCbe07x+LiSXfUFjHtfv8ouHg+/Tc/pb25tPN5rV3YOBvbV/GuXqxrGlQ==
X-Received: by 2002:a05:6870:9884:: with SMTP id eg4mr2126004oab.80.1644085384141;
        Sat, 05 Feb 2022 10:23:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1sm217734otk.70.2022.02.05.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 10:23:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 5 Feb 2022 10:23:02 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1] hwmon: (tc654) Add thermal_cooling device support
Message-ID: <20220205182302.GA3079303@roeck-us.net>
References: <20220203212853.238739-1-chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203212853.238739-1-chunkeey@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 03, 2022 at 10:28:53PM +0100, Christian Lamparter wrote:
> Adds thermal_cooling device support to the tc654/tc655
> driver. This make it possible to integrate it into a
> device-tree supported thermal-zone node as a
> cooling device.
> 
> I have been using this patch as part of the Netgear WNDR4700
> Centria NAS Router support within OpenWrt since 2016.
> 
> Note: Driver uses imply THERMAL. The driver previously worked fine with
> just the hwmon interface. Now, if CONFIG_THERMAL is not selected, the
> devm_thermal_of_cooling_device_register() will be a
> "return ERR_PTR(-ENODEV)" stub.

What good does this do ? THERMAL is bool, so it is either there
or it isn't, and the IS_ENABLED() in the code handles that.

According to Kconfig language, "imply THERMAL" means that
THERMAL could be n, m, or y if SENSORS_TC654=y. THERMAL=m would,
if it were supported, be clearly wrong in that case.

Prior to commit 554b3529fe018 ("thermal/drivers/core: Remove the
module Kconfig's option"), THERMAL was tristate, and you would have
needed something like "depends on THERMAL || THERMAL=n". This
is, however, no longer needed.

Given this, I really don't understand what the imply is expected
to do. The above text does not explain that. Please either drop
the imply or provide a better explanation why it is needed.

> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>  drivers/hwmon/Kconfig |  1 +
>  drivers/hwmon/tc654.c | 95 +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 79 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8df25f1079ba..aa570bb05b38 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1135,6 +1135,7 @@ config SENSORS_MLXREG_FAN
>  config SENSORS_TC654
>  	tristate "Microchip TC654/TC655 and compatibles"
>  	depends on I2C
> +	imply THERMAL
>  	help
>  	  If you say yes here you get support for TC654 and TC655.
>  	  The TC654 and TC655 are PWM mode fan speed controllers with
> diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
> index cf2a3acd5c91..bf7aae62477a 100644
> --- a/drivers/hwmon/tc654.c
> +++ b/drivers/hwmon/tc654.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> +#include <linux/thermal.h>
>  #include <linux/util_macros.h>
>  
>  enum tc654_regs {
> @@ -367,36 +368,30 @@ static ssize_t pwm_mode_store(struct device *dev, struct device_attribute *da,
>  static const int tc654_pwm_map[16] = { 77,  88, 102, 112, 124, 136, 148, 160,
>  				      172, 184, 196, 207, 219, 231, 243, 255};
>  
> +static int get_pwm(struct tc654_data *data)
> +{
> +	if (data->config & TC654_REG_CONFIG_SDM)
> +		return 0;
> +	else
> +		return tc654_pwm_map[data->duty_cycle];
> +}
> +
>  static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
>  			char *buf)
>  {
>  	struct tc654_data *data = tc654_update_client(dev);
> -	int pwm;
>  
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
>  
> -	if (data->config & TC654_REG_CONFIG_SDM)
> -		pwm = 0;
> -	else
> -		pwm = tc654_pwm_map[data->duty_cycle];
> -
> -	return sprintf(buf, "%d\n", pwm);
> +	return sprintf(buf, "%d\n", get_pwm(data));
>  }
>  
> -static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> -			 const char *buf, size_t count)
> +static int _set_pwm(struct tc654_data *data, unsigned long val)
>  {
> -	struct tc654_data *data = dev_get_drvdata(dev);
>  	struct i2c_client *client = data->client;
> -	unsigned long val;
>  	int ret;
>  
> -	if (kstrtoul(buf, 10, &val))
> -		return -EINVAL;
> -	if (val > 255)
> -		return -EINVAL;
> -
>  	mutex_lock(&data->update_lock);
>  
>  	if (val == 0)
> @@ -416,6 +411,22 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
>  
>  out:
>  	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> +		       const char *buf, size_t count)

Please align continuation lines with '('.

> +{
> +	struct tc654_data *data = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	if (kstrtoul(buf, 10, &val))
> +		return -EINVAL;
> +	if (val > 255)
> +		return -EINVAL;
> +
> +	ret = _set_pwm(data, val);
>  	return ret < 0 ? ret : count;
>  }
>  
> @@ -447,6 +458,44 @@ static struct attribute *tc654_attrs[] = {
>  
>  ATTRIBUTE_GROUPS(tc654);
>  
> +/* cooling device */
> +
> +static int tc654_get_max_state(struct thermal_cooling_device *cdev,
> +			       unsigned long *state)
> +{
> +	*state = 255;
> +	return 0;
> +}
> +
> +static int tc654_get_cur_state(struct thermal_cooling_device *cdev,
> +			       unsigned long *state)
> +{
> +	struct tc654_data *data = tc654_update_client(cdev->devdata);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	*state = get_pwm(data);
> +	return 0;
> +}
> +
> +static int tc654_set_cur_state(struct thermal_cooling_device *cdev,
> +			       unsigned long state)
> +{
> +	struct tc654_data *data = tc654_update_client(cdev->devdata);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return _set_pwm(data, clamp_val(state, 0, 255));
> +}
> +
> +static const struct thermal_cooling_device_ops tc654_fan_cool_ops = {
> +	.get_max_state = tc654_get_max_state,
> +	.get_cur_state = tc654_get_cur_state,
> +	.set_cur_state = tc654_set_cur_state,
> +};
> +
>  /*
>   * device probe and removal
>   */
> @@ -477,7 +526,19 @@ static int tc654_probe(struct i2c_client *client)
>  	hwmon_dev =
>  	    devm_hwmon_device_register_with_groups(dev, client->name, data,
>  						   tc654_groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	if (IS_ENABLED(CONFIG_THERMAL)) {
> +		struct thermal_cooling_device *cdev;
> +
> +		cdev = devm_thermal_of_cooling_device_register(dev,
> +				dev->of_node, client->name, hwmon_dev,
> +				&tc654_fan_cool_ops);

Please align continuation lines with '('. You can go up to 100 columns.

> +		return PTR_ERR_OR_ZERO(cdev);
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct i2c_device_id tc654_id[] = {
