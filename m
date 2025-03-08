Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2E7346F
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Mar 2025 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741472628; cv=none; b=hQ6eO90WFJfb6prJ+APWUb7SFpihomQXUvSBWnHMfXpc/f2VDjApgzlwK9gO8hwIJ9JQTKg0NMGYvxpXrtMpNKOxLdBenhL47g8iFiq1gHwhYY6dK8MhtsmelyKqh3EfoAlpSL8nlhHQL6VWSrnmuvcM5rJmYSL4vq4rTlCcir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741472628; c=relaxed/simple;
	bh=Db5U2o9A38+j4CWiAJPQRRL8nRlIyglyBpYKv8W76Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGnvZtPJsBdrnaPUP6cCFPpj+y4pwGqq32ejQEe/HZ1cLQ6pFpO9VdaCgRtoc6fFk1o3BSpRC39ZZF3IiUYmliKl6FhtNfXC3nPCuNvbphV0SKYJJcxKJFibpL5u6OAroM2h0naTcdzJGZ5t7XfkISDvcn15NNBt5Hc24alFMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=i0GCelc+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="i0GCelc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741472618;
	bh=Db5U2o9A38+j4CWiAJPQRRL8nRlIyglyBpYKv8W76Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0GCelc+LytClq1CuUbWrSVBbRQ4iXRnuO4aJiwRKqxEmSOMFKzWvK5jrZAgCopwz
	 9d8yMVjUaCmpbsm+bBi6+1x5zGDXhbtQpg1lUZOEqTUfn6Ggu0VR3vLZh1k8MbvTu2
	 tC4TK1wdQCbuaLpqxDNyrtVbtj4j+40YPDRmDz10=
Date: Sat, 8 Mar 2025 23:23:37 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, 
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
Message-ID: <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308212346.51316-1-gerhard@engleder-embedded.com>

On 2025-03-08 22:23:46+0100, Gerhard Engleder wrote:
> From: Gerhard Engleder <eg@keba.com>
> 
> The KEBA battery monitoring controller is found in the system FPGA of
> KEBA PLC devices. It puts a load on the coin cell battery to check the
> state of the battery.

A hint that this will be instantiated from drivers/misc/keba/cp500.c
would be nice.

> Signed-off-by: Gerhard Engleder <eg@keba.com>
> ---
>  drivers/hwmon/Kconfig  |  12 ++++
>  drivers/hwmon/Makefile |   1 +
>  drivers/hwmon/kbatt.c  | 159 +++++++++++++++++++++++++++++++++++++++++

hwmon drivers commonly have an entry in Documentation/hwmon/.

>  3 files changed, 172 insertions(+)
>  create mode 100644 drivers/hwmon/kbatt.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 4cbaba15d86e..ec396252cc18 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>  	  This driver can also be built as a module. If so, the module
>  	  will be called k10temp.
>  
> +config SENSORS_KBATT
> +	tristate "KEBA battery controller support"
> +	depends on HAS_IOMEM
> +	depends on KEBA_CP500 || COMPILE_TEST

KEBA_CP500 already has a COMPILE_TEST variant.
Duplicating it here looks unnecessary.
Then the HAS_IOMEM and AUXILIARY_BUS references can go away.

> +	select AUXILIARY_BUS
> +	help
> +	  This driver supports the battery monitoring controller found in
> +	  KEBA system FPGA devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called kbatt.
> +
>  config SENSORS_FAM15H_POWER
>  	tristate "AMD Family 15h processor power"
>  	depends on X86 && PCI && CPU_SUP_AMD
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b7ef0f0562d3..4671a9b77b55 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -108,6 +108,7 @@ obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>  obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
>  obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>  obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
> +obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
>  obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
>  obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
>  obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
> diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
> new file mode 100644
> index 000000000000..09a622a7d36a
> --- /dev/null
> +++ b/drivers/hwmon/kbatt.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) KEBA Industrial Automation Gmbh 2025

typo in "GmbH".

Normal copyright format would be:
Copyright (C) 2025 KEBA Industrial Automation GmbH

> + *
> + * Driver for KEBA battery monitoring controller FPGA IP core
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/misc/keba.h>

#include <linux/auxiliary_bus.h>
#include <linux/device.h>
#include <linux/mutex.h>

> +
> +#define KBATT "kbatt"
> +
> +#define KBATT_CONTROL_REG		0x4
> +#define   KBATT_CONTROL_BAT_TEST	0x01
> +
> +#define KBATT_STATUS_REG		0x8
> +#define   KBATT_STATUS_BAT_OK		0x01
> +
> +#define KBATT_MAX_UPD_INTERVAL	(5 * HZ)
> +#define KBATT_SETTLE_TIME_MS	100
> +
> +struct kbatt {
> +	struct keba_batt_auxdev *auxdev;

Not needed.

> +	/* update lock */
> +	struct mutex lock;
> +	void __iomem *base;
> +	struct device *hwmon_dev;

Not needed.

> +
> +	bool valid;
> +	unsigned long last_updated; /* in jiffies */
> +	long alarm;

bool

> +};
> +
> +static long kbatt_alarm(struct kbatt *kbatt)
> +{
> +	mutex_lock(&kbatt->lock);
> +
> +	if (time_after(jiffies, kbatt->last_updated + KBATT_MAX_UPD_INTERVAL) ||
> +	    !kbatt->valid) {

kbatt->valid can be removed and instead check for
!kbatt->last_updated || time_after().

> +		/* switch load on */
> +		iowrite8(KBATT_CONTROL_BAT_TEST,
> +			 kbatt->base + KBATT_CONTROL_REG);
> +
> +		/* wait some time to let things settle */
> +		msleep(KBATT_SETTLE_TIME_MS);

Could use the recommended fsleep():
Documentation/timers/delay_sleep_functions.rst

> +
> +		/* check battery state */
> +		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
> +		    KBATT_STATUS_BAT_OK)
> +			kbatt->alarm = 0;
> +		else
> +			kbatt->alarm = 1;
> +
> +		/* switch load off */
> +		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
> +
> +		kbatt->last_updated = jiffies;
> +		kbatt->valid = true;
> +	}
> +
> +	mutex_unlock(&kbatt->lock);
> +
> +	return kbatt->alarm;
> +}
> +
> +static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct kbatt *kbatt = dev_get_drvdata(dev);
> +
> +	if ((channel != 1) || (attr != hwmon_in_alarm))
> +		return -EOPNOTSUPP;

This condition is never true.

> +
> +	*val = kbatt_alarm(kbatt);
> +
> +	return 0;
> +}
> +
> +static umode_t kbatt_is_visible(const void *data, enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	if ((channel == 1) && (attr == hwmon_in_alarm))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *kbatt_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   /* 0: dummy, skipped in is_visible */

Why?

> +			   HWMON_I_ALARM,
> +			   /* 1: input alarm channel */
> +			   HWMON_I_ALARM),
> +	NULL
> +};
> +
> +static const struct hwmon_ops kbatt_hwmon_ops = {
> +	.is_visible = kbatt_is_visible,
> +	.read = kbatt_read,
> +};
> +
> +static const struct hwmon_chip_info kbatt_chip_info = {
> +	.ops = &kbatt_hwmon_ops,
> +	.info = kbatt_info,
> +};
> +
> +static int kbatt_probe(struct auxiliary_device *auxdev,
> +		       const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &auxdev->dev;
> +	struct kbatt *kbatt;
> +
> +	kbatt = devm_kzalloc(dev, sizeof(struct kbatt), GFP_KERNEL);

sizeof(*kbatt)

> +	if (!kbatt)
> +		return -ENOMEM;
> +	kbatt->auxdev = container_of(auxdev, struct keba_batt_auxdev, auxdev);
> +	mutex_init(&kbatt->lock);

devm_mutex_init(), check the return value.

> +	auxiliary_set_drvdata(auxdev, kbatt);

Is this needed?

> +
> +	kbatt->base = devm_ioremap_resource(dev, &kbatt->auxdev->io);
> +	if (IS_ERR(kbatt->base))
> +		return PTR_ERR(kbatt->base);
> +
> +	kbatt->hwmon_dev = devm_hwmon_device_register_with_info(dev, KBATT,
> +							     kbatt,
> +							     &kbatt_chip_info,
> +							     NULL);
> +	if (IS_ERR(kbatt->hwmon_dev))
> +		return PTR_ERR(kbatt->hwmon_dev);
> +
> +	return 0;

Would be slightly shorter with 'return PTR_ERR_OR_ZERO()', but both
variant are fine.

> +}
> +
> +static void kbatt_remove(struct auxiliary_device *auxdev)
> +{
> +	auxiliary_set_drvdata(auxdev, NULL);

Unnecessary.

> +}
> +
> +static const struct auxiliary_device_id kbatt_devtype_aux[] = {
> +	{ .name = "keba.batt" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, kbatt_devtype_aux);
> +
> +static struct auxiliary_driver kbatt_driver_aux = {
> +	.name = KBATT,
> +	.id_table = kbatt_devtype_aux,
> +	.probe = kbatt_probe,
> +	.remove = kbatt_remove,
> +};
> +module_auxiliary_driver(kbatt_driver_aux);
> +
> +MODULE_AUTHOR("Petar Bojanic <boja@keba.com>");
> +MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
> +MODULE_DESCRIPTION("KEBA battery monitoring controller driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.5
> 
> 
