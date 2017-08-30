Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56580 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbdH3B5M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 21:57:12 -0400
Date: Tue, 29 Aug 2017 18:56:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us
Subject: Re: [v1,1/2] hwmon: Driver for Maxim MAX6621 temperature sensor
Message-ID: <20170830015633.GA20234@roeck-us.net>
References: <1504039609-152485-2-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504039609-152485-2-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 29, 2017 at 08:46:48PM +0000, Vadim Pasternak wrote:
> MAX6621 is a PECI-to-I2C translator provides an efficient, low-cost
> solution for PECI-to-SMBus/I2C protocol conversion. It allows reading the
> temperature from the PECI-compliant host directly from up to four
> PECI-enabled CPUs.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/hwmon/Kconfig   |  14 ++
>  drivers/hwmon/Makefile  |   1 +
>  drivers/hwmon/max6621.c | 531 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 546 insertions(+)
>  create mode 100644 drivers/hwmon/max6621.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5b9a61f..325d161 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -855,6 +855,20 @@ tristate "MAX31722 temperature sensor"
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31722.
>  
> +config SENSORS_MAX6621
> +	tristate "Maxim MAX6621 sensor chip"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for MAX6621 sensor chip.
> +	  MAX6621 is a PECI-to-I2C translator provides an efficient,
> +	  low-cost solution for PECI-to-SMBus/I2C protocol conversion.
> +	  It allows reading the temperature from the PECI-compliant
> +	  host directly from up to four PECI-enabled CPUs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max6621.
> +
>  config SENSORS_MAX6639
>  	tristate "Maxim MAX6639 sensor chip"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4641a9..43333cb 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -116,6 +116,7 @@ obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
>  obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
>  obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
> +obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
>  obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
>  obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
>  obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> new file mode 100644
> index 0000000..5fba162
> --- /dev/null
> +++ b/drivers/hwmon/max6621.c
> @@ -0,0 +1,531 @@
> +/*
> + * Hardware monitoring driver for Naxim MAX6621
> + *
> + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>

Alphabetic order, please.

> +
> +#define MAX6621_DRV_NAME		"max6621"
> +#define MAX6621_CHAN_NOT_CONNECTED	-255
> +#define MAX6621_TEMP_INPUT_REG_NUM	9
> +#define MAX6621_TEMP_INPUT_MIN		-20
> +#define MAX6621_TEMP_INPUT_MAX		120
> +
> +#define MAX6621_TEMP_S0D0_REG		0x00
> +#define MAX6621_TEMP_S0D1_REG		0x01
> +#define MAX6621_TEMP_S1D0_REG		0x02
> +#define MAX6621_TEMP_S1D1_REG		0x03
> +#define MAX6621_TEMP_S2D0_REG		0x04
> +#define MAX6621_TEMP_S2D1_REG		0x05
> +#define MAX6621_TEMP_S3D0_REG		0x06
> +#define MAX6621_TEMP_S3D1_REG		0x07
> +#define MAX6621_TEMP_MAX_REG		0x08
> +#define MAX6621_TEMP_ALERT_CAUSE	0x0b
> +#define MAX6621_TEMP_MAX_ADDR_REG	0x0a
> +#define MAX6621_CONFIG0_REG		0x0c
> +#define MAX6621_CONFIG1_REG		0x0d
> +#define MAX6621_CONFIG2_REG		0x0e
> +#define MAX6621_CONFIG3_REG		0x0f
> +#define MAX6621_TEMP_S0_ALERT_REG	0x10
> +#define MAX6621_TEMP_S1_ALERT_REG	0x11
> +#define MAX6621_TEMP_S2_ALERT_REG	0x12
> +#define MAX6621_TEMP_S3_ALERT_REG	0x13
> +#define MAX6621_CLEAR_ALERT_REG		0x15
> +#define MAX6621_REG_MAX			(MAX6621_CLEAR_ALERT_REG + 1)
> +#define MAX6621_REG_TEMP_SHIFT		0x06
> +#define MAX6621_TEMP_ACTIVATION_POINT	0x1a40 /* 2's complement of 105 Cel */
> +
> +#define MAX6621_ENABLE_TEMP_ALERTS_BIT	4
> +#define MAX6621_ENABLE_I2C_CRC_BIT	5
> +#define MAX6621_ENABLE_ALTERNATE_DATA	6
> +#define MAX6621_ENABLE_LOCKUP_TO	7
> +#define MAX6621_ENABLE_S0D0_BIT		8
> +#define MAX6621_ENABLE_S0D1_BIT		9
> +#define MAX6621_ENABLE_S1D0_BIT		10
> +#define MAX6621_ENABLE_S1D1_BIT		11
> +#define MAX6621_ENABLE_S2D0_BIT		12
> +#define MAX6621_ENABLE_S2D1_BIT		13
> +#define MAX6621_ENABLE_S3D0_BIT		14
> +#define MAX6621_ENABLE_S3D1_BIT		15
> +#define MAX6621_ENABLE_TEMP_ALL		GENMASK(MAX6621_ENABLE_S3D1_BIT, \
> +						MAX6621_ENABLE_S0D0_BIT)

requires include of bitops.h.

> +#define MAX6621_POLL_DELAY_MASK		0x5
> +#define MAX6621_CONFIG0_INIT		(MAX6621_ENABLE_TEMP_ALL | \
> +					 BIT(MAX6621_ENABLE_LOCKUP_TO) | \
> +					 BIT(MAX6621_ENABLE_I2C_CRC_BIT) | \
> +					 MAX6621_POLL_DELAY_MASK)
> +
> +/* Error codes */
> +#define MAX6621_TRAN_FAILED	0x8100	/*
> +					 * PECI transaction failed for more
> +					 * than the configured number of
> +					 * consecutive retries.
> +					 */
> +#define MAX6621_POOL_DIS	0x8101	/*
> +					 * Polling disabled for requested
> +					 * socket/domain.
> +					 */
> +#define MAX6621_POOL_UNCOMPLETE	0x8102	/*
> +					 * First poll not yet completed for
> +					 * requested socket/domain (on
> +					 * startup).
> +					 */
> +#define MAX6621_SD_DIS		0x8103	/*
> +					 * Read maximum temperature requested,
> +					 * but no sockets/domains enabled or
> +					 * all enabled sockets/domains have
> +					 * errors; or read maximum temperature
> +					 * address requested, but read maximum
> +					 * temperature was not called.
> +					 */
> +#define MAX6621_ALERT_DIS	0x8104	/*
> +					 * Get alert socket/domain requested,
> +					 * but no alert active.
> +					 */
> +#define MAX6621_PECI_ERR_MIN	0x8000	/* Intel spec PECI error min value. */
> +#define MAX6621_PECI_ERR_MAX	0x80ff	/* Intel spec PECI error max value. */
> +
> +#define MAX6621_REG_NON_WRITEABLE_REG	(MAX6621_TEMP_S0D0_REG | \
> +					 MAX6621_TEMP_S0D1_REG | \
> +					 MAX6621_TEMP_S1D0_REG | \
> +					 MAX6621_TEMP_S1D1_REG | \
> +					 MAX6621_TEMP_S2D0_REG | \
> +					 MAX6621_TEMP_S2D1_REG | \
> +					 MAX6621_TEMP_S3D0_REG | \
> +					 MAX6621_TEMP_S3D1_REG | \
> +					 MAX6621_TEMP_MAX_REG | \
> +					 MAX6621_TEMP_MAX_ADDR_REG)

This logical or of registers doesn't make sense to me.

> +
> +static const u32 max6621_temp_regs[] = {
> +	MAX6621_TEMP_MAX_REG, MAX6621_TEMP_S0D0_REG, MAX6621_TEMP_S1D0_REG,
> +	MAX6621_TEMP_S2D0_REG, MAX6621_TEMP_S3D0_REG, MAX6621_TEMP_S0D1_REG,
> +	MAX6621_TEMP_S1D1_REG, MAX6621_TEMP_S2D1_REG, MAX6621_TEMP_S3D1_REG,
> +};
> +
> +static const char *const max6621_temp_labels[] = {
> +	"maximum",
> +	"socket0_domain0",
> +	"socket0_domain1",
> +	"socket1_domain0",
> +	"socket1_domain1",
> +	"socket2_domain0",
> +	"socket2_domain1",
> +	"socket3_domain0",
> +	"socket3_domain1",

Are those labels really useful ?

> +};
> +
> +static const int max6621_temp_alert_chan2reg[] = {
> +	MAX6621_CLEAR_ALERT_REG,
> +	MAX6621_TEMP_S0_ALERT_REG,
> +	MAX6621_TEMP_S0_ALERT_REG,
> +	MAX6621_TEMP_S1_ALERT_REG,
> +	MAX6621_TEMP_S1_ALERT_REG,
> +	MAX6621_TEMP_S2_ALERT_REG,
> +	MAX6621_TEMP_S2_ALERT_REG,
> +	MAX6621_TEMP_S3_ALERT_REG,
> +	MAX6621_TEMP_S3_ALERT_REG,
> +};
> +
> +/**
> + * struct max6621_data - private data:
> + *
> + * @client: I2C client;
> + * @regmap: register map handle;
> + * @temp_offset: offset that is added to all temperature return;
> + * @temp_min: minimum temperature value;
> + * @temp_max: maximum temperature value;
> + * @temp_reset_history: clear alert counter;
> + * @input_chan2reg: mapping from channel to register;
> + */
> +struct max6621_data {
> +	struct i2c_client	*client;
> +	struct regmap		*regmap;
> +	u16			temp_offset;
> +	int			temp_min;
> +	int			temp_max;
> +	u32			temp_reset_history;

limit attributes are only supposed to be provided if the chip supports it.
Resetting the history only makes sense if the chip actually keeps a history.
Please drop.

> +	int			input_chan2reg[MAX6621_TEMP_INPUT_REG_NUM + 1];
> +};
> +
> +static umode_t
> +max6621_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
> +		   int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +			return 0444;
> +		case hwmon_temp_label:
> +		case hwmon_temp_offset:
> +			return 0644;
> +		case hwmon_temp_fault:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_temp_reset_history:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max6621_verify_reg_data(struct device *dev, int regval)
> +{
> +	if ((regval >= MAX6621_PECI_ERR_MIN) && (regval <=
> +	    MAX6621_PECI_ERR_MAX)) {

Please no unnecessary ( ).

> +		dev_dbg(dev, "PECI error code - err 0x%04x.\n",
> +			regval);
> +		return -EINVAL;
> +	}
> +
> +	switch (regval) {
> +	case MAX6621_TRAN_FAILED:
> +		dev_dbg(dev, "PECI transaction failed - err 0x%04x.\n",
> +			regval);
> +		return -EINVAL;
> +	case MAX6621_POOL_DIS:
> +		dev_dbg(dev, "Polling disabled - err 0x%04x.\n", regval);
> +		break;
> +	case MAX6621_POOL_UNCOMPLETE:
> +		dev_dbg(dev, "First poll not completed on startup - err 0x%04x.\n",
> +			regval);
> +		return -EINVAL;
> +	case MAX6621_SD_DIS:
> +		dev_dbg(dev, "Resource is disabled - err 0x%04x.\n", regval);
> +		break;
> +	case MAX6621_ALERT_DIS:
> +		dev_dbg(dev, "No alert active - err 0x%04x.\n", regval);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return regval;

This can return MAX6621_POOL_DIS, MAX6621_SD_DIS, or MAX6621_ALERT_DIS,
all of which are interpreted as errors but not negative. Are you sure this
is what you want ?

> +}
> +
> +static int
> +max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	     int channel, long *val)
> +{
> +	struct max6621_data *data = dev_get_drvdata(dev);
> +	int regval, reg;
> +	s8 temp;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			reg = data->input_chan2reg[channel];
> +			if (reg < 0) {
> +				/* channel is not connected */
> +				*val = MAX6621_CHAN_NOT_CONNECTED;

Odd value to return. -0.255 degrees C ? Wouldn't it be better to not report
those channels at all ?

> +				return 0;
> +			}
> +
> +			ret = regmap_read(data->regmap, reg, &regval);

regval is int, regmap_read() expects unsigned int.

> +			if (ret)
> +				return ret;
> +			ret = max6621_verify_reg_data(dev, regval);
> +			if (ret)
> +				return ret;
> +
> +			temp = (regval >> MAX6621_REG_TEMP_SHIFT);
> +			*val = temp * 1000;
> +			break;
> +		case hwmon_temp_offset:
> +			*val = data->temp_offset >> MAX6621_REG_TEMP_SHIFT;

Is that correct ? The temperature offset is supposed to be in milli-degrees C.

> +			break;
> +		case hwmon_temp_min:
> +			*val = data->temp_min;
> +			break;
> +		case hwmon_temp_max:
> +			*val = data->temp_max;
> +			break;
> +		case hwmon_temp_fault:
> +			/* If channel is 0 - read alert cause reg. */
> +			if (!channel)
> +				reg = MAX6621_TEMP_ALERT_CAUSE;
> +			else
> +				reg = max6621_temp_alert_chan2reg[channel];

This is odd. The attribute is supposed to return 1 if there is a fault,
0 otherwise. Yet, you are using the attribute to report an actual temperature
unless I misunderstand the datasheet.
If anything, the alert temperatures should be reported (and set) as
tempX_max or tempX_crit, but not as fault flags.

Also, "fault" refers to a fault, ie chip failure, not to a high temperature
alarm. What you are looking for is tempX_max_alarm or tempX_crit_alarm,
not tempX_fault. Again, those are booleans, not values.

> +			ret = regmap_read(data->regmap, reg, &regval);
> +			if (ret)
> +				return ret;
> +			ret = max6621_verify_reg_data(dev, regval);
> +			if (ret < 0)
> +				return ret;
> +
> +			*val = regval;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_temp_reset_history:
> +			*val = data->temp_reset_history;

This is supposed to be written to reset the history. The chip does not support
history registers, so please drop.

> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6621_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	      int channel, long val)
> +{
> +	struct max6621_data *data = dev_get_drvdata(dev);
> +	int reg;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_offset:
> +			val <<= MAX6621_REG_TEMP_SHIFT;

Same problem as before; this is supposed to be written in milli-degrees C.
Also, you'll have to make sure that writes don't overflow.

> +			if (data->temp_offset != val) {
> +				data->temp_offset = val;
> +				return regmap_write(data->regmap,
> +						    MAX6621_CONFIG2_REG, val);
> +			}
> +			return 0;
> +		case hwmon_temp_fault:
> +			reg = max6621_temp_alert_chan2reg[channel];
> +			if (reg == MAX6621_CLEAR_ALERT_REG) {
> +				data->temp_reset_history++;

This is not a proper use of the reset_history attribute.

> +				return i2c_smbus_write_byte(data->client, reg);

How is this different to the regmap_write below ?

> +			}
> +			return regmap_write(data->regmap, reg, val);
> +		case hwmon_temp_min:
> +			data->temp_min = val;
> +			return 0;
> +		case hwmon_temp_max:
> +			data->temp_max = val;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_temp_reset_history:
> +			data->temp_reset_history = val;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int
> +max6621_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +		    int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			*str = max6621_temp_labels[channel];
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct regmap_config max6621_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = MAX6621_REG_MAX,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static u32 max6621_chip_config[] = {
> +	HWMON_C_TEMP_RESET_HISTORY | HWMON_C_REGISTER_TZ,
> +	0
> +};
> +
> +static const struct hwmon_channel_info max6621_chip = {
> +	.type = hwmon_chip,
> +	.config = max6621_chip_config,
> +};
> +
> +static const u32 max6621_temp_config[] = {
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL | HWMON_T_OFFSET,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_FAULT |
> +	HWMON_T_LABEL,
> +	0
> +};
> +
> +static const struct hwmon_channel_info max6621_temp = {
> +	.type = hwmon_temp,
> +	.config = max6621_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *max6621_info[] = {
> +	&max6621_chip,
> +	&max6621_temp,
> +	NULL
> +};
> +
> +static const struct hwmon_ops max6621_hwmon_ops = {
> +	.read = max6621_read,
> +	.write = max6621_write,
> +	.read_string = max6621_read_string,
> +	.is_visible = max6621_is_visible,
> +};
> +
> +static const struct hwmon_chip_info max6621_chip_info = {
> +	.ops = &max6621_hwmon_ops,
> +	.info = max6621_info,
> +};
> +
> +static int max6621_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct max6621_data *data;
> +	struct device *hwmon_dev;
> +	int i;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &max6621_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	i2c_set_clientdata(client, data);
> +	data->client = client;
> +
> +	/* Set CONFIG0 register masking temperature alerts and PEC. */
> +	ret = regmap_write(data->regmap, MAX6621_CONFIG0_REG,
> +			   MAX6621_CONFIG0_INIT);
> +	if (ret)
> +		return ret;
> +
> +	/* Set CONFIG2 register to activation point. */
> +	data->temp_offset = MAX6621_TEMP_ACTIVATION_POINT;

Isn't that a bit random ? I think it should be better left to user space
to initialize this register.

> +	ret = regmap_write(data->regmap, MAX6621_CONFIG2_REG,
> +			   data->temp_offset);
> +	if (ret)
> +		return ret;
> +
> +	/* Verify which temperature input registers are enabled. */
> +	for (i = 0; i < MAX6621_TEMP_INPUT_REG_NUM; i++) {
> +		ret = i2c_smbus_read_word_data(client, max6621_temp_regs[i]);
> +		if (ret < 0)
> +			return ret;
> +		ret = max6621_verify_reg_data(dev, ret);
> +		if (ret) {
> +			data->input_chan2reg[i] = -1;
> +			continue;
> +		}
> +
> +		data->input_chan2reg[i] = max6621_temp_regs[i];
> +	}
> +
> +	data->temp_min = MAX6621_TEMP_INPUT_MIN;
> +	data->temp_max = MAX6621_TEMP_INPUT_MAX;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &max6621_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id max6621_id[] = {
> +	{ MAX6621_DRV_NAME, 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max6621_id);
> +
> +static const struct of_device_id max6621_of_match[] = {
> +	{ .compatible = "maxim,max6621" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max6621_of_match);
> +
> +static struct i2c_driver max6621_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = MAX6621_DRV_NAME,
> +		.of_match_table = of_match_ptr(max6621_of_match),
> +	},
> +	.probe		= max6621_probe,
> +	.id_table	= max6621_id,
> +};
> +
> +module_i2c_driver(max6621_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> +MODULE_DESCRIPTION("Driver for Maxim MAX6621");
> +MODULE_LICENSE("GPL");
