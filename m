Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD82EA172
	for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 04:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941244; cv=none; b=uJl+mTWPmLZ27X/8z2p9UdKSI8Sq24FrXi8RhriZ+BNY5df00mBjJ34gr7PCRso7ueRXmsfOkXd6cQAbGgAUPZPdpEeAZLdEiUFnxzGkNSKDg1ZcYQuseSl0kXkBgrE7PCHZnlGp3ywtvpyFz71zbufaR2362VuGvTYKdESH+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941244; c=relaxed/simple;
	bh=sWvnGaaon8yLiBmBHeliFNiCfz+ssMla0bpe3tbhp3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfR7zRzD9VknDulWDq6CWmzeJpdobLE4kCeRHUkxxUlOslXJD4dbg8KxPVc7t/Vze16zeJqdkCoAGbSYA+3318rbus3K6pm6KWhNqdiGFdQtjkgwowh59SqVbJbMGOhOPWwvza91knBRZ8ZO8GURdjk4+nAJ4nXcwPY5Sxdbjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtP6ej2W; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtP6ej2W"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bc763e2ba8so62957145ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 21:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779941242; x=1780546042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7tbT2QGB8W4oXWP7ioiHUgmg8UkuQiJB9BdtGDp0eI=;
        b=YtP6ej2WGHPPHFe6xtEcOnDEFkMcs55TzjzcNPGJDcTYLlvFtA054ZitLdzO/JKbr+
         ZEp2j8L+1uA7pLWj4TpfMfWWC5pnQ1a+y27cdRyaxTMvEuPLncX0NSbRR9uIF1hixHbV
         2eAPBYKvl0Kcsr9nRbYlu5CqVi6nXOghB9o7r5P2fYdPzqf8FGLUlj6TzTXdDmPliU5k
         eIG+b8O2+4Eiv9jW+f276fIPQjAWWisTk0mHb7S2AB63vO5CPPPWjf7nLtODBgQUnIXb
         DO/t7OEPxDBQHqdC3OQy7AbeRs4aX2r7zThJyMqrSsDqQvEUDPPA2AkvUj+2Yjq/BZpS
         iHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779941242; x=1780546042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a7tbT2QGB8W4oXWP7ioiHUgmg8UkuQiJB9BdtGDp0eI=;
        b=U7t6EzNhHX/fLMsxIuZPtnLdBFUTzK1tDFKoPytDiZqzzhHNiQGmPoiUM0R4kLI1Q4
         lUl5nQ5hhARa0CECAR+Tu5cGqjjo7L7wz1M/13rmjlwTf3HwMS//LwiXdh6TStLaJ61e
         xMzjJB+m676ijXV8HsmjbTShUpoJXBP3374fLPSfWWjFrI2M6bHQ8MqLq0KKe2fws4HZ
         jpPIHOI/RZlS0nvqQV2g/RhIBeHg2pdmyr0An1Z4OLiKWft4AsHqSwRI6OnZRRG56uYJ
         X+fF0GFy1MOgSfR6HR2uAo6jw8RByBMq882mxhy1YySaxEiVawTZCACLI3zuSL1M4nzX
         qYlQ==
X-Gm-Message-State: AOJu0Ywdcwu1hLm4NDDAGaeF5cjHfmQD0GFzd0vaD5WBqJUEygDPSL61
	OQ4rc4Xowo6nOcFTveXVRloaGKV/JclRpzRaV+JQZEn0OG38jDhtvI2s
X-Gm-Gg: Acq92OGqzHbg8ONJqcAh9YQm3hVCo+XogfWUU+U1TiW6UF8MYUzaUp3W3OJUr8x4I3U
	VVb2Y8iKgFC3TeXXFZn/zAi6bAiBqUPIixSDr6irpLnRgBvge3ZMOcYi3LCrmZGChGeVMdK+OcY
	gmVkVnAtBYKxW2V2pjW8gIw4Eu64JU0J9AKkoH7UNWWOi6isc3orOkFB5WA5cxopV7j5VhuWKj7
	IRJVWdX45zHU7aBiVXII6OsjArHVvD3is+UOJvdatoD/cdYZrN1STdHTPFO/mHhZeRRl1RZDUGm
	xTVi0JtgNhMbireZmoEJMmoSGCX7tid26oTFYAEKus7zBLwPGvyLW7EtW7NDZvgUIsocmZ4gup3
	Z+4SvdoViMyyae7TMfSO9fY+/z+grNVW79W5kuRUmDCllbFmcZ0EQwwMf/RTNmODn17FGFGMvBn
	ClSNx1m8p0c/50OXtzCWfYXNRTNp+DNU4Esag1zDEg6to28MM=
X-Received: by 2002:a17:902:ef10:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2beb069c65fmr289612405ad.5.1779941241622;
        Wed, 27 May 2026 21:07:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm158007465ad.74.2026.05.27.21.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:07:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 May 2026 21:07:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>
References: <20260527-earring-bully-eb4a268c2e68@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-earring-bully-eb4a268c2e68@spud>

On Wed, May 27, 2026 at 10:06:11AM +0100, Conor Dooley wrote:
> From: Lars Randers <lranders@mail.dk>
> 
> Add a driver for the temperature and voltage sensors on PolarFire SoC.
> The temperature reports how hot the die is, and the voltages are the
> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> 
> The hardware supports alarms in theory, but there is an unconfirmed
> erratum that prevents clearing them once triggered, so no support is
> added.
> 
> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
> the remainder holds the voltage as a fixed point integer value. It's
> improbable that the hardware will work if the voltages are negative, so
> the driver ignores the sign bits.
> 
> There's no dt support etc here because this is the child of a simple-mfd
> syscon.
> 
> Signed-off-by: Lars Randers <lranders@mail.dk>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Guenter, there's one question here about the unit that update_interval
> is in, I didn't see anyone else using us, but I assume that's okay since
> the resolution that ms would give would be 8 steps only?
> RFC cos the question is also in the driver as a comment.
> 

That just came up in a different context. We'll add a new standard attribute
update_interval_us. The existing attribute MUST use ms. Everything else
would be an ABI violation.

Guenter

> CC: Guenter Roeck <linux@roeck-us.net>
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Shuah Khan <skhan@linuxfoundation.org>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: linux-hwmon@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: Valentina.FernandezAlanis@microchip.com
> ---
>  Documentation/hwmon/index.rst    |   1 +
>  Documentation/hwmon/tvs-mpfs.rst |  53 +++++
>  MAINTAINERS                      |   1 +
>  drivers/hwmon/Kconfig            |  12 +
>  drivers/hwmon/Makefile           |   1 +
>  drivers/hwmon/tvs-mpfs.c         | 396 +++++++++++++++++++++++++++++++
>  6 files changed, 464 insertions(+)
>  create mode 100644 Documentation/hwmon/tvs-mpfs.rst
>  create mode 100644 drivers/hwmon/tvs-mpfs.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8b655e5d6b68..84a5339e1d6f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -262,6 +262,7 @@ Hardware Monitoring Kernel Drivers
>     tps53679
>     tps546d24
>     tsc1641
> +   tvs-mpfs
>     twl4030-madc-hwmon
>     ucd9000
>     ucd9200
> diff --git a/Documentation/hwmon/tvs-mpfs.rst b/Documentation/hwmon/tvs-mpfs.rst
> new file mode 100644
> index 000000000000..39889c06ef0c
> --- /dev/null
> +++ b/Documentation/hwmon/tvs-mpfs.rst
> @@ -0,0 +1,53 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver tvs-mpfs
> +======================
> +
> +Supported chips:
> +
> +  * PolarFire SoC
> +
> +Authors:
> +
> +   - Conor Dooley <conor.dooley@microchip.com>
> +   - Lars Randers <lranders@mail.dk>
> +
> +Description
> +-----------
> +
> +This driver implements support for the temperature and voltage sensors on
> +PolarFire SoC. The temperature reports how hot the die is, and the voltages are
> +the SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> +
> +
> +Usage Notes
> +-----------
> +
> +update_interval is in microseconds, with a permitted range of 0 to 8128.
> +
> +Temperatures are read in millidegrees Celsius, but the hardware measures in
> +degrees Kelvin, storing the result as 11.4 fixed point data, for a maximum
> +value of 2047.9375 degrees Kelvin.
> +
> +Voltages are read in millivolts. The hardware measures in millivolts, storing
> +the value as 12.3 fixed point data, for a maximum of 4095.875 millivolts.
> +The minimum value reportable by the driver is 0 volts, although the hardware
> +is capable of measuring negative values.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported. update_interval is read-write, as are
> +the enables. All other attributes are read only.
> +
> +======================= ====================================================
> +temp1_label		Fixed name for channel.
> +temp1_input		Measured temperature for channel.
> +temp1_enable		Enable/disable for channel.
> +
> +in[0-2]_label		Fixed name for channel.
> +in[0-2]_input		Measured voltage for channel.
> +in[0-2]_enable		Enable/disable for channel.
> +
> +update_interval		The interval at which the chip will update readings.
> +======================= ====================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..a492cf5ad0fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22938,6 +22938,7 @@ F:	drivers/char/hw_random/mpfs-rng.c
>  F:	drivers/clk/microchip/clk-mpfs*.c
>  F:	drivers/firmware/microchip/mpfs-auto-update.c
>  F:	drivers/gpio/gpio-mpfs.c
> +F:	drivers/hwmon/tvs-mpfs.c
>  F:	drivers/i2c/busses/i2c-microchip-corei2c.c
>  F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/pci/controller/plda/pcie-microchip-host.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 14e4cea48acc..194c8116fd01 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -930,6 +930,18 @@ config SENSORS_JC42
>  	  This driver can also be built as a module. If so, the module
>  	  will be called jc42.
>  
> +config SENSORS_POLARFIRE_SOC_TVS
> +	tristate "PolarFire SoC (MPFS) temperature and voltage sensor"
> +	depends on POLARFIRE_SOC_MAILBOX
> +	help
> +	  This driver adds support for the PolarFire SoC (MPFS) Temperature and
> +	  Voltage Sensor.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called tvs-mpfs.
> +
> +	  If unsure, say N.
> +
>  config SENSORS_POWERZ
>  	tristate "ChargerLAB POWER-Z USB-C tester"
>  	depends on USB
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 4788996aa137..b58d249e4cf4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -194,6 +194,7 @@ obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
>  obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
>  obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
>  obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
> +obj-$(CONFIG_SENSORS_POLARFIRE_SOC_TVS)  += tvs-mpfs.o
>  obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
>  obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>  obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
> diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> new file mode 100644
> index 000000000000..30d7baa808c4
> --- /dev/null
> +++ b/drivers/hwmon/tvs-mpfs.c
> @@ -0,0 +1,396 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Author: Lars Randers <lranders@mail.dk>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/err.h>
> +#include <linux/freezer.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/kthread.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MPFS_TVS_CTRL 0x08
> +#define MPFS_TVS_OUTPUT0 0x24
> +#define MPFS_TVS_OUTPUT1 0x28
> +
> +#define MPFS_TVS_CTRL_TEMP_VALID	BIT(19)
> +#define MPFS_TVS_CTRL_V2P5_VALID	BIT(18)
> +#define MPFS_TVS_CTRL_V1P8_VALID	BIT(17)
> +#define MPFS_TVS_CTRL_V1P05_VALID	BIT(16)
> +
> +#define MPFS_TVS_CTRL_TEMP_ENABLE	BIT(3)
> +#define MPFS_TVS_CTRL_V2P5_ENABLE	BIT(2)
> +#define MPFS_TVS_CTRL_V1P8_ENABLE	BIT(1)
> +#define MPFS_TVS_CTRL_V1P05_ENABLE	BIT(0)
> +#define MPFS_TVS_CTRL_ENABLE_ALL	GENMASK(3, 0)
> +
> +/*
> + * For all of these the value in millivolts is stored in 16 bits, with an upper
> + * sign bit and a lower 2 bits of decimal. These masks discard the sign bit and
> + * decimal places, because if Linux is running these voltages cannot be negative
> + * and so avoid having to convert to two's complement.
> + */
> +#define MPFS_OUTPUT0_V1P8_MASK	GENMASK(30, 19)
> +#define MPFS_OUTPUT0_V1P05_MASK	GENMASK(14, 3)
> +#define MPFS_OUTPUT1_V2P5_MASK	GENMASK(14, 3)
> +
> +/*
> + * The register map claims that the temperature is stored in bits 31:16, but
> + * application note "AN4682: PolarFire FPGA Temperature and Voltage Sensor"
> + * says that 31 is reserved. Temperature is in kelvin, so what's probably a
> + * sign bit has no value anyway.
> + */
> +#define MPFS_OUTPUT1_TEMP_MASK GENMASK(30, 16)
> +
> +#define MPFS_TVS_INTERVAL_MASK GENMASK(15, 8)
> +#define MPFS_TVS_INTERVAL_OFFSET 8
> +/* The interval register is in increments of 32 us */
> +#define MPFS_TVS_INTERVAL_SCALE 32
> +
> +/* 273.5 in 11.4 fixed-point notation */
> +#define MPFS_TVS_K_TO_C 0x1112
> +
> +enum mpfs_tvs_sensors {
> +	SENSOR_V1P05 = 0,
> +	SENSOR_V1P8,
> +	SENSOR_V2P5,
> +};
> +
> +static const char * const mpfs_tvs_voltage_labels[] = { "1P05", "1P8", "2P5" };
> +
> +struct mpfs_tvs {
> +	struct regmap *regmap;
> +};
> +
> +static int mpfs_tvs_voltage_read(struct mpfs_tvs *data, u32 attr,
> +				 int channel, long *val)
> +{
> +	u32 tmp, control;
> +
> +	if (attr != hwmon_in_input && attr != hwmon_in_enable)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);
> +
> +	switch (channel) {
> +	case SENSOR_V2P5:
> +		if (attr == hwmon_in_enable) {
> +			*val = FIELD_GET(MPFS_TVS_CTRL_V2P5_ENABLE, control);
> +			break;
> +		}
> +
> +		if (!(control & MPFS_TVS_CTRL_V2P5_VALID))
> +			return -EINVAL;
> +
> +		regmap_read(data->regmap, MPFS_TVS_OUTPUT1, &tmp);
> +		*val = FIELD_GET(MPFS_OUTPUT1_V2P5_MASK, tmp);
> +		break;
> +	case SENSOR_V1P8:
> +		if (attr == hwmon_in_enable) {
> +			*val = FIELD_GET(MPFS_TVS_CTRL_V1P8_ENABLE, control);
> +			break;
> +		}
> +
> +		if (!(control & MPFS_TVS_CTRL_V1P8_VALID))
> +			return -EINVAL;
> +
> +		regmap_read(data->regmap, MPFS_TVS_OUTPUT0, &tmp);
> +		*val = FIELD_GET(MPFS_OUTPUT0_V1P8_MASK, tmp);
> +		break;
> +	case SENSOR_V1P05:
> +		if (attr == hwmon_in_enable) {
> +			*val = FIELD_GET(MPFS_TVS_CTRL_V1P05_ENABLE, control);
> +			break;
> +		}
> +
> +		if (!(control & MPFS_TVS_CTRL_V1P05_VALID))
> +			return -EINVAL;
> +
> +		regmap_read(data->regmap, MPFS_TVS_OUTPUT0, &tmp);
> +		*val = FIELD_GET(MPFS_OUTPUT0_V1P05_MASK, tmp);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_voltage_write(struct mpfs_tvs *data, u32 attr,
> +				  int channel, long val)
> +{
> +	u32 tmp;
> +
> +	if (attr != hwmon_in_enable)
> +		return -EOPNOTSUPP;
> +
> +	switch (channel) {
> +	case SENSOR_V2P5:
> +		if (val > 1)
> +			return -EINVAL;
> +
> +		tmp = FIELD_PREP(MPFS_TVS_CTRL_V2P5_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V2P5_ENABLE, tmp);
> +		break;
> +	case SENSOR_V1P8:
> +		if (val > 1)
> +			return -EINVAL;
> +
> +		tmp = FIELD_PREP(MPFS_TVS_CTRL_V1P8_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V1P8_ENABLE, tmp);
> +		break;
> +	case SENSOR_V1P05:
> +		if (val > 1)
> +			return -EINVAL;
> +
> +		tmp = FIELD_PREP(MPFS_TVS_CTRL_V1P05_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V1P05_ENABLE, tmp);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_temp_read(struct mpfs_tvs *data, u32 attr, long *val)
> +{
> +	u32 tmp, control;
> +
> +	if (attr != hwmon_temp_input && attr != hwmon_temp_enable)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &control);
> +
> +	if (attr == hwmon_temp_enable) {
> +		*val = FIELD_GET(MPFS_TVS_CTRL_TEMP_ENABLE, control);
> +		return 0;
> +	}
> +
> +	if (!(control & MPFS_TVS_CTRL_TEMP_VALID))
> +		return -EINVAL;
> +
> +	regmap_read(data->regmap, MPFS_TVS_OUTPUT1, &tmp);
> +	*val = FIELD_GET(MPFS_OUTPUT1_TEMP_MASK, tmp);
> +	*val -= MPFS_TVS_K_TO_C;
> +	*val = (1000 * *val) >> 4; /* fixed point (11.4) to millidegrees */
> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_temp_write(struct mpfs_tvs *data, u32 attr, long val)
> +{
> +	u32 tmp;
> +
> +	if (attr != hwmon_temp_enable)
> +		return -EOPNOTSUPP;
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	tmp = FIELD_PREP(MPFS_TVS_CTRL_TEMP_ENABLE, val);
> +	regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +			   MPFS_TVS_CTRL_TEMP_ENABLE, tmp);
> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, long *val)
> +{
> +	u32 tmp;
> +
> +	if (attr != hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> +	//TODO: Guenter, update_interval, as implemented here, expects values
> +	//in microseconds. Is that okay? Most drivers (all that I checked tbh)
> +	//use milliseconds, but this is an 8-bit value so using ms will have
> +	//almost no granularity at all.
> +	*val = FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp) * MPFS_TVS_INTERVAL_SCALE;
> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, long val)
> +{
> +	unsigned long temp = val;
> +
> +	if (attr != hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	temp /= MPFS_TVS_INTERVAL_SCALE;
> +
> +	/*
> +	 * The value is 8 bits wide, but 255 is described as
> +	 * "255= Do single set of transfers when scoverride set"
> +	 * but there's no scoverride bit in the tvs register region.
> +	 * Ban using 255 since its behaviour is suspect.
> +	 */
> +	if (temp > 254)
> +		return -EINVAL;
> +
> +	temp <<= MPFS_TVS_INTERVAL_OFFSET;
> +	regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +			   MPFS_TVS_INTERVAL_MASK, temp);
> +
> +	return 0;
> +}
> +
> +
> +static umode_t mpfs_tvs_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
> +		return 0644;
> +
> +	if (type == hwmon_temp) {
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			return 0644;
> +		case hwmon_temp_input:
> +		case hwmon_temp_label:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	}
> +
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_enable:
> +			return 0644;
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpfs_tvs_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct mpfs_tvs *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		return mpfs_tvs_temp_read(data, attr, val);
> +	case hwmon_in:
> +		return mpfs_tvs_voltage_read(data, attr, channel, val);
> +	case hwmon_chip:
> +		return mpfs_tvs_interval_read(data, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int mpfs_tvs_write(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long val)
> +{
> +	struct mpfs_tvs *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		return mpfs_tvs_temp_write(data, attr, val);
> +	case hwmon_in:
> +		return mpfs_tvs_voltage_write(data, attr, channel, val);
> +	case hwmon_chip:
> +		return mpfs_tvs_interval_write(data, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int mpfs_tvs_read_labels(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel,
> +				const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		*str = "Die Temp";
> +		return 0;
> +	case hwmon_in:
> +		*str = mpfs_tvs_voltage_labels[channel];
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops mpfs_tvs_ops = {
> +	.is_visible = mpfs_tvs_is_visible,
> +	.read_string = mpfs_tvs_read_labels,
> +	.read = mpfs_tvs_read,
> +	.write = mpfs_tvs_write,
> +};
> +
> +static const struct hwmon_channel_info *mpfs_tvs_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ENABLE),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_ENABLE,
> +			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_ENABLE,
> +			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info mpfs_tvs_chip_info = {
> +	.ops = &mpfs_tvs_ops,
> +	.info = mpfs_tvs_info,
> +};
> +
> +static int mpfs_tvs_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct mpfs_tvs *data;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
> +				     "Failed to find syscon regmap\n");
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "mpfs_tvs",
> +							 data,
> +							 &mpfs_tvs_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
> +				     "hwmon device registration failed.\n");
> +
> +	regmap_write(data->regmap, MPFS_TVS_CTRL, MPFS_TVS_CTRL_ENABLE_ALL);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mpfs_tvs_driver = {
> +	.probe = mpfs_tvs_probe,
> +	.driver = {
> +		.name = "mpfs-tvs",
> +	},
> +};
> +module_platform_driver(mpfs_tvs_driver);
> +
> +MODULE_AUTHOR("Lars Randers <lranders@mail.dk>");
> +MODULE_DESCRIPTION("PolarFire SoC temperature & voltage sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.53.0
> 
> 
