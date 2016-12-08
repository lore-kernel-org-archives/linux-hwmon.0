Return-path: <jdelvare@suse.de>
Date: Thu, 8 Dec 2016 16:14:06 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 08/17] hwmon: (adt7470) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161208161406.700a07ea@endymion>
In-Reply-To: <1480913740-5678-8-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-8-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:31 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing large values into various temperature limit
> attributes.
> 
> The input value passed to DIC_ROUND_CLOSEST() needs to be clamped to avoid
> such overflows.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/adt7470.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 6e60ca53406e..8996120b8170 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -483,8 +483,7 @@ static ssize_t set_temp_min(struct device *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> -	temp = clamp_val(temp, -128, 127);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -128000, 127000), 1000);
>  
>  	mutex_lock(&data->lock);
>  	data->temp_min[attr->index] = temp;
> @@ -517,8 +516,7 @@ static ssize_t set_temp_max(struct device *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> -	temp = clamp_val(temp, -128, 127);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -128000, 127000), 1000);
>  
>  	mutex_lock(&data->lock);
>  	data->temp_max[attr->index] = temp;
> @@ -880,8 +878,7 @@ static ssize_t set_pwm_tmin(struct device *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> -	temp = clamp_val(temp, -128, 127);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -128000, 127000), 1000);
>  
>  	mutex_lock(&data->lock);
>  	data->pwm_tmin[attr->index] = temp;

Seems more readable on 2 lines, but other than this:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
