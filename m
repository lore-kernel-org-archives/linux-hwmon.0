Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44909 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425285AbdDUTed (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2017 15:34:33 -0400
Date: Fri, 21 Apr 2017 12:34:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: hwmon: (adt7475) set start bit in probe
Message-ID: <20170421193429.GA22253@roeck-us.net>
References: <20170421190810.30628-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170421190810.30628-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Apr 22, 2017 at 07:08:09AM +1200, Chris Packham wrote:
> The ADT7475 and ADT7476 have the STRT bit cleared by default[1]. Before any
> monitoring activities the STRT bit needs to be set. Logically this needs
> to happen before any of the sensors are read so the probe() function
> seems the best place for it.
> 
> [1] - https://www.onsemi.com/pub/Collateral/ADT7475-D.PDF
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7475.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index fcfa48222145..c803e3c5fcd4 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -59,6 +59,8 @@
>  #define REG_VENDID		0x3E
>  #define REG_DEVID2		0x3F
>  
> +#define REG_CONFIG1		0x40
> +
>  #define REG_STATUS1		0x41
>  #define REG_STATUS2		0x42
>  
> @@ -1371,6 +1373,17 @@ static int adt7475_probe(struct i2c_client *client,
>  	for (i = 0; i < ADT7475_PWM_COUNT; i++)
>  		adt7475_read_pwm(client, i);
>  
> +	/* Start monitoring */
> +	switch (chip) {
> +	case adt7475:
> +	case adt7476:
> +		i2c_smbus_write_byte_data(client, REG_CONFIG1,
> +					  adt7475_read(REG_CONFIG1) | 0x01);
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	ret = sysfs_create_group(&client->dev.kobj, &adt7475_attr_group);
>  	if (ret)
>  		return ret;
