Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37850 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752401AbdLELcg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Dec 2017 06:32:36 -0500
Received: by mail-pf0-f194.google.com with SMTP id n6so10988958pfa.4
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Dec 2017 03:32:36 -0800 (PST)
Subject: Re: [PATCH v2] hwmon: Deal with errors from the thermal subsystem
To: Linus Walleij <linus.walleij@linaro.org>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
References: <20171205083614.32537-1-linus.walleij@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <079a931b-42ef-4cf8-4ee8-29350160ab54@roeck-us.net>
Date: Tue, 5 Dec 2017 03:32:34 -0800
MIME-Version: 1.0
In-Reply-To: <20171205083614.32537-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/05/2017 12:36 AM, Linus Walleij wrote:
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

Applied.

Thanks,
Guenter

> ---
> ChangeLog v1->v2:
> - Explicitly discard -ENODEV as this is OK, forward any other
>    errors.
> ---
>   drivers/hwmon/hwmon.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index c9790e2c3440..af5123042990 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -143,6 +143,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
>   				    struct hwmon_device *hwdev, int index)
>   {
>   	struct hwmon_thermal_data *tdata;
> +	struct thermal_zone_device *tzd;
>   
>   	tdata = devm_kzalloc(dev, sizeof(*tdata), GFP_KERNEL);
>   	if (!tdata)
> @@ -151,8 +152,14 @@ static int hwmon_thermal_add_sensor(struct device *dev,
>   	tdata->hwdev = hwdev;
>   	tdata->index = index;
>   
> -	devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
> -					     &hwmon_thermal_ops);
> +	tzd = devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
> +						   &hwmon_thermal_ops);
> +	/*
> +	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
> +	 * so ignore that error but forward any other error.
> +	 */
> +	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
> +		return PTR_ERR(tzd);
>   
>   	return 0;
>   }
> @@ -621,14 +628,20 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>   				if (!chip->ops->is_visible(drvdata, hwmon_temp,
>   							   hwmon_temp_input, j))
>   					continue;
> -				if (info[i]->config[j] & HWMON_T_INPUT)
> -					hwmon_thermal_add_sensor(dev, hwdev, j);
> +				if (info[i]->config[j] & HWMON_T_INPUT) {
> +					err = hwmon_thermal_add_sensor(dev,
> +								hwdev, j);
> +					if (err)
> +						goto free_device;
> +				}
>   			}
>   		}
>   	}
>   
>   	return hdev;
>   
> +free_device:
> +	device_unregister(hdev);
>   free_hwmon:
>   	kfree(hwdev);
>   ida_remove:
> 

