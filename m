Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262D43E068
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835137; cv=none; b=G3oY4gA9F+Agp6YQzmjxGIpertAEOE8XucR5RR6uIWES4/XZj8zR+1Wrjc1JmaELENOxlMjsuP9BJPamFXp8phno8aZfmJY5tMqr0ul8pas4jISpMG3K44N6ObVWaZfM8B+K12vAK4EISY5LeQvl9xamy0MLs1KzB8cELIKdT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835137; c=relaxed/simple;
	bh=f7gFXRxUEBKv+N0yLum3AHRxTXW0hMLMdlAoZ+Iuea8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYra+Mt/8GZNMyZexN9EU3FgVM5hnhiVBBBdOA0zck4/NgG8Y95kbScDUMPCvr0/CXZx5gX0A6oYyxU+G3IdSt6piaxvueWF5Fu16dlUNMQRKInjoiAntdCWUHkXlXIqd2wfYHhNlkdXeUrxr1QD5yF16Q9U5ZqIa/Wf5eKWZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSIsUfLn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSIsUfLn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so2240220f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785835133; x=1786439933; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7zMQxWpvpHrANzppYRPBhOXQubSwXHmijqdWQHg2q4U=;
        b=fSIsUfLnw8UJRUeHN/Fw8THsNzsTATsdS2DCI4S8rVsutQzm/mZQWlZG++a7M7v4mi
         v+y7VoIZTs6J/yL5qsLK826R/iiZvjoMMV2ExFW5uirFoNxNICySzHlyJcVSsjC3uzrT
         X/c+17F1RLIOniSP2IZANNuGKl+hX7I1+2sB19hSJERJnoiQaJ4mqJBiAz28si3FCJe8
         gSwv2ueFCC5zGMq3ijzUW3xRemSGsKkSWWQI/s5ft40ZPlfRrS4+thnvsDE2E648VOle
         WZCV0ye5mJ4hqP2wMtuqZvT7LVcpmIzzLw7fLMq3T2Cdk4wYtc6vJJrdstlVy+fdL7MZ
         LEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785835133; x=1786439933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7zMQxWpvpHrANzppYRPBhOXQubSwXHmijqdWQHg2q4U=;
        b=PTn2/HDXxoIsxSvSoaHTys9VFfkBWHmjiMgKpFKTxEa487koHsuL1YQ0i048gmIxy7
         wEaXuxNUlQGeslRMK6RzOQCIDJCw//j2Vus6tKG/PhmDV6OrK6i+htGiY1nzGRLQCZiH
         cNsspTTihw4oiI1tZSL4NQoEwweaU9OjUaljxhAODNvF/90PAhlsd9vGpcKfBem/VWC2
         gUulYorc4dLPRJvtjEoedhqJIX/I7INbUYtdhc+1nt7E6jeTdwPiZXjLJZikA/AqS+wO
         4hvKhzxf6hUz2ZSljqN71r0UzTZRazpQpXCztfmAR3UrGu9ugV1lMLuf1CEnw5liJl/k
         OBPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRT0lkVmBirSQpZaBKJdWoPkLqSKNTg5ku2kNOxMbrjbmUTD5jQ5QbQtTTG3hlg4jV7VlYjxFZcCSe1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9ARClJJ4m92aDISraxjPzXTdkePy9oawWsqadKbZaNc5E5gZ
	aqHgrLERnd0sYIGolBnSqPIXSQDdy7ccyutqthn25+pXh6rUgnkgerCf
X-Gm-Gg: AR+sD10QMn3uLKtAArUbw6I3mtFTOc2GVpiJwEaEKmPqJKa4iT4Vub3cRi/vzaGrfJY
	QO1o/rk3hCcj161cfINX7j+DrppHGxWWbgSmJliNHEsqZTZ29b9iddnAnlHs53tI7J6Z/11e0YW
	GawpUq0EX8lFFr0zeP8aCaTYN8Q6bv7BO6TipV7WDOsD/HMwWRDi74DeDcJxSwEhwodIvyDwSzl
	D/hh3YvF6/oVUzkivxM+52MhVSiQ2bpUA9xF/9K0SC671vgYhGTGsjqZt1zbFPxx0oal659d0JL
	nVpeBb8NkB1EEEsi+6UyW9rBx4PXuhaac3+LsrFsI9owOh8O4Pldo1J7dym2p6cIw3/SrtIW8oV
	YYurzidc6MqQtKj0og3lvczuurWmtZ7ORrFPgLDF5FXTjpyYxORNa6TiYHn6lNB/r2Zhvg+V075
	4SImoVIpvJrDNtHWMOWGHKPnZWle9D6Q/wj5JpN/w4jUJDBA8tW1jq
X-Received: by 2002:a05:6000:2dc6:b0:47f:959f:f69c with SMTP id ffacd0b85a97d-47fdd6ce560mr29265624f8f.7.1785835133282;
        Tue, 04 Aug 2026 02:18:53 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d17f2sm45397522f8f.2.2026.08.04.02.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:18:52 -0700 (PDT)
Date: Tue, 4 Aug 2026 10:20:03 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Message-ID: <anGsbjdpV_qw3QDp@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
 <15f4a141-7e69-47e2-b584-9c1490447e12@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15f4a141-7e69-47e2-b584-9c1490447e12@roeck-us.net>

On Tue, Jul 28, 2026 at 03:12:59PM -0700, Guenter Roeck wrote:
> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > From: Nuno Sá <nuno.sa@analog.com>
> > 
> > The MAX20826 IC and similar provide a high-density, flexible and scalable
> > dual-loop solution for high current cores for AI applications. These are
> > dual loop solutions multiphase voltage regulators. Between Rails A and B,
> > MAX20855B and MAX20908 supports up to 8 phases total configurable from
> > 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> > and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> > 
> > Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> 
> Very incomplete review; see it as first glance feedback.
> 
> Guenter
> 
> > ---
> >   Documentation/hwmon/index.rst    |    1 +
> >   Documentation/hwmon/max20826.rst |  124 +++++
> >   MAINTAINERS                      |    2 +
> >   drivers/hwmon/pmbus/Kconfig      |   19 +
> >   drivers/hwmon/pmbus/Makefile     |    1 +
> >   drivers/hwmon/pmbus/max20826.c   | 1037 ++++++++++++++++++++++++++++++++++++++
> >   6 files changed, 1184 insertions(+)
> > 
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> > index 29130df44d12..c63992b292c1 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -164,6 +164,7 @@ Hardware Monitoring Kernel Drivers
> >      max197
> >      max20730
> >      max20751
> > +   max20826
> >      max20830
> >      max20860a
> >      max31722
> > diff --git a/Documentation/hwmon/max20826.rst b/Documentation/hwmon/max20826.rst
> > new file mode 100644
> > index 000000000000..be97312dc612
> > --- /dev/null
> > +++ b/Documentation/hwmon/max20826.rst
> > @@ -0,0 +1,124 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Kernel driver max20826
> > +======================
> > +
> > +Supported chips:
> > +
> > +  * Analog Devices MAX20826
> > +
> > +    Prefix: 'max20826'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: Datasheet is not publicly available.
> > +
> > +  * Analog Devices MAX20855B
> > +
> > +    Prefix: 'max20855b'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: Datasheet is not publicly available.
> > +
> > +  * Analog Devices MAX20908
> > +
> > +    Prefix: 'max20908'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: Datasheet is not publicly available.
> > +
> > +  * Analog Devices MAX20912
> > +
> > +    Prefix: 'max20912'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: Datasheet is not publicly available.
> > +
> > +  * Analog Devices MAX20916
> > +
> > +    Prefix: 'max20916'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: Datasheet is not publicly available.
> > +
> > +Author:
> > +
> > +  - Nuno Sá <nuno.sa@analog.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +This driver supports hardware monitoring for Analog Devices MAX20826,
> > +MAX20855B, MAX20908, MAX20912, and MAX20916 multiphase voltage regulator
> > +controllers with PMBus interface.
> > +
> > +The devices are dual-loop, multiphase controllers. Depending on the device and
> > +configuration, the high-speed processor voltage-control interface can be
> > +Nvidia PWMVID, Intel SVID, AMD SVI3, or AVSBus. PMBus is used for monitoring,
> > +configuration, status, and fault reporting.
> > +
> > +The driver detects whether the device uses PMBus page mode or direct address
> > +mode. In direct address mode, rail B is accessed at the rail A I2C address plus
> > +one. If rail B is present, the driver exposes a second PMBus page.
> > +
> > +The driver detects the active number of phases and exposes per-phase input and
> > +output current attributes through the PMBus virtual phase support.
> > +
> > +Usage Notes
> > +-----------
> > +
> > +This driver does not auto-detect devices. You will have to instantiate the
> > +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> > +details.
> > +
> > +The optional ``avren`` and ``bvren`` GPIOs may be provided to control the rail A
> > +and rail B hardware enable pins. If regulator support is enabled, the rails are
> > +also registered through the PMBus regulator framework.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +The following attributes are supported. Limits, alarms, and per-phase entries
> > +are exposed depending on device capabilities, rail configuration, and detected
> > +phase count.
> > +
> > +=========================== ================================================
> > +in1_label                   "vin"
> > +in1_input                   Measured input voltage
> > +in1_alarm                   Input voltage alarm
> > +in[2-3]_label               "vout[1-2]"
> > +in[2-3]_input               Measured output voltage
> > +in[2-3]_alarm               Output voltage alarm
> > +in[2-3]_high_speed_en       Enable high-speed voltage-control interface
> > +in_high_speed_bus           Active high-speed voltage-control interface
> > +currX_label                 "iinN", "iinN.P", "ioutN", or "ioutN.P"
> > +currX_input                 Measured input/output current
> > +currX_alarm                 Current alarm
> > +powerX_label                "pinN" or "poutN"
> > +powerX_input                Measured input/output power
> > +temp[1-2]_input             Measured temperature
> > +temp[1-2]_alarm             Temperature alarm
> > +=========================== ================================================
> > +
> > +Notes
> > +-----
> > +
> > +``N`` is the rail number, starting at 1. ``P`` is the phase number, starting at
> > +0. The exact ``currX`` indices depend on the number of present rails and on the
> > +detected phase count.
> > +
> > +``in[2-3]_high_speed_en`` is a per-rail read/write attribute matching the
> > +standard hwmon voltage channels for the output rails. ``in2_high_speed_en``
> > +controls rail A / ``vout1``. ``in3_high_speed_en`` controls rail B / ``vout2``
> > +and is only present if rail B is detected. Writing 1 selects the high-speed
> > +voltage-control interface for that rail; writing 0 selects PMBus voltage
> > +control.
> > +
> > +``in_high_speed_bus`` is a read-only attribute reporting the high-speed
> > +interface used by the device, for example ``Nvidia PWMVID``, ``Intel SVID``,
> > +``AMD SVI3``, or ``AVSBus``.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fe8808f3ee4c..8518d55800e9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15843,6 +15843,8 @@ L:	linux-hwmon@vger.kernel.org
> >   S:	Supported
> >   W:	https://ez.analog.com/linux-software-drivers
> >   F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
> > +F:	Documentation/hwmon/max20826.rst
> > +F:	drivers/hwmon/pmbus/max20826.c
> >   MAX20830 HARDWARE MONITOR DRIVER
> >   M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index c8cda160b5f8..8d3568f7347d 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -393,6 +393,25 @@ config SENSORS_MAX20751
> >   	  This driver can also be built as a module. If so, the module will
> >   	  be called max20751.
> > +config SENSORS_MAX20826
> > +	tristate "Analog Devices MAX20826 and similar devices"
> > +	help
> > +	  If you say yes here you get hardware monitoring support for Analog
> > +	  Devices MAX20826 and similar devices.
> > +
> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called max20826.
> > +
> > +config SENSORS_MAX20826_REGULATOR
> > +	bool "Regulator support for Analog Devices MAX20826 and similar devices"
> > +	depends on SENSORS_MAX20826 && REGULATOR
> > +	help
> > +	  If you say yes here you get regulator support for Analog Devices
> > +	  MAX20826 and similar sensors.
> > +
> > +	  This enables the MAX20826 to be used as a regulator device,
> > +	  providing voltage control through the regulator framework.
> > +
> >   config SENSORS_MAX20830
> >   	tristate "Analog Devices MAX20830"
> >   	help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> > index ffc05f493213..15601443470b 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -38,6 +38,7 @@ obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
> >   obj-$(CONFIG_SENSORS_MAX17616)	+= max17616.o
> >   obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
> >   obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
> > +obj-$(CONFIG_SENSORS_MAX20826)	+= max20826.o
> >   obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
> >   obj-$(CONFIG_SENSORS_MAX20860A)	+= max20860a.o
> >   obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
> > diff --git a/drivers/hwmon/pmbus/max20826.c b/drivers/hwmon/pmbus/max20826.c
> > new file mode 100644
> > index 000000000000..1b481cdd8c93
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/max20826.c
> > @@ -0,0 +1,1037 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Hardware monitoring driver for Analog Devices MAX20826 PMBus device
> > + *
> > + * Copyright 2026 Analog Devices Inc.
> > + */
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/pmbus.h>
> > +#include <linux/property.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/slab.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +#include <linux/unaligned.h>
> > +
> > +#include "pmbus.h"
> > +
> > +#define MAX20826_REG_RAIL_PHASE_CFG	0xB1
> > +#define MAX20826_REG_CTRL_MISC		0xCB
> > +#define MAX20826_OPL_EN_MSK		BIT(7)
> > +
> > +#define MAX20826_REG_VOUT_RES		0xDB
> > +#define MAX20826_VOUT_RES_MSK		BIT(7)
> > +
> > +#define MAX20855B_REG_VOUT_VRM		0xD1
> > +#define MAX20855B_REG_VOUT_VRM_MASK	BIT(4)
> > +
> > +#define MAX20826_REG_C_MODEAB		0xDC
> > +/* Byte 1 bits 7 and 6*/
> > +#define MAX20826_C_MODEAB_MASK		GENMASK(15, 14)
> > +
> > +#define MAX20826_REG_ADDR_MODE		0xEC
> > +#define MAX20826_PAGE_MODE_MSK		BIT(7)
> > +#define MAX20826_DIRECT_ADDR_MSK	GENMASK(6, 0)
> > +
> > +#define MAX20826_REG_OVERRIDE		0xED
> > +#define MAX20826_OVERRIDE_MASK		BIT(7)
> > +
> > +#define MAX20826_REG_PHASE_DETECT	0xF3
> > +#define MAX20826_REG_PHASE_READ		0xF4
> > +
> > +#define MAX20826_REG_STATUS_MON		0xF9
> > +#define MAX20826_PHASES_NUM_MASK	GENMASK(7, 3)
> > +
> > +#define MAX20826_MAX_PAGES		2
> > +#define MAX20826_MAX_PHASES		16
> > +#define MAX20826_PHASES_PER_PAGE	8
> > +#define MAX20826_INTF_PWMVID		1
> > +#define MAX20826_INTF_AVSBUS		3
> > +
> > +#define MAX20855B_PHASES_NUM_MASK	GENMASK(7, 4)
> > +#define MAX20855B_MAX_PHASES		8
> > +#define MAX20908_MAX_PHASES		8
> > +#define MAX20912_MAX_PHASES		12
> > +#define MAX20916_MAX_PHASES		16
> > +
> > +struct max20826_chip_info {
> > +	const char *vendor_bus_name;
> > +	u8 max_phases;
> > +	unsigned int phase_num_mask;
> > +	u8 start_index_iin;
> > +	u8 start_index_iout;
> > +	bool is_reg_addr_mode_block;
> > +	bool is_vout_direct;
> > +	bool select_vrm;
> > +	bool has_avsbus;
> > +	bool has_opl;
> > +	u8 (*count_phases)(const u8 *config, int page);
> > +};
> > +
> > +struct max20826 {
> > +	const struct max20826_chip_info *chip_info;
> > +	struct pmbus_driver_info info;
> > +	struct i2c_client *client;
> > +	/* RAIL-B direct mode */
> > +	struct i2c_client *client_b;
> > +	struct i2c_client *curr_client;
> > +	struct gpio_desc *avren;
> > +	struct gpio_desc *bvren;
> > +	bool vendor_bus;
> > +	bool high_speed[MAX20826_MAX_PAGES];
> > +	bool on_off_ctrl[MAX20826_MAX_PAGES];
> > +	bool opl_enabled[MAX20826_MAX_PAGES];
> > +};
> > +
> > +static u8 __max20826_count_phases(const u8 *config, int page)
> > +{
> > +	if (page)
> > +		return hweight8(config[4]);
> > +
> > +	return hweight8(config[0]) + hweight8(config[1]) -
> > +	       hweight8(config[4]);
> > +}
> > +
> > +static u8 __max20855b_count_phases(const u8 *config, int page)
> > +{
> > +	if (page)
> > +		return hweight8(config[3] & 0x3F);
> > +
> > +	return hweight8(config[0]) + hweight8(config[1] & 0x0F) -
> > +	       hweight8(config[3] & 0x3F);
> > +}
> > +
> > +static u8 __max20908_count_phases(const u8 *config, int page)
> > +{
> > +	if (page)
> > +		return hweight8(config[4]);
> > +
> > +	return hweight8(config[0]) + hweight8(config[1] & 0xF0) -
> > +	       hweight8(config[4]);
> > +}
> > +
> > +static u8 __max20912_count_phases(const u8 *config, int page)
> > +{
> > +	if (page)
> > +		return hweight8(config[4]);
> > +
> > +	return hweight8(config[0]) + hweight8(config[1] & 0xFC) -
> > +	       hweight8(config[4]);
> > +}
> > +
> > +#define to_max20826(p)	container_of(p, struct max20826, info)
> > +
> > +enum {
> > +	RAIL_A,
> > +	RAIL_B,
> > +};
> > +
> > +static const struct regulator_desc __maybe_unused max20826_reg_desc[] = {
> > +	PMBUS_REGULATOR("vout", 0),
> > +	PMBUS_REGULATOR("vout", 1),
> > +};
> > +
> > +static struct i2c_client *max20826_select_rail(struct max20826 *st,
> > +					       int page, bool probing)
> > +{
> > +	int ret;
> > +
> > +	/*
> > +	 * If in direct mode and we want RAIL_B (page 1) just return client_b.
> > +	 * Otherwise, set the proper page (if page mode) and return RAIL_A.
> > +	 */
> > +	if (st->client_b) {
> > +		/* if 0xff just return the last client */
> > +		if (page < 0)
> > +			return st->curr_client;
> > +		if (page)
> > +			st->curr_client = st->client_b;
> > +		else
> > +			st->curr_client = st->client;
> > +
> > +		return st->curr_client;
> > +	}
> > +
> > +	if (!probing)
> > +		ret = pmbus_set_page(st->client, page, 0xff);
> > +	else
> > +		ret = i2c_smbus_write_byte_data(st->client, PMBUS_PAGE, page);
> > +	if (ret < 0)
> > +		return ERR_PTR(ret);
> > +
> > +	return st->client;
> > +}
> > +
> > +static int max20826_update_byte_data_unsafe(const struct i2c_client *client,
> > +					    int reg, u8 mask, u8 value)
> > +{
> > +	int ret;
> > +
> > +	ret = i2c_smbus_read_byte_data(client, reg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	value = (ret & ~mask) | (value & mask);
> > +
> > +	return i2c_smbus_write_byte_data(client, reg, value);
> > +}
> 
> Why not use pmbus_update_byte_data() ?

Good question! I think the main reason at the time was
max20826_high_speed_en_store(). But now that I look at it again, not
really seeing any reason why I can't use pmbus_update_byte_data().

> 
> > +
> > +static int max20826_read_block_data_unsafe(const struct i2c_client *client,
> > +					   int reg, u8 *block, u8 size)
> > +{
> > +	u8 block_data[I2C_SMBUS_BLOCK_MAX];
> > +	int ret;
> > +
> > +	ret = i2c_smbus_read_i2c_block_data(client, reg, size + 1,
> > +					    block_data);
> 
> size can be up to I2C_SMBUS_BLOCK_MAX (32). With that, the above code
> reads up to 33 bytes, which would exceed the size of block_data[].
> 
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret < size + 1)
> > +		return -EIO;
> 
> No, this is wrong. The function needs to return the length of the returned data,
> which can be up to <size> and does not have to be an exact match.
> 
> > +
> > +	/* byte 0 comes with the block length, discard it */
> > +	memcpy(block, block_data + 1, size);
> > +	return size;
> 
> This is expected to return the actual data size, i.e., the value
> in block_data[0].

I see and in theory I think it was returning the actual data size even
though with the above code block_data[0] would be size + 1. Anyways, all
of the above will go away with the new helper.

> > +}
> > +
> > +static int __max20826_read_block_data(struct max20826 *st, int page,
> > +				      int reg, u8 *block, u8 size)
> > +{
> > +	struct i2c_client *rail;
> > +
> > +	rail = max20826_select_rail(st, page, false);
> > +	if (IS_ERR(rail))
> > +		return PTR_ERR(rail);
> > +
> > +	return max20826_read_block_data_unsafe(rail, reg, block, size);
> > +}
> > +
> > +static int __max20826_read_byte_data(struct max20826 *st, int page, int reg)
> > +{
> > +	struct i2c_client *rail;
> > +
> > +	rail = max20826_select_rail(st, page, false);
> > +	if (IS_ERR(rail))
> > +		return PTR_ERR(rail);
> > +
> > +	return i2c_smbus_read_byte_data(rail, reg);
> > +}
> > +
> > +static int __max20826_write_byte_data(struct max20826 *st, int page, int reg,
> > +				      u8 value)
> > +{
> > +	struct i2c_client *rail;
> > +
> > +	rail = max20826_select_rail(st, page, false);
> > +	if (IS_ERR(rail))
> > +		return PTR_ERR(rail);
> > +
> > +	return i2c_smbus_write_byte_data(rail, reg, value);
> > +}
> > +
> > +static int __max20826_read_word_data(struct max20826 *st, int page, int reg)
> > +{
> > +	struct i2c_client *rail;
> > +
> > +	rail = max20826_select_rail(st, page, false);
> > +	if (IS_ERR(rail))
> > +		return PTR_ERR(rail);
> > +
> > +	return i2c_smbus_read_word_data(rail, reg);
> > +}
> > +
> > +static ssize_t max20826_high_speed_en_show(struct device *dev,
> > +					   struct device_attribute *devattr,
> > +					   char *buf)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > +	unsigned int page = to_sensor_dev_attr(devattr)->index;
> > +	struct max20826 *st = to_max20826(info);
> > +
> > +	return sysfs_emit(buf, "%u\n", st->high_speed[page]);
> > +}
> > +
> > +static ssize_t max20826_high_speed_en_store(struct device *dev,
> > +					    struct device_attribute *devattr,
> > +					    const char *buf, size_t count)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > +	unsigned int page = to_sensor_dev_attr(devattr)->index;
> > +	struct max20826 *st = to_max20826(info);
> > +	struct i2c_client *rail;
> > +	bool high_speed;
> > +	int ret;
> > +
> > +	ret = kstrtobool(buf, &high_speed);
> > +	if (ret)
> > +		return ret;
> > +
> > +	guard(pmbus_lock)(client);
> > +
> > +	rail = max20826_select_rail(st, page, false);
> > +	if (IS_ERR(rail))
> > +		return PTR_ERR(rail);
> > +
> > +	if (!high_speed) {
> > +		if (!st->vendor_bus && st->chip_info->has_avsbus) {
> > +			ret = max20826_update_byte_data_unsafe(rail,
> > +							       PMBUS_OPERATION,
> > +							       PB_OPERATION_CONTROL_V_SRC, 0);
> > +			if (ret)
> > +				return ret;
> > +
> > +			goto out_success;
> > +		}
> > +
> > +		ret = max20826_update_byte_data_unsafe(rail,
> > +						       MAX20826_REG_OVERRIDE,
> > +						       MAX20826_OVERRIDE_MASK,
> > +						       FIELD_PREP(MAX20826_OVERRIDE_MASK, 1));
> > +		if (ret)
> > +			return ret;
> > +
> > +		goto out_success;
> > +	}
> > +
> > +	if (!st->vendor_bus) {
> > +		ret = max20826_update_byte_data_unsafe(rail, PMBUS_OPERATION,
> > +						       PB_OPERATION_CONTROL_V_SRC,
> > +						       FIELD_PREP(PB_OPERATION_CONTROL_V_SRC, 3));
> > +		if (ret)
> > +			return ret;
> > +
> > +		goto out_success;
> > +	}
> > +
> > +	ret = max20826_update_byte_data_unsafe(rail, MAX20826_REG_OVERRIDE,
> > +					       MAX20826_OVERRIDE_MASK, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +out_success:
> > +	st->high_speed[page] = high_speed;
> > +	return count;
> > +}
> > +
> > +static ssize_t max20826_high_speed_bus_show(struct device *dev,
> > +					    struct device_attribute *devattr,
> > +					    char *buf)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > +	struct max20826 *st = to_max20826(info);
> > +
> > +	if (st->vendor_bus)
> > +		return sysfs_emit(buf, "%s\n", st->chip_info->vendor_bus_name);
> > +
> > +	return sysfs_emit(buf, "AVSBus\n");
> > +}
> > +
> > +static SENSOR_DEVICE_ATTR_RW(in2_high_speed_en, max20826_high_speed_en, 0);
> > +static SENSOR_DEVICE_ATTR_RW(in3_high_speed_en, max20826_high_speed_en, 1);
> > +static SENSOR_DEVICE_ATTR_RO(in_high_speed_bus, max20826_high_speed_bus, 0);
> 
> Those don't look like the values should or would be changed on the fly.
> Should that be devicetree properties ?
>

Devicetree makes it easier to handle but let me ask around to people who knows
better about these chips usecases.

- Nuno Sá

