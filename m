Return-path: <jdelvare@suse.de>
Date: Wed, 25 Jan 2017 10:04:28 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: Make name attribute mandatory for new APIs
Message-ID: <20170125100428.7aadc2b0@endymion>
In-Reply-To: <1485277034-12364-1-git-send-email-linux@roeck-us.net>
References: <1485277034-12364-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Tue, 24 Jan 2017 08:57:14 -0800, Guenter Roeck wrote:
> It does not make sense to use one of the the new APIs when not
> even providing a name attribute. Make it mandatory.

Fully agreed, but...

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: One should use ERR_PTR where appropriate
> 
>  drivers/hwmon/hwmon.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 0c5660ccdbf4..a408b10d9a86 100644
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

... this breaks hwmon_device_register(), which calls:

	return hwmon_device_register_with_groups(dev, NULL, NULL, NULL);
	                                              ^^^^
	                                              name

So you would have to change hwmon_device_register() to call
__hwmon_device_register() directly first.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

-- 
Jean Delvare
SUSE L3 Support
