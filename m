Return-path: <jdelvare@suse.de>
Date: Tue, 13 Dec 2016 10:56:42 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 17/17] hwmon: (gl520sm) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161213105642.1fa8de57@endymion>
In-Reply-To: <1480913740-5678-17-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-17-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:40 -0800, Guenter Roeck wrote:
> Writes into limit attributes can overflow due to multplications
> and additions with unbound input values.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/gl520sm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
> index dee93ec87d02..4bb37d7234b1 100644
> --- a/drivers/hwmon/gl520sm.c
> +++ b/drivers/hwmon/gl520sm.c
> @@ -209,10 +209,11 @@ static ssize_t get_cpu_vid(struct device *dev, struct device_attribute *attr,
>  static DEVICE_ATTR(cpu0_vid, S_IRUGO, get_cpu_vid, NULL);
>  
>  #define VDD_FROM_REG(val) (((val) * 95 + 2) / 4)
> -#define VDD_TO_REG(val) clamp_val((((val) * 4 + 47) / 95), 0, 255)
> +#define VDD_TO_REG(val) \
> +	DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * 95 / 4) * 4, 95)
>  
>  #define IN_FROM_REG(val) ((val) * 19)
> -#define IN_TO_REG(val) clamp_val((((val) + 9) / 19), 0, 255)
> +#define IN_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * 19), 19)
>  
>  static ssize_t get_in_input(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
> @@ -514,8 +515,8 @@ static DEVICE_ATTR(fan1_off, S_IRUGO | S_IWUSR,
>  		get_fan_off, set_fan_off);
>  
>  #define TEMP_FROM_REG(val) (((val) - 130) * 1000)
> -#define TEMP_TO_REG(val) clamp_val(((((val) < 0 ? \
> -			(val) - 500 : (val) + 500) / 1000) + 130), 0, 255)
> +#define TEMP_TO_REG(val) (DIV_ROUND_CLOSEST(clamp_val(val, -130000, 125000), \
> +					    1000) + 130)
>  
>  static ssize_t get_temp_input(struct device *dev, struct device_attribute *attr,
>  			      char *buf)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

But I think FAN_TO_REG can overflow too? Input value is left-shifted
without a prior check.

-- 
Jean Delvare
SUSE L3 Support
