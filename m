Return-Path: <SRS0=tzLi=6H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2E0C55191
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 19:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 387AA20728
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 19:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2fO7NYN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgDWTKQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 15:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDWTKP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 15:10:15 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709BCC09B042
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2020 12:10:15 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f8so2736677plt.2
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2020 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=66ljhOjbbNYo2SIIf/w1ilvurYgMvtaY6jBNiGNcp6I=;
        b=D2fO7NYNuPLd/koVyRrfenKB5q4MuxTGyYbQaYCcnMII2BkCpyQimpmFrKzGMJ0BzK
         HoRj+zVdvRae+dMOPt6gqaTnos/5jt3vvJaptHa8TmDzg6pozoQG3knWTa4rFA+fLnM9
         wGiv5zm2d8fD6szhwSe2bV/kh1iBQym4n/HNgdUsnj1dLOP2khoo+edoNn/2xYw0Kogh
         1eTMCuwbgvtBBcIHHId3VpeDxglruP5lFtIMNlTRWQs/bpA9OfjnSFxf1ilSjaCP/9nS
         3zILQv6xAsSnfQ0uLsJQFmdk+DTJ8wPjRIsLNRntoLNFQuWAqYm7Q3s/5izuih2FCzQ+
         vRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=66ljhOjbbNYo2SIIf/w1ilvurYgMvtaY6jBNiGNcp6I=;
        b=lIpGwZ5+nENTYEhT0Mw0Bkkho7d5pY0HdFhW42KzZD/2+MjX7f1mc5oKhb14k7lSnV
         v6AiDffavjq/N0zcNoHzW44QkqgvxkOKrXdejjZhLduYrescHHhcar1nGK/UhEn4phXG
         t5r/BnUw93DF85gn2dOPLaSip/ITOqOEasKsggcOjrdIyIVOYO8v8KBIZUCjTbuppWu9
         agX8StKD2KOyHYAcfDwTerEb+w43twzAbeJG2hNYAce2bL7p56BtJCirwbjkEbarPLq5
         3ZbHe3QhvFZcGF4QOO7UX8tN8c6yq6n78OOp3uLfBYT58AF12DVojy678+IYy6nKPN6a
         yphQ==
X-Gm-Message-State: AGi0PuZuBpXjw3hQ960Ivtpe36lKdIYioT9qrSRraLSHcDXYXNXag0Jp
        I8SKTSIgcFD/J1qNe7mB5uBJbt6V
X-Google-Smtp-Source: APiQypIMJo+OYkgmY6yp+uI2PdUs/PemHOX770/WXT+dqLg2yRQvSG3SeLIMTb0LVdHAwIjNGgyVAA==
X-Received: by 2002:a17:90a:1f8f:: with SMTP id x15mr2241572pja.76.1587669014557;
        Thu, 23 Apr 2020 12:10:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r128sm3477974pfc.141.2020.04.23.12.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 12:10:13 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hwmon: Add amd_energy driver to report energy
 counters
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200417190459.233179-1-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3bc1c356-3626-8c30-354f-ee1f5dd6dce0@roeck-us.net>
Date:   Thu, 23 Apr 2020 12:10:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417190459.233179-1-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/17/20 12:04 PM, Naveen Krishna Chatradhi wrote:
> This patch adds hwmon based amd_energy driver support for
> family 17h processors from AMD.
> 
> The driver provides following interface to the userspace
> 1. Reports the per core consumption
> 	* file: "energy%d_input", label: "Ecore%03d"
> 2. Reports per socket energy consumption
> 	* file: "energy%d_input", label: "Esocket%d"
> 3. Reports scaled energy value in Joules.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Please run checkpatch --strict and fix the alignment errors it reports.

> ---
> Changes in V2:
> Addressed comments from Guenter. Major changes include 
> 1. Use chip_info instead of groups
> 2. Use standard file naming conventions
> 3. Report scaled values 
> 
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/amd_energy.c | 251 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 262 insertions(+)
>  create mode 100644 drivers/hwmon/amd_energy.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 05a30832c6ba..d83f1403b429 100644
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
> index 000000000000..7127f1f5f5ee
> --- /dev/null
> +++ b/drivers/hwmon/amd_energy.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> + */
> +
> +#include <asm/cpu_device_id.h>
> +
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Leftover from v1 ?

> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/processor.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>

Leftover from v1 ?

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
> +struct amd_energy_data {
> +	struct hwmon_channel_info energy_info;
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_chip_info chip;
> +};
> +
> +static int nr_cpus, nr_socks;
> +static uint64_t energy_units;
> +
> +static int amd_energy_read_labels(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
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
> +	uint64_t rapl_units;
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
> +			enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	uint64_t value;
> +	int cpu = 0, ret;

There is no need to initialize 'cpu'.

> +	u32 reg;
> +
> +	if (channel >= nr_cpus) {
> +		reg = ENERGY_PKG_MSR;
> +		cpu = cpumask_first_and(cpu_online_mask,
> +				cpumask_of_node(channel - nr_cpus));
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
> +	if ((energy_units == 0) && get_energy_units())

Please no unnecessary ( ).

> +		return -EAGAIN;
> +
> +	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
> +	*val = (long)value * div64_ul(1000000UL, (1 << energy_units));

BIT ?

> +
> +	return 0;
> +}
> +
> +static umode_t amd_energy_is_visible(const void *_data,
> +			enum hwmon_sensor_types type,
> +			u32 attr, int channel)
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
> +			struct amd_energy_data *data,
> +			u8 type, u32 config)
> +{
> +	int i;
> +	u32 *s_config;
> +	struct hwmon_channel_info *info = &data->energy_info;
> +
> +	nr_socks = num_online_nodes();
> +	nr_cpus = num_online_cpus();
> +

This code makes me wonder what happens if some CPUs are taken
offline/online dynamically. Have you tried that ?

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
> +				HWMON_E_INPUT | HWMON_E_LABEL);
> +
> +	data->info[1] = NULL;

data was allocated with devm_kzalloc(). There is no need to clean
that field again.

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
> 

