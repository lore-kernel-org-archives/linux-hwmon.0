Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BDD1EB19B
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 01:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774229883; cv=none; b=AEoG3J+AFcKDbcTuMAzNZuvZOBW+bznydNmfYc3sReUDc3qmhbdHdejlsUUrNnuYyhxUFJ8Ym7sl3GnIHWkrNef/TTVGGpXlYONdxnXrO4QntUKAr6HsorG+L5DRhdecklYIDnfTZdfuoZOjZEx+2B5rfqWDtPC3KH4oYqhuiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774229883; c=relaxed/simple;
	bh=OhocoFsXms9La1ijRCAXjDCLorb2RoD8gYvRbcNhJ7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNg7wuforMumkJt6S5dXivvO9VgJOdy11cdzmg+JXiJCDKYa8CfIyre9rA/di8XoRH9fwhkDUVQ9vTEnwOlC0xhwb73I4hdfh/wTsy/vIVHLAm9Qdnt1TXc2BtKlZBmBNO44O4P0/Ze6mQvLymsn6zetvd4DrS2fx97QgiaS0aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvgTSa+8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvgTSa+8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2addb31945aso26189915ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 18:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774229881; x=1774834681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=93PAfDcTU0xUnbriiDqlYvDStY5oBDD2nTnV4jzLeBQ=;
        b=MvgTSa+8xclDGTKGrNTxInGYsXb1qV8nXMXmoyqVHK3e5uoQzCb0hSIrASNdzRlnpd
         Dw7Ru7cWUT0TLbwAIBAS/BHQyqAK53KMVYjPtoWmf3kbNqBL0eWiVvgXU+Bc20nwWbIm
         WSlf2CI5hkPcy2814HWHGKL2oO+xvLoFQeojI2DWGQuC7nfwN/kIXbcfMsRwZ6Htwupg
         gIpL+7AOva/dTt3JIK6rw1Qy2Q3CrSiVOZRJf1r4LI9Tc0yV+bs261/0TmRkqZKUorEO
         4573e/W6BgXcD4nLUYeC1bMyCCk1qEr5nRSCO+PizVoXTlw1yCneXsSrxbnmUFZYdLnO
         pYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774229881; x=1774834681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93PAfDcTU0xUnbriiDqlYvDStY5oBDD2nTnV4jzLeBQ=;
        b=KwWg5A0l04Vp7eB3amepWJWqnxFgkJsQIxVxqaJbvNAPcOUGSibRGpzjykI9CqfZ8m
         E/yVGvwhM9ptWxzrxpOZMJHrd4eLCP9vYN4NBO1shbKmJKNMM7KZCmw5rf9+OlEno+4W
         Gha0EVmMJGH+X5i3Lew4U1G/YV+CSA3KRu3vfMD/iY6VJ8QZmwVL8aIjj3TprSzemVWy
         W0cK2Shk6tmVILwo422rdulknhwNVsd0aPNpkXmwzNUeAtlGs8Eo+I/Ha7M4vqASVOaP
         VfJ1DJ4XU5OzOgtj6ALcOrivUV1AVien2BEFucqHPD0JsreVujIE3jPoMe6z2XqHjKKd
         32GA==
X-Gm-Message-State: AOJu0Yz+bAQ5lZhI+TyzBox5ZgVnaM8FYVx8Z6/yP8NbBiM0ifofTSuO
	tzr+pneoDOTHA+9bP3vuryBR8FsIfDAyjSQgvJGyvIHSYN/tleZCDk0XdtQhPw==
X-Gm-Gg: ATEYQzzb05/epMlXCMlNGIgfdgda2p6PaWI2yoB4wZcOsSkePpKtwoz0heVnerIPtoW
	//sbkFMvC1obzAXLN83LPL9FtLWb3gILqDJ8VC4LXGVZ/Nk78W8tI/gc7yFe9YXDv51SwXPCI9V
	2RNg1qrJ43rjxCh0Ars1R0o9pBPviEhU5o988SraKBPtoTpaD+h3vHEo0PEj7TN+UtPCPgUowvN
	ci3/LmrM86KIvX3GUiqTJYKDcG1LpGnftvQJyDRPLcSpW+Dmoi6syhkYI6nkGKnX3AgYaKP4Vuw
	42gWEbKmtHapYYKcKIWh30Qp4z7pkzP4D7lLvIOiX8y6/RAsZpgvPxK7pDQHcY/vxZKN9H3OV1j
	Nmc7BnxDqL8XOs9ArXSqeB44p/u1Z+nK6BybJBBD1fMmmBfsIlLsddAM4Z97i1iTHaqg2qtg49u
	qC+k8B32x1vKdPctH/COWW5buMwohTStcMxdmhA38W6/mQjiA0qxbxaB+6iLCS8YW4EV59OJOM
X-Received: by 2002:a17:902:f652:b0:2b0:67d9:b362 with SMTP id d9443c01a7336-2b08271b848mr95590895ad.19.1774229880594;
        Sun, 22 Mar 2026 18:38:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08353e94asm89662015ad.25.2026.03.22.18.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 18:37:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e692427-592a-4a78-8f6b-547d506de86a@roeck-us.net>
Date: Sun, 22 Mar 2026 18:37:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan
 monitoring
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260322203809.44048-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260322203809.44048-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/22/26 13:38, Sergio Melas wrote:
> This driver provides fan speed monitoring for modern Lenovo Yoga,
> Legion, and IdeaPad laptops. It interfaces with the Embedded
> Controller (EC) via ACPI to retrieve tachometer data.
> 
> To address low-resolution sampling in the Lenovo EC firmware, the
> driver implements a Rate-Limited Lag (RLLag) filter using a passive
> discrete-time first-order model. This ensures physical consistency
> of the RPM signal regardless of userspace polling rates.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
> v4:

First of all, please version your patches. You do provide change logs,
and thanks for that, but the subject should start with [PATCH v4].

Second, Sashiko still reports several problems.

https://sashiko.dev/#/patchset/20260322203809.44048-1-sergiomelas%40gmail.com

As far as I can see they are all real problems. Please address.

Thanks,
Guenter

> - Rebased on groeck/hwmon-next branch for clean application.
> - Removed unnecessary blank lines and cleaned code formatting.
> - Corrected alphabetical sorting in Kconfig and Makefile.
> - Technical Validation & FOPTD Verification:
>    - Implemented FOPTD (First Order Plus Time Delay) modeling.
>    - Used 10-bit fixed-point math for alpha calculation to avoid
>      floating point overhead in the kernel.
>    - Added 5000ms filter reset for resume/long-polling sanitation.
> - Hardware Discovery:
>    - Confirmed support for paths: FANS, FA2S, FAN0.
>    - Restricted to LENOVO hardware via DMI matching.
> ---
>   MAINTAINERS             |   6 +
>   drivers/hwmon/Kconfig   |  11 ++
>   drivers/hwmon/Makefile  |   1 +
>   drivers/hwmon/yogafan.c | 247 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 265 insertions(+)
>   create mode 100644 drivers/hwmon/yogafan.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 830c6f076b00..9167f3d4f243 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14873,6 +14873,12 @@ W:	https://linuxtv.org
>   Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>   F:	drivers/media/usb/dvb-usb-v2/lmedm04*
>   
> +LNVYOGAFAN HARDWARE MONITORING DRIVER
> +M:	Sergio Melas <sergiomelas@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/yogafan.c
> +
>   LOADPIN SECURITY MODULE
>   M:	Kees Cook <kees@kernel.org>
>   S:	Supported
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index fb77baeeba27..3bb91623b157 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2653,6 +2653,17 @@ config SENSORS_XGENE
>   	  If you say yes here you get support for the temperature
>   	  and power sensors for APM X-Gene SoC.
>   
> +config SENSORS_YOGAFAN
> +	tristate "Lenovo Yoga/Legion Fan Hardware Monitoring"
> +	depends on ACPI && HWMON
> +	help
> +	  If you say yes here you get support for fan speed monitoring
> +	  on modern Lenovo Yoga and Legion laptops.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called yogafan.
> +
> +
>   config SENSORS_INTEL_M10_BMC_HWMON
>   	tristate "Intel MAX10 BMC Hardware Monitoring"
>   	depends on MFD_INTEL_M10_BMC_CORE
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 556e86d277b1..0fce31b43eb1 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -245,6 +245,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
>   obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
>   obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>   obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
> +obj-$(CONFIG_SENSORS_YOGAFAN)	+= yogafan.o
>   
>   obj-$(CONFIG_SENSORS_OCC)	+= occ/
>   obj-$(CONFIG_SENSORS_PECI)	+= peci/
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> new file mode 100644
> index 000000000000..10c48fca8387
> --- /dev/null
> +++ b/drivers/hwmon/yogafan.c
> @@ -0,0 +1,247 @@
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
> + * The filter implements multirate filtering with autoreset in case
> + * of large sampling time.
> + *
> + * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
> + */
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/ktime.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#define DRVNAME "yogafan"
> +#define MAX_FANS 8
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
> + * Applying first order taylor approximation we get:
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
> +	/* Initialize on first read to avoid starting from zero */
> +	if (data->last_update[idx] == 0) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_update[idx] = now;
> +		return;
> +	}
> +	dt_ms = ktime_to_ms(ktime_sub(now, data->last_update[idx]));
> +	/* SANITATION: Reset filter if no reads occurred for MAX_SAMPLING
> +	 * milliseconds. This prevents massive 'lag_steps' if userspace polling resumes
> +	 * after a long pause or system suspend.
> +	 */
> +	if (dt_ms > MAX_SAMPLING) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_update[idx] = now;
> +		return;
> +	}
> +	/* SANITATION: Avoid division by zero or jitter from sub-millisecond reads */
> +	if (dt_ms < 1)
> +		return;
> +	delta = raw_rpm - data->filtered_val[idx];
> +	/* Alpha = dt / (Tau + dt) using 10-bit fixed point math.
> +	 * This mimics the physical inertia (FOPTD) of the fan blades.
> +	 */
> +	alpha = (dt_ms << 10) / (TAU_MS + dt_ms);
> +	step = (delta * alpha) >> 10;
> +	/* Slew Limit = (MaxSlew * dt) / 1000 - Bound the rate of change */
> +	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> +	if (step > limit)
> +		step = limit;
> +	else if (step < -limit)
> +		step = -limit;
> +	data->filtered_val[idx] += step;
> +
> +	/* SANITATION: Floor the value to zero if RPM is negligible */
> +	if (data->filtered_val[idx] < 50)
> +		data->filtered_val[idx] = 0;
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
> +	/* Implement better casting of status using ACPI typedef */
> +	status = acpi_evaluate_integer(NULL, (acpi_string)data->active_paths[channel],
> +					NULL, &raw_acpi);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	/* SANITATION: Lenovo EC typically reports RPM in hundreds for values <= 255.
> +	 * Values > 255 are treated as raw RPM. This handles different EC firmware styles.
> +	 */
> +	rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
> +	apply_rllag_filter(data, channel, rpm);
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
> +	static const char * const fan_paths[] = {
> +		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga 14c) */
> +		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion) */
> +		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim */
> +		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy */
> +		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate */
> +	};
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
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
> +	/* SANITATION: Anchoring drvdata to avoid NULL returns during unload */
> +	platform_set_drvdata(pdev, data);
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
> +							 data, &yoga_fan_chip_info, NULL);
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
> +	ret = platform_driver_register(&yoga_fan_driver);
> +	if (ret)
> +		return ret;
> +	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
> +	if (IS_ERR(yoga_fan_device)) {
> +		platform_driver_unregister(&yoga_fan_driver);
> +		return PTR_ERR(yoga_fan_device);
> +	}
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
> +MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: be8aad7a8a14151fd471aadf368e1582f91a7817

