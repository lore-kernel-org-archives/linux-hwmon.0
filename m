Return-Path: <SRS0=rl+N=XZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04BDC32792
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Sep 2019 14:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89F7221906
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Sep 2019 14:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+XEq9fr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731824AbfI3O4X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Sep 2019 10:56:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37061 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730780AbfI3O4W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Sep 2019 10:56:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id y5so5769993pfo.4
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Sep 2019 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W5amik/PgIZl/2MqQ6vsO9J+gDVfNJVBV22K4GJ7O8k=;
        b=r+XEq9fr1G0oEVZ3ZlcOM4qqbwEbJ/PwIMsAAvVQ9IedbQoDZhWzdJGm+4FmlVYRAE
         CUvJaX4EO5W4mEFsC0qA008THXMfK1HAPMpvfPtrpdQL1W1aRTNB7/T0dKmSu44P+Hoc
         ZIOhSxUyEZGmBnpWyuvtXv6RmxAOrmGSXVdC93tfmrBxIqUjdT0yr6ZQqNKXv2jjO1Dg
         hvnpxJBvWa+yIqJS7Ck6cuq6XT6F8tRjiQnKt4kIEQJRbGCWJw4FqHW4lttFxdI1WBVR
         MFxAhlsFTkoHp11NNxtF8AoZTzYwgS5Dzw5QTfEmC7Fg8GmzPqxUU+q1jUwp7u1t8Xvq
         6fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=W5amik/PgIZl/2MqQ6vsO9J+gDVfNJVBV22K4GJ7O8k=;
        b=DXOwKu3ca/7D4DhMcei/HQc7o7s3htI0/Ga4IXAlHd7FDE+32FuScpn8X0hcN6xInP
         mtLUYlobK11bx3IMyvIhaaDazcFyXq2QK1qZEgcnkwPhI5Vins2k/mmlb0Hyy7n9WmwG
         7tTWMdSLoeREdf0tCYYKO+vK8rbzfqUiiFZ1NbiNMQ6UJ1gnnmQQ5vsNgYcJCUn4NMlA
         DcFtOanTl+FZMlAUsQjaLdBzT78uzs94m+PH7U1lNrSzQThIKZN8kIcXoyJN85VwWtSb
         WtFKzT6K0YpdEvCz867vSGT9kUIMt1qIYd3B+TTn++YE28GmsmIehOUk8NpuvQ83eIz1
         uQVA==
X-Gm-Message-State: APjAAAVx9dupUbZxHcs855c1el/8KYu/7k3XijqiC+PoUrKrdDOFEJ27
        iQOyG1BV96W1Rq1323ze0NE=
X-Google-Smtp-Source: APXvYqyua9qTnje/I4AqrfbPW2kQKPR8YU2b5HlAsbawViHoBnfpK8uMNu/3/A0cIhDb/YB1YwlJGA==
X-Received: by 2002:a17:90a:9ab:: with SMTP id 40mr27366028pjo.38.1569855379673;
        Mon, 30 Sep 2019 07:56:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z29sm17639069pff.23.2019.09.30.07.56.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 07:56:18 -0700 (PDT)
Date:   Mon, 30 Sep 2019 07:56:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Message-ID: <20190930145617.GA28969@roeck-us.net>
References: <BL0PR01MB4835F78BC92478EDDCB32F9195850@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB4835F78BC92478EDDCB32F9195850@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 23, 2019 at 07:29:48PM +0000, Tremblay, Eric wrote:
> Add driver for Texas Instruments TMP512/513 sensor chips.
> 
> TI's TMP512/513 are I2C/SMBus system monitor chips. These chips
> monitor the supply voltage, supply current, power consumption and
> provide one local and up to three (TMP513) remote temperature sensors.
> 
> It has been tested using a TI TMP513 development kit (TMP513EVM)
> 
Not a complete review, and sorry for the late reply.

> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/tmp513.txt      |  24 +
>  Documentation/hwmon/tmp513.rst                | 118 +++
>  MAINTAINERS                                   |   7 +
>  drivers/hwmon/Kconfig                         |  10 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/tmp513.c                        | 910 ++++++++++++++++++
>  6 files changed, 1070 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
>  create mode 100644 Documentation/hwmon/tmp513.rst
>  create mode 100644 drivers/hwmon/tmp513.c
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> new file mode 100644
> index 000000000000..9f6498607736
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> @@ -0,0 +1,24 @@
> +TMP513 system monitor sensor
> +-------------------------
> +
> +Requires node properties:
> +- compatible: one of
> +		"ti,tmp512"
> +		"ti,tmp513"
> +- reg : the I2C address of the device. This is 0x5c, 0x5d, 0x5e, or 0x5f.
> +- shunt-resistor-mohm : The shunt resistor value in mohm.
> +
> +Optional properties:
> +- bus-voltage-range: 32V or 16V, default to 32V.
> +- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Default to 8.
> +- max-expected-current-ma: Maximum current value that is expected. Default to max value.
> +
> +Example:
> +	tmp513@5c {
> +		  compatible = "ti,tmp513";
> +		  reg = <0x5C>;
> +		  shunt-resistor-mohm = <330>;

We commonly have shunt resistor values in uOhm since sometimes fractions of mOhm
are used.

> +		  bus-voltage-range = <32>;
> +		  pga-gain = <8>;
> +		  max-expected-current-ma = <100>;
> +	};
> diff --git a/Documentation/hwmon/tmp513.rst b/Documentation/hwmon/tmp513.rst
> new file mode 100644
> index 000000000000..adc99e79287b
> --- /dev/null
> +++ b/Documentation/hwmon/tmp513.rst
> @@ -0,0 +1,118 @@
> +Kernel driver tmp513
> +====================
> +
> +Supported chips:
> +
> +  * Texas Instruments TMP512
> +
> +    Prefix: 'tmp512'
> +
> +    Datasheet: http://www.ti.com/lit/ds/symlink/tmp512.pdf
> +
> +  * Texas Instruments TMP513
> +
> +    Prefix: 'tmp513'
> +
> +    Datasheet: http://www.ti.com/lit/ds/symlink/tmp513.pdf
> +
> +Authors:
> +
> +	Eric Tremblay <etremblay@distech-controls.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Texas Instruments TMP512, and TMP513
> +temperature and power supply sensor chips. These chips implement one
> +local and up to three (TMP513) temperature sensor. The chips also implement
> +power supply monitoring such as shunt voltage, shunt current, bus voltage
> +and power consumption.
> +
> +The temperatures are measured in degrees Celsius with a range of
> +-40 to + 125 degress Celcius with a resolution of 0.0625 degree C.
> +The nfactor of the diode can by configured on each channel and a
> +global hysteresis value for the alarms can be set.
> +
> +The driver exports the temperature values via the following sysfs files:
> +
> +**temp[1-4]_input**
> +
> +**temp[1-4]_crit**
> +
> +**temp[1-4]_crit_alarm**
> +
> +**temp[1-4]_nfactor**
> +
This is a nonstandard attribute. As outlined in
Documentation/hwmon/submitting-patches.rst, please provide a rationale why this
needs to be confiurable at runtime (vs. devicetree).

> +**temp_hyst**
> +
> +The shunt voltage is measured in micro volts. There are four configurable
> +range: 320mV, 160mV, 80mV and 40mV all of them with a resolution of 10 uV.
> +The range depends on the pga gain specified in the device tree
> +with "pga-gain" (default to 8). The range will be equal to pga gain
> +multiply by 40mV.
> +
> +The driver exports the shunt voltage values via the following sysFs files:
> +
> +**in0_input**
> +
> +**in0_lcrit**
> +
> +**in0_lcrit_alarm**
> +
> +**in0_crit**
> +
> +**in0_crit_alarm**
> +
> +The bus voltage is measured in milli volts. There are two configuable
> +range: 32V and 16V both with a resolution of 4mV. It can be configured in the
> +device tree with "bus-voltage-range" (default to 32V);
> +
> +The driver exports the bus voltage values via the following sysFs files:
> +
> +**in0_input**
> +
> +**in0_lcrit**
> +
> +**in0_lcrit_alarm**
> +
> +**in0_crit**
> +
> +**in0_crit_alarm**
> +
> +The power and the currents range and resolution depends on the calibration
> +register value. Those values are calculate by the hardware using those
> +formula:
> +
> +Current = (ShuntVoltage * CalibrationRegister) / 4096
> +Power   = (Current * BusVoltage) / 5000
> +
> +The driver exports the current and power values via the following sysFs files:
> +
> +**curr0_input**
> +
> +**power1_input**
> +
> +**power1_crit**
> +
> +**power1_crit_alarm**
> +
> +The calibration process follow the procedure of the datasheet (without overflow)
> +and depend on the shunt resistor value, needed in the device tree "shunt-resistor-mohm".
> +It also depends on the pga gain and the maximum expected current, also specified from
> +the device tree "max-expected-current-ma". If not specified it default to the maximum
> +possible current depending on the pga gain. The shunt resistor value and the device
> +address are the only mandatory parameters needed in the device tree.
> +
> +The calibration value can be set from the sysFs file:
> +
> +**shunt_calibration**
> +
> +The drivers also export some register raw value:
> +
> +**shunt_config**
> +
> +**temp_config**
> +
> +**status**
> +
> +**smbus_alart**

Please provide rationale why those sysfs attributes are needed.
Please note that raw values are in general unacceptable.


> diff --git a/MAINTAINERS b/MAINTAINERS
> index a400af0501c9..2b46adb14ced 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16347,6 +16347,13 @@ S:	Maintained
>  F:	Documentation/hwmon/tmp401.rst
>  F:	drivers/hwmon/tmp401.c
>  
> +TMP513 HARDWARE MONITOR DRIVER
> +M:	Eric Tremblay <etremblay@distech-controls.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/tmp513.rst
> +F:	drivers/hwmon/tmp513.c
> +
>  TMPFS (SHMEM FILESYSTEM)
>  M:	Hugh Dickins <hughd@google.com>
>  L:	linux-mm@kvack.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 13a6b4afb4b3..926e3c98dbdf 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1709,6 +1709,16 @@ config SENSORS_TMP421
>  	  This driver can also be built as a module. If so, the module
>  	  will be called tmp421.
>  
> +config SENSORS_TMP513
> +	tristate "Texas Instruments TMP513 and compatibles"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for Texas Instruments TMP512,
> +	  and TMP513 temperature and power supply sensor chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called tmp513.
> +
>  config SENSORS_VEXPRESS
>  	tristate "Versatile Express"
>  	depends on VEXPRESS_CONFIG
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 40c036ea45e6..762642291914 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -166,6 +166,7 @@ obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
>  obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
>  obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
>  obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
> +obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
>  obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
>  obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
>  obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> new file mode 100644
> index 000000000000..44b8f15316f6
> --- /dev/null
> +++ b/drivers/hwmon/tmp513.c
> @@ -0,0 +1,910 @@
> +/*
> + * Driver for Texas Instruments TMP512, TMP513 power monitor chips
> + *
> + * TMP513:
> + * Thermal/Power Management with Triple Remote and
> + * Local Temperature Sensor and Current Shunt Monitor
> + * Datasheet: http://www.ti.com/lit/gpn/tmp513
> + *
> + * TMP512:
> + * Thermal/Power Management with Dual Remote
> + *	and Local Temperature Sensor and Current Shunt Monitor
> + * Datasheet: http://www.ti.com/lit/gpn/tmp512
> + *
> + * Copyright (C) 2019 Eric Tremblay <etremblay@distechcontrols.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/util_macros.h>
> +
> +// common register definition
> +#define TMP51X_SHUNT_CONFIG		0x00
> +#define TMP51X_TEMP_CONFIG		0x01
> +#define TMP51X_STATUS			0x02
> +#define TMP51X_SMBUS_ALERT		0x03
> +#define TMP51X_SHUNT_VOLTAGE_RESULT	0x04
> +#define TMP51X_BUS_VOLTAGE_RESULT	0x05
> +#define TMP51X_POWER_RESULT		0x06
> +#define TMP51X_SHUNT_CURRENT_RESULT	0x07
> +#define TMP51X_LOCAL_TEMP_RESULT	0x08
> +#define TMP51X_REMOTE_TEMP_RESULT_1	0x09
> +#define TMP51X_REMOTE_TEMP_RESULT_2	0x0A
> +#define TMP51X_SHUNT_VOLTAGE_H_LIMIT	0x0C
> +#define TMP51X_SHUNT_VOLTAGE_L_LIMIT	0x0D
> +#define TMP51X_BUS_VOLTAGE_H_LIMIT	0x0E
> +#define TMP51X_BUS_VOLTAGE_L_LIMIT	0x0F
> +#define TMP51X_POWER_LIMIT		0x10
> +#define TMP51X_LOCAL_TEMP_LIMIT		0x11
> +#define TMP51X_REMOTE_TEMP_LIMIT_1	0x12
> +#define TMP51X_REMOTE_TEMP_LIMIT_2	0x13
> +#define TMP51X_SHUNT_CALIBRATION	0x15
> +#define TMP51X_N_FACTOR_AND_HYST_1	0x16
> +#define TMP51X_N_FACTOR_2		0x17
> +#define TMP51X_MAN_ID_REG		0xFE
> +#define TMP51X_DEVICE_ID_REG		0xFF
> +
> +// TMP513 specific register definition
> +#define TMP513_REMOTE_TEMP_RESULT_3	0x0B
> +#define TMP513_REMOTE_TEMP_LIMIT_3	0x14
> +#define TMP513_N_FACTOR_3		0x18
> +
> +// common attrs, tmp513 attrs and NULL
> +#define TMP51X_MAX_ATTRIBUTE_GROUPS	3
> +#define TMP51X_MANUFACTURER_ID		0x55FF
> +
> +#define TMP512_DEVICE_ID		0x22FF
> +#define TMP513_DEVICE_ID		0x23FF
> +
> +// Default config
> +#define TMP51X_SHUNT_CONFIG_DEFAULT	0x399F
> +#define TMP51X_TEMP_LIMIT_DEFAULT	0x2A80
> +#define TMP51X_MAX_REGISTER_ADDR	0xFF
> +
> +#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
> +#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
> +
> +// mask and shift
> +#define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
> +#define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
> +#define CURRENT_SENSE_VOLTAGE_80_MASK	0x0800
> +#define CURRENT_SENSE_VOLTAGE_40_MASK	0
> +
> +#define TMP51X_BUS_VOLTAGE_MASK		0x2000
> +#define TMP51X_PGA_MASK			0x1800
> +#define TMP51X_N_FACTOR_MASK		0xFF00
> +#define TMP51X_HYST_MASK		0x00FF
> +
> +#define TMP51X_BUS_VOLTAGE_SHIFT	3
> +#define TMP51X_TEMP_SHIFT		3
> +
> +// Alarms
> +#define TMP51X_SHUNT_VOLTAGE_H_LIMIT_POS	15
> +#define TMP51X_SHUNT_VOLTAGE_L_LIMIT_POS	14
> +#define TMP51X_BUS_VOLTAGE_H_LIMIT_POS		13
> +#define TMP51X_BUS_VOLTAGE_L_LIMIT_POS		12
> +#define TMP51X_POWER_LIMIT_POS			11
> +#define TMP51X_LOCAL_TEMP_LIMIT_POS		10
> +#define TMP51X_REMOTE_TEMP_LIMIT_1_POS		9
> +#define TMP51X_REMOTE_TEMP_LIMIT_2_POS		8
> +#define TMP513_REMOTE_TEMP_LIMIT_3_POS		7
> +
> +// Value type for register with more than one value
> +#define TMP51X_N_FACTOR_ELEM		0
> +#define TMP51X_HYST_ELEM		1
> +
> +static struct regmap_config tmp51x_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
> +enum tmp51x_ids {
> +	tmp512, tmp513
> +};
> +
> +struct tmp51x_config {
> +	int shunt_config;
> +	int pga_shift;
> +	int pga_gain;
> +	int rshunt;
> +	int max_curr_ma;
> +
> +	int temp_config;
> +
> +	int curr_lsb;
> +	int pwr_lsb;
> +	int registers;
> +};
> +
> +struct tmp51x_data {
> +	struct tmp51x_config *config;
> +
> +	struct regmap *regmap;
> +	struct mutex config_lock;
> +	const struct attribute_group *groups[TMP51X_MAX_ATTRIBUTE_GROUPS];
> +};
> +
> +static struct tmp51x_config tmp51x_config[] = {
> +	[tmp512] = {
> +		.shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT,
> +		.pga_shift = 1,
> +		.pga_gain = 8,
> +		.temp_config = TMP512_TEMP_CONFIG_DEFAULT,
> +		.registers = TMP51X_MAX_REGISTER_ADDR,
> +	},
> +	[tmp513] = {
> +		.shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT,
> +		.pga_shift = 1,
> +		.pga_gain = 8,
> +		.temp_config = TMP513_TEMP_CONFIG_DEFAULT,
> +		.registers = TMP51X_MAX_REGISTER_ADDR,
> +	},
> +};
> +
> +static int tmp51x_get_value(struct tmp51x_data *data, u8 reg,
> +			    unsigned int regval)
> +{
> +	int val;
> +
> +	switch (reg) {
> +	case TMP51X_STATUS:
> +	case TMP51X_SHUNT_CONFIG:
> +	case TMP51X_TEMP_CONFIG:
> +	case TMP51X_SMBUS_ALERT:
> +	case TMP51X_SHUNT_CALIBRATION:
> +		val = regval;
> +		break;
> +	case TMP51X_SHUNT_VOLTAGE_RESULT:
> +	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +		/* 2's compliment number shifted by one to four depending
> +		 * on the pga gain setting.
> +		 * 1lsb = 10uV
> +		 */
> +		val = sign_extend32(regval, 16 - data->config->pga_shift);
> +		val = DIV_ROUND_CLOSEST(val, 100);
> +		break;
> +	case TMP51X_BUS_VOLTAGE_RESULT:
> +	case TMP51X_BUS_VOLTAGE_H_LIMIT:
> +	case TMP51X_BUS_VOLTAGE_L_LIMIT:
> +		// 1lsb = 4uV
> +		val = (regval >> TMP51X_BUS_VOLTAGE_SHIFT) * 4;
> +		break;
> +	case TMP51X_POWER_RESULT:
> +	case TMP51X_POWER_LIMIT:
> +		// Power = (current * BusVoltage) / 5000
> +		val = regval * data->config->pwr_lsb;
> +		break;
> +	case TMP51X_SHUNT_CURRENT_RESULT:
> +		// Current = (ShuntVoltage * CalibrationRegister) / 4096
> +		val = sign_extend32(regval, 15) * data->config->curr_lsb;
> +		break;
> +	case TMP51X_LOCAL_TEMP_RESULT:
> +	case TMP51X_REMOTE_TEMP_RESULT_1:
> +	case TMP51X_REMOTE_TEMP_RESULT_2:
> +	case TMP513_REMOTE_TEMP_RESULT_3:
> +	case TMP51X_LOCAL_TEMP_LIMIT:
> +	case TMP51X_REMOTE_TEMP_LIMIT_1:
> +	case TMP51X_REMOTE_TEMP_LIMIT_2:
> +	case TMP513_REMOTE_TEMP_LIMIT_3:
> +		// 1lsb = 0.0625 degrees centigrade
> +		val = DIV_ROUND_CLOSEST((regval >> TMP51X_TEMP_SHIFT) * 625,
> +					10);
> +		break;
> +	default:
> +		/* programmer goofed */

Either only C++ style comments or C style comments, please,
but not a mix of both.

> +		WARN_ON_ONCE(1);
> +		val = 0;
> +		break;
> +	}
> +
> +	return val;
> +}
> +
> +static int tmp51x_get_value_2(struct tmp51x_data *data, u8 reg, u8 elem,
> +			      unsigned int regval)
> +{
> +	int val;
> +
> +	switch (reg) {
> +	case TMP51X_N_FACTOR_AND_HYST_1:
> +		if (elem == TMP51X_N_FACTOR_ELEM) {
> +			val = (regval & TMP51X_N_FACTOR_MASK) >> 8;
> +		} else if (elem == TMP51X_HYST_ELEM) {
> +			val = (regval & TMP51X_HYST_MASK) * 500;
> +		} else {
> +			/* programmer goofed */
> +			WARN_ON_ONCE(1);
> +			val = 0;
> +		}
> +		break;
> +	case TMP51X_STATUS:
> +		switch (elem) {
> +		case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +			val = (regval >> TMP51X_SHUNT_VOLTAGE_H_LIMIT_POS) & 1;
> +			break;
> +		case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +			val = (regval >> TMP51X_SHUNT_VOLTAGE_L_LIMIT_POS) & 1;
> +			break;
> +		case TMP51X_BUS_VOLTAGE_H_LIMIT:
> +			val = (regval >> TMP51X_BUS_VOLTAGE_H_LIMIT_POS) & 1;
> +			break;
> +		case TMP51X_BUS_VOLTAGE_L_LIMIT:
> +			val = (regval >> TMP51X_BUS_VOLTAGE_L_LIMIT_POS) & 1;
> +			break;
> +		case TMP51X_POWER_LIMIT:
> +			val = (regval >> TMP51X_POWER_LIMIT_POS) & 1;
> +			break;
> +		case TMP51X_LOCAL_TEMP_LIMIT:
> +			val = (regval >> TMP51X_LOCAL_TEMP_LIMIT_POS) & 1;
> +			break;
> +		case TMP51X_REMOTE_TEMP_LIMIT_1:
> +			val = (regval >> TMP51X_REMOTE_TEMP_LIMIT_1_POS) & 1;
> +			break;
> +		case TMP51X_REMOTE_TEMP_LIMIT_2:
> +			val = (regval >> TMP51X_REMOTE_TEMP_LIMIT_2_POS) & 1;
> +			break;
> +		case TMP513_REMOTE_TEMP_LIMIT_3:
> +			val = (regval >> TMP513_REMOTE_TEMP_LIMIT_3_POS) & 1;
> +			break;
> +		default:
> +			/* programmer goofed */
> +			WARN_ON_ONCE(1);
> +			val = 0;
> +			break;
> +		}
> +		break;
> +	default:
> +		/* programmer goofed */
> +		WARN_ON_ONCE(1);
> +		val = 0;
> +		break;
> +	}
> +
> +	return val;
> +}
> +
> +static int tmp51x_set_value(struct device *dev, u8 reg, long val)
> +{
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	int regval, ret;
> +
> +	mutex_lock(&data->config_lock);
> +
> +	switch (reg) {
> +	case TMP51X_SHUNT_CONFIG:
> +	case TMP51X_TEMP_CONFIG:
> +	case TMP51X_SMBUS_ALERT:
> +		regval = val;
> +		break;
> +	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +		// User must make sure to be between the configured range
> +		// 1lsb = 10uv
> +		regval = val * 100;
> +		break;
> +	case TMP51X_BUS_VOLTAGE_H_LIMIT:
> +	case TMP51X_BUS_VOLTAGE_L_LIMIT:
> +		// 1lsb = 4uv
> +		regval = DIV_ROUND_CLOSEST(val, 4) << TMP51X_BUS_VOLTAGE_SHIFT;
> +		break;
> +	case TMP51X_POWER_LIMIT:
> +		regval = DIV_ROUND_CLOSEST(val, data->config->pwr_lsb);
> +		break;
> +	case TMP51X_LOCAL_TEMP_LIMIT:
> +	case TMP51X_REMOTE_TEMP_LIMIT_1:
> +	case TMP51X_REMOTE_TEMP_LIMIT_2:
> +	case TMP513_REMOTE_TEMP_LIMIT_3:
> +		// 1lsb = 0.0625 degrees centigrade
> +		regval = DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TEMP_SHIFT;
> +		break;
> +	case TMP51X_SHUNT_CALIBRATION:
> +		/* If calibration is adjust from user space,
> +		 * lsb value for current and power need to adjusted
> +		 */

Please use common coding style. This is not the networking subsystem.

> +		data->config->curr_lsb =
> +			DIV_ROUND_CLOSEST(40960000, val * data->config->rshunt);
> +		data->config->pwr_lsb = 20 * data->config->curr_lsb;
> +		regval = val;
> +		break;
> +	default:
> +		/* programmer goofed */
> +		WARN_ON_ONCE(1);
> +		regval = 0;
> +		break;
> +	}
> +
> +	dev_info(dev, "write register %02X, val = 0x%04x\n", reg, regval);
> +
> +	ret = regmap_write(data->regmap, reg, regval);
> +
> +	mutex_unlock(&data->config_lock);
> +
> +	return ret;
> +}
> +
> +static int tmp51x_set_value_2(struct device *dev, u8 reg, u8 elem, long val)
> +{
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	int regval, ret;
> +	unsigned int mask;
> +
> +	mutex_lock(&data->config_lock);
> +
> +	switch (reg) {
> +	case TMP51X_N_FACTOR_AND_HYST_1:
> +		if (elem == TMP51X_N_FACTOR_ELEM) {
> +			mask = TMP51X_N_FACTOR_MASK;
> +			regval = (val << 8) & mask;
> +		} else if (elem == TMP51X_HYST_ELEM) {
> +			mask = TMP51X_HYST_MASK;
> +			regval = DIV_ROUND_CLOSEST(val, 500) & mask;
> +		} else {
> +			/* programmer goofed */
> +			WARN_ON_ONCE(1);
> +			regval = 0;
> +			mask = 0;
> +		}
> +		break;
> +	default:
> +		/* programmer goofed */
> +		WARN_ON_ONCE(1);
> +		regval = 0;
> +		mask = 0;
> +		break;
> +	}
> +
> +	dev_info(dev, "update register 0x%02X, mask = 0x%04X, val = 0x%04x\n",
> +		 reg, mask, regval);

Not acceptable. No info messages as part of normal operation, please.
Such messages are only acceptable as debug messages.

> +
> +	ret = regmap_update_bits(data->regmap, reg, mask, regval);
> +
> +	mutex_unlock(&data->config_lock);
> +
> +	return ret;
> +}
> +
> +static int tmp51x_read_reg(struct device *dev, int reg, unsigned int *regval)
> +{
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	//todo replace by dev_dbg

Please no TODO in submissions unless tagged as RFC.

> +	dev_info(dev, "Starting register %02X read\n", reg);
> +
> +	ret = regmap_read(data->regmap, reg, regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_info(dev, "read %02X, val = 0x%04x\n", reg, *regval);
> +
> +	return 0;
> +}
> +
> +static ssize_t tmp51x_show_value(struct device *dev,
> +				 struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int err;
> +
> +	err = tmp51x_read_reg(dev, attr->index, &regval);
> +	if (err < 0)
> +		return err;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n",
> +			tmp51x_get_value(data, attr->index, regval));
> +}
> +
> +static ssize_t tmp51x_show_hex_value(struct device *dev,
> +				     struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int err;
> +
> +	err = tmp51x_read_reg(dev, attr->index, &regval);
> +	if (err < 0)
> +		return err;
> +
> +	return snprintf(buf, PAGE_SIZE, "%04x\n",
> +			tmp51x_get_value(data, attr->index, regval));
> +}
> +
> +static ssize_t tmp51x_show_value_2(struct device *dev,
> +				   struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int err;
> +
> +	err = tmp51x_read_reg(dev, attr->index, &regval);
> +	if (err < 0)
> +		return err;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n",
> +			tmp51x_get_value_2(data, attr->index, attr->nr,
> +					   regval));
> +}
> +
> +static ssize_t tmp51x_store_value(struct device *dev,
> +				  struct device_attribute *da,
> +				  const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	long val;
> +	int status;
> +
> +	status = kstrtol(buf, 10, &val);
> +	if (status < 0)
> +		return status;
> +
> +	status = tmp51x_set_value(dev, attr->index, val);
> +	if (status < 0)
> +		return status;
> +
> +	return count;
> +}
> +
> +static ssize_t tmp51x_store_hex_value(struct device *dev,
> +				      struct device_attribute *da,
> +				      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	long val;
> +	int status;
> +
> +	status = kstrtol(buf, 16, &val);
> +	if (status < 0)
> +		return status;
> +
> +	status = tmp51x_set_value(dev, attr->index, val);
> +	if (status < 0)
> +		return status;
> +
> +	return count;
> +}
> +
> +static ssize_t tmp51x_store_value_2(struct device *dev,
> +				    struct device_attribute *da,
> +				    const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
> +	long val;
> +	int status;
> +
> +	status = kstrtol(buf, 10, &val);
> +	if (status < 0)
> +		return status;
> +
> +	status = tmp51x_set_value_2(dev, attr->index, attr->nr, val);
> +	if (status < 0)
> +		return status;
> +
> +	return count;
> +}
> +
> +/* raw status register */
> +static SENSOR_DEVICE_ATTR(status, 0444, tmp51x_show_hex_value, NULL,
> +			  TMP51X_STATUS);
> +
> +/* raw shunt config register */
> +static SENSOR_DEVICE_ATTR(shunt_config, 0644,
> +			  tmp51x_show_hex_value, tmp51x_store_hex_value,
> +			  TMP51X_SHUNT_CONFIG);
> +
> +/* raw temperature config register */
> +static SENSOR_DEVICE_ATTR(temp_config, 0644, tmp51x_show_hex_value,
> +			  tmp51x_store_hex_value, TMP51X_TEMP_CONFIG);
> +
> +/* raw smbus alert register */
> +static SENSOR_DEVICE_ATTR(smbus_alert, 0644, tmp51x_show_hex_value,
> +			  tmp51x_store_hex_value, TMP51X_SMBUS_ALERT);
> +
> +/* shunt voltage result */
> +static SENSOR_DEVICE_ATTR(in0_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_SHUNT_VOLTAGE_RESULT);
> +
> +/* bus voltage result */
> +static SENSOR_DEVICE_ATTR(in1_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_BUS_VOLTAGE_RESULT);
> +
> +/* power result */
> +static SENSOR_DEVICE_ATTR(power1_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_POWER_RESULT);
> +
> +/* shunt current result */
> +static SENSOR_DEVICE_ATTR(curr1_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_SHUNT_CURRENT_RESULT);
> +
> +/* local temperature result */
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_LOCAL_TEMP_RESULT);
> +
> +/* Remote temperature 1 result */
> +static SENSOR_DEVICE_ATTR(temp2_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_REMOTE_TEMP_RESULT_1);
> +
> +/* Remote temperature 2 result */
> +static SENSOR_DEVICE_ATTR(temp3_input, 0444, tmp51x_show_value, NULL,
> +			  TMP51X_REMOTE_TEMP_RESULT_2);
> +
> +/* Remote temperature 3 result */
> +static SENSOR_DEVICE_ATTR(temp4_input, 0444, tmp51x_show_value, NULL,
> +			  TMP513_REMOTE_TEMP_RESULT_3);
> +
> +/* Shunt voltage positive limit */
> +static SENSOR_DEVICE_ATTR(in0_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_SHUNT_VOLTAGE_H_LIMIT);
> +
> +static SENSOR_DEVICE_ATTR_2(in0_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_SHUNT_VOLTAGE_H_LIMIT, TMP51X_STATUS);
> +
> +/* Shunt voltage negative limit */
> +static SENSOR_DEVICE_ATTR(in0_lcrit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_SHUNT_VOLTAGE_L_LIMIT);
> +
> +static SENSOR_DEVICE_ATTR_2(in0_lcrit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			  TMP51X_SHUNT_VOLTAGE_L_LIMIT, TMP51X_STATUS);
> +
> +/* Bus voltage positive limit */
> +static SENSOR_DEVICE_ATTR(in1_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_BUS_VOLTAGE_H_LIMIT);
> +
> +static SENSOR_DEVICE_ATTR_2(in1_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_BUS_VOLTAGE_H_LIMIT, TMP51X_STATUS);
> +
> +/* Bus voltage negative limit */
> +static SENSOR_DEVICE_ATTR(in1_lcrit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_BUS_VOLTAGE_L_LIMIT);
> +
> +static SENSOR_DEVICE_ATTR_2(in1_lcrit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_BUS_VOLTAGE_L_LIMIT, TMP51X_STATUS);
> +
> +/* Power limit */
> +static SENSOR_DEVICE_ATTR(power1_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_POWER_LIMIT);
> +
> +static SENSOR_DEVICE_ATTR_2(power1_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_POWER_LIMIT, TMP51X_STATUS);
> +
> +/* Local temperature limit */
> +static SENSOR_DEVICE_ATTR(temp1_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_LOCAL_TEMP_LIMIT);
> +
> +static SENSOR_DEVICE_ATTR_2(temp1_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_LOCAL_TEMP_LIMIT, TMP51X_STATUS);
> +
> +/* Remote temperature 1 limit */
> +static SENSOR_DEVICE_ATTR(temp2_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_REMOTE_TEMP_LIMIT_1);
> +
> +static SENSOR_DEVICE_ATTR_2(temp2_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_REMOTE_TEMP_LIMIT_1, TMP51X_STATUS);
> +
> +/* Remote temperature 2 limit */
> +static SENSOR_DEVICE_ATTR(temp3_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_REMOTE_TEMP_LIMIT_2);
> +
> +static SENSOR_DEVICE_ATTR_2(temp3_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP51X_REMOTE_TEMP_LIMIT_2, TMP51X_STATUS);
> +
> +/* Remote temperature 3 limit */
> +static SENSOR_DEVICE_ATTR(temp4_crit, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP513_REMOTE_TEMP_LIMIT_3);
> +
> +static SENSOR_DEVICE_ATTR_2(temp4_crit_alarm, 0444, tmp51x_show_value_2, NULL,
> +			    TMP513_REMOTE_TEMP_LIMIT_3, TMP51X_STATUS);
> +
> +/* Calibration */
> +static SENSOR_DEVICE_ATTR(shunt_calibration, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_SHUNT_CALIBRATION);
> +
> +/* nfactor 1 */
> +static SENSOR_DEVICE_ATTR_2(temp2_nfactor, 0644, tmp51x_show_value_2,
> +			    tmp51x_store_value_2, TMP51X_N_FACTOR_ELEM,
> +			    TMP51X_N_FACTOR_AND_HYST_1);
> +
> +/* hyst 1 */
> +static SENSOR_DEVICE_ATTR_2(temp_hyst, 0644, tmp51x_show_value_2,
> +			    tmp51x_store_value_2, TMP51X_HYST_ELEM,
> +			    TMP51X_N_FACTOR_AND_HYST_1);
> +
> +/* nfactor 2 */
> +static SENSOR_DEVICE_ATTR(temp3_nfactor, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP51X_N_FACTOR_2);
> +
> +/* nfactor 3 */
> +static SENSOR_DEVICE_ATTR(temp4_nfactor, 0644, tmp51x_show_value,
> +			  tmp51x_store_value, TMP513_N_FACTOR_3);
> +
> +
> +/* pointers to created device attributes */
> +static struct attribute *tmp51x_attrs[] = {
> +	&sensor_dev_attr_status.dev_attr.attr,
> +	&sensor_dev_attr_shunt_config.dev_attr.attr,
> +	&sensor_dev_attr_temp_config.dev_attr.attr,
> +	&sensor_dev_attr_smbus_alert.dev_attr.attr,
> +	&sensor_dev_attr_in0_input.dev_attr.attr,
> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_power1_input.dev_attr.attr,
> +	&sensor_dev_attr_curr1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp2_input.dev_attr.attr,
> +	&sensor_dev_attr_temp3_input.dev_attr.attr,
> +	&sensor_dev_attr_in0_crit.dev_attr.attr,
> +	&sensor_dev_attr_in0_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in0_lcrit.dev_attr.attr,
> +	&sensor_dev_attr_in0_lcrit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in1_crit.dev_attr.attr,
> +	&sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in1_lcrit.dev_attr.attr,
> +	&sensor_dev_attr_in1_lcrit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_power1_crit.dev_attr.attr,
> +	&sensor_dev_attr_power1_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp1_crit.dev_attr.attr,
> +	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp2_crit.dev_attr.attr,
> +	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp3_crit.dev_attr.attr,
> +	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_shunt_calibration.dev_attr.attr,
> +	&sensor_dev_attr_temp2_nfactor.dev_attr.attr,
> +	&sensor_dev_attr_temp3_nfactor.dev_attr.attr,
> +	&sensor_dev_attr_temp_hyst.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tmp51x_group = {
> +	.attrs = tmp51x_attrs,
> +};
> +
> +static struct attribute *tmp513_attrs[] = {
> +	&sensor_dev_attr_temp4_input.dev_attr.attr,
> +	&sensor_dev_attr_temp4_crit.dev_attr.attr,
> +	&sensor_dev_attr_temp4_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp4_nfactor.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tmp513_group = {
> +	.attrs = tmp513_attrs,
> +};
> +
> +static int tmp51x_vbus_max_to_reg(struct tmp51x_config *config, u32 vbus_max)
> +{
> +	if (vbus_max == 32)
> +		config->shunt_config |= TMP51X_BUS_VOLTAGE_MASK;
> +	else if (vbus_max == 16)
> +		config->shunt_config &= ~TMP51X_BUS_VOLTAGE_MASK;
> +	else
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static int tmp51x_pga_gain_to_reg(struct tmp51x_config *config, u32 pga_gain)
> +{
> +	config->shunt_config &= ~TMP51X_PGA_MASK;
> +	config->pga_gain = pga_gain;
> +
> +	/* The shift depend on the gain 8=4, 4=3, 2=2, 1=1*/
> +	config->pga_shift = 5 - ffs(pga_gain);
> +
> +	if (pga_gain == 8)
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_320_MASK;
> +	else if (pga_gain == 4)
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_160_MASK;
> +	else if (pga_gain == 2)
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_80_MASK;
> +	else if (pga_gain == 1)
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_40_MASK;
> +	else
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +/*
> + * Calibrate the tmp51x following the datasheet method
> + */
> +static int tmp51x_calibrate(struct tmp51x_data *data)
> +{
> +	int rshunt = data->config->rshunt;
> +	int vshunt_max = data->config->pga_gain * 40;
> +	int val, max_curr_ma;
> +
> +	/* Calculate the maximum current that
> +	 * can flow through the shunt in milliamps.
> +	 */
> +	max_curr_ma = DIV_ROUND_CLOSEST(vshunt_max * 1000, rshunt);
> +	if (max_curr_ma < data->config->max_curr_ma)
> +		data->config->max_curr_ma = max_curr_ma;
> +
> +	/* Calculate the minimal bit resolution for the current and the power.
> +	 * Those values will be used during register interpretation.
> +	 */
> +	data->config->curr_lsb =
> +		DIV_ROUND_CLOSEST(data->config->max_curr_ma * 1000, 32767);
> +	data->config->pwr_lsb = 20 * data->config->curr_lsb;
> +
> +	/* Calculate the calibration register */
> +	val = DIV_ROUND_CLOSEST(data->config->curr_lsb * rshunt, 1000);
> +	val = DIV_ROUND_CLOSEST(40960, val);
> +
> +	return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION, val);
> +}
> +
> +/*
> + * Initialize the configuration and calibration registers.
> + */
> +static int tmp51x_init(struct tmp51x_data *data)
> +{
> +	// Shunt configuration
> +	unsigned int regval;
> +	int ret = regmap_write(data->regmap, TMP51X_SHUNT_CONFIG,
> +			       data->config->shunt_config);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Temperature measurement configuration
> +	ret = regmap_write(data->regmap, TMP51X_TEMP_CONFIG,
> +			       data->config->temp_config);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = tmp51x_calibrate(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Read the status register before using as the datasheet propose
> +	ret = regmap_read(data->regmap, TMP51X_STATUS, &regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id tmp51x_id[] = {
> +	{ "tmp512", tmp512 },
> +	{ "tmp513", tmp513 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tmp51x_id);
> +
> +static const struct of_device_id tmp51x_of_match[] = {
> +	{
> +		.compatible = "ti,tmp512",
> +		.data = (void *)tmp512
> +	},
> +	{
> +		.compatible = "ti,tmp513",
> +		.data = (void *)tmp513
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tmp51x_of_match);
> +
> +static int tmp51x_parse_device_tree(struct device *dev,
> +	struct tmp51x_config *config)
> +{
> +	int ret;
> +	u32 val;
> +
> +	// Mandatory fields
> +	ret = of_property_read_u32(dev->of_node, "shunt-resistor-mohm", &val);
> +	if (ret < 0)
> +		return -ENODEV;
> +
> +	config->rshunt = val;
> +
> +	// Optional field
> +	ret = of_property_read_u32(dev->of_node, "bus-voltage-range", &val);
> +	if (ret >= 0) {
> +		ret = tmp51x_vbus_max_to_reg(config, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "pga-gain", &val);
> +	if (ret >= 0) {
> +		ret = tmp51x_pga_gain_to_reg(config, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "max-expected-current-ma",
> +				   &val);
> +	if (ret >= 0) {
> +		config->max_curr_ma = val;
> +	} else {
> +		config->max_curr_ma =
> +			DIV_ROUND_CLOSEST(config->pga_gain * 40 * 1000,
> +					  config->rshunt);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tmp51x_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct tmp51x_data *data;
> +	struct device *hwmon_dev;
> +	int ret, group = 0;
> +	enum tmp51x_ids chip;
> +
> +	if (client->dev.of_node)
> +		chip = (enum tmp51x_ids)of_device_get_match_data(&client->dev);
> +	else
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	/* set the device type */
> +	data->config = &tmp51x_config[chip];
> +	mutex_init(&data->config_lock);
> +
> +	ret = tmp51x_parse_device_tree(dev, data->config);
> +	if (ret < 0)
> +		return ret;
> +
> +	tmp51x_regmap_config.max_register = data->config->registers;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &tmp51x_regmap_config);
> +	if (IS_ERR(data->regmap)) {
> +		dev_err(dev, "failed to allocate register map\n");
> +		return PTR_ERR(data->regmap);
> +	}
> +
> +	ret = tmp51x_init(data);
> +	if (ret < 0) {
> +		dev_err(dev, "error configuring the device: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	data->groups[group++] = &tmp51x_group;
> +	if (id->driver_data == tmp513)
> +		data->groups[group++] = &tmp513_group;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
> +							   data, data->groups);

Please rework the driver to use the with_info api.

> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	dev_info(dev, "power monitor %s\n", id->name);

Unacceptable.

> +
> +	return 0;
> +}
> +
> +static struct i2c_driver tmp51x_driver = {
> +	.driver = {
> +		.name	= "tmp51x",
> +		.of_match_table = of_match_ptr(tmp51x_of_match),
> +	},
> +	.probe		= tmp51x_probe,
> +	.id_table	= tmp51x_id,
> +};
> +
> +module_i2c_driver(tmp51x_driver);
> +
> +MODULE_AUTHOR("Eric Tremblay <etremblay@distechcontrols.com>");
> +MODULE_DESCRIPTION("tmp51x driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.17.1
> 
