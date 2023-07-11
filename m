Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBEFEB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 16:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbjGKQfD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjGKQeo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 12:34:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4F91FE1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:34:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AFC86155B
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 16:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288E4C433CB;
        Tue, 11 Jul 2023 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689093247;
        bh=9XYZKQC89x7GcUo3O+TmCpx/3NSDfAOK6WyXbR0F6qY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sctQU7oWMPj9gisdKf/Tm6mH9tqP6diHNzAzbq19Lv8mh9KJiQZCOvS4aJIFiFhgf
         8R2OlU5bJe/GM09gQa29JKKIEgnywylbQgFGfZgay3+CjEcqflVuZA9pXoplMo0IMr
         kDtbiHfqwQsUpkG4MQeDpj7g47FyuvOqcc+QZzDPCl9lVBw4m+2EK4kXKOMBodKRor
         oR5R1K0z1gc8aoZa1hVf7NRreQBj+Cak5GyS2RdLx1wEyZrQUuOSnlny5nugnGtnk9
         p5bNtNZgooemLvqhzACq436YYNGeYX7b67209jKCyAhIV9d0r4GpKbm4JXXCWODqZf
         LrsR0biDpI5aw==
Message-ID: <76cd3399-e1e4-e28a-ea33-70aa3f858d15@kernel.org>
Date:   Tue, 11 Jul 2023 18:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] hwmon: (hs300x) Add driver for Renesas HS300x
Content-Language: en-US
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230711140637.4909-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230711140637.4909-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/07/2023 16:06, Andre Werner wrote:
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

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

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
> +
> +The driver does not support the sensor's configuration possibilities.
> +
> +The driver is able to be read out using lmsensors.
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
> +
> +/* Measurement times */
> +#define HS300X_WAKEUP_TIME 100	/* us */
> +#define HS300X_UNUSED 0		/* us */
> +#define HS300X_8BIT_RESOLUTION 550	/* us */
> +#define HS300X_10BIT_RESOLUTION 1310	/* us */
> +#define HS300X_12BIT_RESOLUTION 4500	/* us */
> +#define HS300X_14BIT_RESOLUTION 16900	/* us */
> +
> +#define HS300X_CMD_OK 0
> +#define HS300X_RESPONSE_LENGTH 4
> +
> +#define HS300X_FIXPOINT_ARITH 1000
> +#define HS300X_MIN_TEMPERATURE (-40 * HS300X_FIXPOINT_ARITH) /* 1000 degree */
> +#define HS300X_MAX_TEMPERATURE (125 * HS300X_FIXPOINT_ARITH) /* 1000 degree */
> +#define HS300X_MIN_HUMIDITY (0 * HS300X_FIXPOINT_ARITH) /* 1000 % */
> +#define HS300X_MAX_HUMIDITY (100 * HS300X_FIXPOINT_ARITH) /* 1000 % */
> +
> +#define HS300X_MASK_HUMIDITY_0X3FFF (0x3FFF)
> +#define HS300X_MASK_TEMPERATURE_0XFFFC (0xFFFC)
> +#define HS300X_MASK_STATUS_0XC0 (0xC0)
> +#define HS300X_STATUS_SHIFT (6)
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
> +	u32 hum_acc;		/* accurancy of humidity in *1000 % */
> +	u32 temp_acc;		/* accurancy of temperature in *1000 % */
> +};
> +
> +const struct hs300x_accurancy hs300x_accurancys[] = {

Missing statuc

> +	{ 1500, 200 },
> +	{ 1800, 200 },
> +	{ 2500, 250 },
> +	{ 3500, 300 },
> +};
> +
> +struct hs300x_data {

Don't mix declarations and definitions.

> +	struct i2c_client *client;
> +	struct mutex i2c_lock;	/* lock for sending i2c commands */

Why? I think I2C device do not need to do it.


> +	struct mutex data_lock;	/* lock for updating driver data */
> +	u32 wait_time;		/* in us */
> +	int temperature;	/* in *1000 degree */
> +	u32 humidity;		/* in *1000 % */
> +};
> +


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

How is it possible?

> +
> +	client = data->client;
> +
> +	if (!client) {

How is this possible?

Both suggest you have some troubles in probe.

> +		dev_dbg(dev, "No valid I2C client available.\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = hs300x_measure_command(client, data);
> +	if (ret != HS300X_CMD_OK)
> +		return ret;

...

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
> +	 *      measurment time humidity This is currently static, because

Fix typos. Remove weird indentation after *

> +	 *      enabling programming mode is not supported, yet.
> +	 */
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
> +	else {
> +		dev_err(dev, "Unknwon device for HS300x driver\n");
> +		goto error;
> +	}
> +
> +	/* Measure humidity and temperature to initialize values */
> +	ret = hs300x_measure_command(client, data);
> +	if (ret) {
> +		goto error;
> +	}

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +
> +	/* Sensor needs some time to process measurement depending on
> +	 * resolution
> +	 */
> +	fsleep(data->wait_time);
> +
> +	ret = hs300x_data_fetch_command(client, data);
> +	if (ret != HS300X_CMD_OK) {
> +		goto error;

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +	}
> +
> +	hwmon_dev =

Don't wrap.

> +	    devm_hwmon_device_register_with_groups(dev, client->name, data,
> +						   attribute_groups);
> +
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(dev, "Unable to register hwmon device %s\n",
> +			client->name);

return dev_err_probe

> +		goto error;
> +	}
> +
> +	dev_info(dev, "Successfully probe %s: sensor '%s'\n",
> +		 dev_name(hwmon_dev), client->name);

Nope, no prints like that.

> +	return PTR_ERR_OR_ZERO(hwmon_dev);

Blank line.

> +error:
> +	devm_kfree(dev, data);

You did not test it. You have double free here. If you do not believe,
please test it.

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

Drop of_match_ptr and all ifdefs for OF.

Best regards,
Krzysztof

