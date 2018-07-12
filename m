Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:39014 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733093AbeGLCHh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 22:07:37 -0400
Received: by mail-pl0-f67.google.com with SMTP id s24-v6so9962349plq.6
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Jul 2018 19:00:28 -0700 (PDT)
Subject: Re: [PATCH 1/5] hwmon: adt7475: Split device update function to
 measure and limits
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Jean Delvare <jdelvare@suse.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
 <20180712010450.10586-2-ikegami@allied-telesis.co.jp>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e529079c-6f45-fdd5-c227-a1dd2563d42d@roeck-us.net>
Date: Wed, 11 Jul 2018 19:00:26 -0700
MIME-Version: 1.0
In-Reply-To: <20180712010450.10586-2-ikegami@allied-telesis.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/11/2018 06:04 PM, Tokunori Ikegami wrote:
> The function has the measure update part and limits and settings part.
> And those parts can be split so split them for a maintainability.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: linux-hwmon@vger.kernel.org
> ---
>   drivers/hwmon/adt7475.c | 214 +++++++++++++++++++++++++++---------------------
>   1 file changed, 122 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 9ef84998c7f3..234f725213f9 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -1658,119 +1658,149 @@ static void adt7475_read_pwm(struct i2c_client *client, int index)
>   	}
>   }
>   
> -static struct adt7475_data *adt7475_update_device(struct device *dev)
> +static int adt7475_update_measure(struct device *dev)
>   {
>   	struct i2c_client *client = to_i2c_client(dev);
>   	struct adt7475_data *data = i2c_get_clientdata(client);
>   	u16 ext;
>   	int i;
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
> +
> +	if (data->has_voltage & (1 << 5)) {
> +		data->alarms |= adt7475_read(REG_STATUS4) << 24;
> +		ext = adt7475_read(REG_EXTEND3);
> +		data->voltage[INPUT][5] = adt7475_read(REG_VTT) << 2 |
> +			((ext >> 4) & 3);
> +	}
>   
> -		for (i = 0; i < ADT7475_TEMP_COUNT; i++)
> -			data->temp[INPUT][i] =
> -				(adt7475_read(TEMP_REG(i)) << 2) |
> -				((ext >> ((i + 5) * 2)) & 3);
> +	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
> +		if (i == 3 && !data->has_fan4)
> +			continue;
> +		data->tach[INPUT][i] =
> +			adt7475_read_word(client, TACH_REG(i));
> +	}
>   
> -		if (data->has_voltage & (1 << 5)) {
> -			data->alarms |= adt7475_read(REG_STATUS4) << 24;
> -			ext = adt7475_read(REG_EXTEND3);
> -			data->voltage[INPUT][5] = adt7475_read(REG_VTT) << 2 |
> -				((ext >> 4) & 3);
> -		}
> +	/* Updated by hw when in auto mode */
> +	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
> +		if (i == 1 && !data->has_pwm2)
> +			continue;
> +		data->pwm[INPUT][i] = adt7475_read(PWM_REG(i));
> +	}
>   
> -		for (i = 0; i < ADT7475_TACH_COUNT; i++) {
> -			if (i == 3 && !data->has_fan4)
> -				continue;
> -			data->tach[INPUT][i] =
> -				adt7475_read_word(client, TACH_REG(i));
> -		}
> +	if (data->has_vid)
> +		data->vid = adt7475_read(REG_VID) & 0x3f;
>   
> -		/* Updated by hw when in auto mode */
> -		for (i = 0; i < ADT7475_PWM_COUNT; i++) {
> -			if (i == 1 && !data->has_pwm2)
> -				continue;
> -			data->pwm[INPUT][i] = adt7475_read(PWM_REG(i));
> -		}
> +	return 0;
> +}
>   
> -		if (data->has_vid)
> -			data->vid = adt7475_read(REG_VID) & 0x3f;
> +static int adt7475_update_limits(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
> +	int i;
>   
> -		data->measure_updated = jiffies;
> +	data->config4 = adt7475_read(REG_CONFIG4);
> +	data->config5 = adt7475_read(REG_CONFIG5);
> +
> +	for (i = 0; i < ADT7475_VOLTAGE_COUNT; i++) {
> +		if (!(data->has_voltage & (1 << i)))
> +			continue;
> +		/* Adjust values so they match the input precision */
> +		data->voltage[MIN][i] =
> +			adt7475_read(VOLTAGE_MIN_REG(i)) << 2;
> +		data->voltage[MAX][i] =
> +			adt7475_read(VOLTAGE_MAX_REG(i)) << 2;
>   	}
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
> +
> +	return 0;
> +}
>   
> -		data->range[0] = adt7475_read(TEMP_TRANGE_REG(0));
> -		data->range[1] = adt7475_read(TEMP_TRANGE_REG(1));
> -		data->range[2] = adt7475_read(TEMP_TRANGE_REG(2));
> +static struct adt7475_data *adt7475_update_device(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
> +	int ret;
>   
> +	mutex_lock(&data->lock);
> +
> +	/* Measurement values update every 2 seconds */
> +	if (time_after(jiffies, data->measure_updated + HZ * 2) ||
> +	    !data->valid) {
> +		ret = adt7475_update_measure(dev);
> +		if (ret < 0) {
> +			data->valid = 0;
> +			mutex_unlock(&data->lock);
> +			return data;

Maybe I am missing something, but I don't see the point of this code.
The errors still won't be returned to the user. The only effect is that
old values will be returned, and the next time around the read operation
will hopefully succeed. That isn't error handling, it is error suppression.

> +		}
> +		data->measure_updated = jiffies;
> +	}
> +
> +	/* Limits and settings, should never change update every 60 seconds */
> +	if (time_after(jiffies, data->limits_updated + HZ * 60) ||
> +	    !data->valid) {

Is there any reason to believe that the limits have to be updated more
than once ? Does the chip have the habit of loosing its configuration ?
If it does, wouldn't it be better to _restore_ the limits to the ones
previously cached instead of silently discarding the configuration ?

> +		ret = adt7475_update_limits(dev);
> +		if (ret < 0) {
> +			data->valid = 0;
> +			mutex_unlock(&data->lock);
> +			return data;
> +		}
>   		data->limits_updated = jiffies;
>   		data->valid = 1;
>   	}
> 

