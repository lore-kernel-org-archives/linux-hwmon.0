Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8C191
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147920; cv=none; b=BVEfsKYAoHflIrR0l36osvKIiDBm57hTgMXKW4sdjV0ZG8HaRTcUK42c/7EZBlwWl1yaOPTVD1mK32pPskJtwz0DrPSjKOB9KTNRlEBZJ0NfxPlrtf0r+Fyz53VC+9Hb1b+8+EJoUjbo+8NcD975wUHZBKXgsgUzT/Wx5ix5bUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147920; c=relaxed/simple;
	bh=NtjbdCrD6/ThU+GAgvHr+eI0fXP0tqDA5BrSYr2+m0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZyhXev52aJLmLRJAHcq8TRjCaMuHga4SuQ001wV+i9sHFUwGPSulJan95Z0Q1Ovas+lIOG13S0zt6eCrCnos/nkmheofIXLKPvw6wb7bSTE70XW1/HrPRwBDnf+LsbuPeWOYP9MgrgjLrw0OvyFefNFX1h1j4dt69aWK04v1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wkw0mHsg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wkw0mHsg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8220bd582ddso3589608b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770147917; x=1770752717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyUtRqxb++BvA5dLyce8+gkqRoos/DmqS+pMAL1s9g0=;
        b=Wkw0mHsg57PMFJRBAgmfMEvrFEnnGQW3h5n847i9arSkEGaij1GdoEZoyKaSuRbs+i
         1/Bbg/vQK83nD1+/weDcDlBGtn1zgJWNDodwnRjtwe/6Qb8w70Mr5Wi9sap7TADKi0mA
         eXRxlXNVGymFSBZMkZsWutSAF2Ne+PRYbYB+S/MqASrqZJj3pnHx3KHhlr9lXthj2fjT
         YHzzAI0tQIB7zDP+eXMFYJ1QWUqOIWpVUcC+12wg207cH204h8O8Xy9nSyoKOP+ZvZeT
         NCMi17oTtcMq5aJi845WbjvHmywe5/asllxv0XtG4DIIov1ZK29jJHjy8tt+U3QdQ1Gz
         uwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770147917; x=1770752717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyUtRqxb++BvA5dLyce8+gkqRoos/DmqS+pMAL1s9g0=;
        b=rUcDkSqiHzjPomGfKTdBDEO8dytoMxw2uC2w8kGY4ClNKSLG8Da4dy9m42W9rPwsBk
         zDKoI4JquESXNsBfJj753zed6hfq0znWrLioxNvAvliMK69m5GuIab9HV0lHGh+D86vX
         ATf0JGq4GQyPDWzy/VM5FfuH0qIy9dC/sQu7RLIY4gIq4lRCn76zkBhUsTvZfFRiYY5y
         KPiPSlvrkhuuvkHPSOLQJnMRrDcvcIouLnVESHfISxgas/VF1d586kV6DMvayN01bmMm
         gDrDtF1A5dlVC8CL3DkvncXG4iIQAlnhAQG6xoYW2XSAj6Sl7C1v04zbkykGIDJGA1Gn
         fXMg==
X-Forwarded-Encrypted: i=1; AJvYcCUUP3BdC/Jl8njRKy6cBNVpuk4TfRy1HHMudlDstyh0RXmXk3H+mKQVVX4fRPG0GQM9oS8c7dMqJ0c+yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymAIxM+uELPUQTnfaO6bWtTgwfrz3UICctr2wwPPPJi4RlcU+v
	8ZxyQ8zcNDOH4Zg1JweDOq+SgKkZ+EgiMzLoUaiZINA7QdoyG1z8+/wJ
X-Gm-Gg: AZuq6aJUTUwP4ccj5/WWa35hnTRUjgabiAsk9ZEPfyQj/8eLekWcVMHYVzpnSKK+YTw
	OVqcecqkbDSmz25If0v6YriIMb11cEY/PgkZZXIIGQzKLaOfljHYHj6yShqRX/ByAyEFgaqmgI9
	bNmeWxvzLs7IiU4LkPR3GEiA4IbpeFuM3mnXK5x+QiGEdG6DkBbBJct3XPbWte8dxSdTKmad6rI
	tHaHun2VVqRk6GnsuvRSHxZr6WPNAxf0fjmI+7tsa6r38giyTOm2s3fVV+9qo0TnQJKAV+/HWBp
	/8GqYo+DUbJcw61d0Pzix/75mg8T2Uf+TOK0PVnLYnK5Ma3rj7Jp4TG326BBfhC0SK0DSJCgXUH
	h+0SXw1CkdIvorkc+Px+j1rKyoUgJNsJ9kOayF2PshYabRK818/i6aRlRaGwgYsU2GUFo5uZ9r8
	SQE3BgNPbpd4XDU48uq4vC8B6l
X-Received: by 2002:a05:6a21:7a82:b0:36c:2cf5:9b06 with SMTP id adf61e73a8af0-393724cd042mr505803637.79.1770147916574;
        Tue, 03 Feb 2026 11:45:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1e55b8sm210622b3a.30.2026.02.03.11.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:45:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Feb 2026 11:45:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: victor.duicu@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marius.cristea@microchip.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
Message-ID: <1aefa888-fdf2-4ffb-8cd4-5008908673b5@roeck-us.net>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127151823.9728-3-victor.duicu@microchip.com>

On Tue, Jan 27, 2026 at 05:18:22PM +0200, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

I ran the patch through an AI code review. Findings (some already reported) inline,
plus some additional feedback from me.

> ---
>  Documentation/hwmon/index.rst   |    1 +
>  Documentation/hwmon/mcp9982.rst |  105 ++++
>  MAINTAINERS                     |    2 +
>  drivers/hwmon/Kconfig           |   11 +
>  drivers/hwmon/Makefile          |    1 +
>  drivers/hwmon/mcp9982.c         | 1022 +++++++++++++++++++++++++++++++
>  6 files changed, 1142 insertions(+)
>  create mode 100644 Documentation/hwmon/mcp9982.rst
>  create mode 100644 drivers/hwmon/mcp9982.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..b02709fc216e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -173,6 +173,7 @@ Hardware Monitoring Kernel Drivers
>     mc33xs2410_hwmon
>     mc34vr500
>     mcp3021
> +   mcp9982
>     menf21bmc
>     mlxreg-fan
>     mp2856
> diff --git a/Documentation/hwmon/mcp9982.rst b/Documentation/hwmon/mcp9982.rst
> new file mode 100644
> index 000000000000..dee2947f9044
> --- /dev/null
> +++ b/Documentation/hwmon/mcp9982.rst
> @@ -0,0 +1,105 @@
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
> +Each channel has a minimum, maximum, and critical limit alongside associated alarms.
> +The chips also implement a hysteresis mechanism which applies only to the maximum
> +and critical limits. The relative difference between a limit and its hysteresis
> +is the same for both and the value is kept in a single register.
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
> +Among the hysteresis attributes, only the tempX_crit_hyst ones are writeable
> +while the others are read only. Setting tempX_crit_hyst writes the difference
> +between tempX_crit and tempX_crit_hyst in the hysteresis register. The new value
> +applies automatically  to the other limits. At power up the device starts with
> +the value 10 in the hysteresis register.
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
> +temp[1-5]_crit_hyst	Critical temperature limit hysteresis.
> +
> +temp[1-5]_max		High temperature limit.
> +temp[1-5]_max_alarm	High temperature limit alarm.
> +temp[1-5]_max_hyst	High temperature limit hysteresis.
> +
> +temp[1-5]_min		Low temperature limit.
> +temp[1-5]_min_alarm	Low temperature limit alarm.
> +
> +update_interval		The interval at which the chip will update readings.
> +======================= ==================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f88d837cb586..c39ab12b6bc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17154,6 +17154,8 @@ M:	Victor Duicu <victor.duicu@microchip.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> +F:	Documentation/hwmon/mcp9982.rst
> +F:	drivers/hwmon/mcp9982.c
>  
>  MICROCHIP MMC/SD/SDIO MCI DRIVER
>  M:	Aubin Constans <aubin.constans@microchip.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..c758ab2d5fdf 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1388,6 +1388,17 @@ config SENSORS_MCP3021
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
> index eade8e3b1bde..cec33da29a68 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -170,6 +170,7 @@ obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>  obj-$(CONFIG_SENSORS_MC33XS2410) += mc33xs2410_hwmon.o
>  obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>  obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
> +obj-$(CONFIG_SENSORS_MCP9982)	+= mcp9982.o
>  obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>  obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
>  obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
> diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
> new file mode 100644
> index 000000000000..55701655daa0
> --- /dev/null
> +++ b/drivers/hwmon/mcp9982.c
> @@ -0,0 +1,1022 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * HWMON driver for MCP998X/33 and MCP998XD/33D Multichannel Automotive
> + * Temperature Monitor Family
> + *
> + * Copyright (C) 2026 Microchip Technology Inc. and its subsidiaries
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
> +#include <linux/byteorder/generic.h>
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
> +#include <linux/util_macros.h>
> +
> +/* MCP9982 Registers */
> +#define MCP9982_HIGH_BYTE_ADDR(index)		(2 * (index))
> +#define MCP9982_ONE_SHOT_ADDR			0x0A
> +#define MCP9982_INTERNAL_HIGH_LIMIT_ADDR	0x0B
> +#define MCP9982_INTERNAL_LOW_LIMIT_ADDR		0x0C
> +#define MCP9982_EXT_HIGH_LIMIT_ADDR(index)	(4 * ((index) - 1) + 0x0D)
> +#define MCP9982_EXT_LOW_LIMIT_ADDR(index)	(4 * ((index) - 1) + 0x0F)
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
> +#define MCP9982_WAKE_UP_TIME_US			125000
> +#define MCP9982_WAKE_UP_TIME_MAX_US		130000
> +#define MCP9982_TIMER_BUFFER_US			10000
> +#define MCP9982_CONVERSION_TIME_MS		125
> +#define MCP9982_HIGH_LIMIT_DEFAULT		21000
> +#define MCP9982_LOW_LIMIT_DEFAULT		0
> +
> +static const struct hwmon_channel_info * const mcp9985_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
> +			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> +			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> +			   HWMON_T_CRIT_HYST),
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
> +	.max_register = MCP9982_EXT_IDEAL_ADDR(4),
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
> +	unsigned int limit, reg_high, reg_low;
> +	int ret;
> +
> +	switch (address) {
> +	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
> +	case MCP9982_THERM_LIMIT_ADDR(0):
> +	case MCP9982_THERM_LIMIT_ADDR(1):
> +	case MCP9982_THERM_LIMIT_ADDR(2):
> +	case MCP9982_THERM_LIMIT_ADDR(3):
> +	case MCP9982_THERM_LIMIT_ADDR(4):
> +		ret = regmap_read(priv->regmap, address, &limit);
> +		if (ret)
> +			return ret;
> +
> +		*val = limit & 0xFF;
> +		*val = (*val - MCP9982_OFFSET) * 1000;
> +
> +		return 0;
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(1):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(2):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(3):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(4):
> +		/*
> +		 * The register address determines whether a single byte or
> +		 * multiple byte (block) operation is run. For a single byte
> +		 * operation, the MSB of the register address is set to "0".
> +		 * For a multiple byte operation, it is set to "1". The addresses
> +		 * quoted in the register map and throughout the data sheet assume
> +		 * single byte operation. For multiple byte operations, the user
> +		 * must set the MSB of each register address to "1".
> +		 */

The above comment is confusing and doesn't seem to provide a useful purpose,
or at least none that I can see.

> +		ret = regmap_read(priv->regmap, address, &reg_high);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(priv->regmap, address + 1, &reg_low);
> +		if (ret)
> +			return ret;
> +

> +		reg_high = reg_high & 0xFF;
> +		reg_low = reg_low & 0xFF;
> +		*val = ((reg_high << 8) + reg_low) >> 5;
> +		*val = (*val - (MCP9982_OFFSET << 3)) * 125;
> +
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			long *val)
> +{
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +	unsigned int reg_status, reg_high, reg_low;
> +	unsigned long sleep_time;
> +	int ret, hyst;
> +	u8 addr;
> +
> +	/*
> +	 * When working in Run mode, after modifying a parameter (like update
> +	 * interval) we have to wait a delay before reading the new values.
> +	 * We can't determine when the conversion is done based on the BUSY bit.
> +	 */
> +	if (priv->run_state) {
> +		if (priv->wait_before_read) {
> +			sleep_time = jiffies_to_msecs(priv->time_limit - jiffies) * USEC_PER_MSEC;
> +			if (!time_after(jiffies, priv->time_limit))
> +				usleep_range(sleep_time, sleep_time + MCP9982_TIMER_BUFFER_US);
> +

AI: Could this result in excessive delays when the update interval is set to its
maximum value (16 seconds)?  It appears this would block sysfs reads for a
significant amount of time.

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
> +		sleep_time = mcp9982_update_interval[priv->interval_idx] * USEC_PER_MSEC;
> +		usleep_range(MCP9982_WAKE_UP_TIME_US, MCP9982_WAKE_UP_TIME_MAX_US);
> +
> +		ret = regmap_read_poll_timeout(priv->regmap, MCP9982_STATUS_ADDR,
> +					       reg_status, !(reg_status & MCP9982_STATUS_BUSY),
> +					       sleep_time, sleep_time * 2);

AI: Similarly, using the update interval as the sleep time for polling a one-shot
conversion seems like it could lead to 16-second blocks if mcp9982_read() is
called in Standby mode with a slow update interval configured.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			/*
> +			 * The chips support block reading only on the temperature and
> +			 * status memory blocks. The driver uses only individual read commands.
> +			 */
> +			ret = regmap_read(priv->regmap, MCP9982_HIGH_BYTE_ADDR(channel), &reg_high);
> +			if (ret)
> +				return ret;
> +
> +			ret = regmap_read(priv->regmap, MCP9982_HIGH_BYTE_ADDR(channel) + 1,
> +					  &reg_low);
> +			if (ret)
> +				return ret;
> +
> +			*val = ((reg_high << 8) + reg_low) >> 5;
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
> +			*val = regmap_test_bits(priv->regmap, MCP9982_HIGH_LIMIT_STATUS_ADDR,
> +						BIT(channel));
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_max_hyst:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +			ret = mcp9982_read_limit(priv, addr, val);
> +			if (ret)
> +				return ret;
> +
> +			ret = regmap_read(priv->regmap, MCP9982_HYS_ADDR, &hyst);
> +			if (ret)
> +				return ret;
> +
> +			*val -= (hyst & 0xFF) * 1000;
> +			*val = clamp_val(*val, -64000, 191875);
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
> +			*val = regmap_test_bits(priv->regmap, MCP9982_LOW_LIMIT_STATUS_ADDR,
> +						BIT(channel));
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_crit:
> +			return mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
> +		case hwmon_temp_crit_alarm:
> +			*val = regmap_test_bits(priv->regmap, MCP9982_THERM_LIMIT_STATUS_ADDR,
> +						BIT(channel));
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_crit_hyst:
> +			ret = mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
> +			if (ret)
> +				return ret;
> +
> +			ret = regmap_read(priv->regmap, MCP9982_HYS_ADDR, &hyst);
> +			if (ret)
> +				return ret;
> +
> +			*val -= (hyst & 0xFF) * 1000;
> +			*val = clamp_val(*val, -64000, 191875);
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
> +			*str = priv->labels[channel];
> +			return 0;
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
> +	case MCP9982_THERM_LIMIT_ADDR(0):
> +	case MCP9982_THERM_LIMIT_ADDR(1):
> +	case MCP9982_THERM_LIMIT_ADDR(2):
> +	case MCP9982_THERM_LIMIT_ADDR(3):
> +	case MCP9982_THERM_LIMIT_ADDR(4):
> +		val = val >> 8;
> +		val = val & 0xFF;
> +		ret = regmap_write(priv->regmap, address, val);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(1):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(2):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(3):
> +	case MCP9982_EXT_HIGH_LIMIT_ADDR(4):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(1):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(2):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(3):
> +	case MCP9982_EXT_LOW_LIMIT_ADDR(4):
> +		val = cpu_to_be16(val);
> +		ret = regmap_bulk_write(priv->regmap, address, &val, 2);

AI:

Does this code work correctly on Big Endian systems?  Passing the address of
the 'long val' to regmap_bulk_write() after storing a be16 value in it appears
problematic, as regmap_bulk_write() will read from the beginning of the
variable.

Second feedback:

This is incorrect for several reasons:
- 'val' is a long (8 bytes on many systems), but the code passes its
  address to regmap_bulk_write() for a 2-byte write.
- cpu_to_be16(val) returns a u16. Assigning this back to the 'long val'
  and then taking its address results in different data being sent
  depending on the host's endianness. On a Little Endian system, the
  u16 will be stored in the first two bytes of the long, and
  regmap_bulk_write() will send them in Little Endian order to the bus,
  effectively nullifying the cpu_to_be16() conversion.
A local u16 or __be16 variable should be used instead:
    __be16 reg_val = cpu_to_be16(val);
    ret = regmap_bulk_write(priv->regmap, address | 0x80, &reg_val, 2);

Third feedback:

The address variable does not have the MSB set (e.g., for
MCP9982_EXT_HIGH_LIMIT_ADDR(1), it is 0x0D). Based on the datasheet
description provided in the comment, this should likely be
(address | 0x80).

> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mcp9982_write_hyst(struct mcp9982_priv *priv, int channel, long val)
> +{
> +	int hyst, ret;
> +	int limit;
> +
> +	val = clamp_val(val, -64000, 191875);
> +	val = (val + MCP9982_OFFSET * 1000) << 5;
> +	val = DIV_ROUND_CLOSEST(val, 125);
> +	val = val >> 8;
> +
> +	/* Therm register is 8 bits and so it keeps only the integer part of the temperature. */
> +	ret = regmap_read(priv->regmap, MCP9982_THERM_LIMIT_ADDR(channel), &limit);
> +	if (ret)
> +		return ret;
> +
> +	hyst = clamp_val(limit - val, 0, 255);
> +
> +	ret = regmap_write(priv->regmap, MCP9982_HYS_ADDR, hyst);
> +
> +	return ret;
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
> +		case hwmon_temp_crit_hyst:
> +			return mcp9982_write_hyst(priv, channel, val);
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
> +		case hwmon_temp_max_hyst:
> +		case hwmon_temp_crit_alarm:
> +			return 0444;
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +		case hwmon_temp_crit:
> +		case hwmon_temp_crit_hyst:
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
> +	ret = regmap_write(priv->regmap, MCP9982_ALRT_CFG_ADDR, 0);
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
> +		return dev_err_probe(dev, -EINVAL,
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

AI: Is it safe to pass a pointer to the stack-allocated mcp998x_chip_info to
devm_hwmon_device_register_with_info()?  The hwmon core appears to store this
pointer and uses it in hwmon_thermal_get_temp(), which could lead to a crash
after probe() returns and the stack frame is reclaimed.

Me: Outch. Yes.

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
