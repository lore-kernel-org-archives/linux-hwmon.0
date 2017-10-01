Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:32841 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750965AbdJAOND (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 1 Oct 2017 10:13:03 -0400
Date: Sun, 1 Oct 2017 07:13:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alan Tull <atull@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [2/2] hwmon: add dt binding for max1619
Message-ID: <20171001141301.GA31794@roeck-us.net>
References: <20170911191649.3344-2-atull@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170911191649.3344-2-atull@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 02:16:49PM -0500, Alan Tull wrote:
> Add new device tree binding for max1619.
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/max1619.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
> index a182789..76d9669 100644
> --- a/drivers/hwmon/max1619.c
> +++ b/drivers/hwmon/max1619.c
> @@ -303,10 +303,20 @@ static const struct i2c_device_id max1619_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, max1619_id);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id max1619_of_match[] = {
> +	{ .compatible = "maxim,max1619", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, max1619_of_match);
> +#endif
> +
>  static struct i2c_driver max1619_driver = {
>  	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "max1619",
> +		.of_match_table = of_match_ptr(max1619_of_match),
>  	},
>  	.probe		= max1619_probe,
>  	.id_table	= max1619_id,
