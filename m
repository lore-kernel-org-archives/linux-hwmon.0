Return-Path: <SRS0=M5ZX=6J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5443C54FCB
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Apr 2020 16:17:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87BB320728
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Apr 2020 16:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlWef2Hf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgDYQRx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Apr 2020 12:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgDYQRw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Apr 2020 12:17:52 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90D1C09B04D
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Apr 2020 09:17:52 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z6so4943926plk.10
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Apr 2020 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=RRMEkp5imEt6HxA/atfdtNtk8wX4QCFOE6bDEmsbiWU=;
        b=HlWef2Hfn/hbsy/wlmTI4KOwbQdQtHH+KbTTLPCNoxvdH/Yw0OLiglCYDmzWe6Pzp/
         H55Vh7sfL74THELu3dMNwWMCfwnI6M79fO3lK3NFVs0XccGc0kZfMzlX2aduk2dlUkbP
         wlMw4BLyqfeohFcT4IhnoQ69+jXuVRaj6/UgTJIr06kNWTE2WsxdsKCol5OTCJ2bz5NV
         yU6TfJNNV3wiQu74Af68hfFtxb7U6j0SviV8O35FKQGIlaFdMFw+P0hrw1kQqVk2FCJx
         qxZNUDx7/W6PFQqbWZtR9NTNC6B3zYwonPvHlmj7mHtG55JLc8SWM+bqvhTI1XblwBTO
         Wn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=RRMEkp5imEt6HxA/atfdtNtk8wX4QCFOE6bDEmsbiWU=;
        b=rhBCSn11WMM+Hqx8vzpppGaUsn0tdi19e/aBC9k3EGIdJ5uT2qyN8UjVYsIRInr3XQ
         4aspgDIP7jLvnbve5pGI3g5vMwbH/UxgJ5TOb3H8+fEcN/c07nzdlXdNIitqFoa8rHMW
         +f9YWUz/jzfa4fN0edqARc4AYWENlI5bVr49yd9YR4dBoC+lXxwAZk4XufQXttFmoUJ0
         33AHgDhpX9Xe7qT8XuH27FtCiOHH1aoyBjS3V8wHFTWSqrt1A17dbfrieBTwvUedlKmV
         xzI9DClFq38+vLcHrYxjGJlbDZFsWauT6UEyKexvK2T/rw3xSWoyDtS36oxNKTv5T2/e
         e/tg==
X-Gm-Message-State: AGi0Puae1QrssPw+ae1tt0qCciS8GU9Iyj8i25MPm53+BE1FJ0i5GCok
        wQHTjmgRInvmw0FQxVPO6XJFskVr
X-Google-Smtp-Source: APiQypK7Ko4hpZ4+KkgE2wzRBLYPrLmy7Jf84jq+6q/M2Q7+WeDpugVwLo9eqaLB6qEtdUTfIyuXzQ==
X-Received: by 2002:a17:902:c282:: with SMTP id i2mr13886129pld.175.1587831471862;
        Sat, 25 Apr 2020 09:17:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10sm8436877pfa.166.2020.04.25.09.17.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 09:17:51 -0700 (PDT)
Date:   Sat, 25 Apr 2020 09:17:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH v4 1/3] hwmon: Add amd_energy driver to report energy
 counters
Message-ID: <20200425161750.GA67085@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 24, 2020 at 08:50:54AM +0530, Naveen Krishna Chatradhi wrote:
> This patch adds hwmon based amd_energy driver support for
> family 17h processors from AMD.
> 
> The driver provides following interface to the userspace
> 1. Reports the per core consumption
> 	* file: "energy%d_input", label: "Ecore%03d"
> 2. Reports per socket energy consumption
> 	* file: "energy%d_input", label: "Esocket%d"
> 2. Reports scaled energy value in Joules.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Couple of additional comments below.

On a higher level, I noticed that the data overflows quickly
(ie within a day or so), which is the reason why the matching
code for Intel CPUs never made it into the kernel. With that
in mind, I do wonder if this is really valuable. I am quite
concerned about people complaining that the data is useless,
and I have to say that I find it quite useless myself. Any
system running for more than a few hours will report more or
less random data. Any thoughts on that ? 

How about making the power reporting registers available and
reporting per-CPU power consumption instead ? I think that would
add much more value.

Thanks,
Guenter

> ---
> Changes in v4:
> 1. Use num_present_cpus() instead num_online_cpu(), as the latter does
>    not take offline cpus into account.
> 2. run checkpatch.pl --strict and fix alignment issues
> 3. Fixed other comments from Guenter Roeck
> 
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/amd_energy.c | 250 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 261 insertions(+)
>  create mode 100644 drivers/hwmon/amd_energy.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 4c62f900bf7e..e165e10c49ef 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -324,6 +324,16 @@ config SENSORS_FAM15H_POWER
>  	  This driver can also be built as a module. If so, the module
>  	  will be called fam15h_power.
>  
> +config SENSORS_AMD_ENERGY
> +	tristate "AMD RAPL MSR based Energy driver"
> +	depends on X86
> +	help
> +	  If you say yes here you get support for core and package energy
> +	  sensors, based on RAPL MSR for AMD family 17h and above CPUs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called as amd_energy.
> +
>  config SENSORS_APPLESMC
>  	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
>  	depends on INPUT && X86
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b0b9c8e57176..318f89dc7133 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
>  obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
>  obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
>  obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
> +obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>  obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> new file mode 100644
> index 000000000000..7162c80edd10
> --- /dev/null
> +++ b/drivers/hwmon/amd_energy.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> + */
> +
> +#include <asm/cpu_device_id.h>
> +
I don't think this is currently used. More on that below, though.

> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/processor.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>

I don't think this include is needed.

On the other side, using BIT() means that linux/bits.h should be included.

> +#include <linux/types.h>
> +
> +#define DRVNAME			"amd_energy"
> +
> +#define ENERGY_PWR_UNIT_MSR	0xC0010299
> +#define ENERGY_CORE_MSR		0xC001029A
> +#define ENERGY_PKG_MSR		0xC001029B
> +
> +#define AMD_TIME_UNIT_MASK	0xF0000
> +#define AMD_ENERGY_UNIT_MASK	0x01F00
> +#define AMD_POWER_UNIT_MASK	0x0000F
> +
> +#define ENERGY_STATUS_MASK	0xffffffff
> +
> +#define AMD_FAM_17		0x17 /* ZP, SSP */
> +
> +/* Useful macros */
> +#define AMD_CPU_FAM_ANY(_family, _model)	\
> +{						\
> +	.vendor		= X86_VENDOR_AMD,	\
> +	.family		= _family,		\
> +	.model		= _model,		\
> +	.feature	= X86_FEATURE_ANY,	\
> +}
> +
> +#define AMD_CPU_FAM(_model)			\
> +	AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
> +

Any special reason for not just using the following in cpu_ids[] ?
	X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL)

> +struct amd_energy_data {
> +	struct hwmon_channel_info energy_info;
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_chip_info chip;
> +};
> +
> +static int nr_cpus, nr_socks;
> +static u64 energy_units;
> +
> +static int amd_energy_read_labels(struct device *dev,
> +				  enum hwmon_sensor_types type,
> +				 u32 attr, int channel,
> +				 const char **str)
> +{
> +	char *buf = devm_kcalloc(dev, 10, sizeof(char), GFP_KERNEL);
> +
> +	if (channel >= nr_cpus)
> +		scnprintf(buf, 9, "Esocket%u", channel - nr_cpus);
> +	else
> +		scnprintf(buf, 9, "Ecore%03u", channel);
> +
> +	*str = buf;
> +
> +	return 0;
> +}
> +
> +static int get_energy_units(void)
> +{
> +	u64 rapl_units;
> +	int ret;
> +
> +	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> +	if (ret)
> +		return -EAGAIN;
> +
> +	energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> +	return 0;
> +}
> +
> +static int amd_energy_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	u64 value;
> +	int cpu, ret;
> +	u32 reg;
> +
> +	if (channel >= nr_cpus) {
> +		reg = ENERGY_PKG_MSR;
> +		cpu = cpumask_first_and(cpu_online_mask,
> +					cpumask_of_node
> +					(channel - nr_cpus));
> +	} else {
> +		reg = ENERGY_CORE_MSR;
> +		cpu = channel;
> +	}
> +
> +	if (!cpu_online(cpu))
> +		return -ENODEV;
> +
> +	ret = rdmsrl_safe_on_cpu(cpu, reg, &value);
> +	if (ret)
> +		return -EAGAIN;
> +
> +	if (energy_units == 0 && get_energy_units())
> +		return -EAGAIN;
> +
> +	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
> +	*val = (long)value * div64_ul(1000000UL, BIT(energy_units));
> +
> +	return 0;
> +}
> +
> +static umode_t amd_energy_is_visible(const void *_data,
> +				     enum hwmon_sensor_types type,
> +				     u32 attr, int channel)
> +{
> +	return 0444;
> +}
> +
> +static const struct hwmon_ops amd_energy_ops = {
> +	.is_visible = amd_energy_is_visible,
> +	.read = amd_energy_read,
> +	.read_string = amd_energy_read_labels,
> +};
> +
> +static int amd_create_sensor(struct device *dev,
> +			     struct amd_energy_data *data,
> +			     u8 type, u32 config)
> +{
> +	int i;
> +	u32 *s_config;
> +	struct hwmon_channel_info *info = &data->energy_info;
> +
> +	nr_socks = num_possible_nodes();
> +	nr_cpus = num_present_cpus();
> +

On Ryzen 3900X, this generates data for 24 CPUs. Are you sure
that this is correct, ie that the data is available per
hyperthreading sibling ?

> +	s_config = devm_kcalloc(dev, nr_cpus + nr_socks,
> +				sizeof(u32), GFP_KERNEL);
> +	if (!s_config)
> +		return -ENOMEM;
> +
> +	info->type = type;
> +	info->config = s_config;
> +
> +	for (i = 0; i < nr_cpus + nr_socks; i++)
> +		s_config[i] = config;
> +
> +	return 0;
> +}
> +
> +static int amd_energy_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct amd_energy_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = get_energy_units();
> +
> +	data = devm_kzalloc(dev, sizeof(struct amd_energy_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->chip.ops = &amd_energy_ops;
> +	data->chip.info = data->info;
> +
> +	/* Populate per-core energy reporting */
> +	data->info[0] = &data->energy_info;
> +	amd_create_sensor(dev, data,  hwmon_energy,
> +			  HWMON_E_INPUT | HWMON_E_LABEL);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
> +							 data,
> +							 &data->chip,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static int amd_energy_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static const struct platform_device_id amd_energy_ids[] = {
> +	{ .name = DRVNAME, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, amd_energy_ids);
> +
> +static struct platform_driver amd_energy_driver = {
> +	.probe = amd_energy_probe,
> +	.remove	= amd_energy_remove,
> +	.id_table = amd_energy_ids,
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +};
> +
> +static struct platform_device *amd_energy_platdev;
> +
> +static const struct x86_cpu_id cpu_ids[] __initconst = {
> +	AMD_CPU_FAM(17),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> +
> +static int __init amd_energy_init(void)
> +{
> +	int ret;
> +
> +	if (!x86_match_cpu(cpu_ids))
> +		return -ENODEV;
> +
> +	ret = platform_driver_register(&amd_energy_driver);
> +	if (ret < 0)
> +		return ret;
> +
> +	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> +	if (!amd_energy_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_energy_platdev);
> +	if (ret) {
> +		platform_device_unregister(amd_energy_platdev);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit amd_energy_exit(void)
> +{
> +	platform_device_unregister(amd_energy_platdev);
> +	platform_driver_unregister(&amd_energy_driver);
> +}
> +
> +module_init(amd_energy_init);
> +module_exit(amd_energy_exit);
> +
> +MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via HWMON interface");
> +MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.17.1
> 
