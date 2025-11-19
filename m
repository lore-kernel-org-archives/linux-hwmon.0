Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0530DD1F
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574416; cv=none; b=fLfcN7aIwF00xNmVkSttJ5gl81flo5rizDkj686D95IqheM7QOeMh9RYTSi4MQCvSfMoPMNEdwXBLlZ/KjsH/bZkctQQtws//DO7nIHeiOOFylMDlVOnKfN2RFN/z6mAoccsK2Rl28vFEx4kvXktLVwBGiFOwgTQONX9xVVD3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574416; c=relaxed/simple;
	bh=fNuZlUj2O/qjpoDV3Pgvk8VC1O+mrOrkXQUSNWy2nf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqKeliYqA1qxconaHS8nFgXGf6j4SXcKEwcoW7zD4nJSfyq+WtyYYEe5RUhbayAS4b2xL1uDuwGk6I6tQXFCaeLMjf1Y/2PITWtu1lRmNWkWHnyL7/FTziiw48OkuaCuvyxqGZ/69FIO3nLUDTMNIVRmQ583jz/IbTaQ9so2Ejg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdhhT2Lx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdhhT2Lx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2953e415b27so74960275ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763574412; x=1764179212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PkUqEFBtgzhSecZhSXv63CSYvkqHr1Y1S0aOXMcwGRU=;
        b=UdhhT2Lx8sEQtIvqbsxW+YwOukJNHEaj/hpgqYLn09A+sXp1uoqM/rOuc5M4vVxmEC
         dVdjPFkqaS7dWe+V45jxQ3DoYPTS4Cj9Py/6ImYD7iiUl+0iakFqtGg0aRV91b95Nea5
         xTh1WQwN/+fm6r1bPIo5Ti/L8AjFnbGXSmHYbu93UiRyHlx1xG7obcgvs+THouMI3qle
         kb/XylQslSLNGRS4YZqeyB31evk6Pqxg1Jh1bJEa1yBsPWPAgKYOcpSzKFWJlrM9PZ8m
         I10IxQyw2MFZy6JjXL3LWbVf0e2Z1l/JpR3SBWJRTdX2s9NEicUui1hR70nA5SbNuHIU
         uVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763574412; x=1764179212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkUqEFBtgzhSecZhSXv63CSYvkqHr1Y1S0aOXMcwGRU=;
        b=tJxRtq5YqznCPR4VLOC7qSqtfywG25Ct97PQGR5BiiYyzV7/q2glYZbiqAz87w67He
         Aolz5YzQxgpgOqsrpFnKounqXoVEMGiMby6fs+I3/igYm/CdPrGppI6oEcvP7Czd4n/S
         aVSNLPKCKwu+rXcImmDhe2S2/uuV6F8jDrcZoXJJq+Iak24w+CbLHpaHVBOdkpqtuUBf
         GqczCkKFQphpgNHGccGYCTzb7X3tJDlC08m7U/MDMXFASlmUOrRut+voIyznKWbbgvT6
         wgUIL9+Y1/A2wk+d5oGGRS+xIx250paksarteQYYUPmZb3aLeT8/6Yju3VoJonMOOsKq
         r9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTRz8Ph3VMoJRTEXF0Oku1SdkrkKDDp6iSdZnhyYJm2oXzqefO+POjFxvfI+OTRQ6LxaOHUDjSfxAAQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyljJiH9z6ap60Gh8TlLrX5GVon1P4/CUc5AYalPaSkTKauf5v8
	JLG9U6DcTL2GnLvvl7HUu4o72/uWHvhhEZt9DoeAMX9kJjOpWxZlxXg2C4KFiA==
X-Gm-Gg: ASbGncs/ich+kKpwRhcD8p5FwoVbTuhQsWuXj/Bstu714Et1gDuRrJ+wEgOd26+JSOF
	0xvQHi3DaCd9IpEo7UjVyaYo4qsQGcF1xgC9QMUxFFLKQx7rntpjDjH/djGZrSAfIka01AIlZZ4
	fNdRTMM4hFZVWE+2YcfUvDp176B9D6aUuqx4ZzSImpz0Btu/RM2F9AMLXATwrfKGvky4C/QkIYn
	CceZLre4Wt8QkB9Gyfum+9d91kqIWS41ZPi001Y6CvIwU/bUIk01iQnnFwEYZ7/6bdRRLAr4onO
	PC5fyudI+gm5XTFaBOJTFpUCjoE0eS1AeQJzKEMWnx9nlO08UskMKAG7LXGK0MbLWadqq5Zp53H
	yV0wOM4lv2zw50h5FHFElJvMHrd1qX5DaR5f5ZEhiWEZuyjY/FLaQorLWfsvqgD9szwnN4u+8L2
	dILIUwDU0aBoU2lniDUfTAaSb/s3ruDnJLgr0a1IS7tf4SZTRlPSp1/1cVUJo=
X-Google-Smtp-Source: AGHT+IEBv0YfY+knOKuFg5/19f92w29B7Kiiud7KCp248ZlygU5PCG+sWZt3o7f5+bmgChnIYNxhiA==
X-Received: by 2002:a17:903:19c3:b0:295:ed0:f7bf with SMTP id d9443c01a7336-29b5b13e81fmr2508915ad.58.1763574412075;
        Wed, 19 Nov 2025 09:46:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm1000155ad.27.2025.11.19.09.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:46:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8372c65d-1202-4753-9002-3a0171943051@roeck-us.net>
Date: Wed, 19 Nov 2025 09:46:49 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: Add driver for wsen tids
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Thomas Marangoni <Thomas.Marangoni@becom-group.com>,
 linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 Jonathan.Cameron@huawei.com, michal.simek@amd.com, nuno.sa@analog.com,
 Frank.Li@nxp.com, wenswang@yeah.net, apokusinski01@gmail.com,
 dixitparmar19@gmail.com, vassilisamir@gmail.com, paweldembicki@gmail.com,
 heiko@sntech.de, neil.armstrong@linaro.org, kever.yang@rock-chips.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, mani@kernel.org, dev@kael-k.io,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
 <20251119125145.2402620-4-Thomas.Marangoni@becom-group.com>
 <5758dedd1a0d97ddc522448502ae07b0ede4ea67.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5758dedd1a0d97ddc522448502ae07b0ede4ea67.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/25 07:05, Nuno Sá wrote:
> Hi Thomas,
> 
> I'm a bit surprised why you have me on Cc. Since I'm here, let me give some inputs...
> 

Excellent feedback though. Some more comments inline.

> On Wed, 2025-11-19 at 13:51 +0100, Thomas Marangoni wrote:
>> Add support for the wsen tids. It is a low cost
>> and small-form-factor i2c temperature sensor.
>>
>> It supports the following features:
>> - Continuous temperature reading in four intervals: 5 ms, 10 ms,
>>    20 ms and 40 ms.
>> - Low temperature alarm
>> - High temperature alarm
>>
>> The driver supports following hwmon features:
>> - hwmon_temp_input
>> - hwmon_temp_min_alarm
>> - hwmon_temp_max_alarm
>> - hwmon_temp_min
>> - hwmon_temp_max
>> - hwmon_chip_update_interval
>>
>> Additional notes:
>> - The update interval only supports four fixed values.
>> - The alarm is reset on reading.
>>
>> Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
>> ---
>>   drivers/hwmon/Kconfig  |  10 +
>>   drivers/hwmon/Makefile |   1 +
>>   drivers/hwmon/tids.c   | 447 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 458 insertions(+)
>>   create mode 100644 drivers/hwmon/tids.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 157678b821fc..2737350bb661 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -2368,6 +2368,16 @@ config SENSORS_THMC50
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called thmc50.
>>   
>> +config SENSORS_TIDS
>> +	tristate "TIDS"
>> +	depends on I2C
>> +	help
>> +	  If you say yes here you get support for the temperature
>> +	  sensor WSEN TIDS from Würth Elektronik.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called tids.
>> +
>>   config SENSORS_TMP102
>>   	tristate "Texas Instruments TMP102"
>>   	depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index eade8e3b1bde..4eb77be3df67 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -227,6 +227,7 @@ obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
>>   obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>>   obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
>>   obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
>> +obj-$(CONFIG_SENSORS_TIDS)		+= tids.o
>>   obj-$(CONFIG_SENSORS_TMP102)	+= tmp102.o
>>   obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
>>   obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
>> diff --git a/drivers/hwmon/tids.c b/drivers/hwmon/tids.c
>> new file mode 100644
>> index 000000000000..62e778202a5f
>> --- /dev/null
>> +++ b/drivers/hwmon/tids.c
>> @@ -0,0 +1,447 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * Copyright (c) BECOM Electronics GmbH
>> + *
>> + * wsen_tids.c - Linux hwmon driver for WSEN-TIDS Temperature sensor
>> + *
>> + * Author: Thomas Marangoni <thomas.marangoni@becom-group.com>
>> + */
>> +
>> +#include <linux/util_macros.h>
>> +#include <linux/regmap.h>
>> +#include <linux/minmax.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/bits.h>
>> +#include <linux/math.h>
>> +#include <linux/i2c.h>

Alphabetic order please.

>> +
>> +/*
>> + * TIDS registers
>> + */
>> +#define TIDS_REG_DEVICE_ID	0x01
>> +#define TIDS_REG_T_H_LIMIT	0x02
>> +#define TIDS_REG_T_L_LIMIT	0x03
>> +#define TIDS_REG_CTRL		0x04
>> +#define TIDS_REG_STATUS		0x05
>> +#define TIDS_REG_DATA_T_L	0x06
>> +#define TIDS_REG_DATA_T_H	0x07
>> +#define TIDS_REG_SOFT_REST	0x0C
>> +
>> +#define TIDS_CTRL_ONE_SHOT_MASK		BIT(0)
>> +#define TIDS_CTRL_FREERUN_MASK		BIT(2)
>> +#define TIDS_CTRL_IF_ADD_INC_MASK	BIT(3)
>> +#define TIDS_CTRL_AVG_MASK		GENMASK(5, 4)
>> +#define TIDS_CTRL_AVG_SHIFT		4
>> +#define TIDS_CTRL_BDU_MASK		BIT(6)
>> +
>> +#define TIDS_STATUS_BUSY_MASK		BIT(0)
>> +#define TIDS_STATUS_OVER_THL_MASK	BIT(1)
>> +#define TIDS_STATUS_UNDER_TLL_MASK	BIT(2)
>> +
>> +#define TIDS_SOFT_REST_MASK		BIT(1)
>> +
>> +/*
>> + * TIDS device IDs
>> + */
>> +#define TIDS_ID 0xa0
>> +
>> +struct tids_data {
>> +	struct i2c_client *client;
>> +
Unused

>> +	struct regmap *regmap;
>> +
>> +	int irq;

Unused

>> +	int temperature;

Unused

>> +};
>> +
>> +static u8 update_intervals[] = { 40, 20, 10, 5 };
> 
> static const?
> 
>> +
>> +static ssize_t tids_interval_read(struct device *dev, long *val)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +	unsigned int avg_value = 0;

Unnecessary initialization.

>> +	int ret;
>> +
>> +	ret = regmap_read(data->regmap, TIDS_REG_CTRL, &avg_value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	avg_value = (avg_value & TIDS_CTRL_AVG_MASK) >> TIDS_CTRL_AVG_SHIFT;
>> +
>> +	*val = update_intervals[avg_value];
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t tids_interval_write(struct device *dev, long val)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +	unsigned int avg_value;
>> +
>> +	avg_value = find_closest_descending(val, update_intervals,
>> +					    ARRAY_SIZE(update_intervals));
>> +
>> +	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
>> +				 TIDS_CTRL_AVG_MASK,
>> +				 avg_value << TIDS_CTRL_AVG_SHIFT);
>> +}
>> +
>> +static int tids_temperature1_read(struct device *dev, long *val)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +	u8 buf[2] = { 0 };
> 
> Seems like __le16?

Also, the initialization is unnecessary.

>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(data->regmap, TIDS_REG_DATA_T_L, buf, 2);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* temperature in °mC */
>> +	*val = (((s16)(buf[1] << 8) | buf[0])) * 10;
> 
> Then __le16_to_cpu()?
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t tids_temperature_alarm_read(struct device *dev, u32 attr,
>> +					   long *val)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (attr == hwmon_temp_min_alarm)
>> +		ret = regmap_test_bits(data->regmap, TIDS_REG_STATUS,
>> +				       TIDS_STATUS_UNDER_TLL_MASK);
>> +	else if (attr == hwmon_temp_max_alarm)
>> +		ret = regmap_test_bits(data->regmap, TIDS_REG_STATUS,
>> +				       TIDS_STATUS_OVER_THL_MASK);
> 
> Instead of passing attr and have this if() else why not passing the proper mask? Then
> just regmap_read(regmag, reg, ...)?
> 
>> +	else
>> +		return -EOPNOTSUPP;
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*val = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tids_temperature_minmax_read(struct device *dev, u32 attr, long *val)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +	unsigned int reg_data = 0;

Unnecessary initialization.

>> +	int ret;
>> +
>> +	if (attr == hwmon_temp_min)
>> +		ret = regmap_read(data->regmap, TIDS_REG_T_L_LIMIT, &reg_data);
>> +	else if (attr == hwmon_temp_max)
>> +		ret = regmap_read(data->regmap, TIDS_REG_T_H_LIMIT, &reg_data);
>> +	else
>> +		return -EOPNOTSUPP;
> 
> Same as above but with the proper register
> 
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* temperature from register conversion in °mC */
>> +	*val = (((u8)reg_data - 63) * 640);
> 
> Why the cast?
> 
It is actually worse than that: The compiler will take the expression
as unsigned and won't sign extend to negative values. So a register value of,
say, 62 will be reported as 255 degrees C. The cast needs to be to int for
this to work.

>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t tids_temperature_minmax_write(struct device *dev, u32 attr,
>> +					     long val)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +	u8 reg_data;
>> +
>> +	/* temperature in °mC */
>> +	val = clamp_val(val, -39680, 122880);
>> +	/* temperature to register conversion in °mC */
>> +	reg_data = (u8)(DIV_ROUND_CLOSEST(val, 640) + 63);
>> +
>> +	if (attr == hwmon_temp_min)
>> +		return regmap_write(data->regmap, TIDS_REG_T_L_LIMIT, reg_data);
>> +	else if (attr == hwmon_temp_max)
>> +		return regmap_write(data->regmap, TIDS_REG_T_H_LIMIT, reg_data);
>> +	else
>> +		return -EOPNOTSUPP;
> 
> Redundant else if () and else
> 

Also, as elsewhere, better to pass the register as argument.

> ...
> 
>>
>> +
>> +static int tids_init(struct tids_data *data)
>> +{
>> +	int ret;
>> +
>> +	/* Triggering soft reset */
>> +	ret = regmap_write_bits(data->regmap, TIDS_REG_SOFT_REST,
>> +				TIDS_SOFT_REST_MASK, TIDS_SOFT_REST_MASK);
>> +	if (ret < 0)
>> +		return ret;
>> +
> 
> No need for sleep some time? Typically that's defined on the datasheet.
> 
It doesn't say.

>> +	ret = regmap_clear_bits(data->regmap, TIDS_REG_SOFT_REST,
>> +				TIDS_SOFT_REST_MASK);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Allowing bulk read */
>> +	ret = regmap_write_bits(data->regmap, TIDS_REG_CTRL,
>> +				TIDS_CTRL_IF_ADD_INC_MASK,
>> +				TIDS_CTRL_IF_ADD_INC_MASK);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Set meassurement interval */

measurement

>> +	ret = regmap_clear_bits(data->regmap, TIDS_REG_CTRL,
>> +				TIDS_CTRL_AVG_MASK);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Set device to free run mode */
>> +	ret = regmap_write_bits(data->regmap, TIDS_REG_CTRL,
>> +				TIDS_CTRL_FREERUN_MASK, TIDS_CTRL_FREERUN_MASK);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Don't update temperature register until high and low value are read */
>> +	ret = regmap_write_bits(data->regmap, TIDS_REG_CTRL, TIDS_CTRL_BDU_MASK,
>> +				TIDS_CTRL_BDU_MASK);
> 
> return regmap_write_bits();
> 
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tids_probe(struct i2c_client *client)
>> +{
>> +	struct device *device = &client->dev;
>> +	struct device *hwmon_dev;
>> +	struct tids_data *data;
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->client = client;
>> +
>> +	/* Init regmap */
> 
> The comment does not add any added value.
> 
>> +	data->regmap = devm_regmap_init_i2c(data->client, &regmap_config);
>> +	if (IS_ERR(data->regmap))
>> +		return dev_err_probe(device, PTR_ERR(data->regmap),
>> +				     "regmap initialization failed\n");
>> +
>> +	/* Read device id, to check if i2c is working */
> 
> Same
> 
>> +	ret = regmap_read(data->regmap, TIDS_REG_DEVICE_ID, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (value != TIDS_ID)
>> +		return -ENODEV;
>> +
>> +	tids_init(data);
> 
> Check for the return value.
> 
>> +
>> +	hwmon_dev = devm_hwmon_device_register_with_info(device, "tids", data,
>> +							 &tids_chip_info, NULL);
>> +
>> +	return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static int tids_suspend(struct device *dev)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +	return regmap_clear_bits(data->regmap, TIDS_REG_CTRL,
>> +				 TIDS_CTRL_FREERUN_MASK);
>> +}
>> +
>> +static int tids_resume(struct device *dev)
>> +{
>> +	struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +	return regmap_write_bits(data->regmap, TIDS_REG_CTRL,
>> +				 TIDS_CTRL_FREERUN_MASK,
>> +				 TIDS_CTRL_FREERUN_MASK);

Is this sufficient ? Does the chip possible require an init sequence
and updating the limit values ?

Check drivers/hwmon/jc42.c which saves and restores the configuration using
regmap API functions. Maybe something similar that would be useful here
as well.

>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(tids_dev_pm_ops, tids_resume, tids_suspend);
>> +
>> +static const struct i2c_device_id tids_id[] = {
>> +	{ "tids", 0 },
> 
> No need for 0
> 
>> +	{},
> 
> The above is already a terminator so you can drop the comma
> 
> - Nuno Sá
> 

