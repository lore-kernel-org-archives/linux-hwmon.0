Return-path: <jdelvare@suse.de>
Date: Tue, 26 Jul 2016 09:21:22 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (lm90) Add missing assignment
Message-ID: <20160726092122.64674f04@endymion>
In-Reply-To: <1469483441-10702-1-git-send-email-linux@roeck-us.net>
References: <1469483441-10702-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Mon, 25 Jul 2016 14:50:41 -0700, Guenter Roeck wrote:
> Coverity reports the following error.
> 
> >>>     CID 1364474:  Error handling issues  (CHECKED_RETURN)
> >>>     Calling "lm90_read_reg" without checking return value (as is done
> >>>     elsewhere 28 out of 29 times).
> 532             lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
> 533             if (val < 0)
> 534                     return val;
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm90.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index f51e758ba529..7b3eedf76c62 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -529,7 +529,7 @@ static int lm90_update_limits(struct device *dev)
>  		return val;
>  	data->temp_hyst = val;
>  
> -	lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
> +	val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
>  	if (val < 0)
>  		return val;
>  	data->temp11[REMOTE_LOW] = val << 8;

Good catch.

Reviewed-by: Jean Delvare <jdelvare@suse.de>


-- 
Jean Delvare
SUSE L3 Support
