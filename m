Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37333 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbcJDWRC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2016 18:17:02 -0400
Date: Tue, 4 Oct 2016 15:16:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Michael.Wang@alliedtelesis.co.nz
Subject: Re: [PATCHv2] hwmon: adm9240: handle temperature readings below 0
Message-ID: <20161004221655.GA436@roeck-us.net>
References: <20161004214054.18501-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161004214054.18501-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 05, 2016 at 10:40:54AM +1300, Chris Packham wrote:
> Unlike the temperature thresholds the temperature data is a 9-bit signed
> value. This allows and additional 0.5 degrees of precision on the
> reading but makes handling negative values slightly harder. In order to
> have sign-extension applied correctly the 9-bit value is stored in the
> upper bits of a signed 16-bit value. When presenting this in sysfs the
> value is shifted and scaled appropriately.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied (after removing the extra () in the data->temp assignment).

Thanks,
Guenter

> ---
> Changes in v2:
> - Simplify as per feedback from Guenter.
> - Re-word commit message.
> 
>  drivers/hwmon/adm9240.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> index 98114ce..8d8ede8 100644
> --- a/drivers/hwmon/adm9240.c
> +++ b/drivers/hwmon/adm9240.c
> @@ -197,7 +197,7 @@ static struct adm9240_data *adm9240_update_device(struct device *dev)
>  		data->temp = ((i2c_smbus_read_byte_data(client,
>  					ADM9240_REG_TEMP) << 8) |
>  					i2c_smbus_read_byte_data(client,
> -					ADM9240_REG_TEMP_CONF)) / 128;
> +					ADM9240_REG_TEMP_CONF));
>  
>  		for (i = 0; i < 2; i++) { /* read fans */
>  			data->fan[i] = i2c_smbus_read_byte_data(client,
> @@ -263,7 +263,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *dummy,
>  		char *buf)
>  {
>  	struct adm9240_data *data = adm9240_update_device(dev);
> -	return sprintf(buf, "%d\n", data->temp * 500); /* 9-bit value */
> +	return sprintf(buf, "%d\n", data->temp / 128 * 500); /* 9-bit value */
>  }
>  
>  static ssize_t show_max(struct device *dev, struct device_attribute *devattr,
> -- 
> 2.10.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
