Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F6BC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 17:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5582214DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 17:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNLyXYkv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388299AbfDRRi7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 13:38:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43990 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731317AbfDRRi7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 13:38:59 -0400
Received: by mail-pl1-f193.google.com with SMTP id n8so1477428plp.10
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DsnjFKh6XNlw/tTBIbW5foAfH7rCQQwLHZJ95YKKxpY=;
        b=GNLyXYkv86f6YGt1ZHku29WKJ+chk5zD5FNKkalfIiswHbjRkiftKvPItMhacST1wN
         GpRbC0yHCUFVGlMbXZrXm0wSsyu7TaNje61yPTyfO+JUB8977PZw4FtgXtG5LEQ0uRlW
         NLx3Fy7y5lzwNaR88nX9ogfEgJw7Ciw15NLEdItkATrEiMLmJU5vxcRf6ZZBMCvzwJqo
         ixei5QhrL4M3KaGdwmhFvZ48Ktawz4ClacJcStiK+HyXuyydx/GakLxQABJefuooEpk4
         RKdvOHIYnIGY7p/nxrjN8UsX9HPe2GSXtehhbpupcYvPRnp8DIVJnlJZT5gFWWGqYTv5
         wYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DsnjFKh6XNlw/tTBIbW5foAfH7rCQQwLHZJ95YKKxpY=;
        b=Z1xA3kFx+tLGqyuQupggxwaz7VearqC1H0z7lgf92jnEMSyUN4UMW5BtMojCM+u1ym
         MUbJN2I30QB862EMTGJyzHRZ0JHLBLLfMmchJOyKGrgMrdQ0uhomXTZQDznfH9/Y5ZTx
         TIMxFWtOLkumat8Le9o0MBsN5ArVfo7LMCmNeQ1trZX7zzxX+H4Cc+ppYMgOT2Zu7byV
         +4l1MsrE5nucJnLz2maZtHEnASjOLlGPiCQZiuuJyfpO9RF6UJ/P5mSb8OaMtEe8cpEn
         IfMMlYwD5hdRykyWxFY+7kxcHGmZu1eEGsykEjYr0ff9x2ngmjpcHUWeL/vQnebWz764
         tBKQ==
X-Gm-Message-State: APjAAAU1cRAiFR6qSvYk8JoLGcbfR0Xga33+peLdZzoN1A+f/03aDlev
        sdlyPBxxZ59woU9r3kFxAJMV7z8K
X-Google-Smtp-Source: APXvYqyAfCmRlTCFs+S/PMRNofOs0pyGq25MnMNwYzPlTMfuXWpUi+KshUCP7nRoTkX+HEInZePk/Q==
X-Received: by 2002:a17:902:8a8b:: with SMTP id p11mr96480110plo.227.1555609138329;
        Thu, 18 Apr 2019 10:38:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 25sm4939311pfo.145.2019.04.18.10.38.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 10:38:57 -0700 (PDT)
Date:   Thu, 18 Apr 2019 10:38:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190418173856.GB7804@roeck-us.net>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418164813.21053-1-jeff.dagenais@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 12:48:13PM -0400, Jean-Francois Dagenais wrote:
> This allows max6650 devices to be referenced in dts as a cooling device.
> 
> The pwm value seems duplicated in cooling_dev_state but since pwm goes
> through rounding logic into data->dac, it is modified and messes with
> the thermal zone state algorithms. It's also better to serve a cache
> value, thus avoiding periodic actual i2c traffic.
> 
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> ---
> Changes in v2:
> 	Removed left-over debug printk.
> 
>  drivers/hwmon/max6650.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
> index 61135a2d0cff..f1cbbaaa1206 100644
> --- a/drivers/hwmon/max6650.c
> +++ b/drivers/hwmon/max6650.c
> @@ -40,6 +40,7 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
>  #include <linux/of_device.h>
> +#include <linux/thermal.h>
>  
>  /*
>   * Insmod parameters
> @@ -113,6 +114,7 @@ module_param(clock, int, 0444);
>  struct max6650_data {
>  	struct i2c_client *client;
>  	const struct attribute_group *groups[3];
> +	struct thermal_cooling_device *cooling_dev;
>  	struct mutex update_lock;
>  	int nr_fans;
>  	char valid; /* zero until following fields are valid */
> @@ -125,6 +127,7 @@ struct max6650_data {
>  	u8 count;
>  	u8 dac;
>  	u8 alarm;
> +	unsigned long cooling_dev_state;
>  };
>  
>  static const u8 tach_reg[] = {
> @@ -694,6 +697,63 @@ static int max6650_init_client(struct max6650_data *data,
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_THERMAL)
> +/* thermal cooling device callbacks */
> +static int max6650_get_max_state(struct thermal_cooling_device *cdev,
> +				 unsigned long *state)
> +{
> +	*state = 255;
> +
> +	return 0;
> +}
> +
> +static int max6650_get_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long *state)
> +{
> +	struct max6650_data *data = cdev->devdata;
> +
> +	*state = data->cooling_dev_state;
> +
> +	return 0;
> +}
> +
> +static int
> +max6650_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +	struct max6650_data *data = cdev->devdata;
> +	struct i2c_client *client = data->client;
> +	int err;
> +
> +	state = clamp_val(state, 0, 255);
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (data->config & MAX6650_CFG_V12)
> +		data->dac = 180 - (180 * state)/255;
> +	else
> +		data->dac = 76 - (76 * state)/255;
> +
> +	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
> +
> +	if (!err) {
> +		max6650_set_operating_mode(data, state ?
> +						   MAX6650_CFG_MODE_OPEN_LOOP :
> +						   MAX6650_CFG_MODE_OFF);
> +		data->cooling_dev_state = state;
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return err < 0 ? err : 0;
> +}
> +
> +static const struct thermal_cooling_device_ops max6650_cooling_ops = {
> +	.get_max_state = max6650_get_max_state,
> +	.get_cur_state = max6650_get_cur_state,
> +	.set_cur_state = max6650_set_cur_state,
> +};
> +#endif
> +
>  static int max6650_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> @@ -709,6 +769,7 @@ static int max6650_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  
>  	data->client = client;
> +	i2c_set_clientdata(client, data);
>  	mutex_init(&data->update_lock);
>  	data->nr_fans = of_id ? (int)(uintptr_t)of_id->data : id->driver_data;
>  
> @@ -727,7 +788,34 @@ static int max6650_probe(struct i2c_client *client,
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>  							   client->name, data,
>  							   data->groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	err = PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (err)
> +		return err;
> +
> +#if IS_ENABLED(CONFIG_THERMAL)

This will result in missing symbols if THERMAL is built as module
and this driver is built into the kernel. You'll have to adjust
Kconfig dependencies accordingly. See other drivers for examples.

> +	data->cooling_dev =
> +		thermal_of_cooling_device_register(client->dev.of_node,
> +						   id->name, data,
> +						   &max6650_cooling_ops);
> +	if (IS_ERR(data->cooling_dev)) {
> +		err = PTR_ERR(data->cooling_dev);
> +		dev_err(&client->dev,
> +			"Failed to register as cooling device (%d)\n", err);
> +		return err;

Why would it be fatal for the driver if this fails ? It wasn't
fatal before.

> +	}
> +
> +	thermal_cdev_update(data->cooling_dev);
> +#endif
> +	return 0;
> +}
> +
> +static int max6650_remove(struct i2c_client *client)
> +{
> +	struct max6650_data *data = i2c_get_clientdata(client);
> +
> +	thermal_cooling_device_unregister(data->cooling_dev);
> +
> +	return 0;
>  }
>  
>  static const struct i2c_device_id max6650_id[] = {
> @@ -743,6 +831,7 @@ static struct i2c_driver max6650_driver = {
>  		.of_match_table = of_match_ptr(max6650_dt_match),
>  	},
>  	.probe		= max6650_probe,
> +	.remove		= max6650_remove,
>  	.id_table	= max6650_id,
>  };
>  
> -- 
> 2.11.0
> 
