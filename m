Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBC2C3259
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396690; cv=none; b=ZSGlhoawkd6K66wSnZgbPNg/Vz2uybnggEPQZLTX0MoPHMkeXXvl/de0c4vuBs02Pf+j8xurw1VvCFRe1eCZNr49kUyPq5qSQYR3pgf9LuRcdmL4duH3f15DUKpJh4pxAczHezMxcuVkEEqptchWBP1E4lZm7uNAhqZcbzy4feU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396690; c=relaxed/simple;
	bh=j1NtNnwpVS/q9dNzBdOhDm6Gxs/NWAjE+l7LKHs9768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HlC7SyenuZJOFY0sB+57m7aj9aJk/O4gt1LRFHfVALD/xNhdImRbwyRj1uGhXkq6nzGaRnxP5XH5Twn67dI1eXd9aDUAOk1hArzxTRBAax3HK7tR3kh3lN/77EfadC8A+rASfeE5S+DSE9AT8nywpispr+YiVHBQRN7Q03jtxdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRNJ/zvK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRNJ/zvK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso4504908b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 08:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763396687; x=1764001487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tVZzQN53aCeKux09wlbSkuOTj+sacZw/sU/G+Vwp6gQ=;
        b=lRNJ/zvKdwajPT13ASiQkOizmjFsXBaKtxviCBDWCLj2lH4cexKicoJtSoUw4YeTlQ
         3fTZPvX9JTSbYSZgDxfBdywjt2d0d7maTb4HpIEOii9rZQqTc+a4pPfnKVojvNwl0XAx
         nGAzoZFoaVNz/vHSnRMnqqIDUTna3hoL8qUn30AYZGkQAWAYEi/Lsk+X0PS51Svsyf/q
         CZw8k8pdGGEmzbBZpWARkqSstnaUScjyCPvJjfRRt1yQEw0gvXR1XYARPMZyI+eD+g46
         jU9/vEvpfDOPc9pyDPr+ilJpYg2ImaXhM5c5K/Pgaf4uV+8C1YFruFc5KCW537iXeYRD
         h4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396687; x=1764001487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVZzQN53aCeKux09wlbSkuOTj+sacZw/sU/G+Vwp6gQ=;
        b=cnzusPx8nHki6gi2iPNYYGAQQp80Fx0NBMabrY38JM52ch1QCs91RuVEBAW5j7BvqU
         2USLzIt6JVlzsl+iyuPeCZ+KPRwd1Yi3rcwWDYpvnXet66ga4G5I8Ca9rWeDA/SJ/oy9
         wRWKjcZtbooirQ6+zzunGV+Ru+SR571NTZAo4wKMDmLJfJf3JwPsxRvgxZzHTkUE6IEA
         KuxWLmaESl09vBOGxM85TEmJmn46Wam2yaXOTQrzGElRcb4r0phbqSljIPZO+14W4xXS
         foSmpnvIVrFHkQOrPhM8/Y3ifF+CxLzrDvATzK9ZvzKYeXObYFE8iJJQkiUDV/7GuLZw
         4ZYg==
X-Forwarded-Encrypted: i=1; AJvYcCVLQh/Y7l9RRYMqUxDtk/DbQrx3KQvbMwM3AXT8RGORVfCYVZ9pfmV+s2PSi1hapuzBNNk7BMCzX/BSRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6dWLCtIRb7R36wrxsk7py4UKjUh5hfomRgtG5tM+cySY99+r
	fM3zK3fyb6ODWvns1GKLbQvxNDGdPGwtlhDmsEfu6SxfehpOhyDm1+yg
X-Gm-Gg: ASbGncsyxdT29JqIZ8lg0D4BNWf0942pLBwwVDd9zab6Eqpg95n5w6pLpMWz7mZc3sA
	9lF4xPW5h6vjoebi7LnCitlImUxWQ1/kaxLl45rQ8JRjaE4+5AkI1vdcSFESNiurl+X5TvCSlHE
	0CS4zWVrHOI0/hFY9G48uEXHfGT98OCJ1zQCIWsGqHdkZK4CraPv443Pb4mN8rCUeveiBJ7rPZp
	2fPtW0c6KbpGKK2zy9yJPUNz24wqp5ILtuT9SDgI3wVZWHc0VQESQuQ4yy6Ng252Hdqrp72CpY7
	K+HkYq+XC9ckXRrk2kTiJrzkbRmdS2aW5WI6Gv3aKQ7ouJL0MCOEPDQgMah05tttQis72p3wGAn
	7/sIV7aZH5UAvFDDzsmVDAPqX4o7/AnNt3S9Jdd5CUb13TyiJs+SHdq1/NNFm9NHoFEe7N8N+8F
	BZ5+33nG9DFdzU5r5iAnx4LTFR1ixUa3xlObZBV06bsdKDZdysoQx+34HATUqwzZf4cmMbTg==
X-Google-Smtp-Source: AGHT+IGzhUke4tR9hxJdcZPABaBDnitgzpljAF27CD7HgBXH4Y73D4udkEDzpPk41/gnM4znAiIqbg==
X-Received: by 2002:a05:6a20:700a:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-35db5a1a9a2mr6206844637.26.1763396686909;
        Mon, 17 Nov 2025 08:24:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e713sm13425960b3a.54.2025.11.17.08.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 08:24:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77cc198c-10a4-4b10-a420-88a30f9e5282@roeck-us.net>
Date: Mon, 17 Nov 2025 08:24:43 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hwmon: Add driver for wsen tids-2521020222501
To: Thomas Marangoni <Thomas.Marangoni@becom-group.com>,
 linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 Jonathan.Cameron@huawei.com, Frank.Li@nxp.com, michal.simek@amd.com,
 rodrigo.gobbi.7@gmail.com, chou.cosmo@gmail.com, wenswang@yeah.net,
 nuno.sa@analog.com, paweldembicki@gmail.com, apokusinski01@gmail.com,
 eajames@linux.ibm.com, vassilisamir@gmail.com, heiko@sntech.de,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 kever.yang@rock-chips.com, mani@kernel.org, dev@kael-k.io,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
 <20251117123809.47488-2-Thomas.Marangoni@becom-group.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251117123809.47488-2-Thomas.Marangoni@becom-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 04:38, Thomas Marangoni wrote:
> This commit adds support for the wsen tids-2521020222501. It is a

What is the relevance of "-2521020222501" ? As far as I can see it is just
the order code, and the sensor is just "WSEN-TIDS", as suggested by the
documentation. I would sugest to drop the number unless it has some actual
relevance - and, if it does, provide a rationale for it that is better than
"this is the oder code". The order code can change anytime, after all.

> low cost and small-form-factor i2c temperature sensor.
> 
> It supports the following features:
> - Continuous temperature reading in four intervals: 5 ms, 10 ms,
>    20 ms and 40 ms.
> - Low temperature alarm
> - High temperature alarm
> 
> The driver supports following hwmon features:
> - hwmon_temp_input
> - hwmon_temp_min_alarm
> - hwmon_temp_max_alarm
> - hwmon_temp_min_hyst
> - hwmon_temp_max_hyst
> - hwmon_chip_update_interval
> 
> Additional notes:
> - The update interval only supports four fixed values.
> - The alarm is reset on reading.
> ---

If available, please send me a register dump so I can implement unit test code.


>   drivers/hwmon/Kconfig  |  10 +
>   drivers/hwmon/Makefile |   1 +
>   drivers/hwmon/tids.c   | 560 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 571 insertions(+)
>   create mode 100644 drivers/hwmon/tids.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8c852bcac26f..5e578241001f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2647,6 +2647,16 @@ config SENSORS_WM8350
>   	  This driver can also be built as a module. If so, the module
>   	  will be called wm8350-hwmon.
>   
> +config SENSORS_TIDS
> +	tristate "TIDS"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the temperature
> +	  sensor WSEN TIDS from Würth Elektronik.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called tids.
> +
>   config SENSORS_ULTRA45
>   	tristate "Sun Ultra45 PIC16F747"
>   	depends on SPARC64
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index a8de5bc69f2a..def052b2bdfa 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -244,6 +244,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)	+= w83l785ts.o
>   obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
>   obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
>   obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
> +obj-$(CONFIG_SENSORS_TIDS) += tids.o
>   obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
>   
>   obj-$(CONFIG_SENSORS_OCC)	+= occ/
> diff --git a/drivers/hwmon/tids.c b/drivers/hwmon/tids.c
> new file mode 100644
> index 000000000000..0176a5e8b574
> --- /dev/null
> +++ b/drivers/hwmon/tids.c
> @@ -0,0 +1,560 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (c) BECOM Electronics GmbH
> + *
> + * wsen_tids_2521020222501.c - Linux hwmon driver for WSEN-TIDS
> + *                             2521020222501 Temperature sensor
> + *
> + * Author: Thomas Marangoni <thomas.marangoni@becom-group.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Unnecessary include.

> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +/*
> + * TIDS registers
> + */
> +#define TIDS_CMD_DEVICE_ID	0x01
> +#define TIDS_CMD_T_H_LIMIT	0x02
> +#define TIDS_CMD_T_L_LIMIT	0x03
> +#define TIDS_CMD_CTRL		0x04
> +#define TIDS_CMD_STATUS		0x05
> +#define TIDS_CMD_DATA_T_L	0x06
> +#define TIDS_CMD_DATA_T_H	0x07
> +#define TIDS_CMD_SOFT_REST	0x0C
> +
> +/*
> + * TIDS device IDs
> + */
> +#define TIDS_ID_2521020222501 0xa0
> +
Not used.

> +enum tids_update_interval {
> +	tids_update_interval_40ms = 0,
> +	tids_update_interval_20ms = 1,
> +	tids_update_interval_10ms = 2,
> +	tids_update_interval_5ms = 3,
> +};
> +
> +/* TIDS control register */
> +static const struct reg_field tids_reg_field_ctrl_one_shot =
> +	REG_FIELD(TIDS_CMD_CTRL, 0, 0);
> +static const struct reg_field tids_reg_field_ctrl_freerun =
> +	REG_FIELD(TIDS_CMD_CTRL, 2, 2);
> +static const struct reg_field tids_reg_field_ctrl_if_add_inc =
> +	REG_FIELD(TIDS_CMD_CTRL, 3, 3);
> +static const struct reg_field tids_reg_field_ctrl_avg =
> +	REG_FIELD(TIDS_CMD_CTRL, 4, 5);
> +static const struct reg_field tids_reg_field_ctrl_bdu =
> +	REG_FIELD(TIDS_CMD_CTRL, 6, 6);
> +/* TIDS status register */
> +static const struct reg_field tids_reg_field_status_busy =
> +	REG_FIELD(TIDS_CMD_STATUS, 0, 0);
> +static const struct reg_field tids_reg_field_status_over_thl =
> +	REG_FIELD(TIDS_CMD_STATUS, 1, 1);
> +static const struct reg_field tids_reg_field_status_under_tll =
> +	REG_FIELD(TIDS_CMD_STATUS, 2, 2);
> +/* TIDS reset register */
> +static const struct reg_field tids_reg_field_soft_reset =
> +	REG_FIELD(TIDS_CMD_SOFT_REST, 1, 1);
> +

I seem to be missing something. Why would it make sense to allocate
all those regmap fields and not just use regmap_update_bits() ?
I don't see any benefit in that complexity, especially for single-bit
"fields".

> +struct tids_data {
> +	struct i2c_client *client;
> +
> +	struct regmap *regmap;
> +
> +	/* regmap field for ctrl register */
> +	struct regmap_field *reg_ctrl_one_shot;
> +	struct regmap_field *reg_ctrl_freerun;
> +	struct regmap_field *reg_ctrl_if_add_inc;
> +	struct regmap_field *reg_ctrl_avg;
> +	struct regmap_field *reg_ctrl_bdu;
> +
> +	/* regmap field for status register */
> +	struct regmap_field *reg_status_busy;
> +	struct regmap_field *reg_status_over_thl;
> +	struct regmap_field *reg_status_under_tll;
> +
> +	/* regmap field for soft reset register*/
> +	struct regmap_field *reg_soft_reset;
> +
> +	int irq;
> +	int temperature;
> +};
> +
> +static ssize_t tids_interval_read(struct device *dev, long *val)
> +{
> +	int ret = 0;
> +	unsigned int avg_value = 0;

Unnecessary initializations.

> +	struct tids_data *data = dev_get_drvdata(dev);
> +
> +	ret = regmap_field_read(data->reg_ctrl_avg, &avg_value);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (avg_value) {
> +	case tids_update_interval_40ms:
> +		*val = 40;
> +		break;
> +	case tids_update_interval_20ms:
> +		*val = 20;
> +		break;
> +	case tids_update_interval_10ms:
> +		*val = 10;
> +		break;
> +	case tids_update_interval_5ms:
> +		*val = 5;
> +		break;
> +	default:
> +		return -EINVAL;

Reading a value from a chip can not return -EINVAL.
EINVAL is "Invalid argument", or bad user input, not bad data from a chip.

On top of that, the regmap field is defined as two bits. The value returned
can not be out of range. A simple array read would do the trick.

static u8 update_intervals[] = { 40, 20, 10, 5 };

return update_intervals[avg_value];

> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t tids_interval_write(struct device *dev, long val)
> +{
> +	unsigned int avg_value = 0;
> +	struct tids_data *data = dev_get_drvdata(dev);

Again, please avoid unnecessary variable initializations. I am not going to
mention this again; please fix everywhere.

Also, please use "reverse christmas tree" (longest declaration first)
for variable declarations.

> +
> +	switch (val) {
> +	case 40:
> +		avg_value = tids_update_interval_40ms;
> +		break;
> +	case 20:
> +		avg_value = tids_update_interval_20ms;
> +		break;
> +	case 10:
> +		avg_value = tids_update_interval_10ms;
> +		break;
> +	case 5:
> +		avg_value = tids_update_interval_5ms;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +

This code should, similar to other drivers, approximate the provided value.
instead of letting the user figure out valid values. I would suggest to use
find_closest() or find_closest_descending() to determine valid values.

> +	return regmap_field_write(data->reg_ctrl_avg, avg_value);
> +}
> +
> +static int tids_temperature1_read(struct device *dev, long *val)
> +{
> +	int ret;
> +	u8 buf[2] = { 0 };
> +	struct tids_data *data = dev_get_drvdata(dev);
> +
> +	ret = regmap_bulk_read(data->regmap, TIDS_CMD_DATA_T_L, buf, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	// temperature in °mC
> +	*val = (((s16)(buf[1] << 8) | buf[0])) * 10;
> +
> +	return 0;
> +}
> +
> +static ssize_t tids_temperature_alarm_read(struct device *dev, u32 attr,
> +					   long *val)
> +{
> +	int ret = 0;
> +	unsigned int reg_data = 0;
> +	struct tids_data *data = dev_get_drvdata(dev);
> +
> +	if (attr == hwmon_temp_min_alarm)
> +		ret = regmap_field_read(data->reg_status_under_tll, &reg_data);
> +	else if (attr == hwmon_temp_max_alarm)
> +		ret = regmap_field_read(data->reg_status_over_thl, &reg_data);
> +	else
> +		return -EOPNOTSUPP;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = reg_data;
> +
> +	return 0;
> +}
> +
> +static int tids_temperature_hyst_read(struct device *dev, u32 attr, long *val)
> +{
> +	int ret;
> +	struct tids_data *data = dev_get_drvdata(dev);
> +	unsigned int reg_data = 0;
> +
> +	if (attr == hwmon_temp_min_hyst)
> +		ret = regmap_read(data->regmap, TIDS_CMD_T_L_LIMIT, &reg_data);
> +	else if (attr == hwmon_temp_max_hyst)
> +		ret = regmap_read(data->regmap, TIDS_CMD_T_H_LIMIT, &reg_data);
> +	else
> +		return -EOPNOTSUPP;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	// temperature from register conversion in °mC
> +	*val = (((u8)reg_data - 63) * 640);
> +
> +	return 0;
> +}
> +
> +static ssize_t tids_temperature_hyst_write(struct device *dev, u32 attr,
> +					   long val)
> +{
> +	u8 reg_data = 0;
> +	struct tids_data *data = dev_get_drvdata(dev);
> +
> +	// temperature in °mC
> +	if (val < -39680 || val > 122880)
> +		return -EINVAL;

Please use clamp_val().

> +
> +	// temperature to register conversion in °mC

You are using c++ comment style for single-line comments and C comment style for
multi-line comments. I am not a friend of C++-style comments, but I accept it.
However, I do ask for consistency. Either/or, please, but not both.

> +	reg_data = (u8)((val / 640) + 63);

Candidate for DIV_ROUND_CLOSEST() ?

> +
> +	if (attr == hwmon_temp_min_hyst)
> +		return regmap_write(data->regmap, TIDS_CMD_T_L_LIMIT, reg_data);
> +	else if (attr == hwmon_temp_max_hyst)
> +		return regmap_write(data->regmap, TIDS_CMD_T_H_LIMIT, reg_data);
> +	else
> +		return -EOPNOTSUPP;
> +}
> +
> +static umode_t tids_hwmon_visible(const void *data,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel)
> +{
> +	umode_t mode = 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_min_alarm:
> +		case hwmon_temp_max_alarm:
> +			mode = 0444;
> +			break;
> +		case hwmon_temp_min_hyst:
> +		case hwmon_temp_max_hyst:
> +			mode = 0644;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			mode = 0644;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return mode;
> +}
> +
> +static int tids_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			return tids_temperature1_read(dev, val);
> +		case hwmon_temp_min_alarm:
> +		case hwmon_temp_max_alarm:
> +			return tids_temperature_alarm_read(dev, attr, val);
> +		case hwmon_temp_min_hyst:
> +		case hwmon_temp_max_hyst:
> +			return tids_temperature_hyst_read(dev, attr, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return tids_interval_read(dev, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int tids_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_min_hyst:
> +		case hwmon_temp_max_hyst:
> +			return tids_temperature_hyst_write(dev, attr, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return tids_interval_write(dev, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *const tids_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN_ALARM |
> +					 HWMON_T_MAX_ALARM | HWMON_T_MIN_HYST |
> +					 HWMON_T_MAX_HYST),

Why do you use "hyst" for limit attributes ? A hysteresis without limit does
not make sense. The datasheet says that those are limits (thresholds),
not hysteresis values. The datasheet doesn't even mention the term
"hysteresis".

> +	NULL
> +};
> +
> +static const struct hwmon_ops tids_ops = {
> +	.is_visible = tids_hwmon_visible,
> +	.read		= tids_hwmon_read,
> +	.write		= tids_hwmon_write,
> +};
> +
> +static const struct hwmon_chip_info tids_chip_info = {
> +	.ops	= &tids_ops,
> +	.info	= tids_info,
> +};
> +
> +static bool tids_regmap_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	if (reg >= 0x02 && reg <= 0x04)
> +		return true;
> +
> +	if (reg == 0x0c)
> +		return true;
> +

Registers are defined. Please use the definitions here and in the functions below.

> +	return false;
> +}
> +
> +static bool tids_regmap_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	if (reg >= 0x01 && reg <= 0x07)
> +		return true;
> +
> +	if (reg == 0x0c)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool tids_regmap_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	if (reg >= 0x05 && reg <= 0x07)
> +		return true;
> +
> +	if (reg == 0x0c)
> +		return true;
> +
> +	return false;
> +}
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits			= 8,
> +	.val_bits			= 8,
> +	.max_register		= TIDS_CMD_SOFT_REST,
> +	.writeable_reg		= tids_regmap_writeable_reg,
> +	.readable_reg		= tids_regmap_readable_reg,
> +	.volatile_reg		= tids_regmap_volatile_reg,
> +	.use_single_read	= 0,
> +};
> +
> +static int tids_probe_regmap(struct tids_data *data)
> +{
> +	struct device *dev = &data->client->dev;
> +
> +	/* Init regmap */
> +	data->regmap = devm_regmap_init_i2c(data->client, &regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
> +				     "regmap initialization failed\n");
> +
> +	/* Allocate regmap_field for ctrl register */
> +	data->reg_ctrl_one_shot = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_ctrl_one_shot);
> +	if (IS_ERR(data->reg_ctrl_one_shot))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_ctrl_one_shot),
> +			"regmap_field reg_ctrl_one_shot initialization failed\n");
> +
> +	data->reg_ctrl_freerun = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_ctrl_freerun);
> +	if (IS_ERR(data->reg_ctrl_freerun))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_ctrl_freerun),
> +			"regmap_field reg_ctrl_freerun initialization failed\n");
> +
> +	data->reg_ctrl_if_add_inc = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_ctrl_if_add_inc);
> +	if (IS_ERR(data->reg_ctrl_if_add_inc))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_ctrl_if_add_inc),
> +			"regmap_field reg_ctrl_if_add_inc initialization failed\n");
> +
> +	data->reg_ctrl_avg = devm_regmap_field_alloc(dev, data->regmap,
> +						     tids_reg_field_ctrl_avg);
> +	if (IS_ERR(data->reg_ctrl_avg))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_ctrl_avg),
> +			"regmap_field reg_ctrl_avg initialization failed\n");
> +
> +	data->reg_ctrl_bdu = devm_regmap_field_alloc(dev, data->regmap,
> +						     tids_reg_field_ctrl_bdu);
> +	if (IS_ERR(data->reg_ctrl_bdu))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_ctrl_bdu),
> +			"regmap_field reg_ctrl_bdu initialization failed\n");
> +
> +	/* Allocate regmap_field for status register */
> +	data->reg_status_busy = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_status_busy);
> +	if (IS_ERR(data->reg_status_busy))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_status_busy),
> +			"regmap_field reg_status_busy initialization failed\n");
> +
> +	data->reg_status_over_thl = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_status_over_thl);
> +	if (IS_ERR(data->reg_status_over_thl))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_status_over_thl),
> +			"regmap_field reg_status_over_thl initialization failed\n");
> +
> +	data->reg_status_under_tll = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_status_under_tll);
> +	if (IS_ERR(data->reg_status_under_tll))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_status_under_tll),
> +			"regmap_field reg_status_under_tll initialization failed\n");
> +
> +	/* Allocate regmap_field for software_reset */
> +	data->reg_soft_reset = devm_regmap_field_alloc(
> +		dev, data->regmap, tids_reg_field_soft_reset);
> +	if (IS_ERR(data->reg_soft_reset))
> +		return dev_err_probe(
> +			dev, PTR_ERR(data->reg_soft_reset),
> +			"regmap_field reg_soft_reset initialization failed\n");

Following up on the above, that is a lot of code just to avoid using regmap_update_bits().
Again, what am I missing ?

> +
> +	return 0;
> +}
> +
> +static int tids_probe(struct i2c_client *client)
> +{
> +	struct device *device = &client->dev;
> +	struct device *hwmon_dev;
> +	struct tids_data *data;
> +	unsigned int value;
> +	int ret = 0;
> +
> +	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +
> +	ret = tids_probe_regmap(data);
> +	if (ret != 0)
> +		return ret;
> +
> +	/* Read device id, to check if i2c is working */
> +	ret = regmap_read(data->regmap, TIDS_CMD_DEVICE_ID, &value);
> +	if (ret < 0)
> +		return ret;

Why read this but not check it ?

> +
> +	/* Triggering soft reset */
> +	ret = regmap_field_write(data->reg_soft_reset, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_field_write(data->reg_soft_reset, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Allowing bulk read */
> +	ret = regmap_field_write(data->reg_ctrl_if_add_inc, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set meassurement interval */
> +	ret = regmap_field_write(data->reg_ctrl_avg, tids_update_interval_40ms);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set device to free run mode */
> +	ret = regmap_field_write(data->reg_ctrl_freerun, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Don't update temperature register until high and low value are read */
> +	ret = regmap_field_write(data->reg_ctrl_bdu, 1);
> +	if (ret < 0)
> +		return ret;
> +

Please move this code into a separate _init function. Also, is it really necessary
to write all those control register values bit by bit ? If so, that should be explained
since it adds a lot of non-obvious complexity to the code.

> +	hwmon_dev = devm_hwmon_device_register_with_info(
> +		device, device->driver->name, data, &tids_chip_info, NULL);

Just use "tids" instead of "device->driver->name".

> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static int tids_suspend(struct device *dev)
> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +
> +	return regmap_field_write(data->reg_ctrl_freerun, 0);
> +}
> +
> +static int tids_resume(struct device *dev)
> +{
> +	struct tids_data *data = dev_get_drvdata(dev);
> +
> +	return regmap_field_write(data->reg_ctrl_freerun, 1);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(tids_dev_pm_ops, tids_resume, tids_suspend);
> +
> +static const struct i2c_device_id tids_id[] = {
> +	{ "tids", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, tids_id);
> +
> +static const struct of_device_id tids_of_match[] = {
> +	{ .compatible = "wsen,tids-2521020222501" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tids_of_match);
> +
> +static struct i2c_driver tids_driver = {
> +	.class	= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name			= "tids",
> +		.pm				= pm_sleep_ptr(&tids_dev_pm_ops),
> +		.of_match_table = tids_of_match,
> +	},
> +	.probe		= tids_probe,
> +	.id_table	= tids_id,
> +};
> +
> +module_i2c_driver(tids_driver);
> +
> +MODULE_AUTHOR("Thomas Marangoni <Thomas.Marangoni@becom-group.com>");
> +MODULE_DESCRIPTION("WSEN TIDS temperature sensor driver");
> +MODULE_LICENSE("GPL");

