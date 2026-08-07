Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3CD12B94
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 01:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786067968; cv=none; b=o+3ZVeuTtBpwS/+y1fPgGqNqKqSp9wLEpEpM0jdgJAuKH80jGuTjbGb3WqYuh8QJvG2v2NKbr309FTlRAH+RXvqdYM0SiysNpsNev5Tk9AJDevijFeGk61smEsYulB6A78t+6CuVDoABILF3RpXKn1Fwtrnau5EhyUfpEtnXnvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786067968; c=relaxed/simple;
	bh=E8c57GpD6cGalXf98uA4xJ+6B/XahrOs8FcEezWgm5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0oQiWGxUhm/YDEF42dPMXnAzmV9xWzh6nm3mHRedVhqG24lALlqIEZbL9voKZ2JMyF+bQqFzGWWr8SjFrvNXIpvkOC4aINLDEt+Rxu6Z39bm/rNcdXjQFaf8pVdyifL3+Ojb44veZ68Dtv2gnkW/6Mz48+WHDV3r5UOUClIpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GM3dqz9n; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GM3dqz9n"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ced3386430so32655425ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786067964; x=1786672764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGoeZ7KSCYNrAte8WMjWN3U3jI3xOmICyLfTkSV4890=;
        b=GM3dqz9n7gBd2b/qwkQYyYgHBkZQ3hRQkWoJQ5+suGjvN2DyuVpxojzhPCM8txsHjb
         rz7iAplLcadYKxJaLDsa0XXvtWppb7hLaCqWpgzzo6roByIe+1C8dmrRWCXD7yURo2Zc
         dVqrkh8wu+d+9uX+CQVu38crZVszhHjUGBWPYcxu7TVU5J0OZx6UODqQONcCjZk0fxb7
         dobucoTSXw2rSyX5XiF5zL+T9y121i3Ea3N7zQoJwpz35KQ09VI7urlDPbx6c3Trzwub
         DcmgRK8/ZGVNRE/ZvyvON4PlGao9lWt2bdxR500RX+daG2DGiqp3Zoqccc6TxfaX3PO+
         BbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786067964; x=1786672764;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGoeZ7KSCYNrAte8WMjWN3U3jI3xOmICyLfTkSV4890=;
        b=P/Y71PUYFiNK3wqiSgGH+jZVgarAKqwFr7tM2WX0NTIfJizF7iXd/oj0ZUvflHGHzg
         rAlySuy4zJ3gX3+SzAw5SvpkHppWF2ZQ9C7Ka1xeCY9LrnF3BU6J+zR0rO/oa8RA0lRV
         l4s7mAFLDGuTrn17TzaCwBgN5OEq+ba2TV0VoTgiMRFCEHkrT+miFRe3tw86PSF4inRU
         2DeGcVSIpAC5UVKIw0HFrrEZvbpOzvwS6MSuYycUhxurI8tXItBJzODMTJ9WrSkvtkmj
         /Vz7PEDFGZMscFZ/yH/QN4yQ2uuRLYh+mRb45+eqJxsAnm14Lhn7WqJZryJbZIQC1STk
         RDgA==
X-Gm-Message-State: AOJu0YyUWOTxH6d2R9QosgaElDI3MGxE3URyB5Vu2LFEPAwqGdBB1ahi
	Z6EpKGp+dbXuCRn38lq6YryJfpQl4qxAlbJJO0hXzcFbetifOUke4jRkwP/9cg==
X-Gm-Gg: AR+sD10jaTHE2d9Ftbkl8GmL/erRO8AVQ3IxVShZSIVD1AXEg/tzMZnCBWQ1lwKUhV+
	a1oDZ8ITK8Dc+v0ALnGwhH0Ixbzi/HeuqeTsGecGanMLTi7kv1ImH8JkpjHzNU+x2lXorlXT3sa
	er5ZJpEaRq0MdQLuXMiJez2n0leyXbXi4ee9DCK8/JRfaXOpNDYse9OUWIIfIA1HxpE14e8T0nj
	tkHoI7/u2RZ/UYjJPMZu4ZTJ0cXjPZL4y/B7CyRBIgGuHUBbAXFNOSUvsqjIF2aQYh8rBQ74Bm/
	pd8h0RGivXKJWEaA/7WRatzI0TSrnGLTzNJ8v8scfP6V7sqEKSiivLPDpP5VwZpp+KOAyKsS4CT
	whegyXJaU6GvFPRke0s6Fi5EJ0XZkCRr1K1k9Te2PvqKkVNhIsr06tnvwj9TszrFRW8fXOqbg4g
	guhSoMnR9A2EMidI7TtlF+ChK1i60NWoRFQu9yW5Yv8OAqnQib9MARlSWFQHvdyRrYrAm6G4dE2
	Lt90y5BmSiVgOJbiNiY838WXXzPoiSoFy9aHhFTOmw7589K
X-Received: by 2002:a17:90b:288d:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-39261ff3945mr424911a91.9.1786067963722;
        Thu, 06 Aug 2026 18:59:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1520c2csm405735a91.1.2026.08.06.18.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 18:59:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9005518b-98c1-4e78-83d5-c2493ad331d0@roeck-us.net>
Date: Thu, 6 Aug 2026 18:59:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and
 fan control
To: =?UTF-8?Q?Sebasti=C3=A1n_Peyrott?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260807003842.249957-1-speyrott@gmail.com>
 <20260807003842.249957-2-speyrott@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260807003842.249957-2-speyrott@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/26 17:38, Sebastián Peyrott wrote:
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
>   Documentation/hwmon/minisforum-um780xtx.rst |  79 +++
>   MAINTAINERS                                 |   7 +
>   drivers/hwmon/Kconfig                       |  16 +
>   drivers/hwmon/Makefile                      |   1 +
>   drivers/hwmon/minisforum-um780xtx.c         | 648 ++++++++++++++++++++
>   6 files changed, 752 insertions(+)
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
> index 000000000000..5ad0d3588062
> --- /dev/null
> +++ b/Documentation/hwmon/minisforum-um780xtx.rst
> @@ -0,0 +1,79 @@
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
> +loops. Their physical sensor placement is not known. ``temp1`` is an external
> +thermistor input used for the system fan, while ``temp2`` is the filtered AMD
> +SB-TSI temperature used for the CPU fan.
> +
> +The fan tachometers are read through OEM EC commands. Since each byte is
> +returned by a separate command, the driver uses a high-low-high sequence and
> +retries if the high byte changes.
> +
> +Sysfs entries
> +-------------
> +
> +============================  ==============================================
> +``temp1_input``               System-fan control temperature
> +``temp2_input``               CPU-fan control temperature
> +``fan1_input``                CPU fan speed in RPM
> +``fan2_input``                System fan speed in RPM
> +``pwm1_enable``               CPU profile: 2 is OEM B1, 3 is OEM B2
> +``pwm2_enable``               Always 2 (automatic firmware control)

pwm[12]_enable can be implemented as standard attributes. Also,
looking into the code, pwm2_enable always returns 2, can not be modified,
and is therefore pointless.

On top of that, the different definitions for pwm1_enable and pwm2_enable
are confusing. What is the "OEM B1" and "OEM B2" CPU profile, and what
does it have to do with fan control enable status ?

> +``pwm2_auto_channels_temp``   Always 1 (``temp1`` controls this output)

What is the point of this (constant) non-standard attribute ?

> +``pwm2_auto_point1_temp``     Off-to-low system-fan transition temperature
> +``pwm2_auto_point1_pwm``      Fixed low target, 40 on the 0--255 scale
> +``pwm2_auto_point2_temp``     Low-to-high system-fan transition temperature
> +``pwm2_auto_point2_pwm``      Fixed high target, 102 on the 0--255 scale

The pwm2_auto_point[12]_pwm attributes are constant values and therefore
pointless.

> +============================  ==============================================
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
> +The two writable system-fan temperatures accept whole degrees Celsius only.
> +The driver requires strict ordering between both visible thresholds and the
> +firmware's internal third threshold. The third threshold does not select a new
> +PWM target and is therefore not exposed as another auto point.
> +
> +Resume state preservation
> +-------------------------
> +
> +Fan settings are held in EC RAM. On the supported firmware, initialization
> +after s2idle resume reloads the factory system-fan curve. The driver caches the
> +coherent profile and thresholds present when it probes, updates the cache after
> +successful hwmon writes, and performs one delayed comparison after resume. It
> +restores only values which differ from that cache; it does not poll during
> +normal operation.
> +
> +The ``resume_restore_delay_ms`` module parameter selects the delay from the
> +kernel resume callback. Its default is 1000 ms. Values from 1000 through 60000
> +ms are accepted, and 0 disables the post-resume check. A runtime change applies
> +to the next resume, not to work which is already pending.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e25838cdf301..e88684a38e3b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18015,6 +18015,13 @@ F:	include/linux/min_heap.h
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
> index e60bfc31bbad..342a67e83933 100644
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
> index 000000000000..cafd03d755af
> --- /dev/null
> +++ b/drivers/hwmon/minisforum-um780xtx.c
> @@ -0,0 +1,648 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Minisforum UM780 XTX (F7BSD) embedded-controller hwmon driver.
> + *
> + * Copyright (C) 2026 Sebastián Peyrott <speyrott@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/jiffies.h>
> +#include <linux/kstrtox.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/workqueue.h>
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
> +#define UM780XTX_PWM_SYS_LOW	40
> +#define UM780XTX_PWM_SYS_HIGH	102
> +#define UM780XTX_RESUME_DELAY_MIN_MS	1000
> +#define UM780XTX_RESUME_DELAY_MAX_MS	60000
> +
> +static struct platform_device *um780xtx_pdev;
> +
> +struct um780xtx_data {
> +	struct device *dev;
> +	/* Serializes EC transactions and cached state updates. */
> +	struct mutex lock;
> +	struct delayed_work resume_work;
> +	u8 cached_profile;
> +	u8 cached_sys_point1;
> +	u8 cached_sys_point2;
> +	bool profile_valid;
> +	bool sys_points_valid;
> +};
> +
> +static unsigned int resume_restore_delay_ms = 1000;
> +
> +static int um780xtx_set_resume_delay(const char *val,
> +				     const struct kernel_param *kp)
> +{
> +	unsigned int delay;
> +	int ret;
> +
> +	ret = kstrtouint(val, 0, &delay);
> +	if (ret)
> +		return ret;
> +	if (delay && (delay < UM780XTX_RESUME_DELAY_MIN_MS ||
> +		      delay > UM780XTX_RESUME_DELAY_MAX_MS))
> +		return -EINVAL;
> +
> +	return param_set_uint(val, kp);
> +}
> +
> +static const struct kernel_param_ops um780xtx_resume_delay_ops = {
> +	.set = um780xtx_set_resume_delay,
> +	.get = param_get_uint,
> +};
> +
> +module_param_cb(resume_restore_delay_ms, &um780xtx_resume_delay_ops,
> +		&resume_restore_delay_ms, 0644);
> +MODULE_PARM_DESC(resume_restore_delay_ms,
> +		 "Delay before one post-resume state check; 0 disables (milliseconds)");
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
> +}
> +
> +static ssize_t pwm1_enable_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +	u8 profile;
> +	int ret;
> +
> +	mutex_lock(&data->lock);

Use hwmon subsystem lock and guard().

> +	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +	mutex_unlock(&data->lock);
> +	if (ret)
> +		return ret;
> +	if (profile == UM780XTX_EC_PROFILE_B1)
> +		return sysfs_emit(buf, "2\n");
> +	if (profile == UM780XTX_EC_PROFILE_B2)
> +		return sysfs_emit(buf, "3\n");
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static ssize_t pwm1_enable_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +	unsigned long mode;
> +	u8 expected;
> +	u8 profile;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &mode);
> +	if (ret)
> +		return ret;
> +	if (mode != 2 && mode != 3)
> +		return -EINVAL;
> +	expected = mode == 2 ? UM780XTX_EC_PROFILE_B1 : UM780XTX_EC_PROFILE_B2;
> +
> +	mutex_lock(&data->lock);
> +	ret = ec_transaction(expected, NULL, 0, NULL, 0);
> +	if (ret)
> +		goto out_unlock;
> +	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +	if (ret)
> +		goto out_unlock;
> +	if (profile != expected) {
> +		ret = -EIO;
> +	} else {
> +		data->cached_profile = profile;
> +		data->profile_valid = true;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&data->lock);
> +	return ret ? ret : count;
> +}
> +static DEVICE_ATTR_RW(pwm1_enable);
> +
> +static ssize_t pwm2_enable_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "2\n");
> +}
> +static DEVICE_ATTR_RO(pwm2_enable);
> +
> +static ssize_t pwm2_auto_channels_temp_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +static DEVICE_ATTR_RO(pwm2_auto_channels_temp);
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
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	u8 value;
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &value);
> +	mutex_unlock(&data->lock);
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
> +	u8 points[3];
> +	u8 readback;
> +	long value;
> +	int ret;
> +
> +	ret = kstrtol(buf, 10, &value);
> +	if (ret)
> +		return ret;
> +	if (value < 0 || value > 255000 || value % 1000)
> +		return -EINVAL;

clamp and round. We do not expect users to know exact ranges and values.

> +
> +	mutex_lock(&data->lock);

guard, and use hwmon subsystem lock

> +	ret = ec_read(UM780XTX_EC_SYS_POINT1, &points[0]);
> +	if (ret)
> +		goto out_unlock;
> +	ret = ec_read(UM780XTX_EC_SYS_POINT2, &points[1]);
> +	if (ret)
> +		goto out_unlock;
> +	ret = ec_read(UM780XTX_EC_SYS_POINT3, &points[2]);
> +	if (ret)
> +		goto out_unlock;

Since UM780XTX_EC_SYS_POINT3 is never modified, why not read it
once ?

> +
> +	points[sattr->index] = value / 1000;
> +	if (points[0] >= points[1] || points[1] >= points[2]) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
> +		       points[sattr->index]);
> +	if (ret)
> +		goto out_unlock;
> +	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &readback);
> +	if (ret)
> +		goto out_unlock;
> +	if (readback != points[sattr->index]) {
> +		ret = -EIO;
> +	} else {
> +		data->cached_sys_point1 = points[0];
> +		data->cached_sys_point2 = points[1];
> +		data->sys_points_valid = true;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&data->lock);
> +	return ret ? ret : count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_temp,
> +			     um780xtx_sys_point_temp, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point2_temp,
> +			     um780xtx_sys_point_temp, 1);
> +
> +static ssize_t pwm2_auto_point1_pwm_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", UM780XTX_PWM_SYS_LOW);
> +}
> +static DEVICE_ATTR_RO(pwm2_auto_point1_pwm);
> +
> +static ssize_t pwm2_auto_point2_pwm_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", UM780XTX_PWM_SYS_HIGH);
> +}
> +static DEVICE_ATTR_RO(pwm2_auto_point2_pwm);
> +
> +static struct attribute *um780xtx_extra_attrs[] = {
> +	&dev_attr_pwm1_enable.attr,
> +	&dev_attr_pwm2_enable.attr,
> +	&dev_attr_pwm2_auto_channels_temp.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&dev_attr_pwm2_auto_point1_pwm.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&dev_attr_pwm2_auto_point2_pwm.attr,
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
> +	if (type == hwmon_temp && channel < 2 &&
> +	    (attr == hwmon_temp_input || attr == hwmon_temp_label))
> +		return 0444;
> +	if (type == hwmon_fan && channel < 2 &&
> +	    (attr == hwmon_fan_input || attr == hwmon_fan_label))
> +		return 0444;
> +	return 0;

At least in the current code this is pointless. Just returning 0444 would do.

> +}
> +
> +static int um780xtx_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *value)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +	u8 raw;
> +	int ret;
> +
> +	if (type == hwmon_temp && attr == hwmon_temp_input && channel < 2) {

channel is always < 2

> +		mutex_lock(&data->lock);

Drop unnecessary locks

> +		ret = ec_read(channel ? UM780XTX_EC_TEMP_CPU :
> +			      UM780XTX_EC_TEMP_SYS, &raw);
> +		mutex_unlock(&data->lock);
> +		if (ret)
> +			return ret;
> +		*value = raw * 1000L;
> +		return 0;
> +	}
> +	if (type == hwmon_fan && attr == hwmon_fan_input && channel < 2) {

channel is always < 2

> +		mutex_lock(&data->lock);
> +		if (!channel)
> +			ret = um780xtx_read_rpm(UM780XTX_EC_FAN1_HI,
> +						UM780XTX_EC_FAN1_LO, value);
> +		else
> +			ret = um780xtx_read_rpm(UM780XTX_EC_FAN2_HI,
> +						UM780XTX_EC_FAN2_LO, value);
> +		mutex_unlock(&data->lock);
> +		return ret;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +static int um780xtx_read_string(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, const char **str)
> +{
> +	static const char * const temp_labels[] = {
> +		"SYS fan control temperature",
> +		"CPU fan control temperature",

Drop "fan control temperature"

> +	};
> +	static const char * const fan_labels[] = { "CPU fan", "SYS fan" };

Drop "fan". It is confusing that temperature and fan index values are reversed.
Why is temp1 the SYS temperature, but fan1 the CPU fan speed ?

> +
> +	if (channel >= 2)
> +		return -EOPNOTSUPP;

Pointless check. That is what is_visible is for.

> +	if (type == hwmon_temp && attr == hwmon_temp_label)
> +		*str = temp_labels[channel];
> +	else if (type == hwmon_fan && attr == hwmon_fan_label)
> +		*str = fan_labels[channel];
> +	else
> +		return -EOPNOTSUPP;
> +	return 0;
> +}
> +
> +static const struct hwmon_ops um780xtx_hwmon_ops = {
> +	.is_visible = um780xtx_is_visible,
> +	.read = um780xtx_read,
> +	.read_string = um780xtx_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const um780xtx_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
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
> +				       u8 current_point1,
> +				       u8 current_point2, u8 point3)
> +{
> +	u8 point1 = data->cached_sys_point1;
> +	u8 point2 = data->cached_sys_point2;
> +	int ret;
> +
> +	if (point1 >= point2 || point2 >= point3)
> +		return -EINVAL;
> +

Since those are cached states, how would this ever happen ?

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
> +static void um780xtx_cache_state(struct um780xtx_data *data)
> +{
> +	u8 profile;
> +	u8 point1;
> +	u8 point2;
> +	u8 point3;
> +	int profile_ret;
> +	int sys_ret;
> +
> +	mutex_lock(&data->lock);
> +	profile_ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +	if (!profile_ret &&
> +	    (profile == UM780XTX_EC_PROFILE_B1 ||
> +	     profile == UM780XTX_EC_PROFILE_B2)) {
> +		data->cached_profile = profile;
> +		data->profile_valid = true;
> +	}
> +
> +	sys_ret = ec_read(UM780XTX_EC_SYS_POINT1, &point1);
> +	if (!sys_ret)
> +		sys_ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
> +	if (!sys_ret)
> +		sys_ret = ec_read(UM780XTX_EC_SYS_POINT3, &point3);
> +	if (!sys_ret && point1 < point2 && point2 < point3) {
> +		data->cached_sys_point1 = point1;
> +		data->cached_sys_point2 = point2;
> +		data->sys_points_valid = true;
> +	}
> +	mutex_unlock(&data->lock);
> +
> +	if (profile_ret)
> +		dev_warn(data->dev, "failed to cache initial CPU profile: %d\n",
> +			 profile_ret);
> +	if (sys_ret)
> +		dev_warn(data->dev, "failed to cache initial SYS curve: %d\n",
> +			 sys_ret);

Why those noisy warnings on errors, but no warning if sys_points_valid
and/or profile_valid are false due to failed range checks ?

> +}
> +
> +static void um780xtx_resume_work(struct work_struct *work)
> +{
> +	struct um780xtx_data *data =
> +		container_of(to_delayed_work(work), struct um780xtx_data,
> +			     resume_work);
> +	u8 profile;
> +	u8 readback;
> +	u8 point1;
> +	u8 point2;
> +	u8 point3;
> +	int profile_ret = 0;
> +	int sys_ret = 0;
> +
> +	mutex_lock(&data->lock);
> +	if (data->profile_valid) {
> +		profile_ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
> +		if (!profile_ret && profile != data->cached_profile) {
> +			profile_ret = ec_transaction(data->cached_profile, NULL, 0,
> +						     NULL, 0);
> +			if (!profile_ret)
> +				profile_ret = ec_read(UM780XTX_EC_CPU_PROFILE,
> +						      &readback);
> +			if (!profile_ret && readback != data->cached_profile)
> +				profile_ret = -EIO;
> +		}
> +	}
> +
> +	if (data->sys_points_valid) {
> +		sys_ret = ec_read(UM780XTX_EC_SYS_POINT1, &point1);
> +		if (!sys_ret)
> +			sys_ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
> +		if (!sys_ret)
> +			sys_ret = ec_read(UM780XTX_EC_SYS_POINT3, &point3);
> +		if (!sys_ret &&
> +		    (point1 != data->cached_sys_point1 ||
> +		     point2 != data->cached_sys_point2)) {
> +			sys_ret = um780xtx_restore_sys_points(data, point1, point2, point3);
> +		}
> +	}
> +	mutex_unlock(&data->lock);
> +
> +	if (profile_ret)
> +		dev_warn(data->dev, "post-resume CPU profile check failed: %d\n",
> +			 profile_ret);
> +	if (sys_ret)
> +		dev_warn(data->dev, "post-resume SYS curve check failed: %d\n",
> +			 sys_ret);

This is highly unusual. Normally suspend would save the state
and resume would restore it. What is the point of _checking_ the state
on resume ?

Also, what is the point of the delay after resume ? The cached values
could have been changed via sysfs attributes in the meantime, causing
spurious warnings.

> +}
> +
> +static void um780xtx_cancel_resume_work(void *arg)
> +{
> +	struct um780xtx_data *data = arg;
> +
> +	cancel_delayed_work_sync(&data->resume_work);
> +}
> +
> +static int um780xtx_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct um780xtx_data *data;
> +	struct device *hwmon;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->dev = dev;
> +	mutex_init(&data->lock);
> +	INIT_DELAYED_WORK(&data->resume_work, um780xtx_resume_work);
> +	platform_set_drvdata(pdev, data);
> +
> +	um780xtx_cache_state(data);
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "um780xtx_ec", data,
> +						     &um780xtx_chip_info,
> +						     um780xtx_extra_groups);
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	return devm_add_action_or_reset(dev, um780xtx_cancel_resume_work, data);
> +}
> +
> +static int um780xtx_suspend(struct device *dev)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&data->resume_work);
> +	return 0;
> +}
> +
> +static int um780xtx_resume(struct device *dev)
> +{
> +	struct um780xtx_data *data = dev_get_drvdata(dev);
> +	unsigned int delay = READ_ONCE(resume_restore_delay_ms);
> +
> +	if (!delay)
> +		return 0;
> +
> +	mod_delayed_work(system_wq, &data->resume_work,
> +			 msecs_to_jiffies(delay));
> +	return 0;
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

