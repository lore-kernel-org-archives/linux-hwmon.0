Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40071 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753006AbcGZPu7 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 26 Jul 2016 11:50:59 -0400
Date: Tue, 26 Jul 2016 08:50:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, antoine.tenart@free-electrons.com
Subject: Re: [PATCH] hwmon: iio_hwmon: fix memory leak in name attribute
Message-ID: <20160726155052.GB30628@roeck-us.net>
References: <1469519229-11749-1-git-send-email-quentin.schulz@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469519229-11749-1-git-send-email-quentin.schulz@free-electrons.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 26, 2016 at 09:47:09AM +0200, Quentin Schulz wrote:
> The "name" variable's memory is now freed when the device is destructed
> thanks to devm function.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/iio_hwmon.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
> index 0a00bfb..777f2b5 100644
> --- a/drivers/hwmon/iio_hwmon.c
> +++ b/drivers/hwmon/iio_hwmon.c
> @@ -110,24 +110,24 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  
>  		switch (type) {
>  		case IIO_VOLTAGE:
> -			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
> -							  "in%d_input",
> -							  in_i++);
> +			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> +							       "in%d_input",
> +							       in_i++);
>  			break;
>  		case IIO_TEMP:
> -			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
> -							  "temp%d_input",
> -							  temp_i++);
> +			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> +							       "temp%d_input",
> +							       temp_i++);
>  			break;
>  		case IIO_CURRENT:
> -			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
> -							  "curr%d_input",
> -							  curr_i++);
> +			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> +							       "curr%d_input",
> +							       curr_i++);
>  			break;
>  		case IIO_HUMIDITYRELATIVE:
> -			a->dev_attr.attr.name = kasprintf(GFP_KERNEL,
> -							  "humidity%d_input",
> -							  humidity_i++);
> +			a->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
> +							       "humidity%d_input",
> +							       humidity_i++);
>  			break;
>  		default:
>  			ret = -EINVAL;
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
