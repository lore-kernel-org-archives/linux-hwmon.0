Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Tue, 31 Oct 2017 20:43:29 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Rudolf
 Marek <r.marek@assembler.cz>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 12/15] hwmon: (w83793) Remove duplicate NULL check
Message-ID: <20171031204329.00a8c776@endymion>
In-Reply-To: <20171031142149.32512-12-andriy.shevchenko@linux.intel.com>
References: <20171031142149.32512-1-andriy.shevchenko@linux.intel.com>
	<20171031142149.32512-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 31 Oct 2017 16:21:46 +0200, Andy Shevchenko wrote:
> Since i2c_unregister_device() became NULL-aware we may remove duplicate
> NULL check.
> 
> Cc: Rudolf Marek <r.marek@assembler.cz>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/hwmon/w83793.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index 5ba9d9f1daa1..0af0f6283b35 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -1564,10 +1564,8 @@ static int w83793_remove(struct i2c_client *client)
>  	for (i = 0; i < ARRAY_SIZE(w83793_temp); i++)
>  		device_remove_file(dev, &w83793_temp[i].dev_attr);
>  
> -	if (data->lm75[0] != NULL)
> -		i2c_unregister_device(data->lm75[0]);
> -	if (data->lm75[1] != NULL)
> -		i2c_unregister_device(data->lm75[1]);
> +	i2c_unregister_device(data->lm75[0]);
> +	i2c_unregister_device(data->lm75[1]);
>  
>  	/* Decrease data reference counter */
>  	mutex_lock(&watchdog_data_mutex);
> @@ -1625,8 +1623,7 @@ w83793_detect_subclients(struct i2c_client *client)
>  	/* Undo inits in case of errors */
>  
>  ERROR_SC_1:
> -	if (data->lm75[0] != NULL)
> -		i2c_unregister_device(data->lm75[0]);
> +	i2c_unregister_device(data->lm75[0]);
>  ERROR_SC_0:
>  	return err;
>  }
> @@ -1962,10 +1959,8 @@ static int w83793_probe(struct i2c_client *client,
>  	for (i = 0; i < ARRAY_SIZE(w83793_temp); i++)
>  		device_remove_file(dev, &w83793_temp[i].dev_attr);
>  
> -	if (data->lm75[0] != NULL)
> -		i2c_unregister_device(data->lm75[0]);
> -	if (data->lm75[1] != NULL)
> -		i2c_unregister_device(data->lm75[1]);
> +	i2c_unregister_device(data->lm75[0]);
> +	i2c_unregister_device(data->lm75[1]);
>  free_mem:
>  	kfree(data);
>  exit:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
