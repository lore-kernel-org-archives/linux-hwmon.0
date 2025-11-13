Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC590326D6E
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 23:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763077742; cv=none; b=Bu9jVUnNnoi7lfWwTpjRBS1ShNMxEDN6unbKN34PzH168L09IL+w39lJZbT4Hkrl2KYvsgC3OhSKpnJ9WxTjKrUsImMLCVC4bX2mIIgeUsq24B9nyIgshIR5f60E/tkMJHe+uZzBMRhlU276Ui8F+nvgjqehtvJoHiSLcTXhKMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763077742; c=relaxed/simple;
	bh=Hu982hhkpZx9btlu78eoJ+wlF3vmfx32fRFV6GIXp7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbAooe5/WvPAD0tAH9yZf9mtH/GweGuu5vcn8Yv7ZZuuPifm+Jl3Fojnooar2FLGc8bUm9zR8cfabUOlBp9ObH9EknzS2vc8hpQy1FcuQzH99+GSX0Ypnw64gsw5z6uExl8A0UkiCp3bG4RCw4kedfu22A+lPVfmIXZm8sH6EsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeciwiIL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeciwiIL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so1557942b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 15:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763077739; x=1763682539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cuY01vSjghS/6dub+54hC3Wyk4+5o9pq+sB1qSjs2B8=;
        b=NeciwiILBE2+szIDRBLKRA5TUwFJgIDoNvwMdZbKiRawi87a5lvAYfKfCQNwT5yGkc
         IycqYCJ3OGSUq6ga0kCoQ88xRO2GjUk7Hdn4sDFDPo6KmfQ0RMEXC4LwRFDnkg0mjrc2
         Wo5fu+T9LZd/6c+DItjMa2w+++8hEG4Ayubq08q05xfP/avscoXW2cCRLk8JnMH+HTtw
         ujnAoy+bKNVbUjdcWGqT3v0icseAa9YL7dkeh+BEsBBbI5HQbA+r6PLy3RRrPVCImvdT
         JwnF+WFYJRZQ2WCCbj572HT4YaeSg3VKLHX0De+ejyN4tCepsqCo94MMxf/suBmOP6e8
         c0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763077739; x=1763682539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuY01vSjghS/6dub+54hC3Wyk4+5o9pq+sB1qSjs2B8=;
        b=JID/OnGPs2fqAH8ATuy6i9HpivNjHlibPkSaMfYl1KjcDl7/eUglhQg/SJmrSgCTp2
         XBmUc5DnzOflingoxvxDTLxsby8MdujnHu6TYpVdUyEUqkmb44Z7qqoO/UaiRAV6xzbE
         vof7sLVt0CGZ+0yWUdUEYP4PwagdsEquBPePM96Jgn8wFGPHKKwyNOVkqswA+HaAh+2/
         3UYFBkiCNv0VbDQWocJI7O9MJOGMMBlBvt9DimcSuMHzWEnO4R//dvQfbA10B00N1BVF
         xVImXRLwNkaTDIpDnkOUbbdFQsghTMpXRs41dLt8ZeWiDF0LdOJ5rnm2xicroCAj+JWu
         06UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEav8zuP5YhO/tGk7IqF2UJ4/QaTZgEyTldfzkVkfs/8ywz2vgZH3of/jngznytd3OvlX0wF+OQU1u+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXBgBDcbZd/nx8ybzYhWcHqMHQ7Y2MK2SXcCcWw1/WEVrgde2
	IGH9647XyY644HuRM9FeT6xRSni70DxZvfA9ESaIrfYRQwP1O/Fs5D+j
X-Gm-Gg: ASbGnctpPc/lthUGqTeYbqV153TxOvYd+iWCjU2KTlcbjWzzfVZ5rYF5S9UhXpBcZla
	JaXdUHm/fm46YPpMLXeNte9lL5GI+hPECqyHRtFtR+flW4ElOTbgQ58DYLMTRGxWWarJePRIYMB
	4oGGQZvIp+PYvEfByWXWFyJFBiSUbNd4tP8EtD/HZ8rss8DQ4V00ZU6sXXbPLdEMssZn1iTbv5g
	dOWY/gOwKRslLqw1rAoA7bldJ+QtmyyCZc9o6k3p/3FER1rM5HG0AYlZ0eXYohfYth5KY7GFpUp
	gl5SNhXspw/bBAJZpE5NfWOnpZ8Cjeofb2rkrAJp2LS50s2J7fGppoaVyt61offvZ71/RQKkhyl
	/P9Z+La2kzeBSZPJ6EExweBYXQy+eASXlaxAbr+Zccba2WjNmuRGCoMzMWPE7cnJv9gTO0wN7Zj
	MS5DFna2iN4nY7cpz09YQN6/GU/FagEVQWiHmgCNa56Vy1C7VP
X-Google-Smtp-Source: AGHT+IHIkiXoM74xOE8jNlHjeCJgISC3g1tsF/qFtbBSauBn9ypdbQrrzpV418jDX52D4Et+T4/XGA==
X-Received: by 2002:a05:6a00:88d:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7ba39ce2497mr1605147b3a.12.1763077739072;
        Thu, 13 Nov 2025 15:48:59 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e9ddsm3398094b3a.41.2025.11.13.15.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 15:48:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <63355d1b-9eeb-4612-b1c0-f718626ad2be@roeck-us.net>
Date: Thu, 13 Nov 2025 15:48:57 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] regulator: Add FP9931/JD9930 driver
To: Andreas Kemnade <andreas@kemnade.info>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
 <20251114-fp9931-submit-v2-3-cd6998932c4c@kemnade.info>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251114-fp9931-submit-v2-3-cd6998932c4c@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/25 15:06, Andreas Kemnade wrote:
> Add a driver for the FP9931/JD9930 regulator. Implement handling of the PG
> (power good), TS_EN (temperature sensor enable), and EN (enable regulators)
> pins. Implement the pair of symmetric LDOs as a single regulator because
> they share a single voltage set register. For simplicity, just add the
> temperature sensor (depending on external NTC) directly.
> 
> Limitations:
> - As these regulators are controlled together with the VCOM regulator via
>    the EN pin, some kind of management must be in place. As the enable op
>    is not called when the regulator is already enabled, simple refcounting
>    seems not to work to avoid clearing EN when one regulator is still
>    enabled. As these regulators are typically used together, this
>    limitation should not hurt hard, just provide the is_enabled op.
> - As the VCOM step is quite odd (5V/255 steps), rounding is needed.
>    Due to some limitations in the regulator core, the max/min voltages in
>    the devicetree must match the idea of the driver how to round things
>    exactly.
> - Night mode is not implemented, so only the FP9931 compatible is needed in
>    the driver, there is no REGULATOR_MODE_NIGHT and no clear definition in
>    the datasheet what it does, also the XON pin which seems to be an input
>    related to that night mode is not used.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   drivers/regulator/Kconfig  |  10 +
>   drivers/regulator/Makefile |   1 +
>   drivers/regulator/fp9931.c | 564 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 575 insertions(+)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d84f3d054c59..c817a4cc00c8 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -500,6 +500,16 @@ config REGULATOR_ISL6271A
>   	help
>   	  This driver supports ISL6271A voltage regulator chip.
>   
> +config REGULATOR_FP9931
> +	tristate "FitiPower FP9931/JD9930 EPD regulator"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  This driver supports the FP9931/JD9930 voltage regulator chip
> +	  which is used to provide power to Electronic Paper Displays
> +	  so it is found in E-Book readers.
> +	  If HWWON is enabled, it also provides temperature measurement.
> +
>   config REGULATOR_LM363X
>   	tristate "TI LM363X voltage regulators"
>   	depends on MFD_TI_LMU
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index b3101376029d..98a02c854044 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_REGULATOR_HI6421V600) += hi6421v600-regulator.o
>   obj-$(CONFIG_REGULATOR_HI655X) += hi655x-regulator.o
>   obj-$(CONFIG_REGULATOR_ISL6271A) += isl6271a-regulator.o
>   obj-$(CONFIG_REGULATOR_ISL9305) += isl9305.o
> +obj-$(CONFIG_REGULATOR_FP9931) += fp9931.o
>   obj-$(CONFIG_REGULATOR_LM363X) += lm363x-regulator.o
>   obj-$(CONFIG_REGULATOR_LOCHNAGAR) += lochnagar-regulator.o
>   obj-$(CONFIG_REGULATOR_LP3971) += lp3971.o
> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> new file mode 100644
> index 000000000000..7e3df5f2ccb9
> --- /dev/null
> +++ b/drivers/regulator/fp9931.c
> @@ -0,0 +1,564 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (C) 2025 Andreas Kemnade
> +
> +/* Datasheet: https://www.fitipower.com/dl/file/flXa6hIchVeu0W3K */
> +
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/hwmon.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regmap.h>
> +
> +#define FP9931_REG_TMST_VALUE 0
> +#define FP9931_REG_VCOM_SETTING 1
> +#define FP9931_REG_VPOSNEG_SETTING 2
> +#define FP9931_REG_PWRON_DELAY 3
> +#define FP9931_REG_CONTROL_REG1 11
> +
> +#define PGOOD_TIMEOUT_MSECS 200
> +
> +struct fp9931_data {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct regulator *vin_reg;
> +	struct gpio_desc *pgood_gpio;
> +	struct gpio_desc *en_gpio;
> +	struct gpio_desc *en_ts_gpio;
> +	struct completion pgood_completion;
> +	int pgood_irq;
> +};
> +
> +static const unsigned int VPOSNEG_table[] = {
> +	7040000,
> +	7040000,
> +	7040000,
> +	7040000,
> +	7040000,
> +	7040000,
> +	7260000,
> +	7490000,
> +	7710000,
> +	7930000,
> +	8150000,
> +	8380000,
> +	8600000,
> +	8820000,
> +	9040000,
> +	9270000,
> +	9490000,
> +	9710000,
> +	9940000,
> +	10160000,
> +	10380000,
> +	10600000,
> +	10830000,
> +	11050000,
> +	11270000,
> +	11490000,
> +	11720000,
> +	11940000,
> +	12160000,
> +	12380000,
> +	12610000,
> +	12830000,
> +	13050000,
> +	13280000,
> +	13500000,
> +	13720000,
> +	13940000,
> +	14170000,
> +	14390000,
> +	14610000,
> +	14830000,
> +	15060000,
> +};
> +
> +static const struct hwmon_channel_info *fp9931_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static int setup_timings(struct fp9931_data *data)
> +{
> +	u32 tdly[4];
> +	u8 tdlys = 0;
> +	int i;
> +	int ret;
> +
> +	ret = device_property_count_u32(data->dev, "fitipower,tdly-ms");
> +	if (ret == -EINVAL) /* property is optional */
> +		return 0;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret != ARRAY_SIZE(tdly)) {
> +		dev_err(data->dev, "invalid delay specification");
> +		return -EINVAL;
> +	}
> +
> +	ret = device_property_read_u32_array(data->dev, "fitipower,tdly-ms",
> +					     tdly, ARRAY_SIZE(tdly));
> +	if (ret)
> +		return ret;
> +
> +	for (i = ARRAY_SIZE(tdly) - 1; i >= 0; i--) {
> +		if (tdly[i] > 4 || tdly[i] == 3)
> +			return -EINVAL;
> +
> +		if (tdly[i] == 4) /* convert from ms */
> +			tdly[i] = 3;
> +
> +		tdlys <<= 2;
> +		tdlys |= tdly[i];
> +	}
> +
> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(data->regmap, FP9931_REG_PWRON_DELAY, tdlys);
> +	pm_runtime_put_autosuspend(data->dev);
> +
> +	return ret;
> +}
> +
> +static int fp9931_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, long *temp)
> +{
> +	struct fp9931_data *data = dev_get_drvdata(dev);
> +	unsigned int val;
> +	s8 signed_val;
> +	int ret;
> +
> +	if (attr != hwmon_temp_input)
> +		return -EOPNOTSUPP;
> +

This doesn't hurt, but it is unnecessary.

> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(data->regmap, FP9931_REG_TMST_VALUE, &val);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_put_autosuspend(data->dev);
> +	signed_val = (s8)val;
> +
> +	*temp = signed_val;
> +	*temp = *temp * 1000;

	*temp = (s8)val * 1000;

would do just as well.

> +
> +	return 0;
> +}
> +
> +static umode_t fp9931_hwmon_is_visible(const void *data,
> +				       enum hwmon_sensor_types type,
> +				       u32 attr, int channel)
> +{
> +	if (type != hwmon_temp)
> +		return 0;
> +
> +	if (attr != hwmon_temp_input)
> +		return 0;
> +

Not that it matters (much), but those checks are unnecessary.

> +	return 0444;
> +}
> +
> +static const struct hwmon_ops fp9931_hwmon_ops = {
> +	.is_visible = fp9931_hwmon_is_visible,
> +	.read = fp9931_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info fp9931_chip_info = {
> +	.ops = &fp9931_hwmon_ops,
> +	.info = fp9931_info,
> +};
> +
> +static int fp9931_runtime_suspend(struct device *dev)
> +{
> +	int ret = 0;
> +	struct fp9931_data *data = dev_get_drvdata(dev);
> +
> +	if (data->en_ts_gpio)
> +		gpiod_set_value_cansleep(data->en_ts_gpio, 0);
> +
> +	if (data->vin_reg) {
> +		ret = regulator_disable(data->vin_reg);
> +		regcache_mark_dirty(data->regmap);
> +	}
> +
> +	return ret;
> +}
> +
> +static int fp9931_runtime_resume(struct device *dev)
> +{
> +	int ret = 0;
> +	struct fp9931_data *data = dev_get_drvdata(dev);
> +
> +	if (data->vin_reg)
> +		ret = regulator_enable(data->vin_reg);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (data->en_ts_gpio) {
> +		gpiod_set_value_cansleep(data->en_ts_gpio, 1);
> +		/* wait for one ADC conversion to have sane temperature */
> +		usleep_range(10000, 15000);
> +	}
> +
> +	ret = regcache_sync(data->regmap);
> +
> +	return ret;
> +}
> +
> +static bool fp9931_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return reg == FP9931_REG_TMST_VALUE;
> +}
> +
> +static const struct reg_default fp9931_reg_default = {
> +	.reg = FP9931_REG_VCOM_SETTING,
> +	.def = 0x80,
> +};
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 12,
> +	.cache_type = REGCACHE_FLAT,
> +	.volatile_reg = fp9931_volatile_reg,
> +	.reg_defaults = &fp9931_reg_default,
> +	.num_reg_defaults = 1,
> +};
> +
> +static void disable_nopm(void *d)
> +{
> +	struct fp9931_data *data = d;
> +
> +	fp9931_runtime_suspend(data->dev);
> +}
> +
> +static int fp9931_v3p3_enable(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regulator_enable_regmap(rdev);
> +	if (ret < 0)
> +		pm_runtime_put_autosuspend(data->dev);
> +
> +	return ret;
> +}
> +
> +static int fp9931_v3p3_disable(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = regulator_disable_regmap(rdev);
> +	pm_runtime_put_autosuspend(data->dev);
> +
> +	return ret;
> +}
> +
> +static int fp9931_v3p3_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	if (pm_runtime_status_suspended(data->dev))
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return 0;
> +
> +	ret = regulator_is_enabled_regmap(rdev);
> +
> +	pm_runtime_put_autosuspend(data->dev);
> +	return ret;
> +}
> +
> +static const struct regulator_ops fp9931_v3p3ops = {
> +	.list_voltage = regulator_list_voltage_linear,
> +	.enable = fp9931_v3p3_enable,
> +	.disable = fp9931_v3p3_disable,
> +	.is_enabled = fp9931_v3p3_is_enabled,
> +};
> +
> +static int fp9931_check_powergood(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +
> +	if (pm_runtime_status_suspended(data->dev))
> +		return 0;
> +
> +	return gpiod_get_value_cansleep(data->pgood_gpio);
> +}
> +
> +static int fp9931_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regulator_get_voltage_sel_regmap(rdev);
> +	pm_runtime_put_autosuspend(data->dev);
> +
> +	return ret;
> +}
> +
> +static int fp9931_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regulator_set_voltage_sel_regmap(rdev, selector);
> +	pm_runtime_put_autosuspend(data->dev);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t pgood_handler(int irq, void *dev_id)
> +{
> +	struct fp9931_data *data = dev_id;
> +
> +	complete(&data->pgood_completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int fp9931_set_enable(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	reinit_completion(&data->pgood_completion);
> +	gpiod_set_value_cansleep(data->en_gpio, 1);
> +	dev_dbg(data->dev, "turning on...");
> +	wait_for_completion_timeout(&data->pgood_completion,
> +				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
> +	dev_dbg(data->dev, "turned on");
> +	if (gpiod_get_value_cansleep(data->pgood_gpio) != 1) {
> +		pm_runtime_put_autosuspend(data->dev);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int fp9931_clear_enable(struct regulator_dev *rdev)
> +{
> +	struct fp9931_data *data = rdev_get_drvdata(rdev);
> +
> +	gpiod_set_value_cansleep(data->en_gpio, 0);
> +	pm_runtime_put_autosuspend(data->dev);
> +	return 0;
> +}
> +
> +static const struct regulator_ops fp9931_vcom_ops = {
> +	.list_voltage = regulator_list_voltage_linear,
> +	.map_voltage = regulator_map_voltage_linear,
> +	.enable = fp9931_set_enable,
> +	.disable = fp9931_clear_enable,
> +	.is_enabled = fp9931_check_powergood,
> +	.set_voltage_sel = fp9931_set_voltage_sel,
> +	.get_voltage_sel = fp9931_get_voltage_sel,
> +};
> +
> +static const struct regulator_ops fp9931_vposneg_ops = {
> +	.list_voltage = regulator_list_voltage_table,
> +	.map_voltage = regulator_map_voltage_ascend,
> +	/* gets enabled by enabling vcom, too */
> +	.is_enabled = fp9931_check_powergood,
> +	.set_voltage_sel = fp9931_set_voltage_sel,
> +	.get_voltage_sel = fp9931_get_voltage_sel,
> +};
> +
> +static const struct regulator_desc regulators[] = {
> +	{
> +		.name = "v3p3",
> +		.of_match = of_match_ptr("v3p3"),
> +		.id = 0,
> +		.ops = &fp9931_v3p3ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.enable_reg = FP9931_REG_CONTROL_REG1,
> +		.enable_mask = BIT(1),
> +		.n_voltages = 1,
> +		.min_uV = 3300000
> +	},
> +	{
> +		.name = "vposneg",
> +		.of_match = of_match_ptr("vposneg"),
> +		.id = 1,
> +		.ops = &fp9931_vposneg_ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.n_voltages = ARRAY_SIZE(VPOSNEG_table),
> +		.vsel_reg = FP9931_REG_VPOSNEG_SETTING,
> +		.vsel_mask = 0x3F,
> +		.volt_table = VPOSNEG_table,
> +	},
> +	{
> +		.name = "vcom",
> +		.of_match = of_match_ptr("vcom"),
> +		.id = 2,
> +		.ops = &fp9931_vcom_ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.n_voltages = 255,
> +		.min_uV = 0,
> +		.uV_step = 5000000 / 255,
> +		.vsel_reg = FP9931_REG_VCOM_SETTING,
> +		.vsel_mask = 0xFF
> +	},
> +};
> +
> +static int fp9931_probe(struct i2c_client *client)
> +{
> +	struct fp9931_data *data;
> +	struct regulator_config config = { };
> +	struct regulator_dev *rdev;
> +	int ret = 0;
> +	int i;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	data->regmap = devm_regmap_init_i2c(client, &regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
> +				     "failed to allocate regmap!\n");
> +
> +	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
> +	if (IS_ERR(data->vin_reg))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->vin_reg),
> +				     "failid to get vin regulator\n");
> +
> +	data->pgood_gpio = devm_gpiod_get(&client->dev, "pg", GPIOD_IN);
> +	if (IS_ERR(data->pgood_gpio))
> +		return dev_err_probe(&client->dev,
> +				     PTR_ERR(data->pgood_gpio),
> +				     "failed to get power good gpio\n");
> +
> +	data->pgood_irq = gpiod_to_irq(data->pgood_gpio);
> +	if (data->pgood_irq < 0)
> +		return data->pgood_irq;
> +
> +	data->en_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(data->en_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->en_gpio),
> +				     "failed to get en gpio\n");
> +
> +	data->en_ts_gpio = devm_gpiod_get_optional(&client->dev, "en-ts", GPIOD_OUT_LOW);
> +	if (IS_ERR(data->en_ts_gpio))
> +		return dev_err_probe(&client->dev,
> +				     PTR_ERR(data->en_ts_gpio),
> +				     "failed to get en gpio\n");
> +
> +	data->dev = &client->dev;
> +	i2c_set_clientdata(client, data);
> +
> +	init_completion(&data->pgood_completion);
> +
> +	ret = devm_request_threaded_irq(&client->dev, data->pgood_irq, NULL,
> +					pgood_handler,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"PGOOD", data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to request irq\n");
> +
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		devm_pm_runtime_enable(&client->dev);
> +		pm_runtime_set_autosuspend_delay(&client->dev, 4000);
> +		pm_runtime_use_autosuspend(&client->dev);
> +	} else {
> +		ret = fp9931_runtime_resume(&client->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		devm_add_action_or_reset(&client->dev, disable_nopm, data);
> +	}
> +
> +	ret = setup_timings(data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "failed to setup timings\n");
> +
> +	config.driver_data = data;
> +	config.dev = &client->dev;
> +	config.regmap = data->regmap;
> +
> +	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
> +		rdev = devm_regulator_register(&client->dev, &regulators[i],
> +					       &config);
> +		if (IS_ERR(rdev))
> +			return dev_err_probe(&client->dev, PTR_ERR(rdev),
> +					     "failed to register %s regulator\n",
> +					     regulators[i].name);
> +	}
> +
> +	if (IS_REACHABLE(CONFIG_HWMON)) {
> +		struct device *hwmon_dev;
> +
> +		hwmon_dev = devm_hwmon_device_register_with_info(&client->dev, "fp9931", data,
> +								 &fp9931_chip_info, NULL);
> +		if (IS_ERR(hwmon_dev))
> +			dev_err(&client->dev, "failed to register hwmon\n");

This is not an error. After all, it does not result in a probe failure.
It should be a notice.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops fp9931_pm_ops = {
> +	SET_RUNTIME_PM_OPS(fp9931_runtime_suspend, fp9931_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id fp9931_dt_ids[] = {
> +	{
> +		.compatible = "fitipower,fp9931",
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(of, fp9931_dt_ids);
> +
> +static struct i2c_driver fp9931_i2c_driver = {
> +	.driver = {
> +		   .name = "fp9931",
> +		   .of_match_table = fp9931_dt_ids,
> +		   .pm = &fp9931_pm_ops,
> +	},
> +	.probe = fp9931_probe,
> +};
> +
> +module_i2c_driver(fp9931_i2c_driver);
> +
> +/* Module information */
> +MODULE_DESCRIPTION("FP9931 regulator driver");
> +MODULE_LICENSE("GPL");
> +
> 

