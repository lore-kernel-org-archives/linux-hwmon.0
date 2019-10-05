Return-Path: <SRS0=O7DW=X6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12AAC4360C
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Oct 2019 00:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92DC8222BE
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Oct 2019 00:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ZSMfiD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728980AbfJEApe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Oct 2019 20:45:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42264 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbfJEApd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Oct 2019 20:45:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so3885570pls.9
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Oct 2019 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8VCs7dwTeJjbXD/4lv2aeysHd6P7n8ccF+3gWVWDSDI=;
        b=h4ZSMfiDr3hbA81O3IfrosJHytImFQMilNw6Rpf+K7ylmWrAD10ikbGDEo2rHDuplM
         PDaA3HDHJeVYeS5u5eSIB51txmiapu80DkSR86G2oEomNaCXn8QkNuWYPy8/2ZaYW8cQ
         rqOLHKIXyZ0of17GdbWiMg+uNIQtPgQbg4Jfkx/MQfNNx0b10coc0goH2xDTl7B1qp7v
         efkX1JR7H7d3UbSOHed3WW2Idtm7sDUT6fTd46m+Ez+7rd1KkygHEbdbswESznU+RTJK
         YwxLI1jrT62xsd7xJGyWKUC1jcZga0MvzeTNXw4uRWY7hIbWpCNnlxz/WvFpH2lneQXi
         W1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=8VCs7dwTeJjbXD/4lv2aeysHd6P7n8ccF+3gWVWDSDI=;
        b=SBMPHH7dt7T2ADmxe3UActRQwuaa9sld76RhwdATFqQ5jmiqnOnjFkz7CNrrQtaHxF
         f0DoaWrXiZ/Of6O4uKAjUt5qi1Gh5n9NVMPtmDDoIK8cqjStoJW5m/XYRl6aSmZ5Eq5E
         +Xy5X4aJxDcr3pJTNZerYr/u2NU8Wy9CRZ9Z1frusROC85IzID8FL2CeYcgzvZJcGUOP
         fPX6+/EFam4UwcGpJhJ2QwczD2JBaIsR4rnneScL45xCOu1R/pKl5ACUPJyQMUblEmIe
         ocUioQTh/JYXj3YILUOE7jljZfak4LLeePWgb/4bKHocpW70B+SErwoIAaO96Hr9VNoo
         Xkew==
X-Gm-Message-State: APjAAAVbUHN/zQnxNS07XFY8HuXRCWKL9XfOaTlYZOZliuW8wn1FAnnq
        /N3Ce4DpNXibcr1A5d69kj9u0/aT
X-Google-Smtp-Source: APXvYqwDKNeCn+ELnPJ2zgnrZ2fl2AKf/wbi10BRdWYJJizitKXBeWEr+ST8JHJoTLA4DynEhBBqrg==
X-Received: by 2002:a17:902:7782:: with SMTP id o2mr16850153pll.165.1570236331932;
        Fri, 04 Oct 2019 17:45:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12sm8273979pfb.97.2019.10.04.17.45.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 17:45:30 -0700 (PDT)
Date:   Fri, 4 Oct 2019 17:45:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191005004529.GA19517@roeck-us.net>
References: <BL0PR01MB48352A0ABA7F260174A0037E959F0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB48352A0ABA7F260174A0037E959F0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 03, 2019 at 06:34:17PM +0000, Tremblay, Eric wrote:
> hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.
> 
> TI's TMP512/513 are I2C/SMBus system monitor chips. These chips
> monitor the supply voltage, supply current, power consumption
> and provide one local and up to three (TMP513) remote temperature sensors.
> 
> It has been tested using a TI TMP513 development kit (TMP513EVM)
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  Documentation/hwmon/tmp513.rst       | 102 +++
>  MAINTAINERS                          |   7 +
>  drivers/hwmon/Kconfig                |  10 +
>  drivers/hwmon/Makefile               |   1 +
>  drivers/hwmon/tmp513.c               | 901 +++++++++++++++++++++++++++
>  include/linux/platform_data/tmp513.h |  28 +
>  6 files changed, 1049 insertions(+)
>  create mode 100644 Documentation/hwmon/tmp513.rst
>  create mode 100644 drivers/hwmon/tmp513.c
>  create mode 100644 include/linux/platform_data/tmp513.h
> 
> diff --git a/Documentation/hwmon/tmp513.rst b/Documentation/hwmon/tmp513.rst
> new file mode 100644
> index 000000000000..b3837748ca7e
> --- /dev/null
> +++ b/Documentation/hwmon/tmp513.rst
> @@ -0,0 +1,102 @@
> +.. SPDX-License-Identifier: GPL-2.0
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
> +local and up to three (TMP513) temperature sensors. The chips also implement
> +power supply monitoring such as shunt voltage, shunt current, bus voltage
> +and power consumption.
> +
> +The temperatures are measured in degrees Celsius with a range of
> +-40 to + 125 degrees with a resolution of 0.0625 degree C.
> +
> +For hysteresis value, only the first channel is writable. Writing to it
> +will affect all other values since each channels are sharing the same
> +hysteresis value. The hysteresis is in degrees Celsius with a range of
> +0 to 127.5 degrees with a resolution of 0.5 degree.
> +
> +The driver exports the temperature values via the following sysfs files:
> +
> +**temp[1-4]_input**
> +
> +**temp[1-4]_crit**
> +
> +**temp[1-4]_crit_alarm**
> +
> +**temp[1-4]_crit_hyst**
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
> +and depend on the shunt resistor value and the pga_gain value.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 296de2b51c83..1d13e5be6661 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16369,6 +16369,13 @@ S:	Maintained
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
> index 000000000000..820b392482d8
> --- /dev/null
> +++ b/drivers/hwmon/tmp513.c
> @@ -0,0 +1,901 @@
> +// SPDX-License-Identifier: GPL-2.0
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
> + * Copyright (C) 2019 Eric Tremblay <etremblay@distech-controls.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

No longer needed.

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
> +#include <linux/platform_data/tmp513.h>
> +
> +// Common register definition
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
> +#define TMP51X_LOCAL_TEMP_LIMIT	0x11
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
> +// Common attrs, and NULL
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
> +// Mask and shift
> +#define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
> +#define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
> +#define CURRENT_SENSE_VOLTAGE_80_MASK	0x0800
> +#define CURRENT_SENSE_VOLTAGE_40_MASK	0
> +
> +#define TMP51X_BUS_VOLTAGE_MASK		0x2000
> +#define TMP51X_PGA_MASK			0x1800
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
> +// Max and Min value
> +#define MAX_BUS_VOLTAGE_32_LIMIT	32764
> +#define MAX_BUS_VOLTAGE_16_LIMIT	16382
> +
> +// Max possible value is -256 to +256 but datasheet indicated -40 to 125.
> +#define MAX_TEMP_LIMIT			125000
> +#define MIN_TEMP_LIMIT			-40000
> +
> +#define MAX_NFACTOR			127
> +#define MIN_NFACTOR			-128
> +#define MAX_TEMP_HYST			127500
> +
> +static const u8 TMP51X_TEMP_INPUT[4] = {
> +	TMP51X_LOCAL_TEMP_RESULT,
> +	TMP51X_REMOTE_TEMP_RESULT_1,
> +	TMP51X_REMOTE_TEMP_RESULT_2,
> +	TMP513_REMOTE_TEMP_RESULT_3
> +};
> +
> +static const u8 TMP51X_TEMP_CRIT[4] = {
> +	TMP51X_LOCAL_TEMP_LIMIT,
> +	TMP51X_REMOTE_TEMP_LIMIT_1,
> +	TMP51X_REMOTE_TEMP_LIMIT_2,
> +	TMP513_REMOTE_TEMP_LIMIT_3
> +};
> +
> +static const u8 TMP51X_TEMP_CRIT_ALARM[4] = {
> +	TMP51X_LOCAL_TEMP_LIMIT_POS,
> +	TMP51X_REMOTE_TEMP_LIMIT_1_POS,
> +	TMP51X_REMOTE_TEMP_LIMIT_2_POS,
> +	TMP513_REMOTE_TEMP_LIMIT_3_POS
> +};
> +
> +static const u8 TMP51X_TEMP_CRIT_HYST[4] = {
> +	TMP51X_N_FACTOR_AND_HYST_1,
> +	TMP51X_N_FACTOR_AND_HYST_1,
> +	TMP51X_N_FACTOR_AND_HYST_1,
> +	TMP51X_N_FACTOR_AND_HYST_1
> +};
> +
> +static const u8 TMP51X_IN_INPUT[2] = {
> +	TMP51X_SHUNT_VOLTAGE_RESULT,
> +	TMP51X_BUS_VOLTAGE_RESULT
> +};
> +
> +static const u8 TMP51X_IN_CRIT[2] = {
> +	TMP51X_SHUNT_VOLTAGE_H_LIMIT,
> +	TMP51X_BUS_VOLTAGE_H_LIMIT
> +};
> +
> +static const u8 TMP51X_IN_LCRIT[2] = {
> +	TMP51X_SHUNT_VOLTAGE_L_LIMIT,
> +	TMP51X_BUS_VOLTAGE_L_LIMIT
> +};
> +
> +static const u8 TMP51X_IN_CRIT_ALARM[2] = {
> +	TMP51X_SHUNT_VOLTAGE_H_LIMIT_POS,
> +	TMP51X_BUS_VOLTAGE_H_LIMIT_POS
> +};
> +
> +static const u8 TMP51X_IN_LCRIT_ALARM[2] = {
> +	TMP51X_SHUNT_VOLTAGE_L_LIMIT_POS,
> +	TMP51X_BUS_VOLTAGE_L_LIMIT_POS
> +};
> +
> +static const u8 TMP51X_CURR_INPUT[1] = {
> +	TMP51X_SHUNT_CURRENT_RESULT
> +};
> +
> +static const u8 TMP51X_POWER_INPUT[1] = {
> +	TMP51X_POWER_RESULT
> +};
> +
> +static const u8 TMP51X_POWER_CRIT[1] = {
> +	TMP51X_POWER_LIMIT
> +};
> +
> +static const u8 TMP51X_POWER_CRIT_ALARM[1] = {
> +	TMP51X_POWER_LIMIT_POS
> +};
> +
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
> +	u16 shunt_config;
> +	u8 pga_shift;
> +	u16 pga_gain;
> +	u16 vbus_max;
> +	u32 shunt_uohms;
> +
> +	u16 temp_config;
> +
> +	s8 temp_2_nfactor;
> +	s8 temp_3_nfactor;
> +	s8 temp_4_nfactor;
> +
> +	u32 curr_lsb;
> +	u32 pwr_lsb;
> +	u8 registers;
> +};
> +
> +struct tmp51x_data {
> +	struct tmp51x_config *config;
> +	enum tmp51x_ids id;
> +	struct regmap *regmap;
> +	struct mutex config_lock;
> +};
> +
> +static struct tmp51x_config tmp51x_config[] = {
> +	[tmp512] = {
> +		.shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT,
> +		.pga_shift = 1,
> +		.pga_gain = 8,
> +		.vbus_max = 32,
> +		.shunt_uohms = 0,

Initializing a static variable with 0 is unnecessary.
Having said that, I would suggest a sensible default.

> +		.temp_config = TMP512_TEMP_CONFIG_DEFAULT,
> +		.registers = TMP51X_MAX_REGISTER_ADDR,
> +	},
> +	[tmp513] = {
> +		.shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT,
> +		.pga_shift = 1,
> +		.pga_gain = 8,
> +		.vbus_max = 32,
> +		.shunt_uohms = 0,
> +		.temp_config = TMP513_TEMP_CONFIG_DEFAULT,
> +		.registers = TMP51X_MAX_REGISTER_ADDR,
> +	},

Most of the information above is the same for both chips. Combined
with implementation issues mentioned below, it might make sense to
move all but the really static information into struct tmp51x_data.

> +};
> +
> +static long tmp51x_get_value(struct device *dev, u8 reg, u8 pos,
> +			    unsigned int regval)
> +{
> +	struct tmp51x_data *data = dev_get_drvdata(dev);
> +	struct tmp51x_config *config = data->config;
> +	long val;
> +
> +	switch (reg) {
> +	case TMP51X_STATUS:
> +		val = (regval >> pos) & 1;
> +		break;
> +	case TMP51X_SHUNT_VOLTAGE_RESULT:
> +	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +		/*
> +		 * 2's compliment number shifted by one to four depending
> +		 * on the pga gain setting.
> +		 * 1lsb = 10uV
> +		 */
> +		val = sign_extend32(regval, 17 - config->pga_shift);
> +		val = DIV_ROUND_CLOSEST(val, 100);
> +		break;
> +	case TMP51X_BUS_VOLTAGE_RESULT:
> +	case TMP51X_BUS_VOLTAGE_H_LIMIT:
> +	case TMP51X_BUS_VOLTAGE_L_LIMIT:
> +		// 1lsb = 4mV
> +		val = (regval >> TMP51X_BUS_VOLTAGE_SHIFT) * 4;
> +		break;
> +	case TMP51X_POWER_RESULT:
> +	case TMP51X_POWER_LIMIT:
> +		// Power = (current * BusVoltage) / 5000
> +		val = regval * config->pwr_lsb;
> +		break;
> +	case TMP51X_SHUNT_CURRENT_RESULT:
> +		// Current = (ShuntVoltage * CalibrationRegister) / 4096
> +		val = sign_extend32(regval, 16) * config->curr_lsb;
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
> +		val = sign_extend32(regval, 16) >> TMP51X_TEMP_SHIFT;
> +		val = DIV_ROUND_CLOSEST(val * 625, 10);
> +		break;
> +	case TMP51X_N_FACTOR_AND_HYST_1:
> +		// 1lsb = 0.5 degrees centigrade
> +		val = (regval & TMP51X_HYST_MASK) * 500;
> +		break;
> +	default:
> +		// Programmer goofed
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
> +	struct tmp51x_config *config = data->config;
> +	int regval, ret, max_val;
> +	u32 mask = 0;
> +
> +	mutex_lock(&data->config_lock);
> +
> +	switch (reg) {
> +	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +		// 1lsb = 10uV
> +		val *= 100;
> +		max_val = U16_MAX >> config->pga_shift;
> +		regval = clamp_val(val, -max_val, max_val);
> +		break;
> +	case TMP51X_BUS_VOLTAGE_H_LIMIT:
> +	case TMP51X_BUS_VOLTAGE_L_LIMIT:
> +		// 1lsb = 4mV
> +		max_val = (config->vbus_max == 32) ?
> +			MAX_BUS_VOLTAGE_32_LIMIT : MAX_BUS_VOLTAGE_16_LIMIT;
> +
> +		val = clamp_val(DIV_ROUND_CLOSEST(val, 4), 0, max_val);
> +		regval = val << TMP51X_BUS_VOLTAGE_SHIFT;
> +		break;
> +	case TMP51X_POWER_LIMIT:
> +		regval = clamp_val(DIV_ROUND_CLOSEST(val, config->pwr_lsb), 0,
> +				   U16_MAX);
> +		break;
> +	case TMP51X_LOCAL_TEMP_LIMIT:
> +	case TMP51X_REMOTE_TEMP_LIMIT_1:
> +	case TMP51X_REMOTE_TEMP_LIMIT_2:
> +	case TMP513_REMOTE_TEMP_LIMIT_3:
> +		// 1lsb = 0.0625 degrees centigrade
> +		val = clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
> +		regval = DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TEMP_SHIFT;
> +		break;
> +	case TMP51X_N_FACTOR_AND_HYST_1:
> +		// 1lsb = 0.5 degrees centigrade
> +		val = clamp_val(val, 0, MAX_TEMP_HYST);
> +		regval = DIV_ROUND_CLOSEST(val, 500);
> +		mask = TMP51X_HYST_MASK;
> +		break;
> +	default:
> +		// Programmer goofed
> +		WARN_ON_ONCE(1);
> +		regval = 0;

Do you really want to write a more or less random value
into the first register in this case ? While not just return
-EOPNOTSUPP like below ?

> +		break;
> +	}
> +
> +	if (mask == 0) {
> +		dev_dbg(dev, "write register 0x%02x, val = 0x%04x\n", reg,
> +			regval);
> +		ret = regmap_write(data->regmap, reg, regval);
> +	} else {
> +		dev_dbg(dev, "update reg 0x%02x, mask = 0x%04x, val = 0x%04x\n",
> +			reg, mask, regval);
> +		ret = regmap_update_bits(data->regmap, reg, mask, regval);
> +	}
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
> +	dev_dbg(dev, "Starting register %02X read\n", reg);
> +
> +	ret = regmap_read(data->regmap, reg, regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(dev, "read %02X, val = 0x%04x\n", reg, *regval);
> +
Do those debug messages add any value for the shipping driver ?

> +	return 0;
> +}
> +
> +static int tmp51x_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	int ret;
> +	u32 regval;
> +	u8 pos = 0, reg = 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			reg = TMP51X_TEMP_INPUT[channel];
> +			break;
> +		case hwmon_temp_crit_alarm:
> +			reg = TMP51X_STATUS;
> +			pos = TMP51X_TEMP_CRIT_ALARM[channel];
> +			break;
> +		case hwmon_temp_crit:
> +			reg = TMP51X_TEMP_CRIT[channel];
> +			break;
> +		case hwmon_temp_crit_hyst:
> +			reg = TMP51X_TEMP_CRIT_HYST[channel];
> +			break;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			reg = TMP51X_IN_INPUT[channel];
> +			break;
> +		case hwmon_in_lcrit_alarm:
> +			reg = TMP51X_STATUS;
> +			pos = TMP51X_IN_LCRIT_ALARM[channel];
> +			break;
> +		case hwmon_in_crit_alarm:
> +			reg = TMP51X_STATUS;
> +			pos = TMP51X_IN_CRIT_ALARM[channel];
> +			break;
> +		case hwmon_in_lcrit:
> +			reg = TMP51X_IN_LCRIT[channel];
> +			break;
> +		case hwmon_in_crit:
> +			reg = TMP51X_IN_CRIT[channel];
> +			break;
> +		}
> +		break;
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			reg = TMP51X_CURR_INPUT[channel];
> +			break;
> +		}
> +		break;
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +			reg = TMP51X_POWER_INPUT[channel];
> +			break;
> +		case hwmon_power_crit_alarm:
> +			reg = TMP51X_STATUS;
> +			pos = TMP51X_POWER_CRIT_ALARM[channel];
> +			break;
> +		case hwmon_power_crit:
> +			reg = TMP51X_POWER_CRIT[channel];
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (reg == 0)
> +		return -EOPNOTSUPP;
> +
> +	ret = tmp51x_read_reg(dev, reg, &regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = tmp51x_get_value(dev, reg, pos, regval);
> +	return 0;
> +}
> +
> +static int tmp51x_write(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long val)
> +{
> +	u8 reg = 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_crit:
> +			reg = TMP51X_TEMP_CRIT[channel];
> +			break;
> +		case hwmon_temp_crit_hyst:
> +			reg = TMP51X_TEMP_CRIT_HYST[channel];
> +			break;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_lcrit:
> +			reg = TMP51X_IN_LCRIT[channel];
> +			break;
> +		case hwmon_in_crit:
> +			reg = TMP51X_IN_CRIT[channel];
> +			break;
> +		}
> +		break;
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_crit:
> +			reg = TMP51X_POWER_CRIT[channel];
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (reg == 0)
> +		return -EOPNOTSUPP;
> +
> +	return tmp51x_set_value(dev, reg, val);
> +}
> +
> +static umode_t tmp51x_is_visible(const void *_data,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int channel)
> +{
> +	const struct tmp51x_data *data = _data;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (data->id == tmp512 && channel == 4)
> +			return 0;
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_crit_alarm:
> +			return 0444;
> +		case hwmon_temp_crit:
> +			return 0644;
> +		case hwmon_temp_crit_hyst:
> +			if (channel == 0)
> +				return 0644;
> +			return 0444;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_lcrit_alarm:
> +		case hwmon_in_crit_alarm:
> +			return 0444;
> +		case hwmon_in_lcrit:
> +		case hwmon_in_crit:
> +			return 0644;
> +		}
> +		break;
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			return 0444;
> +		}
> +		break;
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +		case hwmon_power_crit_alarm:
> +			return 0444;
> +		case hwmon_power_crit:
> +			return 0644;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *tmp51x_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_CRIT | HWMON_I_CRIT_ALARM,
> +			   HWMON_I_INPUT | HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_CRIT | HWMON_I_CRIT_ALARM),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
> +	NULL
> +};
> +
> +static const struct hwmon_ops tmp51x_hwmon_ops = {
> +	.is_visible = tmp51x_is_visible,
> +	.read = tmp51x_read,
> +	.write = tmp51x_write,
> +};
> +
> +static const struct hwmon_chip_info tmp51x_chip_info = {
> +	.ops = &tmp51x_hwmon_ops,
> +	.info = tmp51x_info,
> +};
> +
> +/*
> + * Calibrate the tmp51x following the datasheet method
> + */
> +static int tmp51x_calibrate(struct tmp51x_data *data)
> +{
> +	int shunt_uohms = data->config->shunt_uohms;
> +	int vshunt_max = data->config->pga_gain * 40;
> +	u64 max_curr_ma, val;
> +	u32 div;
> +
> +	/*
> +	 * If shunt_uohms is equal to 0, the calibration should be set to 0.
> +	 * The consequence will be that the current and power measurement engine
> +	 * of the sensor will not work. Temperature and voltage sensing will
> +	 * continue to work.
> +	 */
> +	if (shunt_uohms == 0)
> +		return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION, 0);
> +
> +	val = vshunt_max * 1000 * 1000;
> +	max_curr_ma = DIV_ROUND_CLOSEST_ULL(val, shunt_uohms);
> +
> +	/*
> +	 * Calculate the minimal bit resolution for the current and the power.
> +	 * Those values will be used during register interpretation.
> +	 */
> +	val = max_curr_ma * 1000;
> +	data->config->curr_lsb = DIV_ROUND_CLOSEST_ULL(val, 32767);
> +	data->config->pwr_lsb = 20 * data->config->curr_lsb;
> +
> +	val = data->config->curr_lsb * shunt_uohms;
> +	div = DIV_ROUND_CLOSEST_ULL(val, 1000 * 1000);
> +	val = DIV_ROUND_CLOSEST(40960, div);
> +
> +	return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION, val);
> +}
> +
> +/*
> + * Initialize the configuration and calibration registers.
> + */
> +static int tmp51x_init(struct tmp51x_data *data)
> +{
> +	unsigned int regval;
> +	int ret = regmap_write(data->regmap, TMP51X_SHUNT_CONFIG,
> +			       data->config->shunt_config);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(data->regmap, TMP51X_TEMP_CONFIG,
> +			       data->config->temp_config);
> +	if (ret < 0)
> +		return ret;
> +
> +	// nFactor configuration
> +	ret = regmap_write(data->regmap, TMP51X_N_FACTOR_AND_HYST_1,
> +			   data->config->temp_2_nfactor << 8);

Doesn't this also overwrite the hysteresis with 0 ?

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(data->regmap, TMP51X_N_FACTOR_2,
> +			   data->config->temp_3_nfactor << 8);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (data->id == tmp513) {
> +		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
> +				   data->config->temp_4_nfactor << 8);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = tmp51x_calibrate(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Read the status register before using as the datasheet propose
> +	ret = regmap_read(data->regmap, TMP51X_STATUS, &regval);
> +	if (ret < 0)
> +		return ret;

Just return regmap_read() would do. Or at least an unconditional return ret;

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
> +static int tmp51x_vbus_max_to_reg(struct device *dev,
> +				  struct tmp51x_config *config, u32 vbus_max)
> +{
> +	config->vbus_max = vbus_max;
> +	if (vbus_max == 32) {
> +		config->shunt_config |= TMP51X_BUS_VOLTAGE_MASK;
> +	} else if (vbus_max == 16) {
> +		config->shunt_config &= ~TMP51X_BUS_VOLTAGE_MASK;
> +	} else {
> +		dev_err(dev, "bus-voltage-range is invalid: %u\n", vbus_max);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int tmp51x_pga_gain_to_reg(struct device *dev,
> +				  struct tmp51x_config *config, u32 pga_gain)
> +{
> +	config->shunt_config &= ~TMP51X_PGA_MASK;
> +	config->pga_gain = pga_gain;
> +
> +	// The shift depend on the gain 8=4, 4=3, 2=2, 1=1
> +	config->pga_shift = 5 - ffs(pga_gain);
> +
> +	if (pga_gain == 8) {
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_320_MASK;
> +	} else if (pga_gain == 4) {
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_160_MASK;
> +	} else if (pga_gain == 2) {
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_80_MASK;
> +	} else if (pga_gain == 1) {
> +		config->shunt_config |= CURRENT_SENSE_VOLTAGE_40_MASK;
> +	} else {
> +		dev_err(dev, "pga-gain is invalid: %u\n", pga_gain);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int tmp51x_use_platform_data(struct device *dev,
> +				    struct tmp51x_data *data)
> +{
> +	int ret;
> +	struct tmp51x_platform_data *pdata = dev_get_platdata(dev);
> +
> +	data->config->shunt_uohms = pdata->shunt_uohms;
> +	data->config->temp_2_nfactor = pdata->temp_2_nfactor;
> +	data->config->temp_3_nfactor = pdata->temp_3_nfactor;
> +
> +	if (data->id == tmp513)
> +		data->config->temp_4_nfactor = pdata->temp_4_nfactor;
> +
> +	ret = tmp51x_vbus_max_to_reg(dev, data->config, pdata->vbus_max);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = tmp51x_pga_gain_to_reg(dev, data->config, pdata->pga_gain);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int tmp51x_use_device_tree(struct device *dev,
> +				    struct tmp51x_data *data)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = of_property_read_u32(dev->of_node, "shunt-resistor-uohm", &val);
> +	if (ret >= 0)
> +		data->config->shunt_uohms = val;
> +
> +	ret = of_property_read_u32(dev->of_node, "bus-voltage-range", &val);
> +	if (ret >= 0) {
> +		ret = tmp51x_vbus_max_to_reg(dev, data->config, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "pga-gain", &val);
> +	if (ret >= 0) {
> +		ret = tmp51x_pga_gain_to_reg(dev, data->config, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "temp_2_nfactor", &val);
> +	if (ret >= 0)
> +		data->config->temp_2_nfactor =
> +				clamp_val(((s8)val), MIN_NFACTOR, MAX_NFACTOR);
> +
> +	ret = of_property_read_u32(dev->of_node, "temp_3_nfactor", &val);
> +	if (ret >= 0)
> +		data->config->temp_3_nfactor =
> +				clamp_val(((s8)val), MIN_NFACTOR, MAX_NFACTOR);
> +
> +	if (data->id == tmp513) {
> +		ret = of_property_read_u32(dev->of_node, "temp_4_nfactor",
> +					   &val);
> +		if (ret >= 0)
> +			data->config->temp_4_nfactor =
> +				clamp_val(((s8)val), MIN_NFACTOR, MAX_NFACTOR);
> +	}
> +	return 0;
> +}
> +
> +static int tmp51x_parse_config_data(struct device *dev,
> +				    struct tmp51x_data *data)
> +{
> +	struct tmp51x_platform_data *pdata = dev_get_platdata(dev);
> +	int ret;
> +
> +	if (dev->of_node)
> +		ret = tmp51x_use_device_tree(dev, data);
> +	else if (pdata)
> +		ret = tmp51x_use_platform_data(dev, data);
> +	else


Please do not introduce platform data. Instead, replace calls to
of_property_read_u32() with calls to device_property_read_u32(),
and the call to of_device_get_match_data() with a call to
device_get_match_data().

Thanks,
Guenter

> +		return 0;
> +
> +	// Check if shunt value is compatible with pga-gain
> +	if (data->config->shunt_uohms >
> +		data->config->pga_gain * 40 * 1000 * 1000) {
> +		dev_err(dev,
> +			"shunt-resistor-uohm: %u is too big for pga_gain: %u\n",
> +			data->config->shunt_uohms, data->config->pga_gain);
> +		return -EINVAL;
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
> +	int ret;
> +	enum tmp51x_ids chip;
> +
> +	if (client->dev.of_node)
> +		chip = (enum tmp51x_ids)of_device_get_match_data(&client->dev);
> +	else
> +		chip = id->driver_data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->config = &tmp51x_config[chip];

This is problematic if there are multiple chips in the system.
By pointing to the static variable, and overwriting it, they will all
end up with the same configuration, which is wrong.

> +	data->id = chip;
> +	mutex_init(&data->config_lock);
> +
> +	ret = tmp51x_parse_config_data(dev, data);
> +	if (ret < 0) {
> +		dev_err(dev, "error configuring the device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tmp51x_regmap_config.max_register = data->config->registers;
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
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							   data,
> +							   &tmp51x_chip_info,
> +							   NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	dev_dbg(dev, "power monitor %s\n", id->name);
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
> diff --git a/include/linux/platform_data/tmp513.h b/include/linux/platform_data/tmp513.h
> new file mode 100644
> index 000000000000..086d552bfd36
> --- /dev/null
> +++ b/include/linux/platform_data/tmp513.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Driver for Texas Instruments TMP512, TMP513 power monitor chips
> + *
> + * Copyright (C) 2019 Eric Tremblay <etremblay@distech-controls.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + */
> +
> +/**
> + * struct tmp51x_platform_data - tmp51x info
> + * @shunt_uohms		shunt resistance in microohms
> + * @pga_gain		PGA function gain 8, 4, 2 or 1
> + * @vbus_max		This is either 32V or 16V
> + * @temp_2_nfactor	nfactor for remote channel 1
> + * @temp_3_nfactor	nfactor for remote channel 2
> + * @temp_4_nfactor	nfactor for remote channel 3
> + */
> +struct tmp51x_platform_data {
> +	long shunt_uohms;
> +	u8 pga_gain;
> +	u16 vbus_max;
> +	s8 temp_2_nfactor;
> +	s8 temp_3_nfactor;
> +	s8 temp_4_nfactor;
> +};
> -- 
> 2.17.1
> 
> 
> 
> 
> 
