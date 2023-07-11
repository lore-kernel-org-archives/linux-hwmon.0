Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD0CEB64DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 17:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjGKRic (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 13:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjGKRic (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 13:38:32 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C81E5C
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 10:38:29 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5774335bb2aso66339297b3.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689097109; x=1691689109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lX+1Yk4Q6AZo1BZ62RihlM9GnEWMuAA2L3SjhlZwiI=;
        b=OEa9A12XwhqfmE9vYrTuYEcIxGU7A+0S64dAVZZN5FDPSeNIA7dcnfLuEFf+Max3fc
         hvzsjudbTn6XxeraPtbbZS7INrXMs+9vR0/V9D3srD0p1ut+k56mGmjmLn7t6iW9tjzk
         oFOHWMEc4nOjThE4g4LybzCc518FYEbHs+QKnTrfZaGfYzuGEA2uOxt9ajEJBYff9hXE
         lvxMZytXX1tD496p8LAHRXZeMGLGi6AIRM4S4B0dzlm+BWOdvT1s2A88aMB71UoRn5qx
         xl/X5OzIT1+KUnMc2JMHer92lOnfLMSuZtm4zcksTwwOjhSXvL648sYlD/wAN/P+0LTV
         qwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689097109; x=1691689109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lX+1Yk4Q6AZo1BZ62RihlM9GnEWMuAA2L3SjhlZwiI=;
        b=ULyiv18IDF8uS1HY8BPXVKs6lmFviLoHRHHTuiHALo3zlZUdiLs8Df86XhryqWw6sg
         r60fp2iSrjbPtjaaX1C2n6vW1kD7R4yMPiRwl15RKTVcSE9neFMKE02Ouu4boZd7yFAx
         wldXBypLDmNm0Nd5DHVs9zx2oTiS0U9F2aRBeLIC/3fWYhHR0hxwgsLdWk8iMSF8H+yQ
         PotOE/rn+AYrWXLNLeHfK+U9tIDgxbv7RSCZv+yGURBA5QEuFXyctLOdAKvpbuLRb2Wz
         fQsP9J0cdWPo+BUi9u9xLT0TTWKv7iDU7r37HpjOzIecDmtwA89dGIbaNSNhGlfGYTTJ
         tRnA==
X-Gm-Message-State: ABy/qLbHnbWjQIC2rVbqb5btP9giVqP7k/byXCLOjdsu3xyuWomMWMoB
        J7PELoNWhDRYR5tVVBNy8w4=
X-Google-Smtp-Source: APBJJlEy5IP5/eZv5IzcHuvn94SA4Mej4nZv33hNQldEwfejBEdUShvgYFKNgdg6NlFerQpolZxdGA==
X-Received: by 2002:a0d:d94f:0:b0:573:1db2:7f7d with SMTP id b76-20020a0dd94f000000b005731db27f7dmr14274033ywe.2.1689097108742;
        Tue, 11 Jul 2023 10:38:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m124-20020a817182000000b0056d0709e0besm680053ywc.129.2023.07.11.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:38:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 11 Jul 2023 10:38:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Werner <werneazc@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
Subject: Re: [PATCH 1/2] hwmon: (hs300x) Add driver for Renesas HS300x
Message-ID: <e5232580-2381-4593-aea7-5975025c9434@roeck-us.net>
References: <20230711140637.4909-1-andre.werner@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711140637.4909-1-andre.werner@systec-electronic.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 11, 2023 at 04:06:36PM +0200, Andre Werner wrote:
> Add base support for Renesas HS300x temperature
> and humidity sensors.
> 
> The sensors has a fix I2C address 0x44. The resolution
> is fixed to 14bit (ref. Missing feature).
> 
> Missing feature:
> - Accessing non-volatile memory: Custom board has no
>   possibility to control voltage supply of sensor. Thus,
>   we cannot send the necessary control commands within
>   the first 10ms after power-on.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> ---
>  Documentation/hwmon/hs300x.rst |  61 +++++
>  drivers/hwmon/Kconfig          |  10 +
>  drivers/hwmon/Makefile         |   1 +
>  drivers/hwmon/hs300x.c         | 461 +++++++++++++++++++++++++++++++++
>  4 files changed, 533 insertions(+)
>  create mode 100644 Documentation/hwmon/hs300x.rst
>  create mode 100644 drivers/hwmon/hs300x.c
> 
> diff --git a/Documentation/hwmon/hs300x.rst b/Documentation/hwmon/hs300x.rst

Drop "x" from file names and use the first supported device instead.
The driver does not support HS300{0,5...9}, and claiming that it does
can only create confusion.


> new file mode 100644
> index 000000000000..2be05d0f00ab
> --- /dev/null
> +++ b/Documentation/hwmon/hs300x.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver HS300x
> +===================
> +
> +Supported chips:
> +
> +  * Renesas HS3001, HS3002, HS3003, HS3004
> +
> +    Prefix: 'hs300x'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
> +
> +Author:
> +
> +  - Andre Werner <andre.werner@systec-electronic.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for the Renesas HS300x chips, a humidity
> +and temperature family. Temperature is measured in degrees celsius, relative
> +humidity is expressed as a percentage. In the sysfs interface, all values are
> +scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
> +
> +The device communicates with the I2C protocol. Sensors can have the I2C
> +address 0x44 by default.

Drop "can".

> +
> +The driver does not support the sensor's configuration possibilities.
> +
> +The driver is able to be read out using lmsensors.

This sentence has no value since that is the case for all hardware monitoring
drivers.

> +
> +sysfs-Interface
> +---------------
> +
> +===============================================================================
> +temp1_input:        temperature input
> +humidity1_input:    humidity input
> +temp1_max:          temperature max value
> +humidity1_max:      humidity max value
> +temp1_min:          temperature min value
> +humidity1_min:      humidity min value
> +measuretime:        Measurement delay in usec

Use standard attribute (update_interval).
Or, rather, drop it since setting it is not supported by the driver.

> +===============================================================================
> +
> +Device Tree
> +-----------
> +
> +Required node properties:
> +
> + - compatible:  must be set to "hs3001", "hs3002", "hs3003", "hs3004"
> + - reg:         I2C address of the device (0x44)
> +
> +Example:
> +
> +    humidity: hs3002@44 {
> +        compatible = "hs3002";
> +        reg = <0x44>;
> +    };

This information does not belong into this file.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 307477b8a371..9ce82fe0044b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -734,6 +734,16 @@ config SENSORS_HIH6130
>  	  This driver can also be built as a module. If so, the module
>  	  will be called hih6130.
>  
> +config SENSORS_HS300x
> +	tristate "Renesas HS300x humidity and temperature sensors"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the Renesas HS300x
> +	  humidity and temperature sensors.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called hs300x.
> +
>  config SENSORS_IBMAEM
>  	tristate "IBM Active Energy Manager temperature/power sensors and control"
>  	select IPMI_SI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3f4b0fda0998..a067c0896ca1 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_SENSORS_GSC)	+= gsc-hwmon.o
>  obj-$(CONFIG_SENSORS_GPIO_FAN)	+= gpio-fan.o
>  obj-$(CONFIG_SENSORS_GXP_FAN_CTRL) += gxp-fan-ctrl.o
>  obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
> +obj-$(CONFIG_SENSORS_HS300x)	+= hs300x.o
>  obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
>  obj-$(CONFIG_SENSORS_I5500)	+= i5500_temp.o
>  obj-$(CONFIG_SENSORS_I5K_AMB)	+= i5k_amb.o
> diff --git a/drivers/hwmon/hs300x.c b/drivers/hwmon/hs300x.c
> new file mode 100644
> index 000000000000..a22cc55a01ce
> --- /dev/null
> +++ b/drivers/hwmon/hs300x.c
> @@ -0,0 +1,461 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* This is a non-complete driver implementation for the
> + * HS300x humidity and temperature sensors. It does not include
> + * the configuration possibilities, because the hardware platform the IC is
> + * used does not control the power source for the IC. Thus, it cannot being
> + * set to 'programming mode' during power-up.
> + *

Not sure what that means, but it irrelevant for the driver. Just describe
what it does.

> + *
> + * Copyright (C) 2022 SYS TEC electronic AG
> + * Author: Andre Werner <andre.werner@systec-electronic.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/of_device.h>

Alphabetic include file order, please.

> +
> +/* Measurement times */
> +#define HS300X_WAKEUP_TIME 100	/* us */
> +#define HS300X_UNUSED 0		/* us */

I can kind of understand the other unused defines below, but this one
doesn't make sense or add value. Please drop.

> +#define HS300X_8BIT_RESOLUTION 550	/* us */
> +#define HS300X_10BIT_RESOLUTION 1310	/* us */
> +#define HS300X_12BIT_RESOLUTION 4500	/* us */
> +#define HS300X_14BIT_RESOLUTION 16900	/* us */

#define<space>NAME<tab>VALUE throughout, and align VALUE

> +
> +#define HS300X_CMD_OK 0

Drop this define. Use 0 directly where needed. hs300x_measure_command()
can return a positive value if needed.

> +#define HS300X_RESPONSE_LENGTH 4
> +
> +#define HS300X_FIXPOINT_ARITH 1000
> +#define HS300X_MIN_TEMPERATURE (-40 * HS300X_FIXPOINT_ARITH) /* 1000 degree */
> +#define HS300X_MAX_TEMPERATURE (125 * HS300X_FIXPOINT_ARITH) /* 1000 degree */

1000 degree ? What is this supposed to mean ?

> +#define HS300X_MIN_HUMIDITY (0 * HS300X_FIXPOINT_ARITH) /* 1000 % */
> +#define HS300X_MAX_HUMIDITY (100 * HS300X_FIXPOINT_ARITH) /* 1000 % */

What is 1000% ?

> +
> +#define HS300X_MASK_HUMIDITY_0X3FFF (0x3FFF)
> +#define HS300X_MASK_TEMPERATURE_0XFFFC (0xFFFC)
> +#define HS300X_MASK_STATUS_0XC0 (0xC0)
> +#define HS300X_STATUS_SHIFT (6)

Unnecessary ( ) around constants

> +
> +/* Definitions for Status Bits of A/D Data */
> +#define HS300X_DATA_VALID (0x00)	/* Valid Data */
> +#define HS300X_DATA_STALE (0x01)	/* Stale Data */
> +
> +#define LIMIT_MAX 0
> +#define LIMIT_MIN 1
> +
> +enum hs300x_chips {
> +	hs3001,
> +	hs3002,
> +	hs3003,
> +	hs3004,
> +};
> +
> +struct hs300x_accurancy {

accurancy

> +	u32 hum_acc;		/* accurancy of humidity in *1000 % */
> +	u32 temp_acc;		/* accurancy of temperature in *1000 % */
> +};


> +
> +const struct hs300x_accurancy hs300x_accurancys[] = {

accuracies

> +	{ 1500, 200 },
> +	{ 1800, 200 },
> +	{ 2500, 250 },
> +	{ 3500, 300 },
> +};

The above information is not used anywhere. Please drop.

> +
> +struct hs300x_data {
> +	struct i2c_client *client;
> +	struct mutex i2c_lock;	/* lock for sending i2c commands */
> +	struct mutex data_lock;	/* lock for updating driver data */

Those locks are not really necessary.

> +	u32 wait_time;		/* in us */

That can be a constant.

> +	int temperature;	/* in *1000 degree */
> +	u32 humidity;		/* in *1000 % */
> +};
> +
> +static int hs300x_measure_command(struct i2c_client *client,
> +				  struct hs300x_data *data)
> +{
> +	int ret = 0;
> +	unsigned char buf[1] = { 0x00 };
> +
> +	if (!data || !client)
> +		return -EINVAL;
> +
Pointless check.

> +	mutex_lock(&data->i2c_lock);
> +	ret = i2c_master_send(client, (const char *)buf, 0);

Pointless typecast

> +	mutex_unlock(&data->i2c_lock);

That lock seems pointless. Please explain its value.

> +
> +	if (0 > ret)

Please refrain from Yoda programming.

> +		dev_dbg(&client->dev,
> +			"Error starting measurement. Errno: %d.\n", ret);
> +	else {
> +		ret = HS300X_CMD_OK;

> +	}
> +
> +	return ret;
> +}
> +
> +static int hs300x_extract_temperature(u16 raw)
> +{
> +	/* fixpoint arithmetic 1 digit */
> +	int temp = ((raw & HS300X_MASK_TEMPERATURE_0XFFFC) >> 2) *
> +	    HS300X_FIXPOINT_ARITH;
> +
> +	temp /= ((1 << 14) - 1);

Unnecessary outer ( ).

> + > +	return (temp * 165) - (40 * HS300X_FIXPOINT_ARITH);

Unnecessary ( )

> +}
> +
> +static u32 hs300x_extract_humidity(u16 raw)
> +{
> +	int hum = (raw & HS300X_MASK_HUMIDITY_0X3FFF) * HS300X_FIXPOINT_ARITH;
> +
> +	hum /= ((1 << 14) - 1);
> +
> +	return hum * 100;

Not that it matters much, but this calculation unnecessarily reduces
resolution to 1%.

> +}
> +
> +static int hs300x_data_fetch_command(struct i2c_client *client,
> +				     struct hs300x_data *data)
> +{
> +	int ret = HS300X_CMD_OK;
> +	u8 buf[HS300X_RESPONSE_LENGTH];
> +	u8 hs300x_status;
> +
> +	if (!client || !data)
> +		return -EINVAL;

Pointless.

> +
> +	mutex_lock(&data->i2c_lock);
> +	ret = i2c_master_recv(client, buf, HS300X_RESPONSE_LENGTH);
> +	mutex_unlock(&data->i2c_lock);
> +
> +	if (ret != HS300X_RESPONSE_LENGTH) {
> +		ret = ret < 0 ? ret : -EIO;
> +		dev_dbg(&client->dev,
> +			"Error in i2c communication. Error code: %d.\n", ret);
> +		goto out;

Please no goto to return statements.

> +	}
> +
> +	hs300x_status = (buf[0] & HS300X_MASK_STATUS_0XC0) >>
> +	    HS300X_STATUS_SHIFT;
> +	if (hs300x_status == HS300X_DATA_STALE) {
> +		dev_dbg(&client->dev, "Sensor busy.\n");
> +		ret = -EBUSY;
> +		goto out;
> +	} else if (hs300x_status != HS300X_DATA_VALID) {
> +		dev_dbg(&client->dev, "Data invalid.\n");
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	mutex_lock(&data->data_lock);
> +	data->humidity =
> +	    hs300x_extract_humidity(be16_to_cpup((__be16 *) &buf[0]));
> +	data->temperature =
> +	    hs300x_extract_temperature(be16_to_cpup((__be16 *) &buf[2]));
> +	mutex_unlock(&data->data_lock);

This lock is pointless since the caller may use the return value from a later
measurement which happened after the lock was released. Also, since the
caller does not acquire the lock prior to reading the value, data->humidity
and data->temperature could still be inconsistent.

Overall, storing humidity and temperature in data does not ad any value.
Just pass two pointers to store the returned values.

> +
> +	ret = HS300X_CMD_OK;

Just return 0; is sufficient.


> +
> +out:
> +	return ret;
> +}
> +
> +/* sysfs attributes */
> +static ssize_t measuretime_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct hs300x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	client = data->client;
> +
> +	if (!client)
> +		return -ENODEV;

All those checks are pointless.

> +
> +	return sprintf(buf, "%d\n", data->wait_time);
> +}
> +
> +static ssize_t temp1_input_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct hs300x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client;
> +	int ret;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	client = data->client;
> +
> +	if (!client) {
> +		dev_dbg(dev, "No valid I2C client available.\n");
> +		return -ENODEV;
> +	}

Really ? So how comes the driver is instantiated on one ?

> +
> +	ret = hs300x_measure_command(client, data);
> +	if (ret != HS300X_CMD_OK)
> +		return ret;

	if (ret < 0)

> +
> +	/* Sensor needs some time to process measurement depending on
> +	 * resolution
> +	 */
> +	fsleep(data->wait_time);
> +
> +	ret = hs300x_data_fetch_command(client, data);
> +	if (ret != HS300X_CMD_OK)
> +		return ret;

ret < 0

> +
> +	return sprintf(buf, "%d\n", data->temperature);
> +}
> +
> +static ssize_t humidity1_input_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct hs300x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client;
> +	int ret;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	client = data->client;
> +
> +	if (!client) {
> +		dev_dbg(dev, "No valid I2C client available.\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = hs300x_measure_command(client, data);
> +	if (ret != HS300X_CMD_OK)
> +		return ret;
> +
> +	/* Sensor needs some time to process measurement depending on
> +	 * resolution
> +	 */
> +	fsleep(data->wait_time);
> +
> +	ret = hs300x_data_fetch_command(client, data);
> +	if (ret != HS300X_CMD_OK)

ret < 0 (everywhere)

> +		return ret;
> +
> +	return sprintf(buf, "%u\n", data->humidity);
> +}
> +
> +static ssize_t temp1_limit_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	int temperature_limit;
> +	u8 index;
> +
> +	index = to_sensor_dev_attr(attr)->index;
> +	if (LIMIT_MIN == index)
> +		temperature_limit = HS300X_MIN_TEMPERATURE;
> +	else
> +		temperature_limit = HS300X_MAX_TEMPERATURE;
> +

Drop those attributes. They are pointless if not supported by hardware.

> +	return scnprintf(buf, PAGE_SIZE, "%d\n", temperature_limit);
> +}
> +
> +static ssize_t humidity1_limit_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	u32 humidity_limit;
> +	u8 index;
> +
> +	index = to_sensor_dev_attr(attr)->index;
> +	if (LIMIT_MIN == index)
> +		humidity_limit = HS300X_MIN_HUMIDITY;
> +	else
> +		humidity_limit = HS300X_MAX_HUMIDITY;
> +

Same as above. If the hardware does not support setting and reading limits,
don't show them.

> +	return scnprintf(buf, PAGE_SIZE, "%u\n", humidity_limit);
> +}
> +
> +static SENSOR_DEVICE_ATTR_RO(temp1_input, temp1_input, 0);
> +static SENSOR_DEVICE_ATTR_RO(humidity1_input, humidity1_input, 0);
> +static SENSOR_DEVICE_ATTR_RO(measuretime, measuretime, 0);
> +static SENSOR_DEVICE_ATTR_RO(temp1_max, temp1_limit, LIMIT_MAX);
> +static SENSOR_DEVICE_ATTR_RO(humidity1_max, humidity1_limit, LIMIT_MAX);
> +static SENSOR_DEVICE_ATTR_RO(temp1_min, temp1_limit, LIMIT_MIN);
> +static SENSOR_DEVICE_ATTR_RO(humidity1_min, humidity1_limit, LIMIT_MIN);
> +
> +static struct attribute *hs3001_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&sensor_dev_attr_measuretime.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_max.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_min.dev_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *hs3002_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&sensor_dev_attr_measuretime.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_max.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_min.dev_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *hs3003_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&sensor_dev_attr_measuretime.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_max.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_min.dev_attr.attr,
> +	NULL
> +};
> +
> +static struct attribute *hs3004_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&sensor_dev_attr_measuretime.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_max.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_min.dev_attr.attr,
> +	NULL
> +};
> +
> +ATTRIBUTE_GROUPS(hs3001);
> +ATTRIBUTE_GROUPS(hs3002);
> +ATTRIBUTE_GROUPS(hs3003);
> +ATTRIBUTE_GROUPS(hs3004);
> +
> +static const struct i2c_device_id hs300x_ids[];
> +#ifdef CONFIG_OF
> +static const struct of_device_id hs300x_of_ids[] = {
> +	{.compatible = "hs3001" },
> +	{.compatible = "hs3002" },
> +	{.compatible = "hs3003" },
> +	{.compatible = "hs3004" },

This should be something like "renesas,hs3001" etc.

> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, hs300x_of_ids);
> +#endif
> +
> +static int hs300x_probe(struct i2c_client *client)
> +{
> +	struct hs300x_data *data;
> +	struct device *hwmon_dev;
> +	struct i2c_adapter *adap = client->adapter;
> +	struct device *dev = &client->dev;
> +	const struct attribute_group **attribute_groups;
> +	int ret;
> +#ifdef CONFIG_OF
> +	const struct of_device_id *of_match;
> +
> +	of_match = of_match_device(hs300x_of_ids, dev);
> +	if (!of_match) {
> +		dev_err(dev, "No match in DT compatibles.\n");
> +		return -ENODEV;
> +	}

This is unnecessary since there is no difference between devices,
and the driver won't be instantiated if there is no match.

> +
> +#endif
> +	if (!i2c_check_functionality(adap, I2C_FUNC_I2C))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	/* Measurement time = wake-up time + measurement time temperature

Standard multi-line comment, please.

> +	 *      measurment time humidity This is currently static, because

measurement. "." missing.


> +	 *      enabling programming mode is not supported, yet.
> +	 */

Then drop the attribute and add it if/when setting it is suppported.

> +	data->wait_time = (HS300X_WAKEUP_TIME + HS300X_14BIT_RESOLUTION +
> +			   HS300X_14BIT_RESOLUTION);
> +	mutex_init(&data->i2c_lock);
> +	mutex_init(&data->data_lock);
> +
> +	if (i2c_match_id(hs300x_ids, client)->driver_data == hs3001)
> +		attribute_groups = hs3001_groups;
> +	else if (i2c_match_id(hs300x_ids, client)->driver_data == hs3002)
> +		attribute_groups = hs3002_groups;
> +	else if (i2c_match_id(hs300x_ids, client)->driver_data == hs3003)
> +		attribute_groups = hs3003_groups;
> +	else if (i2c_match_id(hs300x_ids, client)->driver_data == hs3004)
> +		attribute_groups = hs3004_groups;

All this should be handled with the is_visible() callback.

Having said this, looking at the attributes again ... they are all the
same. Either I am missing something ot that is completely pointless.

Besides, HS3002 and HS3004 were removed from the datasheet. Do those
chips even exist ?

> +	else {
> +		dev_err(dev, "Unknwon device for HS300x driver\n");
> +		goto error;
> +	}
> +
> +	/* Measure humidity and temperature to initialize values */

What for ? That unnecessarily delays booting significantly.

> +	ret = hs300x_measure_command(client, data);
> +	if (ret) {
> +		goto error;
> +	}

Please run checkpatch --strict on your patches.

> +
> +	/* Sensor needs some time to process measurement depending on
> +	 * resolution
> +	 */
> +	fsleep(data->wait_time);
> +
> +	ret = hs300x_data_fetch_command(client, data);
> +	if (ret != HS300X_CMD_OK) {
> +		goto error;
> +	}
> +
> +	hwmon_dev =
> +	    devm_hwmon_device_register_with_groups(dev, client->name, data,
> +						   attribute_groups);

From Documentation/hwmon/hwmon-kernel-api.rst (with emphasis added):

devm_hwmon_device_register_with_info is similar to
hwmon_device_register_with_info. However, it is device managed, meaning the
hwmon device does not have to be removed explicitly by the removal function.

vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
All other hardware monitoring device registration functions are deprecated
and must not be used in new drivers.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> +
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(dev, "Unable to register hwmon device %s\n",
> +			client->name);
> +		goto error;

		return PTR_ERR(hwmon_dev);

> +	}
> +
> +	dev_info(dev, "Successfully probe %s: sensor '%s'\n",
> +		 dev_name(hwmon_dev), client->name);

Please no such noise.

> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +error:
> +	devm_kfree(dev, data);

Pointless.

> +	return -ENODEV;
> +}
> +
> +/* device ID table */
> +static const struct i2c_device_id hs300x_ids[] = {
> +	{ "hs3001", hs3001 },
> +	{ "hs3002", hs3002 },
> +	{ "hs3003", hs3003 },
> +	{ "hs3004", hs3004 },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, hs300x_ids);
> +
> +static struct i2c_driver hs300x_i2c_driver = {
> +	.driver = {
> +		   .name = "hs300x",
> +		   .of_match_table = of_match_ptr(hs300x_of_ids),

Drop 
> +		    },
> +	.probe_new = hs300x_probe,
> +	.id_table = hs300x_ids,
> +};
> +
> +module_i2c_driver(hs300x_i2c_driver);
> +
> +MODULE_AUTHOR("Andre Werner <andre.werner@systec-electronic.com>");
> +MODULE_DESCRIPTION("HS300x humidity and temperature sensor base  driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.41.0
> 
