Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36661 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752630AbeGCT7H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jul 2018 15:59:07 -0400
Date: Tue, 3 Jul 2018 12:59:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aleksei Mamlin <mamlinav@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: w83795: Convert to
 hwmon_device_register_with_info()
Message-ID: <20180703195905.GA14558@roeck-us.net>
References: <20180703193515.4379-1-mamlinav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703193515.4379-1-mamlinav@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 03, 2018 at 10:35:15PM +0300, Aleksei Mamlin wrote:
> This patch replaces deprecated call to hwmon_device_register() with the new
> hwmon_device_register_with_info().
> 
> Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>

NACK. This doesn't really convert anything, it just exploits a loophole
that was necessary because some drivers can not be converted cleanly.

Guenter

> ---
>  drivers/hwmon/w83795.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
> index 49276bbdac3d..25bcf988ef1c 100644
> --- a/drivers/hwmon/w83795.c
> +++ b/drivers/hwmon/w83795.c
> @@ -2234,7 +2234,8 @@ static int w83795_probe(struct i2c_client *client,
>  	if (data->chip_type == w83795g)
>  		w83795_check_dynamic_in_limits(client);
>  
> -	data->hwmon_dev = hwmon_device_register(dev);
> +	data->hwmon_dev = hwmon_device_register_with_info(dev, client->name,
> +							  data, NULL, NULL);
>  	if (IS_ERR(data->hwmon_dev)) {
>  		err = PTR_ERR(data->hwmon_dev);
>  		goto exit_remove;
> -- 
> 2.16.4
> 
