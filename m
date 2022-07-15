Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A07DC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Jul 2022 18:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiGOSRO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Jul 2022 14:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiGOSRN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Jul 2022 14:17:13 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1487A5B781
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Jul 2022 11:17:12 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id g4so5113099pgc.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Jul 2022 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FISI36nN1qJNL1vze1bUn4aG1lij1cZME8/SQggNoW4=;
        b=Zu6Io6Mxnaehzfanv3Uy5LxlzOOYCyNR7iFDqmSNSToS3z1P2J7E/klseQH/yTD5+4
         yyWkoW7qiwrktgYW0uvkK+urSoWKJrqHq2gazd/T6wrOaK7k7xOX8DMcw9/55pIuA0YG
         wUHDC4+UPcpSVCbyuSXeg5ln8Ti+OSleDYRRB7bdQRINUsboqeSKhrTimqwNHTBRdNks
         uj8QYa+zCTvqPft/3LhZzqMU9t5AAr3sqcRtbc6wc691QQJmsLd+9tMu4QDnvY7OboUd
         5VGYTEHvHiXw2UcsBNOJJvXYqpR95Fr5QMONN+8P6AqGHMFYM2ZwhS49bPtZE4nwwI2Y
         w9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=FISI36nN1qJNL1vze1bUn4aG1lij1cZME8/SQggNoW4=;
        b=7dNA9aRbfM2HQ+xudCVSkxd85E1rpdG666yztVkVFEvGUI5uJ0Fj5tWkSsMj+UeH4F
         ASu34UtuxMOOJe8HydqR2UziEl0zn5WveNquFEQI/GqYTbTC4wGJWFO0bW5egeO8NyWi
         JR0pvsjqocP2yEo1JjA4C9qzselO3zw8PyRAaW62sDUk2s0RoUmY+6Uf8b8er5GbUEqQ
         8/7ZDJkChsP2U4SrktqYw9H9kdFMwfP0CqNhaMgjeOJxLW5TNw2U7d+UKjr0kmzAXL8Y
         M2X/ActyS9vXTImR65RZHPRVv3RBn2ohQqsUb6lpLYbblqnmvuxOeUsGpr14asu9S++n
         WFwQ==
X-Gm-Message-State: AJIora/hpC4hndSqkBmfVOGrlnVOlAcCjOC7pPryprlqOdyuuZVhgTet
        LGvvhwiqXsY9jmrEl3OcCzM=
X-Google-Smtp-Source: AGRyM1tjKueiWgiGtJ8wDY2yOMHFdQrI1uxJSZFhVIdhOngj5+xi8l+VoQzcJH9uO65R4JbsRU3RDg==
X-Received: by 2002:a05:6a00:ad0:b0:50a:51b3:1e3d with SMTP id c16-20020a056a000ad000b0050a51b31e3dmr15246675pfl.18.1657909031445;
        Fri, 15 Jul 2022 11:17:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b0016beba9c3e6sm3894601plf.115.2022.07.15.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 11:17:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Jul 2022 11:17:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        Nurettin Bolucu <Nurettin.Bolucu@analog.com>
Subject: Re: [PATCH] drivers: hwmon: Add max31760 fan speed controller driver
Message-ID: <20220715181709.GA3775212@roeck-us.net>
References: <20220704160606.52-1-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704160606.52-1-Ibrahim.Tilki@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 04, 2022 at 04:06:05PM +0000, Ibrahim Tilki wrote:
> MAX31760 is a presicion fan speed controller with nonvolatile lookup table.
> Device has one internal and one external temperature sensor support.
> Controls two fans and measures their speeds.
> Generates hardware alerts when programmable max and critical temperatures are exceeded.
> 
> Driver creates following sysfs attributes for configuring lookup table:
> pwm1_auto_point[1-48]_{pwm,temp,temp_hyst}
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> Reviewed-by: Nurettin Bolucu <Nurettin.Bolucu@analog.com>
> ---
>  drivers/hwmon/Kconfig    |  10 +
>  drivers/hwmon/Makefile   |   1 +
>  drivers/hwmon/max31760.c | 614 +++++++++++++++++++++++++++++++++++++++

Please add doucmentation describing the supported sysfs attributes.

>  3 files changed, 625 insertions(+)
>  create mode 100644 drivers/hwmon/max31760.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 590d3d550..59cc44a5c 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1065,6 +1065,16 @@ config SENSORS_MAX31730
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
> index 000000000..ade3570a8
> --- /dev/null
> +++ b/drivers/hwmon/max31760.c
> @@ -0,0 +1,614 @@
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
> +#define LUT_PWM		0
> +#define LUT_TEMP	1
> +#define LUT_HYST	2
> +
> +#define REG_LUT(index)		(0x20 + (index))
> +
> +struct max31760_state {
> +	struct regmap *regmap;
> +
> +	struct lut_attribute {
> +		char name[32];
> +		struct sensor_device_attribute_2 sda;
> +	} lut[LUT_SIZE][3];
> +
> +	struct attribute *attrs[LUT_SIZE * 3 + 1];
> +	struct attribute_group group;
> +	const struct attribute_group *groups[2];
> +};
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x5B
> +};
> +
> +static const int max31760_pwm_freq[] = {33, 150, 1500, 25000};
> +
> +static int tach_to_rpm(int tach)
> +{
> +	int pulse_per_rev = 2;
> +
> +	return 60 * 100000 / tach / pulse_per_rev;

pulse_per_rev is unnecessary. If anything, make it a define.

> +}
> +
> +static int max31760_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	unsigned int reg_temp;
> +	s16 temp;
> +	s16 temp_hyst = 0;
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
> +		case hwmon_temp_max_hyst:
> +			temp_hyst = 1000;
> +			fallthrough;

Please drop constant attributes; they add no value. Document the hysteresis values
in the driver documentation if you like.

> +		case hwmon_temp_max:
> +			reg_temp = REG_TEMP_MAX(channel);
> +			break;
> +		case hwmon_temp_crit_hyst:
> +			temp_hyst = 10000;
> +			fallthrough;
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
> +		*val = TEMP11_FROM_REG(temp) - temp_hyst;
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
> +	int ret;
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
> +		/* Ensure alert output is in comparator mode */
> +		ret = regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
> +		if (ret)
> +			return ret;
> +
> +		return regmap_bulk_write(state->regmap, reg_temp, reg_val, 2);
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_enable:
> +			if (val)
> +				return regmap_set_bits(state->regmap, REG_CR3, BIT(channel));

There should really be some value checking. "enable" should be well defined,
not "anything but 0".

> +			return regmap_clear_bits(state->regmap, REG_CR3, BIT(channel));
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
> +			if (val == 0)
> +				return -EOPNOTSUPP;
> +
> +			if (val == 1)
> +				return regmap_set_bits(state->regmap, REG_CR2, CR2_DFC);
> +

Accepting all other values ?

> +			return regmap_clear_bits(state->regmap, REG_CR2, CR2_DFC);
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
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT_HYST | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT_ALARM | HWMON_T_FAULT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT_HYST | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT_ALARM | HWMON_T_LABEL),
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
> +		case hwmon_temp_max_hyst:
> +		case hwmon_temp_crit_hyst:
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
> +	struct sensor_device_attribute_2 *sda = to_sensor_dev_attr_2(devattr);
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	int ret;
> +	int temp;
> +	unsigned int regval;
> +
> +	switch (sda->nr) {
> +	case LUT_PWM:
> +		ret = regmap_read(state->regmap, REG_LUT(sda->index), &regval);
> +		if (ret)
> +			return ret;
> +
> +		return sprintf(buf, "%d\n", regval);
> +	case LUT_TEMP:
> +		temp = 18;
> +		break;
> +	case LUT_HYST:
> +		ret = regmap_read(state->regmap, REG_CR1, &regval);
> +		if (ret)
> +			return ret;
> +
> +		temp = 16 - 2 * FIELD_GET(CR1_HYST, regval);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return sprintf(buf, "%d\n", (temp + 2 * sda->index) * 1000);
> +}
> +
> +static ssize_t lut_store(struct device *dev,
> +			 struct device_attribute *devattr,
> +			 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sda = to_sensor_dev_attr_2(devattr);
> +	struct max31760_state *state = dev_get_drvdata(dev);
> +	unsigned int pwm, hyst, temp;
> +	int ret;
> +
> +	switch (sda->nr) {
> +	case LUT_PWM:
> +		ret = kstrtou32(buf, 10, &pwm);
> +		if (ret)
> +			return ret;
> +
> +		pwm = clamp_val(pwm, 0, 255);

pwm values should not be clamped on write. Bad values (outside 0..255) should be rejected.

> +
> +		ret = regmap_write(state->regmap, REG_LUT(sda->index), pwm);
> +		if (ret)
> +			return ret;
> +
> +		break;
> +	case LUT_HYST:
> +		ret = kstrtou32(buf, 10, &hyst);
> +		if (ret)
> +			return ret;
> +
> +		temp = (18 + 2 * sda->index) * 1000;
> +		/* LUT Hysteresis is either 2 or 4 degrees */
> +		if (temp > hyst + 3000)
> +			ret = regmap_set_bits(state->regmap, REG_CR1, CR1_HYST);
> +		else
> +			ret = regmap_clear_bits(state->regmap, REG_CR1, CR1_HYST);
> +
> +		if (ret)
> +			return ret;
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return count;
> +}
> +
> +static void max31760_create_lut_nodes(struct max31760_state *state)
> +{
> +	int i, nr;
> +	struct sensor_device_attribute_2 *sda;
> +	struct lut_attribute *lut;
> +
> +	for (i = 0; i < LUT_SIZE; ++i) {
> +		for (nr = 0; nr < 3; ++nr) {
> +			lut = &state->lut[i][nr];
> +			sda = &lut->sda;
> +
> +			switch (nr) {
> +			case LUT_PWM:
> +				snprintf(lut->name, sizeof(lut->name),
> +					 "pwm1_auto_point%d_pwm", i + 1);
> +				sda->dev_attr.attr.mode = 0644;
> +				break;
> +			case LUT_TEMP:
> +				snprintf(lut->name, sizeof(lut->name),
> +					 "pwm1_auto_point%d_temp", i + 1);
> +				sda->dev_attr.attr.mode = 0444;
> +				break;
> +			case LUT_HYST:
> +				snprintf(lut->name, sizeof(lut->name),
> +					 "pwm1_auto_point%d_temp_hyst", i + 1);
> +				sda->dev_attr.attr.mode = 0644;
> +				break;
> +			}
> +
> +			sda->index = i;
> +			sda->nr = nr;
> +			sda->dev_attr.show = lut_show;
> +			sda->dev_attr.store = lut_store;
> +			sda->dev_attr.attr.name = lut->name;
> +
Call to sysfs_attr_init() is needed.

> +			state->attrs[i * 3 + nr] = &sda->dev_attr.attr;
> +		}
> +	}
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
> +	regmap_set_bits(state->regmap, REG_CR2, CR2_ALERTS);
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
