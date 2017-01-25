Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49752 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751595AbdAYNDK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2017 08:03:10 -0500
Date: Wed, 25 Jan 2017 14:03:04 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3] hwmon: Make name attribute mandatory for new APIs
Message-ID: <20170125140304.3c3f85f3@endymion>
In-Reply-To: <1485336880-16958-1-git-send-email-linux@roeck-us.net>
References: <1485336880-16958-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 25 Jan 2017 01:34:40 -0800, Guenter Roeck wrote:
> It does not make sense to use one of the the new APIs when not
> even providing a name attribute. Make it mandatory.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: hwmon_device_register() needs to call __hwmon_device_register() directly.
> v2: One should use ERR_PTR where appropriate
> 
>  drivers/hwmon/hwmon.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 0c5660ccdbf4..affff8195fff 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -651,6 +651,9 @@ hwmon_device_register_with_groups(struct device *dev, const char *name,
>  				  void *drvdata,
>  				  const struct attribute_group **groups)
>  {
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
> +
>  	return __hwmon_device_register(dev, name, drvdata, NULL, groups);
>  }
>  EXPORT_SYMBOL_GPL(hwmon_device_register_with_groups);
> @@ -674,6 +677,9 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
>  				const struct hwmon_chip_info *chip,
>  				const struct attribute_group **extra_groups)
>  {
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
> +
>  	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
>  		return ERR_PTR(-EINVAL);
>  
> @@ -695,7 +701,7 @@ struct device *hwmon_device_register(struct device *dev)
>  	dev_warn(dev,
>  		 "hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().\n");
>  
> -	return hwmon_device_register_with_groups(dev, NULL, NULL, NULL);
> +	return __hwmon_device_register(dev, NULL, NULL, NULL, NULL);
>  }
>  EXPORT_SYMBOL_GPL(hwmon_device_register);
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
