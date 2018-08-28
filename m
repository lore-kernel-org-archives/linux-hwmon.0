Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32955 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbeH1Wgc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Aug 2018 18:36:32 -0400
Date: Tue, 28 Aug 2018 11:43:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Convert to using %pOFn instead of device_node.name
Message-ID: <20180828184333.GA27545@roeck-us.net>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-20-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828015252.28511-20-robh@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 27, 2018 at 08:52:21PM -0500, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>  drivers/hwmon/ibmpowernv.c       | 4 ++--
>  drivers/hwmon/iio_hwmon.c        | 9 ++++-----
>  drivers/hwmon/npcm750-pwm-fan.c  | 2 +-
>  4 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 5e449eac788a..92de8139d398 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -852,7 +852,7 @@ static int aspeed_create_pwm_cooling(struct device *dev,
>  		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
>  		return ret;
>  	}
> -	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%s%d", child->name, pwm_port);
> +	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%pOFn%d", child, pwm_port);
>  
>  	cdev->tcdev = thermal_of_cooling_device_register(child,
>  							 cdev->name,
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 83472808c816..4935897f1527 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -603,8 +603,8 @@ static int create_device_attrs(struct platform_device *pdev)
>  		if (of_property_read_u32(np, "sensor-id", &sensor_id) &&
>  		    of_property_read_u32(np, "sensor-data", &sensor_id)) {
>  			dev_info(&pdev->dev,
> -				 "'sensor-id' missing in the node '%s'\n",
> -				 np->name);
> +				 "'sensor-id' missing in the node '%pOFn'\n",
> +				 np);
>  			continue;
>  		}
>  
> diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
> index 2f3f875c06ac..7566991f1c04 100644
> --- a/drivers/hwmon/iio_hwmon.c
> +++ b/drivers/hwmon/iio_hwmon.c
> @@ -65,13 +65,9 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  	int in_i = 1, temp_i = 1, curr_i = 1, humidity_i = 1;
>  	enum iio_chan_type type;
>  	struct iio_channel *channels;
> -	const char *name = "iio_hwmon";
>  	struct device *hwmon_dev;
>  	char *sname;
>  
> -	if (dev->of_node && dev->of_node->name)
> -		name = dev->of_node->name;
> -
>  	channels = devm_iio_channel_get_all(dev);
>  	if (IS_ERR(channels)) {
>  		if (PTR_ERR(channels) == -ENODEV)
> @@ -141,7 +137,10 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  	st->attr_group.attrs = st->attrs;
>  	st->groups[0] = &st->attr_group;
>  
> -	sname = devm_kstrdup(dev, name, GFP_KERNEL);
> +	if (dev->of_node)
> +		sname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
> +	else
> +		sname = devm_kstrdup(dev, "iio_hwmon", GFP_KERNEL);
>  	if (!sname)
>  		return -ENOMEM;
>  
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index 8474d601aa63..96634fd54e0b 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -861,7 +861,7 @@ static int npcm7xx_create_pwm_cooling(struct device *dev,
>  		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
>  		return ret;
>  	}
> -	snprintf(cdev->name, THERMAL_NAME_LENGTH, "%s%d", child->name,
> +	snprintf(cdev->name, THERMAL_NAME_LENGTH, "%pOFn%d", child,
>  		 pwm_port);
>  
>  	cdev->tcdev = thermal_of_cooling_device_register(child,
