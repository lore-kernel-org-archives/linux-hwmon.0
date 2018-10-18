Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40701 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbeJRVhb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Oct 2018 17:37:31 -0400
Subject: Re: [PATCH 1/2] hwmon: (pmbus): Add driver for Intersil ISL68137
To: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20181017225603.7782-1-kunyi@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <51dbddbc-0e92-7bb5-03c7-4bad3a0af029@roeck-us.net>
Date: Thu, 18 Oct 2018 06:36:24 -0700
MIME-Version: 1.0
In-Reply-To: <20181017225603.7782-1-kunyi@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/17/2018 03:56 PM, Kun Yi wrote:
> From: Maxim Sloyko <maxims@google.com>
> 
> Intersil ISL68137 is a digital output 7-phase configurable PWM
> controller with an AVSBus interface.
> 
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>   drivers/hwmon/pmbus/Kconfig    | 10 ++++
>   drivers/hwmon/pmbus/Makefile   |  1 +
>   drivers/hwmon/pmbus/isl68137.c | 86 ++++++++++++++++++++++++++++++++++
>   3 files changed, 97 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/isl68137.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 629cb45f8557..15c197f1c4c4 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -54,6 +54,16 @@ config SENSORS_IR35221
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ir35521.
>   
> +config SENSORS_ISL68137
> +	tristate "Intersil ISL68137"
> +	default y
> +	help
> +	  If you say yes here you get hardware monitoring support for Intersil
> +	  ISL68137.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called isl68137.
> +
>   config SENSORS_LM25066
>   	tristate "National Semiconductor LM25066 and compatibles"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index ea0e39518c21..0684b35216da 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>   obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
> +obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
>   obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
>   obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>   obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> new file mode 100644
> index 000000000000..2a5322e4a286
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -0,0 +1,86 @@
> +/*
> + * Hardware monitoring driver for Intersil ISL68137
> + *
> + * Copyright (c) 2017 Google Inc
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

Please use SPDX for new drivers.

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>

Alphabetic order, please.

> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info isl68137_info = {
> +	.pages = 2,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_IN] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_VOLTAGE_IN] = 1,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 3,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.m[PSC_CURRENT_IN] = 1,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = 2,
> +	.m[PSC_CURRENT_OUT] = 1,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = 1,
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = 0,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 0,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> +	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> +	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> +	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
> +};
> +
> +static int isl68137_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	return pmbus_do_probe(client, id, &isl68137_info);
> +}
> +
> +static const struct i2c_device_id isl68137_id[] = {
> +	{"isl68137", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, isl68137_id);
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver isl68137_driver = {
> +	.driver = {
> +		   .name = "isl68137",
> +		   },
> +	.probe = isl68137_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = isl68137_id,
> +};
> +
> +module_i2c_driver(isl68137_driver);
> +
> +MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
> +MODULE_DESCRIPTION("PMBus driver for Intersil ISL68137");
> +MODULE_LICENSE("GPL");
> 
