Return-path: <jdelvare@suse.de>
Date: Thu, 8 Dec 2016 16:08:06 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 07/17] hwmon: (adt7462) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161208160806.418fcf2b@endymion>
In-Reply-To: <1480913740-5678-7-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-7-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:30 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing large values into temperature limit,
> voltage limit, and pwm hysteresis attributes.
> 
> The input parameter to DIV_ROUND_CLOSEST() needs to be clamped to avoid
> such overflows.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/adt7462.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
> index 5929e126da63..0e9c8d3e8f5c 100644
> --- a/drivers/hwmon/adt7462.c
> +++ b/drivers/hwmon/adt7462.c
> @@ -810,8 +810,7 @@ static ssize_t set_temp_min(struct device *dev,
>  	if (kstrtol(buf, 10, &temp) || !temp_enabled(data, attr->index))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
> -	temp = clamp_val(temp, 0, 255);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -64000, 191000), 1000) + 64;
>  
>  	mutex_lock(&data->lock);
>  	data->temp_min[attr->index] = temp;
> @@ -848,8 +847,7 @@ static ssize_t set_temp_max(struct device *dev,
>  	if (kstrtol(buf, 10, &temp) || !temp_enabled(data, attr->index))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
> -	temp = clamp_val(temp, 0, 255);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -64000, 191000), 1000) + 64;
>  
>  	mutex_lock(&data->lock);
>  	data->temp_max[attr->index] = temp;

The original code had the division and the clamping on separate lines,
and I believe it makes the code more readable. It would also make the
patch smaller and more readable as well.

> @@ -912,6 +910,7 @@ static ssize_t set_volt_max(struct device *dev,
>  	if (kstrtol(buf, 10, &temp) || !x)
>  		return -EINVAL;
>  
> +	temp = clamp_val(temp, 0, INT_MAX / 1000 - x);
>  	temp *= 1000; /* convert mV to uV */
>  	temp = DIV_ROUND_CLOSEST(temp, x);
>  	temp = clamp_val(temp, 0, 255);
> @@ -954,6 +953,7 @@ static ssize_t set_volt_min(struct device *dev,
>  	if (kstrtol(buf, 10, &temp) || !x)
>  		return -EINVAL;
>  
> +	temp = clamp_val(temp, 0, INT_MAX / 1000 - x);
>  	temp *= 1000; /* convert mV to uV */
>  	temp = DIV_ROUND_CLOSEST(temp, x);
>  	temp = clamp_val(temp, 0, 255);

Any chance to get the new clamp_val()s such that the second ones are no
longer needed?

> @@ -1220,8 +1220,7 @@ static ssize_t set_pwm_hyst(struct device *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> -	temp = clamp_val(temp, 0, 15);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, 0, 15000), 1000);
>  
>  	/* package things up */
>  	temp &= ADT7462_PWM_HYST_MASK;
> @@ -1306,8 +1305,7 @@ static ssize_t set_pwm_tmin(struct device *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
>  
> -	temp = DIV_ROUND_CLOSEST(temp, 1000) + 64;
> -	temp = clamp_val(temp, 0, 255);
> +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -64000, 191000), 1000) + 64;
>  
>  	mutex_lock(&data->lock);
>  	data->pwm_tmin[attr->index] = temp;

Same comment as first 2.

-- 
Jean Delvare
SUSE L3 Support
