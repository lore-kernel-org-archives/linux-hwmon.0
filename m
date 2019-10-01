Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD659C352AA
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 18:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BBEF215EA
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 18:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfhOYsGx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfJASeJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 14:34:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45414 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJASeI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Oct 2019 14:34:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id y72so8648084pfb.12
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2019 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nVrBg4JsOpbFYG1Yf3rHxfe6D9hGlR+3olkIkyL72K4=;
        b=nfhOYsGxX+0d+ssldDQGOE8cF7plPXGnlbg8E8m6Aj0jvPtZY1lUy16l7mcNqG3+mf
         hVDHD/8Mje4cjGq4H3KDdypOUkDj2BDVfDa7t+1BZHeyVgRZ+a47Kj7zQapmXMmzMtqb
         ftr9vBQVkrAgwW6x9OTH9vNrcMzj11J1cT+HzfqJCboQn0fTt2eXn6UsjmA93D8XXvs6
         hMErGMcB8FMtv1NW+33RBsvMxK5KPomXs4dEkwrjXZdeTi5UQ0M8/SeiTGj7R4DWF1fD
         8EVQ1GfzbzbJGdrQlFWDiDgm2Rt90HiNsi0S1fXiI2AVUf9EKJRSqkCaLYGhlLytwWnk
         ZCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nVrBg4JsOpbFYG1Yf3rHxfe6D9hGlR+3olkIkyL72K4=;
        b=by5M1ObCe7DlzvP5r4BO7vbg5izbcYZK5qwOyr7BLo6o/+sTBzTReMgDvjXVnpnx4x
         E7X4fweRFVhSYKOM0dW/oJtn61/cT9Xn0dfBCmI4zHr6rZ9qtjOIsaDdQRHSdgjJsR2O
         gXlgM5cXTiIzCGwnpwbVugWO88qXiXfeJoORddUbVT9IL+oyEeLOBFZ8EeNKl0BHBIMV
         93DdjkRsynhKZyT8hgdxjMwvw7eeXdm1nB2fC/rRiDJHf7TVBb4BFixkQmaUIvI3i88Z
         Hpt9W1qRyjIWXCkXygI986gBmNEwLq3sH5E0KQu/X3+2P7XzwuJ2yHNKE09GcBu2J1QI
         RE7g==
X-Gm-Message-State: APjAAAX1VbSUuLhFuOx7+b9HbQZOEsB8k9iFC3Vs18PDbTM9ZvF1I3cp
        2CvkocRXE69+xPjx2//bURha42Jn
X-Google-Smtp-Source: APXvYqxKC5M+jtjIjH553NvL9nJNeeWhAxmGm4n2yWUZCGfz1nLpUyKbhcK/xnd7z/Ay10MvHusFoA==
X-Received: by 2002:a63:1045:: with SMTP id 5mr31317473pgq.165.1569954847324;
        Tue, 01 Oct 2019 11:34:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 71sm20989059pfw.147.2019.10.01.11.34.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 11:34:06 -0700 (PDT)
Date:   Tue, 1 Oct 2019 11:34:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191001183404.GA23564@roeck-us.net>
References: <BL0PR01MB4835BBA222ABF76B43BABCD3959D0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB4835BBA222ABF76B43BABCD3959D0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 01, 2019 at 05:49:52PM +0000, Tremblay, Eric wrote:
> hwmon: Add driver for Texas Instruments TMP512/513 sensor
> 
> TI's TMP512/513 are I2C/SMBus system monitor chips. These chips
> monitor the supply voltage, supply current, power consumption
> and provide one local and up to three (TMP513) remote temperature sensors.
> 
> It has been tested using a TI TMP513 development kit (TMP513EVM)
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  Documentation/hwmon/tmp513.rst |  98 ++++
>  MAINTAINERS                    |   7 +
>  drivers/hwmon/Kconfig          |  10 +
>  drivers/hwmon/Makefile         |   1 +
>  drivers/hwmon/tmp513.c         | 800 +++++++++++++++++++++++++++++++++
>  5 files changed, 916 insertions(+)
>  create mode 100644 Documentation/hwmon/tmp513.rst
>  create mode 100644 drivers/hwmon/tmp513.c
> 
> diff --git a/Documentation/hwmon/tmp513.rst b/Documentation/hwmon/tmp513.rst
> new file mode 100644
> index 000000000000..3ba6f6f14220
> --- /dev/null
> +++ b/Documentation/hwmon/tmp513.rst
> @@ -0,0 +1,98 @@
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
> +-40 to + 125 degress Celcius with a resolution of 0.0625 degree C.
> +
> +The driver exports the temperature values via the following sysfs files:
> +
> +**temp[1-4]_input**
> +
> +**temp[1-4]_crit**
> +
> +**temp[1-4]_crit_alarm**
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
> +possible current depending on the pga gain.
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
> index 000000000000..0575a6237460
> --- /dev/null
> +++ b/drivers/hwmon/tmp513.c
> @@ -0,0 +1,800 @@
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
> +#define TMP51X_BUS_VOLTAGE_MASK	0x2000
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
> +	u32 rshunt;
> +	s32 max_curr_ma;
> +
> +	u16 temp_config;
> +
> +	u8 temp_hyst;
> +	u8 temp2_nfactor;
> +	u8 temp3_nfactor;
> +	u8 temp4_nfactor;
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
> +	case TMP51X_SHUNT_CALIBRATION:
> +		val = regval;
> +		break;
> +	case TMP51X_SHUNT_VOLTAGE_RESULT:
> +	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +		/*
> +		 * 2's compliment number shifted by one to four depending
> +		 * on the pga gain setting.
> +		 * 1lsb = 10uV
> +		 */
> +		val = sign_extend32(regval, 16 - config->pga_shift);
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
> +		val = regval * config->pwr_lsb;
> +		break;
> +	case TMP51X_SHUNT_CURRENT_RESULT:
> +		// Current = (ShuntVoltage * CalibrationRegister) / 4096
> +		val = sign_extend32(regval, 15) * config->curr_lsb;
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
> +	int regval, ret;
> +
> +	mutex_lock(&data->config_lock);
> +
> +	switch (reg) {
> +	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
> +	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
> +		// 1lsb = 10uV
> +		regval = val * 100;
> +		break;
> +	case TMP51X_BUS_VOLTAGE_H_LIMIT:
> +	case TMP51X_BUS_VOLTAGE_L_LIMIT:
> +		// 1lsb = 4uV
> +		regval = DIV_ROUND_CLOSEST(val, 4) << TMP51X_BUS_VOLTAGE_SHIFT;
> +		break;
> +	case TMP51X_POWER_LIMIT:
> +		regval = DIV_ROUND_CLOSEST(val, config->pwr_lsb);
> +		break;
> +	case TMP51X_LOCAL_TEMP_LIMIT:
> +	case TMP51X_REMOTE_TEMP_LIMIT_1:
> +	case TMP51X_REMOTE_TEMP_LIMIT_2:
> +	case TMP513_REMOTE_TEMP_LIMIT_3:
> +		// 1lsb = 0.0625 degrees centigrade
> +		regval = DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TEMP_SHIFT;
> +		break;
> +	default:
> +		// Programmer goofed
> +		WARN_ON_ONCE(1);
> +		regval = 0;
> +		break;
> +	}
> +
> +	dev_dbg(dev, "write register %02X, val = 0x%04x\n", reg, regval);
> +
> +	ret = regmap_write(data->regmap, reg, regval);
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

For consistency with the write code below, I woud suggest to add
something like
	if (reg == 0)
		return -EOPNOTSUPP;

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
> +	if (reg != 0)
> +		return tmp51x_set_value(dev, reg, val);
> +	else
> +		return -EOPNOTSUPP;

else after return is unnecessary. I would suggest to change to code to

	if (reg == 0)
		return -EOPNOTSUPP;

	return tmp51x_set_value(dev, reg, val);

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
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM),
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
> +	int rshunt = data->config->rshunt;
> +	int vshunt_max = data->config->pga_gain * 40;
> +	int val, max_curr_ma;
> +
> +	max_curr_ma = DIV_ROUND_CLOSEST(vshunt_max * 1000 * 1000, rshunt);

divide by 0 error if rshunt == 0.

> +	if (max_curr_ma < data->config->max_curr_ma)
> +		data->config->max_curr_ma = max_curr_ma;
> +
> +	/*
> +	 * Calculate the minimal bit resolution for the current and the power.
> +	 * Those values will be used during register interpretation.
> +	 */
> +	data->config->curr_lsb =
> +		DIV_ROUND_CLOSEST(data->config->max_curr_ma * 1000, 32767);

Overflow if max_curr_ma > MAXINT / 1000.

> +	data->config->pwr_lsb = 20 * data->config->curr_lsb;
> +
> +	val = DIV_ROUND_CLOSEST(data->config->curr_lsb * rshunt, 1000 * 1000);

Overflow if curr_lsb * rshunt + 500000 > MAXINT.

> +	val = DIV_ROUND_CLOSEST(40960, val);

divide by 0 error if curr_lsb * rshunt < 500000.

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
> +	// nFactor 1 and hysteresis configuration
> +	regval = (data->config->temp2_nfactor << 8) & data->config->temp_hyst;

Sure that is supposed to be "&" and not "|" ?

> +	ret = regmap_write(data->regmap, TMP51X_N_FACTOR_AND_HYST_1, regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	// nFactor 2 and 3 configuration
> +	ret = regmap_write(data->regmap, TMP51X_N_FACTOR_2,
> +			   data->config->temp3_nfactor << 8);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (data->id == tmp513) {
> +		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
> +				   data->config->temp3_nfactor << 8);
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
> +	// The shift depend on the gain 8=4, 4=3, 2=2, 1=1
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
> +static int tmp51x_parse_device_tree(struct device *dev,
> +				    struct tmp51x_data *data)
> +{
> +	int ret;
> +	u32 val;
> +
> +	// Mandatory fields
> +	ret = of_property_read_u32(dev->of_node, "shunt-resistor-uohm", &val);
> +	if (ret < 0)
> +		return -ENODEV;
> +	data->config->rshunt = val;

There is no value range check. rshunt == 0 will result in a divide error.

> +
> +	// Optional fields
> +	ret = of_property_read_u32(dev->of_node, "bus-voltage-range", &val);
> +	if (ret >= 0) {
> +		ret = tmp51x_vbus_max_to_reg(data->config, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "pga-gain", &val);
> +	if (ret >= 0) {
> +		ret = tmp51x_pga_gain_to_reg(data->config, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "max-expected-current-ma",
> +				   &val);
> +	if (ret >= 0)
> +		data->config->max_curr_ma = val;
> +
> +	ret = of_property_read_u32(dev->of_node, "temp_hysteresis", &val);
> +	if (ret >= 0) {
> +		if (val > 0xFF)
> +			return -EINVAL;
> +		data->config->temp_hyst = val;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "temp_2_nfactor", &val);
> +	if (ret >= 0) {
> +		if (val > 0xFF)
> +			return -EINVAL;
> +		data->config->temp2_nfactor = val;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "temp_3_nfactor", &val);
> +	if (ret >= 0) {
> +		if (val > 0xFF)
> +			return -EINVAL;
> +		data->config->temp3_nfactor = val;
> +	}
> +
> +	if (data->id == tmp513) {
> +		ret = of_property_read_u32(dev->of_node, "temp_4_nfactor",
> +					   &val);
> +		if (ret >= 0) {
> +			if (val > 0xFF)
> +				return -EINVAL;
> +			data->config->temp4_nfactor = val;
> +		}
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
> +		return -ENODEV;

Are you sure you only want to support devicetree based systems ?
We can of course change that later if needed, it just seems like
an unnecessary restriction.

Also, if you don't want to accept i2c_device_id based probes,
why provide id_table below in the first place ?

> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->config = &tmp51x_config[chip];
> +	data->id = chip;
> +	mutex_init(&data->config_lock);
> +
> +	ret = tmp51x_parse_device_tree(dev, data);
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
> -- 
> 2.17.1
> 
