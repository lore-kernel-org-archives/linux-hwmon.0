Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42572 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbdHRGFb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2017 02:05:31 -0400
Subject: Re: [PATCH 1/2] hwmon: (ltq-cputemp) add cpu temp sensor for xrx200
To: Florian Eckert <fe@dev.tdt.de>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20170817125311.24679-1-fe@dev.tdt.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <911f5fab-e2de-2c85-23e0-82f4cf28b46a@roeck-us.net>
Date: Thu, 17 Aug 2017 23:05:28 -0700
MIME-Version: 1.0
In-Reply-To: <20170817125311.24679-1-fe@dev.tdt.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/17/2017 05:53 AM, Florian Eckert wrote:
> Add the lantiq cpu temperature sensor support for xrx200.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>   drivers/hwmon/Kconfig       |   8 +++
>   drivers/hwmon/Makefile      |   1 +
>   drivers/hwmon/ltq-cputemp.c | 155 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 164 insertions(+)
>   create mode 100644 drivers/hwmon/ltq-cputemp.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5ef2814345ef..ed3f5e1d10cc 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -790,6 +790,14 @@ config SENSORS_LTC4261
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc4261.
>   
> +config SENSORS_LTQ_CPUTEMP
> +	bool "Lantiq cpu temperature sensor for xrx200"
> +	depends on LANTIQ
> +	default n

n is already the default. No need to specify it.

> +	help
> +	  If you say yes here you get support for the temperature
> +	  sensor inside your xrx200 CPU.
> +
>   config SENSORS_MAX1111
>   	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
>   	depends on SPI_MASTER
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4641a9f16c1..c84d9784be98 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -110,6 +110,7 @@ obj-$(CONFIG_SENSORS_LTC4222)	+= ltc4222.o
>   obj-$(CONFIG_SENSORS_LTC4245)	+= ltc4245.o
>   obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>   obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
> +obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
>   obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>   obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
>   obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
> diff --git a/drivers/hwmon/ltq-cputemp.c b/drivers/hwmon/ltq-cputemp.c
> new file mode 100644
> index 000000000000..a6f820533164
> --- /dev/null
> +++ b/drivers/hwmon/ltq-cputemp.c
> @@ -0,0 +1,155 @@
> +/* Lantiq cpu temperature sensor driver for xrx200
> + *
> + * Copyright (C) 2017 Florian Eckert <fe@dev.tdt.de>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version
> + *
> + * This program is distributed in the hope that it will be useful
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/of_device.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +
> +#include <lantiq_soc.h>
> +
> +/* gphy1 configuration register contains cpu temperature */
> +#define CGU_GPHY1_CR   0x0040
> +#define CGU_TEMP_PD    BIT(19)
> +
> +static void ltq_cputemp_enable(void)
> +{
> +	ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) | CGU_TEMP_PD, CGU_GPHY1_CR);
> +
> +	/* wait a short moment to let the SoC get the first temperatur value */

temperature

> +	mdelay(100);

An active delay during boot doesn't sound like a good idea to me.
It might be better to mark the time and add an msleep() into the read
function if called too early.

> +}
> +
> +static void ltq_cputemp_disable(void)
> +{
> +	ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) & ~CGU_TEMP_PD, CGU_GPHY1_CR);
> +}
> +
> +static int ltq_cputemp_read(void)
> +{
> +	int value;
> +
> +	/* get the temperature including one decimal place */
> +	value = (ltq_cgu_r32(CGU_GPHY1_CR) >> 9) & 0x01FF;
> +	value = (value << 2) + value;
> +
Can you just multiply times 5 and leave the optimization to the compiler ?
This would be much easier to understand.

> +	/* range -38 to +154 °C, register value zero is -38.0 °C */
> +	value -= 380;
> +
> +	return value;
> +}
> +
> +static ssize_t show_cputemp(struct device *dev,
> +			struct device_attribute *attr, char *buf)
> +{
> +	int value;
> +
> +	value = ltq_cputemp_read();
> +	/* scale temp to millidegree */
> +	value = value * 100;
> +
> +	return sprintf(buf, "%d\n", value);
> +}
> +
> +static DEVICE_ATTR(temp1_input, S_IRUGO, show_cputemp, NULL);
> +
> +static struct attribute *ltq_cputemp_attrs[] = {
> +	&dev_attr_temp1_input.attr,
> +	NULL
> +};
> +
> +ATTRIBUTE_GROUPS(ltq_cputemp);
> +
> +static int ltq_cputemp_probe(struct platform_device *pdev)
> +{
> +	int value = 0;

Unnecessary initialization.

> +	int ret;
> +	struct device *hwmon_dev;
> +
> +	/* available on vr9 v1.2 SoCs only */
> +	if (ltq_soc_type() != SOC_TYPE_VR9_2)
> +		return -ENODEV;
> +
Any chance to make this a bit more generic ? It is quite likely that
later SOC revisions will support it as well, meaning we'll have to
repeatedly touch the driver.

> +	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> +							"CPU0",
> +							NULL,
> +							ltq_cputemp_groups);

Please consider using devm_hwmon_device_register_with_info() instead.
This driver looks like an excellent fit for the new API.

> +
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(&pdev->dev, "Failed to register as hwmon device");
> +		ret = PTR_ERR(hwmon_dev);
> +		goto error_hwmon;

Unnecessary goto. Just return.

> +	}
> +
> +	ltq_cputemp_enable();
> +	value = ltq_cputemp_read();
> +	dev_info(&pdev->dev,
> +			"Current CPU die temperature: %d.%d °C",
> +			value / 10,
> +			value % 10);

Highly unusual, even more so since it requires an active 100 ms delay during boot.
Please drop.

> +
> +	return 0;
> +
> +error_hwmon:
> +	return ret;
> +}
> +
> +static int ltq_cputemp_release(struct platform_device *pdev)
> +{
> +	hwmon_device_unregister(&pdev->dev);

This is done automatically (or don't the the devm function to register it).
Besides, it takes the hwmon device as argument.

> +	ltq_cputemp_disable();
> +	return 0;
> +}
> +
> +const struct of_device_id ltq_cputemp_match[] = {
> +	{ .compatible = "lantiq,cputemp" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ltq_cputemp_match);
> +
> +static struct platform_driver ltq_cputemp_driver = {
> +	.probe = ltq_cputemp_probe,
> +	.remove = ltq_cputemp_release,
> +	.driver = {
> +		.name = "ltq-cputemp",
> +		.owner = THIS_MODULE,

AFAIK this is no longer necessary.

> +		.of_match_table = ltq_cputemp_match,
> +	},
> +};
> +
> +int __init init_ltq_cputemp(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&ltq_cputemp_driver);
> +	return ret;

Unnecessary variable. I am quite sure there is a template for this code, though.

> +}
> +
> +void clean_ltq_cputemp(void)
> +{
> +	platform_driver_unregister(&ltq_cputemp_driver);
> +}
> +
> +module_init(init_ltq_cputemp);
> +module_exit(clean_ltq_cputemp);

module_platform_driver ?

> +
> +MODULE_AUTHOR("Florian Eckert <fe@dev.tdt.de>");
> +MODULE_DESCRIPTION("Lantiq Temperature Sensor");
> +MODULE_LICENSE("GPL");
> 

