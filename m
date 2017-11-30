Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:41604 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750891AbdK3VTZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Nov 2017 16:19:25 -0500
Date: Thu, 30 Nov 2017 13:19:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (max31785) Add OF device ID table
Message-ID: <20171130211924.GA26964@roeck-us.net>
References: <20171130181257.3352-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130181257.3352-1-javierm@redhat.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 30, 2017 at 07:12:57PM +0100, Javier Martinez Canillas wrote:
> The driver doesn't have a struct of_device_id table but supported devices
> are registered via Device Trees. This is working on the assumption that a
> I2C device registered via OF will always match a legacy I2C device ID and
> that the MODALIAS reported will always be of the form i2c:<device>.
> 
> But this could change in the future so the correct approach is to have an
> OF device ID table if the devices are registered via OF.
> 
> Before this patch:
> 
> $ modinfo drivers/hwmon/pmbus/max31785.ko | grep alias
> alias:          i2c:max31785a
> alias:          i2c:max31785
> 
> After this patch:
> 
> $ modinfo drivers/hwmon/pmbus/max31785.ko | grep alias
> alias:          i2c:max31785a
> alias:          i2c:max31785
> alias:          of:N*T*Cmaxim,max31785aC*
> alias:          of:N*T*Cmaxim,max31785a
> alias:          of:N*T*Cmaxim,max31785C*
> alias:          of:N*T*Cmaxim,max31785
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Applied.

Thanks,
Guenter

> ---
> 
>  drivers/hwmon/pmbus/max31785.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 9313849d5160..4666b5e95159 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -100,9 +100,18 @@ static const struct i2c_device_id max31785_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, max31785_id);
>  
> +static const struct of_device_id max31785_of_match[] = {
> +	{ .compatible = "maxim,max31785" },
> +	{ .compatible = "maxim,max31785a" },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, max31785_of_match);
> +
>  static struct i2c_driver max31785_driver = {
>  	.driver = {
>  		.name = "max31785",
> +		.of_match_table = max31785_of_match,
>  	},
>  	.probe = max31785_probe,
>  	.remove = pmbus_do_remove,
> -- 
> 2.14.3
> 
