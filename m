Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FF21EE017;
	Tue,  7 Jan 2025 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253920; cv=none; b=tjUlmWnvtyoKRdbRFMNSB7YDPXt3VoG9/7773P62NCH2I8sSXfNO8/Yuk9x63S+HOgwBKDoeH2U8PlfCfZODFjToXeWeNSJ1vJYUUp+OVRMk6wAWb7rxt+NjNK4lWoTEz+BCZUohZB8zLKbLnNAE/qDOWCnPQ6zFksSMDAy/0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253920; c=relaxed/simple;
	bh=ekhNhXrhAlYTW7VmycP6NFcN6y2u6oND5rrPz/a00tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4Oh1n9bmOr89TlcWdbCaKshughJ8Y+Gwh7OttEyD0EppegJtci7fgUmyTnyKXCqE49EGeyg+Su/5KlaLskRoTqkI05KIbI0M2agF4Ibbb1pDMqzoKZZwOZ/Kn0Qc4mvOipoqQ+65/221PZQIn0DHLoaxt99umuDT0kzttxqrpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nCzWt/c2; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nCzWt/c2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=j47Gm
	HkV7tRIkUd5UyY41BUkllk9oR1ocGBA+Vl0/v8=; b=nCzWt/c2HwwNrdHfK0qgm
	BWxgBszWKmWuEqcgXBgoeaFz7d7buQlX4HzNeovlBZXa+6pDg1/91LVC7/X5ZmaD
	fJOXcO5ME8dIk4WId3sNn6bhpupzwk9J9MJrPmDskhg7Yw0Zbj+RZswItHxgCXhs
	1tV8SK0f0GxyG0g6Gido2A=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnt1asIX1npIPeEQ--.17299S4;
	Tue, 07 Jan 2025 20:44:29 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH 1/3] hwmon:(ina238)Add support for SQ52206
Date: Tue,  7 Jan 2025 20:43:59 +0800
Message-ID: <20250107124359.24221-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <fac339de-9c01-4556-a172-e5b30233e5d1@roeck-us.net>
References: <fac339de-9c01-4556-a172-e5b30233e5d1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnt1asIX1npIPeEQ--.17299S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3uFyfWr4xZw1Uur4UKF4xCrg_yoW8Ww48Xo
	W3Zrs7Xw1fGw18CFWv93409rW7X3yjyr4rAF1UtrZ8GFyIqanxKayfXw48WFWruFyvqr97
	WryrGw1rZay0q3Wfn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU3U73UUUUU
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiowvN02d9IFQaDQAAsP

Add support for SQ52206, the datasheet depends on 
https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
The password is fx6NEe.

At 2025-01-07 07:22:01, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 12/23/24 22:35, Wenliang Yan wrote:
>> From: Wenliang <wenliang202407@163.com>
>> 
>> Add support for SQ52206 to the Ina238 driver. Add registers,
>> add calculation formulas, increase compatibility, adjust
>> struct and chip initialization.
>> 
>> Signed-off-by: Wenliang <wenliang202407@163.com>
>> ---
>> 
>> Incorporate four additional registers to the original register
>> set of SQ52206 beyond INA238.
>> The ADC measurement range of SQ52206 is divided into 1/2/4,
>> so change the configuration of INA238_ADC_CONFIG.
>> SQ52206's calculation of power read values is different from
>> INA238.Add new value of BUS_VOLTAGE_LSB and DIE-TEMP_LSB for
>> SQ52206. As a result of these changes, modify both the power
>> and temperature read and write operations.
>> Add kind and struct ina238_config *config in struct ina238_data
>> to save the chip type and different configurations for each
>> chip type, promoting program reusability.
>> Due to the temperature reading of SQ52206 being a signed 16 bit
>> value, while INA238 is a 12 bit value. So we changed the
>> temperature reading function.
>> Extract the chip initialization process into a separate function
>> named ina238_init to facilitate adjustments for various chip types.
>> Add a corresponding compatible to the driver.
>> 
>>   drivers/hwmon/ina238.c | 209 ++++++++++++++++++++++++++++-------------
>>   1 file changed, 144 insertions(+), 65 deletions(-)
>> 
>> diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
>> index 2d9f12f68d50..131f5faefdb3 100644
>> --- a/drivers/hwmon/ina238.c
>> +++ b/drivers/hwmon/ina238.c
>> @@ -21,11 +21,14 @@
>>   #define INA238_CONFIG			0x0
>>   #define INA238_ADC_CONFIG		0x1
>>   #define INA238_SHUNT_CALIBRATION	0x2
>> +#define SQ52206_SHUNT_TEMPCO		0x3
>>   #define INA238_SHUNT_VOLTAGE		0x4
>>   #define INA238_BUS_VOLTAGE		0x5
>>   #define INA238_DIE_TEMP			0x6
>>   #define INA238_CURRENT			0x7
>>   #define INA238_POWER			0x8
>> +#define SQ52206_ENERGY			0x9
>> +#define SQ52206_CHARGE			0xa
>>   #define INA238_DIAG_ALERT		0xb
>>   #define INA238_SHUNT_OVER_VOLTAGE	0xc
>>   #define INA238_SHUNT_UNDER_VOLTAGE	0xd
>> @@ -33,9 +36,12 @@
>>   #define INA238_BUS_UNDER_VOLTAGE	0xf
>>   #define INA238_TEMP_LIMIT		0x10
>>   #define INA238_POWER_LIMIT		0x11
>> +#define SQ52206_POWER_PEAK		0x20
>>   #define INA238_DEVICE_ID		0x3f /* not available on INA237 */
>>   
>>   #define INA238_CONFIG_ADCRANGE		BIT(4)
>> +#define SQ52206_CONFIG_ADCRANGE		GENMASK(4, 3)
>> +#define SQ52206_READ_ADCRANGE(reg)		FIELD_GET(SQ52206_CONFIG_ADCRANGE, reg)
>>   
>>   #define INA238_DIAG_ALERT_TMPOL		BIT(7)
>>   #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
>> @@ -44,7 +50,7 @@
>>   #define INA238_DIAG_ALERT_BUSUL		BIT(3)
>>   #define INA238_DIAG_ALERT_POL		BIT(2)
>>   
>> -#define INA238_REGISTERS		0x11
>> +#define INA238_MAX_REGISTERS		0x20
>
>Why this change ?
>

The maximum register address for SQ52206 is 0x20.

>>   
>>   #define INA238_RSHUNT_DEFAULT		10000 /* uOhm */
>>   
>> @@ -87,27 +93,63 @@
>>    *  shunt = 0x4000 / (819.2 * 10^6) / 0.001 = 20000 uOhms (with 1mA/lsb)
>>    *
>>    *  Current (mA) = register value * 20000 / rshunt / 4 * gain
>> - *  Power (W) = 0.2 * register value * 20000 / rshunt / 4 * gain
>> + *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
>> + *  (Specific for SQ52206)
>> + *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
>>    */
>>   #define INA238_CALIBRATION_VALUE	16384
>> -#define INA238_FIXED_SHUNT		20000
>> +#define INA238_FIXED_SHUNT			20000
>
>Why this change ?
>

Also refer to the chip manual provided in the website above.

>>   
>>   #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
>>   #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
>> -#define INA238_DIE_TEMP_LSB		125 /* 125 mC/lsb */
>> +#define INA238_DIE_TEMP_LSB			1250000 /* 125 mC/lsb */
>> +#define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
>> +#define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
>>   
>>   static const struct regmap_config ina238_regmap_config = {
>> -	.max_register = INA238_REGISTERS,
>> +	.max_register = INA238_MAX_REGISTERS,
>>   	.reg_bits = 8,
>>   	.val_bits = 16,
>>   };
>>   
>> +enum ina238_ids { ina238, ina237, sq52206 };
>> +
>> +struct ina238_config {
>> +	u16 config_default;
>> +	int calibration_value;
>
>.config_default and .calibration_value is the same for all chips.
>I don't see the point of not just using the respective defines.
>

Okay, I will change the definition here

>> +	int bus_voltage_lsb;    /* uV */
>> +	int temp_lsb;   /* mC */
>> +};
>> +
>>   struct ina238_data {
>> +	const struct ina238_config *config;
>>   	struct i2c_client *client;
>>   	struct mutex config_lock;
>>   	struct regmap *regmap;
>>   	u32 rshunt;
>>   	int gain;
>> +	int kind;
>> +};
>> +
>> +static const struct ina238_config ina238_config[] = {
>> +	[ina238] = {
>> +		.config_default = INA238_CONFIG_DEFAULT,
>> +		.calibration_value = INA238_CALIBRATION_VALUE,
>> +		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
>> +		.temp_lsb = INA238_DIE_TEMP_LSB,
>> +	},
>> +	[ina237] = {
>> +		.config_default = INA238_CONFIG_DEFAULT,
>> +		.calibration_value = INA238_CALIBRATION_VALUE,
>> +		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
>> +		.temp_lsb = INA238_DIE_TEMP_LSB,
>> +	},
>> +	[sq52206] = {
>> +		.config_default = INA238_CONFIG_DEFAULT,
>> +		.calibration_value = INA238_CALIBRATION_VALUE,
>> +		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
>> +		.temp_lsb = SQ52206_DIE_TEMP_LSB,
>> +	},
>>   };
>>   
>>   static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
>> @@ -197,10 +239,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
>>   		regval = (s16)regval;
>>   		if (channel == 0)
>>   			/* gain of 1 -> LSB / 4 */
>> -			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
>> -			       (1000 * (4 - data->gain + 1));
>> +			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
>> +					data->gain / (1000 * 4);
>
>Why this change ?
>

Because INA238 only has two gains of 1 and 4, the previous formula can
be used, but SQ52206 has a gain of 2, so I changed the formula

>>   		else
>> -			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
>> +			*val = (regval * data->config->bus_voltage_lsb) / 1000;
>>   		break;
>>   	case hwmon_in_max_alarm:
>>   	case hwmon_in_min_alarm:
>> @@ -225,8 +267,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
>>   	case 0:
>>   		/* signed value, clamp to max range +/-163 mV */
>>   		regval = clamp_val(val, -163, 163);
>> -		regval = (regval * 1000 * (4 - data->gain + 1)) /
>> -			 INA238_SHUNT_VOLTAGE_LSB;
>> +		regval = (regval * 1000 * 4) /
>> +			 INA238_SHUNT_VOLTAGE_LSB * data->gain;
>
>Why this change ?
>

Consistent with the reason described in the previous article.

>>   		regval = clamp_val(regval, S16_MIN, S16_MAX);
>>   
>>   		switch (attr) {
>> @@ -242,7 +284,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
>>   	case 1:
>>   		/* signed value, positive values only. Clamp to max 102.396 V */
>>   		regval = clamp_val(val, 0, 102396);
>> -		regval = (regval * 1000) / INA238_BUS_VOLTAGE_LSB;
>> +		regval = (regval * 1000) / data->config->bus_voltage_lsb;
>>   		regval = clamp_val(regval, 0, S16_MAX);
>>   
>>   		switch (attr) {
>> @@ -295,10 +337,14 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
>>   		err = ina238_read_reg24(data->client, INA238_POWER, &regval);
>>   		if (err)
>>   			return err;
>> -
>> -		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
>> -		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
>> -				data->gain, 20 * data->rshunt);
>> +		if (data->kind == sq52206)
>> +			/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
>> +			power = div_u64(regval * 1200ULL * INA238_FIXED_SHUNT *
>> +					data->gain, 20 * data->rshunt);
>> +		else
>> +			/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
>> +			power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
>> +					data->gain, 20 * data->rshunt);
>
>
>>   		/* Clamp value to maximum value of long */
>>   		*val = clamp_val(power, 0, LONG_MAX);
>>   		break;
>> @@ -311,8 +357,12 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
>>   		 * Truncated 24-bit compare register, lower 8-bits are
>>   		 * truncated. Same conversion to/from uW as POWER register.
>>   		 */
>> -		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
>> -			       data->gain, 20 * data->rshunt);
>> +		if (data->kind == sq52206)
>> +			power = div_u64((regval << 8) * 1200ULL * INA238_FIXED_SHUNT *
>> +					data->gain, 20 * data->rshunt);
>> +		else
>> +			power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
>> +					data->gain, 20 * data->rshunt);
>>   		/* Clamp value to maximum value of long */
>>   		*val = clamp_val(power, 0, LONG_MAX);
>>   		break;
>> @@ -344,8 +394,12 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
>>   	 * register.
>>   	 */
>>   	regval = clamp_val(val, 0, LONG_MAX);
>> -	regval = div_u64(val * 20ULL * data->rshunt,
>> -			 1000ULL * INA238_FIXED_SHUNT * data->gain);
>> +	if (data->kind == sq52206)
>> +		regval = div_u64(val * 20ULL * data->rshunt,
>> +				1000ULL * INA238_FIXED_SHUNT * data->gain);
>> +	else
>> +		regval = div_u64(val * 24ULL * data->rshunt,
>> +				1000ULL * INA238_FIXED_SHUNT * data->gain);
>
>There is a constant factor against data->gain for the different chips.
>Why not incorporate that into data->gain, or use a chip configuration
>value for it ?
>

I will make adjustments in V2.

>>   	regval = clamp_val(regval >> 8, 0, U16_MAX);
>>   
>>   	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
>> @@ -362,17 +416,29 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
>>   		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
>>   		if (err)
>>   			return err;
>> -
>> +		if (data->kind == sq52206)
>> +			/* Signed, bits 15-0 of register, result in mC */
>> +			regval = div_s64((s16)regval * data->config->temp_lsb,
>> +								10000);
>> +		else
>>   		/* Signed, bits 15-4 of register, result in mC */
>> -		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
>> +			*val = div_s64(((s16)regval >> 4) *
>> +							data->config->temp_lsb, 10000);
>> +		*val = clamp_val(regval, S16_MIN, S16_MAX);
>
>Why is this clamp_val() now necessary ?
>

Yes, it's not necessary. I will make the necessary modifications.

>It might make sense to add the shift count to struct ina238_config
>instead of using if/else here.
>
>In general, using if/else for some chip specifics and struct ina238_config
>for others is confusing. I'd suggest to move all chip specific information
>into struct ina238_config and avoid if/else in runtime code as much as possible.
>

I will move all chip specific information into struct ina238_config.

>>   		break;
>>   	case hwmon_temp_max:
>>   		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
>>   		if (err)
>>   			return err;
>> -
>> -		/* Signed, bits 15-4 of register, result in mC */
>> -		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
>> +		if (data->kind == sq52206)
>> +			/* Signed, bits 15-0 of register, result in mC */
>> +			regval = div_s64((s16)regval * data->config->temp_lsb,
>> +								10000);
>> +		else
>> +			/* Signed, bits 15-4 of register, result in mC */
>> +			*val = div_s64(((s16)regval >> 4) *
>> +							data->config->temp_lsb, 10000);
>> +		*val = clamp_val(regval, S16_MIN, S16_MAX);
>>   		break;
>>   	case hwmon_temp_max_alarm:
>>   		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
>> @@ -396,9 +462,14 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
>>   	if (attr != hwmon_temp_max)
>>   		return -EOPNOTSUPP;
>>   
>> -	/* Signed, bits 15-4 of register */
>> -	regval = (val / INA238_DIE_TEMP_LSB) << 4;
>> -	regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
>> +	if (data->kind == sq52206) {
>> +		regval = div_u64(val*10000, data->config->temp_lsb);
>> +		regval = clamp_val(regval, S16_MIN, S16_MAX);
>> +	} else {
>> +		/* Signed, bits 15-4 of register */
>> +		regval = div_u64(val*10000, data->config->temp_lsb) << 4;
>> +		regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
>> +	}
>>   
>>   	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
>>   }
>> @@ -530,20 +601,58 @@ static const struct hwmon_chip_info ina238_chip_info = {
>>   	.info = ina238_info,
>>   };
>>   
>> +/*
>> + * Initialize the configuration and calibration registers.
>> + */
>> +static int ina238_init(struct ina238_data *data)
>> +{
>> +	int ret = 0;
>> +	int config;
>> +	/* Setup CONFIG register */
>> +	config = data->config->config_default;
>> +	if (data->gain == 1)
>> +		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
>> +	ret = regmap_write(data->regmap, INA238_CONFIG, config);
>> +	if (ret < 0)
>> +		return ret;
>> +	/* Setup ADC_CONFIG register */
>> +	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
>> +				INA238_ADC_CONFIG_DEFAULT);
>> +	if (ret < 0)
>> +		return ret;
>> +	/* Setup SHUNT_CALIBRATION register with fixed value */
>> +	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
>> +				data->config->calibration_value);
>> +	if (ret < 0)
>> +		return ret;
>> +	/* Setup alert/alarm configuration */
>> +	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
>> +				INA238_DIAG_ALERT_DEFAULT);
>> +	if (ret < 0)
>> +		return ret;
>> +	return 0;
>> +}
>> +static const struct i2c_device_id ina238_id[];
>
>Please avoid forward declarations.
>

I will make adjustments in V2.

>>   static int ina238_probe(struct i2c_client *client)
>>   {
>>   	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
>>   	struct device *dev = &client->dev;
>>   	struct device *hwmon_dev;
>>   	struct ina238_data *data;
>> -	int config;
>> +	enum ina238_ids chip;
>>   	int ret;
>>   
>> +	chip = (uintptr_t)i2c_get_match_data(client);
>> +
>>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>>   		return -ENOMEM;
>>   
>> +	data->kind = chip;
>>   	data->client = client;
>> +	/* set the device type */
>> +	data->config = &ina238_config[data->kind];
>> +
>>   	mutex_init(&data->config_lock);
>>   
>>   	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
>> @@ -564,48 +673,15 @@ static int ina238_probe(struct i2c_client *client)
>>   	/* load shunt gain value */
>>   	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
>>   		data->gain = 4; /* Default of ADCRANGE = 0 */
>> -	if (data->gain != 1 && data->gain != 4) {
>> +	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
>
>Chip independent changes should be in separate patch(es).
>

SQ52206 has a gain of 2.

>>   		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
>>   		return -EINVAL;
>>   	}
>> -
>> -	/* Setup CONFIG register */
>> -	config = INA238_CONFIG_DEFAULT;
>> -	if (data->gain == 1)
>> -		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
>> -	ret = regmap_write(data->regmap, INA238_CONFIG, config);
>> -	if (ret < 0) {
>> -		dev_err(dev, "error configuring the device: %d\n", ret);
>> -		return -ENODEV;
>> -	}
>> -
>> -	/* Setup ADC_CONFIG register */
>> -	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
>> -			   INA238_ADC_CONFIG_DEFAULT);
>> -	if (ret < 0) {
>> -		dev_err(dev, "error configuring the device: %d\n", ret);
>> -		return -ENODEV;
>> -	}
>> -
>> -	/* Setup SHUNT_CALIBRATION register with fixed value */
>> -	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
>> -			   INA238_CALIBRATION_VALUE);
>> -	if (ret < 0) {
>> -		dev_err(dev, "error configuring the device: %d\n", ret);
>> -		return -ENODEV;
>> -	}
>> -
>> -	/* Setup alert/alarm configuration */
>> -	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
>> -			   INA238_DIAG_ALERT_DEFAULT);
>> -	if (ret < 0) {
>> -		dev_err(dev, "error configuring the device: %d\n", ret);
>> -		return -ENODEV;
>> -	}
>> +	ret = ina238_init(data);
>>   
>
>Errors must not be ignored.
>

I will make adjustments in V2.

>>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
>>   							 &ina238_chip_info,
>> -							 NULL);
>> +							 ina238_groups);
>>   	if (IS_ERR(hwmon_dev))
>>   		return PTR_ERR(hwmon_dev);
>>   
>> @@ -616,7 +692,9 @@ static int ina238_probe(struct i2c_client *client)
>>   }
>>   
>>   static const struct i2c_device_id ina238_id[] = {
>> -	{ "ina238" },
>> +	{ "ina238", ina238 },
>> +	{ "ina237", ina237 },
>
>Unrelated change, and out of order (ina237 should come first).
>

I will make adjustments in V2.

>> +	{ "sq52206", sq52206 },
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(i2c, ina238_id);
>> @@ -624,6 +702,7 @@ MODULE_DEVICE_TABLE(i2c, ina238_id);
>>   static const struct of_device_id __maybe_unused ina238_of_match[] = {
>>   	{ .compatible = "ti,ina237" },
>>   	{ .compatible = "ti,ina238" },
>> +	{ .compatible = "silergy,sq52206" },
>
>.data is missing.
>

I will make adjustments in V2.

>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(of, ina238_of_match);

Thanks,
Guenter

