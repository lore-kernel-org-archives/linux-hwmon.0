Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:55534 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932090AbdJUQUz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Oct 2017 12:20:55 -0400
Date: Sat, 21 Oct 2017 09:20:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Porte <romain.porte@nokia.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [1/2] pmbus: added tps544c20 driver with trimming support
Message-ID: <20171021162048.GA13173@roeck-us.net>
References: <20171020103916.3309-2-romain.porte@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171020103916.3309-2-romain.porte@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 20, 2017 at 12:39:15PM +0200, Romain Porte wrote:
> Trimming is a manufacturer-specific command provided by TPS544C20.
> Since there is no generic interface for trimming yet this patch
> proposes a new driver with dedicated sysfs entries for trimming
> support for the component, according to its datasheet. This
> allows users to access the VREF_TRIM and STORE_USER_ALL commands.

This should be part of device programming in manufacturing, just like,
say, current calibration. It should not be user programmable, even less so
runtime programmable. On top of that, we definitely don't want to make
STORE_USER_ALL available to user space. Both can too easily result in
a bricked device (bad enough that the register values are writable using
i2cset).

Guenter

> ---
>  drivers/hwmon/pmbus/Kconfig     |  10 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/tps544c20.c | 164 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 175 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/tps544c20.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 40019325b517..6f46e17d2004 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -153,6 +153,16 @@ config SENSORS_TPS53679
>  	  This driver can also be built as a module. If so, the module will
>  	  be called tps53679.
>  
> +config SENSORS_TPS544C20
> +	tristate "TI TPS544C20"
> +	default n
> +	help
> +	  If you say yes here you get hardware monitoring support for TI
> +	  TPS544C20 with trimming support.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tps544c20.
> +
>  config SENSORS_UCD9000
>  	tristate "TI UCD90120, UCD90124, UCD90160, UCD9090, UCD90910"
>  	default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 459a6be3390e..5b8e0a37551a 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> +obj-$(CONFIG_SENSORS_TPS544C20)	+= tps544c20.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/tps544c20.c b/drivers/hwmon/pmbus/tps544c20.c
> new file mode 100644
> index 000000000000..241c030fc216
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tps544c20.c
> @@ -0,0 +1,164 @@
> +/*
> + * Hardware monitoring driver for TI TPS544C20 with trim support
> + *
> + * Copyright (c) 2017 Nokia Solutions and Networks.
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
> +#include <linux/delay.h>
> +#include "pmbus.h"
> +
> +#define VREF_TRIM_ADDR      0xD4
> +#define STORE_USER_ALL_ADDR 0x15
> +
> +static struct pmbus_driver_info tps544c20_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_TEMP2
> +	    | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
> +};
> +
> +static ssize_t show_vref_trim(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	int ret;
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	ret = pmbus_read_word_data(client, 0, VREF_TRIM_ADDR);
> +	if (ret < 0) {
> +		dev_err(dev, "error reading vref_trim (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%d\n", (int16_t) ret);
> +	return ret;
> +}
> +
> +static ssize_t store_vref_trim(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	int ret;
> +	int value;
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	ret = sscanf(buf, "%d", &value);

Side note: There are API functions for that.

> +	if (ret != 1) {
> +		dev_err(dev, "bad value, please write integer\n");

Easy way to clog the kernel log.

> +		return -EINVAL;
> +	}
> +
> +	ret = pmbus_write_word_data(client, 0, VREF_TRIM_ADDR, (int16_t) value);
> +	if (ret < 0) {
> +		dev_err(dev, "error writing vref_trim\n");
> +		return ret;
> +	}
> +
> +	/* Delay of at least 15 us/mV of change (0.067 mV/us), lets wait 10ms */
> +	msleep(10);
> +
> +	return count;
> +}
> +
> +static ssize_t set_store_user_all(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	int ret;
> +	int read_value;
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	ret = sscanf(buf, "%d", &read_value);
> +	if (ret != 1 || read_value != 1) {
> +		dev_err(dev, "bad value, write 1 to store. abort\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pmbus_write_byte(client, 0, STORE_USER_ALL_ADDR);
> +	if (ret < 0) {
> +		dev_err(dev, "error writing store_user_all\n");
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +DEVICE_ATTR(vref_trim, S_IWUSR | S_IRUGO, show_vref_trim, store_vref_trim);
> +DEVICE_ATTR(store_user_all, S_IWUSR, NULL, set_store_user_all);
> +
> +static struct attribute *tps544c20_attributes[] = {
> +	&dev_attr_vref_trim.attr,
> +	&dev_attr_store_user_all.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group tps544c20_group = {
> +	.attrs = tps544c20_attributes,
> +};
> +
> +static int tps544c20_probe(struct i2c_client *client,
> +			   const struct i2c_device_id *id)
> +{
> +	int ret;
> +
> +	ret = pmbus_do_probe(client, id, &tps544c20_info);
> +	if (ret < 0) {
> +		pr_err("error during pmbus probe\n");
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&client->dev.kobj, &tps544c20_group);
> +	if (ret < 0) {
> +		pr_err("error creating sysfs\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tps544c20_remove(struct i2c_client *client)
> +{
> +	sysfs_remove_group(&client->dev.kobj, &tps544c20_group);
> +
> +	return pmbus_do_remove(client);
> +}
> +
> +static const struct i2c_device_id tps544c20_id[] = {
> +	{"tps544c20", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, tps544c20_id);
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver tps544c20_driver = {
> +	.driver = {
> +		   .name = "tps544c20",
> +		   },
> +	.probe = tps544c20_probe,
> +	.remove = tps544c20_remove,
> +	.id_table = tps544c20_id,
> +};
> +
> +module_i2c_driver(tps544c20_driver);
> +
> +MODULE_AUTHOR("Romain Porte <romain.porte@nokia.com>");
> +MODULE_DESCRIPTION("PMBus driver for TI TPS544C20 with trim support");
> +MODULE_LICENSE("GPL");
