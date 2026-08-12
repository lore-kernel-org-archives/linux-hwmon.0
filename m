Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B468401A14
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 22:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574993; cv=none; b=U64plbHJmHg3T2Um8unSawe2Xm/inI8sZAXNvM3bJ7lsg60FoJuOKZYtuEyXkoHD9SYmh7xG0nmeuRWQ5C5557xoGOwwr2juc7e5/y0DsFzYbsOWumYRUILfpZZGl2MjAP2AGkflbFC3ezTZOQuYMFN3bxAB+v0w1n6q85Q/PXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574993; c=relaxed/simple;
	bh=8bscB7HLxKgOtvyyRTxkCh+gfRsmkLjEQeSgMpRLT9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUxEN+kZLx3nKpPpD6bZsTMDqCDXwm5ZQU2vTh3GmH8ZPnicwAcqTjB87xOzGlsargBqqdy5pr1SMlknJp5gtGyqHDxDQsaQZeabDLnQY4xTZYg8l7WOeEfB6gIWZBfvP4IAsW68HsOMzQifpj2XDioQt6ZNx2E+WgEXQrYspAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOyjG6xF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOyjG6xF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so1932346a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786574991; x=1787179791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xL9ynm4qSF0AXhauEtPWEZJKcBohkb1eEBH9Bp98wwU=;
        b=WOyjG6xFUZ7vpqoU5vMpIl1kGL3ATBkLuJTvbUefGHXIr7ukzMgzq1+zSxqLKxUfMq
         zkixCMpvVcjn+4oUoZwgMwHslHctVCHvwE3KIcnYJ/GOd6DjY8JW9iGgBTGTr3rVn5lH
         xnSOBrDVjhTJ+TOJNorEyhIP6fzxMxQf/F3YpxfUZXWJa+f38PsDmW6aZypyFIeoq9ng
         RDpLRYOZxK77iuXcJejQqDFj+P4uO8UqoFET+Zrqy6EMjvd0Agbp0i89wyYe1NYWNKfn
         h/Jp0XxHGAUq2zAv0TQvLtCzP26QH7V7J38ydgm6PVB96VMYFS5A4EMU9WM0cldbP+cr
         39xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786574991; x=1787179791;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xL9ynm4qSF0AXhauEtPWEZJKcBohkb1eEBH9Bp98wwU=;
        b=BabL6Cn8PRw2IL67rbrSp7WF0LXuEKOMNwbbXA2X/9aD5aPfu9JQuGQqgtQclNnp78
         UyZd644kD+eeg6MfKEOBFctckrVDSuKl8HDDoiyrzNr/gMzg9FJbqDL404j5PvYPUf/E
         Y2URQN85iBerSmDMB1P7Ct7eRFTTV2vhXnrOvuMY8Ys7LS0BrIjQEB03QibTGIRLGt2c
         pK2RgEhZsxXFJPSQn6pPk58Nj+isFZgFxPDg5Vl95OZe0tb1IU3DcdfVvVoly940Qcsn
         LivE/OZEAncKKiXrOJ3CGRMT6lKub8QKnQQuRJaG1CW55hu4Jqa9dlazquteiTPdlPsN
         nhAA==
X-Forwarded-Encrypted: i=1; AHgh+RpRb3Jg3AXEQPn9ri27VjVwiVIj6gkDwPVuf5RFRTKyQYNgPF2Gl8SitddES1lFaqL9FgCKcnb/w1jExw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDahKE55N+EKsAXygoUpXKBAXRw+y5wMisFNoOwfzx3BwSJz3/
	cnNbISsdnfO6CwnQGvdDvK1pIjrKX8N/M6nuyvWHSl+XnCk38ERRojiyYDUG8w==
X-Gm-Gg: AR+sD10N0brMwijRYDCtOE8hUaktS7r65Q/L48yH/4wBKTUEtnoLZ5zO8rDlmxe0kQa
	sK9IO6DPuxiYbsVDcOLwRUEJoegBkoVWqnU0UhnBAlk82nGNlJCjyY0QG8pmA3+T/h0sxXIw9Dy
	jirfRc4bzDxfxLveflUG1eti+wacjw9IUaWSlsT5pKK8v5o2XhpSQblv0Hw1XynCplSuk24JGcU
	MiGmOr2nQEOT2cFPEXT7fy+M24LrLFGTq8I5zqIj0M+e7ckiFQKz42GeAy79VEnz9X7wGkx4lnh
	fVSnzeXjmC8heUpEyT2vPiHNnrzrPESDctjXTMRyyZRkYhREPxvNnxOgvljKFdkQVEAnqD52cRN
	DaAyoHdWipzZLsFDLYuiz165Wb7Oa7niza0vIEtHE9OX0XeQbCeTw+tH+ZGnbfVPotfzFZDmvVQ
	IdTldAYpspuDfQaNwAFoZXLbVn1MOf9lawULo68KzRl72hJZQ0/SQ/S9lHGEXDAFxk2Ae/FS12o
	vkZAUIl50n1+FoYPPzgJR6FA3lp2deWF34Z3A==
X-Received: by 2002:a17:90b:5444:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-3931e298253mr1789550a91.15.1786574991287;
        Wed, 12 Aug 2026 15:49:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d984aacsm234970a91.1.2026.08.12.15.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 15:49:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c2f2a1b9-808f-4048-aefe-fdba8a4c4ec1@roeck-us.net>
Date: Wed, 12 Aug 2026 15:49:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: Add fan monitoring support for HONOR FMI-XX
To: Nikita Dubrovskih <testname142@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812192242.859307-1-testname142@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260812192242.859307-1-testname142@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:22, Nikita Dubrovskih wrote:
> The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
> It returns a status byte and a 16-bit fan speed in RPM for either of two
> firmware channels.
> 
> Add a DMI-restricted, read-only hwmon driver using that firmware
> interface. The driver deliberately exposes no fan control or direct
> Embedded Controller access.
> 
> The interface was validated on firmware 1.09 with fan channel 0
> reporting approximately 2500-2800 RPM. Channel 1 is readable and
> remained at 0 RPM during idle and a short CPU load.
> 
> Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>
> ---
>   Documentation/hwmon/honor-fmi.rst |  32 +++++
>   Documentation/hwmon/index.rst     |   1 +
>   MAINTAINERS                       |   7 ++
>   drivers/hwmon/Kconfig             |  10 ++
>   drivers/hwmon/Makefile            |   1 +
>   drivers/hwmon/honor-fmi.c         | 195 ++++++++++++++++++++++++++++++
>   6 files changed, 246 insertions(+)
>   create mode 100644 Documentation/hwmon/honor-fmi.rst
>   create mode 100644 drivers/hwmon/honor-fmi.c
> 
> diff --git a/Documentation/hwmon/honor-fmi.rst b/Documentation/hwmon/honor-fmi.rst
> new file mode 100644
> index 0000000..a42a1dd
> --- /dev/null
> +++ b/Documentation/hwmon/honor-fmi.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver honor-fmi
> +=======================
> +
> +Supported systems:
> +
> +  * HONOR FMI-XX
> +
> +Author: Nikita Dubrovskih <testname142@gmail.com>
> +
> +Description
> +-----------
> +
> +The driver provides read-only monitoring of the fan speed on the HONOR FMI-XX.
> +The system firmware implements a ``GFNS`` ACPI method which returns the speed
> +of one of two firmware fan channels in RPM. Embedded Controller access and
> +serialization are handled by the firmware method.
> +
> +The driver does not expose fan control or direct Embedded Controller access.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported:
> +
> +======================= ======= =============================================
> +Name                    Perm    Description
> +======================= ======= =============================================
> +``fan1_input``          RO      Fan channel 0 speed in RPM
> +``fan2_input``          RO      Fan channel 1 speed in RPM
> +======================= ======= =============================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 29130df..91052fa 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -90,6 +90,7 @@ Hardware Monitoring Kernel Drivers
>      gxp-fan-ctrl
>      hac300s
>      hih6130
> +   honor-fmi
>      hp-wmi-sensors
>      hs3001
>      htu31
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f..d7355db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11854,6 +11854,13 @@ F:	lib/test_hmm*
>   F:	mm/hmm*
>   F:	tools/testing/selftests/mm/*hmm*
>   
> +HONOR FMI-XX HARDWARE MONITOR DRIVER
> +M:	Nikita Dubrovskih <testname142@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/honor-fmi.rst
> +F:	drivers/hwmon/honor-fmi.c
> +
>   HONEYWELL ABP2030PA PRESSURE SENSOR SERIES IIO DRIVER
>   M:	Petre Rodan <petre.rodan@subdimension.ro>
>   L:	linux-iio@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc0..8a11a30 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2785,6 +2785,16 @@ config SENSORS_ASUS_EC
>   	  This driver can also be built as a module. If so, the module
>   	  will be called asus_ec_sensors.
>   
> +config SENSORS_HONOR_FMI
> +	tristate "HONOR FMI-XX fan monitor"
> +	depends on X86
> +	help
> +	  If you say yes here, you get support for fan speed monitoring on
> +	  the HONOR FMI-XX laptop through its firmware ACPI method.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called honor-fmi.
> +
>   config SENSORS_HP_WMI
>   	tristate "HP WMI Sensors"
>   	depends on ACPI_WMI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 63effc0..e098793 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
>   obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
>   obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
>   obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
> +obj-$(CONFIG_SENSORS_HONOR_FMI)	+= honor-fmi.o
>   obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
>   
>   # Native drivers
> diff --git a/drivers/hwmon/honor-fmi.c b/drivers/hwmon/honor-fmi.c
> new file mode 100644
> index 0000000..225066e
> --- /dev/null
> +++ b/drivers/hwmon/honor-fmi.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Read-only fan monitoring for the HONOR FMI-XX.
> + *
> + * The firmware-provided \GFNS ACPI method accepts a three-byte buffer.
> + * Byte 2 selects fan 0 or 1. It returns a status byte followed by a
> + * little-endian 16-bit fan speed in RPM. The method owns all Embedded
> + * Controller access and serialization; this driver deliberately exposes no
> + * fan control interface.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#define HONOR_FMI_FAN_COUNT 2
> +#define HONOR_FMI_GFNS_RESULT_SIZE 3

#define<space>NAME<tab>value

and align value, please.

> +
> +struct honor_fmi_data {
> +	acpi_handle gfns;
> +	/* Serialize firmware method evaluation. */
> +	struct mutex lock;

I do not see why this lock would be needed on top of the hardware
monitoring subsystem lock.

> +};
> +
> +static const struct dmi_system_id honor_fmi_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HONOR"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FMI-XX"),
> +		},
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, honor_fmi_dmi_table);
> +
> +static int honor_fmi_read_rpm(struct honor_fmi_data *data, int channel,
> +			      long *rpm)
> +{
> +	union acpi_object input = {
> +		.buffer = {
> +			.type = ACPI_TYPE_BUFFER,
> +			.length = 3,
> +		},
> +	};
> +	struct acpi_object_list arguments = {
> +		.count = 1,
> +		.pointer = &input,
> +	};
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *result;
> +	u8 input_bytes[3] = { 0, 0, channel };
> +	acpi_status status;
> +	int ret = 0;
> +
> +	input.buffer.pointer = input_bytes;
> +
> +	guard(mutex)(&data->lock);
> +	status = acpi_evaluate_object(data->gfns, NULL, &arguments, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	result = output.pointer;
> +	if (!result || result->type != ACPI_TYPE_BUFFER ||
> +	    result->buffer.length < HONOR_FMI_GFNS_RESULT_SIZE) {
> +		ret = -EPROTO;
> +		goto out_free;
> +	}
> +
> +	if (result->buffer.pointer[0]) {
> +		ret = -EIO;
> +		goto out_free;
> +	}
> +
> +	*rpm = result->buffer.pointer[1] |
> +	       (result->buffer.pointer[2] << 8);
> +
> +out_free:
> +	kfree(output.pointer);
> +	return ret;
> +}
> +
> +static umode_t honor_fmi_is_visible(const void *data,
> +				    enum hwmon_sensor_types type, u32 attr,
> +				    int channel)
> +{
> +	if (type == hwmon_fan && attr == hwmon_fan_input &&
> +	    channel < HONOR_FMI_FAN_COUNT)
> +		return 0444;

Unnecessary check. Just return 0444.

> +
> +	return 0;
> +}
> +
> +static int honor_fmi_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *value)
> +{
> +	struct honor_fmi_data *data = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_fan || attr != hwmon_fan_input ||
> +	    channel >= HONOR_FMI_FAN_COUNT)
> +		return -EOPNOTSUPP;

Unnecessary check.

> +
> +	return honor_fmi_read_rpm(data, channel, value);
> +}
> +
> +static const struct hwmon_ops honor_fmi_hwmon_ops = {
> +	.is_visible = honor_fmi_is_visible,
> +	.read = honor_fmi_read,
> +};
> +
> +static const struct hwmon_channel_info * const honor_fmi_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info honor_fmi_chip_info = {
> +	.ops = &honor_fmi_hwmon_ops,
> +	.info = honor_fmi_hwmon_info,
> +};
> +
> +static int honor_fmi_probe(struct platform_device *pdev)
> +{
> +	struct honor_fmi_data *data;
> +	struct device *hwmon_dev;
> +	acpi_status status;
> +
> +	if (!dmi_check_system(honor_fmi_dmi_table))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	status = acpi_get_handle(NULL, "\\GFNS", &data->gfns);
> +	if (ACPI_FAILURE(status))
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "firmware does not provide \\GFNS\n");
> +
> +	mutex_init(&data->lock);
> +	platform_set_drvdata(pdev, data);

I do not see where this is used or needed.

> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "honor_fmi",
> +							 data,
> +							 &honor_fmi_chip_info,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver honor_fmi_driver = {
> +	.probe = honor_fmi_probe,
> +	.driver = {
> +		.name = "honor-fmi-hwmon",
> +	},
> +};
> +
> +static struct platform_device *honor_fmi_device;
> +
> +static int __init honor_fmi_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(honor_fmi_dmi_table))
> +		return -ENODEV;
> +
> +	ret = platform_driver_register(&honor_fmi_driver);
> +	if (ret)
> +		return ret;
> +
> +	honor_fmi_device = platform_device_register_simple("honor-fmi-hwmon",
> +							   PLATFORM_DEVID_NONE,
> +							   NULL, 0);
> +	if (IS_ERR(honor_fmi_device)) {
> +		ret = PTR_ERR(honor_fmi_device);
> +		platform_driver_unregister(&honor_fmi_driver);
> +		return ret;

No need to assign the error to ret.

		return PTR_ERR(honor_fmi_device);> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit honor_fmi_exit(void)
> +{
> +	platform_device_unregister(honor_fmi_device);
> +	platform_driver_unregister(&honor_fmi_driver);
> +}
> +
> +module_init(honor_fmi_init);
> +module_exit(honor_fmi_exit);
> +
> +MODULE_AUTHOR("Nikita Dubrovskih <testname142@gmail.com>");
> +MODULE_DESCRIPTION("HONOR FMI-XX fan speed monitor");
> +MODULE_LICENSE("GPL");

