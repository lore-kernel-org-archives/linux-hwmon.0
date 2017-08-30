Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34326 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbdH3BXt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 21:23:49 -0400
Date: Tue, 29 Aug 2017 18:23:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us
Subject: Re: [v1,2/2] Add support for Texas Instruments tps53679 device
Message-ID: <20170830012346.GA19780@roeck-us.net>
References: <1504037182-122747-3-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504037182-122747-3-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 29, 2017 at 08:06:22PM +0000, Vadim Pasternak wrote:
> The below lists of VOUT_MODE command readout with their related VID
> protocols, Digital to Analog Converter steps, supported by the device:
> VR12.0 mode, 5-mV DAC - 0x21
> VR12.5 mode, 10-mV DAC - 0x22
> VR13.0 mode, 10-mV DAC - 0x24
> IMVP8 mode, 5-mV DAC - 0x25
> VR13.0 mode, 5-mV DAC - 0x27
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/hwmon/pmbus/Kconfig    |  10 ++++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/tps53679.c | 126 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/tps53679.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 68d717a..42d2366 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -135,6 +135,16 @@ config SENSORS_TPS40422
>  	  This driver can also be built as a module. If so, the module will
>  	  be called tps40422.
>  
> +config SENSORS_TPS53679
> +	tristate "TI TPS53679"
> +	default n
> +	help
> +	  If you say yes here you get hardware monitoring support for TI
> +	  TPS53679.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tps53679.
> +
>  config SENSORS_UCD9000
>  	tristate "TI UCD90120, UCD90124, UCD90160, UCD9090, UCD90910"
>  	default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 75bb7ca..c7c76b0 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
> +obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> new file mode 100644
> index 0000000..1cdd456
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -0,0 +1,126 @@
> +/*
> + * Hardware monitoring driver for Texas Instruments TPS53679
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
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>

Alphabetic order, please.

> +#include "pmbus.h"
> +
> +#define TPS53679_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
> +#define TPS53679_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV DAC */
> +#define TPS53679_PROT_VR13_10MV		0x04 /* VR13.0 mode, 10-mV DAC */
> +#define TPS53679_PROT_IMVP8_5MV		0x05 /* IMVP8 mode, 5-mV DAC */
> +#define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV DAC */
> +#define TPS53679_PAGE_NUM		2
> +
> +struct tps53679_data {
> +	u8 vout_params;				/* VOUT parameters */

Only used in tps53679_identify() and thus not needed in tps53679_data.

> +	struct pmbus_driver_info info;
> +};
> +
> +#define to_tps53679_data(x)  container_of(x, struct tps53679_data, info)
> +
> +static int tps53679_identify(struct i2c_client *client,
> +			     struct pmbus_driver_info *info)
> +{
> +	struct tps53679_data *data = to_tps53679_data(info);
> +	int ret;
> +
> +	/* Read the register with VOUT scaling value.*/

Comment is not very valuable. It took me a while to understand.
I would suggest to drop it.

> +	ret = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->vout_params = ret & GENMASK(4, 0);
> +
> +	switch (data->vout_params) {
> +	case TPS53679_PROT_VR13_10MV:
> +	case TPS53679_PROT_VR12_5_10MV:
> +		info->vrm_version = vr13;
> +		break;
> +	case TPS53679_PROT_VR13_5MV:
> +	case TPS53679_PROT_VR12_5MV:
> +	case TPS53679_PROT_IMVP8_5MV:
> +		info->vrm_version = vr12;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info tps53679_info = {
> +	.pages = TPS53679_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT,
> +	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT,
> +	.identify = tps53679_identify,
> +};
> +
> +static int tps53679_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct tps53679_data *data;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, id, &tps53679_info);
> +}
> +
> +static const struct i2c_device_id tps53679_id[] = {
> +	{"tps53679", TPS53679_PAGE_NUM},

TPS53679_PAGE_NUM is not used here.

> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, tps53679_id);
> +
> +static const struct of_device_id tps53679_of_match[] = {
> +	{.compatible = "ti,tps53679"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tps53679_of_match);
> +
> +static struct i2c_driver tps53679_driver = {
> +	.driver = {
> +		.name = "tps53679",
> +		.of_match_table = of_match_ptr(tps53679_of_match),
> +	},
> +	.probe = tps53679_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = tps53679_id,
> +};
> +
> +module_i2c_driver(tps53679_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> +MODULE_DESCRIPTION("PMBus driver for Texas Instruments TPS53679");
> +MODULE_LICENSE("GPL");
