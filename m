Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B41FC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Nov 2022 18:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbiKBSEj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Nov 2022 14:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiKBSEe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 14:04:34 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5972EF19;
        Wed,  2 Nov 2022 11:04:33 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r83so20005688oih.2;
        Wed, 02 Nov 2022 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zMoy+G+N3sF7QeAOQIazTe8NNZW28uNP+obbNbnvNtk=;
        b=cbldKDPAx6i9gntUZ0L4kazstwlqAdiTrJ3AXj/vT+qc6w0Ik/9Fte5VHfOwX1cadA
         nrKqvwYEThafVacUJZ9fbC8hRDsTvPXDjyCfHPPMm8BHfxIlvro/dXqkGDoN1+evqJjB
         ZJoqJ1LMZ1L+VSRD8wo4vo429s2DLQSc+rE064zwmZZP55Rt/YNNvQymsuXc7cEDy1+w
         gNO3RiXATQOY/nK3C5X+/77WDZstlVcp8jngMhz60K7+mwGIIjct9LETlNgkItLWE3aT
         UECvvJEDrPM6EQrnR5Vyz+o5yI0uPTI0CrrWNlwR1O/nhKDgRjCiygvHd7Fbs1Y9+Diz
         +8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMoy+G+N3sF7QeAOQIazTe8NNZW28uNP+obbNbnvNtk=;
        b=hIJpp9Dn0r+eWdf1UBtgxFuef8+iWvPFGglGFyrAgs1TFDJiciJZvoJRr79bz25Bre
         USHBPuxxIksvBXLbB2r+bm2t3SzSntvZluN52AAXhYVjbQy5UGPJkW/magav+mW62h3p
         3mjT4I+n0f6J3pNu1QIKS57MBseCSXOt2U6YCYAXbm8EcDV3Txlno+0Jm00xnDTEDfXO
         q+PrySM3kCY32orDnb1KV/Hzzs9tyWqOhT7Y2ge7+pKya4NZAX6FKQ9V9VatmzfUbxRk
         aGVdPwx/hUqzoGj8wZE4j8iC+1Zk+Gp+c/csbYrLFEMgqa39ZdJRJtycues3XHlqT+Mt
         PejA==
X-Gm-Message-State: ACrzQf1OYl/qyTCN/o0rXsxSszSHhU9ieyStD0NVviraN0Cjyp911pog
        FtyMyCpAhrJBw3ccoBoltRU=
X-Google-Smtp-Source: AMsMyM7Le7LlA75REOvuCrgJr4Qd97Y0MCfDkHSFZmfqqi5KU5AWuOkU6EsgUGATy29zkqZP0xJKcw==
X-Received: by 2002:aca:3b54:0:b0:35a:4879:ee2e with SMTP id i81-20020aca3b54000000b0035a4879ee2emr600654oia.170.1667412272380;
        Wed, 02 Nov 2022 11:04:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y12-20020a4ae70c000000b00492f9f46aa4sm4665232oou.36.2022.11.02.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:04:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Nov 2022 11:04:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] Add OneXPlayer mini AMD sensors driver
Message-ID: <20221102180430.GC2913353@roeck-us.net>
References: <20221102150440.208228-1-samsagax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102150440.208228-1-samsagax@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 02, 2022 at 12:04:40PM -0300, Joaquín Ignacio Aramendía wrote:
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
> ---
> Added Documentation entry
> Added MAINTAINERS entry
> Removed unnecessary code complexity
> Fixed all checkpatch --strict checks
> ---
>  Documentation/hwmon/index.rst       |   1 +
>  Documentation/hwmon/oxp-sensors.rst |  24 +++
>  MAINTAINERS                         |   6 +
>  drivers/hwmon/Kconfig               |  11 ++
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/oxp-sensors.c         | 254 ++++++++++++++++++++++++++++
>  6 files changed, 297 insertions(+)
>  create mode 100644 Documentation/hwmon/oxp-sensors.rst
>  create mode 100644 drivers/hwmon/oxp-sensors.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index c1d11cf13eef..098986bfbfdd 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -160,6 +160,7 @@ Hardware Monitoring Kernel Drivers
>     nzxt-kraken2
>     nzxt-smart2
>     occ
> +   oxp-sensors
>     pc87360
>     pc87427
>     pcf8591
> diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
> new file mode 100644
> index 000000000000..023441d17a45
> --- /dev/null
> +++ b/Documentation/hwmon/oxp-sensors.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver oxp-sensors
> +=========================
> +
> +Authors:

s/Authors/Author/

> +    - Joaquín Ignacio Aramendía <samsagax@gmail.com>
> +
> +Description:
> +------------
> +
> +One X Player devices from One Netbook provide fan readings and fan control
> +through its Embedded Controller.
> +
> +Currently only supports AMD boards from the One X Player lineup. Intel boards
> +could be supported if we could figure out the EC registers and values to write
> +to since the EC layout and model is different.
> +
> +Sensor values are read and written from EC registers, and to avoid race with
> +the board firmware the driver acquires ACPI mutex.
> +
> +Fan control is provided via pwm sysfs attribute in the range [0-255]. AMD
> +boards use [0-100] as range values in the EC, the value is scaled to
> +accommodate for that.

Drop the last two paragraphs; those are implementation details
which belong into the driver.

List the supported sysfs attributes instead (without the scaling detail).
See other driver documentation for examples.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2034e7d26684..c2e24a830875 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15337,6 +15337,12 @@ S:	Maintained
>  F:	drivers/mtd/nand/onenand/
>  F:	include/linux/mtd/onenand*.h
> 
> +ONEXPLAYER FAN DRIVER
> +M:	Joaquín Ignacio Aramendía <samsagax@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/oxp-sensors.c
> +
>  ONION OMEGA2+ BOARD
>  M:	Harvey Hunt <harveyhuntnexus@gmail.com>
>  L:	linux-mips@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7ac3daaf59ce..993ffa26e44f 100644
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
> index 000000000000..00b3aacfb017
> --- /dev/null
> +++ b/drivers/hwmon/oxp-sensors.c
> @@ -0,0 +1,254 @@
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
> +/* Handle ACPI lock mechanism */
> +static u32 oxp_mutex;
> +
> +#define ACPI_LOCK_DELAY_MS	500
> +
> +static bool lock_global_acpi_lock(void)
> +{
> +	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS, &oxp_mutex));
> +}
> +
> +static bool unlock_global_acpi_lock(void)
> +{
> +	return ACPI_SUCCESS(acpi_release_global_lock(oxp_mutex));
> +}
> +
> +#define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
> +#define OXP_SENSOR_PWM_ENABLE_REG	0x4A /* PWM enable is 1 register long */
> +#define OXP_SENSOR_PWM_REG		0x4B /* PWM reading is 1 register long */
> +
> +static const struct dmi_system_id dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONE XPLAYER"),
> +		},
> +	},
> +	{},
> +};
> +
> +/* Helper functions to handle EC read/write */
> +static int read_from_ec(u8 reg, int size, long *val)
> +{
> +	int i;
> +	int ret;
> +	u8 buffer;
> +
> +	if (!lock_global_acpi_lock())
> +		return -EBUSY;
> +
> +	*val = 0;
> +	for (i = 0; i < size; i++) {
> +		ret = ec_read(reg + i, &buffer);
> +		if (ret)
> +			return ret;
> +		*val <<= i * 8;
> +		*val += buffer;
> +	}
> +
> +	if (!unlock_global_acpi_lock())
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> +{
> +	int ret;
> +
> +	if (!lock_global_acpi_lock())
> +		return -EBUSY;
> +
> +	ret = ec_write(reg, value);
> +
> +	if (!unlock_global_acpi_lock())
> +		return -EBUSY;
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
> +				       enum hwmon_sensor_types type, u32 attr, int channel)
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

I think you can drop the above since all branches of the switch statement
return.

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
> +			return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
> +		default:

Missing break;

> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = read_from_ec(OXP_SENSOR_PWM_REG, 2, val);
> +			*val = (*val * 255) / 100;

That isn't really clean since it will overwrite *val after an error.

  			if (ret)
				return ret;
			*val = (*val * 255) / 100;
			return 0;

would be more appropriate.

> +			return ret;
> +		case hwmon_pwm_enable:
> +			return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
> +		default:


Missing break;

> +		}
> +		break;
> +	default:

Missing break;

> +	}
> +	dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);

That isn't really useful since it will never happen.

> +	return -EOPNOTSUPP;
> +}
> +
> +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long val)
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

else after return is unnecessary.

> +		case hwmon_pwm_input:
> +			if (val < 0 || val > 255)
> +				return -EINVAL;
> +			val = (val * 100) / 255;
> +			return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
> +		default:
> +			break;
> +		}

		break;

> +	default:

		break;

> +	}
> +	dev_dbg(dev, "Unknown sensor type: %d", type);

Same as above. It just increases code size for no good reason.

> +	return -EOPNOTSUPP;
> +}
> +
> +/* Known sensors in the OXP EC controllers */
> +static const struct hwmon_channel_info *oxp_platform_sensors[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
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
> +
> +	/* Have to check for AMD processor here because DMI strings are the
> +	 * same between Intel and AMD boards, the only way to tell them appart
> +	 * is the CPU.
> +	 * Intel boards seem to have different EC registers and values to
> +	 * read/write.
> +	 */

/*
 * Please use standard multi-line comments
 */

> +	dmi_entry = dmi_first_match(dmi_table);
> +	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return -ENODEV;
> +
> +	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
> +						     &oxp_ec_chip_info, NULL);
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

Why not PTR_ERR_OR_ZERO() here ?

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

Can you use module_platform_driver() instead ?

> +
> +MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
> +MODULE_DESCRIPTION("Platform driver that handles EC sensors of OneXPlayer devices");
> +MODULE_LICENSE("GPL");
> --
> 2.38.1
> 
