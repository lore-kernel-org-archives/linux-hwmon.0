Return-path: <jdelvare@suse.de>
Message-ID: <1467964564.3225.12.camel@chaos.suse>
Subject: Re: [PATCH] hwmon: sht3x: set initial jiffies to last_update
From: Jean Delvare <jdelvare@suse.de>
To: Matt Ranostay <mranostay@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, David
 Frey <david.frey@sensirion.com>
Date: Fri, 08 Jul 2016 09:56:04 +0200
In-Reply-To: <1467945971-23798-1-git-send-email-mranostay@gmail.com>
References: <1467945971-23798-1-git-send-email-mranostay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Matt,

On jeu., 2016-07-07 at 19:46 -0700, Matt Ranostay wrote:
> Handling the wraparound requires the data->last_update to be set to an
> initial jiffies value. Otherwise you can start in a state where the
> sensor will never request a reading.

I can't see how. As I read the code, in the worst case, readings can be
blocked for interval_ms (2 seconds maximum.)

> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: David Frey <david.frey@sensirion.com>
> Signed-off-by: Matt Ranostay <mranostay@gmail.com>
> ---
>  drivers/hwmon/sht3x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 450645b6053d..05a925257938 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -722,7 +722,7 @@ static int sht3x_probe(struct i2c_client *client,
>  	data->setup.blocking_io = false;
>  	data->setup.high_precision = true;
>  	data->mode = 0;
> -	data->last_update = 0;
> +	data->last_update = jiffies;
>  	data->client = client;
>  	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
>  

Both look equally wrong to me. With your proposal, accessing the sysfs
attributes right after loading the driver will not trigger a reading.

In order to guarantee that the first access will trigger a reading,
data->last_update should be initialized to jiffies -
msecs_to_jiffies(2000) (the maximum interval value.)

-- 
Jean Delvare
SUSE L3 Support
