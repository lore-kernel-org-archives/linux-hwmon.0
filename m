Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E78280035
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768543896; cv=none; b=TNrHAAo1ymRItocUvBnghtuuQQdFAmEnC9jt7oYAiF3zqYrXVqX/N6aqWPY7bSzNIxDUiJ6N0D0RChsuCVyEwzlUn86HcLBe4m+kadHxzJv46gnpuyhKik6X76iqCCAKWwZRdMfFxyUG+/3qxxPpM5FK1VP32GpglUEiXR7r2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768543896; c=relaxed/simple;
	bh=/m68g0Qt1I0hspMAjjIrQAxpoGB6n+7PhwjcrPoEjXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8ZTM9W8ZJ/wwkK/ecwRMXEK2Aw+6RaGbv0DYp6v+HXudSzkqh7wNuiq7jx5mDbya3bIPhSwsiXgxW2uS25f9880yj5aeN5E2Cw5i5rydImEmWWgbWKPIovEh4r1M+RSsOBlwfQIc6PR89wq9X737MfUE+w2zVzQIK47Mi14Hno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inqdw1Eg; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inqdw1Eg"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1233702afd3so2150010c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 22:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768543893; x=1769148693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hSQuOmMnvMPFRPSX6BFyMxcWf9xgMR05MF64h510eQ8=;
        b=inqdw1EgB5xK6ZKYJLZLB9KVTdadaBwUapn60jzhjuWlGq8pqDZlC4d5SE+C3ngOpB
         bDhYTHIn8PlCY40T2TxhIrpzyGi4AyWmMmra8wZpWLcrU1l7CNDUGrYHZdHvrmvlT8w4
         C2KP/SOwmm2bb/RimIr/7mnKO/16KouH8eljL061x33vailEnTLcDXE1mG4LcBvYj18/
         CVlR/3E2d2zi3dVYbJ7PZXIndsDW2/Cbdr0LwyKLyC6+bduWoBzoV+f+PdJQ8VCr4nM1
         rNXncXlWB6Va15jrE1OAA5zKAbLWIb/z6fVBv1IR93ER5mmCw1wGqdDVPowzJOj3ek4Y
         y2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768543893; x=1769148693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSQuOmMnvMPFRPSX6BFyMxcWf9xgMR05MF64h510eQ8=;
        b=s1HwY9vYx0/BuvCf/2o5Ng05dN3746BdfKdiv3v0rgxlPVV2wMhGmMQiC4wNakLHqs
         2Y0ppXadBZ0KZA8lvbdWqkM5R2ULOb3JkyZSdCOhOknlF0RvSN59GpdfrsvTfsPoU3fj
         8KveYcnjM2wGqvfMdeLKvm2GPaA1Ehls2uqwOnvlvXoz7cT93dYKDIV1jvXSksL3gdWA
         ozRDwmOiYsPejps7F6uYkhHeUkCZYUMmZG8ZPOu5M8DtcMn3+0zRNikNqL6xfemiJA8B
         SNIwzOEc7bYOw2x8nZNWNOzVhhOWRwgN7DisQm/sAaLVlaeQw6aWMvUr5TGlAacpY3Dp
         cDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7nZMjp4xKVtQn/eWeiflaICBnpEyT+NQmt9E96Iy70RDJUgC0C0ew0ETdnWM+GJ/nT+5g36KXJX0nSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OoK0I8an+KgZijYtU5TRl8h5kSjOyVYpwMRimYtZsjvAilmI
	3jdZ8BELYPALjBN7/+PVOq++XCMOnmMBTqqRbLdm16++2zCK5ceRqN4V
X-Gm-Gg: AY/fxX6H3cEMa4W2k2/Z3qALWbMz1iqrDQTd6wN92vGPDaAxlfaOo6JSvpXCtSsjT6p
	3NCZRQldkOaGpUbkjrqTBcc+SUMEZC/Y7Cnh6opcF4FTqHZQyg28mIwVZ0HQo2UgavrKqxU/nJ8
	gQqbRT3OWTUmJ59iLAOEhKkIUC+/GRtAKdLtuGwAiL9rg1kBkqFwvquf6ORX5/R8P/WE7xWDLWG
	Ez4LKbQgL1P5Ikm9OpwBisSDMBei+dpVnO0eun1sQcA7rohvu9iZ4JJWv3SV4VnnUIEDJ4hBy06
	6PzmB67fDngIjwuraANPXrfLM89biqRnFzmQB72s93JxX+T2+AEL/A/8sB98JG7Ui63bVI+EpYH
	9GNADLEN2KTx8+5bBuCwy3Mp8pSWrhlSBKduTE9o6Uv8r+mLTWp4DGo9rZ+DiFWdZIw4WrU+SKj
	90aFioN+q7W6lnC3mFDL7fxQ1mzHi7bCLnp6fPS6ofDoyJb1ZmVYWYXIBmCb5b
X-Received: by 2002:a05:7022:6286:b0:11b:9386:a38c with SMTP id a92af1059eb24-1244a7a43e0mr1711534c88.47.1768543893232;
        Thu, 15 Jan 2026 22:11:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10736sm1636478c88.14.2026.01.15.22.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:11:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c5459b90-d157-4393-a5e5-dca76c2decf1@roeck-us.net>
Date: Thu, 15 Jan 2026 22:11:30 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, corbet@lwn.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com, vikash.bansal@nxp.com
References: <20260115111418.1851-1-mayankmahajan.x@nxp.com>
 <20260115111418.1851-2-mayankmahajan.x@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260115111418.1851-2-mayankmahajan.x@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 03:14, Mayank Mahajan wrote:
> Add support for the P3T1035 & P3T2030 temperature sensor. While mostly
> compatible with the TMP108, P3T1035 uses an 8-bit configuration register
> instead of the 16-bit layout used by TMP108. Updated driver to handle
> this difference during configuration read/write.
> 
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>
> ---
> V1 -> V2:
> - Disabled hysteresis in is_visible function for P3T1035.
> - Added tables for conversion rate similar to the LM75 driver.
> - Implemented different bus access depending on the chip being used.
>    - Removed regmap for 8 bits; now we are using one regmap as before.
>    - Added read and write functions for i2c and i3c for use with regmap.
>    - Mapped the 8-bit configuration register to a 16 bit value for P3T1035.
> V2 -> V3:
> - Remove changes not relevant to adding a new device in the driver.
> - Address warnings due to incorrect usage of casting operations.
> - Remove the usage of P3T2030 as it's functionally identical to P3T1035.
> 
>   drivers/hwmon/Kconfig  |   2 +-
>   drivers/hwmon/tmp108.c | 227 +++++++++++++++++++++++++++++++++--------
>   2 files changed, 186 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..31969bddc812 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2398,7 +2398,7 @@ config SENSORS_TMP108
>   	select REGMAP_I3C if I3C
>   	help
>   	  If you say yes here you get support for Texas Instruments TMP108
> -	  sensor chips and NXP P3T1085.
> +	  sensor chips, NXP temperature sensors P3T1035, P3T1085 and P3T2030.
> 
>   	  This driver can also be built as a module. If so, the module
>   	  will be called tmp108.
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index 60a237cbedbc..38a2203c3bd9 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -17,9 +17,16 @@
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
> +#include <linux/util_macros.h>
> 
>   #define	DRIVER_NAME "tmp108"
> 
> +enum tmp108_hw_id {
> +	P3T1035_ID,		/* For sensors p3t1035 and p3t2030 */
> +	P3T1085_ID,
> +	TMP108_ID,
> +};
> +
>   #define	TMP108_REG_TEMP		0x00
>   #define	TMP108_REG_CONF		0x01
>   #define	TMP108_REG_TLOW		0x02
> @@ -61,6 +68,7 @@
>   #define TMP108_CONVRATE_1HZ		TMP108_CONF_CR0		/* Default */
>   #define TMP108_CONVRATE_4HZ		TMP108_CONF_CR1
>   #define TMP108_CONVRATE_16HZ		(TMP108_CONF_CR0|TMP108_CONF_CR1)
> +#define TMP108_CONVRATE_SHIFT		13
> 
>   #define TMP108_CONF_HYSTERESIS_MASK	(TMP108_CONF_HYS0|TMP108_CONF_HYS1)
>   #define TMP108_HYSTERESIS_0C		0x0000
> @@ -71,11 +79,21 @@
>   #define TMP108_CONVERSION_TIME_MS	30	/* in milli-seconds */
> 
>   struct tmp108 {
> -	struct regmap *regmap;
> -	u16 orig_config;
> -	unsigned long ready_time;
> +	struct regmap		*regmap;
> +	u16			orig_config;
> +	unsigned long		ready_time;
> +	enum tmp108_hw_id	hw_id;
> +	bool			config_reg_16bits;
> +	u8			reg_buf[1];
> +	u8			val_buf[3];
> +	unsigned int		sample_times[4];
>   };
> 
> +static const u16 tmp108_sample_set_masks[] = { 3 << TMP108_CONVRATE_SHIFT,
> +					       2 << TMP108_CONVRATE_SHIFT,
> +					       1 << TMP108_CONVRATE_SHIFT,
> +					       0 << TMP108_CONVRATE_SHIFT };
> +

Unnecessary. See below.

>   /* convert 12-bit TMP108 register value to milliCelsius */
>   static inline int tmp108_temp_reg_to_mC(s16 val)
>   {
> @@ -94,6 +112,8 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
>   	struct tmp108 *tmp108 = dev_get_drvdata(dev);
>   	unsigned int regval;
>   	int err, hyst;
> +	u16 conv_rate;
> +	u8 index;
> 
>   	if (type == hwmon_chip) {
>   		if (attr == hwmon_chip_update_interval) {
> @@ -101,21 +121,10 @@ static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
>   					  &regval);
>   			if (err < 0)
>   				return err;
> -			switch (regval & TMP108_CONF_CONVRATE_MASK) {
> -			case TMP108_CONVRATE_0P25HZ:
> -			default:
> -				*temp = 4000;
> -				break;
> -			case TMP108_CONVRATE_1HZ:
> -				*temp = 1000;
> -				break;
> -			case TMP108_CONVRATE_4HZ:
> -				*temp = 250;
> -				break;
> -			case TMP108_CONVRATE_16HZ:
> -				*temp = 63;
> -				break;
> -			}
> +			conv_rate = regval & TMP108_CONF_CONVRATE_MASK;
> +			index = find_closest_descending(conv_rate, tmp108_sample_set_masks,
> +							(int)ARRAY_SIZE(tmp108_sample_set_masks));
> +			*temp = tmp108->sample_times[index];

(regval & TMP108_CONF_CONVRATE_MASK) >> TMP108_CONVRATE_SHIFT, or alternatively
FIELD_GET(TMP108_CONF_CONVRATE_MASK, regval), yields 0..3. With a sample_times
array of { 4000, 1000, 250, 63 } or { 4000, 1000, 250, 125 }, the code above
could simply be
			*temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_MASK, regval)];
which would both be easier to understand and much simpler.

>   			return 0;
>   		}
>   		return -EOPNOTSUPP;
> @@ -192,22 +201,17 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
>   {
>   	struct tmp108 *tmp108 = dev_get_drvdata(dev);
>   	u32 regval, mask;
> +	u8 index;
>   	int err;
> 
>   	if (type == hwmon_chip) {
>   		if (attr == hwmon_chip_update_interval) {
> -			if (temp < 156)
> -				mask = TMP108_CONVRATE_16HZ;
> -			else if (temp < 625)
> -				mask = TMP108_CONVRATE_4HZ;
> -			else if (temp < 2500)
> -				mask = TMP108_CONVRATE_1HZ;
> -			else
> -				mask = TMP108_CONVRATE_0P25HZ;
> +			index = find_closest(temp, tmp108->sample_times,
> +					     (int)ARRAY_SIZE(tmp108->sample_times));

I don't see why the type cast would be needed. Other users of find_closest()
don't need it either.

>   			return regmap_update_bits(tmp108->regmap,
>   						  TMP108_REG_CONF,
>   						  TMP108_CONF_CONVRATE_MASK,
> -						  mask);
> +						  tmp108_sample_set_masks[index]);

Use GENMASK().

>   		}
>   		return -EOPNOTSUPP;
>   	}
> @@ -251,6 +255,8 @@ static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
>   static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
>   				 u32 attr, int channel)
>   {
> +	const struct tmp108 *tmp108 = data;
> +
>   	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
>   		return 0644;
> 
> @@ -264,8 +270,11 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
>   		return 0444;
>   	case hwmon_temp_min:
>   	case hwmon_temp_max:
> +		return 0644;
>   	case hwmon_temp_min_hyst:
>   	case hwmon_temp_max_hyst:
> +		if (tmp108->hw_id == P3T1035_ID)
> +			return 0;
>   		return 0644;
>   	default:
>   		return 0;
> @@ -311,6 +320,105 @@ static bool tmp108_is_volatile_reg(struct device *dev, unsigned int reg)
>   	return reg == TMP108_REG_TEMP || reg == TMP108_REG_CONF;
>   }
> 
> +static int tmp108_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i2c_client *client = context;
> +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		ret = i2c_smbus_read_byte_data(client, TMP108_REG_CONF);
> +	else
> +		ret = i2c_smbus_read_word_swapped(client, reg);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		*val = ret << 8;
> +	else
> +		*val = ret;

This evaluates reg and tmp108->config_reg_16bits twice. Try

	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits) {
		ret = i2c_smbus_read_byte_data(client, TMP108_REG_CONF);
		if (ret < 0)
			return ret;
		*val = ret << 8;
		return 0;
	}
	ret = i2c_smbus_read_word_swapped(client, reg);
	if (ret < 0)
		return ret;
	*val = ret;
	return 0;

instead to reduce runtime overhead.

> +
> +	return 0;
> +}
> +
> +static int tmp108_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i2c_client *client = context;
> +	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		return i2c_smbus_write_byte_data(client, reg, val >> 8);
> +	return i2c_smbus_write_word_swapped(client, reg, val);
> +}
> +
> +static const struct regmap_bus tmp108_i2c_regmap_bus = {
> +	.reg_read = tmp108_i2c_reg_read,
> +	.reg_write = tmp108_i2c_reg_write,
> +};
> +
> +static int tmp108_i3c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i3c_device *i3cdev = context;
> +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> +	struct i3c_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = 1,
> +			.data.out = tmp108->reg_buf,
> +		},
> +		{
> +			.rnw = true,
> +			.len = 2,
> +			.data.in = tmp108->val_buf,

What is the point of having reg_buf and val_buf allocated instead
of just using local variables/arrays ?

> +		},
> +	};
> +	int ret;
> +
> +	tmp108->reg_buf[0] = reg;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		xfers[1].len--;
> +
> +	ret = i3c_device_do_xfers(i3cdev, xfers, 2, I3C_SDR);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = tmp108->val_buf[0] << 8;
> +	if (!(reg == TMP108_REG_CONF && !tmp108->config_reg_16bits))

Please refrain from using double negations.
	if (reg != TMP108_REG_CONF || tmp108->config_reg_16bits)
is much easier to understand.

> +		*val |= tmp108->val_buf[1];
> +
> +	return 0;
> +}
> +
> +static int tmp108_i3c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i3c_device *i3cdev = context;
> +	struct tmp108 *tmp108 = i3cdev_get_drvdata(i3cdev);
> +	struct i3c_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = 3,
> +			.data.out = tmp108->val_buf,
> +		},
> +	};
> +
> +	tmp108->val_buf[0] = reg;
> +	tmp108->val_buf[1] = (val >> 8) & 0xff;
> +
> +	if (reg == TMP108_REG_CONF && !tmp108->config_reg_16bits)
> +		xfers[0].len--;
> +	else
> +		tmp108->val_buf[2] = val & 0xff;
> +
> +	return i3c_device_do_xfers(i3cdev, xfers, 1, I3C_SDR);
> +}
> +
> +static const struct regmap_bus tmp108_i3c_regmap_bus = {
> +	.reg_read = tmp108_i3c_reg_read,
> +	.reg_write = tmp108_i3c_reg_write,
> +};
> +
>   static const struct regmap_config tmp108_regmap_config = {
>   	.reg_bits = 8,
>   	.val_bits = 16,
> @@ -323,7 +431,8 @@ static const struct regmap_config tmp108_regmap_config = {
>   	.use_single_write = true,
>   };
> 
> -static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name)
> +static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
> +			       enum tmp108_hw_id hw_id)
>   {
>   	struct device *hwmon_dev;
>   	struct tmp108 *tmp108;
> @@ -340,6 +449,14 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
> 
>   	dev_set_drvdata(dev, tmp108);
>   	tmp108->regmap = regmap;
> +	tmp108->hw_id = hw_id;
> +	tmp108->config_reg_16bits = (hw_id == P3T1035_ID) ? false : true;
> +	if (hw_id == P3T1035_ID)
> +		memcpy(tmp108->sample_times, (unsigned int[]){ 125, 250, 1000, 4000 },
> +		       sizeof(tmp108->sample_times));
> +	else
> +		memcpy(tmp108->sample_times, (unsigned int[]){ 63, 250, 1000, 4000 },
> +		       sizeof(tmp108->sample_times));

You'd think that the repeated 0-day complaints have an effect.
Just make tmp108->sample_times a pointer and create two ushort arrays where the values
match the index values.

	struct tmp108 {
		ushort *sample_times;
	};

	ushort p3t_1035_sample_times[] = {4000, 1000, 250, 125};
	ushort tmp108_sample_times[] = {4000, 1000, 250, 125};

	if (hw_id == P3T1035_ID)
		tmp108->sample_times = p3t_1035_sample_times;
	else
		tmp108->sample_times = tmp108_sample_times;

Something like
	tmp108->sample_times = (ushort []) {4000, 1000, 250, 125};
might work as well, but I did not test it.
		
The memcpy is really unnecessary here.

> 
>   	err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
>   	if (err < 0) {
> @@ -351,7 +468,6 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
>   	/* Only continuous mode is supported. */
>   	config &= ~TMP108_CONF_MODE_MASK;
>   	config |= TMP108_MODE_CONTINUOUS;
> -
>   	/* Only comparator mode is supported. */
>   	config &= ~TMP108_CONF_TM;
> 
> @@ -384,17 +500,33 @@ static int tmp108_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct regmap *regmap;
> +	enum tmp108_hw_id hw_id;
> +	const void *of_data;
> 
>   	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA))
> +				     I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
>   		return dev_err_probe(dev, -ENODEV,
>   				     "adapter doesn't support SMBus word transactions\n");
> 
> -	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i2c_regmap_bus, client, &tmp108_regmap_config);
>   	if (IS_ERR(regmap))
>   		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
> 
> -	return tmp108_common_probe(dev, regmap, client->name);
> +	/* Prefer OF match data (DT-first systems) */
> +	of_data = device_get_match_data(&client->dev);
> +	if (of_data) {
> +		hw_id = (unsigned long)of_data;
> +	} else {
> +		/* Fall back to legacy I2C ID table */
> +		const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +
> +		if (!id) {
> +			return dev_err_probe(dev, -ENODEV, "No matching device ID for i2c device\n");
> +		}
> +		hw_id = (unsigned long)id->driver_data;
> +	}

That complexity is unnecessary. Just use i2c_get_match_data().

> +
> +	return tmp108_common_probe(dev, regmap, client->name, hw_id);
>   }
> 
>   static int tmp108_suspend(struct device *dev)
> @@ -420,16 +552,18 @@ static int tmp108_resume(struct device *dev)
>   static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume);
> 
>   static const struct i2c_device_id tmp108_i2c_ids[] = {
> -	{ "p3t1085" },
> -	{ "tmp108" },
> -	{ }
> +	{ "p3t1035", P3T1035_ID },
> +	{ "p3t1085", P3T1085_ID },
> +	{ "tmp108", TMP108_ID },
> +	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
> 
>   static const struct of_device_id tmp108_of_ids[] = {
> -	{ .compatible = "nxp,p3t1085", },
> -	{ .compatible = "ti,tmp108", },
> -	{}
> +	{ .compatible = "nxp,p3t1035", .data = (void *)(uintptr_t)P3T1035_ID },
> +	{ .compatible = "nxp,p3t1085", .data = (void *)(uintptr_t)P3T1085_ID },
> +	{ .compatible = "ti,tmp108", .data = (void *)(uintptr_t)TMP108_ID },
> +	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, tmp108_of_ids);
> 
> @@ -444,8 +578,9 @@ static struct i2c_driver tmp108_driver = {
>   };
> 
>   static const struct i3c_device_id p3t1085_i3c_ids[] = {
> -	I3C_DEVICE(0x011b, 0x1529, NULL),
> -	{}
> +	I3C_DEVICE(0x011B, 0x1529, (void *)P3T1085_ID),
> +	I3C_DEVICE(0x011B, 0x152B, (void *)P3T1035_ID),
> +	{ /* sentinel */ },

I know that some people like that comment, and I accept it for new drivers.
I do _not_ accept it being changed in existing drivers.

>   };
>   MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> 
> @@ -453,13 +588,21 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>   {
>   	struct device *dev = i3cdev_to_dev(i3cdev);
>   	struct regmap *regmap;
> +	const struct i3c_device_id *id;
> +	enum tmp108_hw_id hw_id;
> 
> -	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i3c_regmap_bus, i3cdev, &tmp108_regmap_config);
>   	if (IS_ERR(regmap))
>   		return dev_err_probe(dev, PTR_ERR(regmap),
>   				     "Failed to register i3c regmap\n");
> 
> -	return tmp108_common_probe(dev, regmap, "p3t1085_i3c");
> +	id = i3c_device_match_id(i3cdev, p3t1085_i3c_ids);
> +	if (!id) {
> +		return dev_err_probe(dev, -ENODEV, "No matching device ID for i3c device\n");
> +	}

Unnecessary error check since the id already matches or the function would not
have been called.

> +	hw_id = (enum tmp108_hw_id)(uintptr_t)id->data;
> +
> +	return tmp108_common_probe(dev, regmap, "p3t1085_i3c", hw_id);
>   }
> 
>   static struct i3c_driver p3t1085_driver = {
> --
> 2.34.1
> 

