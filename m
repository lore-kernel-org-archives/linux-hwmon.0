Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D7EFA3745
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 20:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiJaUxf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 16:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiJaUxe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 16:53:34 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D075AD10E;
        Mon, 31 Oct 2022 13:53:32 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 185so15137509ybc.3;
        Mon, 31 Oct 2022 13:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C83wvq8uM9jROcyl91Ezyvu+M8HiDkKvfktuvACneE=;
        b=SI7rhRNOd58/w2w1RMNIS8ja3rqOR+/9dfx/T/+wxbsUN2rJdE2Jx+NWh4iIk9zfU4
         irN8CcAPgoUDd2fJZCJ3ZTjLY6YOpQRgJIS1WWW6ZIzqn6NEf6ZhonmODACI6cJr+xH8
         3kf7LOD0gGeWWTNuOczxxoOe4AZkdON9gubcQfpNDxLYrNH3G5Q2HvY5DTuBRDWO133t
         5U7jj4UQ9J+XCoZPWngsKZZXuKlkdLKI9BQFBaORToVsCqd7DYkJ5Ggqk4lWqu6/FccC
         35yNad5tUKwAcDB+efsOvCKK0uuuS+yb7aOMAO9Fm/Zl/4qS8wMbtwvTV7/CtzXggUhU
         +E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C83wvq8uM9jROcyl91Ezyvu+M8HiDkKvfktuvACneE=;
        b=Z4STlioIxS6Y35lerCvy4dXuWjsvg9jXiryqXpXUjrNO4Ojq/wJEI8hUCMKfi3ZsrT
         2f9e3W5pmBpG1Pv9Z0LAmz1YePtXDGOgfIJHqqkny9g2d874KPtNDZEIjc/7dLOQE1hr
         v9c4q+/CivhMQuInTjZw7HYsfZcbTNHQZsNQZl5Qzp2Pew0IEI5WS5IRqfKxwaV4VXj0
         ynhSOmTg3qHltiSsnAR0+XJvICNmxjy4Xqs+uW5tGz1wYKVQu7gijI/DaI745Boh9qv9
         vjBHo1rjHYOSmKfylNNAvARn6DQNbzgiZcJgbY/nSUXaJaSe/qXecYyX436bbHz7wxmN
         bwRA==
X-Gm-Message-State: ACrzQf1cn2m7BsHehVcRc76h6BULjchzww4jDq1mkZ0RPcdyreNC6HkU
        FvNZrlaAs7Voj8pllqvlK9pwj74uFMPaEbIUGf0=
X-Google-Smtp-Source: AMsMyM7op7h3DNhPJXT8uaEh7CJeeq05wumwVpoML4BQyCW4KVZg/aFBtR45JBZ5Z5hyVslmNsepCoikCv8k3IQxstA=
X-Received: by 2002:a25:84ce:0:b0:6bc:9053:54d9 with SMTP id
 x14-20020a2584ce000000b006bc905354d9mr5454ybm.196.1667249611908; Mon, 31 Oct
 2022 13:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
 <20221031145308.341776-1-samsagax@gmail.com> <20221031195609.GA2006109@roeck-us.net>
In-Reply-To: <20221031195609.GA2006109@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 31 Oct 2022 17:53:20 -0300
Message-ID: <CABgtM3g-qOB2HZXwRhG7kEhsz0934DZuVC3oKH=qKcqLUw_eMg@mail.gmail.com>
Subject: Re: [PATCH v3] Add OneXPlayer mini AMD sensors driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for your time and review. I'll follow your advice and
corrections. Should I send the next patch version in a separate
thread? Or should I answer to this one?

El lun, 31 oct 2022 a la(s) 16:56, Guenter Roeck (linux@roeck-us.net) escri=
bi=C3=B3:
>
> On Mon, Oct 31, 2022 at 11:53:08AM -0300, Joaqu=C3=ADn Ignacio Aramend=C3=
=ADa wrote:
> > Sensors driver for OXP Handhelds from One-Netbook that expose fan readi=
ng
> > and control via hwmon sysfs.
> >
> > As far as I could gather all OXP boards have the same DMI strings and
> > they are told appart by the boot cpu vendor (Intel/AMD).
> > Currently only AMD boards are supported.
> >
> > Fan control is provided via pwm interface in the range [0-255]. AMD
> > boards have [0-100] as range in the EC, the written value is scaled to
> > accommodate for that.
> >
> > Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
>
> Please run "checkpatch --strict" on your patch and fix the CHECK
> messages. Also see Documentation/hwmon/submitting-patches.rst.

There is a Warning about MAINTAINERS to be updated. Should I add
myself to it? If yes, Should it be under a new header?

> > ---
> > Removed fan_control reference in comment.
> > Bugfix MIX/MIN reporting not available
> > Bugfix pwm_enable register set wrong
> > ---
> >  drivers/hwmon/Kconfig       |  13 +-
> >  drivers/hwmon/Makefile      |   1 +
> >  drivers/hwmon/oxp-sensors.c | 277 ++++++++++++++++++++++++++++++++++++
>
> Also needs Documentation/hwmon/oxp-sensors.rst

Will add.

> >  3 files changed, 290 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/hwmon/oxp-sensors.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 7ac3daaf59ce..a1cdb03b4d13 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1607,6 +1607,17 @@ config SENSORS_NZXT_SMART2
> >
> >  source "drivers/hwmon/occ/Kconfig"
> >
> > +config SENSORS_OXP
> > +     tristate "OneXPlayer EC fan control"
> > +     depends on ACPI
> > +     depends on X86
> > +     help
> > +             If you say yes here you get support for fan readings and =
control over
> > +             OneXPlayer handheld devices. Only OneXPlayer mini AMD han=
dheld variant
> > +             boards are supported.
> > +
> > +             Can also be built as a module. In that case it will be ca=
lled oxp-sensors.
> > +
> >  config SENSORS_PCF8591
> >       tristate "Philips PCF8591 ADC/DAC"
> >       depends on I2C
> > @@ -1957,7 +1968,7 @@ config SENSORS_ADS7871
> >
> >  config SENSORS_AMC6821
> >       tristate "Texas Instruments AMC6821"
> > -     depends on I2C
> > +     depends on I2C
>
> Please refrain from making unrelated changes. If you want to fix the extr=
a
> space, submit a separate patch.

Sorry this must have been vim removing trailing spaces. Will remove
this chunk from the patch.

> >       help
> >         If you say yes here you get support for the Texas Instruments
> >         AMC6821 hardware monitoring chips.
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 11d076cad8a2..35824f8be455 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NSA320)      +=3D nsa320-hwmon=
.o
> >  obj-$(CONFIG_SENSORS_NTC_THERMISTOR) +=3D ntc_thermistor.o
> >  obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) +=3D nzxt-kraken2.o
> >  obj-$(CONFIG_SENSORS_NZXT_SMART2) +=3D nzxt-smart2.o
> > +obj-$(CONFIG_SENSORS_OXP) +=3D oxp-sensors.o
> >  obj-$(CONFIG_SENSORS_PC87360)        +=3D pc87360.o
> >  obj-$(CONFIG_SENSORS_PC87427)        +=3D pc87427.o
> >  obj-$(CONFIG_SENSORS_PCF8591)        +=3D pcf8591.o
> > diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> > new file mode 100644
> > index 000000000000..f5895dc11094
> > --- /dev/null
> > +++ b/drivers/hwmon/oxp-sensors.c
> > @@ -0,0 +1,277 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Platform driver for OXP Handhelds that expose fan reading and contr=
ol
> > + * via hwmon sysfs.
> > + *
> > + * All boards have the same DMI strings and they are told appart by th=
e
> > + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supporte=
d
> > + * but the code is made to be simple to add other handheld boards in t=
he
> > + * future.
> > + * Fan control is provided via pwm interface in the range [0-255]. AMD
> > + * boards use [0-100] as range in the EC, the written value is scaled =
to
> > + * accommodate for that.
> > + *
> > + * Copyright (C) 2022 Joaqu=C3=ADn I. Aramend=C3=ADa <samsagax@gmail.c=
om>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/dmi.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/processor.h>
> > +
> > +#define ACPI_LOCK_DELAY_MS   500
> > +
> > +/* Handle ACPI lock mechanism */
> > +struct lock_data {
> > +     u32 mutex;
> > +     bool (*lock)(struct lock_data *data);
> > +     bool (*unlock)(struct lock_data *data);
> > +};
> > +
> > +static bool lock_global_acpi_lock(struct lock_data *data)
> > +{
> > +     return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> > +                                                              &data->m=
utex));
> > +}
> > +
> > +static bool unlock_global_acpi_lock(struct lock_data *data)
> > +{
> > +     return ACPI_SUCCESS(acpi_release_global_lock(data->mutex));
> > +}
> > +
> > +#define OXP_SENSOR_FAN_REG           0x76 /* Fan reading is 2 register=
s long */
> > +#define OXP_SENSOR_PWM_ENABLE_REG    0x4A /* PWM enable is 1 register =
long */
> > +#define OXP_SENSOR_PWM_REG           0x4B /* PWM reading is 1 register=
 long */
> > +
> > +static const struct dmi_system_id dmi_table[] =3D {
> > +     {
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> > +                                     "ONE-NETBOOK TECHNOLOGY CO., LTD.=
"),
> > +             },
> > +     },
> > +     {
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> > +                                     "ONE-NETBOOK"),
>
> Are there any others devices which start with "ONE-NETBOOK" but are not
> supported ? If not a single entry with DMI_MATCH() woud be sufficient.
> Either case I would like to see some additional entry or entries here.
> Just matching on the vendor name seems risky. At the very least there
> should also be a match for the "ONE XPLAYER" sku.

I would add a match for the board name instead of the sku if that is
ok. The rest will be added.

> > +             },
> > +     },
> > +     {},
> > +};
> > +
> > +struct oxp_status {
> > +     struct lock_data lock_data;
> > +};
> > +
> > +/* Helper functions to handle EC read/write */
> > +static int read_from_ec(u8 reg, int size, long *val)
> > +{
> > +     int i;
> > +     int ret;
> > +     u8 buffer;
> > +
> > +     *val =3D 0;
> > +     for (i =3D 0; i < size; i++) {
> > +             ret =3D ec_read(reg + i, &buffer);
> > +             if (ret)
> > +                     return ret;
> > +             (*val) <<=3D i * 8;
>
> Unnecessary ( )

Will remove.

> > +             *val +=3D buffer;
> > +     }
> > +     return ret;
> > +}
> > +
> > +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> > +{
> > +     struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     if (!state->lock_data.lock(&state->lock_data)) {
> > +             dev_warn(dev, "Failed to acquire mutex");
>
> Is that message necessary ? If so it should be dev_err().
> If it is expected, ie if acquiring the lock is observed
> to fail sometimes, there should be no log message.

The messages are there in case this fails, never failed on me,
honestly, but I've seen it in other ec-sensors drivers and adopted it
as a "good practice", I guess? Anyway I'll add a _once error message
and return error if it fails.

> > +             return -EBUSY;
> > +     }
> > +
> > +     ret =3D ec_write(reg, value);
> > +
> > +     if (!state->lock_data.unlock(&state->lock_data))
> > +             dev_err(dev, "Failed to release mutex");
>
> No error return ? Then it is not an error and should not be
> logged as one.
>
> I am a bit concerned about those error messages. If they are seen
> the errors are either sporadic and there should be no log,
> or they are persistent and would clog the kernel log. If you think
> that will indeed happen, is not normal operation, and that the
> message is essential enough to be logged, please at least consider
> using _once variants of the message to avoid clogging the kernel
> log.

Never saw those errors in about a month I used this driver on my own
device. As said, I saw the practice in other drivers. I think the best
way is to check for it and return an error while reporting it with the
_once variant if that is ok.

> > +
> > +     return ret;
> > +}
> > +
> > +static int oxp_pwm_enable(const struct device *dev)
> > +{
> > +     return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x01);
> > +}
> > +
> > +static int oxp_pwm_disable(const struct device *dev)
> > +{
> > +     return write_to_ec(dev, OXP_SENSOR_PWM_ENABLE_REG, 0x00);
> > +}
> > +
> > +/* Callbacks for hwmon interface */
> > +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> > +                                     enum hwmon_sensor_types type, u32=
 attr, int channel)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             return 0444;
> > +     case hwmon_pwm:
> > +             return 0644;
> > +     default:
> > +             return 0;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int oxp_platform_read(struct device *dev, enum hwmon_sensor_typ=
es type,
> > +                          u32 attr, int channel, long *val)
> > +{
> > +     int ret;
> > +
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             switch (attr) {
> > +             case hwmon_fan_input:
> > +                     return read_from_ec(OXP_SENSOR_FAN_REG,
> > +                                        2,
> > +                                        val);
>
> Unnecessary continuation lines

Ok. Will correct.

> > +             default:
> > +                     dev_dbg(dev, "Unknown attribute for type %d: %d\n=
", type, attr);
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_input:
> > +                     ret =3D read_from_ec(OXP_SENSOR_PWM_REG,
> > +                                        2, val);
>
> Please, no unnecessary continuation lines, and make sure that continuatio=
n
> lines match with '(' in the preceding line.

Ok. Will correct.

> > +                     *val =3D (*val * 255) / 100;
> > +                     return ret;
> > +             case hwmon_pwm_enable:
> > +                     return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1,=
 val);
> > +             default:
> > +                     dev_dbg(dev, "Unknown attribute for type %d: %d\n=
", type, attr);
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     default:
> > +             dev_dbg(dev, "Unknown sensor type %d.\n", type);
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +             u32 attr, int channel, long val)
> > +{
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_enable:
> > +                     if (val =3D=3D 1)
> > +                             return oxp_pwm_enable(dev);
> > +                     else if (val =3D=3D 0)
> > +                             return oxp_pwm_disable(dev);
> > +                     else
> > +                             return -EINVAL;
> > +             case hwmon_pwm_input:
> > +                     if (val < 0 || val > 255)
> > +                             return -EINVAL;
> > +                     val =3D (val * 100) / 255;
> > +                     return write_to_ec(dev, OXP_SENSOR_PWM_REG, val);
> > +             default:
> > +                     dev_dbg(dev, "Unknown attribute for type %d: %d",=
 type, attr);
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     default:
> > +             dev_dbg(dev, "Unknown sensor type: %d", type);
> > +             return -EOPNOTSUPP;
> > +     }
> > +     return -EINVAL;
> > +}
> > +
> > +/* Known sensors in the OXP EC controllers */
> > +static const struct hwmon_channel_info *oxp_platform_sensors[] =3D {
> > +     HWMON_CHANNEL_INFO(fan,
> > +             HWMON_F_INPUT),
> > +     HWMON_CHANNEL_INFO(pwm,
> > +             HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> > +     NULL,
> > +};
> > +
> > +static const struct hwmon_ops oxp_ec_hwmon_ops =3D {
> > +     .is_visible =3D oxp_ec_hwmon_is_visible,
> > +     .read =3D oxp_platform_read,
> > +     .write =3D oxp_platform_write,
> > +};
> > +
> > +static const struct hwmon_chip_info oxp_ec_chip_info =3D {
> > +     .ops =3D &oxp_ec_hwmon_ops,
> > +     .info =3D oxp_platform_sensors,
> > +};
> > +
> > +/* Initialization logic */
> > +static int oxp_platform_probe(struct platform_device *pdev)
> > +{
> > +     const struct dmi_system_id *dmi_entry;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device *hwdev;
> > +     struct oxp_status *state;
> > +
> > +     /* Have to check for AMD processor here */
> > +     dmi_entry =3D dmi_first_match(dmi_table);
> > +     if (!dmi_entry || boot_cpu_data.x86_vendor !=3D X86_VENDOR_AMD)
> > +             return -ENODEV;
> > +
> > +     state =3D devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL=
);
> > +     if (!state)
> > +             return -ENOMEM;
> > +
> > +     state->lock_data.mutex =3D 0;
>
> Unnecessary initialization. The data structure is initialized with
> devm_kzalloc().

Ok. Will remove.

> > +     state->lock_data.lock =3D lock_global_acpi_lock;
> > +     state->lock_data.unlock =3D unlock_global_acpi_lock;
>
> What is the purpose of this callback function ?
> Why not just call the lock and unlock functions directly ?

Can be called directly and simplify the structure a little. Will change it.

> > +
> > +     hwdev =3D devm_hwmon_device_register_with_info(dev, "oxpec", stat=
e,
> > +                                                     &oxp_ec_chip_info=
, NULL);
> > +
> > +     return PTR_ERR_OR_ZERO(hwdev);
> > +}
> > +
> > +static struct platform_driver oxp_platform_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "oxp-platform",
> > +     },
> > +     .probe =3D oxp_platform_probe,
> > +};
> > +
> > +static struct platform_device *oxp_platform_device;
> > +
> > +static int __init oxp_platform_init(void)
> > +{
> > +     oxp_platform_device =3D
> > +             platform_create_bundle(&oxp_platform_driver,
> > +                                    oxp_platform_probe, NULL, 0, NULL,=
 0);
> > +
> > +     if (IS_ERR(oxp_platform_device))
> > +             return PTR_ERR(oxp_platform_device);
> > +
> > +     return 0;
> > +}
> > +
> > +static void __exit oxp_platform_exit(void)
> > +{
> > +     platform_device_unregister(oxp_platform_device);
> > +     platform_driver_unregister(&oxp_platform_driver);
> > +}
> > +
> > +MODULE_DEVICE_TABLE(dmi, dmi_table);
> > +module_init(oxp_platform_init);
> > +module_exit(oxp_platform_exit);
> > +
> > +MODULE_AUTHOR("Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com=
>");
> > +MODULE_DESCRIPTION(
> > +     "Platform driver that handles ACPI EC of OneXPlayer devices");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.38.1
> >

Thanks again :)
--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
