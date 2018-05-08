Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36430 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755915AbeEHWQJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 May 2018 18:16:09 -0400
Date: Tue, 8 May 2018 15:16:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lucas Magasweran <lucas.magasweran@ieee.org>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: hwmon: (core) check parent dev != NULL when chip != NULL
Message-ID: <20180508221607.GA7176@roeck-us.net>
References: <1525779813-25716-2-git-send-email-lucas.magasweran@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525779813-25716-2-git-send-email-lucas.magasweran@ieee.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 08, 2018 at 04:43:33AM -0700, Lucas Magasweran wrote:
> hwmon_device_register_with_info() registration API requires a
> non-NULL parent device when chip is non-NULL.
> 
> This commit adds a check and documents this requirement.
> 
> Signed-off-by: Lucas Magasweran <lucas.magasweran@ieee.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/hwmon-kernel-api.txt | 3 ++-
>  drivers/hwmon/hwmon.c                    | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
> index 53a8066..eb7a78a 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.txt
> +++ b/Documentation/hwmon/hwmon-kernel-api.txt
> @@ -71,7 +71,8 @@ hwmon_device_register_with_info is the most comprehensive and preferred means
>  to register a hardware monitoring device. It creates the standard sysfs
>  attributes in the hardware monitoring core, letting the driver focus on reading
>  from and writing to the chip instead of having to bother with sysfs attributes.
> -Its parameters are described in more detail below.
> +The parent device parameter cannot be NULL with non-NULL chip info. Its
> +parameters are described in more detail below.
>  
>  devm_hwmon_device_register_with_info is similar to
>  hwmon_device_register_with_info. However, it is device managed, meaning the
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 32083e4..e88c019 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -698,6 +698,9 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
>  	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
>  		return ERR_PTR(-EINVAL);
>  
> +	if (chip && !dev)
> +		return ERR_PTR(-EINVAL);
> +
>  	return __hwmon_device_register(dev, name, drvdata, chip, extra_groups);
>  }
>  EXPORT_SYMBOL_GPL(hwmon_device_register_with_info);
