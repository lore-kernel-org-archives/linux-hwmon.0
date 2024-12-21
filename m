Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D6F1547F0;
	Sat, 21 Dec 2024 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734804520; cv=none; b=fr/4+Q1D9zK6ilD4+9CbjQ6L6TvdDGc+nTwNyQ9KsCG55krmba3PjXNy1s1KWZsq11qjli/lGPAqI8vHz8YxYpnk2Ez19Gd+wRVFFRJRCHUyJD0V3u6OvaQnjglpFclJOrkb30QBKMu+SEKL9i4MkrMY13c8IhgbEqYYDakN+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734804520; c=relaxed/simple;
	bh=gxitmT4wzNC7FifqIptgga8cZVnQiLKLnMaaOzbPeNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4zj9cAiSvgcogYBjWRyxgSA677+g/Z6eQJolnFaAnJiTxJXMPrGDjo4FRoecMy+8rzeWcaWKMqFOvwE9qNX56/vjsfaJYOBTE19A+cIqoJPa4CJU8FvrAEpGZDTVUM6gsygF/CRy/DuFImLu4p4FTpUrfak4bBVC5F6Tb+5/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPkjfpPH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPkjfpPH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so24910145ad.1;
        Sat, 21 Dec 2024 10:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734804517; x=1735409317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tvwDOjVFp5CaaBP6HM+5GJNrZBKYnoEY2ykA82UDR0=;
        b=fPkjfpPHA6CUfwOouYfEZ2Bf+FsnG0ZVGfl7u0PAyYQjYZABoTM9yK1yqagd+zkvss
         v/+z/ShcPTeb1nB3WwB0SxjiqwgRgDf7DwaJfkQgl95M85XPN6HqK/jsE7FnRLErtxc1
         z17WqmVe2iDVF1lRdkF2UA1BaNfNX1q2koVzheehLroml9BECDYV2459gltFDK3z/t0L
         n0Tog85g+GknwzntsoAPQASKzS7FbDuN5rrSJmDqUzngaKY3ifTbVyVxugdVbX5Sc2IT
         0fStS+0qEGRrKzuW2Zz+g32P0FcY3uxcKIgdemGdrNw1VhbR1LjdL+5g1X9S6Owy3cvz
         mRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734804517; x=1735409317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tvwDOjVFp5CaaBP6HM+5GJNrZBKYnoEY2ykA82UDR0=;
        b=SIROhDGYOh7cVPLPYRrqvD/3rt4YZK8LvnjmcSyG0tz6LUQMjH4J7/OiEuKqwxbrql
         CruF+l+RnHzdpfHmakU5V5Fht1l0mIh9NQ5s7LlEA+JX0S2gWSodDgzhT+MPnqQ0IU57
         YoYq7P7WXHcKO1zmUdgG1LFlpYsm0PKdI6OFjs+UnMowpIdnJ2Uy3zf6Kbj+UtQkXwmt
         Tvgxg1MboFSbx+6Q1wqHHlWn9/IpMFY+5qnMGbxsfwI+T0r24gdNAegWnlz2FxoNzaSS
         5vL3MrOrAXgfOLojBmFNdJgvpOVYwIUhl/yrURZlp6OBdbO5amTHYfRvNXjCRMQuAKio
         5oNg==
X-Forwarded-Encrypted: i=1; AJvYcCWrc2YDoXCFpa4Kvnz8yINz8V0fsquTwWFsHIuyGrHTd2K6IdjAn/UWfvCzj3vk3yOnI0U7ybPjoJJh@vger.kernel.org, AJvYcCX0LERwDXBHuLyNyEZBRM7QraV9OA49KVoSBDP7oy8LTsem06+r6wSvLqzHjW/QQSbFsWikMPRnrS2wv+5C@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5uXr3Fts8v2ypBnqk48nUcnauz3EpbN4th1ZbxSEKtQExkE7
	JirdS9gsJSIaJ7mXJk7Sm19cnLP5FRGo2oJj6/Q1HLO89PhMNrkN
X-Gm-Gg: ASbGnctPUh8sQO0+3jDop+PR0ePa+bglpVB/SYItGu/OHKGsAU6toYLclbFTNuTZRTu
	bj6SpEcfjhs1pIWjrTY3rHLcPkgp14Ll6N6wper9M/g0J8L38zau8sNUGzU0azmjoy3zkYm7KJ5
	s/J4MVqOllNlKZvVqSPoBReB34qmKQgQXzFwaKGt2zo1ClidoQxbxryvmcDLnzXMFKj+xt8zeyy
	F6CtZ7H6CtPQRoNCVyYWQyDiPRzaFzA5jlvOrDbYvJZTccv1SmZK+TNOSzM1cSJKBbfbQ==
X-Google-Smtp-Source: AGHT+IGafbaoQoFU+t1YIcS2TA6s4HNP/QmgHuXVGbaa8ePOxTQCDfj50fLGmOb0/4Lnr/8Apv8YSA==
X-Received: by 2002:a17:902:ecd2:b0:215:89a0:416f with SMTP id d9443c01a7336-219e6ebd0a4mr85375725ad.30.1734804516397;
        Sat, 21 Dec 2024 10:08:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdeabsm45333135ad.125.2024.12.21.10.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 10:08:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Dec 2024 10:08:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kent Libetario <Kent.Libetario@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] drivers: hwmon: add driver for max42500
Message-ID: <6488f38b-7e8b-4b4c-8955-e516e4cf88d6@roeck-us.net>
References: <20241220012003.9568-1-Kent.Libetario@analog.com>
 <20241220012003.9568-3-Kent.Libetario@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220012003.9568-3-Kent.Libetario@analog.com>

On Fri, Dec 20, 2024 at 09:20:03AM +0800, Kent Libetario wrote:
> Add the core implementation of the MAX42500 hwmon driver.
> 

Please have a look into Documentation/process/submitting-patches.rst
and follow the guidance about describing patches.

> Signed-off-by: Kent Libetario <Kent.Libetario@analog.com>
> ---
>  MAINTAINERS              |    1 +
>  drivers/hwmon/Kconfig    |   13 +
>  drivers/hwmon/Makefile   |    1 +
>  drivers/hwmon/max42500.c | 1049 ++++++++++++++++++++++++++++++++++++++

Documentation missing.

There is a large number of checkpatch CHECK messages, almost all about
multi-line alignment. Indeed, when looking through the code,
multi-line aligment seems arbitrary. Please fix.

PEC support should be implemented through the i2c controller driver.
Please see other drivers such as lm90.c or max31827.c for examples
how to do that.

Some more comments inline. The review is partial. The major problem
I see is that there are not just a few but _lots_ of ABI violations.
This is unacceptable. Please rework the driver and follow the hwmon ABI
for all sysfs attributes.

Guenter

>  4 files changed, 1064 insertions(+)
>  create mode 100644 drivers/hwmon/max42500.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1703b4834c8..434191e16dd5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14051,6 +14051,7 @@ M:	Kent Libetario <kent.libetario@analog.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/hwmon/adi,max42500.yaml
> +F:	drivers/hwmon/max42500.c
>  
>  MAX6650 HARDWARE MONITOR AND FAN CONTROLLER DRIVER
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index dd376602f3f1..ec0d7aad7789 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1220,6 +1220,19 @@ config MAX31827
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called max31827.
>  
> +config SENSORS_MAX42500
> +	tristate "MAX42500 Industrial Power System Monitor Family"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for MAX42500 SoC power-system monitor
> +	  with up to seven voltage monitor. The driver also contains a  programmable
> +	  challenge/response watchdog, which is accessible through the I2C interface,
> +	  along with a configurable RESET output.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called max42500.
> +
>  config SENSORS_MAX6620
>  	tristate "Maxim MAX6620 fan controller"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b827b92f2a78..d27d8fc01141 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -152,6 +152,7 @@ obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
>  obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
>  obj-$(CONFIG_SENSORS_MAX31760)  += max31760.o
> +obj-$(CONFIG_SENSORS_MAX42500)  += max42500.o
>  obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
>  obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
>  obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
> diff --git a/drivers/hwmon/max42500.c b/drivers/hwmon/max42500.c
> new file mode 100644
> index 000000000000..23b90c766767
> --- /dev/null
> +++ b/drivers/hwmon/max42500.c
> @@ -0,0 +1,1049 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * MAX42500 - Industrial Power System Monitor
> + *
> + * Copyright 2024 Analog Devices Inc.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/slab.h>
> +#include <linux/crc8.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +/* Implements Polynomial X^8 + X^2 + X^1 +1 */
> +#define CRC8_PEC		0x07
> +
> +DECLARE_CRC8_TABLE(max42500_crc8);
> +
> +#define MAX42500_REG_ID					0x00
> +#define MAX42500_REG_CONFIG1			0x01
> +#define MAX42500_REG_CONFIG2			0x02
> +#define MAX42500_REG_VMON				0x03
> +#define MAX42500_REG_RSTMAP				0x04
> +#define MAX42500_REG_STATOV				0x05
> +#define MAX42500_REG_STATUV				0x06
> +#define MAX42500_REG_STATOFF			0x07
> +#define MAX42500_REG_VIN1				0x08
> +#define MAX42500_REG_VIN2				0x09
> +#define MAX42500_REG_VIN3				0x0A
> +#define MAX42500_REG_VIN4				0x0B
> +#define MAX42500_REG_VIN5				0x0C
> +#define MAX42500_REG_VINO6				0x0D
> +#define MAX42500_REG_VINU6				0x0E
> +#define MAX42500_REG_VINO7				0x0F
> +#define MAX42500_REG_VINU7				0x10
> +#define MAX42500_REG_OVUV1				0x11
> +#define MAX42500_REG_OVUV2				0x12
> +#define MAX42500_REG_OVUV3				0x13
> +#define MAX42500_REG_OVUV4				0x14
> +#define MAX42500_REG_OVUV5				0x15
> +#define MAX42500_REG_FPSSTAT1			0x16
> +#define MAX42500_REG_FPSCFG1			0x17
> +#define MAX42500_REG_UTIME1				0x18
> +#define MAX42500_REG_UTIME2				0x19
> +#define MAX42500_REG_UTIME3				0x1A
> +#define MAX42500_REG_UTIME4				0x1B
> +#define MAX42500_REG_UTIME5				0x1C
> +#define MAX42500_REG_UTIME6				0x1D
> +#define MAX42500_REG_UTIME7				0x1E
> +#define MAX42500_REG_DTIME1				0x1F
> +#define MAX42500_REG_DTIME2				0x20
> +#define MAX42500_REG_DTIME3				0x21
> +#define MAX42500_REG_DTIME4				0x22
> +#define MAX42500_REG_DTIME5				0x23
> +#define MAX42500_REG_DTIME6				0x24
> +#define MAX42500_REG_DTIME7				0x25
> +#define MAX42500_REG_WDSTAT				0x26
> +#define MAX42500_REG_WDCDIV				0x27
> +#define MAX42500_REG_WDCFG1				0x28
> +#define MAX42500_REG_WDCFG2				0x29
> +#define MAX42500_REG_WDKEY				0x2A
> +#define MAX42500_REG_WDLOCK				0x2B
> +#define MAX42500_REG_RSTCTRL			0x2C
> +#define MAX42500_REG_CID				0x2D
> +
> +/** X is set based on the pull configuration of the ADDR pin */
> +#define MAX42500_ADDR(x)				(0x28 + (x))
> +#define MAX42500_SILICON_ID				(0x30)
> +#define MAX42500_I2C_WR_FRAME_SIZE		(4)
> +#define MAX42500_I2C_RD_FRAME_SIZE		(5)
> +
> +/** MAX42500 Nominal voltage computation */
> +#define MAX42500_VNOM_MAX_VM1_VM4		0xFF	// 3.6875v
> +#define MAX42500_VNOM_MAX_VM5			0xFF	// 5.6v
> +#define MAX42500_MIN_VNOM				0x00	// 0.5v
> +#define MAX42500_VNOM_STEP_VM1_VM4		0x01	// 0.0125v
> +#define MAX42500_VNOM_STEP_VM5			0x01	// 0.02v
> +
> +/** MAX42500 Undervoltage/Overvoltage maximum and minimum thresholds*/
> +#define MAX42500_MAX_THRESH_VM1_VM5		0x0F	// OV = 110.0%, UV = 90.0%
> +#define MAX42500_MIN_THRESH_VM1_VM5		0x00	// OV = 102.5%, UV = 97.5%
> +#define MAX42500_MAX_THRESH_VM6_V7		0xFF	// 1.775v
> +#define MAX42500_MIN_THRESH_VM6_V7		0x00	// 0.5v
> +
> +/* CONFIG1 bit masks */
> +#define MAX42500_CONFIG1_PECE_MASK		BIT(0)
> +#define MAX42500_CONFIG1_MBST_MASK		BIT(1)
> +#define MAX42500_CONFIG1_RR_MASK		BIT(2)
> +
> +/* VMON bit masks */
> +#define MAX42500_VMON_IN_MASK(bit)		BIT(bit)
> +#define MAX42500_VMON_VMPD_MASK			BIT(7)
> +
> +/* RSTMAP bit masks */
> +#define MAX42500_RSTMAP_IN_MASK(bit)	BIT(bit)
> +#define MAX42500_RSTMAP_PARM_MASK		BIT(7)
> +
> +/* WDCDIV bit masks */
> +#define MAX42500_WDCDIV_SWW_MASK		BIT(6)
> +#define MAX42500_WDCDIV_WDIC_MASK		(0x3F)
> +
> +/* WDCFG2 bit masks */
> +#define MAX42500_WDCFG2_WDEN_MASK		BIT(3)
> +#define MAX42500_WDCFG2_1UP_MASK		(0x7)
> +
> +/* WDLOCK bit masks */
> +#define MAX42500_WDLOCK_LOCK_MASK		BIT(0)
> +
> +/* RSTCTRL bit masks */
> +#define MAX42500_RSTCTRL_MR1_MASK		BIT(2)
> +#define MAX42500_RSTCTRL_RHLD_MASK		(0x3)
> +
> +/* MAX42500 device status */
> +enum max42500_status {
> +	MAX42500_STATUS_OFF,
> +	MAX42500_STATUS_SLEEP,
> +	MAX42500_STATUS_ON,
> +	MAX42500_STATUS_MAX
> +};
> +
> +/* MAX42500 voltage monitor input */
> +enum max42500_vm_input {
> +	MAX42500_VM1,
> +	MAX42500_VM2,
> +	MAX42500_VM3,
> +	MAX42500_VM4,
> +	MAX42500_VM5,
> +	MAX42500_VM6,
> +	MAX42500_VM7,
> +	MAX42500_VM_MAX
> +};
> +
> +/* MAX42500 comparator status */
> +enum max42500_comp_stat {
> +	MAX42500_COMP_STAT_OFF,
> +	MAX42500_COMP_STAT_UV,
> +	MAX42500_COMP_STAT_OV,
> +	MAX42500_COMP_STAT_MAX
> +};
> +
> +/* MAX42500 watchdog mode */
> +enum max42500_wd_mode {
> +	MAX42500_WD_MODE_CH_RESP,
> +	MAX42500_WD_MODE_SIMPLE,
> +	MAX42500_WD_MODE_MAX
> +};
> +
> +/* MAX42500 reset hold/active timeout time. */
> +enum max42500_wd_rhld {
> +	MAX42500_WD_RHOLD_0_MS,
> +	MAX42500_WD_RHOLD_8_MS,
> +	MAX42500_WD_RHOLD_16_MS,
> +	MAX42500_WD_RHOLD_32_MS,
> +	MAX42500_WD_RHOLD_MAX
> +};
> +
> +struct max42500_config {
> +	/* Packet error checking enable */
> +	u8 pece;
> +	/* Enabled voltage monitor inputs */
> +	u8 vmon_en;
> +	/* Voltage monitor power down enable */
> +	u8 vmon_vmpd;
> +	/* Enabled voltage monitor reset mapping */
> +	u8 reset_map;
> +	/* Watchdog mode */
> +	enum max42500_wd_mode wd_mode;
> +	/* Watchdog clock div */
> +	u8 wd_cdiv;
> +	/* Watchdog close window */
> +	u8 wd_close;
> +	/* Watchdog open window */
> +	u8 wd_open;
> +	/* Watchdog first update window */
> +	u8 wd_1ud;
> +	/* Watchdog enable */
> +	u8 wd_en;
> +};
> +
> +struct max42500_state {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct max42500_config *config;
> +	long pwrup_stamp[MAX42500_VM_MAX];
> +	long pwrdn_stamp[MAX42500_VM_MAX];
> +	u8 ov_thresh1[MAX42500_VM_MAX - 2];
> +	u8 ov_thresh2[MAX42500_VM_MAX - 5];
> +	u8 uv_thresh1[MAX42500_VM_MAX - 2];
> +	u8 uv_thresh2[MAX42500_VM_MAX - 5];
> +	u8 nominal_volt[MAX42500_VM_MAX - 2];
> +	u8 comp_status[MAX42500_VM_MAX * MAX42500_COMP_STAT_MAX];
> +};
> +
> +/************************ Functions Definitions **************************/
> +/**
> + * @brief Read a raw value from a register.
> + * @return 0 in case of success, error code otherwise.
> + */
> +static int max42500_reg_read(struct max42500_state *st,
> +								u8 reg_addr, u8 *reg_data)
> +{
> +	int ret;
> +	u8 i2c_data[MAX42500_I2C_RD_FRAME_SIZE] = {0};
> +	u8 bytes_num;
> +	u8 pece_value;
> +
> +	/* PEC is computed over entire I2C frame from first START condition */
> +	i2c_data[0] = (st->client->addr << 1);
> +	i2c_data[1] = reg_addr;
> +	i2c_data[2] = (st->client->addr << 1) | 0x1;
> +
> +	/* I2C write target address */
> +	bytes_num = 1;
> +
> +	ret = regmap_bulk_write(st->regmap, reg_addr, &i2c_data[1], bytes_num);
> +	if (ret)
> +		return ret;
> +
> +	/* Change byte count if PECE is enabled (1-byte data. 1-byte PEC) */
> +	bytes_num = (st->config->pece) ? 2 : bytes_num;
> +
> +	ret = regmap_bulk_read(st->regmap, reg_addr, &i2c_data[3], bytes_num);
> +	if (ret)
> +		return ret;
> +
> +	if (st->config->pece) {
> +		/* Compute CRC over entire I2C frame */
> +		pece_value = crc8(max42500_crc8, i2c_data,
> +							(MAX42500_I2C_RD_FRAME_SIZE - 1), 0);
> +
> +		if (i2c_data[4] != pece_value)
> +			return -EIO;
> +	}
> +
> +	*reg_data = i2c_data[3];
> +
> +	return 0;

This seems to re-implement PEC support in the driver. As mentioned, PEC support should
be handled in the i2c controller driver.

Also, _if_ it is for some reasons necessary to implement chip access functions,
those should be implemented as regmap bus. The functional part of the driver
should just use regmap functions to access the chip.

> +}
> +
> +/**
> + * @brief Write a raw value to a register.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_reg_write(struct max42500_state *st,
> +								u8 reg_addr, u8 data)
> +{
> +	u8 i2c_data[MAX42500_I2C_WR_FRAME_SIZE] = {0};
> +	u8 bytes_num;
> +	u8 pece_value;
> +
> +	bytes_num = (st->config->pece) ? (MAX42500_I2C_WR_FRAME_SIZE - 1) : 2;
> +	i2c_data[0] = (st->client->addr << 1);
> +	i2c_data[1] = reg_addr;
> +	i2c_data[2] = (u8)(data & 0xFF);
> +
> +	pece_value = 0;
> +	if (st->config->pece)
> +		pece_value = crc8(max42500_crc8, i2c_data, bytes_num, 0);
> +
> +	i2c_data[0] = i2c_data[1];
> +	i2c_data[1] = i2c_data[2];
> +	i2c_data[2] = pece_value;
> +
> +	return regmap_bulk_write(st->regmap, reg_addr, i2c_data, bytes_num);
> +}
> +
> +/**
> + * @brief Update a register's value based on a mask.
> + * @return 0 in case of success, negative error code otherwise.

Please fix.

> + */
> +static int max42500_reg_update(struct max42500_state *st,
> +								u8 reg_addr, u8 mask, u8 data)
> +{
> +	int ret;
> +	u8 reg_data;
> +
> +	ret = max42500_reg_read(st, reg_addr, &reg_data);
> +	if (ret)
> +		return ret;
> +
> +	reg_data &= ~mask;
> +	reg_data |= mask & data;
> +
> +	return max42500_reg_write(st, reg_addr, reg_data);
> +}
> +
> +/**
> + * @brief Set nominal voltage for VM1 to VM5.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_set_nominal_voltage(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, u8 voltage)
> +{
> +	u8 reg_addr;
> +
> +	switch (vm_in) {
> +	case MAX42500_VM1:
> +	case MAX42500_VM2:
> +	case MAX42500_VM3:
> +	case MAX42500_VM4:
> +		if (voltage < MAX42500_MIN_VNOM ||
> +			voltage > MAX42500_VNOM_MAX_VM1_VM4)
> +			return -EINVAL;

The driver should use clamp_val() for value boundary control.

> +		reg_addr = MAX42500_REG_VIN1 + vm_in;
> +		break;
> +	case MAX42500_VM5:
> +		if (voltage < MAX42500_MIN_VNOM ||
> +			voltage > MAX42500_VNOM_MAX_VM5)
> +			return -EINVAL;
> +		reg_addr = MAX42500_REG_VIN5;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	st->nominal_volt[vm_in] = voltage;

I fail to understand how this is supposed to work. The locally
cached values are set (only) here, with a sysfs attribute. During
probe they are not set, meaning the input attribute won't be available
because it is only created if nominal_volt is set which is not the case
at that time. That doesn't make sense. There needs to be some default.

Also, the whole point of using regmap is that regmap provides
caching. The code should use that facility instead of caching locally.

> +	return max42500_reg_write(st, reg_addr, voltage);
> +}
> +
> +/**
> + * @brief Get the status of the voltage monitor input.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_get_comp_status(struct max42500_state *st,
> +									u8 vm_in, u8 *status)
> +{
> +	int ret;
> +	u8 reg_addr;
> +	u8 vm_in_status;
> +
> +	switch (vm_in % MAX42500_COMP_STAT_MAX) {
> +	case MAX42500_COMP_STAT_OFF:
> +		reg_addr = MAX42500_REG_STATOFF;
> +		break;
> +	case MAX42500_COMP_STAT_UV:
> +		reg_addr = MAX42500_REG_STATUV;
> +		break;
> +	case MAX42500_COMP_STAT_OV:
> +		reg_addr = MAX42500_REG_STATOV;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = max42500_reg_read(st, reg_addr, &vm_in_status);
> +	if (ret)
> +		return ret;
> +
> +	switch (vm_in % MAX42500_VM_MAX) {
> +	case MAX42500_VM1:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM1), vm_in_status);
> +		break;
> +	case MAX42500_VM2:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM2), vm_in_status);
> +		break;
> +	case MAX42500_VM3:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM3), vm_in_status);
> +		break;
> +	case MAX42500_VM4:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM4), vm_in_status);
> +		break;
> +	case MAX42500_VM5:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM5), vm_in_status);
> +		break;
> +	case MAX42500_VM6:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM6), vm_in_status);
> +		break;
> +	case MAX42500_VM7:
> +		*status = (u8)FIELD_GET(BIT(MAX42500_VM7), vm_in_status);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	st->comp_status[vm_in] = *status;
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief Set the overvoltage threshold of VM1 to VM5.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_set_ov_thresh1(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, u8 thresh)
> +{
> +	if (thresh < MAX42500_MIN_THRESH_VM1_VM5 ||
> +		thresh > MAX42500_MAX_THRESH_VM1_VM5)
> +		return -EINVAL;
> +
> +	switch (vm_in) {
> +	case MAX42500_VM1:
> +	case MAX42500_VM2:
> +	case MAX42500_VM3:
> +	case MAX42500_VM4:
> +	case MAX42500_VM5:
> +		st->ov_thresh1[vm_in] = thresh;
> +		return max42500_reg_update(st,
> +								MAX42500_REG_OVUV1 + vm_in,
> +								GENMASK(7, 4),
> +								FIELD_PREP(GENMASK(7, 4),
> +								thresh));
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +/**
> + * @brief Set the overvoltage threshold of VM6 and VM7.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_set_ov_thresh2(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, u8 thresh)
> +{
> +	u8 reg_addr;
> +
> +	if (thresh < MAX42500_MIN_THRESH_VM6_V7 ||
> +		thresh > MAX42500_MAX_THRESH_VM6_V7)
> +		return -EINVAL;
> +
> +	switch (vm_in) {
> +	case MAX42500_VM6:
> +		reg_addr = MAX42500_REG_VINO6;
> +		break;
> +	case MAX42500_VM7:
> +		reg_addr = MAX42500_REG_VINO7;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	st->ov_thresh2[vm_in] = thresh;
> +	return max42500_reg_write(st, reg_addr, thresh);
> +}
> +
> +/**
> + * @brief Set the undervoltage threshold of VM1 to VM5.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_set_uv_thresh1(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, u8 thresh)
> +{
> +	if (thresh < MAX42500_MIN_THRESH_VM1_VM5 ||
> +		thresh > MAX42500_MAX_THRESH_VM1_VM5)
> +		return -EINVAL;
> +
> +	switch (vm_in) {
> +	case MAX42500_VM1:
> +	case MAX42500_VM2:
> +	case MAX42500_VM3:
> +	case MAX42500_VM4:
> +	case MAX42500_VM5:
> +		st->uv_thresh1[vm_in] = thresh;
> +		return max42500_reg_update(st,
> +					MAX42500_REG_OVUV1 + vm_in,
> +					GENMASK(3, 0),
> +					thresh);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +/**
> + * @brief Set the undervoltage threshold of VM6 and VM7.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_set_uv_thresh2(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, u8 thresh)
> +{
> +	u8 reg_addr;
> +
> +	if (thresh < MAX42500_MIN_THRESH_VM6_V7 ||
> +		thresh > MAX42500_MAX_THRESH_VM6_V7)
> +		return -EINVAL;
> +
> +	switch (vm_in) {
> +	case MAX42500_VM6:
> +		reg_addr = MAX42500_REG_VINU6;
> +		break;
> +	case MAX42500_VM7:
> +		reg_addr = MAX42500_REG_VINU7;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	st->uv_thresh2[vm_in] = thresh;
> +	return max42500_reg_write(st, reg_addr, thresh);
> +}
> +
> +/**
> + * @brief Get the FPS clock divider value.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_get_fps_clk_div(struct max42500_state *st,
> +	u8 *fps_clk_div)
> +{
> +	int ret;
> +	u8 reg_val;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_FPSCFG1, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	*fps_clk_div = (u8)FIELD_GET(GENMASK(2, 0), reg_val);
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief Get power-up timestamp for a specified voltage monitor input.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_get_power_up_timestamp(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, long *timestamp)
> +{
> +	int ret;
> +	u8 reg_val;
> +	u8 fps_clk_div;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_UTIME1 + vm_in, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	/* Check if the input voltage rose above the UV threshold */
> +	if (reg_val == 0) {
> +		/* Input voltage never rose above UV threshold*/
> +		*timestamp = 0;
> +		return 0;
> +	}
> +
> +	ret = max42500_get_fps_clk_div(st, &fps_clk_div);
> +	if (ret)
> +		return ret;
> +
> +	*timestamp = (reg_val - 1) * 25 * (1 << fps_clk_div);
> +	st->pwrup_stamp[vm_in] = *timestamp;
> +	return 0;
> +}
> +
> +/**
> + * @brief Get power-down timestamp for a specified voltage monitor input.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_get_power_down_timestamp(struct max42500_state *st,
> +	enum max42500_vm_input vm_in, long *timestamp)
> +{
> +	int ret;
> +	u8 reg_val;
> +	u8 fps_clk_div;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_DTIME1 + vm_in, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	/* Check if the input voltage fell below the OFF threshold */
> +	if (reg_val == 0) {
> +		/* Input voltage never fell below OFF threshold */
> +		*timestamp = 0;
> +		return 0;
> +	}
> +
> +	ret = max42500_get_fps_clk_div(st, &fps_clk_div);
> +	if (ret)
> +		return ret;
> +
> +	*timestamp = (reg_val - 1) * 25 * (1 << fps_clk_div);
> +	st->pwrdn_stamp[vm_in] = *timestamp;
> +	return 0;
> +}
> +
> +/**
> + * @brief Enable/Disable watchdog
> + * @return 0 in case of success, error code otherwise
> + */
> +static int max42500_set_watchdog_enable(struct max42500_state *st,
> +										bool wd_enable)
> +{
> +	int ret;
> +	u8 reg_val;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_WDCFG2, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	if (wd_enable)
> +		reg_val |= BIT(3);
> +	else
> +		reg_val &= ~BIT(3);
> +
> +	return max42500_reg_write(st, MAX42500_REG_WDCFG2, reg_val);
> +}
> +
> +/**
> + * @brief 8-bit watchdog key computation.
> + * @return 0 in case of success, negative error code otherwise.
> + */
> +static int max42500_get_watchdog_key(struct max42500_state *st,
> +										u8 *new_wd_key)
> +{
> +	int ret;
> +	u8 curr_wd_key;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_WDKEY, &curr_wd_key);
> +	if (ret)
> +		return ret;
> +
> +	/* Calculate the new bit using the LFSR polynomial */
> +	u8 new_bit = ((curr_wd_key >> 7) ^
> +					(curr_wd_key >> 5) ^
> +					(curr_wd_key >> 4) ^
> +					(curr_wd_key >> 3)) & 0x01;
> +
> +	/* Shift existing bits upwards to MSb and insert the new bit as LSb */
> +	*new_wd_key = (curr_wd_key << 1) | new_bit;
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief Update the watchdog key based on the mode and current value.
> + * @return 0 in case of success, error code otherwise.
> + */
> +static int max42500_set_watchdog_key(struct max42500_state *st)
> +{
> +	int ret;
> +	u8 reg_val;
> +	u8 wd_key;
> +	u8 wd_mode;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_WDKEY, &wd_key);
> +	if (ret)
> +		return ret;
> +
> +	ret = max42500_reg_read(st, MAX42500_REG_WDCDIV, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	wd_mode = (u8)FIELD_GET(BIT(6), reg_val);
> +
> +	/* Compute new watchdog key for challenge/response mode */
> +	if (wd_mode == MAX42500_WD_MODE_CH_RESP)
> +		max42500_get_watchdog_key(st, &wd_key);
> +
> +	return max42500_reg_write(st, MAX42500_REG_WDKEY, wd_key);
> +}
> +
> +/** @brief Set watchdog reset hold time
> + * @return 0 in case of success, error code otherwise
> + */
> +static int max42500_set_watchdog_rhld(struct max42500_state *st, u8 rhld)
> +{
> +	return max42500_reg_update(st,
> +								MAX42500_REG_RSTCTRL,
> +								GENMASK(1, 0),
> +								rhld);
> +}
> +
> +static umode_t max42500_is_visible(const void *data,
> +	enum hwmon_sensor_types type, u32 attr, int channel)
> +{
> +	const struct max42500_state *st = data;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_in_reset_history:
> +			if (st->pwrup_stamp[channel])
> +				return 0444;
> +			break;
> +		case hwmon_chip_curr_reset_history:
> +			if (st->pwrdn_stamp[channel])
> +				return 0444;
> +			break;
> +		case hwmon_chip_register_tz:
> +			return 0200;
> +		case hwmon_chip_alarms:
> +		case hwmon_chip_update_interval:
> +		case hwmon_chip_temp_reset_history:
> +		case hwmon_chip_power_reset_history:
> +			return 0644;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			if (st->nominal_volt[channel])
> +				return 0644;
> +			break;
> +		case hwmon_in_lowest:
> +			if (st->ov_thresh1[channel])
> +				return 0644;
> +			break;
> +		case hwmon_in_highest:
> +			if (st->ov_thresh2[channel])
> +				return 0644;
> +			break;
> +		case hwmon_in_min:
> +			if (st->uv_thresh1[channel])
> +				return 0644;
> +			break;
> +		case hwmon_in_max:
> +			if (st->uv_thresh2[channel])
> +				return 0644;
> +			break;
> +		case hwmon_in_label:
> +			if (st->comp_status[channel])
> +				return 0444;
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max42500_read_in(struct device *dev, u32 attr, int channel,
> +							long *value)
> +{
> +	struct max42500_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_in_label:
> +		return max42500_get_comp_status(st, channel, (u8 *)value);

The label atribute is supposed to return a text.

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max42500_read_chip(struct device *dev, u32 attr, int channel,
> +								long *value)
> +{
> +	struct max42500_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_chip_in_reset_history:
> +		return max42500_get_power_up_timestamp(st, channel, value);
> +	case hwmon_chip_curr_reset_history:
> +		return max42500_get_power_down_timestamp(st, channel, value);
> +	case hwmon_chip_power_reset_history:
> +		return max42500_get_watchdog_key(st, (u8 *)value);
> +	case hwmon_chip_update_interval:
> +		return max42500_get_fps_clk_div(st, (u8 *)value);

More ABI violations.

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max42500_read(struct device *dev, enum hwmon_sensor_types type,
> +							u32 attr, int channel, long *value)
> +{
> +	switch (type) {
> +	case hwmon_chip:
> +		return max42500_read_chip(dev, attr, channel, value);
> +	case hwmon_in:
> +		return max42500_read_in(dev, attr, channel, value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max42500_write_in(struct device *dev, u32 attr, int channel,
> +								long value)
> +{
> +	struct max42500_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return max42500_set_nominal_voltage(st, channel, (u8)value);

This is an ABI violation: inX_input attributes return voltages provided by
the chip, and are not writeable. Looking into the datasheet, this has to be
set using the min/max attributes.

> +	case hwmon_in_min:
> +		return max42500_set_uv_thresh1(st, channel, (u8)value);

This is a severe ABI violation. First, again, "(u8)value" is unacceptable.
Second, the ABI states that this is a value in mV, not a percentage.
I don't know why the chip uses a concept of "nominal voltage" and percentages
of that for thresholds. I undersatand that this makes working with the chip
difficult, but that does not mean that ABI violations are acceptable.

AFAICS the chip doesn't even report the current voltages, so any inX_input
attributes must not be provided. The limit attributes must set limits in mV.

> +	case hwmon_in_max:
> +		return max42500_set_uv_thresh2(st, channel, (u8)value);
> +	case hwmon_in_lowest:
> +		return max42500_set_ov_thresh1(st, channel, (u8)value);
> +	case hwmon_in_highest:
> +		return max42500_set_ov_thresh2(st, channel, (u8)value);

This looks like another ABI violation. _lowest and _highest_ attributes
report historic values.

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max42500_write_chip(struct device *dev, u32 attr, int channel,
> +								long value)
> +{
> +	struct max42500_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_chip_temp_reset_history:
> +		return max42500_set_watchdog_rhld(st, (u8)value);
> +	case hwmon_chip_register_tz:
> +		return max42500_set_watchdog_key(st);
> +	case hwmon_chip_alarms:
> +		return max42500_set_watchdog_enable(st, (bool)value);
> +	default:

The above all seem to abouse the ABI and need documentation
and explanation to even be able to evaluate.

On top of that, cutting off values such as by "(u8)value" is
unacceptable; writing 256 would have the same result as writing 0.

> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max42500_write(struct device *dev, enum hwmon_sensor_types type,
> +							u32 attr, int channel, long value)
> +{
> +	switch (type) {
> +	case hwmon_chip:
> +		return max42500_write_chip(dev, attr, channel, value);
> +	case hwmon_in:
> +		return max42500_write_in(dev, attr, channel, value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct max42500_config max42500_init = {
> +	.pece = true,
> +	.vmon_en = true,
> +	.vmon_vmpd = true,
> +	.reset_map = (MAX42500_RSTMAP_IN_MASK(MAX42500_VM2) |
> +					MAX42500_RSTMAP_IN_MASK(MAX42500_VM3) |
> +					MAX42500_RSTMAP_IN_MASK(MAX42500_VM4) |
> +					MAX42500_RSTMAP_PARM_MASK),
> +	.wd_mode = MAX42500_WD_MODE_SIMPLE,
> +	.wd_cdiv = 0x0,
> +	.wd_close = 0x0,
> +	.wd_open = 0x0,
> +	.wd_1ud = 0x0,
> +	.wd_en = true,
> +};
> +
> +static int max42500_init_client(struct max42500_state *st,
> +								struct device *dev)
> +{
> +	int err;
> +	u8 device_id;
> +
> +	if (!st || !dev)
> +		return -EINVAL;

How would any of those ever be NULL ? Please drop such unnecessary checks.
> +
> +	crc8_populate_msb(max42500_crc8, CRC8_PEC);
> +
> +	/* Check device silicon ID */
> +	err = max42500_reg_read(st, MAX42500_REG_ID, &device_id);
> +	if (err)
> +		return err;
> +
> +	if (device_id != MAX42500_SILICON_ID)
> +		return -ENODEV;
> +
> +	/* Configure PEC */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_CONFIG1,
> +				  BIT(0),
> +				  max42500_init.pece);
> +	if (err)
> +		return err;
> +
> +	/* Set PEC enable/disable for subsequent register access */
> +	st->config->pece = max42500_init.pece;
> +
> +	/* Enable voltage monitor inputs */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_VMON,
> +				  GENMASK(6, 0),
> +				  max42500_init.vmon_en);
> +	if (err)
> +		return err;
> +
> +	/* Enable voltage monitor power-down */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_VMON,
> +				  BIT(7),
> +				  max42500_init.vmon_vmpd);
> +	if (err)
> +		return err;
> +
> +	/* Enable input OV/UV mapping to reset pin */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_RSTMAP,
> +				  GENMASK(6, 0),
> +				  max42500_init.reset_map);
> +	if (err)
> +		return err;
> +
> +	/* Set watchdog mode */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_WDCDIV,
> +				  BIT(6),
> +				  max42500_init.wd_mode << 6);
> +	if (err)
> +		return err;
> +
> +	/* Set watchdog clock div */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_WDCDIV,
> +				  GENMASK(5, 0),
> +				  max42500_init.wd_cdiv);
> +	if (err)
> +		return err;
> +
> +	/* Set watchdog open window */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_WDCFG1,
> +				  GENMASK(3, 0),
> +				  max42500_init.wd_open);
> +	if (err)
> +		return err;
> +
> +	/* Set watchdog close window */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_WDCFG1,
> +				  GENMASK(7, 4),
> +				  max42500_init.wd_close);
> +	if (err)
> +		return err;
> +
> +	/* Set watchdog first update window */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_WDCFG2,
> +				  GENMASK(2, 0),
> +				  max42500_init.wd_1ud);
> +	if (err)
> +		return err;
> +
> +	/* Set watchdog enable */
> +	err = max42500_reg_update(st,
> +				  MAX42500_REG_WDCFG2,
> +				  BIT(3),
> +				  max42500_init.wd_en);
> +	if (err)
> +		return err;
> +
> +	/* Update parameters */
> +	st->config->vmon_en = max42500_init.vmon_en;
> +	st->config->vmon_vmpd = max42500_init.vmon_vmpd;
> +	st->config->reset_map = max42500_init.reset_map;
> +	st->config->wd_mode = max42500_init.wd_mode;
> +	st->config->wd_cdiv = max42500_init.wd_cdiv;
> +	st->config->wd_open = max42500_init.wd_open;
> +	st->config->wd_close = max42500_init.wd_close;
> +	st->config->wd_1ud = max42500_init.wd_1ud;
> +	st->config->wd_en = max42500_init.wd_en;

Why not just setting a pointer to max42500_init ? 

> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops max42500_hwmon_ops = {
> +	.is_visible = max42500_is_visible,
> +	.read = max42500_read,
> +	.write = max42500_write,
> +};
> +
> +static const struct hwmon_channel_info *max42500_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY |
> +			HWMON_C_TEMP_RESET_HISTORY | HWMON_C_POWER_RESET_HISTORY |
> +			HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL | HWMON_C_ALARMS,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY,
> +			HWMON_C_IN_RESET_HISTORY | HWMON_C_CURR_RESET_HISTORY),
> +	HWMON_CHANNEL_INFO(in,
> +			HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_MIN |
> +			HWMON_I_HIGHEST | HWMON_I_MAX,
> +			HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_MIN |
> +			HWMON_I_HIGHEST | HWMON_I_MAX,
> +			HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_MIN,
> +			HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_MIN,
> +			HWMON_I_LABEL | HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_MIN,
> +			HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL,
> +			HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL,
> +			HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL,
> +			HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL, HWMON_I_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info max42500_chip_info = {
> +	.ops = &max42500_hwmon_ops,
> +	.info = max42500_info,
> +};
> +
> +static const struct regmap_config max42500_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x2D
> +};
> +
> +static int max42500_probe(struct i2c_client *client)
> +{
> +	struct device *hwmon_dev;
> +	struct max42500_state *st;
> +	int err;
> +
> +	st = devm_kzalloc(&client->dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	st->client = client;
> +	st->regmap = devm_regmap_init_i2c(client, &max42500_regmap_config);
> +	if (IS_ERR(st->regmap))
> +		return PTR_ERR(st->regmap);
> +
> +	err = max42500_init_client(st, &client->dev);
> +	if (err)
> +		return err;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
> +					client->name, st, &max42500_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id max42500_of_match[] = {
> +	{ .compatible = "adi,max42500" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max42500_of_match);
> +
> +static const struct i2c_device_id max42500_id[] = {
> +	{ "max42500", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max42500_id);
> +
> +static struct i2c_driver max42500_driver = {
> +	.driver = {
> +		.name	= "max42500",
> +		.of_match_table = max42500_of_match,
> +	},
> +	.probe		= max42500_probe,
> +	.id_table	= max42500_id,
> +};
> +
> +module_i2c_driver(max42500_driver);
> +
> +MODULE_AUTHOR("Kent Libetario <kent.libetario@analog.com>");
> +MODULE_DESCRIPTION("Hwmon driver for MAX42500");
> +MODULE_LICENSE("GPL");
