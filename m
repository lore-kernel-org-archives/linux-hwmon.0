Return-path: <jdelvare@suse.de>
Date: Mon, 12 Dec 2016 11:48:23 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 14/17] hwmon: (emcw201) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161212114823.3e274048@endymion>
In-Reply-To: <1480913740-5678-14-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-14-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:37 -0800, Guenter Roeck wrote:
> Writes into temperature and voltage limit attributes can overflow
> due to multiplications with unchecked parameters. Also, the input
> parameter to DIV_ROUND_CLOSEST() needis to be range checked.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/emc6w201.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
> index f37fe2011640..f8c776c49df9 100644
> --- a/drivers/hwmon/emc6w201.c
> +++ b/drivers/hwmon/emc6w201.c
> @@ -215,12 +215,13 @@ static ssize_t set_in(struct device *dev, struct device_attribute *devattr,
>  	if (err < 0)
>  		return err;
>  
> -	val = DIV_ROUND_CLOSEST(val * 0xC0, nominal_mv[nr]);
> +	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * nominal_mv[nr] / 192)
> +				* 192, nominal_mv[nr]);
>  	reg = (sf == min) ? EMC6W201_REG_IN_LOW(nr)
>  			  : EMC6W201_REG_IN_HIGH(nr);
>  
>  	mutex_lock(&data->update_lock);
> -	data->in[sf][nr] = clamp_val(val, 0, 255);
> +	data->in[sf][nr] = val;
>  	err = emc6w201_write8(client, reg, data->in[sf][nr]);
>  	mutex_unlock(&data->update_lock);
>  
> @@ -252,12 +253,12 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
>  	if (err < 0)
>  		return err;
>  
> -	val = DIV_ROUND_CLOSEST(val, 1000);
> +	val = DIV_ROUND_CLOSEST(clamp_val(val, -127000, 127000), 1000);
>  	reg = (sf == min) ? EMC6W201_REG_TEMP_LOW(nr)
>  			  : EMC6W201_REG_TEMP_HIGH(nr);
>  
>  	mutex_lock(&data->update_lock);
> -	data->temp[sf][nr] = clamp_val(val, -127, 127);
> +	data->temp[sf][nr] = val;
>  	err = emc6w201_write8(client, reg, data->temp[sf][nr]);
>  	mutex_unlock(&data->update_lock);
>  

Keep on separate lines? Other than this, looks good:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
