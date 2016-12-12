Return-path: <jdelvare@suse.de>
Date: Mon, 12 Dec 2016 11:44:34 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Steve Glendinning
 <steve.glendinning@shawell.net>
Subject: Re: [PATCH 13/17] hwmon: (emc2103) Fix overflows seen when
 temperature limit attributes
Message-ID: <20161212114434.38d7b103@endymion>
In-Reply-To: <1480913740-5678-13-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-13-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:36 -0800, Guenter Roeck wrote:
> Writes into temperature limit attributes can overflow due to unbound
> values passed to DIV_ROUND_CLOSEST().
> 
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/emc2103.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
> index 24e395c5907d..4b870ee9b0d3 100644
> --- a/drivers/hwmon/emc2103.c
> +++ b/drivers/hwmon/emc2103.c
> @@ -251,7 +251,7 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *da,
>  	if (result < 0)
>  		return result;
>  
> -	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -63, 127);
> +	val = DIV_ROUND_CLOSEST(clamp_val(val, -63000, 127000), 1000);
>  
>  	mutex_lock(&data->update_lock);
>  	data->temp_min[nr] = val;
> @@ -273,7 +273,7 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *da,
>  	if (result < 0)
>  		return result;
>  
> -	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -63, 127);
> +	val = DIV_ROUND_CLOSEST(clamp_val(val, -63000, 127000), 1000);
>  
>  	mutex_lock(&data->update_lock);
>  	data->temp_max[nr] = val;

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
