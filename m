Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74835199234
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Nov 2025 03:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763782517; cv=none; b=jMpGH90++oz6B3sczM1G2+uKBRM3n870ERy8bYgtAB85fybqmaSjC3SKXwoYhFy8DsO4hHBYo6YhSbPpytJw3OJXvNfQ09tgmGyQdWNfo9kdAFz/UjU6OcOl0Vv9Xs08gEbsO0+yI6RNcVV+OBk6tY8XBvC2cqegSuoolkXmx1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763782517; c=relaxed/simple;
	bh=Twrm15XX+Ea+eTxTox0SmbDBX54q334Cjk20qfiSmOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPEKF8kfzDI8KODiMbL4J3p7GuGOAm2D2zenV5zkDKkm+4iqr9Z2WwQIn9IieifGpuTEjImORYoAOMytCPpFBUOOT6+DtRWVBvU+F17DvcneL5YgwX48gL71Ayidv3otWwvXnuYUiB5SLGuyUVMoJuC2T0r6puw+j20J57kLhRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghPL3FYs; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghPL3FYs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-298250d7769so20031115ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 19:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763782510; x=1764387310; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PntoKZBSq6UJxBNBo1SBKJbLUG/UOz6qfm3VlE0JmTA=;
        b=ghPL3FYs5FOhiuKJdolN/eawU2/bMgH8rHCXbltEn38daLgJOeLCs/xykLFyuFnh7W
         hiYQ/sp525ygM9KDD+7ie9IBdT0Np5FEg0q0aBMVp10lWldHAxAHXEJfGIAhTOn0Xod4
         TuuQ0AnV0lroFrI5oGbIP7FCxCV1CeWibAeava9PPJwCPhB4VvTwIQkv22aErhE55lml
         3VSxZY8Kq67tWDikj2LtQddccooiEd9RsutfoXg6hA0GNnjVHIbWX/p/6kvpf4bEU2em
         HPXq2Wo/P9q7VIxa/dM0rgERYjxFgGJv7ZbOSzENnxdfwOIZx37KfwQWuPwVBnh8Sp69
         IrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763782510; x=1764387310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PntoKZBSq6UJxBNBo1SBKJbLUG/UOz6qfm3VlE0JmTA=;
        b=t/s+QNNEcR5utO2oC/qWMeCdbfvyUsELxt0fPWlA1EO87X1G1eHa/Tsd40o/XRDnB1
         G+uJBcnGZqD2nzzHF/fDVwRyDwrs5/fb1oNGccRevGXRxEyR1vY6zgXM3m0ZutWlou24
         R1xub0kvIJzKre4gGwLqywg2+HXC158eKEQW9gdW9iV7DjEwlgHhtaWXCfrKfPDWeVdG
         oOYR+Sh2V27Ex7l5xY0DUm+u1XXxTZQFYvGyz9RMhOlcJXnHKKnWE3pt6r2YaVWakKRK
         x1bY+VoO1PLWkA2abo0+wn+LADuAjp7Zx1sD57F35K1ZH2t/52CuHBddc1CdVFtCviPE
         a3/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUxTjcVMBKw/SUPLq9gxr04Vygl4GOsCkVhS9q0TP6MnieFf5RF16I1ZAj6IPfZsgiyZXl1vbwsHjmEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFz01EThDdSZf/4NRpsxpCy1LYbJsgisUHG/nJPNVd0AWk6Vu
	DQx2kX8OrkuUMMnA0hpK3anmfUwffocHncljyY/B3ReH5Br5Nm2H3nza
X-Gm-Gg: ASbGncuiRoGXZZUc022tVIETCopcC0Ya8L4g9xRQ2vMaYmLEahqc8UxfmPuc8s9ksmP
	MKUq238l86XG6T8Qa79gt8GS7GrCvNrGyLR6zM+DUYSvJVL5s9LNzxarmLXn6JlAuwipx9Gandl
	ku2mlwBqz99z/J1xvlvKNXHz8X3QU+3tXqScOngETKve2z2EZEb/T3YUzTYPasF5pjfoLEyA7hO
	iF4AZu7TB9/cqPZdtLMQJ8YQDu3dDeIcR2YvhDoEj0wBvAovnfdQIJfTfuAOr05igcYn82Mdozl
	DceLYaudOpZh24C1p5X/p/zjPXww5Ayr39Un6nKqnWgzkoYKqfXgHIlKTr1eTWPtpiMOjwXebYd
	EwFulUrMrL9av/47EaiujSLbREV7jWxs5mdU8d9xmYjiHb9VIP4f/kJ/OE1aNRezQFwrPY60Am2
	N/dndtGzhl+WbRnCAGPvQ836M=
X-Google-Smtp-Source: AGHT+IEKweMzvPR5jxvqxiL9iOQXxZzCcd9zEZ86netz5nLi4QhrT+0B6yLCYaKOM3BCWT4tWWz3/g==
X-Received: by 2002:a05:7301:28ab:b0:2a4:6b34:9eb9 with SMTP id 5a478bee46e88-2a719f7353amr1788168eec.29.1763782510046;
        Fri, 21 Nov 2025 19:35:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc5e3750sm23884755eec.6.2025.11.21.19.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 19:35:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Nov 2025 19:35:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: victor.duicu@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marius.cristea@microchip.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add support for MCP998X
Message-ID: <9d75c325-443a-4c47-8b88-c82afeeb4b25@roeck-us.net>
References: <20251120071248.3767-1-victor.duicu@microchip.com>
 <20251120071248.3767-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120071248.3767-3-victor.duicu@microchip.com>

Hi,

On Thu, Nov 20, 2025 at 09:12:46AM +0200, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

I had another look into the unaligned accesses. See below.

> ---
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/mcp9982.rst |  95 ++++
>  MAINTAINERS                     |   2 +
>  drivers/hwmon/Kconfig           |  11 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/mcp9982.c         | 937 ++++++++++++++++++++++++++++++++
>  6 files changed, 1047 insertions(+)
>  create mode 100644 Documentation/hwmon/mcp9982.rst
>  create mode 100644 drivers/hwmon/mcp9982.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 51a5bdf75b08..f052d80d752e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -171,6 +171,7 @@ Hardware Monitoring Kernel Drivers
>     mc33xs2410_hwmon
>     mc34vr500
>     mcp3021
> +   mcp9982
>     menf21bmc
>     mlxreg-fan
>     mp2856
> diff --git a/Documentation/hwmon/mcp9982.rst b/Documentation/hwmon/mcp9982.rst
> new file mode 100644
> index 000000000000..e629dd90f311
> --- /dev/null
> +++ b/Documentation/hwmon/mcp9982.rst
> @@ -0,0 +1,95 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +Kernel driver MCP998X
> +=====================
> +
> +Supported chips:
> +
> +  * Microchip Technology MCP998X/MCP9933 and MCP998XD/MCP9933D
> +
> +    Prefix: 'mcp9982'
> +
> +    Datasheet:
> +    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
> +
> +Authors:
> +
> +   - Victor Duicu <victor.duicu@microchip.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for the MCP998X family containing: MCP9982,
> +MCP9982D, MCP9983, MCP9983D, MCP9984, MCP9984D, MCP9985, MCP9985D,
> +MCP9933 and MCP9933D.
> +
> +The MCP998X Family is a high accuracy 2-wire multichannel automotive
> +temperature monitor.
> +
> +The chips in the family have different numbers of external channels,
> +ranging from 1 (MCP9982) to 4 channels (MCP9985). Reading diodes in
> +anti-parallel connection is supported by MCP9984/85/33 and
> +MCP9984D/85D/33D. Dedicated hardware shutdown circuitry is present
> +only in MCP998XD and MCP9933D.
> +
> +Temperatures are read in millidegrees Celsius, ranging from -64 to
> +191.875 with 0.125 precision.
> +
> +Each channel has a minimum, maximum and critical limit.
> +The limits have associated alarms.
> +
> +The chips measure temperatures with a variable conversion rate.
> +Update_interval = Conversion/Second, so the available options are:
> +- 16000 (ms) = 1 conv/16 sec
> +- 8000 (ms) = 1 conv/8 sec
> +- 4000 (ms) = 1 conv/4 sec
> +- 2000 (ms) = 1 conv/2 sec
> +- 1000 (ms) = 1 conv/sec
> +- 500 (ms) = 2 conv/sec
> +- 250 (ms) = 4 conv/sec
> +- 125 (ms) = 8 conv/sec
> +- 64 (ms) = 16 conv/sec
> +- 32 (ms) = 32 conv/sec
> +- 16 (ms) = 64 conv/sec
> +
> +Usage Notes
> +-----------
> +
> +Parameters that can be configured in devicetree:
> +- anti-parallel diode mode operation
> +- resistance error correction on channels 1 and 2
> +- resistance error correction on channels 3 and 4
> +Chips 82/83 and 82D/83D do not support anti-parallel diode mode.
> +For chips with "D" in the name resistance error correction must be on.
> +Please see Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> +for details.
> +
> +There are two power states:
> +- Active state: in which the chip is converting on all channels at the
> +  programmed rate.
> +- Standby state: in which the host must initiate a conversion cycle.
> +Chips with "D" in the name work in Active state only and those without
> +can work in either state.
> +
> +Chips with "D" in the name can't set update interval slower than 1 second.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported. The limits and update_interval are
> +read-write, while the rest are read only.
> +
> +======================= ==================================================
> +temp[1-5]_label		User name for channel.
> +temp[1-5]_input		Measured temperature for channel.
> +
> +temp[1-5]_crit		Critical temperature limit.
> +temp[1-5]_crit_alarm	Critical temperature limit alarm.
> +
> +temp[1-5]_max		High temperature limit.
> +temp[1-5]_max_alarm	High temperature limit alarm.
> +
> +temp[1-5]_min		Low temperature limit.
> +temp[1-5]_min_alarm	Low temperature limit alarm.
> +
> +update_interval		The interval at which the chip will update readings.
> +======================= ==================================================
> \ No newline at end of file
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0fd4deebed0..f24dafc5e847 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16942,6 +16942,8 @@ M:	Victor Duicu <victor.duicu@microchip.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> +F:	Documentation/hwmon/mcp9982.rst
> +F:	drivers/hwmon/mcp9982.c
>  
>  MICROCHIP MMC/SD/SDIO MCI DRIVER
>  M:	Aubin Constans <aubin.constans@microchip.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2760feb9f83b..3ef640f602a4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1376,6 +1376,17 @@ config SENSORS_MCP3021
>  	  This driver can also be built as a module. If so, the module
>  	  will be called mcp3021.
>  
> +config SENSORS_MCP9982
> +       tristate "Microchip Technology MCP9982 driver"
> +       depends on I2C
> +       select REGMAP_I2C
> +       help
> +         Say yes here to include support for Microchip Technology's MCP998X/33
> +         and MCP998XD/33D Multichannel Automotive Temperature Monitor Family.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called mcp9982.
> +
>  config SENSORS_MLXREG_FAN
>  	tristate "Mellanox FAN driver"
>  	depends on MELLANOX_PLATFORM
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 73b2abdcc6dd..10614d9dc933 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -169,6 +169,7 @@ obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>  obj-$(CONFIG_SENSORS_MC33XS2410) += mc33xs2410_hwmon.o
>  obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>  obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
> +obj-$(CONFIG_SENSORS_MCP9982)	+= mcp9982.o
>  obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>  obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
>  obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
> diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
> new file mode 100644
> index 000000000000..1ba0285e85a4
> --- /dev/null
> +++ b/drivers/hwmon/mcp9982.c
> @@ -0,0 +1,937 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * HWMON driver for MCP998X/33 and MCP998XD/33D Multichannel Automotive
> + * Temperature Monitor Family
> + *
> + * Copyright (C) 2025 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Victor Duicu <victor.duicu@microchip.com>
> + *
> + * Datasheet can be found here:
> + * https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/device/devres.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/time64.h>
> +#include <linux/unaligned.h>
> +#include <linux/util_macros.h>
> +
> +/* MCP9982 Registers */
> +#define MCP9982_HIGH_BYTE_ADDR(index)		(2 * (index))
> +#define MCP9982_ONE_SHOT_ADDR			0x0A
> +#define MCP9982_INTERNAL_HIGH_LIMIT_ADDR	0x0B
> +#define MCP9982_INTERNAL_LOW_LIMIT_ADDR		0x0C
> +#define MCP9982_EXT_HIGH_LIMIT_ADDR(index)	(4 * ((index) - 1) + 0x0D)
> +#define MCP9982_EXT_LOW_LIMIT_ADDR(index)	(4 * ((index) - 1) + 0x0F)
> +#define MCP9982_INTERNAL_THERM_LIMIT_ADDR	0x1D
> +#define MCP9982_EXT_1_THERM_LIMIT_ADDR		0x1E
> +#define MCP9982_EXT_2_THERM_LIMIT_ADDR		0x1F
> +#define MCP9982_EXT_3_THERM_LIMIT_ADDR		0x20
> +#define MCP9982_EXT_4_THERM_LIMIT_ADDR		0x21
> +#define MCP9982_THERM_LIMIT_ADDR(index)		((index) + 0x1D)
> +#define MCP9982_CFG_ADDR			0x22
> +#define MCP9982_CONV_ADDR			0x24
> +#define MCP9982_HYS_ADDR			0x25
> +#define MCP9982_CONSEC_ALRT_ADDR		0x26
> +#define MCP9982_ALRT_CFG_ADDR			0x27
> +#define MCP9982_RUNNING_AVG_ADDR		0x28
> +#define MCP9982_HOTTEST_CFG_ADDR		0x29
> +#define MCP9982_STATUS_ADDR			0x2A
> +#define MCP9982_EXT_FAULT_STATUS_ADDR		0x2B
> +#define MCP9982_HIGH_LIMIT_STATUS_ADDR		0x2C
> +#define MCP9982_LOW_LIMIT_STATUS_ADDR		0x2D
> +#define MCP9982_THERM_LIMIT_STATUS_ADDR		0x2E
> +#define MCP9982_HOTTEST_HIGH_BYTE_ADDR		0x2F
> +#define MCP9982_HOTTEST_LOW_BYTE_ADDR		0x30
> +#define MCP9982_HOTTEST_STATUS_ADDR		0x31
> +#define MCP9982_THERM_SHTDWN_CFG_ADDR		0x32
> +#define MCP9982_HRDW_THERM_SHTDWN_LIMIT_ADDR	0x33
> +#define MCP9982_EXT_BETA_CFG_ADDR(index)	((index) + 0x33)
> +#define MCP9982_EXT_IDEAL_ADDR(index)		((index) + 0x35)
> +
> +/* 80h is the start address for temperature memory block */
> +#define MCP9982_TEMP_MEM_BLOCK_ADDR(index)	(2 * (index) + 0x80)
> +
> +/* Addresses in the STATUS MEMORY BLOCK */
> +#define MCP9982_STATUS_BLOCK_MEMORY		0x90
> +#define MCP9982_STATUS_BLOCK_DIODE_FAULT	0x91
> +#define MCP9982_STATUS_BLOCK_HIGH_LIMIT		0x92
> +#define MCP9982_STATUS_BLOCK_LOW_LIMIT		0x93
> +#define MCP9982_STATUS_BLOCK_THERM_LIMIT	0x94
> +#define MCP9982_STATUS_BLOCK_HOTTEST_HIGH_BYTE	0x95
> +#define MCP9982_STATUS_BLOCK_HOTTEST_LOW_BYTE	0x96
> +#define MCP9982_STATUS_BLOCK_HOTTEST		0x97
> +
> +/* MCP9982 Bits */
> +#define MCP9982_CFG_MSKAL			BIT(7)
> +#define MCP9982_CFG_RS				BIT(6)
> +#define MCP9982_CFG_ATTHM			BIT(5)
> +#define MCP9982_CFG_RECD12			BIT(4)
> +#define MCP9982_CFG_RECD34			BIT(3)
> +#define MCP9982_CFG_RANGE			BIT(2)
> +#define MCP9982_CFG_DA_ENA			BIT(1)
> +#define MCP9982_CFG_APDD			BIT(0)
> +
> +#define MCP9982_STATUS_BUSY			BIT(5)
> +
> +/* Constants and default values */
> +#define MCP9982_MAX_NUM_CHANNELS		5
> +#define MCP9982_BETA_AUTODETECT			16
> +#define MCP9982_IDEALITY_DEFAULT		18
> +#define MCP9982_OFFSET				64
> +#define MCP9982_DEFAULT_CONSEC_ALRT_VAL		112
> +#define MCP9982_DEFAULT_HYS_VAL			10
> +#define MCP9982_DEFAULT_CONV_VAL		6
> +#define MCP9982_WAKE_UP_TIME_MS			125
> +#define MCP9982_CONVERSION_TIME_MS		125
> +#define MCP9982_HIGH_LIMIT_DEFAULT		21000
> +#define MCP9982_LOW_LIMIT_DEFAULT		0
> +
> +static const struct hwmon_channel_info * const mcp9985_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM),
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_UPDATE_INTERVAL),
> +	NULL
> +};
> +
> +/**
> + * struct mcp9982_features - features of a mcp9982 instance
> + * @name:			chip's name
> + * @phys_channels:		number of physical channels supported by the chip
> + * @hw_thermal_shutdown:	presence of hardware thermal shutdown circuitry
> + * @allow_apdd:			whether the chip supports enabling APDD
> + */
> +struct mcp9982_features {
> +	const char	*name;
> +	u8		phys_channels;
> +	bool		hw_thermal_shutdown;
> +	bool		allow_apdd;
> +};
> +
> +static const struct mcp9982_features mcp9933_chip_config = {
> +	.name = "mcp9933",
> +	.phys_channels = 3,
> +	.hw_thermal_shutdown = false,
> +	.allow_apdd = true,
> +};
> +
> +static const struct mcp9982_features mcp9933d_chip_config = {
> +	.name = "mcp9933d",
> +	.phys_channels = 3,
> +	.hw_thermal_shutdown = true,
> +	.allow_apdd = true,
> +};
> +
> +static const struct mcp9982_features mcp9982_chip_config = {
> +	.name = "mcp9982",
> +	.phys_channels = 2,
> +	.hw_thermal_shutdown = false,
> +	.allow_apdd = false,
> +};
> +
> +static const struct mcp9982_features mcp9982d_chip_config = {
> +	.name = "mcp9982d",
> +	.phys_channels = 2,
> +	.hw_thermal_shutdown = true,
> +	.allow_apdd = false,
> +};
> +
> +static const struct mcp9982_features mcp9983_chip_config = {
> +	.name = "mcp9983",
> +	.phys_channels = 3,
> +	.hw_thermal_shutdown = false,
> +	.allow_apdd = false,
> +};
> +
> +static const struct mcp9982_features mcp9983d_chip_config = {
> +	.name = "mcp9983d",
> +	.phys_channels = 3,
> +	.hw_thermal_shutdown = true,
> +	.allow_apdd = false,
> +};
> +
> +static const struct mcp9982_features mcp9984_chip_config = {
> +	.name = "mcp9984",
> +	.phys_channels = 4,
> +	.hw_thermal_shutdown = false,
> +	.allow_apdd = true,
> +};
> +
> +static const struct mcp9982_features mcp9984d_chip_config = {
> +	.name = "mcp9984d",
> +	.phys_channels = 4,
> +	.hw_thermal_shutdown = true,
> +	.allow_apdd = true,
> +};
> +
> +static const struct mcp9982_features mcp9985_chip_config = {
> +	.name = "mcp9985",
> +	.phys_channels = 5,
> +	.hw_thermal_shutdown = false,
> +	.allow_apdd = true,
> +};
> +
> +static const struct mcp9982_features mcp9985d_chip_config = {
> +	.name = "mcp9985d",
> +	.phys_channels = 5,
> +	.hw_thermal_shutdown = true,
> +	.allow_apdd = true,
> +};
> +
> +static const unsigned int mcp9982_update_interval[11] = {
> +	16000, 8000, 4000, 2000, 1000, 500, 250, 125, 64, 32, 16
> +};
> +
> +/* MCP9982 regmap configuration */
> +static const struct regmap_range mcp9982_regmap_wr_ranges[] = {
> +	regmap_reg_range(MCP9982_ONE_SHOT_ADDR, MCP9982_CFG_ADDR),
> +	regmap_reg_range(MCP9982_CONV_ADDR, MCP9982_HOTTEST_CFG_ADDR),
> +	regmap_reg_range(MCP9982_THERM_SHTDWN_CFG_ADDR, MCP9982_THERM_SHTDWN_CFG_ADDR),
> +	regmap_reg_range(MCP9982_EXT_BETA_CFG_ADDR(1), MCP9982_EXT_IDEAL_ADDR(4)),
> +};
> +
> +static const struct regmap_access_table mcp9982_regmap_wr_table = {
> +	.yes_ranges = mcp9982_regmap_wr_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(mcp9982_regmap_wr_ranges),
> +};
> +
> +static const struct regmap_range mcp9982_regmap_rd_ranges[] = {
> +	regmap_reg_range(MCP9982_HIGH_BYTE_ADDR(0), MCP9982_CFG_ADDR),
> +	regmap_reg_range(MCP9982_CONV_ADDR, MCP9982_EXT_IDEAL_ADDR(4)),
> +	regmap_reg_range(MCP9982_TEMP_MEM_BLOCK_ADDR(0), MCP9982_STATUS_BLOCK_HOTTEST),
> +};
> +
> +static const struct regmap_access_table mcp9982_regmap_rd_table = {
> +	.yes_ranges = mcp9982_regmap_rd_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(mcp9982_regmap_rd_ranges),
> +};
> +
> +static bool mcp9982_is_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case MCP9982_ONE_SHOT_ADDR:
> +	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(1):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(1) + 1:
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(2):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(2) + 1:
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(3):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(3) + 1:
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(4):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(4) + 1:
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(1) + 1:
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(2) + 1:
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(3) + 1:
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(4) + 1:
> +	case MCP9982_THERM_LIMIT_ADDR(0):
> +	case MCP9982_THERM_LIMIT_ADDR(1):
> +	case MCP9982_THERM_LIMIT_ADDR(2):
> +	case MCP9982_THERM_LIMIT_ADDR(3):
> +	case MCP9982_THERM_LIMIT_ADDR(4):
> +	case MCP9982_CFG_ADDR:
> +	case MCP9982_CONV_ADDR:
> +	case MCP9982_HYS_ADDR:
> +	case MCP9982_CONSEC_ALRT_ADDR:
> +	case MCP9982_ALRT_CFG_ADDR:
> +	case MCP9982_RUNNING_AVG_ADDR:
> +	case MCP9982_HOTTEST_CFG_ADDR:
> +	case MCP9982_THERM_SHTDWN_CFG_ADDR:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config mcp9982_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.rd_table = &mcp9982_regmap_rd_table,
> +	.wr_table = &mcp9982_regmap_wr_table,
> +	.volatile_reg = mcp9982_is_volatile_reg,
> +	.max_register = MCP9982_STATUS_BLOCK_HOTTEST,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +/**
> + * struct mcp9992_priv - information about chip parameters
> + * @regmap:			device register map
> + * @chip:			pointer to structure holding chip features
> + * @labels:			labels of the channels
> + * @interval_idx:		index representing the current update interval
> + * @time_limit:			time when it is safe to read
> + * @enabled_channel_mask:	mask containing which channels should be enabled
> + * @num_channels:		number of active physical channels
> + * @recd34_enable:		state of Resistance Error Correction(REC) on channels 3 and 4
> + * @recd12_enable:		state of Resistance Error Correction(REC) on channels 1 and 2
> + * @apdd_enable:		state of anti-parallel diode mode
> + * @run_state:			chip is in Run state, otherwise is in Standby state
> + * @wait_before_read:		whether we need to wait a delay before reading a new value
> + */
> +struct mcp9982_priv {
> +	struct regmap *regmap;
> +	const struct mcp9982_features *chip;
> +	const char *labels[MCP9982_MAX_NUM_CHANNELS];
> +	unsigned int interval_idx;
> +	unsigned long time_limit;
> +	unsigned long enabled_channel_mask;
> +	u8 num_channels;
> +	bool recd34_enable;
> +	bool recd12_enable;
> +	bool apdd_enable;
> +	bool run_state;
> +	bool wait_before_read;
> +};
> +
> +static int mcp9982_read_limit(struct mcp9982_priv *priv, u8 address, long *val)
> +{
> +	unsigned int limit;
> +	u8 buff[2];
> +	int ret;
> +
> +	switch (address) {
> +	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_1_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_2_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_3_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_4_THERM_LIMIT_ADDR:
> +		ret = regmap_read(priv->regmap, address, &limit);
> +		if (ret)
> +			return ret;
> +
> +		*val = (((int)limit - MCP9982_OFFSET) << 3) * 125;
> +
> +		return 0;
> +	default:
> +		ret = regmap_bulk_read(priv->regmap, address, &buff, sizeof(buff));
> +		if (ret)
> +			return ret;
> +
> +		*val = (((int)get_unaligned_be16(buff) >> 5) - (MCP9982_OFFSET << 3)) * 125;

buff is always aligned.

> +
> +		return 0;
> +	}
> +}
> +
> +static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			long *val)
> +{
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +	unsigned int reg_status;
> +	unsigned int mask;
> +	u8 buff[3], addr;
> +	int ret;
> +
> +	/*
> +	 * When working in Run mode, after modifying a parameter (like update
> +	 * interval) we have to wait a delay before reading the new values.
> +	 * We can't determine when the conversion is done based on the BUSY bit.
> +	 */
> +	if (priv->run_state) {
> +		if (priv->wait_before_read) {
> +			if (!time_after(jiffies, priv->time_limit))
> +				mdelay(jiffies_to_msecs(priv->time_limit - jiffies));
> +			priv->wait_before_read = false;
> +		}
> +	} else {
> +		ret = regmap_write(priv->regmap, MCP9982_ONE_SHOT_ADDR, 1);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * In Standby state after writing in OneShot register wait for
> +		 * the start of conversion and then poll the BUSY bit.
> +		 */
> +		mdelay(MCP9982_WAKE_UP_TIME_MS);
> +		ret = regmap_read_poll_timeout(priv->regmap, MCP9982_STATUS_ADDR,
> +					       reg_status, !(reg_status & MCP9982_STATUS_BUSY),
> +					       (mcp9982_update_interval[priv->interval_idx]) *
> +					       USEC_PER_MSEC, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			/*
> +			 * The Block Read Protocol first returns the number of user readable
> +			 * bytes, held in buff[0], followed by the data.

The SMBUs block read command does, but the regmap_bulk_read() command ?
Really ? Where is that documented, and why does it only apply here and
not when reading limit registers ?

> +			 */
> +			ret = regmap_bulk_read(priv->regmap, MCP9982_TEMP_MEM_BLOCK_ADDR(channel),
> +					       &buff, sizeof(buff));
> +			if (ret)
> +				return ret;
> +
> +			*val = get_unaligned_be16(buff + 1) >> 5;

I would be really surprised if this works. I have used regmap_bulk_read()
a lot, and for me it never returned the data length in the first byte.
If it did, all code using this function would be pretty much unpredictable
since it isn't even known if the controller supports smbus block read commands.
The use of regmap_bulk_read() in this driver shows it: For limit registers
it returns the data directly, for temperature registers it somehow knows
that a smbus block read operation is wanted, and that the first returned
byte is supposed to return the length, not the content of the registers.
How does the regmap core know this, and why is this behavior not documented ?

I'll not only want to see register maps if you insist that this works,
I'll want to get an evaluation board to confirm it.

> +			*val = (*val - (MCP9982_OFFSET << 3)) * 125;
> +
> +			return 0;
> +		case hwmon_temp_max:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +
> +			return mcp9982_read_limit(priv, addr, val);
> +		case hwmon_temp_max_alarm:
> +			mask = BIT(channel);
> +			*val = regmap_test_bits(priv->regmap, MCP9982_HIGH_LIMIT_STATUS_ADDR, mask);
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_min:
> +			if (channel)
> +				addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
> +
> +			return mcp9982_read_limit(priv, addr, val);
> +		case hwmon_temp_min_alarm:
> +			mask = BIT(channel);
> +			*val = regmap_test_bits(priv->regmap, MCP9982_LOW_LIMIT_STATUS_ADDR, mask);
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_crit:
> +			return mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
> +		case hwmon_temp_crit_alarm:
> +			mask = BIT(channel);
> +			*val = regmap_test_bits(priv->regmap, MCP9982_THERM_LIMIT_STATUS_ADDR,
> +						mask);
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			*val = mcp9982_update_interval[priv->interval_idx];
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mcp9982_read_label(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			      int channel, const char **str)
> +{
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			if (priv->labels[channel]) {
> +				*str = priv->labels[channel];
> +				return 0;
> +			} else {
> +				return -EOPNOTSUPP;
> +			}
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int mcp9982_write_limit(struct mcp9982_priv *priv, u8 address, long val)
> +{
> +	int ret;
> +
> +	/* Range is always -64 to 191.875°C. */
> +	val = clamp_val(val, -64000, 191875);
> +	val = (val + MCP9982_OFFSET * 1000) << 5;
> +	val = DIV_ROUND_CLOSEST(val, 125);
> +
> +	switch (address) {
> +	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_1_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_2_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_3_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_4_THERM_LIMIT_ADDR:
> +		val = val >> 8;
> +		ret = regmap_write(priv->regmap, address, val);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	default:
> +		put_unaligned_be16(val, &val);

This is really an odd way of avoiding a local two-byte buffer.
Besides, "val" on the stack will always be aligned, so the unaligned
access is unnecessary.

> +		ret = regmap_bulk_write(priv->regmap, address, &val, 2);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	}
> +}
> +
> +static int mcp9982_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			 long val)
> +{
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +	unsigned int previous_interval_idx, idx;
> +	bool use_previous_interval = false;
> +	unsigned long new_time_limit;
> +	u8 addr;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			previous_interval_idx = priv->interval_idx;
> +
> +			/*
> +			 * For MCP998XD and MCP9933D update interval
> +			 * can't be slower than 1 second.
> +			 */
> +			if (priv->chip->hw_thermal_shutdown)
> +				val = clamp(val, 0, 1000);
> +
> +			idx = find_closest_descending(val, mcp9982_update_interval,
> +						      ARRAY_SIZE(mcp9982_update_interval));
> +
> +			ret = regmap_write(priv->regmap, MCP9982_CONV_ADDR, idx);
> +			if (ret)
> +				return ret;
> +
> +			priv->interval_idx = idx;
> +
> +			/*
> +			 * When changing the interval time in Run mode, wait a delay based
> +			 * on the previous value to ensure the new value becomes active.
> +			 */
> +			if (priv->run_state)
> +				use_previous_interval = true;
> +			else
> +				return 0;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +
> +			return ret = mcp9982_write_limit(priv, addr, val);
> +		case hwmon_temp_min:
> +			if (channel)
> +				addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
> +
> +			return mcp9982_write_limit(priv, addr, val);
> +		case hwmon_temp_crit:
> +			return mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Calculate the time point when it would be safe to read after
> +	 * the current write operation in Run mode.
> +	 * If, for example, we change update interval from a slower time
> +	 * to a faster time, the change will become active after the
> +	 * conversion with the slower time is finished. If we read before
> +	 * the end of conversion, the value will be from the previous cycle.
> +	 */
> +	if (use_previous_interval) {
> +		new_time_limit = msecs_to_jiffies(mcp9982_update_interval[previous_interval_idx]);
> +		use_previous_interval = false;
> +	} else {
> +		new_time_limit = msecs_to_jiffies(mcp9982_update_interval[priv->interval_idx]);
> +	}
> +
> +	new_time_limit += jiffies + msecs_to_jiffies(MCP9982_CONVERSION_TIME_MS);
> +
> +	if (time_after(new_time_limit, priv->time_limit)) {
> +		priv->time_limit = new_time_limit;
> +		priv->wait_before_read = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t mcp9982_is_visible(const void *_data, enum hwmon_sensor_types type, u32 attr,
> +				  int channel)
> +{
> +	const struct mcp9982_priv *priv = _data;
> +
> +	if (!test_bit(channel, &priv->enabled_channel_mask))
> +		return 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			if (priv->labels[channel])
> +				return 0444;
> +			else
> +				return 0;
> +		case hwmon_temp_input:
> +		case hwmon_temp_min_alarm:
> +		case hwmon_temp_max_alarm:
> +		case hwmon_temp_crit_alarm:
> +			return 0444;
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +		case hwmon_temp_crit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_ops mcp9982_hwmon_ops = {
> +	.is_visible = mcp9982_is_visible,
> +	.read = mcp9982_read,
> +	.read_string = mcp9982_read_label,
> +	.write = mcp9982_write,
> +};
> +
> +static int mcp9982_init(struct device *dev, struct mcp9982_priv *priv)
> +{
> +	unsigned int i;
> +	int ret;
> +	u8 val;
> +
> +	/* Chips 82/83 and 82D/83D do not support anti-parallel diode mode. */
> +	if (!priv->chip->allow_apdd && priv->apdd_enable == 1)
> +		return dev_err_probe(dev, -EINVAL, "Incorrect setting of APDD.\n");
> +
> +	/* Chips with "D" work only in Run state. */
> +	if (priv->chip->hw_thermal_shutdown && !priv->run_state)
> +		return dev_err_probe(dev, -EINVAL, "Incorrect setting of Power State.\n");
> +
> +	/*
> +	 * For chips with "D" in the name, resistance error correction must be on
> +	 * so that hardware shutdown feature can't be overridden.
> +	 */
> +	if (priv->chip->hw_thermal_shutdown)
> +		if (!priv->recd34_enable || !priv->recd12_enable)
> +			return dev_err_probe(dev, -EINVAL, "Incorrect setting of RECD.\n");
> +
> +	/*
> +	 * Set default values in registers.
> +	 * APDD, RECD12 and RECD34 are active on 0.
> +	 */
> +	val = FIELD_PREP(MCP9982_CFG_MSKAL, 1) |
> +	      FIELD_PREP(MCP9982_CFG_RS, !priv->run_state) |
> +	      FIELD_PREP(MCP9982_CFG_ATTHM, 1) |
> +	      FIELD_PREP(MCP9982_CFG_RECD12, !priv->recd12_enable) |
> +	      FIELD_PREP(MCP9982_CFG_RECD34, !priv->recd34_enable) |
> +	      FIELD_PREP(MCP9982_CFG_RANGE, 1) | FIELD_PREP(MCP9982_CFG_DA_ENA, 0) |
> +	      FIELD_PREP(MCP9982_CFG_APDD, !priv->apdd_enable);
> +
> +	ret = regmap_write(priv->regmap, MCP9982_CFG_ADDR, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_CONV_ADDR, MCP9982_DEFAULT_CONV_VAL);
> +	if (ret)
> +		return ret;
> +	priv->interval_idx = MCP9982_DEFAULT_CONV_VAL;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_HYS_ADDR, MCP9982_DEFAULT_HYS_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_CONSEC_ALRT_ADDR, MCP9982_DEFAULT_CONSEC_ALRT_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_RUNNING_AVG_ADDR, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_HOTTEST_CFG_ADDR, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Only external channels 1 and 2 support beta compensation.
> +	 * Set beta auto-detection.
> +	 */
> +	for (i = 1; i < 3; i++)
> +		if (test_bit(i, &priv->enabled_channel_mask)) {
> +			ret = regmap_write(priv->regmap, MCP9982_EXT_BETA_CFG_ADDR(i),
> +					   MCP9982_BETA_AUTODETECT);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	/* Set default values for internal channel limits. */
> +	if (test_bit(0, &priv->enabled_channel_mask)) {
> +		ret = mcp9982_write_limit(priv, MCP9982_INTERNAL_HIGH_LIMIT_ADDR,
> +					  MCP9982_HIGH_LIMIT_DEFAULT);
> +		if (ret)
> +			return ret;
> +
> +		ret = mcp9982_write_limit(priv, MCP9982_INTERNAL_LOW_LIMIT_ADDR,
> +					  MCP9982_LOW_LIMIT_DEFAULT);
> +		if (ret)
> +			return ret;
> +
> +		ret = mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(0),
> +					  MCP9982_HIGH_LIMIT_DEFAULT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Set ideality factor and limits to default for external channels. */
> +	for (i = 1; i < MCP9982_MAX_NUM_CHANNELS; i++)
> +		if (test_bit(i, &priv->enabled_channel_mask)) {
> +			ret = regmap_write(priv->regmap, MCP9982_EXT_IDEAL_ADDR(i),
> +					   MCP9982_IDEALITY_DEFAULT);
> +			if (ret)
> +				return ret;
> +
> +			ret = mcp9982_write_limit(priv, MCP9982_EXT_HIGH_LIMIT_ADDR(i),
> +						  MCP9982_HIGH_LIMIT_DEFAULT);
> +			if (ret)
> +				return ret;
> +
> +			ret = mcp9982_write_limit(priv, MCP9982_EXT_LOW_LIMIT_ADDR(i),
> +						  MCP9982_LOW_LIMIT_DEFAULT);
> +			if (ret)
> +				return ret;
> +
> +			ret = mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(i),
> +						  MCP9982_HIGH_LIMIT_DEFAULT);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	priv->wait_before_read = false;
> +	priv->time_limit = jiffies;
> +
> +	return 0;
> +}
> +
> +static int mcp9982_parse_fw_config(struct device *dev, int device_nr_channels)
> +{
> +	unsigned int reg_nr;
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Initialise internal channel( which is always present ). */
> +	priv->labels[0] = "internal diode";
> +	priv->enabled_channel_mask = 1;
> +
> +	/* Default values to work on systems without devicetree or firmware nodes. */
> +	if (!dev_fwnode(dev)) {
> +		priv->num_channels = device_nr_channels;
> +		priv->enabled_channel_mask = BIT(priv->num_channels) - 1;
> +		priv->apdd_enable = false;
> +		priv->recd12_enable = true;
> +		priv->recd34_enable = true;
> +		priv->run_state = true;
> +		return 0;
> +	}
> +
> +	priv->apdd_enable =
> +		device_property_read_bool(dev, "microchip,enable-anti-parallel");
> +
> +	priv->recd12_enable =
> +		device_property_read_bool(dev, "microchip,parasitic-res-on-channel1-2");
> +
> +	priv->recd34_enable =
> +		device_property_read_bool(dev, "microchip,parasitic-res-on-channel3-4");
> +
> +	priv->run_state =
> +		device_property_read_bool(dev, "microchip,power-state");
> +
> +	priv->num_channels = device_get_child_node_count(dev) + 1;
> +
> +	if (priv->num_channels > device_nr_channels)
> +		return dev_err_probe(dev, -E2BIG,
> +				     "More channels than the chip supports.\n");
> +
> +	/* Read information about the external channels. */
> +	device_for_each_child_node_scoped(dev, child) {
> +		reg_nr = 0;
> +		ret = fwnode_property_read_u32(child, "reg", &reg_nr);
> +		if (ret || !reg_nr || reg_nr >= device_nr_channels)
> +			return dev_err_probe(dev, -EINVAL,
> +			  "Channel reg is incorrectly set.\n");
> +
> +		fwnode_property_read_string(child, "label", &priv->labels[reg_nr]);
> +		set_bit(reg_nr, &priv->enabled_channel_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp9982_probe(struct i2c_client *client)
> +{
> +	struct hwmon_chip_info mcp998x_chip_info;
> +	const struct mcp9982_features *chip;
> +	struct device *dev = &client->dev;
> +	struct mcp9982_priv *priv;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct mcp9982_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &mcp9982_regmap_config);
> +
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Cannot initialize register map.\n");
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	chip = i2c_get_match_data(client);
> +	if (!chip)
> +		return -EINVAL;
> +	priv->chip = chip;
> +
> +	ret = mcp9982_parse_fw_config(dev, chip->phys_channels);
> +	if (ret)
> +		return ret;
> +
> +	ret = mcp9982_init(dev, priv);
> +	if (ret)
> +		return ret;
> +
> +	mcp998x_chip_info.ops = &mcp9982_hwmon_ops;
> +	mcp998x_chip_info.info = mcp9985_info;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, chip->name, priv,
> +							 &mcp998x_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id mcp9982_id[] = {
> +	{ .name = "mcp9933", .driver_data = (kernel_ulong_t)&mcp9933_chip_config },
> +	{ .name = "mcp9933d", .driver_data = (kernel_ulong_t)&mcp9933d_chip_config },
> +	{ .name = "mcp9982", .driver_data = (kernel_ulong_t)&mcp9982_chip_config },
> +	{ .name = "mcp9982d", .driver_data = (kernel_ulong_t)&mcp9982d_chip_config },
> +	{ .name = "mcp9983", .driver_data = (kernel_ulong_t)&mcp9983_chip_config },
> +	{ .name = "mcp9983d", .driver_data = (kernel_ulong_t)&mcp9983d_chip_config },
> +	{ .name = "mcp9984", .driver_data = (kernel_ulong_t)&mcp9984_chip_config },
> +	{ .name = "mcp9984d", .driver_data = (kernel_ulong_t)&mcp9984d_chip_config },
> +	{ .name = "mcp9985", .driver_data = (kernel_ulong_t)&mcp9985_chip_config },
> +	{ .name = "mcp9985d", .driver_data = (kernel_ulong_t)&mcp9985d_chip_config },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, mcp9982_id);
> +
> +static const struct of_device_id mcp9982_of_match[] = {
> +	{
> +		.compatible = "microchip,mcp9933",
> +		.data = &mcp9933_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9933d",
> +		.data = &mcp9933d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9982",
> +		.data = &mcp9982_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9982d",
> +		.data = &mcp9982d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9983",
> +		.data = &mcp9983_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9983d",
> +		.data = &mcp9983d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9984",
> +		.data = &mcp9984_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9984d",
> +		.data = &mcp9984d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9985",
> +		.data = &mcp9985_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9985d",
> +		.data = &mcp9985d_chip_config,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mcp9982_of_match);
> +
> +static struct i2c_driver mcp9982_driver = {
> +	.driver	 = {
> +		.name = "mcp9982",
> +		.of_match_table = mcp9982_of_match,
> +	},
> +	.probe = mcp9982_probe,
> +	.id_table = mcp9982_id,
> +};
> +module_i2c_driver(mcp9982_driver);
> +
> +MODULE_AUTHOR("Victor Duicu <victor.duicu@microchip.com>");
> +MODULE_DESCRIPTION("MCP998X/33 and MCP998XD/33D Multichannel Automotive Temperature Monitor Driver");
> +MODULE_LICENSE("GPL");
