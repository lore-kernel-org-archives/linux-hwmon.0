Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33520 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752000AbdGGSSa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2017 14:18:30 -0400
Date: Fri, 7 Jul 2017 11:18:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cengiz Can <cengizc@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: applesmc: fix deprecated hwmon_device_register
 call
Message-ID: <20170707181828.GB25433@roeck-us.net>
References: <20170702000505.2650-1-cengizc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170702000505.2650-1-cengizc@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Jul 02, 2017 at 03:05:05AM +0300, Cengiz Can wrote:
> Hello.
> 
> This is my first patch attempt on drivers so I might be completely wrong.
> 
> applesmc driver was using the deprecated `hwmon_device_register` call for
> some reason. And that causes a deprecation warning in dmesg.
> 
> I've replaced the call with `hwmon_device_register_with_info` and booted
> my MBP 11,2 with it.
> 
> The warning is no longer shown. And the functionality doesn't seem to be
> broken.
> 
> Thank you for reading this.
> 

Do you really want all of the above in the change log ?

> Signed-off-by: Cengiz Can <cengizc@gmail.com>
> ---
>  drivers/hwmon/applesmc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 0af7fd311979..6e897310151a 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -1326,7 +1326,11 @@ static int __init applesmc_init(void)
>  	if (ret)
>  		goto out_light_sysfs;
>  
> -	hwmon_dev = hwmon_device_register(&pdev->dev);
> +	hwmon_dev = hwmon_device_register_with_info(&pdev->dev,
> +						   "applesmcbacklight",
> +						   NULL,
> +						   NULL,
> +						   NULL);

I am not in favor of changes like this. It doesn't solve the problem
with the old API, which is that it maintains sysfs nodes locally.
Besides, this patch changes the name from "applesmc" to "applesmcbacklight",
it creates a name attribute in the hwmon device directory while
keeping the actual hwmon attributes in the platform device directory,
and the driver has another name attribute in the platform device directory.

Given that, sorry, I can not accept this patch.

Guenter
