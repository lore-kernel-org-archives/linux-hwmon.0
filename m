Return-Path: <SRS0=JtC8=YN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66419CA9EA0
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B90921A4A
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tB1lY+Z1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfJTQWE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Oct 2019 12:22:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33383 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfJTQWE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Oct 2019 12:22:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so6801469pfl.0;
        Sun, 20 Oct 2019 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=i9nLsrtZwmc+pDyIXJ/3j7sUOIGAdEoKdZAGs3yB1HY=;
        b=tB1lY+Z1U1OIfcIipXkqYeOicY+cVx0ySAt1AJ2O30PMMDrSs9O01lzENUMcL4h+JH
         BvMpcNfcjLyh2uYBCOICA1KJUtuSI504o+iYLwYOFDyjavNugd3cGnl12kU0VZ2BibZQ
         hWklx1ZG/I5D+0RcuM0a2KVL+nxvzQRImCVRpHQmo8Be/8F53YE7Ezk5pGCLgsen3L43
         R5OeFJIOp+ma+mLVUqC1pR6H0hHxW9TixBip3eO59o7XnlZ6Bc448WPrVlmREtd5SoQH
         5V8rphlB6ZJzzCn+2V4fWYR8tLThGDCeP/5CdOFWSbNWu6xWvah2JcaiQ/MGC0fVt3q+
         r5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=i9nLsrtZwmc+pDyIXJ/3j7sUOIGAdEoKdZAGs3yB1HY=;
        b=X6/fUxOowme+rTvnuRVX4vR5FGLLfx1kBISgnTOaku1i0azolYla5kYU9MZ6s4Rsh0
         j9fdcmebxQYf7LPRX1KPK0GJo/76rRkzHf5P5S6NGxK18QXO9n8ZrQmHDw2+rQTm9aeM
         rhKSbOcVfHpwln4MH1Fxz2iNRhsTUndueRBvAamjpIzzknZvzMPha1pBSID0h8bs8HCN
         Et5GyAtZysqYFIVuIz1RgeuZMrlV93TajRlzPMwqsKZ3pvmczxrXYRzRLLTVPdwL2NoZ
         mesYXC/3NQ8whonGspeUmk3rQ4PI76lSRQY3Kz/KJptm/qmHbN8P+DPcB2ABK//a1yrW
         j+QA==
X-Gm-Message-State: APjAAAXPwnyEGt6WfNFHUAjq1ShlJhEY1Tsc8gIk9hQl/Qxnq/tngJqw
        CtxpfHMhuK3oxn5yG3INN4M=
X-Google-Smtp-Source: APXvYqy4JugS1ooGh6hSAO0LduVh20F+JjGyT4oTDVggwXMV9GCtxPgEabRelR8xpSkA+uIez4eoBw==
X-Received: by 2002:a17:90a:8048:: with SMTP id e8mr24261755pjw.0.1571588521885;
        Sun, 20 Oct 2019 09:22:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4sm11206824pgg.81.2019.10.20.09.22.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 09:22:00 -0700 (PDT)
Date:   Sun, 20 Oct 2019 09:21:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] hwmon: Add support for ltc2947
Message-ID: <20191020162159.GA28110@roeck-us.net>
References: <20191011114853.159327-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191011114853.159327-1-nuno.sa@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 11, 2019 at 01:48:52PM +0200, Nuno Sá wrote:
> The ltc2947 is a high precision power and energy monitor with an
> internal sense resistor supporting up to +/- 30A. Three internal no
> Latency ADCs ensure accurate measurement of voltage and current, while
> high-bandwidth analog multiplication of voltage and current provides
> accurate power measurement in a wide range of applications. Internal or
> external clocking options enable precise charge and energy measurements.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Almost perfect; just some if/else cleanup required.

Thanks,
Guenter

> ---
> Changes in v2:
>  * Add #include <linux/bits.h>;
>  * Aemove unneeded dev_err() messages;
>  * Drop reset flag and calls to mutex_* in resume()/suspend() code;
>  * Drop fault, overflow, energy max/min and energy alarms attributes;
>  * Use standard attributes for power;
>  * Remove unused macros;
>  * Adjust min/max values per datasheet (on clamp_val() calls);
>  * Set power max/min on setup().
> 
>  Documentation/hwmon/ltc2947.rst |   93 +++
>  MAINTAINERS                     |   10 +
>  drivers/hwmon/Kconfig           |   27 +
>  drivers/hwmon/Makefile          |    3 +
>  drivers/hwmon/ltc2947-core.c    | 1191 +++++++++++++++++++++++++++++++
>  drivers/hwmon/ltc2947-i2c.c     |   49 ++
>  drivers/hwmon/ltc2947-spi.c     |   50 ++
>  drivers/hwmon/ltc2947.h         |   12 +
>  8 files changed, 1435 insertions(+)
>  create mode 100644 Documentation/hwmon/ltc2947.rst
>  create mode 100644 drivers/hwmon/ltc2947-core.c
>  create mode 100644 drivers/hwmon/ltc2947-i2c.c
>  create mode 100644 drivers/hwmon/ltc2947-spi.c
>  create mode 100644 drivers/hwmon/ltc2947.h
> 
> diff --git a/Documentation/hwmon/ltc2947.rst b/Documentation/hwmon/ltc2947.rst
> new file mode 100644
> index 000000000000..05df19775fb3
> --- /dev/null
> +++ b/Documentation/hwmon/ltc2947.rst
> @@ -0,0 +1,93 @@
> +Kernel drivers ltc2947-i2c and ltc2947-spi
> +=========================================
> +
> +Supported chips:
> +  * Analog Devices LTC2947
> +    Prefix: 'ltc2947'
> +    Addresses scanned: -
> +    Datasheet:
> +       https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2947.pdf
> +
> +Author: Nuno Sa <nuno.sa@analog.com>
> +
> +Description
> +___________
> +
> +The LTC2947 is a high precision power and energy monitor that measures current,
> +voltage, power, temperature, charge and energy. The device supports both SPI
> +and I2C depending on the chip configuration.
> +The device also measures accumulated quantities as energy. It has two banks of
> +register's to read/set energy related values. These banks can be configured
> +independently to have setups like: energy1 accumulates always and enrgy2 only
> +accumulates if current is positive (to check battery charging efficiency for
> +example). The device also supports a GPIO pin that can be configured as output
> +to control a fan as a function of measured temperature. Then, the GPIO becomes
> +active as soon as a temperature reading is higher than a defined threshold. The
> +temp2 channel is used to control this thresholds and to read the respective
> +alarms.
> +
> +Sysfs entries
> +_____________
> +
> +The following attributes are supported. Limits are read-write, reset_history
> +is write-only and all the other attributes are read-only.
> +
> +in0_input		VP-VM voltage (mV).
> +in0_min			Undervoltage threshold
> +in0_max			Overvoltage threshold
> +in0_lowest		Lowest measured voltage
> +in0_highest		Highest measured voltage
> +in0_reset_history	Write 1 to reset in1 history
> +in0_min_alarm		Undervoltage alarm
> +in0_max_alarm		Overvoltage alarm
> +in0_label		Channel label (VP-VM)
> +
> +in1_input		DVCC voltage (mV)
> +in1_min			Undervoltage threshold
> +in1_max			Overvoltage threshold
> +in1_lowest		Lowest measured voltage
> +in1_highest		Highest measured voltage
> +in1_reset_history	Write 1 to reset in2 history
> +in1_min_alarm		Undervoltage alarm
> +in1_max_alarm		Overvoltage alarm
> +in1_label		Channel label (DVCC)
> +
> +curr1_input		IP-IM Sense current (mA)
> +curr1_min		Undercurrent threshold
> +curr1_max		Overcurrent threshold
> +curr1_lowest		Lowest measured current
> +curr1_highest		Highest measured current
> +curr1_reset_history	Write 1 to reset curr1 history
> +curr1_min_alarm		Undercurrent alarm
> +curr1_max_alarm		Overcurrent alarm
> +curr1_label		Channel label (IP-IM)
> +
> +power1_input		Power (in uW)
> +power1_min		Low power threshold
> +power1_max		High power threshold
> +power1_input_lowest	Historical minimum power use
> +power1_input_highest	Historical maximum power use
> +power1_reset_history	Write 1 to reset power1 history
> +power1_min_alarm	Low power alarm
> +power1_max_alarm	High power alarm
> +power1_label		Channel label (Power)
> +
> +temp1_input		Chip Temperature (in milliC)
> +temp1_min		Low temperature threshold
> +temp1_max		High temperature threshold
> +temp1_input_lowest	Historical minimum temperature use
> +temp1_input_highest	Historical maximum temperature use
> +temp1_reset_history	Write 1 to reset temp1 history
> +temp1_min_alarm		Low temperature alarm
> +temp1_max_alarm		High temperature alarm
> +temp1_label		Channel label (Ambient)
> +
> +temp2_min		Low temperature threshold for fan control
> +temp2_max		High temperature threshold for fan control
> +temp2_min_alarm		Low temperature fan control alarm
> +temp2_max_alarm		High temperature fan control alarm
> +temp2_label		Channel label (TEMPFAN)
> +
> +energy1_input		Measured energy over time (in microJoule)
> +
> +energy2_input		Measured energy over time (in microJoule)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 296de2b51c83..aed3d0de26cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9628,6 +9628,16 @@ S:	Maintained
>  F:	Documentation/hwmon/ltc4261.rst
>  F:	drivers/hwmon/ltc4261.c
>  
> +LTC2947 HARDWARE MONITOR DRIVER
> +M:	Nuno Sá <nuno.sa@analog.com>
> +W:	http://ez.analog.com/community/linux-device-drivers
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	drivers/hwmon/ltc2947-core.c
> +F:	drivers/hwmon/ltc2947-spi.c
> +F:	drivers/hwmon/ltc2947-i2c.c
> +F:	drivers/hwmon/ltc2947.h
> +
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  W:	http://ez.analog.com/community/linux-device-drivers
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7b6c4025b827..8c102ea2938b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -726,6 +726,33 @@ config SENSORS_LTC2945
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ltc2945.
>  
> +config SENSORS_LTC2947
> +	tristate
> +
> +config SENSORS_LTC2947_I2C
> +	tristate "Analog Devices LTC2947 High Precision Power and Energy Monitor over I2C"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select SENSORS_LTC2947
> +	help
> +	  If you say yes here you get support for Linear Technology LTC2947
> +	  I2C High Precision Power and Energy Monitor
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ltc2947-i2c.
> +
> +config SENSORS_LTC2947_SPI
> +	tristate "Analog Devices LTC2947 High Precision Power and Energy Monitor over SPI"
> +	depends on SPI_MASTER
> +	select REGMAP_SPI
> +	select SENSORS_LTC2947
> +	help
> +	  If you say yes here you get support for Linear Technology LTC2947
> +	  SPI High Precision Power and Energy Monitor
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ltc2947-spi.
> +
>  config SENSORS_LTC2990
>  	tristate "Linear Technology LTC2990"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 40c036ea45e6..e416cfded0c4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -106,6 +106,9 @@ obj-$(CONFIG_SENSORS_LM95234)	+= lm95234.o
>  obj-$(CONFIG_SENSORS_LM95241)	+= lm95241.o
>  obj-$(CONFIG_SENSORS_LM95245)	+= lm95245.o
>  obj-$(CONFIG_SENSORS_LTC2945)	+= ltc2945.o
> +obj-$(CONFIG_SENSORS_LTC2947)	+= ltc2947-core.o
> +obj-$(CONFIG_SENSORS_LTC2947_I2C) += ltc2947-i2c.o
> +obj-$(CONFIG_SENSORS_LTC2947_SPI) += ltc2947-spi.o
>  obj-$(CONFIG_SENSORS_LTC2990)	+= ltc2990.o
>  obj-$(CONFIG_SENSORS_LTC4151)	+= ltc4151.o
>  obj-$(CONFIG_SENSORS_LTC4215)	+= ltc4215.o
> diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
> new file mode 100644
> index 000000000000..82f76d17a8be
> --- /dev/null
> +++ b/drivers/hwmon/ltc2947-core.c
> @@ -0,0 +1,1191 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices LTC2947 high precision power and energy monitor
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include "ltc2947.h"
> +
> +/* register's */
> +#define LTC2947_REG_PAGE_CTRL		0xFF
> +#define LTC2947_REG_CTRL		0xF0
> +#define LTC2947_REG_TBCTL		0xE9
> +#define LTC2947_CONT_MODE_MASK		BIT(3)
> +#define LTC2947_CONT_MODE(x)		FIELD_PREP(LTC2947_CONT_MODE_MASK, x)
> +#define LTC2947_PRE_MASK		GENMASK(2, 0)
> +#define LTC2947_PRE(x)			FIELD_PREP(LTC2947_PRE_MASK, x)
> +#define LTC2947_DIV_MASK		GENMASK(7, 3)
> +#define LTC2947_DIV(x)			FIELD_PREP(LTC2947_DIV_MASK, x)
> +#define LTC2947_SHUTDOWN_MASK		BIT(0)
> +#define LTC2947_REG_ACCUM_POL		0xE1
> +#define LTC2947_ACCUM_POL_1_MASK	GENMASK(1, 0)
> +#define LTC2947_ACCUM_POL_1(x)		FIELD_PREP(LTC2947_ACCUM_POL_1_MASK, x)
> +#define LTC2947_ACCUM_POL_2_MASK	GENMASK(3, 2)
> +#define LTC2947_ACCUM_POL_2(x)		FIELD_PREP(LTC2947_ACCUM_POL_2_MASK, x)
> +#define LTC2947_REG_ACCUM_DEADBAND	0xE4
> +#define LTC2947_REG_GPIOSTATCTL		0x67
> +#define LTC2947_GPIO_EN_MASK		BIT(0)
> +#define LTC2947_GPIO_EN(x)		FIELD_PREP(LTC2947_GPIO_EN_MASK, x)
> +#define LTC2947_GPIO_FAN_EN_MASK	BIT(6)
> +#define LTC2947_GPIO_FAN_EN(x)		FIELD_PREP(LTC2947_GPIO_FAN_EN_MASK, x)
> +#define LTC2947_GPIO_FAN_POL_MASK	BIT(7)
> +#define LTC2947_GPIO_FAN_POL(x)		FIELD_PREP(LTC2947_GPIO_FAN_POL_MASK, x)
> +#define LTC2947_REG_GPIO_ACCUM		0xE3
> +/* 200Khz */
> +#define LTC2947_CLK_MIN			200000
> +/* 25Mhz */
> +#define LTC2947_CLK_MAX			25000000
> +#define PAGE0				0
> +#define PAGE1				1
> +/* Voltage registers */
> +#define LTC2947_REG_VOLTAGE		0xA0
> +#define LTC2947_REG_VOLTAGE_MAX		0x50
> +#define LTC2947_REG_VOLTAGE_MIN		0x52
> +#define LTC2947_REG_VOLTAGE_THRE_H	0x90
> +#define LTC2947_REG_VOLTAGE_THRE_L	0x92
> +#define LTC2947_REG_DVCC		0xA4
> +#define LTC2947_REG_DVCC_MAX		0x58
> +#define LTC2947_REG_DVCC_MIN		0x5A
> +#define LTC2947_REG_DVCC_THRE_H		0x98
> +#define LTC2947_REG_DVCC_THRE_L		0x9A
> +#define LTC2947_VOLTAGE_GEN_CHAN	0
> +#define LTC2947_VOLTAGE_DVCC_CHAN	1
> +/* in mV */
> +#define VOLTAGE_MAX			15500
> +#define VOLTAGE_MIN			-300
> +#define VDVCC_MAX			15000
> +#define VDVCC_MIN			4750
> +/* Current registers */
> +#define LTC2947_REG_CURRENT		0x90
> +#define LTC2947_REG_CURRENT_MAX		0x40
> +#define LTC2947_REG_CURRENT_MIN		0x42
> +#define LTC2947_REG_CURRENT_THRE_H	0x80
> +#define LTC2947_REG_CURRENT_THRE_L	0x82
> +/* in mA */
> +#define CURRENT_MAX			30000
> +#define CURRENT_MIN			-30000
> +/* Power registers */
> +#define LTC2947_REG_POWER		0x93
> +#define LTC2947_REG_POWER_MAX		0x44
> +#define LTC2947_REG_POWER_MIN		0x46
> +#define LTC2947_REG_POWER_THRE_H	0x84
> +#define LTC2947_REG_POWER_THRE_L	0x86
> +/* in uW */
> +#define POWER_MAX			450000000
> +#define POWER_MIN			-450000000
> +/* Temperature registers */
> +#define LTC2947_REG_TEMP		0xA2
> +#define LTC2947_REG_TEMP_MAX		0x54
> +#define LTC2947_REG_TEMP_MIN		0x56
> +#define LTC2947_REG_TEMP_THRE_H		0x94
> +#define LTC2947_REG_TEMP_THRE_L		0x96
> +#define LTC2947_REG_TEMP_FAN_THRE_H	0x9C
> +#define LTC2947_REG_TEMP_FAN_THRE_L	0x9E
> +#define LTC2947_TEMP_FAN_CHAN		1
> +/* in millidegress Celsius */
> +#define TEMP_MAX			85000
> +#define TEMP_MIN			-40000
> +/* Energy registers */
> +#define LTC2947_REG_ENERGY1		0x06
> +#define LTC2947_REG_ENERGY2		0x16
> +/* Status/Alarm/Overflow registers */
> +#define LTC2947_REG_STATUS		0x80
> +#define LTC2947_REG_STATVT		0x81
> +#define LTC2947_REG_STATIP		0x82
> +#define LTC2947_REG_STATVDVCC		0x87
> +
> +#define LTC2947_ALERTS_SIZE	(LTC2947_REG_STATVDVCC - LTC2947_REG_STATUS)
> +#define LTC2947_MAX_VOLTAGE_MASK	BIT(0)
> +#define LTC2947_MIN_VOLTAGE_MASK	BIT(1)
> +#define LTC2947_MAX_CURRENT_MASK	BIT(0)
> +#define LTC2947_MIN_CURRENT_MASK	BIT(1)
> +#define LTC2947_MAX_POWER_MASK		BIT(2)
> +#define LTC2947_MIN_POWER_MASK		BIT(3)
> +#define LTC2947_MAX_TEMP_MASK		BIT(2)
> +#define LTC2947_MIN_TEMP_MASK		BIT(3)
> +#define LTC2947_MAX_TEMP_FAN_MASK	BIT(4)
> +#define LTC2947_MIN_TEMP_FAN_MASK	BIT(5)
> +
> +struct ltc2947_data {
> +	struct regmap *map;
> +	struct device *dev;
> +	/*
> +	 * The mutex is needed because the device has 2 memory pages. When
> +	 * reading/writing the correct page needs to be set so that, the
> +	 * complete sequence select_page->read/write needs to be protected.
> +	 */
> +	struct mutex lock;
> +	u32 lsb_energy;
> +	bool gpio_out;
> +};
> +
> +static int __ltc2947_val_read16(const struct ltc2947_data *st, const u8 reg,
> +				u64 *val)
> +{
> +	__be16 __val = 0;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &__val, 2);
> +	if (ret)
> +		return ret;
> +
> +	*val = be16_to_cpu(__val);
> +
> +	return 0;
> +}
> +
> +static int __ltc2947_val_read24(const struct ltc2947_data *st, const u8 reg,
> +				u64 *val)
> +{
> +	__be32 __val = 0;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &__val, 3);
> +	if (ret)
> +		return ret;
> +
> +	*val = be32_to_cpu(__val) >> 8;
> +
> +	return 0;
> +}
> +
> +static int __ltc2947_val_read64(const struct ltc2947_data *st, const u8 reg,
> +				u64 *val)
> +{
> +	__be64 __val = 0;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &__val, 6);
> +	if (ret)
> +		return ret;
> +
> +	*val = be64_to_cpu(__val) >> 16;
> +
> +	return 0;
> +}
> +
> +static int ltc2947_val_read(struct ltc2947_data *st, const u8 reg,
> +			    const u8 page, const size_t size, s64 *val)
> +{
> +	int ret;
> +	u64 __val = 0;
> +
> +	mutex_lock(&st->lock);
> +
> +	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, page);
> +	if (ret) {
> +		mutex_unlock(&st->lock);
> +		return ret;
> +	}
> +
> +	dev_dbg(st->dev, "Read val, reg:%02X, p:%d sz:%zu\n", reg, page,
> +		size);
> +
> +	switch (size) {
> +	case 2:
> +		ret = __ltc2947_val_read16(st, reg, &__val);
> +		break;
> +	case 3:
> +		ret = __ltc2947_val_read24(st, reg, &__val);
> +		break;
> +	case 6:
> +		ret = __ltc2947_val_read64(st, reg, &__val);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	mutex_unlock(&st->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	*val = sign_extend64(__val, (8 * size) - 1);
> +
> +	dev_dbg(st->dev, "Got s:%lld, u:%016llX\n", *val, __val);
> +
> +	return 0;
> +}
> +
> +static int __ltc2947_val_write64(const struct ltc2947_data *st, const u8 reg,
> +				 const u64 val)
> +{
> +	__be64 __val;
> +
> +	__val = cpu_to_be64(val << 16);
> +	return regmap_bulk_write(st->map, reg, &__val, 6);
> +}
> +
> +static int __ltc2947_val_write16(const struct ltc2947_data *st, const u8 reg,
> +				 const u16 val)
> +{
> +	__be16 __val;
> +
> +	__val = cpu_to_be16(val);
> +	return regmap_bulk_write(st->map, reg, &__val, 2);
> +}
> +
> +static int ltc2947_val_write(struct ltc2947_data *st, const u8 reg,
> +			     const u8 page, const size_t size, const u64 val)
> +{
> +	int ret;
> +
> +	mutex_lock(&st->lock);
> +	/* set device on correct page */
> +	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, page);
> +	if (ret) {
> +		mutex_unlock(&st->lock);
> +		return ret;
> +	}
> +
> +	dev_dbg(st->dev, "Write val, r:%02X, p:%d, sz:%zu, val:%016llX\n",
> +		reg, page, size, val);
> +
> +	switch (size) {
> +	case 2:
> +		ret = __ltc2947_val_write16(st, reg, val);
> +		break;
> +	case 6:
> +		ret = __ltc2947_val_write64(st, reg, val);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	mutex_unlock(&st->lock);
> +
> +	return ret;
> +}
> +
> +static int ltc2947_reset_history(struct ltc2947_data *st, const u8 reg_h,
> +				 const u8 reg_l)
> +{
> +	int ret;
> +	/*
> +	 * let's reset the tracking register's. Tracking register's have all
> +	 * 2 bytes size
> +	 */
> +	ret = ltc2947_val_write(st, reg_h, PAGE0, 2, 0x8000U);
> +	if (ret)
> +		return ret;
> +
> +	return ltc2947_val_write(st, reg_l, PAGE0, 2, 0x7FFFU);
> +}
> +
> +static int ltc2947_alarm_read(struct ltc2947_data *st, const u8 reg,
> +			      const u32 mask, long *val)
> +{
> +	u8 offset = reg - LTC2947_REG_STATUS;
> +	/* +1 to include status reg */
> +	char alarms[LTC2947_ALERTS_SIZE + 1];
> +	int ret = 0;
> +
> +	memset(alarms, 0, sizeof(alarms));
> +
> +	mutex_lock(&st->lock);
> +
> +	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, PAGE0);
> +	if (ret)
> +		goto unlock;
> +
> +	dev_dbg(st->dev, "Read alarm, reg:%02X, mask:%02X\n", reg, mask);
> +	/*
> +	 * As stated in the datasheet, when Threshold and Overflow registers
> +	 * are used, the status and all alert registers must be read in one
> +	 * multi-byte transaction.
> +	 */
> +	ret = regmap_bulk_read(st->map, LTC2947_REG_STATUS, alarms,
> +			       sizeof(alarms));
> +	if (ret)
> +		goto unlock;
> +
> +	/* get the alarm */
> +	*val = !!(alarms[offset] & mask);
> +unlock:
> +	mutex_unlock(&st->lock);
> +	return ret;
> +}
> +
> +static ssize_t ltc2947_show_value(struct device *dev,
> +				  struct device_attribute *da, char *buf)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	int ret;
> +	s64 val = 0;
> +
> +	switch (attr->index) {
> +	case LTC2947_REG_ENERGY1:
> +	case LTC2947_REG_ENERGY2:
> +		ret = ltc2947_val_read(st, attr->index, PAGE0, 6, &val);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	/* value in microJoule. st->lsb_energy was multiplied by 10E9 */
> +	val = div_s64(val * st->lsb_energy, 1000);
> +
> +	return sprintf(buf, "%lld\n", val);
> +}
> +
> +static int ltc2947_read_temp(struct device *dev, const u32 attr, long *val,
> +			     const int channel)
> +{
> +	int ret;
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	s64 __val = 0;
> +
> +	if (channel < 0 || channel > LTC2947_TEMP_FAN_CHAN) {
> +		dev_err(st->dev, "Invalid chan%d for temperature", channel);
> +		return -EINVAL;
> +	}
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		ret = ltc2947_val_read(st, LTC2947_REG_TEMP, PAGE0, 2, &__val);
> +		break;
> +	case hwmon_temp_highest:
> +		ret = ltc2947_val_read(st, LTC2947_REG_TEMP_MAX, PAGE0, 2,
> +				       &__val);
> +		break;
> +	case hwmon_temp_lowest:
> +		ret = ltc2947_val_read(st, LTC2947_REG_TEMP_MIN, PAGE0, 2,
> +				       &__val);
> +		break;
> +	case hwmon_temp_max_alarm:
> +		if (channel == LTC2947_TEMP_FAN_CHAN)
> +			return ltc2947_alarm_read(st, LTC2947_REG_STATVT,
> +						  LTC2947_MAX_TEMP_FAN_MASK,
> +						  val);
> +		else
> +			return ltc2947_alarm_read(st, LTC2947_REG_STATVT,
> +						  LTC2947_MAX_TEMP_MASK, val);
> +	case hwmon_temp_min_alarm:
> +		if (channel == LTC2947_TEMP_FAN_CHAN)
> +			return	ltc2947_alarm_read(st, LTC2947_REG_STATVT,
> +						   LTC2947_MIN_TEMP_FAN_MASK,
> +						   val);
> +		else
> +			return	ltc2947_alarm_read(st, LTC2947_REG_STATVT,
> +						   LTC2947_MIN_TEMP_MASK, val);
> +	case hwmon_temp_max:
> +		if (channel == LTC2947_TEMP_FAN_CHAN)
> +			ret = ltc2947_val_read(st, LTC2947_REG_TEMP_FAN_THRE_H,
> +					       PAGE1, 2, &__val);
> +		else
> +			ret = ltc2947_val_read(st, LTC2947_REG_TEMP_THRE_H,
> +					       PAGE1, 2, &__val);
> +		break;
> +	case hwmon_temp_min:
> +		if (channel == LTC2947_TEMP_FAN_CHAN)
> +			ret = ltc2947_val_read(st, LTC2947_REG_TEMP_FAN_THRE_L,
> +					       PAGE1, 2, &__val);
> +		else
> +			ret = ltc2947_val_read(st, LTC2947_REG_TEMP_THRE_L,
> +					       PAGE1, 2, &__val);
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	/* in milidegrees celcius, temp is given by: */
> +	*val = (__val * 204) + 550;
> +
> +	return 0;
> +}
> +
> +static int ltc2947_read_power(struct device *dev, const u32 attr, long *val)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	int ret;
> +	u32 lsb = 200000; /* in uW */
> +	s64 __val = 0;
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		ret = ltc2947_val_read(st, LTC2947_REG_POWER, PAGE0, 3, &__val);
> +		lsb = 50000;
> +		break;
> +	case hwmon_power_input_highest:
> +		ret = ltc2947_val_read(st, LTC2947_REG_POWER_MAX, PAGE0, 2,
> +				       &__val);
> +		break;
> +	case hwmon_power_input_lowest:
> +		ret = ltc2947_val_read(st, LTC2947_REG_POWER_MIN, PAGE0, 2,
> +				       &__val);
> +		break;
> +	case hwmon_power_max_alarm:
> +		return ltc2947_alarm_read(st, LTC2947_REG_STATIP,
> +					  LTC2947_MAX_POWER_MASK, val);
> +	case hwmon_power_min_alarm:
> +		return ltc2947_alarm_read(st, LTC2947_REG_STATIP,
> +					  LTC2947_MIN_POWER_MASK, val);
> +	case hwmon_power_max:
> +		ret = ltc2947_val_read(st, LTC2947_REG_POWER_THRE_H, PAGE1, 2,
> +				       &__val);
> +		break;
> +	case hwmon_power_min:
> +		ret = ltc2947_val_read(st, LTC2947_REG_POWER_THRE_L, PAGE1, 2,
> +				       &__val);
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	*val = __val * lsb;
> +
> +	return 0;
> +}
> +
> +static int ltc2947_read_curr(struct device *dev, const u32 attr, long *val)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	int ret;
> +	u8 lsb = 12; /* in mA */
> +	s64 __val = 0;
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		ret = ltc2947_val_read(st, LTC2947_REG_CURRENT, PAGE0, 3,
> +				       &__val);
> +		lsb = 3;
> +		break;
> +	case hwmon_curr_highest:
> +		ret = ltc2947_val_read(st, LTC2947_REG_CURRENT_MAX, PAGE0, 2,
> +				       &__val);
> +		break;
> +	case hwmon_curr_lowest:
> +		ret = ltc2947_val_read(st, LTC2947_REG_CURRENT_MIN, PAGE0, 2,
> +				       &__val);
> +		break;
> +	case hwmon_curr_max_alarm:
> +		return ltc2947_alarm_read(st, LTC2947_REG_STATIP,
> +					  LTC2947_MAX_CURRENT_MASK, val);
> +	case hwmon_curr_min_alarm:
> +		return ltc2947_alarm_read(st, LTC2947_REG_STATIP,
> +					  LTC2947_MIN_CURRENT_MASK, val);
> +	case hwmon_curr_max:
> +		ret = ltc2947_val_read(st, LTC2947_REG_CURRENT_THRE_H, PAGE1, 2,
> +				       &__val);
> +		break;
> +	case hwmon_curr_min:
> +		ret = ltc2947_val_read(st, LTC2947_REG_CURRENT_THRE_L, PAGE1, 2,
> +				       &__val);
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	*val = __val * lsb;
> +
> +	return 0;
> +}
> +
> +static int ltc2947_read_in(struct device *dev, const u32 attr, long *val,
> +			   const int channel)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	int ret;
> +	u8 lsb = 2; /* in mV */
> +	s64 __val = 0;
> +
> +	if (channel < 0 || channel > LTC2947_VOLTAGE_DVCC_CHAN) {
> +		dev_err(st->dev, "Invalid chan%d for voltage", channel);
> +		return -EINVAL;
> +	}
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			ret = ltc2947_val_read(st, LTC2947_REG_DVCC, PAGE0, 2,
> +					       &__val);
> +			lsb = 145;
> +		} else {
> +			ret = ltc2947_val_read(st, LTC2947_REG_VOLTAGE, PAGE0,
> +					       2, &__val);
> +		}
> +		break;
> +	case hwmon_in_highest:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			ret = ltc2947_val_read(st, LTC2947_REG_DVCC_MAX, PAGE0,
> +					       2, &__val);
> +			lsb = 145;
> +		} else {
> +			ret = ltc2947_val_read(st, LTC2947_REG_VOLTAGE_MAX,
> +					       PAGE0, 2, &__val);
> +		}
> +		break;
> +	case hwmon_in_lowest:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			ret = ltc2947_val_read(st, LTC2947_REG_DVCC_MIN, PAGE0,
> +					       2, &__val);
> +			lsb = 145;
> +		} else {
> +			ret = ltc2947_val_read(st, LTC2947_REG_VOLTAGE_MIN,
> +					       PAGE0, 2, &__val);
> +		}
> +		break;
> +	case hwmon_in_max_alarm:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN)
> +			return ltc2947_alarm_read(st, LTC2947_REG_STATVDVCC,
> +						  LTC2947_MAX_VOLTAGE_MASK,
> +						  val);
> +		else
> +			return ltc2947_alarm_read(st, LTC2947_REG_STATVT,
> +						  LTC2947_MAX_VOLTAGE_MASK,
> +						  val);
> +	case hwmon_in_min_alarm:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN)
> +			return ltc2947_alarm_read(st, LTC2947_REG_STATVDVCC,
> +						  LTC2947_MIN_VOLTAGE_MASK,
> +						  val);
> +		else
> +			return ltc2947_alarm_read(st, LTC2947_REG_STATVT,
> +						  LTC2947_MIN_VOLTAGE_MASK,
> +						  val);
> +	case hwmon_in_max:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			ret = ltc2947_val_read(st, LTC2947_REG_DVCC_THRE_H,
> +					       PAGE1, 2, &__val);
> +			lsb = 145;
> +		} else {
> +			ret = ltc2947_val_read(st, LTC2947_REG_VOLTAGE_THRE_H,
> +					       PAGE1, 2, &__val);
> +		}
> +		break;
> +	case hwmon_in_min:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			ret = ltc2947_val_read(st, LTC2947_REG_DVCC_THRE_L,
> +					       PAGE1, 2, &__val);
> +			lsb = 145;
> +		} else {
> +			ret = ltc2947_val_read(st, LTC2947_REG_VOLTAGE_THRE_L,
> +					       PAGE1, 2, &__val);
> +		}
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	*val = __val * lsb;
> +
> +	return 0;
> +}
> +
> +static int ltc2947_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc2947_read_in(dev, attr, val, channel);
> +	case hwmon_curr:
> +		return ltc2947_read_curr(dev, attr, val);
> +	case hwmon_power:
> +		return ltc2947_read_power(dev, attr, val);
> +	case hwmon_temp:
> +		return ltc2947_read_temp(dev, attr, val, channel);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_write_temp(struct device *dev, const u32 attr,
> +			      long val, const int channel)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +
> +	if (channel < 0 || channel > LTC2947_TEMP_FAN_CHAN) {
> +		dev_err(st->dev, "Invalid chan%d for temperature", channel);
> +		return -EINVAL;
> +	}
> +
> +	switch (attr) {
> +	case hwmon_temp_reset_history:
> +		if (val != 1)
> +			return -EINVAL;
> +		return ltc2947_reset_history(st, LTC2947_REG_TEMP_MAX,
> +					     LTC2947_REG_TEMP_MIN);
> +	case hwmon_temp_max:
> +		val = clamp_val(val, TEMP_MIN, TEMP_MAX);
> +		if (channel == LTC2947_TEMP_FAN_CHAN) {
> +			if (!st->gpio_out)
> +				return -ENOTSUPP;
> +
> +			return ltc2947_val_write(st,
> +					LTC2947_REG_TEMP_FAN_THRE_H, PAGE1, 2,
> +					DIV_ROUND_CLOSEST(val - 550, 204));
> +		} else {

Unnecessary else after return. This confuses checkpatch (and will result
in static analyzer warnings).

> +			return ltc2947_val_write(st, LTC2947_REG_TEMP_THRE_H,
> +					PAGE1, 2,
> +					DIV_ROUND_CLOSEST(val - 550, 204));
> +		}
> +	case hwmon_temp_min:
> +		val = clamp_val(val, TEMP_MIN, TEMP_MAX);
> +		if (channel == LTC2947_TEMP_FAN_CHAN) {
> +			if (!st->gpio_out)
> +				return -ENOTSUPP;
> +
> +			return ltc2947_val_write(st,
> +					LTC2947_REG_TEMP_FAN_THRE_L, PAGE1, 2,
> +					DIV_ROUND_CLOSEST(val - 550, 204));
> +		} else {

Same as above. I would suggest to run checkpatch --strict on the patch;
there are a few more of those.

> +			return ltc2947_val_write(st, LTC2947_REG_TEMP_THRE_L,
> +					PAGE1, 2,
> +					DIV_ROUND_CLOSEST(val - 550, 204));
> +		}
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_write_power(struct device *dev, const u32 attr,
> +			       long val)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_power_reset_history:
> +		if (val != 1)
> +			return -EINVAL;
> +		return ltc2947_reset_history(st, LTC2947_REG_POWER_MAX,
> +					     LTC2947_REG_POWER_MIN);
> +	case hwmon_power_max:
> +		val = clamp_val(val, POWER_MIN, POWER_MAX);
> +		return ltc2947_val_write(st, LTC2947_REG_POWER_THRE_H, PAGE1, 2,
> +					 DIV_ROUND_CLOSEST(val, 200000));
> +	case hwmon_power_min:
> +		val = clamp_val(val, POWER_MIN, POWER_MAX);
> +		return ltc2947_val_write(st, LTC2947_REG_POWER_THRE_L, PAGE1, 2,
> +					 DIV_ROUND_CLOSEST(val, 200000));
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_write_curr(struct device *dev, const u32 attr,
> +			      long val)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_curr_reset_history:
> +		if (val != 1)
> +			return -EINVAL;
> +		return ltc2947_reset_history(st, LTC2947_REG_CURRENT_MAX,
> +					     LTC2947_REG_CURRENT_MIN);
> +	case hwmon_curr_max:
> +		val = clamp_val(val, CURRENT_MIN, CURRENT_MAX);
> +		return ltc2947_val_write(st, LTC2947_REG_CURRENT_THRE_H, PAGE1,
> +					 2, DIV_ROUND_CLOSEST(val, 12));
> +	case hwmon_curr_min:
> +		val = clamp_val(val, CURRENT_MIN, CURRENT_MAX);
> +		return ltc2947_val_write(st, LTC2947_REG_CURRENT_THRE_L, PAGE1,
> +					 2, DIV_ROUND_CLOSEST(val, 12));
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_write_in(struct device *dev, const u32 attr, long val,
> +			    const int channel)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +
> +	if (channel > LTC2947_VOLTAGE_DVCC_CHAN) {
> +		dev_err(st->dev, "Invalid chan%d for voltage", channel);
> +		return -EINVAL;
> +	}
> +
> +	switch (attr) {
> +	case hwmon_in_reset_history:
> +		if (val != 1)
> +			return -EINVAL;
> +
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN)
> +			return ltc2947_reset_history(st, LTC2947_REG_DVCC_MAX,
> +						     LTC2947_REG_DVCC_MIN);
> +		else
> +			return ltc2947_reset_history(st,
> +						     LTC2947_REG_VOLTAGE_MAX,
> +						     LTC2947_REG_VOLTAGE_MIN);
> +	case hwmon_in_max:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			val = clamp_val(val, VDVCC_MIN, VDVCC_MAX);
> +			return ltc2947_val_write(st, LTC2947_REG_DVCC_THRE_H,
> +						 PAGE1, 2,
> +						 DIV_ROUND_CLOSEST(val, 145));
> +		} else {
> +			val = clamp_val(val, VOLTAGE_MIN, VOLTAGE_MAX);
> +			return ltc2947_val_write(st, LTC2947_REG_VOLTAGE_THRE_H,
> +						 PAGE1, 2,
> +						 DIV_ROUND_CLOSEST(val, 2));
> +		}
> +	case hwmon_in_min:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN) {
> +			val = clamp_val(val, VDVCC_MIN, VDVCC_MAX);
> +			return ltc2947_val_write(st, LTC2947_REG_DVCC_THRE_L,
> +						 PAGE1, 2,
> +						 DIV_ROUND_CLOSEST(val, 145));
> +		} else {
> +			val = clamp_val(val, VOLTAGE_MIN, VOLTAGE_MAX);
> +			return ltc2947_val_write(st, LTC2947_REG_VOLTAGE_THRE_L,
> +						 PAGE1, 2,
> +						 DIV_ROUND_CLOSEST(val, 2));
> +		}
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_write(struct device *dev,
> +			 enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc2947_write_in(dev, attr, val, channel);
> +	case hwmon_curr:
> +		return ltc2947_write_curr(dev, attr, val);
> +	case hwmon_power:
> +		return ltc2947_write_power(dev, attr, val);
> +	case hwmon_temp:
> +		return ltc2947_write_temp(dev, attr, val, channel);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_read_labels(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		if (channel == LTC2947_VOLTAGE_DVCC_CHAN)
> +			*str = "DVCC";
> +		else
> +			*str = "VP-VM";
> +		return 0;
> +	case hwmon_curr:
> +		*str = "IP-IM";
> +		return 0;
> +	case hwmon_temp:
> +		if (channel == LTC2947_TEMP_FAN_CHAN)
> +			*str = "TEMPFAN";
> +		else
> +			*str = "Ambient";
> +		return 0;
> +	case hwmon_power:
> +		*str = "Power";
> +		return 0;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc2947_in_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +	case hwmon_in_highest:
> +	case hwmon_in_lowest:
> +	case hwmon_in_max_alarm:
> +	case hwmon_in_min_alarm:
> +	case hwmon_in_label:
> +		return 0444;
> +	case hwmon_in_reset_history:
> +		return 0200;
> +	case hwmon_in_max:
> +	case hwmon_in_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int ltc2947_curr_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_curr_input:
> +	case hwmon_curr_highest:
> +	case hwmon_curr_lowest:
> +	case hwmon_curr_max_alarm:
> +	case hwmon_curr_min_alarm:
> +	case hwmon_curr_label:
> +		return 0444;
> +	case hwmon_curr_reset_history:
> +		return 0200;
> +	case hwmon_curr_max:
> +	case hwmon_curr_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int ltc2947_power_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_power_input:
> +	case hwmon_power_input_highest:
> +	case hwmon_power_input_lowest:
> +	case hwmon_power_label:
> +	case hwmon_power_max_alarm:
> +	case hwmon_power_min_alarm:
> +		return 0444;
> +	case hwmon_power_reset_history:
> +		return 0200;
> +	case hwmon_power_max:
> +	case hwmon_power_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int ltc2947_temp_is_visible(const u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_highest:
> +	case hwmon_temp_lowest:
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_min_alarm:
> +	case hwmon_temp_label:
> +		return 0444;
> +	case hwmon_temp_reset_history:
> +		return 0200;
> +	case hwmon_temp_max:
> +	case hwmon_temp_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc2947_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc2947_in_is_visible(attr);
> +	case hwmon_curr:
> +		return ltc2947_curr_is_visible(attr);
> +	case hwmon_power:
> +		return ltc2947_power_is_visible(attr);
> +	case hwmon_temp:
> +		return ltc2947_temp_is_visible(attr);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *ltc2947_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_RESET_HISTORY |
> +			   HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_RESET_HISTORY |
> +			   HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM |
> +			   HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> +			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_RESET_HISTORY |
> +			   HWMON_C_MIN_ALARM | HWMON_C_MAX_ALARM |
> +			   HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> +			   HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
> +			   HWMON_P_RESET_HISTORY | HWMON_P_MAX_ALARM |
> +			   HWMON_P_MIN_ALARM | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LOWEST | HWMON_T_HIGHEST |
> +			   HWMON_T_MAX | HWMON_T_MIN | HWMON_T_RESET_HISTORY |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM |
> +			   HWMON_T_LABEL,
> +			   HWMON_T_MAX_ALARM | HWMON_T_MIN_ALARM | HWMON_T_MAX |
> +			   HWMON_T_MIN | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ltc2947_hwmon_ops = {
> +	.is_visible = ltc2947_is_visible,
> +	.read = ltc2947_read,
> +	.write = ltc2947_write,
> +	.read_string = ltc2947_read_labels,
> +};
> +
> +static const struct hwmon_chip_info ltc2947_chip_info = {
> +	.ops = &ltc2947_hwmon_ops,
> +	.info = ltc2947_info,
> +};
> +
> +/* energy attributes are 6bytes wide so we need u64 */
> +static SENSOR_DEVICE_ATTR(energy1_input, 0444, ltc2947_show_value, NULL,
> +			  LTC2947_REG_ENERGY1);
> +static SENSOR_DEVICE_ATTR(energy2_input, 0444, ltc2947_show_value, NULL,
> +			  LTC2947_REG_ENERGY2);
> +
> +static struct attribute *ltc2947_attrs[] = {
> +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> +	&sensor_dev_attr_energy2_input.dev_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(ltc2947);
> +
> +static void ltc2947_clk_disable(void *data)
> +{
> +	struct clk *extclk = data;
> +
> +	clk_disable_unprepare(extclk);
> +}
> +
> +static int ltc2947_setup(struct ltc2947_data *st)
> +{
> +	int ret;
> +	struct clk *extclk;
> +	u32 dummy, deadband, pol;
> +	u32 accum[2];
> +
> +	/* clear status register by reading it */
> +	ret = regmap_read(st->map, LTC2947_REG_STATUS, &dummy);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Set max/min for power here since the default values x scale
> +	 * would overflow on 32bit arch
> +	 */
> +	ret = ltc2947_val_write(st, LTC2947_REG_POWER_THRE_H, PAGE1, 2,
> +				POWER_MAX / 200000);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc2947_val_write(st, LTC2947_REG_POWER_THRE_L, PAGE1, 2,
> +				POWER_MIN / 200000);
> +	if (ret)
> +		return ret;
> +
> +	/* check external clock presence */
> +	extclk = devm_clk_get(st->dev, NULL);
> +	if (!IS_ERR(extclk)) {
> +		unsigned long rate_hz;
> +		u8 pre = 0, div, tbctl;
> +		u64 aux;
> +
> +		/* let's calculate and set the right valus in TBCTL */
> +		rate_hz = clk_get_rate(extclk);
> +		if (rate_hz < LTC2947_CLK_MIN || rate_hz > LTC2947_CLK_MAX) {
> +			dev_err(st->dev, "Invalid rate:%lu for external clock",
> +				rate_hz);
> +			return -EINVAL;
> +		}
> +
> +		ret = clk_prepare_enable(extclk);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_add_action_or_reset(st->dev, ltc2947_clk_disable,
> +					       extclk);
> +		if (ret)
> +			return ret;
> +		/* as in table 1 of the datasheet */
> +		if (rate_hz >= LTC2947_CLK_MIN && rate_hz <= 1000000)
> +			pre = 0;
> +		else if (rate_hz > 1000000 && rate_hz <= 2000000)
> +			pre = 1;
> +		else if (rate_hz > 2000000 && rate_hz <= 4000000)
> +			pre = 2;
> +		else if (rate_hz > 4000000 && rate_hz <= 8000000)
> +			pre = 3;
> +		else if (rate_hz > 8000000 && rate_hz <= 16000000)
> +			pre = 4;
> +		else if (rate_hz > 16000000 && rate_hz <= LTC2947_CLK_MAX)
> +			pre = 5;
> +		/*
> +		 * Div is given by:
> +		 *	floor(fref / (2^PRE * 32768))
> +		 */
> +		div = rate_hz / ((1 << pre) * 32768);
> +		tbctl = LTC2947_PRE(pre) | LTC2947_DIV(div);
> +
> +		ret = regmap_write(st->map, LTC2947_REG_TBCTL, tbctl);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * The energy lsb is given by (in W*s):
> +		 *      06416 * (1/fref) * 2^PRE * (DIV + 1)
> +		 * The value is multiplied by 10E9
> +		 */
> +		aux = (div + 1) * ((1 << pre) * 641600000ULL);
> +		st->lsb_energy = DIV_ROUND_CLOSEST_ULL(aux, rate_hz);
> +	} else {
> +		/* 19.89E-6 * 10E9 */
> +		st->lsb_energy = 19890;
> +	}
> +	ret = of_property_read_u32_array(st->dev->of_node,
> +					 "adi,accumulator-ctl-pol", accum,
> +					  ARRAY_SIZE(accum));
> +	if (!ret) {
> +		u32 accum_reg = LTC2947_ACCUM_POL_1(accum[0]) |
> +				LTC2947_ACCUM_POL_2(accum[1]);
> +
> +		ret = regmap_write(st->map, LTC2947_REG_ACCUM_POL, accum_reg);
> +		if (ret)
> +			return ret;
> +	}
> +	ret = of_property_read_u32(st->dev->of_node,
> +				   "adi,accumulation-deadband-microamp",
> +				   &deadband);
> +	if (!ret) {
> +		/* the LSB is the same as the current, so 3mA */
> +		ret = regmap_write(st->map, LTC2947_REG_ACCUM_DEADBAND,
> +				   deadband / (1000 * 3));
> +		if (ret)
> +			return ret;
> +	}
> +	/* check gpio cfg */
> +	ret = of_property_read_u32(st->dev->of_node, "adi,gpio-out-pol", &pol);
> +	if (!ret) {
> +		/* setup GPIO as output */
> +		u32 gpio_ctl = LTC2947_GPIO_EN(1) | LTC2947_GPIO_FAN_EN(1) |
> +			LTC2947_GPIO_FAN_POL(pol);
> +
> +		st->gpio_out = true;
> +		ret = regmap_write(st->map, LTC2947_REG_GPIOSTATCTL, gpio_ctl);
> +		if (ret)
> +			return ret;
> +	}
> +	ret = of_property_read_u32_array(st->dev->of_node, "adi,gpio-in-accum",
> +					 accum, ARRAY_SIZE(accum));
> +	if (!ret) {
> +		/*
> +		 * Setup the accum options. The gpioctl is already defined as
> +		 * input by default.
> +		 */
> +		u32 accum_val = LTC2947_ACCUM_POL_1(accum[0]) |
> +				LTC2947_ACCUM_POL_2(accum[1]);
> +
> +		if (st->gpio_out) {
> +			dev_err(st->dev,
> +				"Cannot have input gpio config if already configured as output");
> +			return -EINVAL;
> +		}
> +
> +		ret = regmap_write(st->map, LTC2947_REG_GPIO_ACCUM, accum_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* set continuos mode */
> +	return regmap_update_bits(st->map, LTC2947_REG_CTRL,
> +				  LTC2947_CONT_MODE_MASK, LTC2947_CONT_MODE(1));
> +}
> +
> +int ltc2947_core_probe(struct regmap *map, const char *name)
> +{
> +	struct ltc2947_data *st;
> +	struct device *dev = regmap_get_device(map);
> +	struct device *hwmon;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	st->map = map;
> +	st->dev = dev;
> +	dev_set_drvdata(dev, st);
> +	mutex_init(&st->lock);
> +
> +	ret = ltc2947_setup(st);
> +	if (ret)
> +		return ret;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, name, st,
> +						     &ltc2947_chip_info,
> +						     ltc2947_groups);
> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +EXPORT_SYMBOL_GPL(ltc2947_core_probe);
> +
> +static int __maybe_unused ltc2947_resume(struct device *dev)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +	u32 ctrl = 0;
> +	int ret;
> +
> +	/* dummy read to wake the device */
> +	ret = regmap_read(st->map, LTC2947_REG_CTRL, &ctrl);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Wait for the device. It takes 100ms to wake up so, 10ms extra
> +	 * should be enough.
> +	 */
> +	msleep(110);
> +	ret = regmap_read(st->map, LTC2947_REG_CTRL, &ctrl);
> +	if (ret)
> +		return ret;
> +	/* ctrl should be 0 */
> +	if (ctrl != 0) {
> +		dev_err(st->dev, "Device failed to wake up, ctl:%02X\n", ctrl);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* set continuous mode */
> +	return regmap_update_bits(st->map, LTC2947_REG_CTRL,
> +				  LTC2947_CONT_MODE_MASK, LTC2947_CONT_MODE(1));
> +}
> +
> +static int __maybe_unused ltc2947_suspend(struct device *dev)
> +{
> +	struct ltc2947_data *st = dev_get_drvdata(dev);
> +
> +	return regmap_update_bits(st->map, LTC2947_REG_CTRL,
> +				  LTC2947_SHUTDOWN_MASK, 1);
> +}
> +
> +SIMPLE_DEV_PM_OPS(ltc2947_pm_ops, ltc2947_suspend, ltc2947_resume);
> +EXPORT_SYMBOL_GPL(ltc2947_pm_ops);
> +
> +const struct of_device_id ltc2947_of_match[] = {
> +	{ .compatible = "adi,ltc2947" },
> +	{}
> +};
> +EXPORT_SYMBOL_GPL(ltc2947_of_match);
> +MODULE_DEVICE_TABLE(of, ltc2947_of_match);
> +
> +MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC2947 power and energy monitor core driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/ltc2947-i2c.c b/drivers/hwmon/ltc2947-i2c.c
> new file mode 100644
> index 000000000000..cf6074b110ae
> --- /dev/null
> +++ b/drivers/hwmon/ltc2947-i2c.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices LTC2947 high precision power and energy monitor over I2C
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#include "ltc2947.h"
> +
> +static const struct regmap_config ltc2947_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static int ltc2947_probe(struct i2c_client *i2c,
> +			 const struct i2c_device_id *id)
> +{
> +	struct regmap *map;
> +
> +	map = devm_regmap_init_i2c(i2c, &ltc2947_regmap_config);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	return ltc2947_core_probe(map, i2c->name);
> +}
> +
> +static const struct i2c_device_id ltc2947_id[] = {
> +	{"ltc2947", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc2947_id);
> +
> +static struct i2c_driver ltc2947_driver = {
> +	.driver = {
> +		.name = "ltc2947",
> +		.of_match_table = ltc2947_of_match,
> +		.pm = &ltc2947_pm_ops,
> +	},
> +	.probe = ltc2947_probe,
> +	.id_table = ltc2947_id,
> +};
> +module_i2c_driver(ltc2947_driver);
> +
> +MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC2947 I2C power and energy monitor driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/ltc2947-spi.c b/drivers/hwmon/ltc2947-spi.c
> new file mode 100644
> index 000000000000..c24ca569db1b
> --- /dev/null
> +++ b/drivers/hwmon/ltc2947-spi.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices LTC2947 high precision power and energy monitor over SPI
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include "ltc2947.h"
> +
> +static const struct regmap_config ltc2947_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.read_flag_mask = BIT(0),
> +};
> +
> +static int ltc2947_probe(struct spi_device *spi)
> +{
> +	struct regmap *map;
> +
> +	map = devm_regmap_init_spi(spi, &ltc2947_regmap_config);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	return ltc2947_core_probe(map, spi_get_device_id(spi)->name);
> +}
> +
> +static const struct spi_device_id ltc2947_id[] = {
> +	{"ltc2947", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, ltc2947_id);
> +
> +static struct spi_driver ltc2947_driver = {
> +	.driver = {
> +		.name = "ltc2947",
> +		.of_match_table = ltc2947_of_match,
> +		.pm = &ltc2947_pm_ops,
> +	},
> +	.probe = ltc2947_probe,
> +	.id_table = ltc2947_id,
> +};
> +module_spi_driver(ltc2947_driver);
> +
> +MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC2947 SPI power and energy monitor driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/ltc2947.h b/drivers/hwmon/ltc2947.h
> new file mode 100644
> index 000000000000..5b8ff81a3dba
> --- /dev/null
> +++ b/drivers/hwmon/ltc2947.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_LTC2947_H
> +#define _LINUX_LTC2947_H
> +
> +struct regmap;
> +
> +extern const struct of_device_id ltc2947_of_match[];
> +extern const struct dev_pm_ops ltc2947_pm_ops;
> +
> +int ltc2947_core_probe(struct regmap *map, const char *name);
> +
> +#endif
