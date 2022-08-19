Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA83C32771
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Aug 2022 13:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349426AbiHSNxG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Aug 2022 09:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349017AbiHSNxF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2022 09:53:05 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCF8FF235
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Aug 2022 06:53:02 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y141so4382029pfb.7
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Aug 2022 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=Cp5kNDD3QCHIPsixgO+RNyxn+R9/KH/FmXPEds+7Glk=;
        b=mj0UrthCRszD+l8cpK7qNJGmouc47Cx9WBA6+cJqHFXxh9HtDU12oEekxVkPPt4l6J
         /drebtZvYVUFE0OcgPutQpG/WcWwdot6GG74Cg7CcOmepMbHNBgz69I0CjKmeZKg6ZWT
         1xguZCowyzW5s4vbEhQYFf7lcy6suUNmXWJq1XuPjx6LNrepBeEQXTJTvgKWmOHK1jPP
         5fBhvpCMiNBcR2Fg8nZU2tvLin87PRDLoKOAa5YS2cG2j5PZsKSSNds7tObc3gqvlMrz
         LkWu2ST2wJxMCO9JAeDfijzBevl9I4lK34Egym+iJt41piX6x0gIMzUCM6U1M5rMCjwW
         CDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=Cp5kNDD3QCHIPsixgO+RNyxn+R9/KH/FmXPEds+7Glk=;
        b=w8v9go7QgSTxK1NcTxys19oJjEBm7hq13bifdeUu0KvlERMYvDXm4cYtiaRSHsfw61
         fX7SZOIjacJhkZsg4u1PJx/ejb3uf/GM7x/EDqP66WYdRjiDnaMavDKNZ19OQPGafZ3F
         4hZjIBpJvN8V/rQk20AuvQsilwpXE8GvXSp1cTWkYL/ejLteTTtLcrA8XAg83RjYJe8m
         DNkPSWqwBgLzNs00Tm+m02Ex32PIHfILsHd3Nt36naBk9ahMdX5sWanjTD37iC1gSUXF
         dD5NXmCBSmFrQZpHezXElJDWDiLbqO60KadTPWlQCjhds6IJKHTDVQo0QTrd+YycSQzH
         EBuw==
X-Gm-Message-State: ACgBeo1sgW1EirB8yoY5orLgXNXtEwinE60pqEYCfHPeO32ukgZna7Q/
        qpi8QPoAehwAcP7Wd3sU9bniuLc/5YM=
X-Google-Smtp-Source: AA6agR41VtiRBqMpY9jmooq9q/Owve35lvhmeNU3k+abk5xe6IEVgGbs+qYw0H9ESCeSY8ArcQYkiw==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id k8-20020a056a00168800b00517cf7b9293mr8013559pfc.7.1660917182243;
        Fri, 19 Aug 2022 06:53:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902f60c00b0017292073839sm3216822plg.178.2022.08.19.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:53:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 Aug 2022 06:53:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        Nurettin Bolucu <Nurettin.Bolucu@analog.com>
Subject: Re: [PATCH v3 1/2] drivers: hwmon: Add max31760 fan speed controller
 driver
Message-ID: <20220819135300.GA3109408@roeck-us.net>
References: <20220808080931.104-1-Ibrahim.Tilki@analog.com>
 <20220808080931.104-2-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808080931.104-2-Ibrahim.Tilki@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Aug 08, 2022 at 08:09:30AM +0000, Ibrahim Tilki wrote:
> MAX31760 is a precision fan speed controller with nonvolatile lookup table.
> Device has one internal and one external temperature sensor support.
> Controls two fans and measures their speeds.
> Generates hardware alerts when programmable max and critical temperatures are exceeded.
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> Reviewed-by: Nurettin Bolucu <Nurettin.Bolucu@analog.com>
> ---
>  drivers/hwmon/Kconfig    |  10 +
>  drivers/hwmon/Makefile   |   1 +
>  drivers/hwmon/max31760.c | 599 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 610 insertions(+)
>  create mode 100644 drivers/hwmon/max31760.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e70d9614b..513113497 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1066,6 +1066,16 @@ config SENSORS_MAX31730
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31730.
>  
> +config SENSORS_MAX31760
> +	tristate "MAX31760 fan speed controller"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Support for the Analog Devices MAX31760 Fan Speed Controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max31760.
> +
>  config SENSORS_MAX6620
>  	tristate "Maxim MAX6620 fan controller"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 007e829d1..1c0fa4dd8 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -140,6 +140,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
>  obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
>  obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
> +obj-$(CONFIG_SENSORS_MAX31760)  += max31760.o
>  obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
>  obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
>  obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
> diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
> new file mode 100644
> index 000000000..dbb99d5d9
> --- /dev/null
> +++ b/drivers/hwmon/max31760.c
> @@ -0,0 +1,599 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/util_macros.h>
> +
> +#define REG_CR1		0x00
> +#define CR1_HYST	BIT(5)
> +#define CR1_DRV		GENMASK(4, 3)
> +#define CR1_TEMP_SRC	GENMASK(1, 0)
> +#define REG_CR2		0x01
> +#define CR2_STBY	BIT(7)
> +#define CR2_ALERTS	BIT(6)
> +#define CR2_DFC		BIT(0)
> +#define REG_CR3		0x02
> +#define REG_PWMR	0x50
> +#define REG_PWMV	0x51
> +#define REG_STATUS	0x5A
> +#define STATUS_ALARM_CRIT(ch)	BIT(2 + 2 * (ch))
> +#define STATUS_ALARM_MAX(ch)	BIT(3 + 2 * (ch))
> +#define STATUS_RDFA		BIT(6)
> +
> +#define REG_TACH(ch)		(0x52 + (ch) * 2)
> +#define REG_TEMP_INPUT(ch)	(0x56 + (ch) * 2)
> +#define REG_TEMP_MAX(ch)	(0x06 + (ch) * 2)
> +#define REG_TEMP_CRIT(ch)	(0x0A + (ch) * 2)
> +
> +#define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
> +#define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
> +							     127875), 125) * 32)
> +
> +#define LUT_SIZE	48
> +
> +#define REG_LUT(index)		(0x20 + (index))
> +
> +struct max31760_state {
> +	struct regmap *regmap;
> +
> +	struct lut_attribute {
> +		char name[24];
> +		struct sensor_device_attribute sda;
> +	} lut[LUT_SIZE];
> +
> +	struct attribute *attrs[LUT_SIZE + 2];
> +	struct attribute_group group;
> +	const struct attribute_group *groups[2];
> +};
> +
> +static bool max31760_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return reg > 0x50;
> +}
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x5B,
> +	.cache_type = REGCACHE_RBTREE,
> +	.volatile_reg = max31760_volatile_reg,
> +};
> +
> +static const int max31760_pwm_freq[] = {33, 150, 1500, 25000};
> +
> +static int tach_to_rpm(u16 tach)
> +{
> +	if (tach == 0)
> +		tach = 1;
> +
> +	return 60 * 100000 / tach / 2;
> +}
> +
> +static int max31760_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	unsigned int reg_temp;
> +	s16 temp;
> +	u8 reg[2];
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_fault:
> +			ret = regmap_read(state->regmap, REG_STATUS, &regval);
> +			if (ret)
> +				return ret;
> +
> +			*val = FIELD_GET(STATUS_RDFA, regval);
> +
> +			return 0;
> +		case hwmon_temp_max_alarm:
> +			ret = regmap_read(state->regmap, REG_STATUS, &regval);
> +			if (ret)
> +				return ret;
> +
> +			if (channel)
> +				*val = FIELD_GET(STATUS_ALARM_MAX(1), regval);
> +			else
> +				*val = FIELD_GET(STATUS_ALARM_MAX(0), regval);
> +
> +			return 0;
> +		case hwmon_temp_crit_alarm:
> +			ret = regmap_read(state->regmap, REG_STATUS, &regval);
> +			if (ret)
> +				return ret;
> +
> +			if (channel)
> +				*val = FIELD_GET(STATUS_ALARM_CRIT(1), regval);
> +			else
> +				*val = FIELD_GET(STATUS_ALARM_CRIT(0), regval);
> +
> +			return 0;
> +		case hwmon_temp_input:
> +			reg_temp = REG_TEMP_INPUT(channel);
> +			break;
> +		case hwmon_temp_max:
> +			reg_temp = REG_TEMP_MAX(channel);
> +			break;
> +		case hwmon_temp_crit:
> +			reg_temp = REG_TEMP_CRIT(channel);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		ret = regmap_bulk_read(state->regmap, reg_temp, reg, 2);
> +		if (ret)
> +			return ret;
> +
> +		temp = (reg[0] << 8) | reg[1];
> +
> +		*val = TEMP11_FROM_REG(temp);
> +
> +		return 0;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			ret = regmap_bulk_read(state->regmap, REG_TACH(channel), reg, 2);
> +			if (ret)
> +				return ret;
> +
> +			*val = tach_to_rpm(reg[0] * 256 + reg[1]);
> +
> +			return 0;
> +		case hwmon_fan_fault:
> +			ret = regmap_read(state->regmap, REG_STATUS, &regval);
> +			if (ret)
> +				return ret;
> +
> +			if (channel)
> +				*val = FIELD_GET(BIT(1), regval);
> +			else
> +				*val = FIELD_GET(BIT(0), regval);
> +
> +			return 0;
> +		case hwmon_fan_enable:
> +			ret = regmap_read(state->regmap, REG_CR3, &regval);
> +			if (ret)
> +				return ret;
> +
> +			if (channel)
> +				*val = FIELD_GET(BIT(1), regval);
> +			else
> +				*val = FIELD_GET(BIT(0), regval);
> +
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = regmap_read(state->regmap, REG_PWMV, &regval);
> +			if (ret)
> +				return ret;
> +
> +			*val = regval;
> +
> +			return 0;
> +		case hwmon_pwm_freq:
> +			ret = regmap_read(state->regmap, REG_CR1, &regval);
> +			if (ret)
> +				return ret;
> +
> +			regval = FIELD_GET(CR1_DRV, regval);
> +			if (regval >= ARRAY_SIZE(max31760_pwm_freq))
> +				return -EINVAL;
> +
> +			*val = max31760_pwm_freq[regval];
> +
> +			return 0;
> +		case hwmon_pwm_enable:
> +			ret = regmap_read(state->regmap, REG_CR2, &regval);
> +			if (ret)
> +				return ret;
> +
> +			*val = 2 - FIELD_GET(CR2_DFC, regval);
> +
> +			return 0;
> +		case hwmon_pwm_auto_channels_temp:
> +			ret = regmap_read(state->regmap, REG_CR1, &regval);
> +			if (ret)
> +				return ret;
> +
> +			switch (FIELD_GET(CR1_TEMP_SRC, regval)) {
> +			case 0:
> +				*val = 2;
> +				break;
> +			case 1:
> +				*val = 1;
> +				break;
> +			case 2:
> +			case 3:
> +				*val = 3;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max31760_write(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long val)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int pwm_index;
> +	unsigned int reg_temp;
> +	int temp;
> +	u8 reg_val[2];
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			reg_temp = REG_TEMP_MAX(channel);
> +			break;
> +		case hwmon_temp_crit:
> +			reg_temp = REG_TEMP_CRIT(channel);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		temp = TEMP11_TO_REG(val);
> +		reg_val[0] = temp >> 8;
> +		reg_val[1] = temp & 0xFF;
> +
> +		return regmap_bulk_write(state->regmap, reg_temp, reg_val, 2);
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_enable:
> +			if (val == 0)
> +				return regmap_clear_bits(state->regmap, REG_CR3, BIT(channel));
> +
> +			if (val == 1)
> +				return regmap_set_bits(state->regmap, REG_CR3, BIT(channel));
> +
> +			return -EOPNOTSUPP;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			if (val < 0 || val > 255)
> +				return -EINVAL;
> +
> +			return regmap_write(state->regmap, REG_PWMR, val);
> +		case hwmon_pwm_enable:
> +			if (val == 1)
> +				return regmap_set_bits(state->regmap, REG_CR2, CR2_DFC);
> +
> +			if (val == 2)
> +				return regmap_clear_bits(state->regmap, REG_CR2, CR2_DFC);
> +
> +			return -EOPNOTSUPP;
> +		case hwmon_pwm_freq:
> +			pwm_index = find_closest(val, max31760_pwm_freq,
> +						 ARRAY_SIZE(max31760_pwm_freq));
> +
> +			return regmap_update_bits(state->regmap,
> +						  REG_CR1, CR1_DRV,
> +						  FIELD_PREP(CR1_DRV, pwm_index));
> +		case hwmon_pwm_auto_channels_temp:
> +			switch (val) {
> +			case 1:
> +				break;
> +			case 2:
> +				val = 0;
> +				break;
> +			case 3:
> +				val = 2;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +
> +			return regmap_update_bits(state->regmap, REG_CR1, CR1_TEMP_SRC, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *max31760_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE,
> +			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ENABLE),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT |
> +			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_ENABLE | HWMON_PWM_FREQ | HWMON_PWM_INPUT |
> +			   HWMON_PWM_AUTO_CHANNELS_TEMP),
> +	NULL
> +};
> +
> +static umode_t max31760_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_max_alarm:
> +		case hwmon_temp_crit_alarm:
> +		case hwmon_temp_fault:
> +		case hwmon_temp_label:
> +			return 0444;
> +		case hwmon_temp_max:
> +		case hwmon_temp_crit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +		case hwmon_fan_fault:
> +			return 0444;
> +		case hwmon_fan_enable:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +		case hwmon_pwm_input:
> +		case hwmon_pwm_freq:
> +		case hwmon_pwm_auto_channels_temp:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +int max31760_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_label)
> +			return -EOPNOTSUPP;
> +
> +		*str = channel ? "local" : "remote";
> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops max31760_hwmon_ops = {
> +	.is_visible = max31760_is_visible,
> +	.read = max31760_read,
> +	.write = max31760_write,
> +	.read_string = max31760_read_string
> +};
> +
> +static const struct hwmon_chip_info max31760_chip_info = {
> +	.ops = &max31760_hwmon_ops,
> +	.info = max31760_info,
> +};
> +
> +static ssize_t lut_show(struct device *dev,
> +			struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *sda = to_sensor_dev_attr(devattr);
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(state->regmap, REG_LUT(sda->index), &regval);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", regval);

Please use sysfs_emit().

> +}
> +
> +static ssize_t lut_store(struct device *dev,
> +			 struct device_attribute *devattr,
> +			 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sda = to_sensor_dev_attr(devattr);
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int pwm;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 10, &pwm);
> +	if (ret)
> +		return ret;

You could use kstrtou8() to avoid the range check below.

> +
> +	if (pwm > 255)
> +		return -EINVAL;
> +
> +	ret = regmap_write(state->regmap, REG_LUT(sda->index), pwm);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t pwm1_auto_point_temp_hyst_show(struct device *dev,
> +					      struct device_attribute *attr,
> +					      char *buf)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int ret;
> +
> +	ret = regmap_read(state->regmap, REG_CR1, &regval);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", (1 + (int)FIELD_GET(CR1_HYST, regval)) * 2000);

Please use sysfs_emit().

> +}
> +
> +static ssize_t pwm1_auto_point_temp_hyst_store(struct device *dev,
> +					       struct device_attribute *attr,
> +					       const char *buf,
> +					       size_t count)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int hyst;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 10, &hyst);
> +	if (ret)
> +		return ret;
> +
> +	if (hyst == 2000)
> +		ret = regmap_clear_bits(state->regmap, REG_CR1, CR1_HYST);
> +	else if (hyst == 4000)
> +		ret = regmap_set_bits(state->regmap, REG_CR1, CR1_HYST);
> +	else
> +		return -EINVAL;

I would suggest to use a closest match here. Something like

	if (hyst < 3000)
		ret = regmap_clear_bits(state->regmap, REG_CR1, CR1_HYST);
	else
		ret = regmap_set_bits(state->regmap, REG_CR1, CR1_HYST);

This way the user does not have to know the exact acceptable values.

> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(pwm1_auto_point_temp_hyst);
> +
> +static void max31760_create_lut_nodes(struct max31760_state *state)
> +{
> +	int i;
> +	struct sensor_device_attribute *sda;
> +	struct lut_attribute *lut;
> +
> +	for (i = 0; i < LUT_SIZE; ++i) {
> +		lut = &state->lut[i];
> +		sda = &lut->sda;
> +
> +		snprintf(lut->name, sizeof(lut->name),
> +			 "pwm1_auto_point%d_pwm", i + 1);
> +
> +		sda->dev_attr.attr.mode = 0644;
> +		sda->index = i;
> +		sda->dev_attr.show = lut_show;
> +		sda->dev_attr.store = lut_store;
> +		sda->dev_attr.attr.name = lut->name;
> +
> +		sysfs_attr_init(&sda->dev_attr.attr);
> +
> +		state->attrs[i] = &sda->dev_attr.attr;
> +	}
> +
> +	state->attrs[i] = &dev_attr_pwm1_auto_point_temp_hyst.attr;
> +
> +	state->group.attrs = state->attrs;
> +	state->groups[0] = &state->group;
> +}
> +
> +static int max31760_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct max31760_state *state;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	state = devm_kzalloc(dev, sizeof(struct max31760_state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->regmap = devm_regmap_init_i2c(client, &regmap_config);
> +	if (IS_ERR(state->regmap))
> +		return dev_err_probe(dev,
> +				     PTR_ERR(state->regmap),
> +				     "regmap initialization failed\n");
> +
> +	dev_set_drvdata(dev, state);
> +
> +	/* Set alert output to comparator mode */
> +	ret = regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "cannot write register\n");
> +
> +	max31760_create_lut_nodes(state);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 state,
> +							 &max31760_chip_info,
> +							 state->groups);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id max31760_of_match[] = {
> +	{.compatible = "adi,max31760"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max31760_of_match);
> +
> +static const struct i2c_device_id max31760_id[] = {
> +	{"max31760"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max31760_id);
> +
> +static int __maybe_unused max31760_suspend(struct device *dev)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +
> +	return regmap_set_bits(state->regmap, REG_CR2, CR2_STBY);
> +}
> +
> +static int __maybe_unused max31760_resume(struct device *dev)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +
> +	return regmap_clear_bits(state->regmap, REG_CR2, CR2_STBY);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(max31760_pm_ops, max31760_suspend, max31760_resume);
> +
> +static struct i2c_driver max31760_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "max31760",
> +		.of_match_table = of_match_ptr(max31760_of_match),
> +		.pm = pm_ptr(&max31760_pm_ops)
> +	},
> +	.probe_new	= max31760_probe,
> +	.id_table	= max31760_id
> +};
> +module_i2c_driver(max31760_driver);
> +
> +MODULE_AUTHOR("Ibrahim Tilki <Ibrahim.Tilki@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices MAX31760 Fan Speed Controller");
> +MODULE_SOFTDEP("pre: regmap_i2c");
> +MODULE_VERSION("1.0");
> +MODULE_LICENSE("GPL");
> -- 
> 2.36.1
> 
