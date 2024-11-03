Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591213049E;
	Sun,  3 Nov 2024 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730655426; cv=none; b=ipokdJA9jVcO4xQioG/hfw7ULaZKHJzDSXiRXA+lzl7/NEXr/vEunPAKytVcQEOTdbRhlP3riNYo/HfWx5LIYlrRIxGdkh8F/Tnk0haFsuKTgrXgDrTTVAhXI+hUnn/hw5N2ExkeYlEVyLjM9/rjb6IxItnYf/FzKosH4AbFcm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730655426; c=relaxed/simple;
	bh=EVjXhCJf49HTGMgrQiYlXqa0MsAAwh9PaVPcjba+K+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3aCkqrWuODlS99BoYsc34TzkNC5UZp4LT7p8g8Ka36f768311yxTzcbvlmTNT04uDe6yc++hleaeUgq00lJAVkWSNLZp366yTDC/bTw44GlmcNiZ8etSBl28+T9QV7gJxxtd3caXutAIne8zwa5/Rqc2SSbg2HvaQuSoaaxcTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnHi8HV8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnHi8HV8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so2755681b3a.0;
        Sun, 03 Nov 2024 09:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730655423; x=1731260223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=COYscUK1CYn5zoneH07bG/s1dd4VaYMAq34l7NzOHto=;
        b=ZnHi8HV8kp+K8SD39jSd9NXYzMgcM+VDaH7ZuxhRseYMP+kloO8BlGydbD4RPQim3u
         QXsQjescu9/kTO9t4hG4GAlUy2QkIvuf2HFWXu0vWykxAoUBVQk6R8cS12/fYPsXGNnQ
         5Y/FMDu+GNDSuykXKVe2zRpPLlr+5C1VF3mHhozu0ozvzOKsmjk+wRl805FOfN9nDnAf
         UBd9ExJ73To9hSXb5uoDYnJJJQF9wpK9UIv2fCxFveZYjs5L+/n71fpKiid0pVZa/gs2
         qnE+eJ3dNkMe1UB5lv80JYqYYN+NC5oCWr3kpgj69OwSGbp6devyiMTxvOtqGQuXDO2m
         dn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730655423; x=1731260223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COYscUK1CYn5zoneH07bG/s1dd4VaYMAq34l7NzOHto=;
        b=bIdmrXpxhUQ9KXtCRECDR5mAmPf/fOLD0IQX8kQNzFbgrwDP4B5G1kfNw0mb3WP5Rw
         AfVlqUghNjhbNR+l7EJ2A3PymhWp56Q/e6F0421lD50BsD9oRoLmXhCsbvf8qP/OOmUY
         DppoG5OaNx0st39m5hUU9OWxfUL8bGtgoKKWAQU3jHrytjrSJO4dcOaf/P0HnItbidX7
         rbbKI8XEyI9+qyFVOyqG9UWcD5qqTuKqelvMF1MszAZQzFB+OgIe8HNr/jMgFyhR4hHc
         vSgb206StBYly2Bxyau+v59hqWIa46TC5xARhtbZICTF00p0fjNx7nZgbDbCm1Rl7L4z
         Vmvw==
X-Forwarded-Encrypted: i=1; AJvYcCXJOK0lhLpgXPJYIKzgRD2goEveaZ7BAlmlM+5sDAn7+aNC6t3ABLs+oC6/9vvhtcpMbz3/k+v1Bps=@vger.kernel.org, AJvYcCXs05hS16IYIdSCWFP8wrygDFAYbxxloM/d3LleVd0DyLJSW6Is+xD0GXov+WOFKEnSoBGFLm23vyrIPdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+w4dNkhiLOwB3o/Sp5n9oWwhyAtWqsBT+KUEpGqtXmbiPlJe
	Q+H1mhv+3ZcX8O0DpEwz6h8Wi+2KobMR+JCSMew8CVoEjtN8yVED
X-Google-Smtp-Source: AGHT+IHk63TAMzTFxwrXpaTL/gHsTN+hNSaAy1VlIT4U+7XPE9dTG1hb9EZfFXXNR9Pv+KLvcNBlQQ==
X-Received: by 2002:a17:902:f543:b0:20b:a5b5:b89 with SMTP id d9443c01a7336-210c6b0171emr381163455ad.35.1730655423223;
        Sun, 03 Nov 2024 09:37:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0ed3sm48563105ad.216.2024.11.03.09.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 09:37:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b3da9f78-c7d5-4bbf-80f3-bf5b52270792@roeck-us.net>
Date: Sun, 3 Nov 2024 09:37:00 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.11 v3 1/2] hwmon: (ina226) Add support for
 SY24655
To: Wenliang <wenliang202407@163.com>
Cc: book <book@100ask.localdomain>, jdelvare@suse.com, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <706d4821-2637-4aac-869b-822f69aebbfa@roeck-us.net>
 <20241103163908.11890-1-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241103163908.11890-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/24 08:39, Wenliang wrote:
> From: book <book@100ask.localdomain>
> 
> Signed-off-by: book <book@100ask.localdomain>
> ---
> 

There is still no appropriate description, and the Signed-off-by: tag
as well as the From: tag are unacceptable.

> v3:Support the SY24655 for current and voltage detection as well as
> power calculation.
> SY24655 provides a power accumulator. Add support for the power1_average
> attribute to report the average power. Add EIN register and
> ACCUM_CONFIG register addresses for SY24655. Add a 48 bit read function
> to meet the average power read.
> 

This does not describe the changes made in this version of the patch.

Guenter

>   Documentation/hwmon/ina2xx.rst | 27 +++++++++-
>   drivers/hwmon/Kconfig          |  2 +-
>   drivers/hwmon/ina2xx.c         | 96 ++++++++++++++++++++++++++++++++--
>   3 files changed, 118 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
> index 1ce161e6c0bf..a3860aae444c 100644
> --- a/Documentation/hwmon/ina2xx.rst
> +++ b/Documentation/hwmon/ina2xx.rst
> @@ -63,6 +63,17 @@ Supported chips:
>   
>   	       https://www.ti.com/
>   
> +  * Silergy SY24655
> +
> +    Prefix: 'sy24655'
> +
> +    Addresses: I2C 0x40 - 0x4f
> +
> +    Datasheet: Publicly available at the Silergy website
> +
> +	       https://us1.silergy.com/
> +
> +
>   Author: Lothar Felten <lothar.felten@gmail.com>
>   
>   Description
> @@ -85,6 +96,11 @@ bus supply voltage.
>   INA260 is a high or low side current and power monitor with integrated shunt
>   resistor.
>   
> +The SY24655 is a high- and low-side current shunt and power monitor with an I2C
> +interface. The SY24655 supports both shunt drop and supply voltage, with
> +programmable calibration value and conversion times. The SY24655 can also
> +calculate average power for use in energy conversion.
> +
>   The shunt value in micro-ohms can be set via platform data or device tree at
>   compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
>   refer to the Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings
> @@ -108,8 +124,8 @@ power1_input		Power(uW) measurement channel
>   shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
>   ======================= ===============================================
>   
> -Additional sysfs entries for ina226, ina230, ina231, and ina260
> ----------------------------------------------------------------
> +Additional sysfs entries for ina226, ina230, ina231, ina260, and sy24655
> +------------------------------------------------------------------------
>   
>   ======================= ====================================================
>   curr1_lcrit		Critical low current
> @@ -130,6 +146,13 @@ update_interval		data conversion time; affects number of samples used
>   			to average results for shunt and bus voltages.
>   ======================= ====================================================
>   
> +Sysfs entries for sy24655 only
> +------------------------------
> +
> +======================= ====================================================
> +power1_average		average power from last reading to the present.
> +======================= ====================================================
> +
>   .. note::
>   
>      - Configure `shunt_resistor` before configure `power1_crit`, because power
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 85c34080a407..a55d9a88ce7d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2178,7 +2178,7 @@ config SENSORS_INA2XX
>   	select REGMAP_I2C
>   	help
>   	  If you say yes here you get support for INA219, INA220, INA226,
> -	  INA230, INA231, and INA260 power monitor chips.
> +	   INA230, INA231, INA260, and SY24655 power monitor chips.
>   
>   	  The INA2xx driver is configured for the default configuration of
>   	  the part as described in the datasheet.
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index cecc80a41a97..16fdbc0eb1f9 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -51,12 +51,19 @@
>   #define INA226_ALERT_LIMIT		0x07
>   #define INA226_DIE_ID			0xFF
>   
> -#define INA2XX_MAX_REGISTERS		8
> +/* SY24655 register definitions */
> +#define SY24655_EIN				0x0A
> +#define SY24655_ACCUM_CONFIG	0x0D
> +#define INA2XX_MAX_REGISTERS		0x0D
>   
>   /* settings - depend on use case */
>   #define INA219_CONFIG_DEFAULT		0x399F	/* PGA=8 */
>   #define INA226_CONFIG_DEFAULT		0x4527	/* averages=16 */
>   #define INA260_CONFIG_DEFAULT		0x6527	/* averages=16 */
> +#define SY24655_CONFIG_DEFAULT		0x4527	/* averages=16 */
> +
> +/* (only for sy24655) */
> +#define SY24655_ACCUM_CONFIG_DEFAULT	0x044C	/* continuous mode, clear after read*/
>   
>   /* worst case is 68.10 ms (~14.6Hz, ina219) */
>   #define INA2XX_CONVERSION_RATE		15
> @@ -97,6 +104,7 @@ static bool ina2xx_writeable_reg(struct device *dev, unsigned int reg)
>   	case INA2XX_CALIBRATION:
>   	case INA226_MASK_ENABLE:
>   	case INA226_ALERT_LIMIT:
> +	case SY24655_ACCUM_CONFIG:
>   		return true;
>   	default:
>   		return false;
> @@ -127,12 +135,13 @@ static const struct regmap_config ina2xx_regmap_config = {
>   	.writeable_reg = ina2xx_writeable_reg,
>   };
>   
> -enum ina2xx_ids { ina219, ina226, ina260 };
> +enum ina2xx_ids { ina219, ina226, ina260, sy24655 };
>   
>   struct ina2xx_config {
>   	u16 config_default;
>   	bool has_alerts;	/* chip supports alerts and limits */
>   	bool has_ishunt;	/* chip has internal shunt resistor */
> +	bool has_power_average;	/* chip has internal shunt resistor */
>   	int calibration_value;
>   	int shunt_div;
>   	int bus_voltage_shift;
> @@ -149,6 +158,7 @@ struct ina2xx_data {
>   	long power_lsb_uW;
>   	struct mutex config_lock;
>   	struct regmap *regmap;
> +	struct i2c_client *client;
>   };
>   
>   static const struct ina2xx_config ina2xx_config[] = {
> @@ -161,6 +171,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.power_lsb_factor = 20,
>   		.has_alerts = false,
>   		.has_ishunt = false,
> +		.has_power_average = false,
>   	},
>   	[ina226] = {
>   		.config_default = INA226_CONFIG_DEFAULT,
> @@ -171,6 +182,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.power_lsb_factor = 25,
>   		.has_alerts = true,
>   		.has_ishunt = false,
> +		.has_power_average = false,
>   	},
>   	[ina260] = {
>   		.config_default = INA260_CONFIG_DEFAULT,
> @@ -180,6 +192,18 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.power_lsb_factor = 8,
>   		.has_alerts = true,
>   		.has_ishunt = true,
> +		.has_power_average = false,
> +	},
> +	[sy24655] = {
> +		.config_default = SY24655_CONFIG_DEFAULT,
> +		.calibration_value = 4096,
> +		.shunt_div = 400,
> +		.bus_voltage_shift = 0,
> +		.bus_voltage_lsb = 1250,
> +		.power_lsb_factor = 25,
> +		.has_alerts = true,
> +		.has_ishunt = false,
> +		.has_power_average = true,
>   	},
>   };
>   
> @@ -485,6 +509,42 @@ static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
>   	return 0;
>   }
>   
> +/*
> + * Configuring the READ_EIN (bit 10) of the ACCUM_CONFIG register to 1
> + * can clear accumulator and sample_count after reading the EIN register.
> + * This way, the average power between the last read and the current
> + * read can be obtained. By combining with accurate time data from
> + * outside, the energy consumption during that period can be calculated.
> + */
> +static int sy24655_average_power_read(struct ina2xx_data *data, u8 reg, long *val)
> +{
> +	u8 template[6];
> +	int ret;
> +	long accumulator_24, sample_count;
> +	unsigned int regval;
> +
> +	/* 48-bit register read */
> +	ret = i2c_smbus_read_i2c_block_data(data->client, reg, 6, template);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 6)
> +		return -EIO;
> +	accumulator_24 = ((template[3] << 16) |
> +				(template[4] << 8) |
> +				template[5]);
> +	sample_count = ((template[0] << 16) |
> +				(template[1] << 8) |
> +				template[2]);
> +	if (sample_count <= 0) {
> +		*val = 0;
> +		return 0;
> +	}
> +
> +	*val = DIV_ROUND_CLOSEST(accumulator_24, sample_count) * data->power_lsb_uW;
> +
> +	return 0;
> +}
> +
>   static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
>   {
>   	struct ina2xx_data *data = dev_get_drvdata(dev);
> @@ -492,6 +552,8 @@ static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
>   	switch (attr) {
>   	case hwmon_power_input:
>   		return ina2xx_read_init(dev, INA2XX_POWER, val);
> +	case hwmon_power_average:
> +		return sy24655_average_power_read(data, SY24655_EIN, val);
>   	case hwmon_power_crit:
>   		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
>   					       INA2XX_POWER, val);
> @@ -651,6 +713,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
>   {
>   	const struct ina2xx_data *data = _data;
>   	bool has_alerts = data->config->has_alerts;
> +	bool has_power_average = data->config->has_power_average;
>   	enum ina2xx_ids chip = data->chip;
>   
>   	switch (type) {
> @@ -668,6 +731,11 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
>   			if (has_alerts)
>   				return 0444;
>   			break;
> +		case hwmon_power_average:
> +			if (has_power_average)
> +				return 0444;
> +			break;
> +			return 0444;
>   		default:
>   			break;
>   		}
> @@ -734,7 +802,8 @@ static const struct hwmon_channel_info * const ina2xx_info[] = {
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM |
>   			   HWMON_C_LCRIT | HWMON_C_LCRIT_ALARM),
>   	HWMON_CHANNEL_INFO(power,
> -			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
> +			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM |
> +			   HWMON_P_AVERAGE),
>   	NULL
>   };
>   
> @@ -839,6 +908,19 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
>   				   INA226_ALERT_LATCH_ENABLE |
>   						FIELD_PREP(INA226_ALERT_POLARITY, active_high));
>   	}
> +	if (data->config->has_power_average) {
> +		if (data->chip == sy24655) {
> +			/*
> +			 * Initialize the power accumulation method to continuous
> +			 * mode and clear the EIN register after each read of the
> +			 * EIN register
> +			 */
> +			ret = regmap_write(regmap, SY24655_ACCUM_CONFIG,
> +					   SY24655_ACCUM_CONFIG_DEFAULT);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
>   
>   	if (data->config->has_ishunt)
>   		return 0;
> @@ -868,6 +950,7 @@ static int ina2xx_probe(struct i2c_client *client)
>   		return -ENOMEM;
>   
>   	/* set the device type */
> +	data->client = client;
>   	data->config = &ina2xx_config[chip];
>   	data->chip = chip;
>   	mutex_init(&data->config_lock);
> @@ -906,6 +989,7 @@ static const struct i2c_device_id ina2xx_id[] = {
>   	{ "ina230", ina226 },
>   	{ "ina231", ina226 },
>   	{ "ina260", ina260 },
> +	{ "sy24655", sy24655 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, ina2xx_id);
> @@ -935,7 +1019,11 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
>   		.compatible = "ti,ina260",
>   		.data = (void *)ina260
>   	},
> -	{ },
> +	{
> +		.compatible = "silergy,sy24655",
> +		.data = (void *)sy24655
> +	},
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(of, ina2xx_of_match);
>   

