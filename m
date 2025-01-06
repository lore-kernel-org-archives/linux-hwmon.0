Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D549B1E1C09;
	Mon,  6 Jan 2025 23:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736205727; cv=none; b=RqDnUCrB1BhxFFOPWx7DRQlHnqZNIcafEO8iNt2Pq/jXKR55pOhaaNrfA2F4XtGQOWe9GMgMrTaf6DIl7pJOcMQNp15RgKmfJAqihi+2q5LB/8EoEFdhEkbfVbkd+m2Q8NcKPiGFw9WYYKFbekvyQlcCAZLaocCvM6jLpW1ZMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736205727; c=relaxed/simple;
	bh=xuYi57Gb7Jlz7PZEeNoWNYsJFVLAuZLyApzFqQNbLG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGD8iuLccagDJhy1nkqIYWtswSQW07dfKR7S3OgjFCzMln0iE5iM0koX44UCLA6OgwVkngcZ5Q2xfoKD6MIVBY1jwDTZr472kvOOB91WWng9tzS0lRLj7in6m0SSql67f1fNk0+VEaDJkFkj2fswKeCiWvrCgSBHPRT7W+wDqis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOPSzxjr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOPSzxjr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215770613dbso160738495ad.2;
        Mon, 06 Jan 2025 15:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736205724; x=1736810524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=u0CKHVQsazAgqY56CJKOmFJvuPtSG/nTdW+/kBdRVv8=;
        b=TOPSzxjrmFS5ihjBrfkpFiJQo4eYJ2BMr1YP5VkwZOBgzOSLh/oKMEW37gD2XVZNYc
         +M2p42eRmu5v28KM8/s9rIv9qRW83Clz1qFIR4daPkII6UPcoFShJv4XG3rlZeYBDMX8
         R0KdF1w6FltCWRv1/tZgY2Ezch86jz9LvKCO74AKuukXDVtj4004PgE6qZmQKKBJtDJT
         LA5YsQBCMfMMT+8X5aWLV8t7lX8Lxpe+CVTC78Wlu9Vx98vmuKH7QAb9GIJ958rfQY3T
         dPbjC4GKKmWoLAeL/6NhgLtSs2twM7i2xIM4vxpxhy/u2vQoYNPGQxTpPhuat2nXxY3q
         Q+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736205724; x=1736810524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0CKHVQsazAgqY56CJKOmFJvuPtSG/nTdW+/kBdRVv8=;
        b=DsYCOPnUFauhe2OCd0KXBle6uLhCn6DIXaGhlK6XI4JnzQxHweblUTIChBSimzEKXl
         vnZY8kGJPk4s3t/TaVjS4KKkfKZMz2LRRrQ6E1ymQ7lCmxErAvwqDQKDqGHc7HDb4Yx+
         Hibwfz0Q+dRndpCs4vs2aLFdhvRkSY3U7RHm6qRYU99/57lksDwUGiysUkAKFKlHTMT5
         lXm15sebV3up4h/EvDbN26EjzHYbXfLopeMETszOXP1A6sVcBseClgSkDZU7l0YiiTC5
         Bj9bCHEn6yBzsFBo3JfTei2A4x6f+numekW9QXYnIoNONmA6ZVP212NYJ8tw4RkbhUd+
         5Obw==
X-Forwarded-Encrypted: i=1; AJvYcCVTRg0gA8CcSL+9OGNa4zU00hJouMr9Qa6SjF9z6S78eBhkGi4mWW3pxFneoyA0RuuZEoXkA4vs76irNA==@vger.kernel.org, AJvYcCVtvEPujE4hZfEXwGzojpVzALH0XPEWDQXwFamjnj+kHPgZBH9MZc+gN8TwDQPLkmDOd3XUWIfk+tOZoeMK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EeV7xr6Xclu/piwLxLaS9CN+vz/iO+S6WoLmXeNISe8UGH9V
	GsUqMwbjY05KJIB66IhWZvIlFktHrbev5RhCNzMNL6RLqB9shXoBShY/pg==
X-Gm-Gg: ASbGncsQ1jjlEJNq38pbLI9ZRNAitipVFxT1X03Zyyfb/I0Cpu0shhV68HEP08VEz5C
	8b1hPg1QC0J7yHo2G5Tj1Opgx9/daRcpmYHJx83QKYz4YDAPK7CaiH89ewL2sDqs+NQio2LOI0M
	abVbxwuXd/wFWNE9sE2EcdIma0LXKck2F/zrXX62CQ7z4wNZNyp9yiojW3kncZucxvwv9DIXuIr
	9dgMrs1rvDT6/qE+SIgbr+CxihDSMuTpUd85GrIm7nY0ve4UQTziQd6Zn9TS2vT6w2qqy/NHNrA
	q2XVfcfmAwbu0b7Nz/cGJxgWVK12ZQ==
X-Google-Smtp-Source: AGHT+IFfigpBJfG+ZRvaFnAY1vpsDVr4BLPM87tw0bJLETEy9/fySv4liFGZe/jnTqPkNhe5Epa0VQ==
X-Received: by 2002:a17:902:c941:b0:212:6187:6a76 with SMTP id d9443c01a7336-219e6e9a443mr820728535ad.14.1736205723912;
        Mon, 06 Jan 2025 15:22:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9706c3sm297992805ad.83.2025.01.06.15.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 15:22:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fac339de-9c01-4556-a172-e5b30233e5d1@roeck-us.net>
Date: Mon, 6 Jan 2025 15:22:01 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon:(ina238)Add support for SQ52206
To: Wenliang Yan <wenliang202407@163.com>, Jean Delvare <jdelvare@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241224063559.391061-1-wenliang202407@163.com>
 <20241224063559.391061-2-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241224063559.391061-2-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/24 22:35, Wenliang Yan wrote:
> From: Wenliang <wenliang202407@163.com>
> 
> Add support for SQ52206 to the Ina238 driver. Add registers,
> add calculation formulas, increase compatibility, adjust
> struct and chip initialization.
> 
> Signed-off-by: Wenliang <wenliang202407@163.com>
> ---
> 
> Incorporate four additional registers to the original register
> set of SQ52206 beyond INA238.
> The ADC measurement range of SQ52206 is divided into 1/2/4,
> so change the configuration of INA238_ADC_CONFIG.
> SQ52206's calculation of power read values is different from
> INA238.Add new value of BUS_VOLTAGE_LSB and DIE-TEMP_LSB for
> SQ52206. As a result of these changes, modify both the power
> and temperature read and write operations.
> Add kind and struct ina238_config *config in struct ina238_data
> to save the chip type and different configurations for each
> chip type, promoting program reusability.
> Due to the temperature reading of SQ52206 being a signed 16 bit
> value, while INA238 is a 12 bit value. So we changed the
> temperature reading function.
> Extract the chip initialization process into a separate function
> named ina238_init to facilitate adjustments for various chip types.
> Add a corresponding compatible to the driver.
> 
>   drivers/hwmon/ina238.c | 209 ++++++++++++++++++++++++++++-------------
>   1 file changed, 144 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
> index 2d9f12f68d50..131f5faefdb3 100644
> --- a/drivers/hwmon/ina238.c
> +++ b/drivers/hwmon/ina238.c
> @@ -21,11 +21,14 @@
>   #define INA238_CONFIG			0x0
>   #define INA238_ADC_CONFIG		0x1
>   #define INA238_SHUNT_CALIBRATION	0x2
> +#define SQ52206_SHUNT_TEMPCO		0x3
>   #define INA238_SHUNT_VOLTAGE		0x4
>   #define INA238_BUS_VOLTAGE		0x5
>   #define INA238_DIE_TEMP			0x6
>   #define INA238_CURRENT			0x7
>   #define INA238_POWER			0x8
> +#define SQ52206_ENERGY			0x9
> +#define SQ52206_CHARGE			0xa
>   #define INA238_DIAG_ALERT		0xb
>   #define INA238_SHUNT_OVER_VOLTAGE	0xc
>   #define INA238_SHUNT_UNDER_VOLTAGE	0xd
> @@ -33,9 +36,12 @@
>   #define INA238_BUS_UNDER_VOLTAGE	0xf
>   #define INA238_TEMP_LIMIT		0x10
>   #define INA238_POWER_LIMIT		0x11
> +#define SQ52206_POWER_PEAK		0x20
>   #define INA238_DEVICE_ID		0x3f /* not available on INA237 */
>   
>   #define INA238_CONFIG_ADCRANGE		BIT(4)
> +#define SQ52206_CONFIG_ADCRANGE		GENMASK(4, 3)
> +#define SQ52206_READ_ADCRANGE(reg)		FIELD_GET(SQ52206_CONFIG_ADCRANGE, reg)
>   
>   #define INA238_DIAG_ALERT_TMPOL		BIT(7)
>   #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
> @@ -44,7 +50,7 @@
>   #define INA238_DIAG_ALERT_BUSUL		BIT(3)
>   #define INA238_DIAG_ALERT_POL		BIT(2)
>   
> -#define INA238_REGISTERS		0x11
> +#define INA238_MAX_REGISTERS		0x20

Why this change ?

>   
>   #define INA238_RSHUNT_DEFAULT		10000 /* uOhm */
>   
> @@ -87,27 +93,63 @@
>    *  shunt = 0x4000 / (819.2 * 10^6) / 0.001 = 20000 uOhms (with 1mA/lsb)
>    *
>    *  Current (mA) = register value * 20000 / rshunt / 4 * gain
> - *  Power (W) = 0.2 * register value * 20000 / rshunt / 4 * gain
> + *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
> + *  (Specific for SQ52206)
> + *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
>    */
>   #define INA238_CALIBRATION_VALUE	16384
> -#define INA238_FIXED_SHUNT		20000
> +#define INA238_FIXED_SHUNT			20000

Why this change ?

>   
>   #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
>   #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
> -#define INA238_DIE_TEMP_LSB		125 /* 125 mC/lsb */
> +#define INA238_DIE_TEMP_LSB			1250000 /* 125 mC/lsb */
> +#define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
> +#define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
>   
>   static const struct regmap_config ina238_regmap_config = {
> -	.max_register = INA238_REGISTERS,
> +	.max_register = INA238_MAX_REGISTERS,
>   	.reg_bits = 8,
>   	.val_bits = 16,
>   };
>   
> +enum ina238_ids { ina238, ina237, sq52206 };
> +
> +struct ina238_config {
> +	u16 config_default;
> +	int calibration_value;

.config_default and .calibration_value is the same for all chips.
I don't see the point of not just using the respective defines.

> +	int bus_voltage_lsb;    /* uV */
> +	int temp_lsb;   /* mC */
> +};
> +
>   struct ina238_data {
> +	const struct ina238_config *config;
>   	struct i2c_client *client;
>   	struct mutex config_lock;
>   	struct regmap *regmap;
>   	u32 rshunt;
>   	int gain;
> +	int kind;
> +};
> +
> +static const struct ina238_config ina238_config[] = {
> +	[ina238] = {
> +		.config_default = INA238_CONFIG_DEFAULT,
> +		.calibration_value = INA238_CALIBRATION_VALUE,
> +		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
> +		.temp_lsb = INA238_DIE_TEMP_LSB,
> +	},
> +	[ina237] = {
> +		.config_default = INA238_CONFIG_DEFAULT,
> +		.calibration_value = INA238_CALIBRATION_VALUE,
> +		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
> +		.temp_lsb = INA238_DIE_TEMP_LSB,
> +	},
> +	[sq52206] = {
> +		.config_default = INA238_CONFIG_DEFAULT,
> +		.calibration_value = INA238_CALIBRATION_VALUE,
> +		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
> +		.temp_lsb = SQ52206_DIE_TEMP_LSB,
> +	},
>   };
>   
>   static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
> @@ -197,10 +239,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
>   		regval = (s16)regval;
>   		if (channel == 0)
>   			/* gain of 1 -> LSB / 4 */
> -			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
> -			       (1000 * (4 - data->gain + 1));
> +			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
> +					data->gain / (1000 * 4);

Why this change ?

>   		else
> -			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
> +			*val = (regval * data->config->bus_voltage_lsb) / 1000;
>   		break;
>   	case hwmon_in_max_alarm:
>   	case hwmon_in_min_alarm:
> @@ -225,8 +267,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
>   	case 0:
>   		/* signed value, clamp to max range +/-163 mV */
>   		regval = clamp_val(val, -163, 163);
> -		regval = (regval * 1000 * (4 - data->gain + 1)) /
> -			 INA238_SHUNT_VOLTAGE_LSB;
> +		regval = (regval * 1000 * 4) /
> +			 INA238_SHUNT_VOLTAGE_LSB * data->gain;

Why this change ?

>   		regval = clamp_val(regval, S16_MIN, S16_MAX);
>   
>   		switch (attr) {
> @@ -242,7 +284,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
>   	case 1:
>   		/* signed value, positive values only. Clamp to max 102.396 V */
>   		regval = clamp_val(val, 0, 102396);
> -		regval = (regval * 1000) / INA238_BUS_VOLTAGE_LSB;
> +		regval = (regval * 1000) / data->config->bus_voltage_lsb;
>   		regval = clamp_val(regval, 0, S16_MAX);
>   
>   		switch (attr) {
> @@ -295,10 +337,14 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
>   		err = ina238_read_reg24(data->client, INA238_POWER, &regval);
>   		if (err)
>   			return err;
> -
> -		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
> -		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
> -				data->gain, 20 * data->rshunt);
> +		if (data->kind == sq52206)
> +			/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
> +			power = div_u64(regval * 1200ULL * INA238_FIXED_SHUNT *
> +					data->gain, 20 * data->rshunt);
> +		else
> +			/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
> +			power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
> +					data->gain, 20 * data->rshunt);


>   		/* Clamp value to maximum value of long */
>   		*val = clamp_val(power, 0, LONG_MAX);
>   		break;
> @@ -311,8 +357,12 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
>   		 * Truncated 24-bit compare register, lower 8-bits are
>   		 * truncated. Same conversion to/from uW as POWER register.
>   		 */
> -		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
> -			       data->gain, 20 * data->rshunt);
> +		if (data->kind == sq52206)
> +			power = div_u64((regval << 8) * 1200ULL * INA238_FIXED_SHUNT *
> +					data->gain, 20 * data->rshunt);
> +		else
> +			power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
> +					data->gain, 20 * data->rshunt);
>   		/* Clamp value to maximum value of long */
>   		*val = clamp_val(power, 0, LONG_MAX);
>   		break;
> @@ -344,8 +394,12 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
>   	 * register.
>   	 */
>   	regval = clamp_val(val, 0, LONG_MAX);
> -	regval = div_u64(val * 20ULL * data->rshunt,
> -			 1000ULL * INA238_FIXED_SHUNT * data->gain);
> +	if (data->kind == sq52206)
> +		regval = div_u64(val * 20ULL * data->rshunt,
> +				1000ULL * INA238_FIXED_SHUNT * data->gain);
> +	else
> +		regval = div_u64(val * 24ULL * data->rshunt,
> +				1000ULL * INA238_FIXED_SHUNT * data->gain);

There is a constant factor against data->gain for the different chips.
Why not incorporate that into data->gain, or use a chip configuration
value for it ?

>   	regval = clamp_val(regval >> 8, 0, U16_MAX);
>   
>   	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
> @@ -362,17 +416,29 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
>   		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
>   		if (err)
>   			return err;
> -
> +		if (data->kind == sq52206)
> +			/* Signed, bits 15-0 of register, result in mC */
> +			regval = div_s64((s16)regval * data->config->temp_lsb,
> +								10000);
> +		else
>   		/* Signed, bits 15-4 of register, result in mC */
> -		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
> +			*val = div_s64(((s16)regval >> 4) *
> +							data->config->temp_lsb, 10000);
> +		*val = clamp_val(regval, S16_MIN, S16_MAX);

Why is this clamp_val() now necessary ?

It might make sense to add the shift count to struct ina238_config
instead of using if/else here.

In general, using if/else for some chip specifics and struct ina238_config
for others is confusing. I'd suggest to move all chip specific information
into struct ina238_config and avoid if/else in runtime code as much as possible.

>   		break;
>   	case hwmon_temp_max:
>   		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
>   		if (err)
>   			return err;
> -
> -		/* Signed, bits 15-4 of register, result in mC */
> -		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
> +		if (data->kind == sq52206)
> +			/* Signed, bits 15-0 of register, result in mC */
> +			regval = div_s64((s16)regval * data->config->temp_lsb,
> +								10000);
> +		else
> +			/* Signed, bits 15-4 of register, result in mC */
> +			*val = div_s64(((s16)regval >> 4) *
> +							data->config->temp_lsb, 10000);
> +		*val = clamp_val(regval, S16_MIN, S16_MAX);
>   		break;
>   	case hwmon_temp_max_alarm:
>   		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
> @@ -396,9 +462,14 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
>   	if (attr != hwmon_temp_max)
>   		return -EOPNOTSUPP;
>   
> -	/* Signed, bits 15-4 of register */
> -	regval = (val / INA238_DIE_TEMP_LSB) << 4;
> -	regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
> +	if (data->kind == sq52206) {
> +		regval = div_u64(val*10000, data->config->temp_lsb);
> +		regval = clamp_val(regval, S16_MIN, S16_MAX);
> +	} else {
> +		/* Signed, bits 15-4 of register */
> +		regval = div_u64(val*10000, data->config->temp_lsb) << 4;
> +		regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
> +	}
>   
>   	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
>   }
> @@ -530,20 +601,58 @@ static const struct hwmon_chip_info ina238_chip_info = {
>   	.info = ina238_info,
>   };
>   
> +/*
> + * Initialize the configuration and calibration registers.
> + */
> +static int ina238_init(struct ina238_data *data)
> +{
> +	int ret = 0;
> +	int config;
> +	/* Setup CONFIG register */
> +	config = data->config->config_default;
> +	if (data->gain == 1)
> +		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
> +	ret = regmap_write(data->regmap, INA238_CONFIG, config);
> +	if (ret < 0)
> +		return ret;
> +	/* Setup ADC_CONFIG register */
> +	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
> +				INA238_ADC_CONFIG_DEFAULT);
> +	if (ret < 0)
> +		return ret;
> +	/* Setup SHUNT_CALIBRATION register with fixed value */
> +	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
> +				data->config->calibration_value);
> +	if (ret < 0)
> +		return ret;
> +	/* Setup alert/alarm configuration */
> +	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
> +				INA238_DIAG_ALERT_DEFAULT);
> +	if (ret < 0)
> +		return ret;
> +	return 0;
> +}
> +static const struct i2c_device_id ina238_id[];

Please avoid forward declarations.

>   static int ina238_probe(struct i2c_client *client)
>   {
>   	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
>   	struct device *dev = &client->dev;
>   	struct device *hwmon_dev;
>   	struct ina238_data *data;
> -	int config;
> +	enum ina238_ids chip;
>   	int ret;
>   
> +	chip = (uintptr_t)i2c_get_match_data(client);
> +
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> +	data->kind = chip;
>   	data->client = client;
> +	/* set the device type */
> +	data->config = &ina238_config[data->kind];
> +
>   	mutex_init(&data->config_lock);
>   
>   	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
> @@ -564,48 +673,15 @@ static int ina238_probe(struct i2c_client *client)
>   	/* load shunt gain value */
>   	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
>   		data->gain = 4; /* Default of ADCRANGE = 0 */
> -	if (data->gain != 1 && data->gain != 4) {
> +	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {

Chip independent changes should be in separate patch(es).

>   		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
>   		return -EINVAL;
>   	}
> -
> -	/* Setup CONFIG register */
> -	config = INA238_CONFIG_DEFAULT;
> -	if (data->gain == 1)
> -		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
> -	ret = regmap_write(data->regmap, INA238_CONFIG, config);
> -	if (ret < 0) {
> -		dev_err(dev, "error configuring the device: %d\n", ret);
> -		return -ENODEV;
> -	}
> -
> -	/* Setup ADC_CONFIG register */
> -	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
> -			   INA238_ADC_CONFIG_DEFAULT);
> -	if (ret < 0) {
> -		dev_err(dev, "error configuring the device: %d\n", ret);
> -		return -ENODEV;
> -	}
> -
> -	/* Setup SHUNT_CALIBRATION register with fixed value */
> -	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
> -			   INA238_CALIBRATION_VALUE);
> -	if (ret < 0) {
> -		dev_err(dev, "error configuring the device: %d\n", ret);
> -		return -ENODEV;
> -	}
> -
> -	/* Setup alert/alarm configuration */
> -	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
> -			   INA238_DIAG_ALERT_DEFAULT);
> -	if (ret < 0) {
> -		dev_err(dev, "error configuring the device: %d\n", ret);
> -		return -ENODEV;
> -	}
> +	ret = ina238_init(data);
>   

Errors must not be ignored.

>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
>   							 &ina238_chip_info,
> -							 NULL);
> +							 ina238_groups);
>   	if (IS_ERR(hwmon_dev))
>   		return PTR_ERR(hwmon_dev);
>   
> @@ -616,7 +692,9 @@ static int ina238_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id ina238_id[] = {
> -	{ "ina238" },
> +	{ "ina238", ina238 },
> +	{ "ina237", ina237 },

Unrelated change, and out of order (ina237 should come first).

> +	{ "sq52206", sq52206 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, ina238_id);
> @@ -624,6 +702,7 @@ MODULE_DEVICE_TABLE(i2c, ina238_id);
>   static const struct of_device_id __maybe_unused ina238_of_match[] = {
>   	{ .compatible = "ti,ina237" },
>   	{ .compatible = "ti,ina238" },
> +	{ .compatible = "silergy,sq52206" },

.data is missing.

>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, ina238_of_match);

