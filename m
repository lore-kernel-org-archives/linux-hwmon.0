Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55221 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754204AbcJDUyD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2016 16:54:03 -0400
Date: Tue, 4 Oct 2016 13:53:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Michael.Wang@alliedtelesis.co.nz
Subject: Re: [PATCHv1] hwmon: adm9240: handle temperature readings below 0
Message-ID: <20161004205359.GA29531@roeck-us.net>
References: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 04, 2016 at 05:08:00PM +1300, Chris Packham wrote:
> Unlike the temperature thresholds the temperature data is a 9-bit signed
> value. This allows and additional 0.5 degrees of precision on the
> reading but means we can't rely on sign-extension to handle negative
> values.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/hwmon/adm9240.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> index 98114ce..6929b25 100644
> --- a/drivers/hwmon/adm9240.c
> +++ b/drivers/hwmon/adm9240.c
> @@ -107,6 +107,21 @@ static inline s8 TEMP_TO_REG(long val)
>  	return clamp_val(SCALE(val, 1, 1000), -40, 127);
>  }
>  
> +/* 8-bit signed temperature (from Thigh, Tlow etc) */
> +static inline int TEMP_FROM_REG(s8 val)
> +{
> +	return val * 1000;
> +}

This does not any value; please drop.

> +
> +/* 9-bit signed temperature (from temperature data) */
> +static inline int TEMP_FROM_DATA_REG(s16 val)

Please don't use uppercase for functions.

> +{
> +	if (val > 255)
> +		val -= 512;
> +
> +	return val * 500;

At the surface, this is identical to
	return sign_extend(val, 9) * 500;

However, the real problem is around line 200, where the sign extension is
attempted but fails. It would be better to drop the '/ 128'
there and simplify the above code to

	return val / 128 * 500;

With that, it might be better to just drop the new function and move the
expression into the calling code.

Of course, all that doesn't solve the real problem in this driver, which is
that it ignores error codes from the smbus functions, but that is a different
problem.

Thanks,
Guenter

> +}
> +
>  /* two fans, each with low fan speed limit */
>  static inline unsigned int FAN_FROM_REG(u8 reg, u8 div)
>  {
> @@ -263,7 +278,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *dummy,
>  		char *buf)
>  {
>  	struct adm9240_data *data = adm9240_update_device(dev);
> -	return sprintf(buf, "%d\n", data->temp * 500); /* 9-bit value */
> +	return sprintf(buf, "%d\n", TEMP_FROM_DATA_REG(data->temp));
>  }
>  
>  static ssize_t show_max(struct device *dev, struct device_attribute *devattr,
> @@ -271,7 +286,7 @@ static ssize_t show_max(struct device *dev, struct device_attribute *devattr,
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct adm9240_data *data = adm9240_update_device(dev);
> -	return sprintf(buf, "%d\n", data->temp_max[attr->index] * 1000);
> +	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[attr->index]));
>  }
>  
>  static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
