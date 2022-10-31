Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE263FA3741
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 19:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJaT4Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 15:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiJaT4O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 15:56:14 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A274213F55;
        Mon, 31 Oct 2022 12:56:12 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13b23e29e36so14625763fac.8;
        Mon, 31 Oct 2022 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5E0C0VRQqBvRgQ++ufKOa2BbuI51ZSpUIjoDARBcnE=;
        b=kuOIL+SX5FwwW0T3nUX+BRjWJdeUdbAMBhssqrYw0/L4Efh9qz5oCPPYrqnfh9vyiL
         9cUbrkvb4EvTXvDjj/R7uQiamA22OIaKa+Ax2EdRfG8nOQvc9M0LJmvKMr/1O8DWB++R
         OeDshPxbXTJQchlSRcEoY6Gn4oEWWhfqBdRjPYWqw1yOOD8TBwciE46ha9xbhNL3al99
         /KAD+3BYfQDKXvHc0+V7gMJuK5raq+HY8wAnu0dYW6a2CcHyXkhgFKsakwG++xTs9NMi
         rO00cp71fs4v2WIORgGmoOyXTpbdb7sQg0cADVgyn2kbTYz39occpUiMciramlmLPnwc
         D6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5E0C0VRQqBvRgQ++ufKOa2BbuI51ZSpUIjoDARBcnE=;
        b=WdRQk7Dx4BvI7w9G7n7zFeNv7uBp4fSs58igK7feoKrRW0DJIcMNIEQmNwliKOFMGz
         DrVQUahCeltzpbHPgtIRYCTwURWnRHiqYhwofVQUy1ZJZbEb8dgRG38vwyBw5KALfQW8
         KZauWMI64Z4hTpW/u/It8goekXL/Fmef2z8WLW4oPSCBNaveC3DO2DDpCNINxzP7bukp
         YW23FfQkig3MC8C4JFvMDHdM+BG/tLh3Ru9cadn6Unpfo1AL4P/jVDOGkJh1Y8ycfOwi
         qGcNQTnu5Fs+Yz4/Y6cPZqDvYP3YCCbMnyId4CBVLRh17f+WYwVqtcj3yqc+6WQT+XlK
         3V2Q==
X-Gm-Message-State: ACrzQf0ytkzB1bKKNpj767JuoINscc4rDOEJbjnXzMm9e3mHJ/lA861H
        R9Km04OEjwu5qHWoMzMbo4s=
X-Google-Smtp-Source: AMsMyM74xw1lhj3SP5ZpdKKXwhLnZOu9Lh/cRV6c17JWLNHCLTmFpAH86KwPeBFxm7/0QWY1bM58rg==
X-Received: by 2002:a05:6870:8092:b0:13c:a773:cac9 with SMTP id q18-20020a056870809200b0013ca773cac9mr8029900oab.146.1667246171885;
        Mon, 31 Oct 2022 12:56:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o37-20020a05687096a500b00131c3d4d38fsm3490406oaq.39.2022.10.31.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:56:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 31 Oct 2022 12:56:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] Add OneXPlayer mini AMD sensors driver
Message-ID: <20221031195609.GA2006109@roeck-us.net>
References: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
 <20221031145308.341776-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031145308.341776-1-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 31, 2022 at 11:53:08AM -0300, Joaquín Ignacio Aramendía wrote:
> Sensors driver for OXP Handhelds from One-Netbook that expose fan reading
> and control via hwmon sysfs.
> 
> As far as I could gather all OXP boards have the same DMI strings and
> they are told appart by the boot cpu vendor (Intel/AMD).
> Currently only AMD boards are supported.
> 
> Fan control is provided via pwm interface in the range [0-255]. AMD
> boards have [0-100] as range in the EC, the written value is scaled to
> accommodate for that.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>

Please run "checkpatch --strict" on your patch and fix the CHECK
messages. Also see Documentation/hwmon/submitting-patches.rst.

> ---
> Removed fan_control reference in comment.
> Bugfix MIX/MIN reporting not available
> Bugfix pwm_enable register set wrong
> ---
>  drivers/hwmon/Kconfig       |  13 +-
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/oxp-sensors.c | 277 ++++++++++++++++++++++++++++++++++++

Also needs Documentation/hwmon/oxp-sensors.rst

>  3 files changed, 290 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwmon/oxp-sensors.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7ac3daaf59ce..a1cdb03b4d13 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1607,6 +1607,17 @@ config SENSORS_NZXT_SMART2
> 
>  source "drivers/hwmon/occ/Kconfig"
> 
> +config SENSORS_OXP
> +	tristate "OneXPlayer EC fan control"
> +	depends on ACPI
> +	depends on X86
> +	help
> +		If you say yes here you get support for fan readings and control over
> +		OneXPlayer handheld devices. Only OneXPlayer mini AMD handheld variant
> +		boards are supported.
> +
> +		Can also be built as a module. In that case it will be called oxp-sensors.
> +
>  config SENSORS_PCF8591
>  	tristate "Philips PCF8591 ADC/DAC"
>  	depends on I2C
> @@ -1957,7 +1968,7 @@ config SENSORS_ADS7871
> 
>  config SENSORS_AMC6821
>  	tristate "Texas Instruments AMC6821"
> -	depends on I2C
> +	depends on I2C

Please refrain from making unrelated changes. If you want to fix the extra
space, submit a separate patch.

>  	help
>  	  If you say yes here you get support for the Texas Instruments
>  	  AMC6821 hardware monitoring chips.
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 11d076cad8a2..35824f8be455 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NSA320)	+= nsa320-hwmon.o
>  obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
>  obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
>  obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
> +obj-$(CONFIG_SENSORS_OXP) += oxp-sensors.o
>  obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
>  obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
>  obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
> diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> new file mode 100644
> index 000000000000..f5895dc11094
> --- /dev/null
> +++ b/drivers/hwmon/oxp-sensors.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Platform driver for OXP Handhelds that expose fan reading and control
> + * via hwmon sysfs.
> + *
> + * All boards have the same DMI strings and they are told appart by the
> + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
> + * but the code is made to be simple to add other handheld boards in the
> + * future.
> + * Fan control is provided via pwm interface in the range [0-255]. AMD
> + * boards use [0-100] as range in the EC, the written value is scaled to
> + * accommodate for that.
> + *
> + * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/processor.h>
> +
> +#define ACPI_LOCK_DELAY_MS	500
> +
> +/* Handle ACPI lock mechanism */
> +struct lock_data {
> +	u32 mutex;
> +	bool (*lock)(struct lock_data *data);
> +	bool (*unlock)(struct lock_data *data);
> +};
> +
> +static bool lock_global_acpi_lock(struct lock_data *data)
> +{
> +	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> +								 &data->mutex));
> +}
> +
> +static bool unlock_global_acpi_lock(struct lock_data *data)
> +{
> +	return ACPI_SUCCESS(acpi_release_global_lock(data->mutex));
> +}
> +
> +#define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
> +#define OXP_SENSOR_PWM_ENABLE_REG	0x4A /* PWM enable is 1 register long */
> +#define OXP_SENSOR_PWM_REG		0x4B /* PWM reading is 1 register long */
> +
> +static const struct dmi_system_id dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> +					"ONE-NETBOOK TECHNOLOGY CO., LTD."),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> +					"ONE-NETBOOK"),

Are there any others devices which start with "ONE-NETBOOK" but are not
supported ? If not a single entry with DMI_MATCH() woud be sufficient.
Either case I would like to see some additional entry or entries here.
Just matching on the vendor name seems risky. At the very least there
should also be a match for the "ONE XPLAYER" sku.

> +		},
> +	},
> +	{},
> +};
> +
> +struct oxp_status {
> +	struct lock_data lock_data;
> +};
> +
> +/* Helper functions to handle EC read/write */
> +static int read_from_ec(u8 reg, int size, long *val)
> +{
> +	int i;
> +	int ret;
> +	u8 buffer;
> +
> +	*val = 0;
> +	for (i = 0; i < size; i++) {
> +		ret = ec_read(reg + i, &buffer);
> +		if (ret)
> +			return ret;
> +		(*val) <<= i * 8;

Unnecessary ( )

> +		*val += buffer;
> +	}
> +	return ret;
> +}
> +
> +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> +{
> +	struct oxp_status *state = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!state->lock_data.lock(&state->lock_data)) {
> +		dev_warn(dev, "Failed to acquire mutex");

Is that message necessary ? If so it should be dev_err().
If it is expected, ie if acquiring the lock is observed
to fail sometimes, there should be no log message.

> +		return -EBUSY;
> +	}
> +
> +	ret = ec_write(reg, value);
> +
> +	if (!state->lock_data.unlock(&state->lock_data))
> +		dev_err(dev, "Failed to release mutex");

No error return ? Then it is not an error and should not be
logged as one.

I am a bit concerned about those error messages. If they are seen
the errors are either sporadic and there should be no log,
or they are persistent and would clog the kernel log. If you think
that will indeed happen, is not normal operation, and that the
message is essential enough to be logged, please at least consider
using _once variants of the message to avoid clogging the kernel
log.

> +
> +	return ret;
> +}
> +
> +static int oxp_pwm_enable(const struct device *dev)
> +{
> +	return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x01);
> +}
> +
> +static int oxp_pwm_disable(const struct device *dev)
> +{
> +	return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x00);
> +}
> +
> +/* Callbacks for hwmon interface */
> +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> +					enum hwmon_sensor_types type, u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return 0444;
> +	case hwmon_pwm:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +	return 0;
> +}
> +
> +static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, long *val)
> +{
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return read_from_ec(OXP_SENSOR_FAN_REG,
> +					   2,
> +					   val);

Unnecessary continuation lines

> +		default:
> +			dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = read_from_ec(OXP_SENSOR_PWM_REG,
> +					   2, val);

Please, no unnecessary continuation lines, and make sure that continuation
lines match with '(' in the preceding line.

> +			*val = (*val * 255) / 100;
> +			return ret;
> +		case hwmon_pwm_enable:
> +			return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
> +		default:
> +			dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		dev_dbg(dev, "Unknown sensor type %d.\n", type);
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
> +		u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			if (val == 1)
> +				return oxp_pwm_enable(dev);
> +			else if (val == 0)
> +				return oxp_pwm_disable(dev);
> +			else
> +				return -EINVAL;
> +		case hwmon_pwm_input:
> +			if (val < 0 || val > 255)
> +				return -EINVAL;
> +			val = (val * 100) / 255;
> +			return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
> +		default:
> +			dev_dbg(dev, "Unknown attribute for type %d: %d", type, attr);
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		dev_dbg(dev, "Unknown sensor type: %d", type);
> +		return -EOPNOTSUPP;
> +	}
> +	return -EINVAL;
> +}
> +
> +/* Known sensors in the OXP EC controllers */
> +static const struct hwmon_channel_info *oxp_platform_sensors[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +		HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(pwm,
> +		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL,
> +};
> +
> +static const struct hwmon_ops oxp_ec_hwmon_ops = {
> +	.is_visible = oxp_ec_hwmon_is_visible,
> +	.read = oxp_platform_read,
> +	.write = oxp_platform_write,
> +};
> +
> +static const struct hwmon_chip_info oxp_ec_chip_info = {
> +	.ops = &oxp_ec_hwmon_ops,
> +	.info = oxp_platform_sensors,
> +};
> +
> +/* Initialization logic */
> +static int oxp_platform_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_entry;
> +	struct device *dev = &pdev->dev;
> +	struct device *hwdev;
> +	struct oxp_status *state;
> +
> +	/* Have to check for AMD processor here */
> +	dmi_entry = dmi_first_match(dmi_table);
> +	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return -ENODEV;
> +
> +	state = devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->lock_data.mutex = 0;

Unnecessary initialization. The data structure is initialized with
devm_kzalloc().

> +	state->lock_data.lock = lock_global_acpi_lock;
> +	state->lock_data.unlock = unlock_global_acpi_lock;

What is the purpose of this callback function ?
Why not just call the lock and unlock functions directly ?

> +
> +	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", state,
> +							&oxp_ec_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwdev);
> +}
> +
> +static struct platform_driver oxp_platform_driver = {
> +	.driver = {
> +		.name = "oxp-platform",
> +	},
> +	.probe = oxp_platform_probe,
> +};
> +
> +static struct platform_device *oxp_platform_device;
> +
> +static int __init oxp_platform_init(void)
> +{
> +	oxp_platform_device =
> +		platform_create_bundle(&oxp_platform_driver,
> +				       oxp_platform_probe, NULL, 0, NULL, 0);
> +
> +	if (IS_ERR(oxp_platform_device))
> +		return PTR_ERR(oxp_platform_device);
> +
> +	return 0;
> +}
> +
> +static void __exit oxp_platform_exit(void)
> +{
> +	platform_device_unregister(oxp_platform_device);
> +	platform_driver_unregister(&oxp_platform_driver);
> +}
> +
> +MODULE_DEVICE_TABLE(dmi, dmi_table);
> +module_init(oxp_platform_init);
> +module_exit(oxp_platform_exit);
> +
> +MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
> +MODULE_DESCRIPTION(
> +	"Platform driver that handles ACPI EC of OneXPlayer devices");
> +MODULE_LICENSE("GPL");
> --
> 2.38.1
> 
