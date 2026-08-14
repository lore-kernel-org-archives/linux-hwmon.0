Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DE1A23A6
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 03:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786678767; cv=none; b=OzVKsB04OlxekdONBewHfn6/5ZaDG9qLvrQbojZNoQPdWG0wS9gHV2VLiuUjLCPRhEoLe23ELv5wKXkHu5ZYu6H34SPeAm905dJitZH+4566B+vvBRnJvYpbEVtDhEcDzSRYpXAXXcir1T+L6BIYLq1dIOSYMwgDsaemuxPuVwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786678767; c=relaxed/simple;
	bh=tU52kobVZ0mWzI5CBatRF9t2vRK5O8wR37oS7pEJuJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhWr4s3JLlKgjH5pXpeen1TVt3ISSSapxBHNmvy5LfMR6KAhGGA62vyDPiWCeNyzm/DwiAms4P9mPcGNP0DgQjTnRQCTu4nHZh+4BzLYJqCYcBJevsQ3emd/qk+BbzalongyVXHe/ALlodZQxOCsJr1MzhbKvz/NNrTg7cxfVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNUs1WAD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNUs1WAD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d02b4c3601so7266765ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 20:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786678765; x=1787283565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tcxxYDVPsk84iOlr8Lz1AxWckzSgZuum0qdbctVTnaA=;
        b=tNUs1WADHtjvNr4GTPd45ZOmN5Dyu6ZBZLv+BB50VDAWbJaYKqR/beXU6aoYKeq9SD
         SdDSu6vhAliJOoNS7cZpYg+2kKFnf53W6pnIPRfNHdNePUKQIV89eUncOBDLqEqJYKAw
         kiVl7aj+BJpwSMqev4Go7MntySGR5Eyy03457eH62loZwlXczKyenL86ZJcxkZCol/z2
         ajSSB7NNKKxLWcVA4nb83j5RYcqqT5R5z2WaZ5My2/dJtTM+61ehQ2IYbQfyMKz1MQec
         6Ozof9anO4sFcQDE9J8iK4OHraUJz1B/1v+cBCD7DsSiVev8o9iZoH9Jqr5UT0nUxRoi
         hN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786678765; x=1787283565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcxxYDVPsk84iOlr8Lz1AxWckzSgZuum0qdbctVTnaA=;
        b=FrBh2zeAx9G6wS3I8nyVVNjabtKoDblZ9SVEeHQ5xlKhE0j3M2GYpafhreN7r7ImX6
         im8pjcD3MMC+hWpZ8FGBCKJwioZ09WZAFbgBvidjFWoGCMy6aV5kjabaoQvwGA9uCn1a
         vbOpXZjHaKC1h9HD70A0xpfmICN7D8zJoiGIB8PhqPRsJzrtTkY2PmZw4LA01Vi3lwcZ
         IbqVkLEnKB9g58HSvePj3bzvgoobHnThJrwbTDCxUgdLhK9lxN5vPvkiQyqTe+MzSc7A
         2oGWCDi3A1JuSfFLBLyT8tV4UOiu94F+v7QynCgg9dFfHoKKrnwgzW6repRoPK4q3MbL
         0wHA==
X-Gm-Message-State: AOJu0YxmfbjRjVCifOQkJMGbgwe4pvKO4DoRnie3v8vMPlQf8cQSCo0H
	fe4CoggPrjzPLuIy3OoXcPY1+5PaWhPeTy7hzX7kKi4y+9kqdlO8R1JC
X-Gm-Gg: AR+sD13FHcQxKAjJnGzv8NLHamjjO31My2qGW/BXjUENT4ViqKyjHWu7fBXTrUl70kV
	QLIwe+GB5Dcv8+TUZcAl645Hb5X5ZvOL56WlKMI8JPXcIBspCAABY0FW4+AgO1AgiyAH7OR4Mbv
	vmivkC6P824rxLRMhCxOkLXP5ujPcZCVHtUQaNjgLRPN4RP07fPqocHPA6LU7fOpRvvPez9SWx+
	eheX26z3rbStmPy1q6F2l26X0w7dNJ+G2bWPcCB/BzOyjO9ID1o56RXG0PcJfX+oLed+juCLtgI
	iAzQMz9Jwv0FiBxe7XDJlZM74OK/Z/W25LdJ/qaJwGNgVTEi2MHiom4z+sRhpZrj7TMUzSBW09e
	Kj2TNRH+amj0sGqP+cu/g9tw2BnGGXey0/LSnuatQCm39npppm2ofWG+uEoCAJtknTFiLCwiphm
	lIjSDoYMYDRexgKkYFCWVwY/rcgtbFJCNcqf4R+1nvDSKDM71LmVX4PrCPMURf1r17vQ12R1uYx
	A==
X-Received: by 2002:a17:903:1b45:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d3b08682e5mr32580005ad.6.1786678764514;
        Thu, 13 Aug 2026 20:39:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb29f45sm3765685ad.43.2026.08.13.20.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:39:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Aug 2026 20:39:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nikita Dubrovskih <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] hwmon: Add fan monitoring support for HONOR FMI-XX
Message-ID: <d0fa2041-427b-499f-abce-820f50d94316@roeck-us.net>
References: <20260812192242.859307-1-testname142@gmail.com>
 <20260813091411.1186193-1-testname142@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813091411.1186193-1-testname142@gmail.com>

On Thu, Aug 13, 2026 at 12:14:11PM +0300, Nikita Dubrovskih wrote:
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

Looks ok. I do not have any further comments.

This is an RFC, so I won't apply it.

Thanks,
Guenter

> Changes in v2:
> - Drop the redundant mutex and callback argument validation.
> - Remove unused platform drvdata and simplify the init error path.
> - Align the macro definition and order the MAINTAINERS entry.
> 
>  Documentation/hwmon/honor-fmi.rst |  32 ++++++
>  Documentation/hwmon/index.rst     |   1 +
>  MAINTAINERS                       |   7 ++
>  drivers/hwmon/Kconfig             |  10 ++
>  drivers/hwmon/Makefile            |   1 +
>  drivers/hwmon/honor-fmi.c         | 178 ++++++++++++++++++++++++++++++
>  6 files changed, 229 insertions(+)
>  create mode 100644 Documentation/hwmon/honor-fmi.rst
>  create mode 100644 drivers/hwmon/honor-fmi.c
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
>     gxp-fan-ctrl
>     hac300s
>     hih6130
> +   honor-fmi
>     hp-wmi-sensors
>     hs3001
>     htu31
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f..7f2e3f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11876,6 +11876,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
>  F:	drivers/iio/pressure/mprls0025pa*
>  
> +HONOR FMI-XX HARDWARE MONITOR DRIVER
> +M:	Nikita Dubrovskih <testname142@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/honor-fmi.rst
> +F:	drivers/hwmon/honor-fmi.c
> +
>  HP BIOSCFG DRIVER
>  M:	Jorge Lopez <jorge.lopez2@hp.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc0..8a11a30 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2785,6 +2785,16 @@ config SENSORS_ASUS_EC
>  	  This driver can also be built as a module. If so, the module
>  	  will be called asus_ec_sensors.
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
>  config SENSORS_HP_WMI
>  	tristate "HP WMI Sensors"
>  	depends on ACPI_WMI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 63effc0..e098793 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
>  obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
>  obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
>  obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
> +obj-$(CONFIG_SENSORS_HONOR_FMI)	+= honor-fmi.o
>  obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
>  
>  # Native drivers
> diff --git a/drivers/hwmon/honor-fmi.c b/drivers/hwmon/honor-fmi.c
> new file mode 100644
> index 0000000..3421e40
> --- /dev/null
> +++ b/drivers/hwmon/honor-fmi.c
> @@ -0,0 +1,178 @@
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
> +#include <linux/platform_device.h>
> +
> +#define HONOR_FMI_GFNS_RESULT_SIZE	3
> +
> +struct honor_fmi_data {
> +	acpi_handle gfns;
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
> +	return 0444;
> +}
> +
> +static int honor_fmi_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *value)
> +{
> +	struct honor_fmi_data *data = dev_get_drvdata(dev);
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
> +		platform_driver_unregister(&honor_fmi_driver);
> +		return PTR_ERR(honor_fmi_device);
> +	}
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
