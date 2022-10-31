Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03733ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 21:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiJaVaT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 17:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiJaVaS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 17:30:18 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1E610556;
        Mon, 31 Oct 2022 14:30:17 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1322d768ba7so14899944fac.5;
        Mon, 31 Oct 2022 14:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7yyVKrhqqvVqV1d1yXkbJ7Ox0NpIlCTZqJ5HqW3FFs=;
        b=bQTohbsepgB+h2/ijnMFeJDUet6cVdPneWNfkJgpSOF7SvVV6iSbXliTdKv5u0znAw
         CJMfrhCsu+G3TMt6t1rQ7TcxyGyyvpdUat1qIBJ8zfS8qhKAa5bVVM8XZZ8X3hN8VQi/
         i+dGCo7C3AzFAy2DvinODclOVPnF7HWVqPznpS2tQcrxGZdIAzm+v5BYzjtZS1n28jEj
         TLKBaqBthonbxrJj4Q7+ZLk+jU/+Z2Qfy9qmyefowqpvI/qY7HIhuCJtzkHrnfGmn1II
         xuO/mz3qIPSKTAYmhPdSl8LwPhz6ayIJEXo52YMgmoBbJ57WcCDVQxeWVoNPfXXhrSSW
         BBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7yyVKrhqqvVqV1d1yXkbJ7Ox0NpIlCTZqJ5HqW3FFs=;
        b=YGi/YpkNvSgRZ8nM6eUsHgheh/96TxNVgyweNtfaZSsEngqCrKRX4vPNILdZgwOwPU
         zAJgZsk1dzqPK3KeRReu8R6caYzwoplB6CHRv8xB2oiWpcMAzcYS7ey59n6QkXpo25QX
         C601zjJNuTm8uvirjaveIUKnWIipPP2oJMAqZRmDMwlAQt6Q6X4oBkURaeBRjyCEGkPB
         8R7unxXapBZKWrj9puVyTV8xzOxUbnDQeYeXDvo9E72qE3+jx5af5p9hSIelBN0tW643
         8wmn//nw59fD0X17YEZrbHSAenJ4LxkBAZetmD9LlxqFkmbTeGLMSffW1ott2P+Qw1TY
         K6hg==
X-Gm-Message-State: ACrzQf0C0Lf5LP2biiaL2Re5qsKWhm6gePyTJ7LYkHRPvuhtju4nsYRn
        T/l5eXas37Y/BmmrfWuuw7M=
X-Google-Smtp-Source: AMsMyM4XpqReJ7IIkCGQdxNnBWmreZPM61FIfnWEd6h9T+Wi6ibcJgyqlYKdjxh0dkMF40wbk/DXPw==
X-Received: by 2002:a05:6870:63aa:b0:13a:fe6c:5ed0 with SMTP id t42-20020a05687063aa00b0013afe6c5ed0mr8865191oap.257.1667251816466;
        Mon, 31 Oct 2022 14:30:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m11-20020a056870058b00b0013125e6a60fsm3535723oap.58.2022.10.31.14.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:30:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 31 Oct 2022 14:30:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joaquin Aramendia <samsagax@gmail.com>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] Add OneXPlayer mini AMD sensors driver
Message-ID: <20221031213014.GA272079@roeck-us.net>
References: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
 <20221031145308.341776-1-samsagax@gmail.com>
 <20221031195609.GA2006109@roeck-us.net>
 <CABgtM3g-qOB2HZXwRhG7kEhsz0934DZuVC3oKH=qKcqLUw_eMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgtM3g-qOB2HZXwRhG7kEhsz0934DZuVC3oKH=qKcqLUw_eMg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 31, 2022 at 05:53:20PM -0300, Joaquin Aramendia wrote:
> Thanks for your time and review. I'll follow your advice and
> corrections. Should I send the next patch version in a separate
> thread? Or should I answer to this one?
> 
> El lun, 31 oct 2022 a la(s) 16:56, Guenter Roeck (linux@roeck-us.net) escribió:
> >
> > On Mon, Oct 31, 2022 at 11:53:08AM -0300, Joaquín Ignacio Aramendía wrote:
> > > Sensors driver for OXP Handhelds from One-Netbook that expose fan reading
> > > and control via hwmon sysfs.
> > >
> > > As far as I could gather all OXP boards have the same DMI strings and
> > > they are told appart by the boot cpu vendor (Intel/AMD).
> > > Currently only AMD boards are supported.
> > >
> > > Fan control is provided via pwm interface in the range [0-255]. AMD
> > > boards have [0-100] as range in the EC, the written value is scaled to
> > > accommodate for that.
> > >
> > > Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> >
> > Please run "checkpatch --strict" on your patch and fix the CHECK
> > messages. Also see Documentation/hwmon/submitting-patches.rst.
> 
> There is a Warning about MAINTAINERS to be updated. Should I add
> myself to it? If yes, Should it be under a new header?
> 
Feel free to do so if you like, but that one isn't mandatory.

> > > ---
> > > Removed fan_control reference in comment.
> > > Bugfix MIX/MIN reporting not available
> > > Bugfix pwm_enable register set wrong
> > > ---
> > >  drivers/hwmon/Kconfig       |  13 +-
> > >  drivers/hwmon/Makefile      |   1 +
> > >  drivers/hwmon/oxp-sensors.c | 277 ++++++++++++++++++++++++++++++++++++
> >
> > Also needs Documentation/hwmon/oxp-sensors.rst
> 
> Will add.
> 
> > >  3 files changed, 290 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/hwmon/oxp-sensors.c
> > >
> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index 7ac3daaf59ce..a1cdb03b4d13 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -1607,6 +1607,17 @@ config SENSORS_NZXT_SMART2
> > >
> > >  source "drivers/hwmon/occ/Kconfig"
> > >
> > > +config SENSORS_OXP
> > > +     tristate "OneXPlayer EC fan control"
> > > +     depends on ACPI
> > > +     depends on X86
> > > +     help
> > > +             If you say yes here you get support for fan readings and control over
> > > +             OneXPlayer handheld devices. Only OneXPlayer mini AMD handheld variant
> > > +             boards are supported.
> > > +
> > > +             Can also be built as a module. In that case it will be called oxp-sensors.
> > > +
> > >  config SENSORS_PCF8591
> > >       tristate "Philips PCF8591 ADC/DAC"
> > >       depends on I2C
> > > @@ -1957,7 +1968,7 @@ config SENSORS_ADS7871
> > >
> > >  config SENSORS_AMC6821
> > >       tristate "Texas Instruments AMC6821"
> > > -     depends on I2C
> > > +     depends on I2C
> >
> > Please refrain from making unrelated changes. If you want to fix the extra
> > space, submit a separate patch.
> 
> Sorry this must have been vim removing trailing spaces. Will remove
> this chunk from the patch.
> 
> > >       help
> > >         If you say yes here you get support for the Texas Instruments
> > >         AMC6821 hardware monitoring chips.
> > > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > > index 11d076cad8a2..35824f8be455 100644
> > > --- a/drivers/hwmon/Makefile
> > > +++ b/drivers/hwmon/Makefile
> > > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NSA320)      += nsa320-hwmon.o
> > >  obj-$(CONFIG_SENSORS_NTC_THERMISTOR) += ntc_thermistor.o
> > >  obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
> > >  obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
> > > +obj-$(CONFIG_SENSORS_OXP) += oxp-sensors.o
> > >  obj-$(CONFIG_SENSORS_PC87360)        += pc87360.o
> > >  obj-$(CONFIG_SENSORS_PC87427)        += pc87427.o
> > >  obj-$(CONFIG_SENSORS_PCF8591)        += pcf8591.o
> > > diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> > > new file mode 100644
> > > index 000000000000..f5895dc11094
> > > --- /dev/null
> > > +++ b/drivers/hwmon/oxp-sensors.c
> > > @@ -0,0 +1,277 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Platform driver for OXP Handhelds that expose fan reading and control
> > > + * via hwmon sysfs.
> > > + *
> > > + * All boards have the same DMI strings and they are told appart by the
> > > + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
> > > + * but the code is made to be simple to add other handheld boards in the
> > > + * future.
> > > + * Fan control is provided via pwm interface in the range [0-255]. AMD
> > > + * boards use [0-100] as range in the EC, the written value is scaled to
> > > + * accommodate for that.
> > > + *
> > > + * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/dmi.h>
> > > +#include <linux/hwmon.h>
> > > +#include <linux/init.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/processor.h>
> > > +
> > > +#define ACPI_LOCK_DELAY_MS   500
> > > +
> > > +/* Handle ACPI lock mechanism */
> > > +struct lock_data {
> > > +     u32 mutex;
> > > +     bool (*lock)(struct lock_data *data);
> > > +     bool (*unlock)(struct lock_data *data);
> > > +};
> > > +
> > > +static bool lock_global_acpi_lock(struct lock_data *data)
> > > +{
> > > +     return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> > > +                                                              &data->mutex));
> > > +}
> > > +
> > > +static bool unlock_global_acpi_lock(struct lock_data *data)
> > > +{
> > > +     return ACPI_SUCCESS(acpi_release_global_lock(data->mutex));
> > > +}
> > > +
> > > +#define OXP_SENSOR_FAN_REG           0x76 /* Fan reading is 2 registers long */
> > > +#define OXP_SENSOR_PWM_ENABLE_REG    0x4A /* PWM enable is 1 register long */
> > > +#define OXP_SENSOR_PWM_REG           0x4B /* PWM reading is 1 register long */
> > > +
> > > +static const struct dmi_system_id dmi_table[] = {
> > > +     {
> > > +             .matches = {
> > > +                     DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> > > +                                     "ONE-NETBOOK TECHNOLOGY CO., LTD."),
> > > +             },
> > > +     },
> > > +     {
> > > +             .matches = {
> > > +                     DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> > > +                                     "ONE-NETBOOK"),
> >
> > Are there any others devices which start with "ONE-NETBOOK" but are not
> > supported ? If not a single entry with DMI_MATCH() woud be sufficient.
> > Either case I would like to see some additional entry or entries here.
> > Just matching on the vendor name seems risky. At the very least there
> > should also be a match for the "ONE XPLAYER" sku.
> 
> I would add a match for the board name instead of the sku if that is
> ok. The rest will be added.
> 

Sure, if it contains useful information.

> > > +             },
> > > +     },
> > > +     {},
> > > +};
> > > +
> > > +struct oxp_status {
> > > +     struct lock_data lock_data;
> > > +};
> > > +
> > > +/* Helper functions to handle EC read/write */
> > > +static int read_from_ec(u8 reg, int size, long *val)
> > > +{
> > > +     int i;
> > > +     int ret;
> > > +     u8 buffer;
> > > +
> > > +     *val = 0;
> > > +     for (i = 0; i < size; i++) {
> > > +             ret = ec_read(reg + i, &buffer);
> > > +             if (ret)
> > > +                     return ret;
> > > +             (*val) <<= i * 8;
> >
> > Unnecessary ( )
> 
> Will remove.
> 
> > > +             *val += buffer;
> > > +     }
> > > +     return ret;
> > > +}
> > > +
> > > +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> > > +{
> > > +     struct oxp_status *state = dev_get_drvdata(dev);
> > > +     int ret;
> > > +
> > > +     if (!state->lock_data.lock(&state->lock_data)) {
> > > +             dev_warn(dev, "Failed to acquire mutex");
> >
> > Is that message necessary ? If so it should be dev_err().
> > If it is expected, ie if acquiring the lock is observed
> > to fail sometimes, there should be no log message.
> 
> The messages are there in case this fails, never failed on me,
> honestly, but I've seen it in other ec-sensors drivers and adopted it
> as a "good practice", I guess? Anyway I'll add a _once error message
> and return error if it fails.

It is not a good practice, it is developers inisisting to add noise.
It makes me cringe each time I see it, but I often let it go because
arguing about it is not worth wasting my time.

> 
> > > +             return -EBUSY;
> > > +     }
> > > +
> > > +     ret = ec_write(reg, value);
> > > +
> > > +     if (!state->lock_data.unlock(&state->lock_data))
> > > +             dev_err(dev, "Failed to release mutex");
> >
> > No error return ? Then it is not an error and should not be
> > logged as one.
> >
> > I am a bit concerned about those error messages. If they are seen
> > the errors are either sporadic and there should be no log,
> > or they are persistent and would clog the kernel log. If you think
> > that will indeed happen, is not normal operation, and that the
> > message is essential enough to be logged, please at least consider
> > using _once variants of the message to avoid clogging the kernel
> > log.
> 
> Never saw those errors in about a month I used this driver on my own
> device. As said, I saw the practice in other drivers. I think the best
> way is to check for it and return an error while reporting it with the
> _once variant if that is ok.
> 
I'd prefer to not have a message at all, but then again it is not worth
wasting my time over it.

Thanks,
Guenter
