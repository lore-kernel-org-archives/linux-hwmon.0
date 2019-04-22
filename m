Return-Path: <SRS0=n6ZT=SY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88253C10F11
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Apr 2019 13:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4632E2064A
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Apr 2019 13:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/3osI3Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfDVNkG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Apr 2019 09:40:06 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43803 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfDVNkF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Apr 2019 09:40:05 -0400
Received: by mail-pg1-f193.google.com with SMTP id z9so5872708pgu.10
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2019 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f3wN/xjJywQPUkBNkBzpOVpoYt3NmHlZbml2sJ+f00U=;
        b=W/3osI3YO0BSRijuK4EtrmGw0PDcLrEib9IUtVzKxYN45PmIilqjN6NUvOrn08ywGB
         6ycC5OZr9h/iVrdBAS0Bf9zGEaBiBjvctwxwF55tx4iyN50uMa0D6IH8kGda32ewm6WN
         sXhHdVI3J2m/piakm/yXuvURED3C5K08FnTzTTjA42/7jq+4r08YhGxHF+uQoQTmpLFf
         kmrdoN1EVm5VLBrPTOCBrunahglCMlcieMdgKQWA6Y2vQWafYnnuml7qQO26s0HxbrS8
         dVpj/ZsL7EqAkM9NqFEakQPhwjRbffSI1Fad+7wfSrSjt+9kOlWEouNKKbjhJGeBsGnx
         KyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=f3wN/xjJywQPUkBNkBzpOVpoYt3NmHlZbml2sJ+f00U=;
        b=BiElYGwJwf/ER+sUwBdyXuUJ5KSaqeu3WQ/RUCCkwzyI7KUvukC9XcYepNedLGG/8j
         ypaxLS0u5lI+RGZe/ykrSYkSmgX4zUsP9ywZd3Zz0wmIfBj4hTf30p1VYfwBf5HSXuSw
         4wsUyJL0pnYuqfU86WdL6kSxWZ6+ChOaFUZzbDJINtMbsuMqWjx5rejBch2EIqFCmBZw
         hULW1zF0wKTQr17y5WsNim/vORnhuYAOkb7YWd64n0AjhQjlfy7ylpSmw4fuDwXkbR6U
         XvwsfoWzWccD+RmHIxX6DZZKFnNFVQdudiqW8tyJ8GyixNA/JcXepokOi1qHUXe3JcTL
         ZszA==
X-Gm-Message-State: APjAAAUPu4ICu6TJ8BGeqoFCkB+oPW/9jv+IevB3onZariEmS73VMJOb
        BljFcszVkJXSGkmkqmwQFcM=
X-Google-Smtp-Source: APXvYqxCA9R2HodE0XJmQefs4ATe0C/ogOsp8Sz1CHC3VCPaicEcbwHg/Aw7CKqreT3OjdyUVmO1iQ==
X-Received: by 2002:a65:6205:: with SMTP id d5mr19167449pgv.61.1555940404927;
        Mon, 22 Apr 2019 06:40:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q80sm24122393pfa.66.2019.04.22.06.40.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Apr 2019 06:40:04 -0700 (PDT)
Date:   Mon, 22 Apr 2019 06:40:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190422134002.GA18419@roeck-us.net>
References: <201904192317.2UiQUP23%lkp@intel.com>
 <20190420030233.4651-1-jeff.dagenais@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190420030233.4651-1-jeff.dagenais@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Fri, Apr 19, 2019 at 11:02:33PM -0400, Jean-Francois Dagenais wrote:
> This allows max6650 devices to be referenced in dts as a cooling device.
> 
> The pwm value seems duplicated in cooling_dev_state but since pwm goes
> through rounding logic into data->dac, it is modified and messes with
> the thermal zone state algorithms. It's also better to serve a cache
> value, thus avoiding periodic actual i2c traffic.
> 
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>

I finally had some time to play with the driver and patch, and I do have
a concern after all. Please see below.

> ---
> Changes in v2:
>         - Removed left-over debug printk.
> Changes in v3:
>         - Add missing dependency in Kconfig
> Changes in v4:
> 	- Remove useless comment "thermal cooling device callbacks"
> 	- fix max6650_set_cur_state signature declaration style
> 	- Only warn when thermal_of_cooling_device_register fails
> Changes in v5:
> 	- Use switch to non-const client->name to prevent compiler warning
> 	- fix incorrect length of printk format long int
> 
>  drivers/hwmon/Kconfig   |  1 +
>  drivers/hwmon/max6650.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 91 insertions(+), 1 deletion(-)
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
> index 61135a2d0cff..0607d54f8090 100644
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
> @@ -727,7 +788,34 @@ static int max6650_probe(struct i2c_client *client,
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>  							   client->name, data,
>  							   data->groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	err = PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (err)
> +		return err;
> +
> +
> +#if IS_ENABLED(CONFIG_THERMAL)
> +	data->cooling_dev =
> +		thermal_of_cooling_device_register(client->dev.of_node,
> +						   client->name, data,
> +						   &max6650_cooling_ops);
> +	if (IS_ERR(data->cooling_dev))
> +		dev_warn(&client->dev,
> +			 "thermal cooling device register failed: %ld\n",
> +			 PTR_ERR(data->cooling_dev));
> +	else
> +		thermal_cdev_update(data->cooling_dev);

On a system which has CONFIG_THERMAL enabled but does not really utilize
it, the call to thermal_cdev_update() will result in the fan being stopped
immediately since max6650_set_cur_state() is called with state=0.

I see that this function called from pwm_fan.c. It is not called from
gpio-fan.c or npcm750-pwm-fan.c. Other than from pwm-fan.c, it is only
called from thermal governors, and not from any other thermal drivers
registering a thermal cooling device. This leads me to believe that
the calls from here and from pwm_fan.c may be wrong.

Are you sure that this call needed ? If so, can you explain ?
What happens in your system if you remove this call ?

Thanks,
Guenter

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
> @@ -743,6 +831,7 @@ static struct i2c_driver max6650_driver = {
>  		.of_match_table = of_match_ptr(max6650_dt_match),
>  	},
>  	.probe		= max6650_probe,
> +	.remove		= max6650_remove,
>  	.id_table	= max6650_id,
>  };
>  
