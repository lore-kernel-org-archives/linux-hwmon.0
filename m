Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:37076 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389999AbeHGTZz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Aug 2018 15:25:55 -0400
Received: by mail-pl0-f68.google.com with SMTP id d5-v6so7391351pll.4
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Aug 2018 10:10:38 -0700 (PDT)
Date: Tue, 7 Aug 2018 10:10:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (adt7475) Split device update function to
 measure and limits
Message-ID: <20180807171035.GB29471@roeck-us.net>
References: <20180807151909.24433-1-ikegami@allied-telesis.co.jp>
 <20180807151909.24433-2-ikegami@allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180807151909.24433-2-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 08, 2018 at 12:19:06AM +0900, Tokunori Ikegami wrote:
> The function has the measure update part and limits and settings part.
> And those parts can be split so split them for a maintainability.
> Also not necessary to read the limits more than once so change to update once.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: linux-hwmon@vger.kernel.org
> ---
> Changes since v1:
> - Change to update the limits only once.
> 
>  drivers/hwmon/adt7475.c | 202 +++++++++++++++++++++++++-----------------------
>  1 file changed, 107 insertions(+), 95 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 9ef84998c7f3..42f48c6843c5 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -194,7 +194,7 @@ struct adt7475_data {
>  	struct mutex lock;
>  
>  	unsigned long measure_updated;
> -	unsigned long limits_updated;
> +	bool limits_updated;
>  	char valid;
>  
>  	u8 config4;
> @@ -1658,123 +1658,135 @@ static void adt7475_read_pwm(struct i2c_client *client, int index)
>  	}
>  }
>  
> -static struct adt7475_data *adt7475_update_device(struct device *dev)
> +static void adt7475_update_measure(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct adt7475_data *data = i2c_get_clientdata(client);
>  	u16 ext;
>  	int i;
>  
> -	mutex_lock(&data->lock);
> +	data->alarms = adt7475_read(REG_STATUS2) << 8;
> +	data->alarms |= adt7475_read(REG_STATUS1);
> +
> +	ext = (adt7475_read(REG_EXTEND2) << 8) |
> +		adt7475_read(REG_EXTEND1);
> +	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
> +		if (!(data->has_voltage & (1 << i)))
> +			continue;
> +		data->voltage[INPUT][i] =
> +			(adt7475_read(VOLTAGE_REG(i)) << 2) |
> +			((ext >> (i * 2)) & 3);
> +	}
>  
> -	/* Measurement values update every 2 seconds */
> -	if (time_after(jiffies, data->measure_updated + HZ * 2) ||
> -	    !data->valid) {
> -		data->alarms = adt7475_read(REG_STATUS2) << 8;
> -		data->alarms |= adt7475_read(REG_STATUS1);
> -
> -		ext = (adt7475_read(REG_EXTEND2) << 8) |
> -			adt7475_read(REG_EXTEND1);
> -		for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
> -			if (!(data->has_voltage & (1 << i)))
> -				continue;
> -			data->voltage[INPUT][i] =
> -				(adt7475_read(VOLTAGE_REG(i)) << 2) |
> -				((ext >> (i * 2)) & 3);
> -		}
> +	for (i = 0; i < ADT7475_TEMP_COUNT; i++)
> +		data->temp[INPUT][i] =
> +			(adt7475_read(TEMP_REG(i)) << 2) |
> +			((ext >> ((i + 5) * 2)) & 3);
>  
> -		for (i = 0; i < ADT7475_TEMP_COUNT; i++)
> -			data->temp[INPUT][i] =
> -				(adt7475_read(TEMP_REG(i)) << 2) |
> -				((ext >> ((i + 5) * 2)) & 3);
> +	if (data->has_voltage & (1 << 5)) {
> +		data->alarms |= adt7475_read(REG_STATUS4) << 24;
> +		ext = adt7475_read(REG_EXTEND3);
> +		data->voltage[INPUT][5] = adt7475_read(REG_VTT) << 2 |
> +			((ext >> 4) & 3);
> +	}
>  
> -		if (data->has_voltage & (1 << 5)) {
> -			data->alarms |= adt7475_read(REG_STATUS4) << 24;
> -			ext = adt7475_read(REG_EXTEND3);
> -			data->voltage[INPUT][5] = adt7475_read(REG_VTT) << 2 |
> -				((ext >> 4) & 3);
> -		}
> +	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
> +		if (i == 3 && !data->has_fan4)
> +			continue;
> +		data->tach[INPUT][i] =
> +			adt7475_read_word(client, TACH_REG(i));
> +	}
>  
> -		for (i = 0; i < ADT7475_TACH_COUNT; i++) {
> -			if (i == 3 && !data->has_fan4)
> -				continue;
> -			data->tach[INPUT][i] =
> -				adt7475_read_word(client, TACH_REG(i));
> -		}
> +	/* Updated by hw when in auto mode */
> +	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
> +		if (i == 1 && !data->has_pwm2)
> +			continue;
> +		data->pwm[INPUT][i] = adt7475_read(PWM_REG(i));
> +	}
>  
> -		/* Updated by hw when in auto mode */
> -		for (i = 0; i < ADT7475_PWM_COUNT; i++) {
> -			if (i == 1 && !data->has_pwm2)
> -				continue;
> -			data->pwm[INPUT][i] = adt7475_read(PWM_REG(i));
> -		}
> +	if (data->has_vid)
> +		data->vid = adt7475_read(REG_VID) & 0x3f;
> +}
> +
> +static void adt7475_update_limits(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
> +	int i;
>  
> -		if (data->has_vid)
> -			data->vid = adt7475_read(REG_VID) & 0x3f;
> +	data->config4 = adt7475_read(REG_CONFIG4);
> +	data->config5 = adt7475_read(REG_CONFIG5);
>  
> -		data->measure_updated = jiffies;
> +	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
> +		if (!(data->has_voltage & (1 << i)))
> +			continue;
> +		/* Adjust values so they match the input precision */
> +		data->voltage[MIN][i] =
> +			adt7475_read(VOLTAGE_MIN_REG(i)) << 2;
> +		data->voltage[MAX][i] =
> +			adt7475_read(VOLTAGE_MAX_REG(i)) << 2;
>  	}
>  
> -	/* Limits and settings, should never change update every 60 seconds */
> -	if (time_after(jiffies, data->limits_updated + HZ * 60) ||
> -	    !data->valid) {
> -		data->config4 = adt7475_read(REG_CONFIG4);
> -		data->config5 = adt7475_read(REG_CONFIG5);
> -
> -		for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
> -			if (!(data->has_voltage & (1 << i)))
> -				continue;
> -			/* Adjust values so they match the input precision */
> -			data->voltage[MIN][i] =
> -				adt7475_read(VOLTAGE_MIN_REG(i)) << 2;
> -			data->voltage[MAX][i] =
> -				adt7475_read(VOLTAGE_MAX_REG(i)) << 2;
> -		}
> +	if (data->has_voltage & (1 << 5)) {
> +		data->voltage[MIN][5] = adt7475_read(REG_VTT_MIN) << 2;
> +		data->voltage[MAX][5] = adt7475_read(REG_VTT_MAX) << 2;
> +	}
>  
> -		if (data->has_voltage & (1 << 5)) {
> -			data->voltage[MIN][5] = adt7475_read(REG_VTT_MIN) << 2;
> -			data->voltage[MAX][5] = adt7475_read(REG_VTT_MAX) << 2;
> -		}
> +	for (i = 0; i < ADT7475_TEMP_COUNT; i++) {
> +		/* Adjust values so they match the input precision */
> +		data->temp[MIN][i] =
> +			adt7475_read(TEMP_MIN_REG(i)) << 2;
> +		data->temp[MAX][i] =
> +			adt7475_read(TEMP_MAX_REG(i)) << 2;
> +		data->temp[AUTOMIN][i] =
> +			adt7475_read(TEMP_TMIN_REG(i)) << 2;
> +		data->temp[THERM][i] =
> +			adt7475_read(TEMP_THERM_REG(i)) << 2;
> +		data->temp[OFFSET][i] =
> +			adt7475_read(TEMP_OFFSET_REG(i));
> +	}
> +	adt7475_read_hystersis(client);
>  
> -		for (i = 0; i < ADT7475_TEMP_COUNT; i++) {
> -			/* Adjust values so they match the input precision */
> -			data->temp[MIN][i] =
> -				adt7475_read(TEMP_MIN_REG(i)) << 2;
> -			data->temp[MAX][i] =
> -				adt7475_read(TEMP_MAX_REG(i)) << 2;
> -			data->temp[AUTOMIN][i] =
> -				adt7475_read(TEMP_TMIN_REG(i)) << 2;
> -			data->temp[THERM][i] =
> -				adt7475_read(TEMP_THERM_REG(i)) << 2;
> -			data->temp[OFFSET][i] =
> -				adt7475_read(TEMP_OFFSET_REG(i));
> -		}
> -		adt7475_read_hystersis(client);
> +	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
> +		if (i == 3 && !data->has_fan4)
> +			continue;
> +		data->tach[MIN][i] =
> +			adt7475_read_word(client, TACH_MIN_REG(i));
> +	}
>  
> -		for (i = 0; i < ADT7475_TACH_COUNT; i++) {
> -			if (i == 3 && !data->has_fan4)
> -				continue;
> -			data->tach[MIN][i] =
> -				adt7475_read_word(client, TACH_MIN_REG(i));
> -		}
> +	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
> +		if (i == 1 && !data->has_pwm2)
> +			continue;
> +		data->pwm[MAX][i] = adt7475_read(PWM_MAX_REG(i));
> +		data->pwm[MIN][i] = adt7475_read(PWM_MIN_REG(i));
> +		/* Set the channel and control information */
> +		adt7475_read_pwm(client, i);
> +	}
>  
> -		for (i = 0; i < ADT7475_PWM_COUNT; i++) {
> -			if (i == 1 && !data->has_pwm2)
> -				continue;
> -			data->pwm[MAX][i] = adt7475_read(PWM_MAX_REG(i));
> -			data->pwm[MIN][i] = adt7475_read(PWM_MIN_REG(i));
> -			/* Set the channel and control information */
> -			adt7475_read_pwm(client, i);
> -		}
> +	data->range[0] = adt7475_read(TEMP_TRANGE_REG(0));
> +	data->range[1] = adt7475_read(TEMP_TRANGE_REG(1));
> +	data->range[2] = adt7475_read(TEMP_TRANGE_REG(2));
> +}
> +
> +static struct adt7475_data *adt7475_update_device(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
>  
> -		data->range[0] = adt7475_read(TEMP_TRANGE_REG(0));
> -		data->range[1] = adt7475_read(TEMP_TRANGE_REG(1));
> -		data->range[2] = adt7475_read(TEMP_TRANGE_REG(2));
> +	mutex_lock(&data->lock);
>  
> -		data->limits_updated = jiffies;
> -		data->valid = 1;
> +	/* Measurement values update every 2 seconds */
> +	if (time_after(jiffies, data->measure_updated + HZ * 2) ||
> +	    !data->valid) {
> +		adt7475_update_measure(dev);
> +		data->measure_updated = jiffies;
>  	}
>  
> +	/* Limits and settings, should never change update more than once */
> +	if (!data->limits_updated) {
> +		adt7475_update_limits(dev);
> +		data->limits_updated = true;
> +	}

It should now be possible to do this from the probe function.

Thanks,
Guenter

>  	mutex_unlock(&data->lock);
>  
>  	return data;
> -- 
> 2.16.1
> 
