Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44897 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387933AbeGWTop (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jul 2018 15:44:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1-v6so984461pgp.11
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Jul 2018 11:42:13 -0700 (PDT)
Date: Mon, 23 Jul 2018 11:42:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime =?iso-8859-1?Q?Roussin-B=E9langer?=
        <maxime.roussinbelanger@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2] hwmon: (iio_hwmon) Use devm functions
Message-ID: <20180723184211.GA9521@roeck-us.net>
References: <20180723033329.28213-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180723033329.28213-1-maxime.roussinbelanger@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Jul 22, 2018 at 11:33:29PM -0400, Maxime Roussin-Bélanger wrote:
> Use devm_iio_channel_get_all() to automatically release
> channels.
> 
> Use devm_hwmon_device_register_with_groups() to
> automatically unregister the device.
> 
> Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

Applied, with a couple of additional changes (see below).

Thanks,
Guenter

> ---
> Changes in v2:
> 	- Remove unnecessary {}
> 
> drivers/hwmon/iio_hwmon.c | 63 ++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
> index a3a1d1cb2f27..44d7dfe9cb46 100644
> --- a/drivers/hwmon/iio_hwmon.c
> +++ b/drivers/hwmon/iio_hwmon.c
> @@ -73,44 +73,38 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  	if (dev->of_node && dev->of_node->name)
>  		name = dev->of_node->name;
>  
> -	channels = iio_channel_get_all(dev);
> +	channels = devm_iio_channel_get_all(dev);
>  	if (IS_ERR(channels)) {
>  		if (PTR_ERR(channels) == -ENODEV)
>  			return -EPROBE_DEFER;
>  		return PTR_ERR(channels);
>  	}
>  
>  	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> -	if (st == NULL) {
> -		ret = -ENOMEM;
> -		goto error_release_channels;
> -	}
> +	if (st == NULL)
> +		return -ENOMEM;
>  
>  	st->channels = channels;
>  
>  	/* count how many attributes we have */
>  	while (st->channels[st->num_channels].indio_dev)
>  		st->num_channels++;
>  
>  	st->attrs = devm_kzalloc(dev,
>  				 sizeof(*st->attrs) * (st->num_channels + 1),
>  				 GFP_KERNEL);
> -	if (st->attrs == NULL) {
> -		ret = -ENOMEM;
> -		goto error_release_channels;
> -	}
> +	if (st->attrs == NULL)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < st->num_channels; i++) {
>  		a = devm_kzalloc(dev, sizeof(*a), GFP_KERNEL);
> -		if (a == NULL) {
> -			ret = -ENOMEM;
> -			goto error_release_channels;
> -		}
> +		if (a == NULL)
> +			return -ENOMEM;
>  
>  		sysfs_attr_init(&a->dev_attr.attr);
>  		ret = iio_get_channel_type(&st->channels[i], &type);
>  		if (ret < 0)
> -			goto error_release_channels;
> +			return ret;
>  
>  		switch (type) {
>  		case IIO_VOLTAGE:
> @@ -138,49 +132,31 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  							       humidity_i++);
>  			break;
>  		default:
> -			ret = -EINVAL;
> -			goto error_release_channels;
> -		}
> -		if (a->dev_attr.attr.name == NULL) {
> -			ret = -ENOMEM;
> -			goto error_release_channels;
> +			return -EINVAL;
>  		}
> +		if (a->dev_attr.attr.name == NULL)
> +			return -ENOMEM;
> +
>  		a->dev_attr.show = iio_hwmon_read_val;
>  		a->dev_attr.attr.mode = S_IRUGO;
>  		a->index = i;
>  		st->attrs[i] = &a->dev_attr.attr;
>  	}
>  
>  	st->attr_group.attrs = st->attrs;
>  	st->groups[0] = &st->attr_group;
>  
>  	sname = devm_kstrdup(dev, name, GFP_KERNEL);
> -	if (!sname) {
> -		ret = -ENOMEM;
> -		goto error_release_channels;
> -	}
> +	if (!sname)
> +		return -ENOMEM;
>  
>  	strreplace(sname, '-', '_');
> -	st->hwmon_dev = hwmon_device_register_with_groups(dev, sname, st,
> -							  st->groups);
> -	if (IS_ERR(st->hwmon_dev)) {
> -		ret = PTR_ERR(st->hwmon_dev);
> -		goto error_release_channels;
> -	}
> -	platform_set_drvdata(pdev, st);
> -	return 0;
> -
> -error_release_channels:
> -	iio_channel_release_all(channels);
> -	return ret;
> -}
> +	st->hwmon_dev = devm_hwmon_device_register_with_groups(dev, sname, st,
> +							       st->groups);

st->hwmon_dev is now unnecessary. Changed to local variable.

> +	if (IS_ERR(st->hwmon_dev))
> +		return PTR_ERR(st->hwmon_dev);
>  
> -static int iio_hwmon_remove(struct platform_device *pdev)
> -{
> -	struct iio_hwmon_state *st = platform_get_drvdata(pdev);
> -
> -	hwmon_device_unregister(st->hwmon_dev);
> -	iio_channel_release_all(st->channels);
> +	platform_set_drvdata(pdev, st);

This is now unnecessary. Dropped. With this, the simplified the code to

	hwmon_dev = devm_hwmon_device_register_with_groups(dev, sname, st,
							   st->groups);
	return PTR_ERR_OR_ZERO(hwmon_dev);

>  
>  	return 0;
>  }
> @@ -197,7 +173,6 @@ static struct platform_driver __refdata iio_hwmon_driver = {
>  		.of_match_table = iio_hwmon_of_match,
>  	},
>  	.probe = iio_hwmon_probe,
> -	.remove = iio_hwmon_remove,
>  };
>  
>  module_platform_driver(iio_hwmon_driver);
