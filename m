Return-path: <jdelvare@suse.de>
Date: Thu, 8 Dec 2016 14:47:02 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 02/17] hwmon: (ds620) Fix overflows seen when writing
 temperature limits
Message-ID: <20161208144702.22029874@endymion>
In-Reply-To: <1480913740-5678-2-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-2-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:25 -0800, Guenter Roeck wrote:
> Module test reports:
> 
> temp1_max: Suspected overflow: [160000 vs. 0]
> temp1_min: Suspected overflow: [160000 vs. 0]
> 
> This is seen because the values passed when writing temperature limits
> are unbound.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/ds620.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
> index edf550fc4eef..0043a4c02b85 100644
> --- a/drivers/hwmon/ds620.c
> +++ b/drivers/hwmon/ds620.c
> @@ -166,7 +166,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
>  	if (res)
>  		return res;
>  
> -	val = (val * 10 / 625) * 8;
> +	val = (clamp_val(val, -128000, 128000) * 10 / 625) * 8;
>  
>  	mutex_lock(&data->update_lock);
>  	data->temp[attr->index] = val;

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Fixes: 6099469805c2 ("hwmon: Support for Dallas Semiconductor DS620")

-- 
Jean Delvare
SUSE L3 Support
