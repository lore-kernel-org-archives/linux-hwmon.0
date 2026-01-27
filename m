Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70D1FDE31
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 20:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545529; cv=none; b=uO+4OLw4y3LAJVPBLKMsxOrqKaA9Gsq60yjpJ7aSyTJUTwC7RNQBDhWAyaXwgpAVS9l/8he/eQG0iBy12gqRUlU4BLlJD2wI7CctHsLEpv9i7X6eXLF9Y8FhhulyVgFi9AUOxmAADPbL3UMIPcjNBHslahtumvyYNRp6Ds8Z5J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545529; c=relaxed/simple;
	bh=7Oexpvje7lwUA6dXg867NaeVzGOnEnTcBdtFNJokjTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjlFt2hmA6xECq2xlonvZ/5QmYbuzO+w7G1vjqLvGRk8dxguvYUbi9iNdjo1ZnPs9RSe2rwzW95VNEe3CKmR9x3KkZMQXYwb3Fdd/1RX3EOajpcJRpF3x50YdTfQ1gxfUUo+lJ5wZGLdhvNbRo+Q4WuMd+LKvEyXP41p5zc0UKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DChmLGnl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DChmLGnl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f4e36512aso5986620b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 12:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769545526; x=1770150326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vj17Dvif59qDRuYtZXfkx3A5ggvCnYnA/Y4OjdT3fA=;
        b=DChmLGnlIFWedPkWOybrANFQIRTTK/6mcNNBXQobFJnwch+adOIeLZzqNgW1CSnBz9
         1J1saXy4vugx6jk/Ez603rtFPNYQUD9uVGKaBHfI4HFL2f964dE0IJlKtWpfE678+ukK
         P7LoB1SaGGldNIKrEgtCHmv9fQRJLgIoX4Er/eN6Kby03q08evQI7NOv7jXflLD+4YV9
         Qod6HqZnB1x9/MUiLYDLiISVIetU8X8XOmCiNG5aQiUmQditkKNkXMlhONPYYxlg++5n
         g07i32iOnBTYMBpCesNiXvHeA+tH0uTVwcwU3rZzCWVXJUzi3PXwxo8TBMfoNS6W+ELm
         ghrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769545526; x=1770150326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Vj17Dvif59qDRuYtZXfkx3A5ggvCnYnA/Y4OjdT3fA=;
        b=fRE+aqVFjMZvtuVC/ki58RHJhfMpvDl/ntSaeQd47ZL+aW3ZXY9OTWL2rSk7ks1+gW
         ed1JQCJwSYFJImiIGMPgCBlEY9TdsR4/khj2DbqR2dYPS7/LiXzfywIR+UBbTKERglxW
         wmbvGqup/Hk6m3YDX2i0ULw2KsiceRkitQYrSKDQEZQ1zPD+uKJtyKg6FDZjlx2czIef
         V0zp5v/7s5ojFXilddYZbIk/5Me4wnFul5DQLOXN5dPtt5bFmh6r28Ypck2i53bVMjnn
         6DerB8wvM9xHEgx2vZV4iDqDzODJpDjcpyZrSRxCVi3x9zI9+MTzSt6+DZKsSZ0JBez/
         5jUw==
X-Forwarded-Encrypted: i=1; AJvYcCXzNpMDM8ibQwDLGNby9kRSxu5L+39L4+WkjzNLKnjXsNm+jb73f5biuOkRMLUnSPzGF7exhRI9+SlZEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMJGBpFAVJLjFDsywlJznG9gsmas9ueixU9G+kF0w8Etne0FN
	7JhS+KZ2RxPQNsVrswDcIlvaqrPKwsnqCsCFw80WDbih6HrHq46y+GUcBfMEkXl6
X-Gm-Gg: AZuq6aKJaWb+N9W6g+8VskbgmVC+UH3C+0WL/VhNR+AcLiOMMJW+09liqddGEUWwK1J
	9HpTpRbvQQTx34ADG9NNr4ZTDR1lw8z9gr5fHi40grb57uFSv8QiPuYEc83QnUhJ0SH9Uh0ApAq
	na824fsGdxLeG9forNbGNlm98R+3+Z+7L2e1XkQAZOWBi8RdOAbcFK1EDTmfKPrIGwAZhbLGqA2
	kBBmZewzsYXs7jw//A9Dbvvaj4MimXm1FWqrnfZLoD2kRiKrTitZHGD6XxN7xKFJQX5v3j8xQfS
	iWo4nz3A1L0fzV6vh2zCNEo1eRjqpZss6vHGnJXlmDqiqAmuGaHv/KYcDdh3dauvr90mA2jCEiN
	bZdCpvZJn728CpGQ7s4NpH9J44QUCXVho97XLzXP9JIDU8r1Ccj9h+nEicxTrO/GQ+GJsxLmS6K
	2z4LOsDa7C30QhPgdHYk1rE/MUkzkqF4sbI0tQARnwhKs2BKYAM0LKUyNmJn4b
X-Received: by 2002:a05:6a20:cfaf:b0:35d:d477:a7e6 with SMTP id adf61e73a8af0-38ec6248f44mr2391904637.13.1769539888144;
        Tue, 27 Jan 2026 10:51:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276efb16sm147374a12.4.2026.01.27.10.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:51:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <491bd9ec-d6b7-4f1a-877b-67ffbc658ba8@roeck-us.net>
Date: Tue, 27 Jan 2026 10:51:26 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
To: victor.duicu@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net
Cc: marius.cristea@microchip.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-3-victor.duicu@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260127151823.9728-3-victor.duicu@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/27/26 07:18, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---
>   Documentation/hwmon/index.rst   |    1 +
>   Documentation/hwmon/mcp9982.rst |  105 ++++
>   MAINTAINERS                     |    2 +
>   drivers/hwmon/Kconfig           |   11 +
>   drivers/hwmon/Makefile          |    1 +
>   drivers/hwmon/mcp9982.c         | 1022 +++++++++++++++++++++++++++++++
>   6 files changed, 1142 insertions(+)
>   create mode 100644 Documentation/hwmon/mcp9982.rst
>   create mode 100644 drivers/hwmon/mcp9982.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..b02709fc216e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -173,6 +173,7 @@ Hardware Monitoring Kernel Drivers
>      mc33xs2410_hwmon
>      mc34vr500
>      mcp3021
> +   mcp9982
>      menf21bmc
>      mlxreg-fan
>      mp2856
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
>   L:	linux-hwmon@vger.kernel.org
>   S:	Supported
>   F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
> +F:	Documentation/hwmon/mcp9982.rst
> +F:	drivers/hwmon/mcp9982.c
>   
>   MICROCHIP MMC/SD/SDIO MCI DRIVER
>   M:	Aubin Constans <aubin.constans@microchip.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..c758ab2d5fdf 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1388,6 +1388,17 @@ config SENSORS_MCP3021
>   	  This driver can also be built as a module. If so, the module
>   	  will be called mcp3021.
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
>   config SENSORS_MLXREG_FAN
>   	tristate "Mellanox FAN driver"
>   	depends on MELLANOX_PLATFORM
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1bde..cec33da29a68 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -170,6 +170,7 @@ obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>   obj-$(CONFIG_SENSORS_MC33XS2410) += mc33xs2410_hwmon.o
>   obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>   obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
> +obj-$(CONFIG_SENSORS_MCP9982)	+= mcp9982.o
>   obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>   obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
>   obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
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
> +		ret = regmap_read(priv->regmap, address, &reg_high);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(priv->regmap, address + 1, &reg_low);
> +		if (ret)
> +			return ret;
> +
Consider using regmap_bulk_read().

> +		reg_high = reg_high & 0xFF;
> +		reg_low = reg_low & 0xFF;

The masks seem pointless. Same pretty much everywhere. If not, provide explanation
why they are needed ("I don't trust regmap" is not a reason).

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

According to the datasheet, the actual conversion time is always 25 ms per channel,
and does not depend on the conversion interval.

Even if it the conversion time would depend on the conversion interval, forcing
the driver to wait until the next conversion is complete seems excessive. Why wait
and not just return the previous value like literally every other hardware
monitoring driver ?

If all this complexity is indeed required (I don't see it in the datasheet),
please provide a detailed explanation.

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

Same as above. The actual conversion time is constant. Why force the driver
to wait up to 16 seconds ?

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

Consider using regmap_bulk_read().

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

What is the mask for ? The chip registers are 8 bit wide.

> +			*val = clamp_val(*val, -64000, 191875);

Clamping on reads is highly unusual. Why is this needed ?

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

