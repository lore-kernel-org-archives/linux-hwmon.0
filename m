Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40640 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728830AbeGTXBs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Jul 2018 19:01:48 -0400
Received: by mail-pg1-f196.google.com with SMTP id x5-v6so7912411pgp.7
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Jul 2018 15:11:35 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (iio_hwmon) Use devm functions
To: =?UTF-8?Q?Maxime_Roussin-B=c3=a9langer?=
        <maxime.roussinbelanger@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20180720144657.21577-1-maxime.roussinbelanger@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f45e647a-ed47-31b2-8619-bc0c3f2697e0@roeck-us.net>
Date: Fri, 20 Jul 2018 15:11:32 -0700
MIME-Version: 1.0
In-Reply-To: <20180720144657.21577-1-maxime.roussinbelanger@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/20/2018 07:46 AM, Maxime Roussin-Bélanger wrote:
> Use devm_iio_channel_get_all() to automatically release
> channels.
> 
> Use devm_hwmon_device_register_with_groups() to
> automatically unregister the device.
> 
> Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
> ---
>   drivers/hwmon/iio_hwmon.c | 43 ++++++++++-----------------------------
>   1 file changed, 11 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
> index 69031a0f7ed2..5cbd87b00ce0 100644
> --- a/drivers/hwmon/iio_hwmon.c
> +++ b/drivers/hwmon/iio_hwmon.c
> @@ -73,17 +73,16 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>   	if (dev->of_node && dev->of_node->name)
>   		name = dev->of_node->name;
>   
> -	channels = iio_channel_get_all(dev);
> +	channels = devm_iio_channel_get_all(dev);
>   	if (IS_ERR(channels)) {
>   		if (PTR_ERR(channels) == -ENODEV)
>   			return -EPROBE_DEFER;
>   		return PTR_ERR(channels);
>   	}
>   
>   	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
>   	if (st == NULL) {
> -		ret = -ENOMEM;
> -		goto error_release_channels;
> +		return -ENOMEM;
>   	}
>   
The { } is now no longer necessary. Please drop. Same almost everywhere below.

Thanks,
Guenter

>   	st->channels = channels;
> @@ -96,21 +95,19 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>   				 st->num_channels + 1, sizeof(*st->attrs),
>   				 GFP_KERNEL);
>   	if (st->attrs == NULL) {
> -		ret = -ENOMEM;
> -		goto error_release_channels;
> +		return -ENOMEM;
>   	}
>   
>   	for (i = 0; i < st->num_channels; i++) {
>   		a = devm_kzalloc(dev, sizeof(*a), GFP_KERNEL);
>   		if (a == NULL) {
> -			ret = -ENOMEM;
> -			goto error_release_channels;
> +			return -ENOMEM;
>   		}
>   
>   		sysfs_attr_init(&a->dev_attr.attr);
>   		ret = iio_get_channel_type(&st->channels[i], &type);
>   		if (ret < 0)
> -			goto error_release_channels;
> +			return ret;
>   
>   		switch (type) {
>   		case IIO_VOLTAGE:
> @@ -134,12 +131,10 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>   							       humidity_i++);
>   			break;
>   		default:
> -			ret = -EINVAL;
> -			goto error_release_channels;
> +			return -EINVAL;
>   		}
>   		if (a->dev_attr.attr.name == NULL) {
> -			ret = -ENOMEM;
> -			goto error_release_channels;
> +			return -ENOMEM;
>   		}
>   		a->dev_attr.show = iio_hwmon_read_val;
>   		a->dev_attr.attr.mode = S_IRUGO;
> @@ -152,31 +147,16 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>   
>   	sname = devm_kstrdup(dev, name, GFP_KERNEL);
>   	if (!sname) {
> -		ret = -ENOMEM;
> -		goto error_release_channels;
> +		return -ENOMEM;
>   	}
>   
>   	strreplace(sname, '-', '_');
> -	st->hwmon_dev = hwmon_device_register_with_groups(dev, sname, st,
> -							  st->groups);
> +	st->hwmon_dev = devm_hwmon_device_register_with_groups(dev, sname, st,
> +							       st->groups);
>   	if (IS_ERR(st->hwmon_dev)) {
> -		ret = PTR_ERR(st->hwmon_dev);
> -		goto error_release_channels;
> +		return PTR_ERR(st->hwmon_dev);
>   	}
>   	platform_set_drvdata(pdev, st);
> -	return 0;
> -
> -error_release_channels:
> -	iio_channel_release_all(channels);
> -	return ret;
> -}
> -
> -static int iio_hwmon_remove(struct platform_device *pdev)
> -{
> -	struct iio_hwmon_state *st = platform_get_drvdata(pdev);
> -
> -	hwmon_device_unregister(st->hwmon_dev);
> -	iio_channel_release_all(st->channels);
>   
>   	return 0;
>   }
> @@ -193,7 +173,6 @@ static struct platform_driver __refdata iio_hwmon_driver = {
>   		.of_match_table = iio_hwmon_of_match,
>   	},
>   	.probe = iio_hwmon_probe,
> -	.remove = iio_hwmon_remove,
>   };
>   
>   module_platform_driver(iio_hwmon_driver);
> 

