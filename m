Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Thu, 22 Mar 2018 16:56:17 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm92) Add max6635 to lm92_id[]
Message-ID: <20180322165617.6d6547e0@endymion>
In-Reply-To: <20180322143744.21117-1-alvaro.gamez@hazent.com>
References: <20180322143744.21117-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, 22 Mar 2018 15:37:44 +0100, Alvaro Gamez Machado wrote:
> Since autodetection of this chip was removed, it makes sense to add prefix
> max6635 so that the device can be instantiated by its actual name.
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
> Differences:
> 	* Update also Documentation/hwmon/lm92 with new prefix to use
> 
>  Documentation/hwmon/lm92 | 2 +-
>  drivers/hwmon/lm92.c     | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm92 b/Documentation/hwmon/lm92
> index f2a5adcf4ead..cfa99a353b8c 100644
> --- a/Documentation/hwmon/lm92
> +++ b/Documentation/hwmon/lm92
> @@ -11,7 +11,7 @@ Supported chips:
>      Addresses scanned: none, force parameter needed
>      Datasheet: http://www.national.com/pf/LM/LM76.html
>    * Maxim MAX6633/MAX6634/MAX6635
> -    Prefix: 'lm92'
> +    Prefix: 'max6635'
>      Addresses scanned: none, force parameter needed
>      Datasheet: http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3074
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

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
