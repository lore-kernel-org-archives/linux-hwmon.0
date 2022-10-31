Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B078CFA3741
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 18:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiJaS6J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 14:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJaS6H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 14:58:07 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B727DFD3;
        Mon, 31 Oct 2022 11:58:00 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-36a4b86a0abso116610317b3.7;
        Mon, 31 Oct 2022 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+Bt7sgx3eRUUAV85okMSLAB9X2BD95B+xtG2gikQF8=;
        b=E3gTYdGV+4HDU/41cFkAmxSMRa1J0UWLbjLugX1KZP5kejd8UhcOco5PJS3KDjFtKx
         bZDdXtlWnLfeN36jVAS6gJ0AxKmslLEgDbRLtH/pxGr+2FIMbEG4V5tWJlXSPGLg5ad6
         edlsGOqAa7EwQjfzTKiiRk2Z2nzj7lQMi0UqSHuj5n5F2o4gEyQGmb9lqCoctEssZ/98
         /9aBhmWiKDqm0s+D8WVu/UpfWoDCUlKJsykvHgqCKlDnhvCy0RyIWxG+zm/C3pu25zgG
         rxlH3JQSF9fxsPiUjL6Rz3LCRVsMIpQunoJ2dykBFso5WXjMvBcHDg/doSv0vU1qrdQi
         gm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+Bt7sgx3eRUUAV85okMSLAB9X2BD95B+xtG2gikQF8=;
        b=PeH6xDG6F9QgC34nkIypC4aWruH0Lvg7xY37vCJwJzNiwSY2v5rH6jRcb2shjbs2qW
         MdVwDliwS0aPKPacqN0/yG4PO4GPdKhV8SYGtfe0H/OKuUNhuAdYurUmcaZDLUP254FQ
         UC6YLF8R1udu41HR5Q6rtReiBHWdOxtda6wI1ypnPhEdAxaW1dkZBB/k3V+HvLDKRgJl
         GpsFattDui6soOHrYmL7sWorwVS1JMmOzpAtz8NZTOlrHy/PhpaMC4UWCRzOyQ/Y3D0H
         PaNmhzrQFdGgK9E2hAomhLPUwHnofqNlHrUYfcUJEVb2OjWt0TKnelLlHowijukjBPIR
         mIJw==
X-Gm-Message-State: ACrzQf1zpfMXx2P9WOg8HRMAfDhlsuL2HLcxu1JT7obRZm4nOx2WxYD1
        VzvryZFTEbzvHlIzJMcN4Wr69XQLIXEt4t6mdaE=
X-Google-Smtp-Source: AMsMyM6rS9nLlolE08WdWsnUqDmjaId81UuHx3AoS+RrAYiXRIZDhMvk7EWQ2KeFVlCcVP4+KKEfjL4Baq12zsqlk0Y=
X-Received: by 2002:a81:5045:0:b0:36c:662:7202 with SMTP id
 e66-20020a815045000000b0036c06627202mr14022169ywb.147.1667242679333; Mon, 31
 Oct 2022 11:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
 <20221031145308.341776-1-samsagax@gmail.com> <MN0PR12MB6101E68C68270C670A854B62E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101E68C68270C670A854B62E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 31 Oct 2022 15:57:48 -0300
Message-ID: <CABgtM3g7MquMfQckFw4DHeEZjMrOxfJcZkW4kHeT3c6aiZxk9g@mail.gmail.com>
Subject: Re: [PATCH v3] Add OneXPlayer mini AMD sensors driver
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

El lun, 31 oct 2022 a la(s) 13:43, Limonciello, Mario
(Mario.Limonciello@amd.com) escribi=C3=B3:
>
> [Public]
>
>
>
> > -----Original Message-----
> > From: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> > Sent: Monday, October 31, 2022 09:53
> > To: pobrn@protonmail.com
> > Cc: hdegoede@redhat.com; jdelvare@suse.com; linux-
> > hwmon@vger.kernel.org; linux@roeck-us.net; markgross@kernel.org;
> > platform-driver-x86@vger.kernel.org; Joaqu=C3=ADn Ignacio Aramend=C3=AD=
a
> > <samsagax@gmail.com>
> > Subject: [PATCH v3] Add OneXPlayer mini AMD sensors driver
> >
> > Sensors driver for OXP Handhelds from One-Netbook that expose fan
> > reading
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
> > ---
> > Removed fan_control reference in comment.
> > Bugfix MIX/MIN reporting not available
> > Bugfix pwm_enable register set wrong
> > ---
> >  drivers/hwmon/Kconfig       |  13 +-
> >  drivers/hwmon/Makefile      |   1 +
> >  drivers/hwmon/oxp-sensors.c | 277
> > ++++++++++++++++++++++++++++++++++++
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
> > +             If you say yes here you get support for fan readings and
> > control over
> > +             OneXPlayer handheld devices. Only OneXPlayer mini AMD
> > handheld variant
> > +             boards are supported.
> > +
> > +             Can also be built as a module. In that case it will be ca=
lled oxp-
> > sensors.
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
> >       help
> >         If you say yes here you get support for the Texas Instruments
> >         AMC6821 hardware monitoring chips.
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 11d076cad8a2..35824f8be455 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NSA320)      +=3D nsa320-
> > hwmon.o
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
>
> What happens on the Intel variant with this code?  Are they not the same =
EC?
> Why doesn't it work there?  If you keep the AMD check in the code, I thin=
k it
> would be good to document the problems with the Intel one at least.

I don't own an intel board but a friend of mine does. It won't work.
The EC registers are different, even though they have the same DMI
strings for board manufacturer and board name. There is also a variant
for the board vendor that is programmed here "ONE-NETBOOK" and
"ONE-NETBOOK TECHNOLOGY CO., LTD." for the same device.
The explanation for the Intel issue is I couldn't figure out the EC
registers and values to read/write. I have a version of this on my
repo with a non-functional Intel case. I can document it in a code
comment over the amd cpu check.

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
> > +     return
> > ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> > +                                                              &data-
> > >mutex));
> > +}
> > +
> > +static bool unlock_global_acpi_lock(struct lock_data *data)
> > +{
> > +     return ACPI_SUCCESS(acpi_release_global_lock(data->mutex));
> > +}
> > +
> > +#define OXP_SENSOR_FAN_REG           0x76 /* Fan reading is 2
> > registers long */
> > +#define OXP_SENSOR_PWM_ENABLE_REG    0x4A /* PWM enable is 1
> > register long */
> > +#define OXP_SENSOR_PWM_REG           0x4B /* PWM reading is 1
> > register long */
> > +
> > +static const struct dmi_system_id dmi_table[] =3D {
> > +     {
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> > +                                     "ONE-NETBOOK TECHNOLOGY CO.,
> > LTD."),
> > +             },
> > +     },
> > +     {
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> > +                                     "ONE-NETBOOK"),
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
> > +             *val +=3D buffer;
> > +     }
> > +     return ret;
>
> Don't you need to acquire your mutex for reading too?
> Otherwise you could potentially have userspace trying to read
> and write another at the same time and get indeterminate results.

Will add since it doesn't seem to hurt. I added the mutex to the write
case only since it can indeed present an issue.

> > +}
> > +
> > +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> > +{
> > +     struct oxp_status *state =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     if (!state->lock_data.lock(&state->lock_data)) {
> > +             dev_warn(dev, "Failed to acquire mutex");
> > +             return -EBUSY;
> > +     }
> > +
> > +     ret =3D ec_write(reg, value);
> > +
> > +     if (!state->lock_data.unlock(&state->lock_data))
> > +             dev_err(dev, "Failed to release mutex");
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
> > +                                     enum hwmon_sensor_types type,
> > u32 attr, int channel)
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
> > +static int oxp_platform_read(struct device *dev, enum
> > hwmon_sensor_types type,
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
> > +             default:
> > +                     dev_dbg(dev, "Unknown attribute for type %d:
> > %d\n", type, attr);
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_input:
> > +                     ret =3D read_from_ec(OXP_SENSOR_PWM_REG,
> > +                                        2, val);
> > +                     *val =3D (*val * 255) / 100;
> > +                     return ret;
> > +             case hwmon_pwm_enable:
> > +                     return
> > read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
> > +             default:
> > +                     dev_dbg(dev, "Unknown attribute for type %d:
> > %d\n", type, attr);
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     default:
> > +             dev_dbg(dev, "Unknown sensor type %d.\n", type);
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static int oxp_platform_write(struct device *dev, enum
> > hwmon_sensor_types type,
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
> > +                     return write_to_ec(dev, OXP_SENSOR_PWM_REG,
> > val);
> > +             default:
> > +                     dev_dbg(dev, "Unknown attribute for type %d: %d",
> > type, attr);
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     default:
> > +             dev_dbg(dev, "Unknown sensor type: %d", type);
> > +             return -EOPNOTSUPP;
> > +     }
> > +     return -EINVAL;
>
> Can you actually hit this scenario?  I would think not; you'll hit "defau=
lt" and return -EOPNOTSUPP.
> Maybe it's better to just drop the default label and then outside the swi=
tch/case do this:
>
>         dev_dbg(dev, "Unknown sensor type: %d", type);
>         return -EOPNOTSUPP;
>
It shouldn't since there are no other attributes present. I can
simplify this logic by a catch all case as you stated.

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
>
> So it's shared DMI data values for the Intel and AMD variants of this pla=
tform?  What
> happens if you run all this code on the Intel one?
>
Yeah... These devices have all the same DMI strings. In facto all the
OneXPlayers have the same DMI model name also "ONEXPLAYER".
Running this code on Intel won't work, the EC registers and values
seem to differ.

> > +
> > +     state =3D devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL=
);
> > +     if (!state)
> > +             return -ENOMEM;
> > +
> > +     state->lock_data.mutex =3D 0;
> > +     state->lock_data.lock =3D lock_global_acpi_lock;
> > +     state->lock_data.unlock =3D unlock_global_acpi_lock;
> > +
> > +     hwdev =3D devm_hwmon_device_register_with_info(dev, "oxpec",
> > state,
> > +                                                     &oxp_ec_chip_info=
,
> > NULL);
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



--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
