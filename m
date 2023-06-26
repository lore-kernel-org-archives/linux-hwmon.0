Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E17EB64DA
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 15:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFZPDz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 11:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjFZPDy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 11:03:54 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E71130;
        Mon, 26 Jun 2023 08:03:52 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6686c74183cso3171811b3a.1;
        Mon, 26 Jun 2023 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687791831; x=1690383831;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5LrfGVd/PCi3tcNHR5GX7EOlr/r0pb0+B1UXQubGOU=;
        b=MdmZhVOgyz8J9ZeLXgyM7KlEx7lmWrNEzEpWV3kSeT0TA2Faz/EPh88qxzc1KBJE0Z
         vB+9vKBanMryQiSABTHpyppOiFQapj9bOBiZi+HG8IWQsd997v133I38KfpanI4Jrne3
         OOUoSLn9RYcB6uqukgOhq4VZEBdRSIdB45gmpWrs2NkX5sw4HuCRERGxUBABJTpdu1KK
         D+CUR00fN4jyhJjbV1n1Y6A5Q9+ByASy9Jrt6UuUH590QXYZiv5tx48x046C4tSK2v7H
         WhmusH2ELsF+OchND5j3YUra1xGe7fy6VLVq6YYRZ1CTa46kFtmXHlhFQHwWU+bmt+Yf
         zdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687791831; x=1690383831;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5LrfGVd/PCi3tcNHR5GX7EOlr/r0pb0+B1UXQubGOU=;
        b=I8PW3OQxwGwJiZcFB6e9w2G1Tme3L+1n2pKq8isxM94O7IENz9ZQo15mf+/Whj0Mi7
         VV0KgBbYQp78LJHXtYKqyVIG/MipJx05B6+Pg3KaTcRhPWQSIUPNbOOoqK0NcsmVF2GT
         NDIEJ7b0w3o+wvDCUUZM/2MJU/aBhGKdKOnGp6Pn+DKvLud9NYsgdItV8IdF+OayM3Ly
         BiZhu9T4h9P7JBydyfSqlrmjIj63zcwM8/5WGTN5HOSPPbIshppawYSYsMA4MuR0k3Un
         VtS3VvIKADWLELrD/Pm/GvJEGJ+7kAQq3BlJwNq3FrAXdJADZw8uUh2fEWv4mDMTKJuy
         uvkw==
X-Gm-Message-State: AC+VfDyvmNpCRMfHbnxYkBhFXX/w5gerTPI46AvqemUqRp3J7OEffMkq
        nKswoRSifnO3kH4Pbf0tnsk=
X-Google-Smtp-Source: ACHHUZ4K35rpZSBPUbERIINb8kCm60xeVbD8SV5Te9TR6ycMOTT2j09tjeYqGj90hmwMRXcw4IoYYQ==
X-Received: by 2002:a05:6a20:6a22:b0:122:b613:8b2 with SMTP id p34-20020a056a206a2200b00122b61308b2mr21913105pzk.0.1687791830937;
        Mon, 26 Jun 2023 08:03:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h18-20020a63f912000000b0051b36aee4f6sm4240692pgi.83.2023.06.26.08.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:03:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3928521f-9672-862b-fd26-647453717ecf@roeck-us.net>
Date:   Mon, 26 Jun 2023 08:03:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     JuenKit_Yip@hotmail.com, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <DB4PR10MB626103F3A3C361C9BD4988099226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/3] hwmon: (sht3x) convert some of sysfs interface to
 hwmon
In-Reply-To: <DB4PR10MB626103F3A3C361C9BD4988099226A@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/26/23 00:29, JuenKit_Yip@hotmail.com wrote:
> From: JuenKit Yip <JuenKit_Yip@hotmail.com>
> 
> update_interval, temperature/humidity max/min and hyst
> were moved to new hwmon interface, and only heater and
> repeatability were reserved as non-stardard sysfs interface.
> 
> Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
> ---
> v1:

This is v2.

>    - remove forward declearations
>    - fix switch statement about "return 0" and "break" for consistency
>    - convert type of "val" from string to numeric value

- store chip type in struct sht3x_data

> 
>   Documentation/hwmon/sht3x.rst |  21 +-
>   drivers/hwmon/sht3x.c         | 389 ++++++++++++++++++++++------------
>   2 files changed, 254 insertions(+), 156 deletions(-)
> 
> diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
> index 87864ffd1777..572df2be1689 100644
> --- a/Documentation/hwmon/sht3x.rst
> +++ b/Documentation/hwmon/sht3x.rst
> @@ -52,32 +52,15 @@ When the temperature and humidity readings move back between the hysteresis
>   values, the alert bit is set to 0 and the alert pin on the sensor is set to
>   low.
>   
> -sysfs-Interface
> ----------------
> +non-standard sysfs-Interface
> +----------------------------
>   
>   =================== ============================================================
> -temp1_input:        temperature input
> -humidity1_input:    humidity input
> -temp1_max:          temperature max value
> -temp1_max_hyst:     temperature hysteresis value for max limit
> -humidity1_max:      humidity max value
> -humidity1_max_hyst: humidity hysteresis value for max limit
> -temp1_min:          temperature min value
> -temp1_min_hyst:     temperature hysteresis value for min limit
> -humidity1_min:      humidity min value
> -humidity1_min_hyst: humidity hysteresis value for min limit
> -temp1_alarm:        alarm flag is set to 1 if the temperature is outside the
> -		    configured limits. Alarm only works in periodic measure mode
> -humidity1_alarm:    alarm flag is set to 1 if the humidity is outside the
> -		    configured limits. Alarm only works in periodic measure mode
>   heater_enable:      heater enable, heating element removes excess humidity from
>   		    sensor:
>   
>   			- 0: turned off
>   			- 1: turned on
> -update_interval:    update interval, 0 for single shot, interval in msec
> -		    for periodic measurement. If the interval is not supported
> -		    by the sensor, the next faster interval is chosen
>   repeatability:      write or read repeatability, higher repeatability means
>                       longer measurement duration, lower noise level and
>                       larger energy consumption:

Sorry I did not notice this before. There is no reason to drop standard attributes
from the documentation.

> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index bf18630619e0..bd483af1c5ab 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -147,8 +147,20 @@ static const u16 mode_to_update_interval[] = {
>   	 100,
>   };
>   
> +static const struct hwmon_channel_info * const sht3x_channel_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN |
> +				HWMON_T_MIN_HYST | HWMON_T_MAX |
> +				HWMON_T_MAX_HYST | HWMON_T_ALARM),
> +	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN |
> +				HWMON_H_MIN_HYST | HWMON_H_MAX |
> +				HWMON_H_MAX_HYST | HWMON_H_ALARM),
> +	NULL,
> +};
> +
>   struct sht3x_data {
>   	struct i2c_client *client;
> +	enum sht3x_chips chip_info;
>   	struct mutex i2c_lock; /* lock for sending i2c commands */
>   	struct mutex data_lock; /* lock for updating driver data */
>   
> @@ -276,27 +288,24 @@ static struct sht3x_data *sht3x_update_client(struct device *dev)
>   	return data;
>   }
>   
> -/* sysfs attributes */
> -static ssize_t temp1_input_show(struct device *dev,
> -				struct device_attribute *attr, char *buf)
> +static int temp1_input_read(struct device *dev)
>   {
>   	struct sht3x_data *data = sht3x_update_client(dev);
>   
>   	if (IS_ERR(data))
>   		return PTR_ERR(data);
>   
> -	return sprintf(buf, "%d\n", data->temperature);
> +	return data->temperature;

Another detail I just realized: The temperature can be negative.
Therefore, you can not use the return value as error indicator.
The same applies to temperature limits.

>   }
>   
> -static ssize_t humidity1_input_show(struct device *dev,
> -				    struct device_attribute *attr, char *buf)
> +static int humidity1_input_read(struct device *dev)
>   {
>   	struct sht3x_data *data = sht3x_update_client(dev);
>   
>   	if (IS_ERR(data))
>   		return PTR_ERR(data);
>   
> -	return sprintf(buf, "%u\n", data->humidity);
> +	return data->humidity;
>   }
>   
>   /*
> @@ -332,33 +341,24 @@ static int limits_update(struct sht3x_data *data)
>   	return ret;
>   }
>   
> -static ssize_t temp1_limit_show(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buf)
> +static int temp1_limit_read(struct device *dev, int index)
>   {
>   	struct sht3x_data *data = dev_get_drvdata(dev);
> -	u8 index = to_sensor_dev_attr(attr)->index;
> -	int temperature_limit = data->temperature_limits[index];
>   
> -	return sysfs_emit(buf, "%d\n", temperature_limit);
> +	return data->temperature_limits[index];
>   }
>   
> -static ssize_t humidity1_limit_show(struct device *dev,
> -				    struct device_attribute *attr,
> -				    char *buf)
> +static int humidity1_limit_read(struct device *dev, int index)
>   {
>   	struct sht3x_data *data = dev_get_drvdata(dev);
> -	u8 index = to_sensor_dev_attr(attr)->index;
> -	u32 humidity_limit = data->humidity_limits[index];
>   
> -	return sysfs_emit(buf, "%u\n", humidity_limit);
> +	return data->humidity_limits[index];
>   }
>   
>   /*
> - * limit_store must only be called with data_lock held
> + * limit_write must only be called with data_lock held
>    */
> -static size_t limit_store(struct device *dev,
> -			  size_t count,
> +static size_t limit_write(struct device *dev,

This is still wrong. return value has to be int (and there
should be a separate patch changing it first to ssize_t which
can be applied to stable releases).

>   			  u8 index,
>   			  int temperature,
>   			  u32 humidity)
> @@ -379,7 +379,7 @@ static size_t limit_store(struct device *dev,
>   	 * ST = (T + 45) / 175 * 2^16
>   	 * SRH = RH / 100 * 2^16
>   	 * adapted for fixed point arithmetic and packed the same as
> -	 * in limit_show()
> +	 * in limit_read()
>   	 */
>   	raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
>   	raw |= ((humidity * 42950) >> 16) & 0xfe00;
> @@ -400,50 +400,35 @@ static size_t limit_store(struct device *dev,
>   
>   	data->temperature_limits[index] = temperature;
>   	data->humidity_limits[index] = humidity;
> -	return count;
> +
> +	return 0;
>   }
>   
> -static ssize_t temp1_limit_store(struct device *dev,
> -				 struct device_attribute *attr,
> -				 const char *buf,
> -				 size_t count)
> +static int temp1_limit_write(struct device *dev, int index, int val)
>   {
>   	int temperature;
>   	int ret;
>   	struct sht3x_data *data = dev_get_drvdata(dev);
> -	u8 index = to_sensor_dev_attr(attr)->index;
>   
> -	ret = kstrtoint(buf, 0, &temperature);
> -	if (ret)
> -		return ret;
> -
> -	temperature = clamp_val(temperature, SHT3X_MIN_TEMPERATURE,
> +	temperature = clamp_val(val, SHT3X_MIN_TEMPERATURE,
>   				SHT3X_MAX_TEMPERATURE);
>   	mutex_lock(&data->data_lock);
> -	ret = limit_store(dev, count, index, temperature,
> +	ret = limit_write(dev, index, temperature,
>   			  data->humidity_limits[index]);
>   	mutex_unlock(&data->data_lock);
>   
>   	return ret;
>   }
>    > -static ssize_t humidity1_limit_store(struct device *dev,
> -				     struct device_attribute *attr,
> -				     const char *buf,
> -				     size_t count)
> +static int humidity1_limit_write(struct device *dev, int index, int val)

The value passed from the hwmon core is a long. If sizeof(long) != sizeof(int)
this will result in overflow problems. This applies to all write functions.

>   {
> -	u32 humidity;
> +	int humidity;
>   	int ret;
>   	struct sht3x_data *data = dev_get_drvdata(dev);
> -	u8 index = to_sensor_dev_attr(attr)->index;
>   
> -	ret = kstrtou32(buf, 0, &humidity);
> -	if (ret)
> -		return ret;
> -
> -	humidity = clamp_val(humidity, SHT3X_MIN_HUMIDITY, SHT3X_MAX_HUMIDITY);
> +	humidity = clamp_val(val, SHT3X_MIN_HUMIDITY, SHT3X_MAX_HUMIDITY);
>   	mutex_lock(&data->data_lock);
> -	ret = limit_store(dev, count, index, data->temperature_limits[index],
> +	ret = limit_write(dev, index, data->temperature_limits[index],
>   			  humidity);
>   	mutex_unlock(&data->data_lock);
>   
> @@ -474,7 +459,6 @@ static void sht3x_select_command(struct sht3x_data *data)
>   }
>   
>   static int status_register_read(struct device *dev,
> -				struct device_attribute *attr,
>   				char *buffer, int length)
>   {
>   	int ret;
> @@ -487,34 +471,30 @@ static int status_register_read(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t temp1_alarm_show(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buf)
> +static int temp1_alarm_read(struct device *dev)
>   {
>   	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
>   	int ret;
>   
> -	ret = status_register_read(dev, attr, buffer,
> +	ret = status_register_read(dev, buffer,
>   				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
>   	if (ret)
>   		return ret;
>   
> -	return sysfs_emit(buf, "%d\n", !!(buffer[0] & 0x04));
> +	return !!(buffer[0] & 0x04);
>   }
>   
> -static ssize_t humidity1_alarm_show(struct device *dev,
> -				    struct device_attribute *attr,
> -				    char *buf)
> +static int humidity1_alarm_read(struct device *dev)
>   {
>   	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
>   	int ret;
>   
> -	ret = status_register_read(dev, attr, buffer,
> +	ret = status_register_read(dev, buffer,
>   				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
>   	if (ret)
>   		return ret;
>   
> -	return sysfs_emit(buf, "%d\n", !!(buffer[0] & 0x08));
> +	return !!(buffer[0] & 0x08);
>   }
>   
>   static ssize_t heater_enable_show(struct device *dev,
> @@ -524,7 +504,7 @@ static ssize_t heater_enable_show(struct device *dev,
>   	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
>   	int ret;
>   
> -	ret = status_register_read(dev, attr, buffer,
> +	ret = status_register_read(dev, buffer,
>   				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
>   	if (ret)
>   		return ret;
> @@ -560,39 +540,28 @@ static ssize_t heater_enable_store(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t update_interval_show(struct device *dev,
> -				    struct device_attribute *attr,
> -				    char *buf)
> +static int update_interval_read(struct device *dev)
>   {
>   	struct sht3x_data *data = dev_get_drvdata(dev);
>   
> -	return sysfs_emit(buf, "%u\n",
> -			 mode_to_update_interval[data->mode]);
> +	return mode_to_update_interval[data->mode];
>   }
>   
> -static ssize_t update_interval_store(struct device *dev,
> -				     struct device_attribute *attr,
> -				     const char *buf,
> -				     size_t count)
> +static int update_interval_write(struct device *dev, u16 val)
>   {
> -	u16 update_interval;
>   	u8 mode;
>   	int ret;
>   	const char *command;
>   	struct sht3x_data *data = dev_get_drvdata(dev);
>   	struct i2c_client *client = data->client;
>   
> -	ret = kstrtou16(buf, 0, &update_interval);
> -	if (ret)
> -		return ret;
> -
> -	mode = get_mode_from_update_interval(update_interval);
> +	mode = get_mode_from_update_interval(val);
>   
>   	mutex_lock(&data->data_lock);
>   	/* mode did not change */
>   	if (mode == data->mode) {
>   		mutex_unlock(&data->data_lock);
> -		return count;
> +		return 0;
>   	}
>   
>   	mutex_lock(&data->i2c_lock);
> @@ -634,7 +603,7 @@ static ssize_t update_interval_store(struct device *dev,
>   	if (ret != SHT3X_CMD_LENGTH)
>   		return ret < 0 ? ret : -EIO;
>   
> -	return count;
> +	return 0;
>   }
>   
>   static ssize_t repeatability_show(struct device *dev,
> @@ -668,60 +637,219 @@ static ssize_t repeatability_store(struct device *dev,
>   	return count;
>   }
>   
> -static SENSOR_DEVICE_ATTR_RO(temp1_input, temp1_input, 0);
> -static SENSOR_DEVICE_ATTR_RO(humidity1_input, humidity1_input, 0);
> -static SENSOR_DEVICE_ATTR_RW(temp1_max, temp1_limit, limit_max);
> -static SENSOR_DEVICE_ATTR_RW(humidity1_max, humidity1_limit, limit_max);
> -static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp1_limit, limit_max_hyst);
> -static SENSOR_DEVICE_ATTR_RW(humidity1_max_hyst, humidity1_limit,
> -			     limit_max_hyst);
> -static SENSOR_DEVICE_ATTR_RW(temp1_min, temp1_limit, limit_min);
> -static SENSOR_DEVICE_ATTR_RW(humidity1_min, humidity1_limit, limit_min);
> -static SENSOR_DEVICE_ATTR_RW(temp1_min_hyst, temp1_limit, limit_min_hyst);
> -static SENSOR_DEVICE_ATTR_RW(humidity1_min_hyst, humidity1_limit,
> -			     limit_min_hyst);
> -static SENSOR_DEVICE_ATTR_RO(temp1_alarm, temp1_alarm, 0);
> -static SENSOR_DEVICE_ATTR_RO(humidity1_alarm, humidity1_alarm, 0);
>   static SENSOR_DEVICE_ATTR_RW(heater_enable, heater_enable, 0);
> -static SENSOR_DEVICE_ATTR_RW(update_interval, update_interval, 0);
>   static SENSOR_DEVICE_ATTR_RW(repeatability, repeatability, 0);
>   
>   static struct attribute *sht3x_attrs[] = {
> -	&sensor_dev_attr_temp1_input.dev_attr.attr,
> -	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
> -	&sensor_dev_attr_humidity1_max.dev_attr.attr,
> -	&sensor_dev_attr_humidity1_max_hyst.dev_attr.attr,
> -	&sensor_dev_attr_temp1_min.dev_attr.attr,
> -	&sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
> -	&sensor_dev_attr_humidity1_min.dev_attr.attr,
> -	&sensor_dev_attr_humidity1_min_hyst.dev_attr.attr,
> -	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
> -	&sensor_dev_attr_humidity1_alarm.dev_attr.attr,
>   	&sensor_dev_attr_heater_enable.dev_attr.attr,
> -	&sensor_dev_attr_update_interval.dev_attr.attr,
>   	&sensor_dev_attr_repeatability.dev_attr.attr,
>   	NULL
>   };
>   
> -static struct attribute *sts3x_attrs[] = {
> -	&sensor_dev_attr_temp1_input.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
> -	&sensor_dev_attr_temp1_min.dev_attr.attr,
> -	&sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
> -	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
> -	&sensor_dev_attr_heater_enable.dev_attr.attr,
> -	&sensor_dev_attr_update_interval.dev_attr.attr,
> -	&sensor_dev_attr_repeatability.dev_attr.attr,
> -	NULL
> +ATTRIBUTE_GROUPS(sht3x);
> +
> +static umode_t sht3x_is_visible(const void *data, enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	const struct sht3x_data *chip_data = data;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_alarm:
> +			return 0444;
> +		case hwmon_temp_max:
> +		case hwmon_temp_max_hyst:
> +		case hwmon_temp_min:
> +		case hwmon_temp_min_hyst:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_humidity:
> +		if (chip_data->chip_info == sts3x)
> +			break;
> +		switch (attr) {
> +		case hwmon_humidity_input:
> +		case hwmon_humidity_alarm:
> +			return 0444;
> +		case hwmon_humidity_max:
> +		case hwmon_humidity_max_hyst:
> +		case hwmon_humidity_min:
> +		case hwmon_humidity_min_hyst:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sht3x_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	enum sht3x_limits index;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			*val = update_interval_read(dev);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			*val = temp1_input_read(dev);
> +			break;
> +		case hwmon_temp_alarm:
> +			*val = temp1_alarm_read(dev);
> +			break;
> +		case hwmon_temp_max:
> +			index = limit_max;
> +			*val = temp1_limit_read(dev, index);
> +			break;
> +		case hwmon_temp_max_hyst:
> +			index = limit_max_hyst;
> +			*val = temp1_limit_read(dev, index);
> +			break;
> +		case hwmon_temp_min:
> +			index = limit_min;
> +			*val = temp1_limit_read(dev, index);
> +			break;
> +		case hwmon_temp_min_hyst:
> +			index = limit_min_hyst;
> +			*val = temp1_limit_read(dev, index);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_humidity:
> +		switch (attr) {
> +		case hwmon_humidity_input:
> +			*val = humidity1_input_read(dev);
> +			break;
> +		case hwmon_humidity_alarm:
> +			*val = humidity1_alarm_read(dev);
> +			break;
> +		case hwmon_humidity_max:
> +			index = limit_max;
> +			*val = humidity1_limit_read(dev, index);
> +			break;
> +		case hwmon_humidity_max_hyst:
> +			index = limit_max_hyst;
> +			*val = humidity1_limit_read(dev, index);
> +			break;
> +		case hwmon_humidity_min:
> +			index = limit_min;
> +			*val = humidity1_limit_read(dev, index);
> +			break;
> +		case hwmon_humidity_min_hyst:
> +			index = limit_min_hyst;
> +			*val = humidity1_limit_read(dev, index);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sht3x_write(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long val)
> +{
> +	enum sht3x_limits index;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return update_interval_write(dev, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			index = limit_max;
> +			break;
> +		case hwmon_temp_max_hyst:
> +			index = limit_max_hyst;
> +			break;
> +		case hwmon_temp_min:
> +			index = limit_min;
> +			break;
> +		case hwmon_temp_min_hyst:
> +			index = limit_min_hyst;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		return temp1_limit_write(dev, index, val);
> +	case hwmon_humidity:
> +		switch (attr) {
> +		case hwmon_humidity_max:
> +			index = limit_max;
> +			break;
> +		case hwmon_humidity_max_hyst:
> +			index = limit_max_hyst;
> +			break;
> +		case hwmon_humidity_min:
> +			index = limit_min;
> +			break;
> +		case hwmon_humidity_min_hyst:
> +			index = limit_min_hyst;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		return humidity1_limit_write(dev, index, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops sht3x_ops = {
> +	.is_visible = sht3x_is_visible,
> +	.read = sht3x_read,
> +	.write = sht3x_write,
>   };
>   
> -ATTRIBUTE_GROUPS(sht3x);
> -ATTRIBUTE_GROUPS(sts3x);
> +static const struct hwmon_chip_info sht3x_chip_info = {
> +	.ops = &sht3x_ops,
> +	.info = sht3x_channel_info,
> +};
> +
> +/* device ID table */
> +static const struct i2c_device_id sht3x_ids[] = {
> +	{"sht3x", sht3x},
> +	{"sts3x", sts3x},
> +	{}
> +};
>   
> -static const struct i2c_device_id sht3x_ids[];
> +MODULE_DEVICE_TABLE(i2c, sht3x_ids);
>   
>   static int sht3x_probe(struct i2c_client *client)
>   {
> @@ -730,7 +858,6 @@ static int sht3x_probe(struct i2c_client *client)
>   	struct device *hwmon_dev;
>   	struct i2c_adapter *adap = client->adapter;
>   	struct device *dev = &client->dev;
> -	const struct attribute_group **attribute_groups;
>   
>   	/*
>   	 * we require full i2c support since the sht3x uses multi-byte read and
> @@ -753,6 +880,7 @@ static int sht3x_probe(struct i2c_client *client)
>   	data->mode = 0;
>   	data->last_update = jiffies - msecs_to_jiffies(3000);
>   	data->client = client;
> +	data->chip_info = i2c_match_id(sht3x_ids, client)->driver_data;
>   	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
>   
>   	sht3x_select_command(data);
> @@ -771,15 +899,11 @@ static int sht3x_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> -	if (i2c_match_id(sht3x_ids, client)->driver_data == sts3x)
> -		attribute_groups = sts3x_groups;
> -	else
> -		attribute_groups = sht3x_groups;
> -
> -	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
> -							   client->name,
> -							   data,
> -							   attribute_groups);
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +							 client->name,
> +							 data,
> +							 &sht3x_chip_info,
> +							 sht3x_groups);
>   
>   	if (IS_ERR(hwmon_dev))
>   		dev_dbg(dev, "unable to register hwmon device\n");
> @@ -787,15 +911,6 @@ static int sht3x_probe(struct i2c_client *client)
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
>   
> -/* device ID table */
> -static const struct i2c_device_id sht3x_ids[] = {
> -	{"sht3x", sht3x},
> -	{"sts3x", sts3x},
> -	{}
> -};
> -
> -MODULE_DEVICE_TABLE(i2c, sht3x_ids);
> -
>   static struct i2c_driver sht3x_i2c_driver = {
>   	.driver.name = "sht3x",
>   	.probe       = sht3x_probe,

