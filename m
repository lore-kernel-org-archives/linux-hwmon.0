Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37435 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753151AbdKVW2L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Nov 2017 17:28:11 -0500
Date: Wed, 22 Nov 2017 14:28:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Lippert <roblip@gmail.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, xow@google.com,
        Robert Lippert <rlippert@google.com>
Subject: Re: [PATCH] hwmon: (pmbus) Use 64bit math for DIRECT format values
Message-ID: <20171122222809.GA2951@roeck-us.net>
References: <20171122220843.18309-1-rlippert@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171122220843.18309-1-rlippert@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 22, 2017 at 02:08:43PM -0800, Robert Lippert wrote:
> Power values in the 100s of watt range can easily blow past
> 32bit math limits when processing everything in microwatts.
> 
> Use 64bit math instead to avoid these issues on common 32bit ARM
> BMC platforms.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 52a58b8b6e1b..f4efea9f282e 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -499,8 +499,8 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
>  static long pmbus_reg2data_direct(struct pmbus_data *data,
>  				  struct pmbus_sensor *sensor)
>  {
> -	long val = (s16) sensor->data;
> -	long m, b, R;
> +	s64 val = (s16) sensor->data;
> +	s64 m, b, R;
>  
>  	m = data->info->m[sensor->class];
>  	b = data->info->b[sensor->class];
> @@ -528,11 +528,13 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>  		R--;
>  	}
>  	while (R < 0) {
> -		val = DIV_ROUND_CLOSEST(val, 10);
> +		do_div(val, 10);

Any reason to not use DIV_ROUND_CLOSEST_ULL ?

>  		R++;
>  	}
>  
> -	return (val - b) / m;
> +	val = val - b;
> +	do_div(val, m);
> +	return val;

Can this overflow ?

>  }
>  
>  /*
> @@ -656,7 +658,8 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>  static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>  				 struct pmbus_sensor *sensor, long val)
>  {
> -	long m, b, R;
> +	s64 m, b, R;
> +	s64 val64 = val;
>  
>  	m = data->info->m[sensor->class];
>  	b = data->info->b[sensor->class];
> @@ -673,18 +676,18 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
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
> +		do_div(val64, 10);

Same here.

>  		R++;
>  	}
>  
> -	return val;
> +	return (u16) val64;

Can this overflow ?

>  }
>  
>  static u16 pmbus_data2reg_vid(struct pmbus_data *data,
> -- 
> 2.15.0.448.gf294e3d99a-goog
> 
