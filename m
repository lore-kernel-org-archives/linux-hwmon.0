Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32844 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750966AbdBJRVT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Feb 2017 12:21:19 -0500
Date: Fri, 10 Feb 2017 09:21:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH 2/2] hwmon: lm90: integration of channel map in
 dt-bindings
Message-ID: <20170210172106.GA13576@roeck-us.net>
References: <2979642.2YCYMDeKdL@debian64>
 <0d274e32ad09daa2f6f7f27f1c36d39da526b66d.1486741517.git.chunkeey@googlemail.com>
 <bda1ec86d68fe6b78c04c7dec7eb3c63c0850a97.1486741517.git.chunkeey@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bda1ec86d68fe6b78c04c7dec7eb3c63c0850a97.1486741517.git.chunkeey@googlemail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Feb 10, 2017 at 05:12:30PM +0100, Christian Lamparter wrote:
> This patch integrates the LOCAL, REMOTE and REMOTE2
> channel definitions into the lm90.c driver.
> 
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> ---
> This is an optional patch to showcase how the channel definition
> in the dt-bindings are mapped into the driver.
> In theory, this makes it possible to easily remap the channel
> indices. However, it does make the driver harder to read.

It also makes the driver dependent on external defines which are not controlled
by the driver. If anyone changes those defines to be non-sequential or to not
start with 0, we would be in trouble. Sure, that might and likely would result
in compile errors, but still ...

Besides, it is not complete. Anyone changing channel index values would
(at least) mess up alarm bit association.

If we want to do that kind of thing, it might make more sense to add some code
to provide the desired mapping to the hwmon core, and to let the hwmon core
handle it. No idea if that is even possible, though.

Is that really worth it ?

Thanks,
Guenter

> ---
>  drivers/hwmon/lm90.c | 61 ++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 40 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 841f2428e84a..aa67810000f9 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -95,6 +95,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/regulator/consumer.h>
> +#include <dt-bindings/thermal/lm90.h>
>  
>  /*
>   * Addresses to scan
> @@ -1016,23 +1017,33 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
>  }
>  
>  static const u8 lm90_temp_index[3] = {
> -	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
> +	[LM90_LOCAL_TEMPERATURE] = LOCAL_TEMP,
> +	[LM90_REMOTE_TEMPERATURE] = REMOTE_TEMP,
> +	[LM90_REMOTE2_TEMPERATURE] =  REMOTE2_TEMP
>  };
>  
>  static const u8 lm90_temp_min_index[3] = {
> -	LOCAL_LOW, REMOTE_LOW, REMOTE2_LOW
> +	[LM90_LOCAL_TEMPERATURE] = LOCAL_LOW,
> +	[LM90_REMOTE_TEMPERATURE] = REMOTE_LOW,
> +	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_LOW
>  };
>  
>  static const u8 lm90_temp_max_index[3] = {
> -	LOCAL_HIGH, REMOTE_HIGH, REMOTE2_HIGH
> +	[LM90_LOCAL_TEMPERATURE] = LOCAL_HIGH,
> +	[LM90_REMOTE_TEMPERATURE] = REMOTE_HIGH,
> +	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_HIGH
>  };
>  
>  static const u8 lm90_temp_crit_index[3] = {
> -	LOCAL_CRIT, REMOTE_CRIT, REMOTE2_CRIT
> +	[LM90_LOCAL_TEMPERATURE] = LOCAL_CRIT,
> +	[LM90_REMOTE_TEMPERATURE] = REMOTE_CRIT,
> +	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_CRIT
>  };
>  
>  static const u8 lm90_temp_emerg_index[3] = {
> -	LOCAL_EMERG, REMOTE_EMERG, REMOTE2_EMERG
> +	[LM90_LOCAL_TEMPERATURE] = LOCAL_EMERG,
> +	[LM90_REMOTE_TEMPERATURE] = REMOTE_EMERG,
> +	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_EMERG
>  };
>  
>  static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
> @@ -1654,6 +1665,10 @@ static int lm90_probe(struct i2c_client *client,
>  	struct lm90_data *data;
>  	int err;
>  
> +	BUILD_BUG_ON(LM90_LOCAL_TEMPERATURE == LM90_REMOTE_TEMPERATURE ||
> +		     LM90_REMOTE_TEMPERATURE == LM90_REMOTE2_TEMPERATURE ||
> +		     LM90_REMOTE2_TEMPERATURE == LM90_LOCAL_TEMPERATURE);
> +
>  	regulator = devm_regulator_get(dev, "vcc");
>  	if (IS_ERR(regulator))
>  		return PTR_ERR(regulator);
> @@ -1695,37 +1710,41 @@ static int lm90_probe(struct i2c_client *client,
>  	data->chip.ops = &lm90_ops;
>  	data->chip.info = data->info;
>  
> -	data->info[0] = &lm90_chip_info;
> -	data->info[1] = &data->temp_info;
> +	data->info[LM90_LOCAL_TEMPERATURE] = &lm90_chip_info;
> +	data->info[LM90_REMOTE_TEMPERATURE] = &data->temp_info;
>  
>  	info = &data->temp_info;
>  	info->type = hwmon_temp;
>  	info->config = data->channel_config;
>  
> -	data->channel_config[0] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
> -		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
> -		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
> -	data->channel_config[1] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
> -		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
> -		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT;
> +	data->channel_config[LM90_LOCAL_TEMPERATURE] = HWMON_T_INPUT |
> +		HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST |
> +		HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
> +	data->channel_config[LM90_REMOTE_TEMPERATURE] = HWMON_T_INPUT |
> +		HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST |
> +		HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
> +		HWMON_T_FAULT;
>  
>  	if (data->flags & LM90_HAVE_OFFSET)
> -		data->channel_config[1] |= HWMON_T_OFFSET;
> +		data->channel_config[LM90_REMOTE_TEMPERATURE] |= HWMON_T_OFFSET;
>  
>  	if (data->flags & LM90_HAVE_EMERGENCY) {
> -		data->channel_config[0] |= HWMON_T_EMERGENCY |
> -			HWMON_T_EMERGENCY_HYST;
> -		data->channel_config[1] |= HWMON_T_EMERGENCY |
> -			HWMON_T_EMERGENCY_HYST;
> +		data->channel_config[LM90_LOCAL_TEMPERATURE] |=
> +			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST;
> +		data->channel_config[LM90_REMOTE_TEMPERATURE] |=
> +			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST;
>  	}
>  
>  	if (data->flags & LM90_HAVE_EMERGENCY_ALARM) {
> -		data->channel_config[0] |= HWMON_T_EMERGENCY_ALARM;
> -		data->channel_config[1] |= HWMON_T_EMERGENCY_ALARM;
> +		data->channel_config[LM90_LOCAL_TEMPERATURE] |=
> +			HWMON_T_EMERGENCY_ALARM;
> +		data->channel_config[LM90_REMOTE_TEMPERATURE] |=
> +			HWMON_T_EMERGENCY_ALARM;
>  	}
>  
>  	if (data->flags & LM90_HAVE_TEMP3) {
> -		data->channel_config[2] = HWMON_T_INPUT |
> +		data->channel_config[LM90_REMOTE2_TEMPERATURE] =
> +			HWMON_T_INPUT |
>  			HWMON_T_MIN | HWMON_T_MAX |
>  			HWMON_T_CRIT | HWMON_T_CRIT_HYST |
>  			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST |
> -- 
> 2.11.0
> 
