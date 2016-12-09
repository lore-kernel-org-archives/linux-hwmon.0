Return-path: <jdelvare@suse.de>
Date: Fri, 9 Dec 2016 16:07:01 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 10/17] hwmon: (lm87) Fix overflow seen when writing
 voltage limit attributes
Message-ID: <20161209160701.202a52b7@endymion>
In-Reply-To: <1480913740-5678-10-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-10-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun,  4 Dec 2016 20:55:33 -0800, Guenter Roeck wrote:
> Writes into voltage limit attributes can overflow due to an unbound
> multiplication.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm87.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index a5e295826aea..24f971b75e46 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -121,7 +121,7 @@ static u8 LM87_REG_TEMP_LOW[3] = { 0x3A, 0x38, 0x2C };
>  
>  #define IN_FROM_REG(reg, scale)	(((reg) * (scale) + 96) / 192)
>  #define IN_TO_REG(val, scale)	((val) <= 0 ? 0 : \
> -				 (val) * 192 >= (scale) * 255 ? 255 : \
> +				 (val) >= (scale) * 255 / 192 ? 255 : \
>  				 ((val) * 192 + (scale) / 2) / (scale))
>  
>  #define TEMP_FROM_REG(reg)	((reg) * 1000)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
