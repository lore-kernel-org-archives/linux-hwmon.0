Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Thu, 22 Mar 2018 15:29:47 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm92) Add max6635 to lm92_id[]
Message-ID: <20180322152947.08642b1a@endymion>
In-Reply-To: <20180322134311.19485-1-alvaro.gamez@hazent.com>
References: <20180322134311.19485-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Alvaro,

On Thu, 22 Mar 2018 14:43:11 +0100, Alvaro Gamez Machado wrote:
> Since autodetection of this chip was removed, it makes sense to add prefix
> max6635 so that the device can be instantiated by its actual name.
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  drivers/hwmon/lm92.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
> index 18509b5af11e..d40fe5122e94 100644
> --- a/drivers/hwmon/lm92.c
> +++ b/drivers/hwmon/lm92.c
> @@ -52,6 +52,7 @@
>   */
>  static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
>  						I2C_CLIENT_END };
> +enum chips { lm92, max6635 };
>  
>  /* The LM92 registers */
>  #define LM92_REG_CONFIG			0x01 /* 8-bit, RW */
> @@ -329,8 +330,8 @@ static int lm92_probe(struct i2c_client *new_client,
>   */
>  
>  static const struct i2c_device_id lm92_id[] = {
> -	{ "lm92", 0 },
> -	/* max6635 could be added here */
> +	{ "lm92", lm92 },
> +	{ "max6635", max6635 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lm92_id);

As the driver doesn't treat the two devices differently, the enum isn't
really needed. I don't really mind though, just a notice.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Please also update Documentation/hwmon/lm92 which currently claims that
the max6635 must use "lm92" as prefix.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
