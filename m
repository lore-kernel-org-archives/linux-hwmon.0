Return-Path: <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (sht3x) set initial jiffies to last_update
To: Matt Ranostay <mranostay@gmail.com>, linux-hwmon@vger.kernel.org
References: <1469405132-7044-1-git-send-email-mranostay@gmail.com>
Cc: jdelvare@suse.de, David Frey <david.frey@sensirion.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57962561.40101@roeck-us.net>
Date: Mon, 25 Jul 2016 07:42:41 -0700
MIME-Version: 1.0
In-Reply-To: <1469405132-7044-1-git-send-email-mranostay@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 07/24/2016 05:05 PM, Matt Ranostay wrote:
> Handling the wraparound requires the data->last_update to be set to an
> initial jiffies value. Otherwise on 32-bit systems you will not be able
> to request a reading till the 5 minute jiffies rollover happens.
>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: David Frey <david.frey@sensirion.com>
> Signed-off-by: Matt Ranostay <mranostay@gmail.com>

Applied.

Thanks,
Guenter

> ---
>
> Changes from v1:
>   * document more in commit message the reason for the patch
>   * mark last sample before driver load so initial reading can happen
>     shortly after boot
>
>   drivers/hwmon/sht3x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index b73a48832732..6ea99cd6ae79 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -720,7 +720,7 @@ static int sht3x_probe(struct i2c_client *client,
>   	data->setup.blocking_io = false;
>   	data->setup.high_precision = true;
>   	data->mode = 0;
> -	data->last_update = 0;
> +	data->last_update = jiffies - msecs_to_jiffies(3000);
>   	data->client = client;
>   	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
>
>
