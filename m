Return-Path: <SRS0=gljW=7E=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16F4C433DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 May 2020 13:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F222065F
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 May 2020 13:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoKHEwXK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgEVN05 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 May 2020 09:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729908AbgEVN04 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 May 2020 09:26:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B0AC061A0E
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2020 06:26:55 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x18so3282536pll.6
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2020 06:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c+H3TDICDtQCXo5Lbq+hpB8PlKah4eO/90NUQuwEX6I=;
        b=KoKHEwXKYIoWBf3oV5DhsSlXT74Rlb3saPDz+YJEsEL89XJBNgyA8SXEscQrPho9DF
         k0XrHZlk9aCkvRb9IfC5hAxTptAuSCFzQTTn8bRisuYXHXRDE7BzbR3SZ+h3KPYHSoQy
         qzsUSyii49HYSQFMxwyWC0KyehHiGxd+x9Y0mt4B1pAjDyAHB01FdjBfRTJJIH1Fgva+
         IKI37GLEB12jQIZ+uYrfwMwWlR2a6PAOtPgMyhoHzlUwT9DpdHZBj0CrVL8I+lLhCQ5L
         7BGkiic107SaxhEH7ykmv0kNGvMw/LjGFTVygZRFQefluwSixz0ThZJxe+Yf5DRmFk46
         uhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c+H3TDICDtQCXo5Lbq+hpB8PlKah4eO/90NUQuwEX6I=;
        b=WAuDd+XNmMo0rm6lt9DSZ/QRaIDCJrDoOLCzaZXx6I6cX7LT016db9KdowAptpUmOg
         EIyKZV7anZQXvF29xxDzKVtPPkrgAq5Tb96Wv4/2qC8LtHXY1lWP6Ph9GeMxaxVCKJZ/
         XDdMtBaGWuOt7j0qOnxVlqMKjmFyfhlE9EFx7YsMvBZK+oV+APcqkQUgFWQn+jIBxzx/
         VUe3gBLU901hB+7GKPIyRv6/uggW0MsxNxo3NZ5EBEh3Jr5o2FmSherWxtA2GdMUDp4r
         7BjZxIfJgFK3Tg6r5v3YBKxfJBhHPq1lHDIVQhFVbkbIQhNnwpX7l1EKU2y0cZWqsdTW
         0A+A==
X-Gm-Message-State: AOAM531axMio1InVl9Qb7aFKvXET9i+bubAv8ZcgGG86PnpEEQpMLfDR
        r6wFnr3EEH8K4GTHXNNm1aM=
X-Google-Smtp-Source: ABdhPJyshIE+glw3qZbK/09T8+NKWoZFj5xBAlYbH6lblbhOwAaZB7We8XrXtCN3+NABzdG++PKpRA==
X-Received: by 2002:a17:902:7242:: with SMTP id c2mr15167249pll.57.1590154015305;
        Fri, 22 May 2020 06:26:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h24sm6992721pjz.24.2020.05.22.06.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 06:26:54 -0700 (PDT)
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com
References: <20200519155011.56184-1-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
Date:   Fri, 22 May 2020 06:26:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519155011.56184-1-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/19/20 8:50 AM, Naveen Krishna Chatradhi wrote:
> This patch adds hwmon based amd_energy driver support for
> family 17h processors from AMD.
> 
> The driver provides following interface to the userspace
> 1. Reports the per core consumption
> 	* file: "energy%d_input", label: "Ecore%03d"
> 2. Reports per socket energy consumption
> 	* file: "energy%d_input", label: "Esocket%d"
> 3. To, increase the wrap around time of the socket energy
>    counters, a 64bit accumultor is implemented.
> 4. Reports scaled energy value in Joules.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---

This version looks ok, and it looks like there are no more
unexpected counter wraps either. Series applied to hwmon-next.

Thanks,
Guenter

> Changes in v7:
> 1. Move all static variables into the data structure
> 2. Move the read-update code under the mutex lock
> 
>  drivers/hwmon/Kconfig      |  10 +
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/amd_energy.c | 406 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
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
> index 000000000000..bc8b643a37d5
> --- /dev/null
> +++ b/drivers/hwmon/amd_energy.c
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> + */
> +#include <asm/cpu_device_id.h>
> +
> +#include <linux/bits.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/processor.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/topology.h>
> +#include <linux/types.h>
> +
> +#define DRVNAME			"amd_energy"
> +
> +#define ENERGY_PWR_UNIT_MSR	0xC0010299
> +#define ENERGY_CORE_MSR		0xC001029A
> +#define ENERGY_PKG_MSR		0xC001029B
> +
> +#define AMD_ENERGY_UNIT_MASK	0x01F00
> +#define AMD_ENERGY_MASK		0xFFFFFFFF
> +
> +struct sensor_accumulator {
> +	u64 energy_ctr;
> +	u64 prev_value;
> +	char label[10];
> +};
> +
> +struct amd_energy_data {
> +	struct hwmon_channel_info energy_info;
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_chip_info chip;
> +	struct task_struct *wrap_accumulate;
> +	/* Lock around the accumulator */
> +	struct mutex lock;
> +	/* An accumulator for each core and socket */
> +	struct sensor_accumulator *accums;
> +	/* Energy Status Units */
> +	u64 energy_units;
> +	int nr_cpus;
> +	int nr_socks;
> +	int core_id;
> +};
> +
> +static int amd_energy_read_labels(struct device *dev,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel,
> +				  const char **str)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->accums[channel].label;
> +	return 0;
> +}
> +
> +static void get_energy_units(struct amd_energy_data *data)
> +{
> +	u64 rapl_units;
> +
> +	rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> +	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> +}
> +
> +static void accumulate_socket_delta(struct amd_energy_data *data,
> +				    int sock, int cpu)
> +{
> +	struct sensor_accumulator *s_accum;
> +	u64 input;
> +
> +	mutex_lock(&data->lock);
> +	rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> +	input &= AMD_ENERGY_MASK;
> +
> +	s_accum = &data->accums[data->nr_cpus + sock];
> +	if (input >= s_accum->prev_value)
> +		s_accum->energy_ctr +=
> +			input - s_accum->prev_value;
> +	else
> +		s_accum->energy_ctr += UINT_MAX -
> +			s_accum->prev_value + input;
> +
> +	s_accum->prev_value = input;
> +	mutex_unlock(&data->lock);
> +}
> +
> +static void accumulate_core_delta(struct amd_energy_data *data)
> +{
> +	struct sensor_accumulator *c_accum;
> +	u64 input;
> +	int cpu;
> +
> +	mutex_lock(&data->lock);
> +	if (data->core_id >= data->nr_cpus)
> +		data->core_id = 0;
> +
> +	cpu = data->core_id;
> +
> +	if (!cpu_online(cpu))
> +		goto out;
> +
> +	rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> +	input &= AMD_ENERGY_MASK;
> +
> +	c_accum = &data->accums[cpu];
> +
> +	if (input >= c_accum->prev_value)
> +		c_accum->energy_ctr +=
> +			input - c_accum->prev_value;
> +	else
> +		c_accum->energy_ctr += UINT_MAX -
> +			c_accum->prev_value + input;
> +
> +	c_accum->prev_value = input;
> +
> +out:
> +	data->core_id++;
> +	mutex_unlock(&data->lock);
> +}
> +
> +static void read_accumulate(struct amd_energy_data *data)
> +{
> +	int sock;
> +
> +	for (sock = 0; sock < data->nr_socks; sock++) {
> +		int cpu;
> +
> +		cpu = cpumask_first_and(cpu_online_mask,
> +					cpumask_of_node(sock));
> +
> +		accumulate_socket_delta(data, sock, cpu);
> +	}
> +
> +	accumulate_core_delta(data);
> +}
> +
> +static void amd_add_delta(struct amd_energy_data *data, int ch,
> +			  int cpu, long *val, bool is_core)
> +{
> +	struct sensor_accumulator *s_accum, *c_accum;
> +	u64 input;
> +
> +	mutex_lock(&data->lock);
> +	if (!is_core) {
> +		rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> +		input &= AMD_ENERGY_MASK;
> +
> +		s_accum = &data->accums[ch];
> +		if (input >= s_accum->prev_value)
> +			input += s_accum->energy_ctr -
> +				  s_accum->prev_value;
> +		else
> +			input += UINT_MAX - s_accum->prev_value +
> +				  s_accum->energy_ctr;
> +	} else {
> +		rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> +		input &= AMD_ENERGY_MASK;
> +
> +		c_accum = &data->accums[ch];
> +		if (input >= c_accum->prev_value)
> +			input += c_accum->energy_ctr -
> +				 c_accum->prev_value;
> +		else
> +			input += UINT_MAX - c_accum->prev_value +
> +				 c_accum->energy_ctr;
> +	}
> +
> +	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
> +	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
> +
> +	mutex_unlock(&data->lock);
> +}
> +
> +static int amd_energy_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(dev);
> +	int cpu;
> +
> +	if (channel >= data->nr_cpus) {
> +		cpu = cpumask_first_and(cpu_online_mask,
> +					cpumask_of_node
> +					(channel - data->nr_cpus));
> +		amd_add_delta(data, channel, cpu, val, false);
> +	} else {
> +		cpu = channel;
> +		if (!cpu_online(cpu))
> +			return -ENODEV;
> +
> +		amd_add_delta(data, channel, cpu, val, true);
> +	}
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
> +static int energy_accumulator(void *p)
> +{
> +	struct amd_energy_data *data = (struct amd_energy_data *)p;
> +
> +	while (!kthread_should_stop()) {
> +		/*
> +		 * Ignoring the conditions such as
> +		 * cpu being offline or rdmsr failure
> +		 */
> +		read_accumulate(data);
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		if (kthread_should_stop())
> +			break;
> +
> +		/*
> +		 * On a 240W system, with default resolution the
> +		 * Socket Energy status register may wrap around in
> +		 * 2^32*15.3 e-6/240 = 273.8041 secs (~4.5 mins)
> +		 *
> +		 * let us accumulate for every 100secs
> +		 */
> +		schedule_timeout(msecs_to_jiffies(100000));
> +	}
> +	return 0;
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
> +	struct hwmon_channel_info *info = &data->energy_info;
> +	struct sensor_accumulator *accums;
> +	int i, num_siblings, cpus, sockets;
> +	u32 *s_config;
> +
> +	/* Identify the number of siblings per core */
> +	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
> +
> +	sockets = num_possible_nodes();
> +
> +	/*
> +	 * Energy counter register is accessed at core level.
> +	 * Hence, filterout the siblings.
> +	 */
> +	cpus = num_present_cpus() / num_siblings;
> +
> +	s_config = devm_kcalloc(dev, cpus + sockets,
> +				sizeof(u32), GFP_KERNEL);
> +	if (!s_config)
> +		return -ENOMEM;
> +
> +	accums = devm_kcalloc(dev, cpus + sockets,
> +			      sizeof(struct sensor_accumulator),
> +			      GFP_KERNEL);
> +	if (!accums)
> +		return -ENOMEM;
> +
> +	info->type = type;
> +	info->config = s_config;
> +
> +	data->nr_cpus = cpus;
> +	data->nr_socks = sockets;
> +	data->accums = accums;
> +
> +	for (i = 0; i < cpus + sockets; i++) {
> +		s_config[i] = config;
> +		if (i < cpus)
> +			scnprintf(accums[i].label, 10,
> +				  "Ecore%03u", i);
> +		else
> +			scnprintf(accums[i].label, 10,
> +				  "Esocket%u", (i - cpus));
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_energy_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct amd_energy_data *data;
> +	struct device *dev = &pdev->dev;
> +
> +	data = devm_kzalloc(dev,
> +			    sizeof(struct amd_energy_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->chip.ops = &amd_energy_ops;
> +	data->chip.info = data->info;
> +
> +	dev_set_drvdata(dev, data);
> +	/* Populate per-core energy reporting */
> +	data->info[0] = &data->energy_info;
> +	amd_create_sensor(dev, data, hwmon_energy,
> +			  HWMON_E_INPUT | HWMON_E_LABEL);
> +
> +	mutex_init(&data->lock);
> +	get_energy_units(data);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
> +							 data,
> +							 &data->chip,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	data->wrap_accumulate = kthread_run(energy_accumulator, data,
> +					    "%s", dev_name(hwmon_dev));
> +	if (IS_ERR(data->wrap_accumulate))
> +		return PTR_ERR(data->wrap_accumulate);
> +
> +	return PTR_ERR_OR_ZERO(data->wrap_accumulate);
> +}
> +
> +static int amd_energy_remove(struct platform_device *pdev)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(&pdev->dev);
> +
> +	if (data && data->wrap_accumulate)
> +		kthread_stop(data->wrap_accumulate);
> +
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
> +	X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
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
> +	if (ret)
> +		return ret;
> +
> +	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> +	if (!amd_energy_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_energy_platdev);
> +	if (ret) {
> +		platform_device_put(amd_energy_platdev);
> +		platform_driver_unregister(&amd_energy_driver);
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

