Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15E298CB2
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014100; cv=none; b=N8wBaVumGUwsdLA/JRMleV8KaHvw4GqQM/pQik5SWt2FalN2BukCPFuViAIdBy37BPHFxGWkIdSkJMvB83XqoDbx+Zt4RmI3RaIFvkGX1zR7/xbO6aepvugbK3YES4Vlx5tf5MpgvgKzTghmwiu48ErzVouZWMBAR+ATxTYy8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014100; c=relaxed/simple;
	bh=AG5SLgaXHOGtqnxzB/LgKFnn89QGFELDmMMRhT5X0Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0S1ydPC9fV35rYx9UsdWAjbf+QNIqHh2k9uYRwI6btWvDFq1MOutyw79G2tQBFtqZqf1JPZQWK+AVYVro6Rkkz9/iv/OAL5QpgJSozG399HmHAK4b0oW3B43aj/q6v3M3dNK8VD5JO4JJXKa0ZmBic9WQZThsg7P+IcvZn4VcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIHEEXme; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIHEEXme"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1207331a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774014098; x=1774618898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jr6O4/PxsSurjW2p9eceRBdtEHgeqQ0Gb6vR0xYFtXU=;
        b=GIHEEXme/gG9kLhTa7ZzeFGEKc4XUQxzhB2QdQy78Z2Dmhbu1p+dytifupiLOB+3CA
         /NhtiJG9VigpmX/rfXBgWwxdBYt83X+IL/xzQLcypHo3WOd+mBMVxf8EtTPz27W8J5J8
         L7gaXv9zcBbgFBmnqYL8O6HfNEr+c0eRJuPuloc57uhCrV3+MBZ5D0Zho5BCM/A+U4AG
         kbGaSv9xWX/BVOe6tU+QICUlp907MEaP7Wl7Xg6OgTSsU+AnLr9ogJyt/eQf+wqpz1dl
         P+WX/qW53koOUwraMIw48PiBcoAOmZ61mshBKqhp/eW9Xfuv8aot/YFrIlVGfpaxodud
         P+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774014098; x=1774618898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jr6O4/PxsSurjW2p9eceRBdtEHgeqQ0Gb6vR0xYFtXU=;
        b=CMGgEzrDICfS9X1/FoJNl6SgrvB7pC5tBMj5u8n/6fkubPoA/OM7SmvzbXO6iai20i
         O5dLRCn8VoYBQIPuZxWe536uSyVMVAaJtKXIP1xj/ex78CLx85mISGb/2/wdnrx9QUR3
         r3nydm9EdwHyyshAXSz69EVjVuuvqTcM5sanE33Qyu0Kvzi4e19a3Lrxq10RNVG3oDfF
         lqohjjfMFIK3og54GIus4a13BL9+oTrnZPx98tQVroDe3QLhKR5ZFJKtoTPrbOZo0ENM
         snFVKvKQSCSKxMramsR5cgmeJIlFuwKVc4t8nvOqveKYRuM33lUM+POfnSpHflU0727A
         iJUw==
X-Gm-Message-State: AOJu0Yxl6KTbUoXoekKdA0LXPSqBWEX4r2LB8D8t6Gc7ZHCCrYF0o9kh
	i38sms7qCseXBN6qZf85eHzBfEavKd7QniydA9JHAh7SxrCcJladhFlw
X-Gm-Gg: ATEYQzxRr6t9aPs8KCOgtdbry6LxF3RH5R8r15O94LDLWghhn5LFDfSiqX8t6t3Xmua
	4VnTIqgXoDTdxLWfyW5ClWQ+WItJpVdHCywnxmPTdCybZhn8PDq9VkswqAi3ZQaTN+nCXjTbFZJ
	nO9RWIXXsZhxMnFk6sezdJ0FYmpHbHT355uxyMcDOJBud7OERYSg+Gkz4uQNLBozk8hxJsI0LNL
	GyE8301siFn4rg+QjgTDuAKQa0WE99qceep4dGlHbtzWB4llS/PlmqxNf1D36uFtx/HNwlzPVnH
	RIphs48tSlagD96H8tp9rVxNzZMuGF5N9Yu7yTcGbdwNsdTTee0qOwwRx2TXNwS1rr5Wc4Nl2Io
	cBLvQcO0ngjL1Hto4ak8dAsJSr/wmIXZ7JIRn0vKnyNV9CUpMXDG0NgAfR6AnFjuHPpVtSnWK6l
	VzqRVfG+4Z8mWFYtSKKI2H98oPDxGQm2LwG5db13yEv6AzQtyXPvmePByDaaRdA1llWF/px6AJ
X-Received: by 2002:a17:90a:d2c7:b0:35b:92c1:8a3a with SMTP id 98e67ed59e1d1-35bd2bf5326mr2460905a91.14.1774014097684;
        Fri, 20 Mar 2026 06:41:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ed0777sm5517899a91.0.2026.03.20.06.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:41:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e77a16b5-13a6-48ab-8da9-dd7de141053c@roeck-us.net>
Date: Fri, 20 Mar 2026 06:41:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan
 driver
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320102442.150416-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260320102442.150416-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/26 03:24, Sergio Melas wrote:
> This driver provides fan speed monitoring for modern Lenovo Yoga,
> Legion, and IdeaPad laptops via ACPI.
> 
> This version (v3) replaces the previous background-worker approach with
> a passive RLLag (Rate Limited Lag) filter to maximize CPU sleep states
> and improve power efficiency.
> 

Change log and validation should be after "---"

> Technical Validation:
> - Filter constants (TAU_MS = 3000) verified via physical tachometer
>    and FOPTD (First Order Plus Time Delay) identification.
> - Uses 10-bit fixed-point math for the Taylor-approximated
>    alpha = Ts / (Tau + Ts) calculation.
> - Renamed to 'yogafan' for hwmon compliance.
> - Added MAINTAINERS entry and linked documentation to the build system.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Your patch is still not based on the upstream kernel, does not apply,
and therefore can not be reviewed.

Guenter

> ---
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/yogafan.rst |  51 ++++++
>   MAINTAINERS                     |   7 +
>   drivers/hwmon/Kconfig           |   7 +-
>   drivers/hwmon/Makefile          |   2 +-
>   drivers/hwmon/yogafan.c         | 273 ++++++++++++++++++++++++++++++++
>   6 files changed, 335 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/hwmon/yogafan.rst
>   create mode 100644 drivers/hwmon/yogafan.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b2ca8513c..ca438f294 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -282,4 +282,5 @@ Hardware Monitoring Kernel Drivers
>      xdp710
>      xdpe12284
>      xdpe152c4
> +   yogafan
>      zl6100
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> new file mode 100644
> index 000000000..c1614f502
> --- /dev/null
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -0,0 +1,51 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver yogafan
> +=====================
> +
> +Supported chips:
> +  * Lenovo Yoga / Legion / IdeaPad Embedded Controllers
> +    Prefix: 'yogafan'
> +    Addresses: ACPI (Dynamic probing of FANS, FA2S, FANX, etc.)
> +
> +Description
> +-----------
> +
> +This driver provides fan speed monitoring for modern Lenovo laptops.
> +It interfaces with the Lenovo Embedded Controller (EC) via ACPI to
> +retrieve fan tachometer data.
> +
> +Many Lenovo ECs report RPM values that oscillate rapidly due to
> +low-resolution internal sampling. To provide a stable reading in
> +userspace (e.g., KDE Plasma, MangoHud), this driver implements a
> +"Passive RLLag" (Rate Limited Lag) filter.
> +
> +Filter Logic:
> +he driver implements a Rate-Limited Lag (RLLag) filter using a multirate
> +approach. Instead of a fixed-interval background worker, the sampling
> +time (Ts) is calculated dynamically as the ktime delta between userspace
> +read requests.
> +
> +This mimics a continuous-time First Order Plus Time Delay (FOPTD) model:
> +    rpm_k+1 = rpm_k + clamp(step, -limit, limit)
> +
> +Where:
> +    step = alpha * (raw_rpm - rpm_k)
> +    alpha = Ts / (Tau + Ts)  [First-order Taylor approximation of 1-exp(-Ts/Tau)]
> +    limit = MaxSlew * Ts
> +
> +This ensures physical consistency of the signal regardless of the
> +userspace polling rate, while maximizing CPU sleep states.
> +
> +Probing:
> +The driver dynamically searches for common Lenovo ACPI fan handles.
> +It does not assume a fixed number of fans, making it compatible
> +across various Yoga and Legion generations.
> +
> +Usage Note:
> +If your device shows more fans than physically present, the EC is likely
> +exposing a virtual or secondary hardware channel.
> +
> +
> +
> +

Unnecessary empty lines

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96ea84948..dd16c882c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29070,6 +29070,13 @@ S:	Maintained
>   F:	Documentation/input/devices/yealink.rst
>   F:	drivers/input/misc/yealink.*
>   
> +YOGAFAN HARDWARE MONITORING DRIVER
> +M:	Sergio Melas <sergiomelas@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/yogafan.rst
> +F:	drivers/hwmon/yogafan.c
> +
>   Z8530 DRIVER FOR AX.25
>   M:	Joerg Reuter <jreuter@yaina.de>
>   L:	linux-hams@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7d938308d..d276763d6 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2468,6 +2468,7 @@ config SENSORS_YOGAFAN
>   	  This driver can also be built as a module. If so, the module
>   	  will be called yoga_fan.
>   
> +

No.

>   config SENSORS_VIA_CPUTEMP
>   	tristate "VIA CPU temperature sensor"
>   	depends on X86
> @@ -2753,8 +2754,4 @@ config SENSORS_HP_WMI
>   endif # ACPI
>   
>   endif # HWMON
> -config SENSORS_YOGA_FAN
> -	tristate "Lenovo Yoga Fan Hardware Monitoring"
> -	depends on ACPI && HWMON
> -	help
> -	  Support for fan RPM on modern Lenovo laptops.
> +

Huh ?

> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d8d4ff834..c74b71ec2 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -251,5 +251,5 @@ obj-$(CONFIG_SENSORS_PECI)	+= peci/
>   obj-$(CONFIG_PMBUS)		+= pmbus/
>   
>   ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> -obj-$(CONFIG_SENSORS_YOGA_FAN) += yoga_fan.o

Huh ?

> +obj-$(CONFIG_SENSORS_YOGAFAN) += yogafan.o
>   
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> new file mode 100644
> index 000000000..a260f4cf6
> --- /dev/null
> +++ b/drivers/hwmon/yogafan.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/**
> + * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
> + *
> + * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
> + * laptops by interfacing with the Embedded Controller (EC) via ACPI.
> + *
> + * The driver implements a passive discrete-time first-order lag filter
> + * with slew-rate limiting (RLLag). This addresses low-resolution
> + * tachometer sampling in the EC by smoothing RPM readings based on
> + * the time delta (dt) between userspace requests, ensuring physical
> + * consistency without background task overhead or race conditions.
> + * The filter has been removed implementing multirate filtering with autoreset in case
> + * of lage sampling time
> + *
> + * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/ktime.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define DRVNAME "yogafan"
> +#define MAX_FANS 8
> +
> +/* Filter Configuration Constants */
> +#define TAU_MS          3000    /* Time constant for the first-order lag (ms) */
> +#define MAX_SLEW_RPM_S  100     /* Maximum allowed change in RPM per second */
> +#define MAX_SAMPLING    5000    /* Maximum allowed Ts for reset */
> +
> +struct yoga_fan_data {
> +	const char *active_paths[MAX_FANS];
> +	long filtered_val[MAX_FANS];
> +	ktime_t last_update[MAX_FANS];
> +	int fan_count;
> +};
> +
> +/**
> + * apply_rllag_filter - Discrete-time filter update (Passive Multirate)
> + * @data: pointer to driver data
> + * @idx: fan index
> + * @raw_rpm: new raw value from ACPI
> + *
> + * Implements a Rate-Limited Lag (RLLag) filter using a multirate approach.
> + * Instead of a fixed-interval heartbeat, the sampling time (Ts) is calculated
> + * dynamically as the ktime delta between userspace read requests.
> + *
> + * This mimics a continuous-time First Order Plus Time Delay (FOPTD) model:
> + * rpm_k+1 = rpm_k + clamp(step, -limit, limit)
> + * where:
> + * step = (alpha * (raw_rpm - rpm_k))
> + * alpha = 1-exp(-Ts/Tau)
> + * Appling first order taylor approximation we get
> + * alpha = Ts / (Tau + Ts)
> + * limit = MaxSlew * Ts
> + *
> + * This ensures physical consistency of the signal regardless of the
> + * userspace polling rate.
> + */
> +
> +static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
> +{
> +	ktime_t now = ktime_get();
> +	s64 dt_ms;
> +	long delta, step, limit, alpha;
> +
> +	/* Initialize on first read to avoid starting from zero */
> +	if (data->last_update[idx] == 0) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_update[idx] = now;
> +		return;
> +	}
> +
> +	dt_ms = ktime_to_ms(ktime_sub(now, data->last_update[idx]));
> +
> +	/* * SANITATION: Reset filter if no reads occurred for MAX_SAMPLING
> +	 * millisecond. This prevents massive 'lag_steps' if userspace polling resumes
> +	 * after a long pause or system suspend.
> +	 */
> +	if (dt_ms > MAX_SAMPLING) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_update[idx] = now;
> +		return;
> +	}
> +
> +	/* SANITATION: Avoid division by zero or jitter from sub-millisecond reads */
> +	if (dt_ms < 1)
> +		return;
> +
> +	delta = raw_rpm - data->filtered_val[idx];
> +
> +	/* * Alpha = dt / (Tau + dt) using 10-bit fixed point math.
> +	 * This mimics the physical inertia (FOPTD) of the fan blades.
> +	 */
> +	alpha = (dt_ms << 10) / (TAU_MS + dt_ms);
> +	step = (delta * alpha) >> 10;
> +
> +	/* Slew Limit = (MaxSlew * dt) / 1000 - Bound the rate of change */
> +	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> +
> +	if (step > limit)
> +		step = limit;
> +	else if (step < -limit)
> +		step = -limit;
> +
> +	data->filtered_val[idx] += step;
> +
> +	/* SANITATION: Floor the value to zero if RPM is negligible */
> +	if (data->filtered_val[idx] < 50)
> +		data->filtered_val[idx] = 0;
> +
> +	data->last_update[idx] = now;
> +}
> +
> +static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct yoga_fan_data *data = dev_get_drvdata(dev);
> +	unsigned long long raw_acpi;
> +	acpi_status status;
> +	long rpm;
> +
> +	if (type != hwmon_fan || attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
> +
> +	/* Implemnt better casting of staus using ACPI typedef */
> +	status = acpi_evaluate_integer(NULL,
> +				       (acpi_string)data->active_paths[channel], NULL, &raw_acpi);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	/* * SANITATION: Lenovo EC typically reports RPM in hundreds for values <= 255.
> +	 * Values > 255 are treated as raw RPM. This handles different EC firmware styles.
> +	 */
> +	rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
> +
> +	apply_rllag_filter(data, channel, rpm);
> +
> +	*val = data->filtered_val[channel];
> +	return 0;
> +}
> +
> +static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	const struct yoga_fan_data *fan_data = data;
> +
> +	if (type == hwmon_fan && channel < fan_data->fan_count)
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops yoga_fan_hwmon_ops = {
> +	.is_visible = yoga_fan_is_visible,
> +	.read = yoga_fan_read,
> +};
> +
> +static const struct hwmon_channel_info *yoga_fan_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info yoga_fan_chip_info = {
> +	.ops = &yoga_fan_hwmon_ops,
> +	.info = yoga_fan_info,
> +};
> +
> +static int yoga_fan_probe(struct platform_device *pdev)
> +{
> +	struct yoga_fan_data *data;
> +	struct device *hwmon_dev;
> +	acpi_handle handle;
> +	int i;
> +
> +	static const char * const fan_paths[] = {
> +		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga 14c) */
> +		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion) */
> +		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim */
> +		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy */
> +		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate */
> +	};
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->fan_count = 0;
> +
> +	/* SANITATION: Verify ACPI path existence before indexing */
> +	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
> +		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
> +			data->active_paths[data->fan_count] = fan_paths[i];
> +			data->fan_count++;
> +
> +			if (data->fan_count >= MAX_FANS)
> +				break;
> +		}
> +	}
> +
> +	if (data->fan_count == 0)
> +		return -ENODEV;
> +
> +	/* SANITATION: Anchoring drvdata to avoid NULL returns during unload */
> +	platform_set_drvdata(pdev, data);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
> +							 data, &yoga_fan_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver yoga_fan_driver = {
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +	.probe = yoga_fan_probe,
> +};
> +
> +static struct platform_device *yoga_fan_device;
> +
> +static const struct dmi_system_id yoga_dmi_table[] __initconst = {
> +	{
> +		.ident = "Lenovo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, yoga_dmi_table);
> +
> +static int __init yoga_fan_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(yoga_dmi_table))
> +		return -ENODEV;
> +
> +	ret = platform_driver_register(&yoga_fan_driver);
> +	if (ret)
> +		return ret;
> +
> +	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
> +	if (IS_ERR(yoga_fan_device)) {
> +		platform_driver_unregister(&yoga_fan_driver);
> +		return PTR_ERR(yoga_fan_device);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit yoga_fan_exit(void)
> +{
> +	platform_device_unregister(yoga_fan_device);
> +	platform_driver_unregister(&yoga_fan_driver);
> +}
> +
> +module_init(yoga_fan_init);
> +module_exit(yoga_fan_exit);
> +
> +MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
> +MODULE_LICENSE("GPL");

