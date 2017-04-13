Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43914 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751083AbdDMNKH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Apr 2017 09:10:07 -0400
Date: Thu, 13 Apr 2017 06:10:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [v2,2/2] hwmon: (lm87) Add OF device ID table
Message-ID: <20170413131005.GA23689@roeck-us.net>
References: <20170413002139.5983-2-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170413002139.5983-2-javier@osg.samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Apr 12, 2017 at 09:21:39PM -0300, Javier Martinez Canillas wrote:
> The driver doesn't have a struct of_device_id table but supported devices
> are registered via Device Trees. This is working on the assumption that a
> I2C device registered via OF will always match a legacy I2C device ID and
> that the MODALIAS reported will always be of the form i2c:<device>.
> 
> But this could change in the future so the correct approach is to have an
> OF device ID table if the devices are registered via OF.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Applied.

Thanks,
Guenter

> ---
> Hello,
> 
> I should had included this patch in series [0] but it seems that I didn't.
> 
> [0]: https://lkml.org/lkml/2017/2/24/360
> 
> Best regards,
> Javier
> 
> Changes in v2:
> - Use the correct driver in subject line.
> - Keep OF device ID table sorted in the same order than I2C device ID table.
> 
>  drivers/hwmon/lm87.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index c0766e7392d3..b48d30760388 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -985,10 +985,18 @@ static const struct i2c_device_id lm87_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, lm87_id);
>  
> +static const struct of_device_id lm87_of_match[] = {
> +	{ .compatible = "ti,lm87" },
> +	{ .compatible = "adi,adm1024" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, lm87_of_match);
> +
>  static struct i2c_driver lm87_driver = {
>  	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "lm87",
> +		.of_match_table = lm87_of_match,
>  	},
>  	.probe		= lm87_probe,
>  	.id_table	= lm87_id,
