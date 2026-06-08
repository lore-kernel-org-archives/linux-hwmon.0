Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829BB330D4C
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 17:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938233; cv=none; b=ILaCRnPPru2e7K9sVPf4Qkui3dQskzvEQrGGnelR7y8VGDvnEi+W5Dk5vdPmYTF0uEc7vjJr8voXH5E8d8G8Y0JpWEYFSXTq9yvO07cQoXNCAbYCGCaBhgI3zN1mCFfa7k+/6Ob8/o6Dj2obwevwgqDn9eQLdSniyni9aKyjHAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938233; c=relaxed/simple;
	bh=YYW2RoYXEYAOK1mCYPxzscdvkgoSUkZVJpszFpMO2GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjzkLrftV7MEB3t9Xl4rvON4i3++VHyB+Omzmi8bllqFT3eDDwFo5OAszkeJ+EjjNKmbGlnajDB0kftxYWALm3MTC6+Uj14TDxg9fx9NIWP3xUk2UwHsrTao+b0uVSQ0jij69ENHh5VKc6T+3l8L9kfyaNmZ2zCQ3tuJ7awrB0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/TD7Sb4; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/TD7Sb4"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso8142631eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780938231; x=1781543031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=E0XM//N+d5pSuxJ9P8F/TyQWRalQCCYsnNO2V1rSMvc=;
        b=s/TD7Sb4wJCsvuUD3rIIk+IJfyNFuulQcd3VXSUjLU765ryrMDFvHROQuUp7JZwGVU
         nYpSs2pgsIwzgbHC5DoPAzOWWnLlfJAklkYWd5hTmDrPUUT/FtcGjoan7PprQIx3tEjm
         WsBvR6w7WfpW8LxrgFU4JDRZWGbGrSyx3ygNICjp9ym/NNJeCAiobjF79wD+JanyMgir
         WUyg0vISgUWI8Vr4k70zoKKkx1T9KLeBSDXibYvh08R3KJ8SBt2HnHbMg9Exhsc6GU96
         vlNM6vy9geJIJV1QfCSToCAdwJ8hfycF0z5HYV4BBFu2lbZJbi+CnnI6F11p1Y1hZDe5
         tCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938231; x=1781543031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0XM//N+d5pSuxJ9P8F/TyQWRalQCCYsnNO2V1rSMvc=;
        b=nbT2KWrXXo7WBGdXE+5AIgIUGQ1LzGXT/cuGoZDbH6txl3/qXS27yKCKWDzm7bqErG
         0MIAZwLx9CQ9no6D50v6LZz/Y196eTZs5FfkjVWQaBega2Dy61tzI8k2ZGJ7k+HmX1/z
         pYQ3GpMz0nfcCcqefk5RSgf6rS7VIgUUYkajSombppNgQMJedfRx8Eo14ZdSL4EjFULI
         sAwTLrMZPJW4WXN/NGey9fAjF8fOd1JmTb/kngcoSiiWGy48dKTfFutfSrYNoAvQVeYG
         gPI0OsVmwmVhGTn6li2XA9pLKB8BszDcQmnKFvr4mvLBm5RcygErYRAii0AZuLNiaPGb
         2LuA==
X-Forwarded-Encrypted: i=1; AFNElJ8DLuzM73fFS7FS94uZ2xn/SFIlEiNDoweGmuESz/E94jrQwtk3Cqjxw3Xmt7ZDLT4Kqd6UuWLNkq/Dag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9N9oOXPUQopWMgXPz2F1MOVsw9oBDIg1A2KFils3xsz+7BT9
	l/fAn9bvd7EcjZZi74sWbcDyItDYjG61/3zMKv6o90CrzodDeSbukIlG
X-Gm-Gg: Acq92OGtULzA6LE9YQQlU8rdyZT33p3VcmIl3e7mu3gXab2FjpnQEkfmOtfr08ZR2LX
	W6jyl33CGvRJjbz0YH1WsG0ThV5fMBRCFHXxNRrPhVhxJaiNMqj7J8d5Ws0tue3m2ETZZk87jDl
	RyVyTS41Wdiro7v4jugGFUsE7j+Ud/iYXxka+YsPxYvGTk6eXE9j7h/ZhxJdyKire3bSNM+dzq5
	p/3A+BdowBCyTQ8bh6Rzds1RXgVQRGgegil+PGgrWFGyFJiZDXBf+rZ4r1z8sZ+FR+kua3KTCMV
	NL+XXcASofnYzD7bIkqoQHI+Ov0V51sk8mW0CV/w0pEHgHZwFMK+lSvV1sKtZJk2dSXCWLdMzjX
	XGZoB5+U9OkeAL2zU2JK4ZLTZTntjKL9lEihPx65wx3sGNEBj3L86BoeWO02swUW4mHaF7krsOL
	HGyZCIrUubpMn7I1Tg4AiCDf0u3HNHUvgOvnlPc57+BUANWnWuBdZanrqJoxLRq1cwU/pJp8K0O
	KdodqOCiWKjBVfoNX3miA==
X-Received: by 2002:a05:7300:3216:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-3077af39140mr9150935eec.8.1780938230264;
        Mon, 08 Jun 2026 10:03:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm22473601eec.13.2026.06.08.10.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:03:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd92d7c9-9594-47b9-bd84-a6bd5ebae66d@roeck-us.net>
Date: Mon, 8 Jun 2026 10:03:48 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
To: Conor Dooley <conor@kernel.org>, linux-hwmon@vger.kernel.org
Cc: Lars Randers <lranders@mail.dk>, Conor Dooley
 <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Valentina.FernandezAlanis@microchip.com
References: <20260603-ongoing-brunette-51e35be6d93e@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260603-ongoing-brunette-51e35be6d93e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 06:19, Conor Dooley wrote:
> From: Lars Randers <lranders@mail.dk>
> 
> Add a driver for the temperature and voltage sensors on PolarFire SoC.
> The temperature reports how hot the die is, and the voltages are the
> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> 
> The hardware supports alarms in theory, but there is an erratum that
> prevents clearing them once triggered, so no support is added for them.
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

Comments inline.

Thanks,
Guenter


> ---
> 
> v2:
> - Fix some minor things pointed out by Sashiko including inaccurate
>    comments, bounds checking of values read from sysfs and Kconfig
>    dependencies.
> - Make update_interval use milliseconds instead of microseconds
>    (I'll add update_interval_us support when that lands, there's a
>    proposed workaround for the erratum circulating internally, so it'll
>    probably come alongside alarm support).
> 
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
>   Documentation/hwmon/index.rst    |   1 +
>   Documentation/hwmon/tvs-mpfs.rst |  53 +++++
>   MAINTAINERS                      |   1 +
>   drivers/hwmon/Kconfig            |  13 +
>   drivers/hwmon/Makefile           |   1 +
>   drivers/hwmon/tvs-mpfs.c         | 394 +++++++++++++++++++++++++++++++
>   6 files changed, 463 insertions(+)
>   create mode 100644 Documentation/hwmon/tvs-mpfs.rst
>   create mode 100644 drivers/hwmon/tvs-mpfs.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8b655e5d6b68..84a5339e1d6f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -262,6 +262,7 @@ Hardware Monitoring Kernel Drivers
>      tps53679
>      tps546d24
>      tsc1641
> +   tvs-mpfs
>      twl4030-madc-hwmon
>      ucd9000
>      ucd9200
> diff --git a/Documentation/hwmon/tvs-mpfs.rst b/Documentation/hwmon/tvs-mpfs.rst
> new file mode 100644
> index 000000000000..ff445844d07c
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
> +update_interval has a permitted range of 0 to 8.
> +
> +

It might make sense to document what "0" means.

Temperatures are read in millidegrees Celsius, but the hardware measures in
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
>   F:	drivers/clk/microchip/clk-mpfs*.c
>   F:	drivers/firmware/microchip/mpfs-auto-update.c
>   F:	drivers/gpio/gpio-mpfs.c
> +F:	drivers/hwmon/tvs-mpfs.c
>   F:	drivers/i2c/busses/i2c-microchip-corei2c.c
>   F:	drivers/mailbox/mailbox-mpfs.c
>   F:	drivers/pci/controller/plda/pcie-microchip-host.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 14e4cea48acc..2b9622b1db95 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -930,6 +930,19 @@ config SENSORS_JC42
>   	  This driver can also be built as a module. If so, the module
>   	  will be called jc42.
>   
> +config SENSORS_POLARFIRE_SOC_TVS
> +	tristate "PolarFire SoC (MPFS) temperature and voltage sensor"
> +	depends on POLARFIRE_SOC_SYSCONS || COMPILE_TEST
> +	depends on MFD_SYSCON
> +	help
> +	  This driver adds support for the PolarFire SoC (MPFS) Temperature and
> +	  Voltage Sensor.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called tvs-mpfs.
> +
> +	  If unsure, say N.
> +
>   config SENSORS_POWERZ
>   	tristate "ChargerLAB POWER-Z USB-C tester"
>   	depends on USB
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 4788996aa137..b58d249e4cf4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -194,6 +194,7 @@ obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
>   obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
>   obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
>   obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
> +obj-$(CONFIG_SENSORS_POLARFIRE_SOC_TVS)  += tvs-mpfs.o
>   obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
>   obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>   obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
> diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> new file mode 100644
> index 000000000000..f086f178b4ba
> --- /dev/null
> +++ b/drivers/hwmon/tvs-mpfs.c
> @@ -0,0 +1,394 @@
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
> + * sign bit and a lower 3 bits of decimal. These masks discard the sign bit and
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
> +/* 273.1875 in 11.4 fixed-point notation */
> +#define MPFS_TVS_K_TO_C 0x1113
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
> +		if (val > 1 || val < 0)
> +			return -EINVAL;
> +

Range check should happen only once. The -EOPNOTSUPP
is theoretic (channel is always valid), so duplicating
the range check to handle that theoretic case does not add value.

> +		tmp = FIELD_PREP(MPFS_TVS_CTRL_V2P5_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V2P5_ENABLE, tmp);
> +		break;
> +	case SENSOR_V1P8:
> +		if (val > 1 || val < 0)
> +			return -EINVAL;
> +
> +		tmp = FIELD_PREP(MPFS_TVS_CTRL_V1P8_ENABLE, val);
> +		regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +				   MPFS_TVS_CTRL_V1P8_ENABLE, tmp);
> +		break;
> +	case SENSOR_V1P05:
> +		if (val > 1 || val < 0)
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
"Invalid argument" can not be correct for data read from the chip.
I don't know what this means. It should be either -ENODATA (no data available)
if this is transient or -EIO (I/O error) if it is a permanent problem.
The same applies to other validation checks.

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
> +	if (val > 1 || val < 0)
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
> +	*val = FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
> +	*val *= MPFS_TVS_INTERVAL_SCALE;
> +	*val /= 1000;
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
> +	temp *= 1000;

This is likely to result in overflow issues (for example if val == LONG_MAX).

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

Hardware monitoring drivers should use clamp() and not return -EINVAL
for ranges such as this. Since the valid range (in ms) is 0..8, I would
suggest to clamp val to (0, 8) before any calculations to also avoid
the overflow issue mentioned above. That makes me wonder: What does "0"
stand for ? 32 us or 0 us ? It does not make a difference here, but it
may be relevant when microsecond intervals are implemented.

> +
> +	temp <<= MPFS_TVS_INTERVAL_OFFSET;
> +	regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
> +			   MPFS_TVS_INTERVAL_MASK, temp);

If regmap never returns errors this needs to be documented in the driver.

> +
> +	return 0;
> +}
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
> +	regmap_write(data->regmap, MPFS_TVS_CTRL, MPFS_TVS_CTRL_ENABLE_ALL);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "mpfs_tvs",
> +							 data,
> +							 &mpfs_tvs_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
> +				     "hwmon device registration failed.\n");
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

