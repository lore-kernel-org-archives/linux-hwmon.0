Return-Path: <SRS0=Ylrj=SV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0232FC282DA
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Apr 2019 18:46:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B919D205F4
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Apr 2019 18:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muBfdF+y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfDSSqM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:46:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39107 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfDSSqM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Apr 2019 14:46:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id e92so1178609plb.6
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Apr 2019 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/B10qnenxQj3DYax4abGvdhzKBg4OENCsTsd63P7kbg=;
        b=muBfdF+y9ZO+DPqs3n1H5rv0bitrmSdNXmGH6K0U0ZNfYimoAGjn17uB3OvNGDq8VF
         SzDZMnus8tXFA25zSMRo4qOi87vBRTjGXebWdtECReg73jr2xRR1NRezNiiopR0GLbJe
         axdnqi6xEOy9dyrjw3zvhKQmxIZMJbFFrjRTWVsrlMGRWr+fRuhtdUoBOcQOITdGkFAo
         JbrXFhgARrWsw3lqTOzCL9MvhkSQOoXT9WPRk7sC3DuGQqAqABUxoay9Bppv7nOt0Kxt
         rkcBGIb9P5ye2WsS0oDUXzjge7DNXVx17E1lFywDtgJv7dx9tpDVedfz2I2l6eK8p1G8
         DkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=/B10qnenxQj3DYax4abGvdhzKBg4OENCsTsd63P7kbg=;
        b=Es4Ew9h5KEa/x936fDZIbm4KeG/EdtKjAtJcKkcnfCZV0b72g37Mfu8MY9hjK+DFm6
         PU0LVRGkzYALFvMxZMgkGEupqRFFimIEADeMSJRA48WYIeO/rm1g3q4A+C4mksRzNkpV
         uIrnQBWWHatH1HYoflrPbiXZA5Fx8CBBfaBptbg2H0TY+sEKeCwubO8JY2TN7pzjqX/4
         LvsKqF0tzDH5qYtnpxxaNE7gvejFHFt35ZYUTYhM5mVQF9YiRq7xrF0+tuEVR5WaZ5DK
         6HAnXaGAJ3ZkhmDLa5ISYTdp4t2jgVQcUmTxuX6nNfH9VdiKYdT+vFYh9168Eb0EIP2w
         3ulg==
X-Gm-Message-State: APjAAAWhbvm5j8qnOTBO8ti6R5iZFoVsCJhayPCOZg18ZXmONP4FIDFb
        jVZ9dRgLBJ3VlJj4YW492iuF/TMv
X-Google-Smtp-Source: APXvYqxpdTlzX5FDBQ0U111nqvrZ0mEvzHYEpOPc43QMSYB0jt0xLPoXZ2S2IadkbodtM11mBeBwsA==
X-Received: by 2002:a17:902:f08a:: with SMTP id go10mr3664189plb.121.1555679723169;
        Fri, 19 Apr 2019 06:15:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w189sm10325990pfw.147.2019.04.19.06.15.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Apr 2019 06:15:21 -0700 (PDT)
Date:   Fri, 19 Apr 2019 06:15:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v4] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190419131520.GA2566@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 08:57:22PM -0400, Jean-Francois Dagenais wrote:
> This allows max6650 devices to be referenced in dts as a cooling device.
> 
> The pwm value seems duplicated in cooling_dev_state but since pwm goes
> through rounding logic into data->dac, it is modified and messes with
> the thermal zone state algorithms. It's also better to serve a cache
> value, thus avoiding periodic actual i2c traffic.
> 
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>

Looking into this more closely, I notice that it has a substantial downside:
It only registers one channel with the thermal subsystem. That is ok for
max6650, but it is a problem for max6651. There, it only registers a single
channel. Worse, extending it later would be difficult since the single-channel
support implies that the thermal data in the dts file would (probably) have to
look completely different for multi-channel support.

How does your proposed dts file look like ? Can we possibly adjust it to work
with multiple channels (ie with all channels of max6651) ?

Thanks,
Guenter

> ---
> Changes in v2:
>         - Removed left-over debug printk.
> Changes in v3:
>         - Add missing dependency in Kconfig
> Changes in v4:
> 	- Remove useless comment "thermal cooling device callbacks"
> 	- fix max6650_set_cur_state signature declaration style
> 	- Only warn when thermal_of_cooling_device_register fails
> 
>  drivers/hwmon/Kconfig   |  1 +
>  drivers/hwmon/max6650.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d0f1dfe2bcbb..46d69fcdd48b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -898,6 +898,7 @@ config SENSORS_MAX6642
>  config SENSORS_MAX6650
>  	tristate "Maxim MAX6650 sensor chip"
>  	depends on I2C
> +	depends on THERMAL || THERMAL=n
>  	help
>  	  If you say yes here you get support for the MAX6650 / MAX6651
>  	  sensor chips.
> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
> index 61135a2d0cff..137395ea5e95 100644
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
> +
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
> +static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long state)
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
> @@ -727,7 +788,33 @@ static int max6650_probe(struct i2c_client *client,
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>  							   client->name, data,
>  							   data->groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	err = PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (err)
> +		return err;
> +
> +#if IS_ENABLED(CONFIG_THERMAL)
> +	data->cooling_dev =
> +		thermal_of_cooling_device_register(client->dev.of_node,
> +						   id->name, data,
> +						   &max6650_cooling_ops);
> +	if (IS_ERR(data->cooling_dev))
> +		dev_warn(&client->dev,
> +			 "thermal cooling device register failed: %d\n",
> +			 PTR_ERR(data->cooling_dev));
> +	else
> +		thermal_cdev_update(data->cooling_dev);
> +#endif
> +	return 0;
> +}
> +
> +static int max6650_remove(struct i2c_client *client)
> +{
> +	struct max6650_data *data = i2c_get_clientdata(client);
> +
> +	if (!IS_ERR(data->cooling_dev))
> +		thermal_cooling_device_unregister(data->cooling_dev);
> +
> +	return 0;
>  }
>  
>  static const struct i2c_device_id max6650_id[] = {
> @@ -743,6 +830,7 @@ static struct i2c_driver max6650_driver = {
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
