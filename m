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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A32AC2BA2B
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 17:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CBEF20757
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Apr 2020 17:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiBWJvFO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDKRHi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Apr 2020 13:07:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33201 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDKRHh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Apr 2020 13:07:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id q22so4873271ljg.0
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2020 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fwf8KArGumSTOqMp4+M8xuLRLaiR9uNWE7GXqk1HG5A=;
        b=GiBWJvFOx0Rju8bh+8K4CZYJ+2EA83iDRueRX7zYaqxKEzas3Q92kg9dOoi70Zwgap
         +VdkrEioJKiSH7OgUzdVsZ2LGvGBkucmcVL15E36c/os1iAMUbm42fwehlYVp0/n3Gws
         qKY1+xWpbNOf7+E24q45jvKSsl6wNSbS3UEasaram06pRRqdJvpiRT5Ke+Hpua/Dxjci
         MZSWq7lUbYWWGUB2AFjRGUsAbc6KwtYqD1dNmFD1UY+R0tJVts5X9McV5LAEGyqWe8F6
         ILwVFdwFkpSVZrfz6AzN/x7H8CT38LZyhHbuAwtlRiRvXYZV02Pw8JtpyqMh8r7EI/Zy
         RGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwf8KArGumSTOqMp4+M8xuLRLaiR9uNWE7GXqk1HG5A=;
        b=SLeaPpwONlVnj4amKhT3z7lYrDL9xUfYWsZohLDkS0UE3GsICnAkRtBHD7gyfY1GMt
         Qj3z6aE4A95BMM1yWFvDbakpqEiahGL9/V2CS/yx94xi4FWbDuHg1gSAiLwswcznjTxh
         cwi/7KqVpVMb/YXiTzFbH/qtXAByvXJVuFxZlh14B6IZQuK8aS33rbxv495zbBujqzyN
         DLlwYIL2pwB0tQTAqchFTsc8p7OFtplxfPxlrRxx8ZJIpKlJqCdh88BBQxh3Bcjgzl17
         3QCsT86dCk9sOBtV3XDS9erHOamCeN/pEc5cQM1Fe2qa52MOPuCVpPPnqyHhBkE9FHe+
         0ggQ==
X-Gm-Message-State: AGi0Puas3/7uXdMqs/+L/dQRvvazArJCP0U4c96pFjKSz1saICYRCqS7
        S+Gs343P/wD1v3WcEKXIYCTf2/rNmo4R56AUTlhdUg==
X-Google-Smtp-Source: APiQypI76Pyw+By+DZu4LkKLa/jXVR1b5EDLbeknSnro2954ueQ1OwOAXfhtdmiB1Mg5dvCygIQATPvKdf8SOhEHpWk=
X-Received: by 2002:a05:651c:20d:: with SMTP id y13mr6341734ljn.112.1586624851922;
 Sat, 11 Apr 2020 10:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200409153939.38730-1-nchatrad@amd.com> <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
 <CAHfPSqAsuo+ac49L=f0Bg-iPj5gVQp3MRE9kfjSFysUx7WMHpg@mail.gmail.com> <75bc1938-104d-4d53-f46a-247e5ce2d2d2@roeck-us.net>
In-Reply-To: <75bc1938-104d-4d53-f46a-247e5ce2d2d2@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Sat, 11 Apr 2020 22:37:20 +0530
Message-ID: <CAHfPSqDQmQFaN-VqrPLPz8GOGh_4VHq6=4moJQB3eEGPdRfMiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

On Sat, 11 Apr 2020 at 21:18, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/11/20 5:26 AM, Naveen Krishna Ch wrote:
> > Hi Guenter
> >
> > I would be glad, If you could help me with the following query.
> > On Fri, 10 Apr 2020 at 21:27, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 4/9/20 8:39 AM, Naveen Krishna Chatradhi wrote:
> >>> This patch adds hwmon based amd_energy driver support for
> >>> family 17h processors from AMD.
> >>>
> >>> The driver provides following interface to the userspace
> >>> 1. Reports the per core and per socket energy consumption
> >>>    via sysfs entries created per core and per socket respectively.
> >>>     * per core energy consumed via "core_energy%d_input"
> >>>     * package/socket energy consumed via "sock_energy%d_input".
> >>> 2. Uses topology_max_packages() to get number of sockets.
> >>> 3. Uses num_present_cpus() to get the number of CPUs.
> >>> 4. Reports the energy units via energy_unit sysfs entry
> >>>
> >>> Cc: Guenter Roeck <linux@roeck-us.net>
> >>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >>> ---
> >>>  drivers/hwmon/Kconfig      |  10 ++
> >>>  drivers/hwmon/Makefile     |   1 +
> >>>  drivers/hwmon/amd_energy.c | 273 +++++++++++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 284 insertions(+)
> >>>  create mode 100644 drivers/hwmon/amd_energy.c
> >>>
> >>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >>> index 05a30832c6ba..d83f1403b429 100644
> >>> --- a/drivers/hwmon/Kconfig
> >>> +++ b/drivers/hwmon/Kconfig
> >>> @@ -324,6 +324,16 @@ config SENSORS_FAM15H_POWER
> >>>         This driver can also be built as a module. If so, the module
> >>>         will be called fam15h_power.
> >>>
> >>> +config SENSORS_AMD_ENERGY
> >>> +     tristate "AMD RAPL MSR based Energy driver"
> >>> +     depends on X86
> >>> +     help
> >>> +       If you say yes here you get support for core and package energy
> >>> +       sensors, based on RAPL MSR for AMD family 17h and above CPUs.
> >>> +
> >>> +       This driver can also be built as a module. If so, the module
> >>> +       will be called as amd_energy.
> >>> +
> >>>  config SENSORS_APPLESMC
> >>>       tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
> >>>       depends on INPUT && X86
> >>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >>> index b0b9c8e57176..318f89dc7133 100644
> >>> --- a/drivers/hwmon/Makefile
> >>> +++ b/drivers/hwmon/Makefile
> >>> @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)       += adt7411.o
> >>>  obj-$(CONFIG_SENSORS_ADT7462)        += adt7462.o
> >>>  obj-$(CONFIG_SENSORS_ADT7470)        += adt7470.o
> >>>  obj-$(CONFIG_SENSORS_ADT7475)        += adt7475.o
> >>> +obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
> >>>  obj-$(CONFIG_SENSORS_APPLESMC)       += applesmc.o
> >>>  obj-$(CONFIG_SENSORS_ARM_SCMI)       += scmi-hwmon.o
> >>>  obj-$(CONFIG_SENSORS_ARM_SCPI)       += scpi-hwmon.o
> >>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> >>> new file mode 100644
> >>> index 000000000000..ddb7073ae39b
> >>> --- /dev/null
> >>> +++ b/drivers/hwmon/amd_energy.c
> >>> @@ -0,0 +1,273 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +
> >>> +/*
> >>> + * Copyright (C) 2019 Advanced Micro Devices, Inc.
> >>> + */
> >>> +
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/slab.h>
> >>> +#include <linux/types.h>
> >>> +#include <linux/device.h>
> >>> +#include <linux/sysfs.h>
> >>> +#include <linux/cpu.h>
> >>> +#include <linux/list.h>
> >>> +#include <linux/hwmon.h>
> >>> +#include <linux/hwmon-sysfs.h>
> >>> +#include <linux/processor.h>
> >>> +#include <linux/platform_device.h>
> >>> +#include <linux/cpumask.h>
> >>
> >> Alphabetic include file order, please.
> >>
> >>> +
> >>> +#include <asm/cpu_device_id.h>
> >>> +
> >>> +#define DRVNAME      "amd_energy"
> >>> +
> >>> +#define ENERGY_PWR_UNIT_MSR  0xC0010299
> >>> +#define ENERGY_CORE_MSR      0xC001029A
> >>> +#define ENERGY_PCK_MSR               0xC001029B
> >>> +
> >>> +#define AMD_TIME_UNIT_MASK   0xF0000
> >>> +#define AMD_ENERGY_UNIT_MASK 0x01F00
> >>> +#define AMD_POWER_UNIT_MASK  0x0000F
> >>> +
> >>> +#define ENERGY_STATUS_MASK   0xffffffff
> >>> +
> >>> +#define AMD_FAM_17           0x17 /* ZP, SSP */
> >>> +
> >>> +/* Useful macros */
> >>> +#define AMD_CPU_FAM_ANY(_family, _model)     \
> >>> +{                                            \
> >>> +     .vendor         = X86_VENDOR_AMD,       \
> >>> +     .family         = _family,              \
> >>> +     .model          = _model,               \
> >>> +     .feature        = X86_FEATURE_ANY,      \
> >>> +}
> >>> +
> >>> +#define AMD_CPU_FAM(_model)                  \
> >>> +     AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
> >>> +
> >>> +static struct device_attribute units_attr;
> >>> +
> >>> +struct sensor_data {
> >>> +     unsigned int scale;
> >>> +     union {
> >>> +             unsigned int cpu_nr;
> >>> +             unsigned int sock_nr;
> >>> +     };
> >>> +     struct device_attribute dev_attr_input;
> >>> +     char input[32];
> >>> +};
> >>> +
> >>> +struct amd_energy_sensors {
> >>> +     struct sensor_data *data;
> >>> +     struct attribute **attrs;
> >>> +     struct attribute_group group;
> >>> +     const struct attribute_group *groups[1];
> >>
> >> Even if acceptable, this would be wrong. The list of groups
> >> ends with an empty entry, meaning this array would have to have
> >> at least two entries (one for the terminator).
> >>
> >>> +};
> >>> +
> >>> +static ssize_t amd_units_u64_show(struct device *dev,
> >>> +     struct device_attribute *dev_attr, char *buffer)
> >>> +{
> >>> +     uint64_t rapl_units;
> >>> +     uint64_t energy_unit;
> >>> +     int ret = 0;
> >>> +
> >>> +     ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> >>> +     if (ret)
> >>> +             return -EAGAIN;
> >>> +
> >>> +     energy_unit = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> >>> +
> >>> +     return snprintf(buffer, 24, "%llu\n", energy_unit);
> >>> +}
> >>> +
> >>> +static ssize_t amd_core_u64_show(struct device *dev,
> >>> +             struct device_attribute *dev_attr, char *buffer)
> >>> +{
> >>> +     unsigned long long value;
> >>> +     struct sensor_data *sensor;
> >>> +     int ret = 0;
> >>> +
> >>> +     sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> >>> +     ret = rdmsrl_safe_on_cpu(sensor->cpu_nr, ENERGY_CORE_MSR, &value);
> >>> +     if (ret)
> >>> +             return -EAGAIN;
> >>> +
> >>> +     return snprintf(buffer, 24, "%llu\n", value);
> >>
> >> It seems to me this reports raw values. This is unacceptable. Values need
> >> to be scaled to match the ABI. Energy is reported in microJoule.
> >>
> >>> +}
> >>> +
> >>> +static ssize_t amd_sock_u64_show(struct device *dev,
> >>> +             struct device_attribute *dev_attr, char *buffer)
> >>> +{
> >>> +     unsigned long long value;
> >>> +     struct sensor_data *sensor;
> >>> +     int ret = 0;
> >>> +     int cpu, cpu_nr;
> >>> +
> >>> +     sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> >>> +
> >>> +     for_each_possible_cpu(cpu) {
> >>> +             struct cpuinfo_x86 *c = &cpu_data(cpu);
> >>> +
> >>> +             if (c->initialized && c->logical_die_id == sensor->sock_nr) {
> >>> +                     cpu_nr = cpu;
> >>> +                     break;
> >>> +             }
> >>> +             cpu_nr = 0;
> >>> +     }
> >>> +
> >>> +     ret = rdmsrl_safe_on_cpu(cpu_nr, ENERGY_PCK_MSR, &value);
> >>> +     if (ret)
> >>> +             return -EAGAIN;
> >>> +
> >>> +     return snprintf(buffer, 24, "%llu\n", value);
> >>> +}
> >>> +
> >>> +static int amd_energy_probe(struct platform_device *pdev)
> >>> +{
> >>> +     struct amd_energy_sensors *amd_sensors;
> >>> +     struct device *hwdev, *dev = &pdev->dev;
> >>> +     int nr_cpus, nr_socks, idx = 0;
> >>> +
> >>> +     nr_cpus = num_present_cpus();
> >>> +     nr_socks = topology_max_packages();
> >>> +
> >>> +     amd_sensors = devm_kzalloc(dev, sizeof(*amd_sensors), GFP_KERNEL);
> >>> +     if (!amd_sensors)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     amd_sensors->data = devm_kcalloc(dev, nr_cpus + nr_socks,
> >>> +                             sizeof(*amd_sensors->data), GFP_KERNEL);
> >>> +     if (!amd_sensors->data)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     amd_sensors->attrs = devm_kcalloc(dev, nr_cpus + nr_socks,
> >>> +                             sizeof(*amd_sensors->attrs), GFP_KERNEL);
> >>> +     if (!amd_sensors->attrs)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     /* populate attributes for number of cpus. */
> >>> +     for (idx = 0; idx < ; idx++) {
> >>> +             struct sensor_data *sensor = &amd_sensors->data[idx];
> >>> +
> >>> +             snprintf(sensor->input, sizeof(sensor->input),
> >>> +                             "core_energy%d_input", idx);
> >>> +
> >>
> >> This is unacceptable. Please use standard attributes (energyX_input).
> >> If you want to report what the sensor is for, use labels.
> >>
> >>> +             sensor->dev_attr_input.attr.mode = 0444;
> >>> +             sensor->dev_attr_input.attr.name = sensor->input;
> >>> +             sensor->dev_attr_input.show = amd_core_u64_show;
> >>> +
> >>> +             sensor->cpu_nr = idx;
> >>> +             amd_sensors->attrs[idx] = &sensor->dev_attr_input.attr;
> >>> +
> >>> +             sysfs_attr_init(amd_sensors->attrs[idx]);
> >>> +     }
> >>> +
> >>> +     /* populate attributes for number of sockets. */
> >>> +     for (idx = 0; idx < nr_socks; idx++) {
> >>> +             struct sensor_data *sensor =
> >>> +                     &amd_sensors->data[nr_cpus + idx];
> >>> +
> >>> +             snprintf(sensor->input,
> >>> +                     sizeof(sensor->input), "sock_energy%d_input", idx);
> >>> +
> >>> +             sensor->dev_attr_input.attr.mode = 0444;
> >>> +             sensor->dev_attr_input.attr.name = sensor->input;
> >>> +             sensor->dev_attr_input.show = amd_sock_u64_show;
> >>> +
> >>> +             sensor->sock_nr = idx;
> >>> +             amd_sensors->attrs[nr_cpus + idx] =
> >>> +                     &sensor->dev_attr_input.attr;
> >>> +
> >>> +             sysfs_attr_init(amd_sensors->attrs[nr_cpus + idx]);
> >>> +     }
> >>
> >> This all makes me wonder what is reported for inactive/disabled CPUs.
> >>
> >>> +
> >>> +     amd_sensors->group.attrs = amd_sensors->attrs;
> >>> +     amd_sensors->groups[0] = &amd_sensors->group;
> >>> +
> >>> +     platform_set_drvdata(pdev, amd_sensors);
> >>> +
> >>> +     hwdev = devm_hwmon_device_register_with_groups(dev,
> >>> +                     "amd_energy", amd_sensors, amd_sensors->groups);
> >>
> >> Please rework the driver to use the devm_hwmon_device_register_with_info() API.
> > Our current, platform has 64 cores per socket and 2 such sockets on a
> > board. There is a core energy counter register for each core and
> > Package counter for each socket.  The topology varies from platform to
> > platform.
> >
> >
> > To keep this driver reusable for all platforms. I think, we need to
> > define the hwmon_chip_info and channel_info structures dynamically
> > (hwmon_chip_info has const variables). Is there a way to define a
> > pre-processor statement which can create an array for a given
> > platform.
> >
> > Could you suggest me a way to defining these hwmon_chip_info and
> > channel array dynamically ?  This reason a reason for me to use groups
> > instead of the chip_info.
>
> The approach used by the tmp421 driver should work. 'const'
> doesn't apply to the pointers, but to the data they contain.
> But that doesn't mean the data itself has to be const. You
> can still assign the pointers dynamically. The  habanalabs
> driver does it fully dynamically (I did not review that code,
> so it may be a bit messy).
Thank you very much for the pointer. I will go through the code.
>
> Guenter



-- 
Shine bright,
(: Nav :)
