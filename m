Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36236 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbdLDXwH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Dec 2017 18:52:07 -0500
Received: by mail-pg0-f65.google.com with SMTP id k134so9383036pga.3
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Dec 2017 15:52:07 -0800 (PST)
Date: Mon, 4 Dec 2017 15:52:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Deal with errors from the thermal subsystem
Message-ID: <20171204235205.GA3396@roeck-us.net>
References: <20171204222029.11956-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171204222029.11956-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Dec 04, 2017 at 11:20:29PM +0100, Linus Walleij wrote:
> If the thermal subsystem returne -EPROBE_DEFER or any other error
> when hwmon calls devm_thermal_zone_of_sensor_register(), this is
> silently ignored.
> 
> I ran into this with an incorrectly defined thermal zone, making
> it non-existing and thus this call failed with -EPROBE_DEFER
> assuming it would appear later. The sensor was still added
> which is incorrect: sensors must strictly be added after the
> thermal zones, so deferred probe must be respected.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/hwmon/hwmon.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index c9790e2c3440..6d1cb6b47490 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -143,6 +143,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
>  				    struct hwmon_device *hwdev, int index)
>  {
>  	struct hwmon_thermal_data *tdata;
> +	struct thermal_zone_device *tzd;
>  
>  	tdata = devm_kzalloc(dev, sizeof(*tdata), GFP_KERNEL);
>  	if (!tdata)
> @@ -151,8 +152,10 @@ static int hwmon_thermal_add_sensor(struct device *dev,
>  	tdata->hwdev = hwdev;
>  	tdata->index = index;
>  
> -	devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
> -					     &hwmon_thermal_ops);
> +	tzd = devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
> +						   &hwmon_thermal_ops);
> +	if (IS_ERR(tzd))
> +		return PTR_ERR(tzd);

This won't work because devm_thermal_zone_of_sensor_register() returns
-ENODEV if CONFIG_THERMAL_OF is disabled. We'll have to check for
-EPROBE_DEFER and only return this specific error, but ignore all others.

Thanks,
Guenter

>  
>  	return 0;
>  }
> @@ -621,14 +624,20 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>  				if (!chip->ops->is_visible(drvdata, hwmon_temp,
>  							   hwmon_temp_input, j))
>  					continue;
> -				if (info[i]->config[j] & HWMON_T_INPUT)
> -					hwmon_thermal_add_sensor(dev, hwdev, j);
> +				if (info[i]->config[j] & HWMON_T_INPUT) {
> +					err = hwmon_thermal_add_sensor(dev,
> +								hwdev, j);
> +					if (err)
> +						goto free_device;
> +				}
>  			}
>  		}
>  	}
>  
>  	return hdev;
>  
> +free_device:
> +	device_unregister(hdev);
>  free_hwmon:
>  	kfree(hwdev);
>  ida_remove:
> -- 
> 2.14.3
> 
