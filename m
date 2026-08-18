Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CE309EFC
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787095483; cv=none; b=TSdC+ewiqquYZG2TPfzoPT4C8MYzlWct26Uag7f33p9OI6Dg0n7d25O6i4xLNjIiiimdxc3KJd2Bzz/BEOTi+ruNOz1DT0ngEuSBY33m1CIwkphs65WGEsL+9/ZlXiG/ddpA/VWj2/5FDLiQGKHYkJnKSvYHwgv7TZg13qWTln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787095483; c=relaxed/simple;
	bh=fwOaHEIxfbOSQNfyznSSemppZcyR6wbkV6O9cBpo1Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBtz/V8iIh/xMuum69NR6T1Jl0OL6aZLC6+ju8b28cTNheQ60Lj2i+pgZxcC7rlo8UjZsmDRqErydTkWdjEM9PPai0ViWDAsjBRyq3F1kMcXqLGN0AZ55f/xfWvq6WvaIvKddEJJc95lee7L5l+OyWG0NvcJPTvEDCB1g0f0U78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjR1Z2HR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjR1Z2HR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39266382df6so394859a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787095479; x=1787700279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ba8TPq5OP0/w1Sb+biHueRE6QCVlwEkBtAEi7kwAq40=;
        b=LjR1Z2HRQIicHMo885fOpAs5XR1TpBm91e6Uj4RswqLYkpjC1JXZKZYBNj4bCbpGR7
         VpqTNGMoqzjrMF9e9fQfHlZBFm+HlQ0450xziZRIkAyElCFrwMxD4CiYBqJ7C0UD6EUg
         aBUBBsO3cB1bL+mvPyDgbyhf8xO9c9Y6Li6dDeT/lYa8SFEDYx+x89b4vDsoDKepwO7N
         iQ9XyFp3bEh86KeGhOp46vds7ufkkCTmwea69iZnda5WgiFXCAJ1WpdWSjv+IzxyUqfe
         k7C1XhQgoaEPzHUhGJmWkWN6+hL/hUlHgMh/AnAbP9jd+P0DUSYqkD1H6x8BYnAN6Z8F
         5m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787095479; x=1787700279;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ba8TPq5OP0/w1Sb+biHueRE6QCVlwEkBtAEi7kwAq40=;
        b=SHaIH1IhV/9SkvPZ43rCGQiuPk3DKoUC4mIklqYhx6a5nMQbTrhJiqhDgZXw6587GQ
         lJrJOz0kD82FMK+mzkhzSgrqo8Mqc41dmmv7PIoE3/E0jqa1N/pq2lztmKwmoj+BBUVV
         2irtIQZXgFCr7TRDsmDhaEeA04/lnXG794aOjzBPf3cYX1R7NS68my8s/eIXbbUY4l4l
         TRMYsK1bnyqvZ+YyRWSB+25jUAVCp0OnbVs0joyXXfkR0AczXWvxbcx1SvoGxlRABbgb
         ZK4S5WBdmitlFk7Dc2hC4+i6ig5supfP2wfbyIqqltKGhladdCkVz2RZYh8xGcWhlTD2
         WglA==
X-Gm-Message-State: AOJu0Yz1KZm9LY1os8RwA92C9B9mVMwdKyJFWjY9Y7hYrxfEo4cqecWr
	dkFdN0UFFnPcoKXZ90510u3vkgmE7xovvAwETY9JQESB3tLKS8Fy06N1
X-Gm-Gg: AR+sD1304Q4GAg6cz60+0rbpCKc+h628JhT1r2b2RpGwxRf7V9f1JjkmojxDukBeY2q
	YC1eDytwXTGo4v84Sfg7rfZ99nwTKKvcg2TOW4CNcZXoXiBmLcvvx+9jwtHBpBN55xgxnd/9Q1p
	hkfJW4hEnVcR63nXLLItbqPVDywub0Wz5GSZGTzzdJjogu2BRWuZ1owflhzXh8+JQ5SpCTffPvp
	HvTSXEPSw3dbR5WYppk5DdqxDkBRy0xZ1MC8UxmFw1X5+masisBI2BbPJvEyWo+EAcw7mU5qnU1
	ZNsT5uflwDuukFtwzPCcsK6ENGV7vRmeIZRTCtOLcRE8q1sf61E6PuN5Dpil99pJwHquLrejnxC
	kwQkOLjuhhqv05VQNFsC8wczN6xCBhVcGYoVzczB+6EepxBDbz2WTdYxFlDBt2ERLuW0dx6+4wc
	mKaZUr8qb0DXm8BAG9CZez55N8MKhV1FNir0W/HN6SUeZKMFBPyeivAn4GVJ1UYYbZ8LtWtTtvZ
	h1itCrnuUVbAxCj4bfUxGffcVmhgZsf8ztwgw==
X-Received: by 2002:a17:90b:1f8f:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-39580840520mr918504a91.1.1787095478350;
        Tue, 18 Aug 2026 16:24:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3dd15sm690012c88.2.2026.08.18.16.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 16:24:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5af9d252-df45-4d3f-ae14-648a546ff508@roeck-us.net>
Date: Tue, 18 Aug 2026 16:24:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and
 fan control
To: =?UTF-8?Q?Sebasti=C3=A1n_Peyrott?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260818181345.203295-1-speyrott@gmail.com>
 <20260818181345.203295-2-speyrott@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260818181345.203295-2-speyrott@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/18/26 11:13, Sebastián Peyrott wrote:
> Add a DMI-gated hwmon driver for the embedded controller used by the
> Minisforum UM780 XTX with board revision 1.1 and BIOS 1.06.
> 
> Expose the CPU and system fan control temperatures and tachometers. The
> tachometer protocol returns one byte per OEM command, so serialize
> transactions and use high-low-high sampling to reject torn values.
> 
> Allow selecting either complete OEM CPU fan profile through pwm1_enable and
> changing the two validated system fan transition temperatures through
> standard automatic-curve attributes. Cache coherent settings and restore
> them after the firmware reloads defaults following resume.
> 
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
> ---
>   Documentation/hwmon/index.rst               |   1 +
>   Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
>   MAINTAINERS                                 |   7 +
>   drivers/hwmon/Kconfig                       |  16 +
>   drivers/hwmon/Makefile                      |   1 +
>   drivers/hwmon/minisforum-um780xtx.c         | 509 ++++++++++++++++++++
>   6 files changed, 602 insertions(+)
>   create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
>   create mode 100644 drivers/hwmon/minisforum-um780xtx.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index d979e6d6e9f2..c98cad395455 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -186,6 +186,7 @@ Hardware Monitoring Kernel Drivers
>      mcp3021
>      mcp9982
>      menf21bmc
> +   minisforum-um780xtx
>      mlxreg-fan
>      mp2856
>      mp2869
> diff --git a/Documentation/hwmon/minisforum-um780xtx.rst b/Documentation/hwmon/minisforum-um780xtx.rst
> new file mode 100644
> index 000000000000..ff8d1b2322e1
> --- /dev/null
> +++ b/Documentation/hwmon/minisforum-um780xtx.rst
> @@ -0,0 +1,68 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +====================================
> +Kernel driver minisforum-um780xtx
> +====================================
> +
> +Supported systems:
> +
> +  * Minisforum UM780 XTX
> +
> +    * DMI product name: ``Venus series``
> +    * Mainboard: ``F7BSD``, revision ``1.1``
> +    * BIOS version: ``1.06``
> +
> +Author: Sebastián Peyrott <speyrott@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver exposes hardware monitoring and fan-control data cached by the
> +IT5571E embedded controller. It uses the ACPI EC transport and only binds to
> +the exact system and firmware identity listed above.
> +
> +The two temperature channels are the values used by the EC's fan-control
> +loops. Their physical sensor placement is not known. The CPU channel is the
> +filtered AMD SB-TSI temperature, while the system channel is an external
> +thermistor input.
> +
> +The fan tachometers are read through OEM EC commands. Since each byte is
> +returned by a separate command, the driver uses a high-low-high sequence and
> +retries if the high byte changes.
> +
> +Sysfs entries
> +-------------
> +
> +==========================  ==============================================
> +``temp1_input``             CPU-fan control temperature
> +``temp2_input``             System-fan control temperature
> +``fan1_input``              CPU fan speed in RPM
> +``fan2_input``              System fan speed in RPM
> +``pwm1_enable``             CPU profile: 2 is OEM B1, 3 is OEM B2
> +``pwm2_auto_point1_temp``   Off-to-low system-fan transition temperature
> +``pwm2_auto_point2_temp``   Low-to-high system-fan transition temperature
> +==========================  ==============================================
> +
> +CPU fan profiles
> +----------------
> +
> +Values 2 and 3 of ``pwm1_enable`` select the two complete automatic profiles
> +implemented by the firmware. Writing either value reloads the whole CPU fan
> +curve, including firmware state which is not visible through the ACPI EC
> +window. Other values are rejected.
> +
> +System fan thresholds
> +---------------------
> +
> +The two writable system-fan temperatures are rounded to whole degrees Celsius
> +and clamped to preserve strict ordering between both visible thresholds and
> +the firmware's internal third threshold. The third threshold does not select
> +a new PWM target and is therefore not exposed as another auto point.
> +
> +Resume state preservation
> +-------------------------
> +
> +Fan settings are held in EC RAM. On the supported firmware, initialization
> +during s2idle resume reloads the factory system-fan curve. The driver saves the
> +coherent CPU profile and system-fan thresholds at suspend and restores them
> +synchronously at resume.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6156e48e1816..f60ea9c6cfe7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18012,6 +18012,13 @@ F:	include/linux/min_heap.h
>   F:	lib/min_heap.c
>   F:	lib/tests/min_heap_kunit.c
>   
> +MINISFORUM UM780 XTX EC HARDWARE MONITOR DRIVER
> +M:	Sebastián Peyrott <speyrott@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/minisforum-um780xtx.rst
> +F:	drivers/hwmon/minisforum-um780xtx.c
> +
>   MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 81a9a1d40eec..45ac04c89b23 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1490,6 +1490,22 @@ config SENSORS_MENF21BMC_HWMON
>   	  This driver can also be built as a module. If so the module
>   	  will be called menf21bmc_hwmon.
>   
> +config SENSORS_MINISFORUM_UM780XTX
> +	tristate "Minisforum UM780 XTX EC hardware monitoring"
> +	depends on ACPI && DMI && X86
> +	help
> +	  If you say yes here you get support for the hardware monitoring
> +	  features of the embedded controller in the Minisforum UM780 XTX.
> +	  This includes CPU and system fan speeds, their control temperatures,
> +	  two CPU fan profiles, system fan temperature thresholds, and
> +	  preservation of the selected settings across suspend and resume.
> +
> +	  This driver only binds to explicitly supported board and firmware
> +	  versions.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called minisforum-um780xtx.
> +
>   config SENSORS_MR75203
>   	tristate "Moortec Semiconductor MR75203 PVT Controller"
>   	select REGMAP_MMIO
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 0cad7e21634c..a690f5f97ffc 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -180,6 +180,7 @@ obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>   obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
>   obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
> +obj-$(CONFIG_SENSORS_MINISFORUM_UM780XTX) += minisforum-um780xtx.o
>   obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
>   obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
>   obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
> diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
> new file mode 100644
> index 000000000000..102ce067d164
> --- /dev/null
> +++ b/drivers/hwmon/minisforum-um780xtx.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Minisforum UM780 XTX (F7BSD) embedded-controller hwmon driver.
> + *
> + * Copyright (C) 2026 Sebastián Peyrott <speyrott@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#define UM780XTX_EC_TEMP_SYS	0x05
> +#define UM780XTX_EC_TEMP_CPU	0x09
> +#define UM780XTX_EC_CPU_PROFILE	0x2f
> +#define UM780XTX_EC_SYS_POINT1	0x31
> +#define UM780XTX_EC_SYS_POINT2	0x34
> +#define UM780XTX_EC_SYS_POINT3	0x37
> +
> +#define UM780XTX_EC_PROFILE_B1	0xb1
> +#define UM780XTX_EC_PROFILE_B2	0xb2
> +
> +#define UM780XTX_EC_FAN1_LO	0xb6
> +#define UM780XTX_EC_FAN1_HI	0xb7
> +#define UM780XTX_EC_FAN2_LO	0xb9
> +#define UM780XTX_EC_FAN2_HI	0xba
> +
> +#define UM780XTX_EC_MAX_RPM	9000
> +#define UM780XTX_EC_RPM_RETRIES	3
> +
> +static struct platform_device *um780xtx_pdev;
> +
> +struct um780xtx_data {
> +	struct device *hwmon_dev;
> +	u8 cached_profile;
> +	u8 cached_sys_point1;
> +	u8 cached_sys_point2;
> +	u8 sys_point3;
> +};
> +
> +static const struct dmi_system_id um780xtx_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
> +					"Micro Computer (HK) Tech Limited"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Venus series"),
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> +					"Shenzhen Meigao Electronic Equipment Co.,Ltd"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "F7BSD"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, um780xtx_dmi_table);
> +
> +static bool um780xtx_firmware_match(void)
> +{
> +	const char *board_version = dmi_get_system_info(DMI_BOARD_VERSION);
> +	const char *bios_version = dmi_get_system_info(DMI_BIOS_VERSION);
> +
> +	return board_version && bios_version &&
> +		!strcmp(board_version, "1.1") && !strcmp(bios_version, "1.06");
> +}
> +
> +static int um780xtx_oem_read(u8 command, u8 *value)
> +{
> +	return ec_transaction(command, NULL, 0, value, 1);
> +}
> +
> +static int um780xtx_read_rpm(u8 command_hi, u8 command_lo, long *rpm)
> +{
> +	u8 hi_before;
> +	u8 hi_after;
> +	u8 lo;
> +	unsigned int value;
> +	int attempt;
> +	int ret;
> +
> +	for (attempt = 0; attempt < UM780XTX_EC_RPM_RETRIES; attempt++) {
> +		ret = um780xtx_oem_read(command_hi, &hi_before);
> +		if (ret)
> +			return ret;
> +		ret = um780xtx_oem_read(command_lo, &lo);
> +		if (ret)
> +			return ret;
> +		ret = um780xtx_oem_read(command_hi, &hi_after);
> +		if (ret)
> +			return ret;
> +		if (hi_before != hi_after)
> +			continue;
> +
> +		value = (hi_after << 8) | lo;
> +		if (value > UM780XTX_EC_MAX_RPM)
> +			continue;
> +
> +		*rpm = value;
> +		return 0;
> +	}
> +
> +	return -EAGAIN;

Are you sure this is what you want ? It will end up in a tight loop
if the problem is persistent.

> +}
> +
> +static int um780xtx_read_profile(long *mode)
> +{
> +	u8 profile;
> +	int ret;
> +
> +	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +	if (ret)
> +		return ret;
> +	if (profile == UM780XTX_EC_PROFILE_B1) {
> +		*mode = 2;
> +		return 0;
> +	}
> +	if (profile == UM780XTX_EC_PROFILE_B2) {
> +		*mode = 3;
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;

This is an inappropriate return value. Either define mode = 4 or similar
for "other" or "unknown" or return -ENODATA.

> +}
> +
> +static int um780xtx_write_profile(struct um780xtx_data *data, long mode)
> +{
> +	u8 expected;
> +	u8 profile;
> +	int ret;
> +
> +	if (mode != 2 && mode != 3)
> +		return -EINVAL;
> +	expected = mode == 2 ? UM780XTX_EC_PROFILE_B1 : UM780XTX_EC_PROFILE_B2;
> +
> +	ret = ec_transaction(expected, NULL, 0, NULL, 0);
> +	if (ret)
> +		return ret;
> +	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +	if (ret)
> +		return ret;
> +	if (profile != expected)
> +		return -EIO;
> +
> +	data->cached_profile = profile;
> +	return 0;
> +}
> +
> +static const u8 um780xtx_sys_point_offsets[] = {
> +	UM780XTX_EC_SYS_POINT1,
> +	UM780XTX_EC_SYS_POINT2,
> +};
> +
> +static ssize_t um780xtx_sys_point_temp_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	u8 value;
> +	int ret;
> +
> +	guard(hwmon_lock)(dev);
> +	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &value);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", value * 1000);
> +}
> +
> +static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
> +					     struct device_attribute *attr,
> +					     const char *buf, size_t count)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	u8 points[2];
> +	u8 readback;
> +	long value;
> +	int ret;
> +
> +	ret = kstrtol(buf, 10, &value);
> +	if (ret)
> +		return ret;
> +
> +	guard(hwmon_lock)(dev);
> +	ret = ec_read(UM780XTX_EC_SYS_POINT1, &points[0]);
> +	if (ret)
> +		return ret;
> +	ret = ec_read(UM780XTX_EC_SYS_POINT2, &points[1]);
> +	if (ret)
> +		return ret;
> +	if (points[0] >= points[1] || points[1] >= data->sys_point3)
> +		return -EIO;
> +
> +	value = DIV_ROUND_CLOSEST(value, 1000);
> +	if (!sattr->index)
> +		value = clamp_val(value, 0, points[1] - 1);
> +	else
> +		value = clamp_val(value, points[0] + 1,
> +				  data->sys_point3 - 1);
> +	points[sattr->index] = value;
> +
> +	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
> +		       points[sattr->index]);
> +	if (ret)
> +		return ret;
> +	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &readback);
> +	if (ret)
> +		return ret;
> +	if (readback != points[sattr->index])
> +		return -EIO;
> +
> +	data->cached_sys_point1 = points[0];
> +	data->cached_sys_point2 = points[1];

This will require explanation. The values are stored in probe,
stored here again, stored in suspend, and (only) restored in resume.

Why store here and in probe if they are updated during suspend anyway ?
Alternatively, why update in suspend if they are already updated from
the probe function and here ?

Also, I don't understand why the values are read in probe, stored
in cached_sys_point{1,2}, and read here again. If there is evidence
that the values are updated dynamically, there is no point of caching
them. However, in that case, what is the point of saving/restoring them
during suspend/resume ?

Guenter

> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_temp,
> +			     um780xtx_sys_point_temp, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point2_temp,
> +			     um780xtx_sys_point_temp, 1);
> +
> +static struct attribute *um780xtx_extra_attrs[] = {
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group um780xtx_extra_group = {
> +	.attrs = um780xtx_extra_attrs,
> +};
> +
> +static const struct attribute_group *um780xtx_extra_groups[] = {
> +	&um780xtx_extra_group,
> +	NULL
> +};
> +
> +static umode_t um780xtx_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	if (type == hwmon_temp || type == hwmon_fan)
> +		return 0444;
> +	if (type == hwmon_pwm && attr == hwmon_pwm_enable)
> +		return 0644;
> +	return 0;
> +}
> +
> +static int um780xtx_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *value)
> +{
> +	u8 raw;
> +	int ret;
> +
> +	if (type == hwmon_temp) {
> +		ret = ec_read(channel ? UM780XTX_EC_TEMP_SYS :
> +			      UM780XTX_EC_TEMP_CPU, &raw);
> +		if (ret)
> +			return ret;
> +		*value = raw * 1000L;
> +		return 0;
> +	}
> +	if (type == hwmon_fan) {
> +		if (!channel)
> +			ret = um780xtx_read_rpm(UM780XTX_EC_FAN1_HI,
> +						UM780XTX_EC_FAN1_LO, value);
> +		else
> +			ret = um780xtx_read_rpm(UM780XTX_EC_FAN2_HI,
> +						UM780XTX_EC_FAN2_LO, value);
> +		return ret;
> +	}
> +	if (type == hwmon_pwm)
> +		return um780xtx_read_profile(value);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int um780xtx_write(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long value)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +
> +	if (type == hwmon_pwm && attr == hwmon_pwm_enable)
> +		return um780xtx_write_profile(data, value);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int um780xtx_read_string(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, const char **str)
> +{
> +	static const char * const labels[] = { "CPU", "SYS" };
> +
> +	if (type == hwmon_temp && attr == hwmon_temp_label)
> +		*str = labels[channel];
> +	else if (type == hwmon_fan && attr == hwmon_fan_label)
> +		*str = labels[channel];
> +	else
> +		return -EOPNOTSUPP;
> +	return 0;
> +}
> +
> +static const struct hwmon_ops um780xtx_hwmon_ops = {
> +	.is_visible = um780xtx_is_visible,
> +	.read = um780xtx_read,
> +	.write = um780xtx_write,
> +	.read_string = um780xtx_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const um780xtx_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info um780xtx_chip_info = {
> +	.ops = &um780xtx_hwmon_ops,
> +	.info = um780xtx_info,
> +};
> +
> +static int um780xtx_write_sys_point(u8 offset, u8 value)
> +{
> +	u8 readback;
> +	int ret;
> +
> +	ret = ec_write(offset, value);
> +	if (ret)
> +		return ret;
> +	ret = ec_read(offset, &readback);
> +	if (ret)
> +		return ret;
> +
> +	return readback == value ? 0 : -EIO;
> +}
> +
> +static int um780xtx_restore_sys_points(struct um780xtx_data *data,
> +				       u8 current_point2)
> +{
> +	u8 point1 = data->cached_sys_point1;
> +	u8 point2 = data->cached_sys_point2;
> +	int ret;
> +
> +	/* Keep strict ordering valid after each individual EC write. */
> +	if (point1 >= current_point2) {
> +		ret = um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT2, point2);
> +		if (ret)
> +			return ret;
> +		return um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT1,
> +						 point1);
> +	}
> +
> +	ret = um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT1, point1);
> +	if (ret)
> +		return ret;
> +	return um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT2, point2);
> +}
> +
> +static int um780xtx_cache_state(struct um780xtx_data *data)
> +{
> +	u8 profile;
> +	u8 point1;
> +	u8 point2;
> +	int ret;
> +
> +	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +	if (ret)
> +		return ret;
> +	if (profile != UM780XTX_EC_PROFILE_B1 &&
> +	    profile != UM780XTX_EC_PROFILE_B2)
> +		return -EINVAL;
> +
> +	ret = ec_read(UM780XTX_EC_SYS_POINT1, &point1);
> +	if (ret)
> +		return ret;
> +	ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
> +	if (ret)
> +		return ret;
> +	if (point1 >= point2 || point2 >= data->sys_point3)
> +		return -EINVAL;
> +
> +	data->cached_profile = profile;
> +	data->cached_sys_point1 = point1;
> +	data->cached_sys_point2 = point2;
> +	return 0;
> +}
> +
> +static int um780xtx_restore_state(struct um780xtx_data *data)
> +{
> +	u8 readback;
> +	u8 point2;
> +	int ret;
> +
> +	ret = ec_transaction(data->cached_profile, NULL, 0, NULL, 0);
> +	if (ret)
> +		return ret;
> +	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &readback);
> +	if (ret)
> +		return ret;
> +	if (readback != data->cached_profile)
> +		return -EIO;
> +
> +	ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
> +	if (ret)
> +		return ret;
> +
> +	return um780xtx_restore_sys_points(data, point2);
> +}
> +
> +static int um780xtx_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct um780xtx_data *data;
> +	struct device *hwmon;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, data);
> +
> +	ret = ec_read(UM780XTX_EC_SYS_POINT3, &data->sys_point3);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to read system fan limit\n");
> +	ret = um780xtx_cache_state(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to read initial fan settings\n");
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "um780xtx_ec", data,
> +						     &um780xtx_chip_info,
> +						     um780xtx_extra_groups);
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +	data->hwmon_dev = hwmon;
> +
> +	return 0;
> +}
> +
> +static int um780xtx_suspend(struct device *dev)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +
> +	guard(hwmon_lock)(data->hwmon_dev);
> +	return um780xtx_cache_state(data);
> +}
> +
> +static int um780xtx_resume(struct device *dev)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +
> +	guard(hwmon_lock)(data->hwmon_dev);
> +	return um780xtx_restore_state(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(um780xtx_pm_ops, um780xtx_suspend,
> +				um780xtx_resume);
> +
> +static struct platform_driver um780xtx_driver = {
> +	.driver = {
> +		.name = "um780xtx-ec-hwmon",
> +		.pm = pm_sleep_ptr(&um780xtx_pm_ops),
> +	},
> +	.probe = um780xtx_probe,
> +};
> +
> +static int __init um780xtx_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(um780xtx_dmi_table) ||
> +	    !um780xtx_firmware_match() || !ec_get_handle())
> +		return -ENODEV;
> +	ret = platform_driver_register(&um780xtx_driver);
> +	if (ret)
> +		return ret;
> +
> +	um780xtx_pdev = platform_device_register_simple("um780xtx-ec-hwmon",
> +							PLATFORM_DEVID_NONE,
> +						       NULL, 0);
> +	if (IS_ERR(um780xtx_pdev)) {
> +		ret = PTR_ERR(um780xtx_pdev);
> +		platform_driver_unregister(&um780xtx_driver);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void __exit um780xtx_exit(void)
> +{
> +	platform_device_unregister(um780xtx_pdev);
> +	platform_driver_unregister(&um780xtx_driver);
> +}
> +
> +module_init(um780xtx_init);
> +module_exit(um780xtx_exit);
> +
> +MODULE_AUTHOR("Sebastián Peyrott <speyrott@gmail.com>");
> +MODULE_DESCRIPTION("Minisforum UM780 XTX EC hwmon driver");
> +MODULE_LICENSE("GPL");

