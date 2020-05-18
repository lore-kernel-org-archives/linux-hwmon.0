Return-Path: <SRS0=DF44=7A=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329D2C433E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 May 2020 19:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0345520643
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 May 2020 19:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMGpLQyP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgERTgB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 May 2020 15:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgERTgB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 May 2020 15:36:01 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DB1C061A0C
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2020 12:36:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id o14so11176294ljp.4
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2020 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=83H8phKeM8pqpDP5+rKP7GrwnQiq+NOEGwfPn12NEuo=;
        b=HMGpLQyPg3sYRGsMBUJLI/go6TVZpTFjC3tJ5bpPNs15wdtK/jDuE/qk8ieeaVz0UV
         lIyYygB/l6SuQVnO9+beFJJVrSfLUSMgD06IY5+Qw9jfcvyvL3uS/zVE6wfmjoBAGqNi
         fu+nO3oHBUh4Uiatnbhv2d6Q5mo3ZrPI/YmyJjni3vmPnNk3oy7oMhLzHYCn4FMO4cg0
         N0+qMRj1t3H1q9niCEjhLpGulOL3EleKBiEFZPAYsvutBqN9lIFMCx73Fk6sqyFRhc3D
         n1OfOHKVSiVSXZGw3sO4gi+CXWwF56b392JactoMUseL+6DldxktgqzXBY2V+N4DSKE2
         5uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=83H8phKeM8pqpDP5+rKP7GrwnQiq+NOEGwfPn12NEuo=;
        b=QJHlO+apvTd8xN0tIHTjYdjTz2Wg1uLO1ZcQuYn9qEToMGSuqgwqXvSPR4WDEQ73JW
         gb4OR626jR/QudCiM7Xlp8bw359bGXHylBz5qreXyagnOfctXzlXScrC60dNUFS3URR1
         iKXdisEw19UW4ESnwPU0u1KLSTD6JTyRogWb4r4xq0Z8C4m6vGL1rl6HlIE2atjWV5m8
         W/qFlMWQe6XIriE4AfHY9qW6G4Bdlf3H3qH3owDX5O1eduCDWj5MauweRx699XE8ouzI
         lTa0mCJcPU+WTPVlOEICHSx8VtOCfS6jDNKWg0UDvtivzWOH+oZ+loipu4HrKp1mEZFb
         VoIQ==
X-Gm-Message-State: AOAM531R+NdeDoOWe3AwXmqj8lv8Am/NkTeA2yyxIV37lGmxyUTRYijM
        IJCSVzuuo1vEMO5353y6uhYd7qQKbDt+vD00wjI=
X-Google-Smtp-Source: ABdhPJzjh+1sPQbGXwb6toZIzZJWbbLr9UJ7Oti2OCbc6QO3ifjN49DY3xgwAOe2McQY2jgBMXWwW2CZNTXrgZ2/M1U=
X-Received: by 2002:a2e:7619:: with SMTP id r25mr2674219ljc.42.1589830559018;
 Mon, 18 May 2020 12:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200515185234.30687-1-nchatrad@amd.com> <20200515191555.GA200810@roeck-us.net>
In-Reply-To: <20200515191555.GA200810@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Tue, 19 May 2020 01:05:46 +0530
Message-ID: <CAHfPSqBw6Mu4Ft61o1LezQMxQRdqSWnWg1dw4De=2jLUWfUy5g@mail.gmail.com>
Subject: Re: [PATCH 1/3 v6] hwmon: Add amd_energy driver to report energy counters
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

Thank you for the comments, i will address them and resubmit.

On Sat, 16 May 2020 at 00:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, May 16, 2020 at 12:22:32AM +0530, Naveen Krishna Chatradhi wrote:
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
> > Changes in v6:
> > 1. Implement core accumulation
> > 2. Remove enumurating sibling threads
> > 3. Fix bug in accumulation
> > 4. Few other minor comments addressed
> >
> >  drivers/hwmon/Kconfig      |  10 +
> >  drivers/hwmon/Makefile     |   1 +
> >  drivers/hwmon/amd_energy.c | 413 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 424 insertions(+)
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
> > index 000000000000..f2cd5e2e1339
> > --- /dev/null
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -0,0 +1,413 @@
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
> > +struct amd_energy_data {
> > +     struct hwmon_channel_info energy_info;
> > +     const struct hwmon_channel_info *info[2];
> > +     struct hwmon_chip_info chip;
> > +     /* Lock around the accumulator */
> > +     struct mutex lock;
> > +     /* Energy Status Units */
> > +     u64 energy_units;
> > +     /* An accumulator for each socket */
> > +     u64 *sock_energy_ctrs;
> > +     u64 *core_energy_ctrs;
> > +     u64 *sock_prev_value;
> > +     u64 *core_prev_value;
> > +};
> > +
> > +static struct task_struct *wrap_accumulate;
> > +static int nr_cpus, nr_socks;
>
> I don't think any of the above need to be static variables
> and could be added to struct amd_energy_data.
Sure

>
> > +static char buf[10];
> > +
> > +static int amd_energy_read_labels(struct device *dev,
> > +                               enum hwmon_sensor_types type,
> > +                               u32 attr, int channel,
> > +                               const char **str)
> > +{
> > +     if (channel >=3D nr_cpus)
> > +             scnprintf(buf, 10, "Esocket%u", channel - nr_cpus);
> > +     else
> > +             scnprintf(buf, 10, "Ecore%03u", channel);
> > +
>
> That won't work. It assumes that the calling function is adding protectio=
n
> against overwriting buf. If you run multiple threads in parallel which al=
l
> access different labels, you'll get more or less random data returned.
> Worse, a thread may be busy writing into buf while another thread is
> reading from it, enabling responses such as, say, "Esocke05". The only
> solution I can imagine is a data structure referenced from truct
> md_energy_data which points to a set of pre-allocated strings.
Yes, i should have addressed this before sending.

>
> > +     *str =3D buf;
> > +
> > +     return 0;
> > +}
> > +
> > +static int get_energy_units(struct amd_energy_data *data)
> > +{
> > +     u64 rapl_units;
> > +     int ret;
> > +
> > +     ret =3D rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> > +     if (ret)
> > +             return ret;
> > +
> > +     data->energy_units =3D (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> > +     return 0;
> > +}
> > +
> > +static void amd_accumulate_delta(struct amd_energy_data *data,
> > +                              u64 input, int cu, bool is_core)
> > +{
> > +     input &=3D AMD_ENERGY_MASK;
> > +
> > +     mutex_lock(&data->lock);
> > +     if (!is_core) {
> > +             if (input >=3D data->sock_prev_value[cu])
> > +                     data->sock_energy_ctrs[cu] +=3D
> > +                             input - data->sock_prev_value[cu];
> > +             else
> > +                     data->sock_energy_ctrs[cu] +=3D UINT_MAX -
> > +                             data->sock_prev_value[cu] + input;
> > +
> > +             data->sock_prev_value[cu] =3D input;
> > +     } else {
> > +             if (input >=3D data->core_prev_value[cu])
> > +                     data->core_energy_ctrs[cu] +=3D
> > +                             input - data->core_prev_value[cu];
> > +             else
> > +                     data->core_energy_ctrs[cu] +=3D UINT_MAX -
> > +                             data->core_prev_value[cu] + input;
> > +
> > +             data->core_prev_value[cu] =3D input;
> > +     }
> > +     mutex_unlock(&data->lock);
> > +}
> > +
> > +static int read_accumulate(struct amd_energy_data *data)
> > +{
> > +     int ret, cu;
> > +     u64 input =3D 0, core_input =3D 0;
> > +     static int core_id;
>
> Any chance you can store core_id in struct amd_energy_data ?
Sure. Will do.
>
> > +
> > +     for (cu =3D 0; cu < nr_socks; cu++) {
> > +             int cpu;
> > +
> > +             cpu =3D cpumask_first_and(cpu_online_mask,
> > +                                     cpumask_of_node(cu));
> > +
> > +             ret =3D rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> > +             if (ret)
> > +                     return ret;
>
> Returning an error from this function is pretty pointless.
Got it.
>
> > +
> > +             amd_accumulate_delta(data, input, cu, false);
> > +     }
> > +
> > +     if (core_id >=3D nr_cpus)
> > +             core_id =3D 0;
> > +
> > +     if (!cpu_online(core_id)) {
> > +             ret =3D -ENODEV;
> > +             goto out;
> > +     }
> > +
> > +     ret =3D rdmsrl_safe_on_cpu(core_id, ENERGY_CORE_MSR, &core_input)=
;
> > +     if (ret)
> > +             goto out;
> > +
> > +     amd_accumulate_delta(data, core_input, core_id, true);
> > +
> > +out:
> > +     core_id++;
> > +     return ret;
> > +}
> > +
> > +static void amd_add_delta(struct amd_energy_data *data,
> > +                       u64 *input, int ch, bool is_core)
> > +{
> > +     mutex_lock(&data->lock);
> > +     if (!is_core) {
> > +             if (*input >=3D data->sock_prev_value[ch])
> > +                     *input +=3D data->sock_energy_ctrs[ch] -
> > +                               data->sock_prev_value[ch];
> > +             else
> > +                     *input +=3D UINT_MAX - data->sock_prev_value[ch] =
+
> > +                               data->sock_energy_ctrs[ch];
> > +     } else {
> > +             if (*input >=3D data->core_prev_value[ch])
> > +                     *input +=3D data->core_energy_ctrs[ch] -
> > +                              data->core_prev_value[ch];
> > +             else
> > +                     *input +=3D UINT_MAX - data->core_prev_value[ch] =
+
> > +                              data->core_energy_ctrs[ch];
> > +     }
> > +     mutex_unlock(&data->lock);
> > +}
> > +
> > +static int amd_energy_read(struct device *dev,
> > +                        enum hwmon_sensor_types type,
> > +                        u32 attr, int channel, long *val)
> > +{
> > +     struct amd_energy_data *data =3D dev_get_drvdata(dev);
> > +     int ret, cpu;
> > +     u64 input;
> > +     bool is_core;
> > +
> > +     if (channel >=3D nr_cpus) {
> > +             is_core =3D false;
> > +             channel =3D channel - nr_cpus;
> > +             cpu =3D cpumask_first_and(cpu_online_mask,
> > +                                     cpumask_of_node
> > +                                     (channel));
> > +             ret =3D rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> > +             if (ret)
> > +                     return -EAGAIN;
>
> From my experience, and looking into other code, such errors tend to be
> permanent. I see two issues with this code: One, static analyzers will
> likely complain that error codes are overwritten, and hard errors will
> result in endless retry loops.
Will remove these EAGAINs

>
> > +     } else {
> > +             is_core =3D true;
> > +             cpu =3D channel;
> > +             if (!cpu_online(cpu))
> > +                     return -ENODEV;
> > +
> > +             ret =3D rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> > +             if (ret)
> > +                     return -EAGAIN;
> > +     }
> > +
> > +     input &=3D AMD_ENERGY_MASK;
> > +     amd_add_delta(data, &input, channel, is_core);
> > +
> I am a bit concerned that input is read first and passed to amd_add_delta=
()
> unlocked. That means process 1 can read it, followed by process 2. If
> process 2 gets the mutex in amd_add_delta() first, it will add a larger
> value, followed by the older value from process 1. It would be much safer
> to protect the entire read-update code with the mutex.
Got it, will address.

>
> > +     if (data->energy_units =3D=3D 0 && get_energy_units(data))
> > +             return -EAGAIN;
> > +
> > +     /* Energy consumed =3D (1/(2^ESU) * RAW * 1000000UL) =CE=BCJoules=
 */
> > +     *val =3D (long)div64_ul(input * 1000000UL,
> > +                                   BIT(data->energy_units));
>
> Alignment seems to be off here. Please run checkpatch --strict.
> Also, is the typecast really needed ?
>
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
> > +     int i, num_siblings;
> > +     u32 *s_config;
> > +     struct hwmon_channel_info *info =3D &data->energy_info;
> > +
> > +     /* Identify the number of siblings per core */
> > +     num_siblings =3D ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
> > +
> > +     nr_socks =3D num_possible_nodes();
> > +
> > +     /*
> > +      * Energy counter register is accessed at core level.
> > +      * Hence, filterout the siblings.
> > +      */
> > +     nr_cpus =3D num_present_cpus()/num_siblings;
> > +
> > +     s_config =3D devm_kcalloc(dev, nr_cpus + nr_socks,
> > +                             sizeof(u32), GFP_KERNEL);
> > +     if (!s_config)
> > +             return -ENOMEM;
> > +
> > +     data->sock_energy_ctrs =3D devm_kcalloc(dev, nr_socks,
> > +                             sizeof(u64), GFP_KERNEL);
> > +     if (!data->sock_energy_ctrs)
> > +             return -ENOMEM;
> > +
> > +     data->core_energy_ctrs =3D devm_kcalloc(dev, nr_cpus,
> > +                             sizeof(u64), GFP_KERNEL);
> > +     if (!data->core_energy_ctrs)
> > +             return -ENOMEM;
> > +
> > +     data->sock_prev_value =3D devm_kcalloc(dev, nr_socks,
> > +                             sizeof(u64), GFP_KERNEL);
> > +     if (!data->sock_prev_value)
> > +             return -ENOMEM;
> > +
> > +     data->core_prev_value =3D devm_kcalloc(dev, nr_cpus,
> > +                             sizeof(u64), GFP_KERNEL);
> > +     if (!data->core_prev_value)
> > +             return -ENOMEM;
> > +
> > +     info->type =3D type;
> > +     info->config =3D s_config;
> > +
> > +     for (i =3D 0; i < nr_cpus + nr_socks; i++)
> > +             s_config[i] =3D config;
> > +
> > +     return 0;
> > +}
> > +
> > +static int amd_energy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *hwmon_dev;
> > +     struct amd_energy_data *data;
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(dev,
> > +                         sizeof(struct amd_energy_data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->chip.ops =3D &amd_energy_ops;
> > +     data->chip.info =3D data->info;
> > +
> > +     /* Populate per-core energy reporting */
> > +     data->info[0] =3D &data->energy_info;
> > +     amd_create_sensor(dev, data,  hwmon_energy,
> > +                       HWMON_E_INPUT | HWMON_E_LABEL);
> > +
> > +     mutex_init(&data->lock);
> > +
> > +     ret =3D get_energy_units(data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev, DRVNAME,
> > +                                                      data,
> > +                                                      &data->chip,
> > +                                                      NULL);
> > +     if (IS_ERR(hwmon_dev))
> > +             return PTR_ERR(hwmon_dev);
> > +
> > +     wrap_accumulate =3D kthread_run(energy_accumulator, data,
> > +                                   "%s", dev_name(hwmon_dev));
> > +     if (IS_ERR(wrap_accumulate))
> > +             return PTR_ERR(wrap_accumulate);
> > +
> > +     return PTR_ERR_OR_ZERO(wrap_accumulate);
> > +}
> > +
> > +static int amd_energy_remove(struct platform_device *pdev)
> > +{
> > +     if (wrap_accumulate)
> > +             kthread_stop(wrap_accumulate);
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
> > --
> > 2.17.1
> >



--=20
Shine bright,
(: Nav :)
