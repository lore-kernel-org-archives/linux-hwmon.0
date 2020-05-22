Return-Path: <SRS0=gljW=7E=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE56C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 May 2020 14:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F120022211
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 May 2020 14:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpobfU03"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbgEVOTd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 May 2020 10:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729771AbgEVOTd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 May 2020 10:19:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7142C061A0E
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2020 07:19:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v16so12852324ljc.8
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2020 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g5z9jufuTcgKrEm+cf8w2rUyOIcfjG4xWDBCTOf7DzU=;
        b=WpobfU03pZgU26Eopb0zzQhkrvVhQ+kbsN2zG6q+WX3XqqyQOU2+BSVUfPeye12UHH
         Blqt/Zh0hmxRCenUfEszZRj4yJy3AbnoYF8lkqe3zt/VS62Zt5k5M6DmPN8z+0f0LdEK
         ky3VbM7nV0kGklMMwELlJwm7DmvgHTG9xeSZ29AeoTI/3gHhyFAZ1/gGneel8T7H4YEp
         xAJnw4vTknFAmojdObnVxJ/hNSvPqpp/3RXJwUMt6dxAT81H4tuBwXUvHhZ0vBSHXIOR
         skH83g4xC8VHQTgWW7tK6r9kx8KvV+PgmWMiR02Xy078S6f5v1SY5Jfwis2VflUJOSFQ
         dNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g5z9jufuTcgKrEm+cf8w2rUyOIcfjG4xWDBCTOf7DzU=;
        b=kA6Zv4BoU/6eZoHHtzrbxElM6i4cJW1TqukGXo0wjUZ1/2vsml5W4z1x7AGgywZ3q6
         51vRXrGThf/NN61JuXsYME/cqiywdtfiOPG9v3EM+iqBZT8PFF+JOWEPmpApcp6yK38A
         y2gSOn4QlHn2w/tpWR2jKOEON2C2DxHhxzh0QVNrf2JnVZqKjNTeGQ6IpW05sfRymbZB
         /tvv7bFP9ZuBo+1o92t+BofYdpdfOMkYsCcakvEIaKeNIe7gf/bNkLsNGlTnIG7GKf3X
         i9oJuka3QgpLWM6aAV64n3uBkdcp00Nf5yw1twj5NuCNqqUHUT2FnUl1RNbBi1OwktN3
         QnEQ==
X-Gm-Message-State: AOAM530iatezoVWY66FSLeKfS+tigplif2ScJ/gmVV9qcS6xUxFybRwc
        jHhRGPnwHiJZrTqq3JiaD0kQQcX96VEX+iS3NNg=
X-Google-Smtp-Source: ABdhPJwubEHbybDQ8lriwy+gLr54D5AqlEzAsj6Xdr1yAFJa5cuJYmHDfv27olROoTJ/DNV73LBC6AhwrH74iHhr9A8=
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr7252508lji.210.1590157171035;
 Fri, 22 May 2020 07:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
In-Reply-To: <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Fri, 22 May 2020 19:49:19 +0530
Message-ID: <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Fri, 22 May 2020 at 18:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 5/19/20 8:50 AM, Naveen Krishna Chatradhi wrote:
> > This patch adds hwmon based amd_energy driver support for
> > family 17h processors from AMD.
> >
> > The driver provides following interface to the userspace
> > 1. Reports the per core consumption
> >       * file: "energy%d_input", label: "Ecore%03d"
> > 2. Reports per socket energy consumption
> >       * file: "energy%d_input", label: "Esocket%d"
> > 3. To, increase the wrap around time of the socket energy
> >    counters, a 64bit accumultor is implemented.
> > 4. Reports scaled energy value in Joules.
> >
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > ---
>
> This version looks ok, and it looks like there are no more
> unexpected counter wraps either. Series applied to hwmon-next.

Thank you for your guidance and support.

>
> Thanks,
> Guenter
>
> > Changes in v7:
> > 1. Move all static variables into the data structure
> > 2. Move the read-update code under the mutex lock
> >
> >  drivers/hwmon/Kconfig      |  10 +
> >  drivers/hwmon/Makefile     |   1 +
> >  drivers/hwmon/amd_energy.c | 406 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 417 insertions(+)
> >  create mode 100644 drivers/hwmon/amd_energy.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 4c62f900bf7e..e165e10c49ef 100644
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
> >       tristate "Apple SMC (Motion sensor, light sensor, keyboard backli=
ght)"
> >       depends on INPUT && X86
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index b0b9c8e57176..318f89dc7133 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)       +=3D adt7411.o
> >  obj-$(CONFIG_SENSORS_ADT7462)        +=3D adt7462.o
> >  obj-$(CONFIG_SENSORS_ADT7470)        +=3D adt7470.o
> >  obj-$(CONFIG_SENSORS_ADT7475)        +=3D adt7475.o
> > +obj-$(CONFIG_SENSORS_AMD_ENERGY) +=3D amd_energy.o
> >  obj-$(CONFIG_SENSORS_APPLESMC)       +=3D applesmc.o
> >  obj-$(CONFIG_SENSORS_ARM_SCMI)       +=3D scmi-hwmon.o
> >  obj-$(CONFIG_SENSORS_ARM_SCPI)       +=3D scpi-hwmon.o
> > diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > new file mode 100644
> > index 000000000000..bc8b643a37d5
> > --- /dev/null
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -0,0 +1,406 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/*
> > + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> > + */
> > +#include <asm/cpu_device_id.h>
> > +
> > +#include <linux/bits.h>
> > +#include <linux/cpu.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kthread.h>
> > +#include <linux/list.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/processor.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/sched.h>
> > +#include <linux/slab.h>
> > +#include <linux/topology.h>
> > +#include <linux/types.h>
> > +
> > +#define DRVNAME                      "amd_energy"
> > +
> > +#define ENERGY_PWR_UNIT_MSR  0xC0010299
> > +#define ENERGY_CORE_MSR              0xC001029A
> > +#define ENERGY_PKG_MSR               0xC001029B
> > +
> > +#define AMD_ENERGY_UNIT_MASK 0x01F00
> > +#define AMD_ENERGY_MASK              0xFFFFFFFF
> > +
> > +struct sensor_accumulator {
> > +     u64 energy_ctr;
> > +     u64 prev_value;
> > +     char label[10];
> > +};
> > +
> > +struct amd_energy_data {
> > +     struct hwmon_channel_info energy_info;
> > +     const struct hwmon_channel_info *info[2];
> > +     struct hwmon_chip_info chip;
> > +     struct task_struct *wrap_accumulate;
> > +     /* Lock around the accumulator */
> > +     struct mutex lock;
> > +     /* An accumulator for each core and socket */
> > +     struct sensor_accumulator *accums;
> > +     /* Energy Status Units */
> > +     u64 energy_units;
> > +     int nr_cpus;
> > +     int nr_socks;
> > +     int core_id;
> > +};
> > +
> > +static int amd_energy_read_labels(struct device *dev,
> > +                               enum hwmon_sensor_types type,
> > +                               u32 attr, int channel,
> > +                               const char **str)
> > +{
> > +     struct amd_energy_data *data =3D dev_get_drvdata(dev);
> > +
> > +     *str =3D data->accums[channel].label;
> > +     return 0;
> > +}
> > +
> > +static void get_energy_units(struct amd_energy_data *data)
> > +{
> > +     u64 rapl_units;
> > +
> > +     rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> > +     data->energy_units =3D (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> > +}
> > +
> > +static void accumulate_socket_delta(struct amd_energy_data *data,
> > +                                 int sock, int cpu)
> > +{
> > +     struct sensor_accumulator *s_accum;
> > +     u64 input;
> > +
> > +     mutex_lock(&data->lock);
> > +     rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> > +     input &=3D AMD_ENERGY_MASK;
> > +
> > +     s_accum =3D &data->accums[data->nr_cpus + sock];
> > +     if (input >=3D s_accum->prev_value)
> > +             s_accum->energy_ctr +=3D
> > +                     input - s_accum->prev_value;
> > +     else
> > +             s_accum->energy_ctr +=3D UINT_MAX -
> > +                     s_accum->prev_value + input;
> > +
> > +     s_accum->prev_value =3D input;
> > +     mutex_unlock(&data->lock);
> > +}
> > +
> > +static void accumulate_core_delta(struct amd_energy_data *data)
> > +{
> > +     struct sensor_accumulator *c_accum;
> > +     u64 input;
> > +     int cpu;
> > +
> > +     mutex_lock(&data->lock);
> > +     if (data->core_id >=3D data->nr_cpus)
> > +             data->core_id =3D 0;
> > +
> > +     cpu =3D data->core_id;
> > +
> > +     if (!cpu_online(cpu))
> > +             goto out;
> > +
> > +     rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> > +     input &=3D AMD_ENERGY_MASK;
> > +
> > +     c_accum =3D &data->accums[cpu];
> > +
> > +     if (input >=3D c_accum->prev_value)
> > +             c_accum->energy_ctr +=3D
> > +                     input - c_accum->prev_value;
> > +     else
> > +             c_accum->energy_ctr +=3D UINT_MAX -
> > +                     c_accum->prev_value + input;
> > +
> > +     c_accum->prev_value =3D input;
> > +
> > +out:
> > +     data->core_id++;
> > +     mutex_unlock(&data->lock);
> > +}
> > +
> > +static void read_accumulate(struct amd_energy_data *data)
> > +{
> > +     int sock;
> > +
> > +     for (sock =3D 0; sock < data->nr_socks; sock++) {
> > +             int cpu;
> > +
> > +             cpu =3D cpumask_first_and(cpu_online_mask,
> > +                                     cpumask_of_node(sock));
> > +
> > +             accumulate_socket_delta(data, sock, cpu);
> > +     }
> > +
> > +     accumulate_core_delta(data);
> > +}
> > +
> > +static void amd_add_delta(struct amd_energy_data *data, int ch,
> > +                       int cpu, long *val, bool is_core)
> > +{
> > +     struct sensor_accumulator *s_accum, *c_accum;
> > +     u64 input;
> > +
> > +     mutex_lock(&data->lock);
> > +     if (!is_core) {
> > +             rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> > +             input &=3D AMD_ENERGY_MASK;
> > +
> > +             s_accum =3D &data->accums[ch];
> > +             if (input >=3D s_accum->prev_value)
> > +                     input +=3D s_accum->energy_ctr -
> > +                               s_accum->prev_value;
> > +             else
> > +                     input +=3D UINT_MAX - s_accum->prev_value +
> > +                               s_accum->energy_ctr;
> > +     } else {
> > +             rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> > +             input &=3D AMD_ENERGY_MASK;
> > +
> > +             c_accum =3D &data->accums[ch];
> > +             if (input >=3D c_accum->prev_value)
> > +                     input +=3D c_accum->energy_ctr -
> > +                              c_accum->prev_value;
> > +             else
> > +                     input +=3D UINT_MAX - c_accum->prev_value +
> > +                              c_accum->energy_ctr;
> > +     }
> > +
> > +     /* Energy consumed =3D (1/(2^ESU) * RAW * 1000000UL) =CE=BCJoules=
 */
> > +     *val =3D div64_ul(input * 1000000UL, BIT(data->energy_units));
> > +
> > +     mutex_unlock(&data->lock);
> > +}
> > +
> > +static int amd_energy_read(struct device *dev,
> > +                        enum hwmon_sensor_types type,
> > +                        u32 attr, int channel, long *val)
> > +{
> > +     struct amd_energy_data *data =3D dev_get_drvdata(dev);
> > +     int cpu;
> > +
> > +     if (channel >=3D data->nr_cpus) {
> > +             cpu =3D cpumask_first_and(cpu_online_mask,
> > +                                     cpumask_of_node
> > +                                     (channel - data->nr_cpus));
> > +             amd_add_delta(data, channel, cpu, val, false);
> > +     } else {
> > +             cpu =3D channel;
> > +             if (!cpu_online(cpu))
> > +                     return -ENODEV;
> > +
> > +             amd_add_delta(data, channel, cpu, val, true);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static umode_t amd_energy_is_visible(const void *_data,
> > +                                  enum hwmon_sensor_types type,
> > +                                  u32 attr, int channel)
> > +{
> > +     return 0444;
> > +}
> > +
> > +static int energy_accumulator(void *p)
> > +{
> > +     struct amd_energy_data *data =3D (struct amd_energy_data *)p;
> > +
> > +     while (!kthread_should_stop()) {
> > +             /*
> > +              * Ignoring the conditions such as
> > +              * cpu being offline or rdmsr failure
> > +              */
> > +             read_accumulate(data);
> > +
> > +             set_current_state(TASK_INTERRUPTIBLE);
> > +             if (kthread_should_stop())
> > +                     break;
> > +
> > +             /*
> > +              * On a 240W system, with default resolution the
> > +              * Socket Energy status register may wrap around in
> > +              * 2^32*15.3 e-6/240 =3D 273.8041 secs (~4.5 mins)
> > +              *
> > +              * let us accumulate for every 100secs
> > +              */
> > +             schedule_timeout(msecs_to_jiffies(100000));
> > +     }
> > +     return 0;
> > +}
> > +
> > +static const struct hwmon_ops amd_energy_ops =3D {
> > +     .is_visible =3D amd_energy_is_visible,
> > +     .read =3D amd_energy_read,
> > +     .read_string =3D amd_energy_read_labels,
> > +};
> > +
> > +static int amd_create_sensor(struct device *dev,
> > +                          struct amd_energy_data *data,
> > +                          u8 type, u32 config)
> > +{
> > +     struct hwmon_channel_info *info =3D &data->energy_info;
> > +     struct sensor_accumulator *accums;
> > +     int i, num_siblings, cpus, sockets;
> > +     u32 *s_config;
> > +
> > +     /* Identify the number of siblings per core */
> > +     num_siblings =3D ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
> > +
> > +     sockets =3D num_possible_nodes();
> > +
> > +     /*
> > +      * Energy counter register is accessed at core level.
> > +      * Hence, filterout the siblings.
> > +      */
> > +     cpus =3D num_present_cpus() / num_siblings;
> > +
> > +     s_config =3D devm_kcalloc(dev, cpus + sockets,
> > +                             sizeof(u32), GFP_KERNEL);
> > +     if (!s_config)
> > +             return -ENOMEM;
> > +
> > +     accums =3D devm_kcalloc(dev, cpus + sockets,
> > +                           sizeof(struct sensor_accumulator),
> > +                           GFP_KERNEL);
> > +     if (!accums)
> > +             return -ENOMEM;
> > +
> > +     info->type =3D type;
> > +     info->config =3D s_config;
> > +
> > +     data->nr_cpus =3D cpus;
> > +     data->nr_socks =3D sockets;
> > +     data->accums =3D accums;
> > +
> > +     for (i =3D 0; i < cpus + sockets; i++) {
> > +             s_config[i] =3D config;
> > +             if (i < cpus)
> > +                     scnprintf(accums[i].label, 10,
> > +                               "Ecore%03u", i);
> > +             else
> > +                     scnprintf(accums[i].label, 10,
> > +                               "Esocket%u", (i - cpus));
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int amd_energy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *hwmon_dev;
> > +     struct amd_energy_data *data;
> > +     struct device *dev =3D &pdev->dev;
> > +
> > +     data =3D devm_kzalloc(dev,
> > +                         sizeof(struct amd_energy_data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->chip.ops =3D &amd_energy_ops;
> > +     data->chip.info =3D data->info;
> > +
> > +     dev_set_drvdata(dev, data);
> > +     /* Populate per-core energy reporting */
> > +     data->info[0] =3D &data->energy_info;
> > +     amd_create_sensor(dev, data, hwmon_energy,
> > +                       HWMON_E_INPUT | HWMON_E_LABEL);
> > +
> > +     mutex_init(&data->lock);
> > +     get_energy_units(data);
> > +
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev, DRVNAME,
> > +                                                      data,
> > +                                                      &data->chip,
> > +                                                      NULL);
> > +     if (IS_ERR(hwmon_dev))
> > +             return PTR_ERR(hwmon_dev);
> > +
> > +     data->wrap_accumulate =3D kthread_run(energy_accumulator, data,
> > +                                         "%s", dev_name(hwmon_dev));
> > +     if (IS_ERR(data->wrap_accumulate))
> > +             return PTR_ERR(data->wrap_accumulate);
> > +
> > +     return PTR_ERR_OR_ZERO(data->wrap_accumulate);
> > +}
> > +
> > +static int amd_energy_remove(struct platform_device *pdev)
> > +{
> > +     struct amd_energy_data *data =3D dev_get_drvdata(&pdev->dev);
> > +
> > +     if (data && data->wrap_accumulate)
> > +             kthread_stop(data->wrap_accumulate);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct platform_device_id amd_energy_ids[] =3D {
> > +     { .name =3D DRVNAME, },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(platform, amd_energy_ids);
> > +
> > +static struct platform_driver amd_energy_driver =3D {
> > +     .probe =3D amd_energy_probe,
> > +     .remove =3D amd_energy_remove,
> > +     .id_table =3D amd_energy_ids,
> > +     .driver =3D {
> > +             .name =3D DRVNAME,
> > +     },
> > +};
> > +
> > +static struct platform_device *amd_energy_platdev;
> > +
> > +static const struct x86_cpu_id cpu_ids[] __initconst =3D {
> > +     X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> > +
> > +static int __init amd_energy_init(void)
> > +{
> > +     int ret;
> > +
> > +     if (!x86_match_cpu(cpu_ids))
> > +             return -ENODEV;
> > +
> > +     ret =3D platform_driver_register(&amd_energy_driver);
> > +     if (ret)
> > +             return ret;
> > +
> > +     amd_energy_platdev =3D platform_device_alloc(DRVNAME, 0);
> > +     if (!amd_energy_platdev)
> > +             return -ENOMEM;
> > +
> > +     ret =3D platform_device_add(amd_energy_platdev);
> > +     if (ret) {
> > +             platform_device_put(amd_energy_platdev);
> > +             platform_driver_unregister(&amd_energy_driver);
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
> > +MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via =
HWMON interface");
> > +MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
> > +MODULE_LICENSE("GPL");
> >
>


--=20
Shine bright,
(: Nav :)
