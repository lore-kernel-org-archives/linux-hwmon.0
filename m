Return-path: <clabbe.montjoie@gmail.com>
Date: Wed, 7 Sep 2016 15:16:51 +0200
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: Andrea Merello <andrea.merello@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/2] hwmon: new driver for ST stts751 thermal sensor
Message-ID: <20160907131651.GA18441@Red>
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hello

I have some coments below

On Wed, Sep 07, 2016 at 02:33:36PM +0200, Andrea Merello wrote:
> This patch adds a HWMON driver for ST Microelectronics STTS751
> temperature sensors.
> 
> It does support manual-triggered conversions as well as automatic
> conversions. The latter is used when the "event" or "therm" function
> is present (declaring the physical wire is attached in the DT).
> 
> Thanks-to: LABBE Corentin [for suggestions]
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> ---
>  drivers/hwmon/Kconfig   |  12 +-
>  drivers/hwmon/Makefile  |   2 +-
>  drivers/hwmon/stts751.c | 948 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 960 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/hwmon/stts751.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index eaf2f91..8fdd241 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1448,6 +1448,16 @@ config SENSORS_SCH5636
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called sch5636.
>  
> +config SENSORS_STTS751
> +	tristate "ST Microelectronics STTS751"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for STTS751
> +	  temperature sensor chips.
> +
> +	  This driver can also be built as a module.  If so, the module

Two space instead of one

> +	  will be called stts751.
> +
>  config SENSORS_SMM665
>  	tristate "Summit Microelectronics SMM665"
>  	depends on I2C
> @@ -1506,7 +1516,7 @@ config SENSORS_ADS7871
>  
>  config SENSORS_AMC6821
>  	tristate "Texas Instruments AMC6821"
> -	depends on I2C 
> +	depends on I2C

This change need to be in another set of patch

>  	help
>  	  If you say yes here you get support for the Texas Instruments
>  	  AMC6821 hardware monitoring chips.
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index fe87d28..1114130 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
>  obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>  obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>  obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
> +obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
>  obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>  obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
>  obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
> @@ -169,4 +170,3 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>  obj-$(CONFIG_PMBUS)		+= pmbus/
>  
>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> -
> diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
> new file mode 100644
> index 0000000..94b7e2b
> --- /dev/null
> +++ b/drivers/hwmon/stts751.c
> @@ -0,0 +1,948 @@
> +/*
> + * STTS751 sensor driver
> + *
> + * Copyright (C) 2016 Istituto Italiano di Tecnologia - RBCS - EDL
> + * Robotics, Brain and Cognitive Sciences department
> + * Electronic Design Laboratory
> + *
> + * Written by Andrea Merello <andrea.merello@gmail.com>
> + *
> + * Based on the following drivers:
> + * - LM95241 driver, which is:
> + *   Copyright (C) 2008, 2010 Davide Rizzo <elpa.rizzo@gmail.com>
> + * - LM90 driver, which is:
> + *   Copyright (C) 2003-2010  Jean Delvare <jdelvare@suse.de>

No need to recopy copyright, we can find them in their driver.

> +
> +/* HW index vs ASCII and int times in mS */
> +static const struct stts751_intervals_t stts751_intervals[] = {
> +	{.str = "16000", .val = 16000},
> +	{.str = "8000", .val = 8000},
> +	{.str = "4000", .val = 4000},
> +	{.str = "2000", .val = 2000},
> +	{.str = "1000", .val = 1000},
> +	{.str = "500", .val = 500},
> +	{.str = "250", .val = 250},
> +	{.str = "125", .val = 125},
> +	{.str = "62.5", .val = 62},
> +	{.str = "31.25", .val = 31}
> +};

So you are lying about 62.5 and 31.25 :) ?

> +
> +/* special value to indicate to the SW to use manual mode */
> +#define STTS751_INTERVAL_MANUAL 0xFF
> +
> +struct stts751_priv {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct mutex access_lock;
> +	unsigned long interval;
> +	int res;
> +	bool gen_therm, gen_event;
> +	int event_max, event_min;
> +	int therm;
> +	int hyst;
> +	bool smbus_timeout;
> +	int temp;
> +	unsigned long last_update;
> +	u8 config;
> +	bool min_alert, max_alert;
> +	bool data_valid;
> +
> +	/* Temperature is always present
> +	 * Depending by DT/platdata, therm, event, interval are
> +	 * dynamically added.
> +	 * There are max 4 entries plus the guard
> +	 */

This type of comment is wrong, you need /* only at the first line

> +	const struct attribute_group *groups[5];
> +};
> +
> +static int stts751_manual_conversion(struct stts751_priv *priv)
> +{
> +	s32 ret;
> +	unsigned long timeout;
> +
> +	/* Any value written to this reg will trigger manual conversion */
> +	ret = i2c_smbus_write_byte_data(priv->client,
> +				STTS751_REG_ONESHOT, 0xFF);
> +	if (ret < 0)
> +		return ret;
> +
> +	timeout = jiffies;
> +
> +	while (1) {
> +		ret = i2c_smbus_read_byte_data(priv->client,
> +					STTS751_REG_STATUS);
> +		if (ret < 0)
> +			return ret;
> +		if (!(ret & STTS751_STATUS_BUSY))
> +			return 0;
> +		if (time_after(jiffies,
> +				timeout + STTS751_CONV_TIMEOUT * HZ / 1000)) {
> +			dev_warn(&priv->client->dev, "conversion timed out\n");
> +			break;
> +		}
> +	}

Perhaps you could rewrite it as:
do {
...
} while (!time_after(xxx))
dev_warn()

> +	return -ETIMEDOUT;
> +}
> +
> +/* Converts temperature in C split in integer and fractional parts, as supplied
> + * by the HW, to an integer number in mC
> + */

Same problem for comment (and all comentw below)

> +static int stts751_update_temp(struct stts751_priv *priv)
> +{
> +	s32 integer1, integer2, frac;
> +	unsigned long sample1, sample2, timeout;
> +	int i;
> +	int ret = 0;
> +
> +	mutex_lock(&priv->access_lock);
> +
> +	if (priv->interval == STTS751_INTERVAL_MANUAL) {
> +		/* perform a one-shot on-demand conversion */
> +		ret = stts751_manual_conversion(priv);
> +		if (ret) {
> +			dev_warn(&priv->client->dev,
> +				"failed to shot conversion %x\n", ret);
> +			goto exit;
> +		}
> +	}
> +
> +	for (i = 0; i < STTS751_RACE_RETRY; i++) {
> +		sample1 = jiffies;
> +		integer1 = i2c_smbus_read_byte_data(priv->client,
> +						STTS751_REG_TEMP_H);
> +
> +		if (integer1 < 0) {
> +			ret = integer1;
> +			dev_warn(&priv->client->dev,
> +				"failed to read H reg %x\n", ret);
> +			goto exit;
> +		}
> +
> +		frac = i2c_smbus_read_byte_data(priv->client,
> +						STTS751_REG_TEMP_L);
> +
> +		if (frac < 0) {
> +			ret = frac;
> +			dev_warn(&priv->client->dev,
> +				"failed to read L reg %x\n", ret);
> +			goto exit;
> +		}
> +
> +		if (priv->interval == STTS751_INTERVAL_MANUAL) {
> +			/* we'll look at integer2 later.. */
> +			integer2 = integer1;
> +			break;
> +		}
> +
> +		integer2 = i2c_smbus_read_byte_data(priv->client,
> +						STTS751_REG_TEMP_H);
> +		sample2 = jiffies;
> +
> +		if (integer2 < 0) {
> +			dev_warn(&priv->client->dev,
> +				"failed to read H reg (2nd time) %x\n", ret);

Hard to find why you print ret and what exactly it is when you print it.

> +			ret = integer2;
> +			goto exit;
> +		}
> +
> +		timeout = stts751_intervals[priv->interval].val * HZ / 1000;
> +		timeout -= ((timeout < 10) && (timeout > 1)) ? 1 : timeout / 10;

What it is the purpose of this decrease ?

> +		if ((integer1 == integer2) &&
> +			time_after(sample1 + timeout, sample2))
> +			break;
> +
> +		/* if we are going on with a racy read, don't pretend to be
> +		 * super-precise, just use the MSBs ..
> +		 */
> +		frac = 0;
> +	}
> +
> +exit:
> +	mutex_unlock(&priv->access_lock);
> +	if (ret)
> +		return ret;
> +
> +	/* use integer2, because when we fallback to the "MSB-only" compromise
> +	 * this is the more recent one
> +	 */
> +	priv->temp = stts751_to_deg(integer2, frac);
> +	return ret;
> +}
> +
> +static int stts751_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct stts751_priv *priv;
> +	int ret;
> +	int groups_idx = 0;
> +	struct device_node *of_node = client->dev.of_node;
> +
> +	priv = devm_kzalloc(&client->dev,
> +			sizeof(struct stts751_priv), GFP_KERNEL);

Could be rewrite to sizeof(*priv)

Regards

Labbe Corentin
