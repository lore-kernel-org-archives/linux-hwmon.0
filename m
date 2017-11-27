Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:38619 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751835AbdK0WLh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 17:11:37 -0500
Date: Mon, 27 Nov 2017 14:11:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Lippert <roblip@gmail.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, xow@google.com,
        Robert Lippert <rlippert@google.com>
Subject: Re: [PATCH v2] hwmon: (pmbus) Use 64bit math for DIRECT format values
Message-ID: <20171127221135.GB3848@roeck-us.net>
References: <20171122220843.18309-1-rlippert@google.com>
 <20171127213914.141687-1-rlippert@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171127213914.141687-1-rlippert@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 27, 2017 at 01:39:14PM -0800, Robert Lippert wrote:
> Power values in the 100s of watt range can easily blow past
> 32bit math limits when processing everything in microwatts.
> 
> Use 64bit math instead to avoid these issues on common 32bit ARM
> BMC platforms.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 52a58b8b6e1b..ff701502974a 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -21,6 +21,7 @@
>  
>  #include <linux/debugfs.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/err.h>
> @@ -499,8 +500,9 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
>  static long pmbus_reg2data_direct(struct pmbus_data *data,
>  				  struct pmbus_sensor *sensor)
>  {
> -	long val = (s16) sensor->data;
> -	long m, b, R;
> +	s64 val = (s16) sensor->data;
> +	s64 b, R;

Do b and R have to be s64 ? Seems excessive.

> +	s32 m;
>  
>  	m = data->info->m[sensor->class];
>  	b = data->info->b[sensor->class];
> @@ -528,11 +530,12 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>  		R--;
>  	}
>  	while (R < 0) {
> -		val = DIV_ROUND_CLOSEST(val, 10);
> +		val = div_s64(val + 5LL, 10L);  // round closest
>  		R++;
>  	}
>  
> -	return (val - b) / m;
> +	val = div_s64(val - b, m);
> +	return clamp_val(val, LONG_MIN, LONG_MAX);
>  }
>  
>  /*
> @@ -656,7 +659,9 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>  static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>  				 struct pmbus_sensor *sensor, long val)
>  {
> -	long m, b, R;
> +	s64 b, R;

Same question as above - do those have to be s64 ?

> +	s32 m;
> +	s64 val64 = val;
>  
>  	m = data->info->m[sensor->class];
>  	b = data->info->b[sensor->class];
> @@ -673,18 +678,18 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>  		R -= 3;		/* Adjust R and b for data in milli-units */
>  		b *= 1000;
>  	}
> -	val = val * m + b;
> +	val64 = val64 * m + b;
>  
>  	while (R > 0) {
> -		val *= 10;
> +		val64 *= 10;
>  		R--;
>  	}
>  	while (R < 0) {
> -		val = DIV_ROUND_CLOSEST(val, 10);
> +		val64 = div_s64(val64 + 5LL, 10L);  // round closest
>  		R++;
>  	}
>  
> -	return val;
> +	return (u16) clamp_val(val64, S16_MIN, S16_MAX);
>  }
>  
>  static u16 pmbus_data2reg_vid(struct pmbus_data *data,
> -- 
> 2.15.0.417.g466bffb3ac-goog
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
