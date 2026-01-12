Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B09D340A43
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254700; cv=none; b=bEGhjeMYot0Zlvwr42DMo1UlxuzMG5WxsWFUYQ28xCqTxpwJqCS6TvVBfGV4tPkMpy/QORpyCCTYLwwZ0MpDT48dVtGIplMfVT8THGS3CERpjlCykXblxWi8HxJH5NQfwCe1HYoK+XW7z4MOzmbPnu2KfAW9iTTvMOTtm1r8HQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254700; c=relaxed/simple;
	bh=uJGSkaBryiEwfJcObh/EX5hbxEIJBywlpx5zXQ1LFyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avM8X63HjdOVLCHvuDaFWBBgn31X6Xauj7GUXrGy7I1ZSHateOCchRmjr10d/uA42vSlNookliWSGAqWtWJgLlPoHz+7DH3fC0uwR+QJa2K85EErQFX8xuNCLqGvfXFxWXp6IVZwAZqzb2UJSL3XJbPdZ8VnRKee7glg6CRpEEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG7tizDs; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG7tizDs"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-121bf277922so8016959c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768254697; x=1768859497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hzjlp69EH4PoMxJM59b5nlCiVtVzp7dqTTMG2qwHpKQ=;
        b=CG7tizDs/jVfCAW39jDwkH0Q64Oybme5Rdz80hVERq+ke7BPUXzW34rgvMAiVAbM4D
         ezJKY9QxWgCYG0QRg44ce+Gr1sDj31fBBWYL/dUVhqHQbfSAFW2X7/0szN3FJh0aPq0O
         TgWVFcF0JxUEHEljt9v1tAzyoa80cUzHTJb2zPB2xmpqoctLmlKUlf1/PkfVxQ51Y309
         KP9QD1ow14ICwTt2h7y20c5hC4rWYFAaIq9of2rPago+TTKX/2uhDS7IZkrZAYDNCBxM
         8U6fWNEdjkz4NBvdI0B9nRqKsi/UmmaPu4XahGcUoCnoNFcGIytFs1ZOHEZFZi7fpx21
         qOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768254697; x=1768859497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzjlp69EH4PoMxJM59b5nlCiVtVzp7dqTTMG2qwHpKQ=;
        b=dB5c2V7NAoBL27muKeQe2SnapEKHkflxJq4zNJvxajA7ipjnbhlAr0ouWhhatgOoU6
         4b6OSOeWO0o0r/KVSg7ht1fVvVIy2x5Zd+AZ+EWAn5H0sKtho4qXrYCj8lV6Xge+V3qr
         JDC+Uyp5SacbohXdMABZ/+xaRq/SgGBUNeby09LuP/ifmVMMUHUUq1J2g+x4Me58lxnp
         UFePuOtNZPytWv3gusCMuGSbFkenibToZSJIvDO0DZSEHkrhWoGsintCf/4o7MwVb7JD
         eyFs1IwtLtApXXyX/3KVoDZIlY+8gFUk4ceCdqNlC9sHvN5FDEODzq3EFlcEUPQ0B4fT
         hRGA==
X-Gm-Message-State: AOJu0Yx1gcCAuYWB1iWoABFU6OINglNxSuztMi7O/r2/2ZUrrtf4Sh7L
	XPlirK5MELOQCQ+dzGmQq/zLxyEOD/5OUXj+P0Ye5gcuMSK86gEW9r7b
X-Gm-Gg: AY/fxX46ILNLCgbAaam57wZhX+HMTUMRooITqWa54/R8eNQMTN+iT4dxuy3gex1L+Yw
	cNKUPXLw+WvsnhrxKMlmicRsxyhhjjk5+5JMEJXdCIPvP7nJ2WXegM39yprNsRlixZS6S2HRGtV
	6SsgH3CFfTEOnhRWDJ5V41UnX1nuaIKgUubtpPIZtfNjOkGkAFLPND3l/BXg39kTMZuAMi30Lh5
	P3EQzKzxnqK9RpvrrxLW6cjysKOf2iKAbLBejuihg0fLVpEu0ujuuWYuhMK1praX7zxPVZKY7PA
	6dVPv+RTt3RkADrtx05ZX/BHeF3n/rLYfaSzCDwwjFdy2AIbIxm4QZt1xB+jCVQ4sTmpcDvSBGo
	mlPYdIBiFszGwTXOyy/9+2yGmV3RJzlIIBQo9nvaYvmg8EOS7GdkYYHehWFmDMsbh9WrA7XXZ4K
	fO3rguZDEjkOOctw0AJQh4NR7mwLyJBnvem+Y6w9UnZpsqfiDFPZKqNKjNLRpN4dkDIo/vP7M=
X-Google-Smtp-Source: AGHT+IGT9H7ZxYmUaXhwguC1AN5LDGunxgvlyzpVpSLg0P6bV37rWxCw3QaKjKJNoBn4qg5tubppyQ==
X-Received: by 2002:a05:7022:6723:b0:11b:9386:8267 with SMTP id a92af1059eb24-121f8b9bef5mr15449088c88.44.1768254696645;
        Mon, 12 Jan 2026 13:51:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248bb6esm25438522c88.12.2026.01.12.13.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 13:51:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net>
Date: Mon, 12 Jan 2026 13:51:34 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/7/26 06:45, ASHISH YADAV wrote:
> Add the pmbus driver for the Infineon TDA38740A/TDA38725A
> DC-DC voltage regulator.
> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> ---
> Changes in v2:
>   - Review comments address.

That is not a change log.

>   - Another Patch for Devicetree binding submitted for Driver
>     Documentation.
> ---
>   drivers/hwmon/pmbus/Kconfig     |  16 +++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/tda38740a.c | 203 ++++++++++++++++++++++++++++++++

Documentation is missing.

>   3 files changed, 220 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..e7d7ff1b57df 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -602,6 +602,22 @@ config SENSORS_TDA38640_REGULATOR
>   	  If you say yes here you get regulator support for Infineon
>   	  TDA38640 as regulator.
>   
> +config SENSORS_TDA38740A
> +	tristate "Infineon TDA38740A"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  TDA38740A/25A.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tda38740a.
> +
> +config SENSORS_TDA38740A_REGULATOR
> +	bool "Regulator support for TDA38740A and compatibles"
> +	depends on SENSORS_TDA38740A && REGULATOR
> +	help
> +	  If you say yes here you get regulator support for Infineon
> +	  TDA38740A/25A as regulator.
> +
>   config SENSORS_TPS25990
>   	tristate "TI TPS25990"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..f422c80cf3d8 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>   obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
>   obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>   obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TDA38740A)  += tda38740a.o
>   obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>   obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/tda38740a.c b/drivers/hwmon/pmbus/tda38740a.c
> new file mode 100644
> index 000000000000..b31e1b5c6916
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740a.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/**
> + * Hardware monitoring driver for Infineon Integrated-pol-voltage-regulators
> + * Driver for TDA38725A and TDA38740A
> + *
> + * Copyright (c) 2025 Infineon Technologies
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regulator/driver.h>
> +#include "pmbus.h"
> +
> +#define TDA38725A_IC_DEVICE_ID "\xA9"
> +#define TDA38740A_IC_DEVICE_ID "\xA8"
> +
> +static const struct i2c_device_id tda38740a_id[];
> +
> +enum chips { tda38725a, tda38740a };
> +
> +struct tda38740a_data {
> +	enum chips id;
> +	struct pmbus_driver_info info;
> +	u32 vout_voltage_multiplier[2];
> +};
> +
> +#define to_tda38740a_data(x) container_of(x, struct tda38740a_data, info)
> +
> +static const struct regulator_desc __maybe_unused tda38740a_reg_desc[] = {
> +	PMBUS_REGULATOR("vout", 0),
> +};
> +
> +static int tda38740a_read_word_data(struct i2c_client *client, int page,
> +				    int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct tda38740a_data *data = to_tda38740a_data(info);
> +	int ret;
> +
> +	/* Virtual PMBUS Command not supported */
> +	if (reg >= PMBUS_VIRT_BASE)
> +		return -ENXIO;
> +

Why is this needed (instead of just returning -ENODATA) ?

> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		ret = ((ret * data->vout_voltage_multiplier[0]) /
> +		       data->vout_voltage_multiplier[1]);

The need for this, especially why it would only be needed for PMBUS_READ_VOUT
but not for any other VOUT related commands, is still insufficiently explained
(and I failed to understand the rationale provided earlier).

> +		break;
> +	case PMBUS_VOUT_COMMAND:
> +	case PMBUS_VOUT_MAX:
> +	case PMBUS_VOUT_MARGIN_HIGH:
> +	case PMBUS_VOUT_MARGIN_LOW:
> +	case PMBUS_VOUT_TRANSITION_RATE:
> +	case PMBUS_VOUT_DROOP:
> +	case PMBUS_VOUT_SCALE_LOOP:
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_STATUS_WORD:
> +	case PMBUS_READ_VIN:
> +	case PMBUS_READ_IIN:
> +	case PMBUS_READ_IOUT:
> +	case PMBUS_READ_TEMPERATURE_1:
> +	case PMBUS_READ_POUT:
> +	case PMBUS_READ_PIN:
> +		ret = pmbus_read_word_data(client, page, phase, reg);

I fail to see why this would be necessary. Just return -ENODATA.

> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info tda38740a_info[] = {
> +	[tda38740a] = {
> +		.pages = 1,
> +		.read_word_data = tda38740a_read_word_data,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +		.format[PSC_CURRENT_IN] = linear,
> +		.format[PSC_POWER] = linear,
> +		.format[PSC_TEMPERATURE] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +			| PMBUS_HAVE_IIN
> +			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +			| PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
> +		.num_regulators = 1,
> +		.reg_desc = tda38740a_reg_desc,
> +#endif
> +	},
> +};
> +
> +static int tda38740a_get_device_id(struct i2c_client *client)
> +{
> +	u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
> +	enum chips id;
> +	int status;
> +
> +	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
> +					   device_id);
> +	if (status < 0 || status > 1) {
> +		dev_err(&client->dev,
> +			"Failed to read Device ID or unexpected/unsupported Device\n");

How about printing the device ID here if it is unsupported ?
It could be printed as hex string.

> +		return -ENODEV;
> +	}
> +
> +	if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, 1)) {
> +		id = tda38725a;
> +	} else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id, 1)) {
> +		id = tda38740a;
> +	} else {
> +		dev_err(&client->dev, "Unsupported device with ID:%s\n",
> +			device_id);

device_id is not terminated, and it is not a user readable string.
It should be printed as hex string, or as hex byte (0xXX).

> +		return -ENODEV;
> +	}
> +
> +	return id;
> +}
> +
> +static int tda38740a_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct tda38740a_data *data;
> +	int chip_id;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE |
> +					     I2C_FUNC_SMBUS_BYTE_DATA |
> +					     I2C_FUNC_SMBUS_WORD_DATA |
> +					     I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	chip_id = tda38740a_get_device_id(client);
> +	if (chip_id < 0)
> +		return chip_id;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->id = chip_id;
> +	memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info));
> +
> +	if (!of_property_read_u32_array(client->dev.of_node, "infineon,vout-voltage-multiplier",
> +					data->vout_voltage_multiplier,
> +		    ARRAY_SIZE(data->vout_voltage_multiplier))) {
> +		dev_info(&client->dev,
> +			 "vout-voltage-multiplier from Device Tree:%d %d\n",
> +			 data->vout_voltage_multiplier[0],
> +			 data->vout_voltage_multiplier[1]);
> +	} else {
> +		dev_info(&client->dev,
> +			 "vout-voltage-multiplier not available from Device Tree,using default values");
> +		data->vout_voltage_multiplier[0] = 0x01;
> +		data->vout_voltage_multiplier[1] = 0x01;
> +	}
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740a_id[] = { { "tda38725a", tda38725a },
> +						     { "tda38740a", tda38740a },
> +						     {} };
> +
> +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> +
> +static const struct of_device_id __maybe_unused tda38740a_of_match[] = {
> +	{ .compatible = "infineon,tda38725a", .data = (void *)tda38725a },
> +	{ .compatible = "infineon,tda38740a", .data = (void *)tda38740a },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> +
> +static struct i2c_driver tda38740a_driver = {
> +	.driver = {
> +		.name = "tda38740a",
> +		.of_match_table = of_match_ptr(tda38740a_of_match),
> +	},
> +	.probe = tda38740a_probe,
> +	.id_table = tda38740a_id,
> +};
> +
> +module_i2c_driver(tda38740a_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725A/40A IPOL");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

