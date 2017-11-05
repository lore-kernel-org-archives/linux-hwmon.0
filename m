Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:45098 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdKEOIs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Nov 2017 09:08:48 -0500
Date: Sun, 5 Nov 2017 06:08:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4, 2/6] pmbus: Add driver for Maxim MAX31785 Intelligent Fan
 Controller
Message-ID: <20171105140845.GA23722@roeck-us.net>
References: <20171103045306.26448-3-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-3-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 03, 2017 at 03:53:02PM +1100, Andrew Jeffery wrote:
> The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
> management with temperature and remote voltage sensing. Various fan control
> features are provided, including PWM frequency control, temperature hysteresis,
> dual tachometer measurements, and fan health monitoring.
> 
I updated the above text a little to make it more obvious that "are provided"
refers to the chip, not (yet) to the driver.

> This patch presents a basic driver using only the existing features of the
> PMBus subsystem.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to hwmon-next.

> ---
>  Documentation/hwmon/max31785   |  51 ++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig    |  10 ++++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/max31785.c | 116 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 178 insertions(+)
>  create mode 100644 Documentation/hwmon/max31785
>  create mode 100644 drivers/hwmon/pmbus/max31785.c
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> new file mode 100644
> index 000000000000..45fb6093dec2
> --- /dev/null
> +++ b/Documentation/hwmon/max31785
> @@ -0,0 +1,51 @@
> +Kernel driver max31785
> +======================
> +
> +Supported chips:
> +  * Maxim MAX31785, MAX31785A
> +    Prefix: 'max31785' or 'max31785a'
> +    Addresses scanned: -
> +    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> +
> +Author: Andrew Jeffery <andrew@aj.id.au>
> +
> +Description
> +-----------
> +
> +The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
> +management with temperature and remote voltage sensing. Various fan control
> +features are provided, including PWM frequency control, temperature hysteresis,
> +dual tachometer measurements, and fan health monitoring.
> +
> +For dual rotor fan configuration, the MAX31785 exposes the slowest rotor of the
> +two in the fan[1-4]_input attributes.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not probe for PMBus devices. You will have to instantiate
> +devices explicitly.
> +
> +Sysfs attributes
> +----------------
> +
> +fan[1-4]_alarm		Fan alarm.
> +fan[1-4]_fault		Fan fault.
> +fan[1-4]_input		Fan RPM.
> +
> +in[1-6]_crit		Critical maximum output voltage
> +in[1-6]_crit_alarm	Output voltage critical high alarm
> +in[1-6]_input		Measured output voltage
> +in[1-6]_label		"vout[18-23]"
> +in[1-6]_lcrit		Critical minimum output voltage
> +in[1-6]_lcrit_alarm	Output voltage critical low alarm
> +in[1-6]_max		Maximum output voltage
> +in[1-6]_max_alarm	Output voltage high alarm
> +in[1-6]_min		Minimum output voltage
> +in[1-6]_min_alarm	Output voltage low alarm
> +
> +temp[1-11]_crit		Critical high temperature
> +temp[1-11]_crit_alarm	Chip temperature critical high alarm
> +temp[1-11]_input	Measured temperature
> +temp[1-11]_max		Maximum temperature
> +temp[1-11]_max_alarm	Chip temperature high alarm
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 40019325b517..08479006c7f9 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -114,6 +114,16 @@ config SENSORS_MAX20751
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max20751.
>  
> +config SENSORS_MAX31785
> +	tristate "Maxim MAX31785 and compatibles"
> +	default n
> +	help
> +	  If you say yes here you get hardware monitoring support for Maxim
> +	  MAX31785.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called max31785.
> +
>  config SENSORS_MAX34440
>  	tristate "Maxim MAX34440 and compatibles"
>  	default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 459a6be3390e..a8bf0e490db9 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>  obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
>  obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
>  obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
> +obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> new file mode 100644
> index 000000000000..9313849d5160
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -0,0 +1,116 @@
> +/*
> + * Copyright (C) 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include "pmbus.h"
> +
> +enum max31785_regs {
> +	MFR_REVISION		= 0x9b,
> +};
> +
> +#define MAX31785_NR_PAGES		23
> +
> +#define MAX31785_FAN_FUNCS \
> +	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12)
> +
> +#define MAX31785_TEMP_FUNCS \
> +	(PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
> +
> +#define MAX31785_VOUT_FUNCS \
> +	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT)
> +
> +static const struct pmbus_driver_info max31785_info = {
> +	.pages = MAX31785_NR_PAGES,
> +
> +	/* RPM */
> +	.format[PSC_FAN] = direct,
> +	.m[PSC_FAN] = 1,
> +	.b[PSC_FAN] = 0,
> +	.R[PSC_FAN] = 0,
> +	.func[0] = MAX31785_FAN_FUNCS,
> +	.func[1] = MAX31785_FAN_FUNCS,
> +	.func[2] = MAX31785_FAN_FUNCS,
> +	.func[3] = MAX31785_FAN_FUNCS,
> +	.func[4] = MAX31785_FAN_FUNCS,
> +	.func[5] = MAX31785_FAN_FUNCS,
> +
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 2,
> +	.func[6]  = MAX31785_TEMP_FUNCS,
> +	.func[7]  = MAX31785_TEMP_FUNCS,
> +	.func[8]  = MAX31785_TEMP_FUNCS,
> +	.func[9]  = MAX31785_TEMP_FUNCS,
> +	.func[10] = MAX31785_TEMP_FUNCS,
> +	.func[11] = MAX31785_TEMP_FUNCS,
> +	.func[12] = MAX31785_TEMP_FUNCS,
> +	.func[13] = MAX31785_TEMP_FUNCS,
> +	.func[14] = MAX31785_TEMP_FUNCS,
> +	.func[15] = MAX31785_TEMP_FUNCS,
> +	.func[16] = MAX31785_TEMP_FUNCS,
> +
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +	.func[17] = MAX31785_VOUT_FUNCS,
> +	.func[18] = MAX31785_VOUT_FUNCS,
> +	.func[19] = MAX31785_VOUT_FUNCS,
> +	.func[20] = MAX31785_VOUT_FUNCS,
> +	.func[21] = MAX31785_VOUT_FUNCS,
> +	.func[22] = MAX31785_VOUT_FUNCS,
> +};
> +
> +static int max31785_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	s64 ret;
> +
> +	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	*info = max31785_info;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
> +	if (ret < 0)
> +		return ret;
> +
> +	return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id max31785_id[] = {
> +	{ "max31785", 0 },
> +	{ "max31785a", 0 },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, max31785_id);
> +
> +static struct i2c_driver max31785_driver = {
> +	.driver = {
> +		.name = "max31785",
> +	},
> +	.probe = max31785_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = max31785_id,
> +};
> +
> +module_i2c_driver(max31785_driver);
> +
> +MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> +MODULE_DESCRIPTION("PMBus driver for the Maxim MAX31785");
> +MODULE_LICENSE("GPL");
