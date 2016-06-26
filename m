Return-path: <nm@ti.com>
Subject: Re: [PATCH v2 5/5] hwmon: (tmp102) Convert to use regmap, and drop
 local cache
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
 <1466908825-14222-5-git-send-email-linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mark Brown
	<broonie@kernel.org>
From: Nishanth Menon <nm@ti.com>
Message-ID: <576FD84E.6020204@ti.com>
Date: Sun, 26 Jun 2016 08:27:42 -0500
MIME-Version: 1.0
In-Reply-To: <1466908825-14222-5-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 06/25/2016 09:40 PM, Guenter Roeck wrote:
> By concerting the driver to regmap, we can use regmap to cache non-volatile
> registers. Stop caching the temperature register; while potentially reading
> it more often can result in reading it more often than necessary, this is
> offset by the gain due to not re-reading the limit registers.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Set use_single_rw to indicate that the chip can not perform
>     read operations crossing register boundaries.
>     Use REGCACHE_RBTREE instead REGCACHE_FLAT. REGCACHE_FLAT does not
>     initialize the cache from the chip unless num_reg_defaults_raw is
>     provided. If it is provided without actual cache values, it complains
>     with 'No cache defaults, reading back from HW'. REGCACHE_RBTREE
>     automatically initializes register values from the chip if no
>     defaults are provided, and does not complain about it.
> 
> Note: I'll drop the Cc: to Mark later.
> 
>  drivers/hwmon/tmp102.c | 156 +++++++++++++++++++++++++------------------------
>  1 file changed, 79 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 487b4ef5992c..e4a2314a2c49 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -24,6 +24,7 @@
>  #include <linux/mutex.h>
>  #include <linux/device.h>
>  #include <linux/jiffies.h>
> +#include <linux/regmap.h>
>  #include <linux/thermal.h>
>  #include <linux/of.h>
>  
> @@ -61,13 +62,9 @@
>  #define CONVERSION_TIME_MS		35	/* in milli-seconds */
>  
>  struct tmp102 {
> -	struct i2c_client *client;
> -	struct mutex lock;
> +	struct regmap *regmap;
>  	u16 config_orig;
> -	unsigned long last_update;
>  	unsigned long ready_time;
> -	bool valid;
> -	int temp[3];
>  };
>  
>  /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
> @@ -82,16 +79,11 @@ static inline u16 tmp102_mC_to_reg(int val)
>  	return (val * 128) / 1000;
>  }
>  
> -static const u8 tmp102_reg[] = {
> -	TMP102_TEMP_REG,
> -	TMP102_TLOW_REG,
> -	TMP102_THIGH_REG,
> -};
> -
> -static struct tmp102 *tmp102_update_device(struct device *dev)
> +static int tmp102_read_temp(void *dev, int *temp)
>  {
>  	struct tmp102 *tmp102 = dev_get_drvdata(dev);
> -	struct i2c_client *client = tmp102->client;
> +	unsigned int reg;
> +	int ret;
>  
>  	/* Is it too early to return a conversion ? */
>  	if (time_before(jiffies, tmp102->ready_time)) {
> @@ -100,28 +92,11 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
>  		msleep(jiffies_to_msecs(sleeptime));
>  	}


Note, at this point:
We have set CR0=0, CR1=1 (4HZ conversion rate). we do indeed have a
26typical (worst case 35ms) conversion time, but if we read register
before 250 ms, we are not getting a new data, instead, we are just
reading the same old register data.

for lowering potential i2c ops, I suggest:
if < conversion_rate + CONVERSION_TIME_MS, provide a cached data, if
after that, do a read.

we could do a patch over this ofcourse -> best will  be to let us do a
configurable conversion rate. We could get upto 8Hz conversion rate
with this chip (CR0,1=1).



Otherwise, this series worked just fine..
http://pastebin.ubuntu.com/17907605/

-- 
Regards,
Nishanth Menon
