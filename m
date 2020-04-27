Return-Path: <SRS0=1vPy=6L=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60728C54FD0
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Apr 2020 12:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 348E1206BF
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Apr 2020 12:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ8FAsfS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgD0MkG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Apr 2020 08:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726390AbgD0MkG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Apr 2020 08:40:06 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C826EC0610D5
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2020 05:40:05 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t11so13646593lfe.4
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2020 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DWsMOIOw6HlCLC84vlK77/IZK4iuZNkCnTbk0aX5v3M=;
        b=fZ8FAsfSxhKe5tcUKz5ZwDLdBbK8TIBK1U4TaJfe8iVplZIYKsf/4gCB4s5hbQxdrX
         Ly8TP/D+h/x8KZAkPAiXTasLSoTehTrgIU4+p0iea0BMQFjA+HMz4pTAZzwqiWSGoOrS
         05FPxu0vYZ7PJ/VHoa9K2AtsMWFeIcIH2f3M2bqRHjWVpHekOwfh9c7TTaBOZTLibjie
         CoWqmJEfchHivvC0SemGusVcw6DcFzx3BJM+xLjU1J45rXPLyXG4J0GBx4Yf+1Vqhelu
         diMrQT6HFy0okl5tuj9uCR8k9JrFXAJdFf4zq7g4XBCMvandwout+ZSqiZPzo+3ZUKzI
         wDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DWsMOIOw6HlCLC84vlK77/IZK4iuZNkCnTbk0aX5v3M=;
        b=DexJZwDzl6HT7TMR0h5dlEampiUuTlykxF6eGwWcDVtVQ1lL5xtdWArSTJeCJhy5k3
         Ttq5Dc2r1nZfKisgcCeqh8QQlDZEt6Nccto1aPbJpveyKqa0U9dEpzrSL1jOn32KtDa1
         TTYrAFsREqzxGJOf6e5MbLewOyWPPY6orMT3NbP44nFM7ckqom/5gkU2ll0LyNbvLMx0
         9uvRULYHjIKguxmapGMlozG9Awt+pySxUF35jrQxFrJmbdB0xbrN72Y2/lGiMYAmwLKc
         3sABAtGIq+wrnSxlUzeugo6VHJf+LvsUMAunpkn1oQvtUz8WgBBdkJXZTQFh+zVe3axS
         VRIA==
X-Gm-Message-State: AGi0PubZIt+VAd90ywNcCCE9JMyXL0VHmTfPafTtfH3pbGiEHNVn59N7
        em3tRH1dMkEJ+BEboxLDM3yxTiMaPPQLbnixtTbis9Rx
X-Google-Smtp-Source: APiQypJs0K2dyLrfKNUfwc/9NwBGRWi5szH9r5bkTb08ur6q9TMeQjB9nPkdYiMbnN0VMzH5rh3VcUu6wibJkTJygBo=
X-Received: by 2002:a05:6512:308c:: with SMTP id z12mr15240587lfd.195.1587991203945;
 Mon, 27 Apr 2020 05:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200425161750.GA67085@roeck-us.net>
In-Reply-To: <20200425161750.GA67085@roeck-us.net>
From:   Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Date:   Mon, 27 Apr 2020 18:09:51 +0530
Message-ID: <CAHfPSqAj+Ga8u-bL3TrhWJAmMpJ4y4C9t627j3er=UoV9LfGHQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] hwmon: Add amd_energy driver to report energy counters
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

On Sat, 25 Apr 2020 at 21:47, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Apr 24, 2020 at 08:50:54AM +0530, Naveen Krishna Chatradhi wrote:
> > This patch adds hwmon based amd_energy driver support for
> > family 17h processors from AMD.
> >
> > The driver provides following interface to the userspace
> > 1. Reports the per core consumption
> >       * file: "energy%d_input", label: "Ecore%03d"
> > 2. Reports per socket energy consumption
> >       * file: "energy%d_input", label: "Esocket%d"
> > 2. Reports scaled energy value in Joules.
> >
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>
> Couple of additional comments below.
>
> On a higher level, I noticed that the data overflows quickly
> (ie within a day or so), which is the reason why the matching
> code for Intel CPUs never made it into the kernel. With that
> in mind, I do wonder if this is really valuable. I am quite
> concerned about people complaining that the data is useless,
> and I have to say that I find it quite useless myself. Any
> system running for more than a few hours will report more or
> less random data. Any thoughts on that ?
This driver will also address the future platforms with
support for 64-bit counters.

We do have platforms that will come out very shortly, which will
support a different energy resolution to increase the wraparound
time with 32bit counters,

On a platform with 2 sockets each with 64 cores,
Assuming 240W, new resolution of 15.6 milli Joules

-  Wrap around time for socket energy counter will be
(up to ~3 to 4 days with maximum load).

2^32*15.625e-3/240 =3D 279620.2667 secs to wrap (i.e 3.2 days)

- Wrap around time for the per-core energy counters with the
new resolution will be

2^32*15.6e-3/ (240 * 128) =3D 2184533.33 secs to wrap (i.e 25 days)

When a work load is to be run on certain predefined cores.
The Work load managers can gather the energy status before starting
and after completion of the job and measure power consumed by the
work load.

>
> How about making the power reporting registers available and
> reporting per-CPU power consumption instead ? I think that would
> add much more value.
We will expose power reporting when platform exposes that information.
Until then, energy reporting becomes further critical.

>
> Thanks,
> Guenter
>
> > ---
> > Changes in v4:
> > 1. Use num_present_cpus() instead num_online_cpu(), as the latter does
> >    not take offline cpus into account.
> > 2. run checkpatch.pl --strict and fix alignment issues
> > 3. Fixed other comments from Guenter Roeck
> >
> >  drivers/hwmon/Kconfig      |  10 ++
> >  drivers/hwmon/Makefile     |   1 +
> >  drivers/hwmon/amd_energy.c | 250 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 261 insertions(+)
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
> > index 000000000000..7162c80edd10
> > --- /dev/null
> > +++ b/drivers/hwmon/amd_energy.c
> > @@ -0,0 +1,250 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/*
> > + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> > + */
> > +
> > +#include <asm/cpu_device_id.h>
> > +
> I don't think this is currently used. More on that below, though.
will remove
>
> > +#include <linux/cpu.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/device.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/kernel.h>
> > +#include <linux/list.h>
> > +#include <linux/module.h>
> > +#include <linux/processor.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/sysfs.h>
>
> I don't think this include is needed.
yes

>
> On the other side, using BIT() means that linux/bits.h should be included=
.
sure

>
> > +#include <linux/types.h>
> > +
> > +#define DRVNAME                      "amd_energy"
> > +
> > +#define ENERGY_PWR_UNIT_MSR  0xC0010299
> > +#define ENERGY_CORE_MSR              0xC001029A
> > +#define ENERGY_PKG_MSR               0xC001029B
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
> > +     .vendor         =3D X86_VENDOR_AMD,       \
> > +     .family         =3D _family,              \
> > +     .model          =3D _model,               \
> > +     .feature        =3D X86_FEATURE_ANY,      \
> > +}
> > +
> > +#define AMD_CPU_FAM(_model)                  \
> > +     AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
> > +
>
> Any special reason for not just using the following in cpu_ids[] ?
>         X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL)
no specific reason, will use this.

>
> > +struct amd_energy_data {
> > +     struct hwmon_channel_info energy_info;
> > +     const struct hwmon_channel_info *info[2];
> > +     struct hwmon_chip_info chip;
> > +};
> > +
> > +static int nr_cpus, nr_socks;
> > +static u64 energy_units;
> > +
> > +static int amd_energy_read_labels(struct device *dev,
> > +                               enum hwmon_sensor_types type,
> > +                              u32 attr, int channel,
> > +                              const char **str)
> > +{
> > +     char *buf =3D devm_kcalloc(dev, 10, sizeof(char), GFP_KERNEL);
> > +
> > +     if (channel >=3D nr_cpus)
> > +             scnprintf(buf, 9, "Esocket%u", channel - nr_cpus);
> > +     else
> > +             scnprintf(buf, 9, "Ecore%03u", channel);
> > +
> > +     *str =3D buf;
> > +
> > +     return 0;
> > +}
> > +
> > +static int get_energy_units(void)
> > +{
> > +     u64 rapl_units;
> > +     int ret;
> > +
> > +     ret =3D rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     energy_units =3D (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> > +     return 0;
> > +}
> > +
> > +static int amd_energy_read(struct device *dev,
> > +                        enum hwmon_sensor_types type,
> > +                        u32 attr, int channel, long *val)
> > +{
> > +     u64 value;
> > +     int cpu, ret;
> > +     u32 reg;
> > +
> > +     if (channel >=3D nr_cpus) {
> > +             reg =3D ENERGY_PKG_MSR;
> > +             cpu =3D cpumask_first_and(cpu_online_mask,
> > +                                     cpumask_of_node
> > +                                     (channel - nr_cpus));
> > +     } else {
> > +             reg =3D ENERGY_CORE_MSR;
> > +             cpu =3D channel;
> > +     }
> > +
> > +     if (!cpu_online(cpu))
> > +             return -ENODEV;
> > +
> > +     ret =3D rdmsrl_safe_on_cpu(cpu, reg, &value);
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     if (energy_units =3D=3D 0 && get_energy_units())
> > +             return -EAGAIN;
> > +
> > +     /* Energy consumed =3D (1/(2^ESU) * RAW * 1000000UL) Joules */
> > +     *val =3D (long)value * div64_ul(1000000UL, BIT(energy_units));
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
> > +     int i;
> > +     u32 *s_config;
> > +     struct hwmon_channel_info *info =3D &data->energy_info;
> > +
> > +     nr_socks =3D num_possible_nodes();
> > +     nr_cpus =3D num_present_cpus();
> > +
>
> On Ryzen 3900X, this generates data for 24 CPUs. Are you sure
> that this is correct, ie that the data is available per
> hyperthreading sibling ?
These energy counters are updated per core level, not at thread level.
Correct me if I=E2=80=99m wrong. My understanding is linux enumerates
all thread as a cpus and the internals of rd/wrmsr_on_cpu() functions
would handle the cpu/sibling thread in the x86_64 specific way.

If this understanding is wrong, I will try to use
topology_sibling_cpumask() or similar.


>
> > +     s_config =3D devm_kcalloc(dev, nr_cpus + nr_socks,
> > +                             sizeof(u32), GFP_KERNEL);
> > +     if (!s_config)
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
> > +     ret =3D get_energy_units();
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(struct amd_energy_data), GFP_KE=
RNEL);
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
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev, DRVNAME,
> > +                                                      data,
> > +                                                      &data->chip,
> > +                                                      NULL);
> > +     return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static int amd_energy_remove(struct platform_device *pdev)
> > +{
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
> > +     AMD_CPU_FAM(17),
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
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     amd_energy_platdev =3D platform_device_alloc(DRVNAME, 0);
> > +     if (!amd_energy_platdev)
> > +             return -ENOMEM;
> > +
> > +     ret =3D platform_device_add(amd_energy_platdev);
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
> > +MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via =
HWMON interface");
> > +MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.17.1
> >



--
Shine bright,
(: Nav :)
