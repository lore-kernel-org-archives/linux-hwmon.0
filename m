Return-Path: <SRS0=9wTL=53=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B97C2BB86
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 04:49:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAD9820936
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 04:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anFKN5C9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgDKEtk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Apr 2020 00:49:40 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35974 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgDKEtk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Apr 2020 00:49:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id n23so3787679ljg.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2020 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ip05y7tEKEjIOlyuIVdWy4fI2mU1zjMSWhS31YFbK8U=;
        b=anFKN5C9CCLF0LLLJpTglZkKpX+H6t4sKGN7tZ4s+3b82swvGUmO2ireT3YDbHdaWD
         U76lcLeTecJ9POOPhvVJRZ5asS0sSYE+V2I6xHQNOhQTakqoDUwDNXDcKdSmsmRKQAyX
         nVCF7lDvOLJAlMUK9mmJMZV4EglrHvnZne9JSobn6SCxb8OdYEmeFqRCSN04vrCby2nQ
         6bjn8uh34DahTgbmYptQmNrzgIcK9D6j28PkQmJlffhuGnA2gaLtYkR+55iOERpEUVgJ
         67cyG4V/Hyey2x6ox6aoWvkxwK4XobeDuaRsMz4r3yeBm0stqeW/UJTL7h6lr8Xs6jf6
         5Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ip05y7tEKEjIOlyuIVdWy4fI2mU1zjMSWhS31YFbK8U=;
        b=TWZyI5UgrFPh84miF/AHOL/DA3W3rYY1yk4foAu1E1pMypsGN+6hEAGw5yNwd8UiJa
         LrG3f7p8Tjciq7LpnjqHhI/VZE8+qgO95r65zRAJXtg+x9K0OaeRGP4HBGStLHRv96Sr
         6F5EpxhM+PgUF5gXZnnuFmUTPq1UrJjbiVX0Eg19brIU8LcIjtDdODi9CWiW8FDxsabf
         gGeAEkOt8wt9DWLWqvZt1locvHHqejHBmR6TXnv7/7S1fSxFVGlHMboNMygglmkm5LS/
         EJQ0LNgfHCssMQh+5n5475pOomwlkC+37/cgWwRZLTGolMerSdv+2qsdydmN+yhQhRN7
         IZSA==
X-Gm-Message-State: AGi0PuZ/bu0v02TJpREq3kJkK42usufD3roP4Hp/b/VkderheLiO5DDu
        rfXdD9u98LxrZwc/6f8/K6o0TeDm9dsthwjJO0iu7GIj
X-Google-Smtp-Source: APiQypJ8b1GPLzUlUDMRY39Uy544wB9OVX+UJZa77eldGdgR8IXIN7luoHEGFUzTkaMfQAAniSCk258Re+5ZPHlbMwg=
X-Received: by 2002:a2e:a291:: with SMTP id k17mr2991487lja.225.1586580577103;
 Fri, 10 Apr 2020 21:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200409153939.38730-1-nchatrad@amd.com> <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
In-Reply-To: <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 11 Apr 2020 10:19:25 +0530
Message-ID: <CAHfPSqC-1f7gSTM1X_dhjyMjcZC0SCANbukpauASGX_pAwwZbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Thank you for taking time to review and provide feedback.
If you can kindly address a few questions, i would start addressing
your comments and submit another version.

On Fri, 10 Apr 2020 at 21:27, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/9/20 8:39 AM, Naveen Krishna Chatradhi wrote:
> > This patch adds hwmon based amd_energy driver support for
> > family 17h processors from AMD.
> >
> > The driver provides following interface to the userspace
> > 1. Reports the per core and per socket energy consumption
> >    via sysfs entries created per core and per socket respectively.
> >     * per core energy consumed via "core_energy%d_input"
> >     * package/socket energy consumed via "sock_energy%d_input".
> > 2. Uses topology_max_packages() to get number of sockets.
> > 3. Uses num_present_cpus() to get the number of CPUs.
> > 4. Reports the energy units via energy_unit sysfs entry
> >
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > ---
> >  drivers/hwmon/Kconfig      |  10 ++
> >  drivers/hwmon/Makefile     |   1 +
> >  drivers/hwmon/amd_energy.c | 273 +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 284 insertions(+)
> >  create mode 100644 drivers/hwmon/amd_energy.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 05a30832c6ba..d83f1403b429 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -324,6 +324,16 @@ config SENSORS_FAM15H_POWER
> >         This driver can also be built as a module. If so, the module
> >         will be called fam15h_power.
> >
> > +config SENSORS_AMD_ENERGY
> > +     tristate "AMD RAPL MSR based Energy driver"
> > +     depends on X86
> > +     help
> > +       If you say yes here you get support for core and package energy
> > +       sensors, based on RAPL MSR for AMD family 17h and above CPUs.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called as amd_energy.
> > +
> >  config SENSORS_APPLESMC
> >       tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
> >       depends on INPUT && X86
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index b0b9c8e57176..318f89dc7133 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)       += adt7411.o
> >  obj-$(CONFIG_SENSORS_ADT7462)        += adt7462.o
> >  obj-$(CONFIG_SENSORS_ADT7470)        += adt7470.o
> >  obj-$(CONFIG_SENSORS_ADT7475)        += adt7475.o
> > +obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
> >  obj-$(CONFIG_SENSORS_APPLESMC)       += applesmc.o
> >  obj-$(CONFIG_SENSORS_ARM_SCMI)       += scmi-hwmon.o
> >  obj-$(CONFIG_SENSORS_ARM_SCPI)       += scpi-hwmon.o
> > diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > new file mode 100644
> > index 000000000000..ddb7073ae39b
> > --- /dev/null
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -0,0 +1,273 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/*
> > + * Copyright (C) 2019 Advanced Micro Devices, Inc.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/cpu.h>
> > +#include <linux/list.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/processor.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/cpumask.h>
>
> Alphabetic include file order, please.
I missed it, will correct it.
>
> > +
> > +#include <asm/cpu_device_id.h>
> > +
> > +#define DRVNAME      "amd_energy"
> > +
> > +#define ENERGY_PWR_UNIT_MSR  0xC0010299
> > +#define ENERGY_CORE_MSR      0xC001029A
> > +#define ENERGY_PCK_MSR               0xC001029B
> > +
> > +#define AMD_TIME_UNIT_MASK   0xF0000
> > +#define AMD_ENERGY_UNIT_MASK 0x01F00
> > +#define AMD_POWER_UNIT_MASK  0x0000F
> > +
> > +#define ENERGY_STATUS_MASK   0xffffffff
> > +
> > +#define AMD_FAM_17           0x17 /* ZP, SSP */
> > +
> > +/* Useful macros */
> > +#define AMD_CPU_FAM_ANY(_family, _model)     \
> > +{                                            \
> > +     .vendor         = X86_VENDOR_AMD,       \
> > +     .family         = _family,              \
> > +     .model          = _model,               \
> > +     .feature        = X86_FEATURE_ANY,      \
> > +}
> > +
> > +#define AMD_CPU_FAM(_model)                  \
> > +     AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
> > +
> > +static struct device_attribute units_attr;
> > +
> > +struct sensor_data {
> > +     unsigned int scale;
> > +     union {
> > +             unsigned int cpu_nr;
> > +             unsigned int sock_nr;
> > +     };
> > +     struct device_attribute dev_attr_input;
> > +     char input[32];
> > +};
> > +
> > +struct amd_energy_sensors {
> > +     struct sensor_data *data;
> > +     struct attribute **attrs;
> > +     struct attribute_group group;
> > +     const struct attribute_group *groups[1];
>
> Even if acceptable, this would be wrong. The list of groups
> ends with an empty entry, meaning this array would have to have
> at least two entries (one for the terminator).
Will correct it.
>
> > +};
> > +
> > +static ssize_t amd_units_u64_show(struct device *dev,
> > +     struct device_attribute *dev_attr, char *buffer)
> > +{
> > +     uint64_t rapl_units;
> > +     uint64_t energy_unit;
> > +     int ret = 0;
> > +
> > +     ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     energy_unit = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> > +
> > +     return snprintf(buffer, 24, "%llu\n", energy_unit);
> > +}
> > +
> > +static ssize_t amd_core_u64_show(struct device *dev,
> > +             struct device_attribute *dev_attr, char *buffer)
> > +{
> > +     unsigned long long value;
> > +     struct sensor_data *sensor;
> > +     int ret = 0;
> > +
> > +     sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> > +     ret = rdmsrl_safe_on_cpu(sensor->cpu_nr, ENERGY_CORE_MSR, &value);
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     return snprintf(buffer, 24, "%llu\n", value);
>
> It seems to me this reports raw values. This is unacceptable. Values need
> to be scaled to match the ABI. Energy is reported in microJoule.
I was of the opinion that driver provides the raw values and user-space (can use
float/double)  will be able to scale the value, which would involve
calculation of
"1/2^ESU * RAW value"

>
> > +}
> > +
> > +static ssize_t amd_sock_u64_show(struct device *dev,
> > +             struct device_attribute *dev_attr, char *buffer)
> > +{
> > +     unsigned long long value;
> > +     struct sensor_data *sensor;
> > +     int ret = 0;
> > +     int cpu, cpu_nr;
> > +
> > +     sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> > +
> > +     for_each_possible_cpu(cpu) {
> > +             struct cpuinfo_x86 *c = &cpu_data(cpu);
> > +
> > +             if (c->initialized && c->logical_die_id == sensor->sock_nr) {
> > +                     cpu_nr = cpu;
> > +                     break;
> > +             }
> > +             cpu_nr = 0;
> > +     }
> > +
> > +     ret = rdmsrl_safe_on_cpu(cpu_nr, ENERGY_PCK_MSR, &value);
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     return snprintf(buffer, 24, "%llu\n", value);
> > +}
> > +
> > +static int amd_energy_probe(struct platform_device *pdev)
> > +{
> > +     struct amd_energy_sensors *amd_sensors;
> > +     struct device *hwdev, *dev = &pdev->dev;
> > +     int nr_cpus, nr_socks, idx = 0;
> > +
> > +     nr_cpus = num_present_cpus();
> > +     nr_socks = topology_max_packages();
> > +
> > +     amd_sensors = devm_kzalloc(dev, sizeof(*amd_sensors), GFP_KERNEL);
> > +     if (!amd_sensors)
> > +             return -ENOMEM;
> > +
> > +     amd_sensors->data = devm_kcalloc(dev, nr_cpus + nr_socks,
> > +                             sizeof(*amd_sensors->data), GFP_KERNEL);
> > +     if (!amd_sensors->data)
> > +             return -ENOMEM;
> > +
> > +     amd_sensors->attrs = devm_kcalloc(dev, nr_cpus + nr_socks,
> > +                             sizeof(*amd_sensors->attrs), GFP_KERNEL);
> > +     if (!amd_sensors->attrs)
> > +             return -ENOMEM;
> > +
> > +     /* populate attributes for number of cpus. */
> > +     for (idx = 0; idx < ; idx++) {
> > +             struct sensor_data *sensor = &amd_sensors->data[idx];
> > +
> > +             snprintf(sensor->input, sizeof(sensor->input),
> > +                             "core_energy%d_input", idx);
> > +
>
> This is unacceptable. Please use standard attributes (energyX_input).
> If you want to report what the sensor is for, use labels.
Got it.
>
> > +             sensor->dev_attr_input.attr.mode = 0444;
> > +             sensor->dev_attr_input.attr.name = sensor->input;
> > +             sensor->dev_attr_input.show = amd_core_u64_show;
> > +
> > +             sensor->cpu_nr = idx;
> > +             amd_sensors->attrs[idx] = &sensor->dev_attr_input.attr;
> > +
> > +             sysfs_attr_init(amd_sensors->attrs[idx]);
> > +     }
> > +
> > +     /* populate attributes for number of sockets. */
> > +     for (idx = 0; idx < nr_socks; idx++) {
> > +             struct sensor_data *sensor =
> > +                     &amd_sensors->data[nr_cpus + idx];
> > +
> > +             snprintf(sensor->input,
> > +                     sizeof(sensor->input), "sock_energy%d_input", idx);
> > +
> > +             sensor->dev_attr_input.attr.mode = 0444;
> > +             sensor->dev_attr_input.attr.name = sensor->input;
> > +             sensor->dev_attr_input.show = amd_sock_u64_show;
> > +
> > +             sensor->sock_nr = idx;
> > +             amd_sensors->attrs[nr_cpus + idx] =
> > +                     &sensor->dev_attr_input.attr;
> > +
> > +             sysfs_attr_init(amd_sensors->attrs[nr_cpus + idx]);
> > +     }
>
> This all makes me wonder what is reported for inactive/disabled CPUs.
>
> > +
> > +     amd_sensors->group.attrs = amd_sensors->attrs;
> > +     amd_sensors->groups[0] = &amd_sensors->group;
> > +
> > +     platform_set_drvdata(pdev, amd_sensors);
> > +
> > +     hwdev = devm_hwmon_device_register_with_groups(dev,
> > +                     "amd_energy", amd_sensors, amd_sensors->groups);
>
> Please rework the driver to use the devm_hwmon_device_register_with_info() API.
>
> > +     if (!hwdev)
> > +             return PTR_ERR_OR_ZERO(hwdev);
> > +
> > +     /* populate attributes for energy units */
> > +     units_attr.attr.name = "energy_units";
> > +     units_attr.attr.mode = 0444;
> > +     units_attr.show = amd_units_u64_show;
> > +
> > +     return sysfs_create_file(&hwdev->kobj, &units_attr.attr);
>
> This is irrelevant for this driver. Units are fixed. Besides, registering
> sysfs attributes after driver registration is racy and won't be accepted.
> Non-standard attributes can be added with the groups argument of
> devm_hwmon_device_register_with_info() (not that I see any here).
I will try to change the driver around using
devm_hwmon_device_register_with_info()

>
> > +}
> > +
> > +static int amd_energy_remove(struct platform_device *pdev)
> > +{
> > +     sysfs_remove_file(&pdev->dev.kobj, &units_attr.attr);
> > +     return 0;
> > +}
> > +
> > +static const struct platform_device_id amd_energy_ids[] = {
> > +     { .name = DRVNAME, },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(platform, amd_energy_ids);
> > +
> > +static struct platform_driver amd_energy_driver = {
> > +     .probe = amd_energy_probe,
> > +     .remove = amd_energy_remove,
> > +     .id_table = amd_energy_ids,
> > +     .driver = {
> > +             .name = DRVNAME,
> > +     },
> > +};
> > +
> > +static struct platform_device *amd_energy_platdev;
> > +
> > +static const struct x86_cpu_id cpu_ids[] __initconst = {
> > +     AMD_CPU_FAM(17),
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> > +
> > +static int __init amd_energy_init(void)
> > +{
> > +     const struct x86_cpu_id *id;
> > +     int ret;
> > +
> > +     id = x86_match_cpu(cpu_ids);
> > +     if (!id) {
> > +             pr_err("driver does not support CPU family %d model %d\n",
> > +                     boot_cpu_data.x86, boot_cpu_data.x86_model);
> > +
>
> This is not an error and thus does not warrant an error message.
Ok
>
> > +             return -ENODEV;
> > +     }
> > +
> > +     ret = platform_driver_register(&amd_energy_driver);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> > +     if (!amd_energy_platdev)
> > +             return -ENOMEM;
> > +
> > +     ret = platform_device_add(amd_energy_platdev);
> > +     if (ret) {
> > +             platform_device_unregister(amd_energy_platdev);
> > +             return ret;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static void __exit amd_energy_exit(void)
> > +{
> > +     platform_device_unregister(amd_energy_platdev);
> > +     platform_driver_unregister(&amd_energy_driver);
> > +}
> > +
> > +module_init(amd_energy_init);
> > +module_exit(amd_energy_exit);
> > +
> > +MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via HWMON interface");
> > +MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
> > +MODULE_LICENSE("GPL");
> >
>


-- 
Shine bright,
Naveen
