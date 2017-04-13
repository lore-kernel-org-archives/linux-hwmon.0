Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57119 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751088AbdDMNIS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Apr 2017 09:08:18 -0400
Date: Thu, 13 Apr 2017 06:08:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [v2,1/2] hwmon: (lm87) Remove unused I2C devices driver_data
Message-ID: <20170413130815.GA23462@roeck-us.net>
References: <20170413002139.5983-1-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170413002139.5983-1-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Apr 12, 2017 at 09:21:38PM -0300, Javier Martinez Canillas wrote:
> The I2C device ID entries set a .driver_data but this data is never
> looked up by the driver. So don't set it and also remove the enum.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Applied.

Thanks,
Guenter

> ---
> 
> Changes in v2:
> - Use the correct driver in subject line.
> 
>  drivers/hwmon/lm87.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index 04a7a1ddb030..c0766e7392d3 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -75,8 +75,6 @@
>  
>  static const unsigned short normal_i2c[] = { 0x2c, 0x2d, 0x2e, I2C_CLIENT_END };
>  
> -enum chips { lm87, adm1024 };
> -
>  /*
>   * The LM87 registers
>   */
> @@ -981,8 +979,8 @@ static int lm87_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   */
>  
>  static const struct i2c_device_id lm87_id[] = {
> -	{ "lm87", lm87 },
> -	{ "adm1024", adm1024 },
> +	{ "lm87", 0 },
> +	{ "adm1024", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lm87_id);
