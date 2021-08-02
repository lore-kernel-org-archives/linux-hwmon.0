Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104FFC4338F
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Aug 2021 12:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E25A660FC2
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Aug 2021 12:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhHBMPi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Aug 2021 08:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbhHBMPi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Aug 2021 08:15:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DF0C06175F
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Aug 2021 05:15:28 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z2so33374848lft.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Aug 2021 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ijjbd0QSn5Io7wetx1KzQ9TmkAR8q73FH/jv7CxFmyQ=;
        b=Yz/FLU9ymDaj3Kza5ZH+ytNgBuU97eGDr6ldPfGWzBSF+ikOE7Su342ff4LfNIN18Q
         nOZfB6fhq7PzUGIQIk0BsUahvuf3L4SasQItwItjcpRS2eCb3X2A4aEbbDlSBLygwIp6
         nnF9yjvQGb9WIoUS65L8p1MFQYgozPiBtSpFroSFJwmue5faxgVNXpV+H1qtL1B4RgJm
         FnXhFsgnIXOLP1Vv0MhhF4UppbIqYl/6Qn7cArt4BosdBcl57YnxZkgWkzVff+LPBazQ
         yp8KkQG/OJ34YlhiCwOgY0rEcE+pUp55PbCYwR4kolytICDzK0zCzHjh84J+bDEvScXG
         khxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ijjbd0QSn5Io7wetx1KzQ9TmkAR8q73FH/jv7CxFmyQ=;
        b=W+LXS9aO4pZlONagOjLtFaaAuTLxR7jj+biuGRLO8+tAbakt1HfklC0wA1xnPtuiyX
         YAWw4JIDzl59ztnDP7dZlRnx2xa0y1R18mgUjkhc8idg7qmAcnSDXYsBsjRypNefg6YS
         fqay+8s4qWLbI+y7uV+8hSz+uqAkquSv/BXxI+qFPnIH0f0Wuwvg9D2O7EvtxgreIJxn
         M7wVXMNaueGxe34esyfftnLW4z7IBAlSC4mbbWOQ12GPTqGaeMvH3lOia/E6Dn2OKU3l
         8v5zrM2wU0oVOP9wAnCcuFLdR0tvYT9blODPYwHQKkQLpxqxyebWU0jKQgbJtvzlq5l1
         IMKw==
X-Gm-Message-State: AOAM5328p5eZ+aagark8Zd1hPByltQgR0nST39FtNJe1L/iGjp7JN4hq
        gZeMj0YsBjgrbbH3cqyBy4hzDZ03CCLDbRbS/OE=
X-Google-Smtp-Source: ABdhPJzN/FU++O/+6mnlztBPp1KkTAFDWJWo14tI52s+iVXVR82vQiiU/g1zk+y37NLXl3IE3J9aJb8hX+gNU6DhSL0=
X-Received: by 2002:a05:6512:320b:: with SMTP id d11mr12308008lfe.502.1627906526408;
 Mon, 02 Aug 2021 05:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210725105925.620024-1-mezin.alexander@gmail.com> <20210725182955.GA3567845@roeck-us.net>
In-Reply-To: <20210725182955.GA3567845@roeck-us.net>
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
Date:   Mon, 2 Aug 2021 18:15:15 +0600
Message-ID: <CADnvcfLb69Un0c5A7+kKHaEXwKiiu60NirZX6J74Hd3mnVXxuQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add driver for NZXT RGB&Fan Controller/Smart
 Device v2.
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonas Malaco <jonas@protocubo.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 26, 2021 at 12:29 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sun, Jul 25, 2021 at 04:59:25PM +0600, Aleksandr Mezin wrote:
> > This driver implements monitoring and control of fans plugged into the
> > device. Besides typical speed monitoring and PWM duty cycle control,
> > voltage and current are reported for every fan.
> >
> > The device also has 2 connectors for RGB LEDs, support for them isn't
> > implemented (mainly because there is no standardized sysfs interface).
> >
> > Also, the device has a noise sensor, but the sensor seems to be completely
> > useless (and very imprecise), so support for it isn't implemented too.
> >
> > The driver coexists with userspace tools that access the device through
> > hidraw interface with no known issues.
> >
> > The driver has been tested on x86_64, built in and as a module.
> >
> > Some changes/improvements were suggested by Jonas Malaco.
> >
> > Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
> > ---
> >  Documentation/hwmon/index.rst                 |   1 +
> >  .../hwmon/nzxt-rgb-fan-controller.rst         |  56 ++
> >  MAINTAINERS                                   |   7 +
> >  drivers/hwmon/Kconfig                         |  10 +
> >  drivers/hwmon/Makefile                        |   1 +
> >  drivers/hwmon/nzxt-rgb-fan-controller.c       | 829 ++++++++++++++++++
>
> The driver name does not have to include the complete device description.
> Please select a shorter name, such as nzxt-fan. The is even more true
> since the driver does not just support the RGB fan controller.

I'll change it to 'nzxt-smart2' ('nzxt-fan' is too generic IMO. They
make fans too).

> Couple of comments below, but that is far from a complete review.
> I'll have to do a lot of study to detemine if all those spinlocks
> as well as the complex wakeup logic are necessary (instead of, for
> example, just returning -ENODATA if the configuration was not received),

This all came from trying to make the driver work with fancontrol.
fancontrol expects the data to be always and immediately available.
For example, fancontrol tries to save pwm* values when it starts. If
pwm* read fails during startup, it will set fan speed to 100% during
shutdown. If pwm* read fails later (in the update cycle), fancontrol
exits with an error. And the device sends pwm* values for the first
time only 3-4 seconds after initialization started - so it's not a
purely theoretical race, it happens in practice.

> and that will take time. On the surface, it doesn't make sense to me
> that it would be necessary to disable interrupts just for reading cached
> data. Please explain the need for it as comment in the code to help
> me determine why and if it is indeed necessary.

There are 2 places where spin_lock_irq() is used. In both of them, I
would use spin_lock_bh, if wait_event_interruptible_locked_bh() was
available.

If you're talking about removing spinlocks completely: at least,
'*_received' flags should be stored after the data itself is stored,
so I guess I'll have to add memory barriers instead?

>
> >  6 files changed, 904 insertions(+)
> >  create mode 100644 Documentation/hwmon/nzxt-rgb-fan-controller.rst
> >  create mode 100644 drivers/hwmon/nzxt-rgb-fan-controller.c
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> > index bc01601ea81a..5c9ff54afa4e 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -148,6 +148,7 @@ Hardware Monitoring Kernel Drivers
> >     nsa320
> >     ntc_thermistor
> >     nzxt-kraken2
> > +   nzxt-rgb-fan-controller
> >     occ
> >     pc87360
> >     pc87427
> > diff --git a/Documentation/hwmon/nzxt-rgb-fan-controller.rst b/Documentation/hwmon/nzxt-rgb-fan-controller.rst
> > new file mode 100644
> > index 000000000000..bc2db6d45248
> > --- /dev/null
> > +++ b/Documentation/hwmon/nzxt-rgb-fan-controller.rst
> > @@ -0,0 +1,56 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +Kernel driver nzxt-rgb-fan-controller
> > +=====================================
> > +
> > +Supported devices:
> > +
> > +- NZXT RGB & Fan controller
> > +- NZXT Smart Device v2
> > +
> > +Description
> > +-----------
> > +
> > +This driver implements monitoring and control of fans plugged into the device.
> > +Besides typical speed monitoring and PWM duty cycle control, voltage and current
> > +are reported for every fan.
> > +
> > +The device also has two connectors for RGB LEDs; support for them isn't
> > +implemented (mainly because there is no standardized sysfs interface).
> > +
> > +Also, the device has a noise sensor, but the sensor seems to be completely
> > +useless (and very imprecise), so support for it isn't implemented too.
> > +
> > +Usage Notes
> > +-----------
> > +
> > +The device should be autodetected, and the driver should load automatically.
> > +
> > +If fans are plugged in/unplugged while the system is powered on, the driver
> > +must be reloaded to detect configuration changes; otherwise, new fans can't
> > +be controlled (`pwm*` changes will be ignored). It is necessary because the
> > +device has a dedicated "detect fans" command, and currently, it is executed only
> > +during initialization. Speed, voltage, current monitoring will work even without
> > +reload.
> > +
> > +The driver coexists with userspace tools that access the device through hidraw
> > +interface with no known issues.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +=======================      ========================================================
> > +fan[1-3]_input               Fan speed monitoring (in rpm).
> > +curr[1-3]_input              Current supplied to the fan (in milliamperes).
> > +in[0-2]_input                Voltage supplied to the fan (in millivolts).
> > +pwm[1-3]             Controls fan speed: PWM duty cycle for PWM-controlled
> > +                     fans, voltage for other fans. Voltage can be changed in
> > +                     9-12 V range, but the value of the sysfs attribute is
> > +                     always in 0-255 range (1 = 9V, 255 = 12V). Setting the
> > +                     attribute to 0 turns off the fan completely.
> > +pwm[1-3]_enable              Read-only, 1 if the fan was detected, 0 otherwise.
>
> This is an ABI misuse, which is not acceptable. If a fan is not detected,
> associated attributes should either not be visible or return -ENODATA
> when read.

I can't hide attributes (using is_visible callback) because:
1) The configuration usually arrives 3-4 seconds after device
initialization starts.
2) The configuration can change during suspend and resume, or if a
userspace tool sends "fan detect" command through hidraw.

Also, fancontrol doesn't restore fan speed properly (sets it to 100%
instead of the original value) during shutdown, if pwm*_enable isn't
present, or isn't writable.

I can drop this hack, pwmconfig and fancontrol will work a bit worse
with the driver, but they will still work.

Regarding -ENODATA: fan monitoring works even if the fan is "not
detected" (i. e. if I hot-plug the fan in without reloading the
driver). Only fan control doesn't work (the device even stores pwm
values you send, they just don't affect the actual fan speed). Is it
necessary to "hide" sensors by returning ENODATA in this case? For
example, nct6775 just shows "0 RPM" when a fan isn't connected.

>
> > +pwm[1-3]_mode                Read-only, 1 for PWM-controlled fans, 0 for other fans
> > +                     (or if no fan connected).
> > +update_interval              The interval at which all inputs are updated (in
> > +                     milliseconds). The default is 1000ms. Minimum is 250ms.
> > +=======================      ========================================================
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6c8be735cc91..9f3708896e70 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13416,6 +13416,13 @@ S:   Maintained
> >  F:   Documentation/hwmon/nzxt-kraken2.rst
> >  F:   drivers/hwmon/nzxt-kraken2.c
> >
> > +NZXT-RGB-FAN-CONTROLLER HARDWARE MONITORING DRIVER
> > +M:   Aleksandr Mezin <mezin.alexander@gmail.com>
> > +L:   linux-hwmon@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/hwmon/nzxt-rgb-fan-controller.rst
> > +F:   drivers/hwmon/nzxt-rgb-fan-controller.c
> > +
> >  OBJAGG
> >  M:   Jiri Pirko <jiri@nvidia.com>
> >  L:   netdev@vger.kernel.org
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index e3675377bc5d..054885743b86 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1492,6 +1492,16 @@ config SENSORS_NZXT_KRAKEN2
> >         This driver can also be built as a module. If so, the module
> >         will be called nzxt-kraken2.
> >
> > +config SENSORS_NZXT_RGB_FAN_CONTROLLER
> > +     tristate "NZXT RGB & Fan Controller/Smart Device v2"
> > +     depends on USB_HID
> > +     help
> > +       If you say yes here you get support for hardware monitoring for the
> > +       NZXT RGB & Fan Controller/Smart Device v2.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called nzxt-rgb-fan-controller.
> > +
> >  source "drivers/hwmon/occ/Kconfig"
> >
> >  config SENSORS_PCF8591
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index d712c61c1f5e..ccdd0936c881 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -156,6 +156,7 @@ obj-$(CONFIG_SENSORS_NPCM7XX)     += npcm750-pwm-fan.o
> >  obj-$(CONFIG_SENSORS_NSA320) += nsa320-hwmon.o
> >  obj-$(CONFIG_SENSORS_NTC_THERMISTOR) += ntc_thermistor.o
> >  obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
> > +obj-$(CONFIG_SENSORS_NZXT_RGB_FAN_CONTROLLER) += nzxt-rgb-fan-controller.o
> >  obj-$(CONFIG_SENSORS_PC87360)        += pc87360.o
> >  obj-$(CONFIG_SENSORS_PC87427)        += pc87427.o
> >  obj-$(CONFIG_SENSORS_PCF8591)        += pcf8591.o
> > diff --git a/drivers/hwmon/nzxt-rgb-fan-controller.c b/drivers/hwmon/nzxt-rgb-fan-controller.c
> > new file mode 100644
> > index 000000000000..4eed239ed930
> > --- /dev/null
> > +++ b/drivers/hwmon/nzxt-rgb-fan-controller.c
> > @@ -0,0 +1,829 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Reverse-engineered NZXT RGB & Fan Controller/Smart Device v2 driver.
> > + *
> > + * Copyright (c) 2021 Aleksandr Mezin
> > + */
> > +
> > +#include <linux/hid.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/math.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/wait.h>
> > +
> > +#include <asm/byteorder.h>
> > +#include <asm/unaligned.h>
> > +
> > +/*
> > + * The device has only 3 fan channels/connectors. But all HID reports have
> > + * space reserved for up to 8 channels.
> > + */
> > +#define FAN_CHANNELS 3
> > +#define FAN_CHANNELS_MAX 8
> > +
> > +#define UPDATE_INTERVAL_DEFAULT_MS 1000
> > +
> > +/* These strings match labels on the device exactly */
> > +static const char *const fan_label[] = {
> > +     "FAN 1",
> > +     "FAN 2",
> > +     "FAN 3",
> > +};
> > +
> > +static const char *const curr_label[] = {
> > +     "FAN 1 Current",
> > +     "FAN 2 Current",
> > +     "FAN 3 Current",
> > +};
> > +
> > +static const char *const in_label[] = {
> > +     "FAN 1 Voltage",
> > +     "FAN 2 Voltage",
> > +     "FAN 3 Voltage",
> > +};
> > +
> > +enum {
> > +     INPUT_REPORT_ID_FAN_CONFIG = 0x61,
> > +     INPUT_REPORT_ID_FAN_STATUS = 0x67,
> > +};
> > +
> > +enum {
> > +     FAN_STATUS_REPORT_SPEED = 0x02,
> > +     FAN_STATUS_REPORT_VOLTAGE = 0x04,
> > +};
> > +
> > +enum {
> > +     FAN_TYPE_NONE = 0,
> > +     FAN_TYPE_DC = 1,
> > +     FAN_TYPE_PWM = 2,
> > +};
> > +
> > +struct unknown_static_data {
> > +     /*
> > +      * Some configuration data? Stays the same after fan speed changes,
> > +      * changes in fan configuration, reboots and driver reloads.
> > +      *
> > +      * The same data in multiple report types.
> > +      *
> > +      * Byte 12 seems to be the number of fan channels, but I am not sure.
> > +      */
> > +     u8 unknown1[14];
> > +} __packed;
> > +
> > +/*
> > + * The device sends this input report in response to "detect fans" command:
> > + * a 2-byte output report { 0x60, 0x03 }.
> > + */
> > +struct fan_config_report {
> > +     /* report_id should be INPUT_REPORT_ID_FAN_CONFIG = 0x61 */
> > +     u8 report_id;
> > +     /* Always 0x03 */
> > +     u8 magic;
> > +     struct unknown_static_data unknown_data;
> > +     /* Fan type as detected by the device. See FAN_TYPE_* enum. */
> > +     u8 fan_type[FAN_CHANNELS_MAX];
> > +} __packed;
> > +
> > +/*
> > + * The device sends these reports at a fixed interval (update interval) -
> > + * one report with type = FAN_STATUS_REPORT_SPEED, and one report with type =
> > + * FAN_STATUS_REPORT_VOLTAGE per update interval.
> > + */
> > +struct fan_status_report {
> > +     /* report_id should be INPUT_REPORT_ID_STATUS = 0x67 */
> > +     u8 report_id;
> > +     /* FAN_STATUS_REPORT_SPEED = 0x02 or FAN_STATUS_REPORT_VOLTAGE = 0x04 */
> > +     u8 type;
> > +     struct unknown_static_data unknown_data;
> > +     /* Fan type as detected by the device. See FAN_TYPE_* enum. */
> > +     u8 fan_type[FAN_CHANNELS_MAX];
> > +
> > +     union {
> > +             /* When type == FAN_STATUS_REPORT_SPEED */
> > +             struct {
> > +                     /*
> > +                      * Fan speed, in RPM. Zero for channels without fans
> > +                      * connected.
> > +                      */
> > +                     __le16 fan_rpm[FAN_CHANNELS_MAX];
> > +                     /*
> > +                      * Fan duty cycle, in percent. Non-zero even for
> > +                      * channels without fans connected.
> > +                      */
> > +                     u8 duty_percent[FAN_CHANNELS_MAX];
> > +                     /*
> > +                      * Exactly the same values as duty_percent[], non-zero
> > +                      * for disconnected fans too.
> > +                      */
> > +                     u8 duty_percent_dup[FAN_CHANNELS_MAX];
> > +                     /* "Case Noise" in db */
> > +                     u8 noise_db;
> > +             } __packed fan_speed;
> > +             /* When type == FAN_STATUS_REPORT_VOLTAGE */
> > +             struct {
> > +                     /*
> > +                      * Voltage, in millivolts. Non-zero even when fan is
> > +                      * not connected.
> > +                      */
> > +                     __le16 fan_in[FAN_CHANNELS_MAX];
> > +                     /*
> > +                      * Current, in milliamperes. Near-zero when
> > +                      * disconnected.
> > +                      */
> > +                     __le16 fan_current[FAN_CHANNELS_MAX];
> > +             } __packed fan_voltage;
> > +     } __packed;
> > +} __packed;
> > +
> > +#define OUTPUT_REPORT_SIZE 64
> > +
> > +enum {
> > +     OUTPUT_REPORT_ID_INIT_COMMAND = 0x60,
> > +     OUTPUT_REPORT_ID_SET_FAN_SPEED = 0x62,
> > +};
> > +
> > +enum {
> > +     INIT_COMMAND_SET_UPDATE_INTERVAL = 0x02,
> > +     INIT_COMMAND_DETECT_FANS = 0x03,
> > +};
> > +
> > +/*
> > + * This output report sets pwm duty cycle/target fan speed for one or more
> > + * channels.
> > + */
> > +struct set_fan_speed_report {
> > +     /* report_id should be OUTPUT_REPORT_ID_SET_FAN_SPEED = 0x62 */
> > +     u8 report_id;
> > +     /* Should be 0x01 */
> > +     u8 magic;
> > +     /* To change fan speed on i-th channel, set i-th bit here */
> > +     u8 channel_bit_mask;
> > +     /*
> > +      * Fan duty cycle/target speed in percent. For voltage-controlled fans,
> > +      * the minimal voltage (duty_percent = 1) is about 9V.
> > +      * Setting duty_percent to 0 (if the channel is selected in
> > +      * channel_bit_mask) turns off the fan completely (regardless of the
> > +      * control mode).
> > +      */
> > +     u8 duty_percent[FAN_CHANNELS_MAX];
> > +} __packed;
> > +
> > +struct drvdata {
> > +     struct hid_device *hid;
> > +     struct device *hwmon;
> > +
> > +     u8 fan_duty_percent[FAN_CHANNELS];
> > +     u16 fan_rpm[FAN_CHANNELS];
> > +     bool pwm_status_received;
> > +
> > +     u16 fan_in[FAN_CHANNELS];
> > +     u16 fan_curr[FAN_CHANNELS];
> > +     bool voltage_status_received;
> > +
> > +     u8 fan_type[FAN_CHANNELS];
> > +     bool fan_config_received;
> > +
> > +     /*
> > +      * wq is used to wait for *_received flags to become true.
> > +      * All accesses to *_received flags and fan_* arrays are performed with
> > +      * wq.lock held.
> > +      */
> > +     wait_queue_head_t wq;
> > +     /*
> > +      * mutex is used to:
> > +      * 1) Prevent concurrent conflicting changes to update interval and pwm
> > +      * values (after sending an output hid report, the corresponding field
> > +      * in drvdata must be updated, and only then new output reports can be
> > +      * sent).
> > +      * 2) Synchronize access to output_buffer (well, the buffer is here,
> > +      * because synchronization is necessary anyway - so why not get rid of
> > +      * a kmalloc?).
> > +      */
> > +     struct mutex mutex;
> > +     long update_interval;
> > +     u8 output_buffer[OUTPUT_REPORT_SIZE];
> > +};
> > +
> > +static long scale_pwm_value(long val, long orig_max, long new_max)
> > +{
> > +     if (val <= 0)
> > +             return 0;
> > +
> > +     /*
> > +      * Positive values should not become zero: 0 completely turns off the
> > +      * fan.
> > +      */
> > +     return max(1L, DIV_ROUND_CLOSEST(min(val, orig_max) * new_max, orig_max));
> > +}
> > +
> > +static void handle_fan_config_report(struct drvdata *drvdata, void *data, int size)
> > +{
> > +     struct fan_config_report *report = data;
> > +     int i;
> > +
> > +     if (size < sizeof(struct fan_config_report))
> > +             return;
> > +
> > +     if (report->magic != 0x03)
> > +             return;
> > +
> > +     spin_lock(&drvdata->wq.lock);
> > +
> > +     for (i = 0; i < FAN_CHANNELS; i++)
> > +             drvdata->fan_type[i] = report->fan_type[i];
> > +
> > +     drvdata->fan_config_received = true;
> > +     wake_up_all_locked(&drvdata->wq);
> > +     spin_unlock(&drvdata->wq.lock);
> > +}
> > +
> > +static void handle_fan_status_report(struct drvdata *drvdata, void *data, int size)
> > +{
> > +     struct fan_status_report *report = data;
> > +     int i;
> > +
> > +     if (size < sizeof(struct fan_status_report))
> > +             return;
> > +
> > +     spin_lock(&drvdata->wq.lock);
> > +
> > +     /*
> > +      * The device sends INPUT_REPORT_ID_FAN_CONFIG = 0x61 report in response
> > +      * to "detect fans" command. Only accept other data after getting 0x61,
> > +      * to make sure that fan detection is complete. In particular, fan
> > +      * detection resets pwm values.
> > +      */
> > +     if (!drvdata->fan_config_received) {
> > +             spin_unlock(&drvdata->wq.lock);
> > +             return;
> > +     }
> > +
> > +     for (i = 0; i < FAN_CHANNELS; i++) {
> > +             if (drvdata->fan_type[i] == report->fan_type[i])
> > +                     continue;
> > +
> > +             /*
> > +              * This should not happen (if my expectations about the device
> > +              * are correct).
> > +              *
> > +              * Even if the userspace sends fan detect command through
> > +              * hidraw, fan config report should arrive first.
> > +              */
> > +             hid_warn_once(drvdata->hid,
> > +                           "Fan %d type changed unexpectedly from %d to %d",
> > +                           i, drvdata->fan_type[i], report->fan_type[i]);
> > +             drvdata->fan_type[i] = report->fan_type[i];
> > +     }
> > +
> > +     switch (report->type) {
> > +     case FAN_STATUS_REPORT_SPEED:
> > +             for (i = 0; i < FAN_CHANNELS; i++) {
> > +                     drvdata->fan_rpm[i] =
> > +                             get_unaligned_le16(&report->fan_speed.fan_rpm[i]);
> > +                     drvdata->fan_duty_percent[i] =
> > +                             report->fan_speed.duty_percent[i];
> > +             }
> > +
> > +             drvdata->pwm_status_received = true;
> > +             wake_up_all_locked(&drvdata->wq);
> > +             break;
> > +
> > +     case FAN_STATUS_REPORT_VOLTAGE:
> > +             for (i = 0; i < FAN_CHANNELS; i++) {
> > +                     drvdata->fan_in[i] =
> > +                             get_unaligned_le16(&report->fan_voltage.fan_in[i]);
> > +                     drvdata->fan_curr[i] =
> > +                             get_unaligned_le16(&report->fan_voltage.fan_current[i]);
> > +             }
> > +
> > +             drvdata->voltage_status_received = true;
> > +             wake_up_all_locked(&drvdata->wq);
> > +             break;
> > +     }
> > +
> > +     spin_unlock(&drvdata->wq.lock);
> > +}
> > +
> > +static umode_t hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> > +                             u32 attr, int channel)
> > +{
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_input:
> > +             case hwmon_pwm_enable:
> > +                     return 0644;
> > +
> > +             default:
> > +                     return 0444;
> > +             }
> > +
> > +     case hwmon_chip:
> > +             switch (attr) {
> > +             case hwmon_chip_update_interval:
> > +                     return 0644;
> > +
> > +             default:
> > +                     return 0444;
> > +             }
> > +
> > +     default:
> > +             return 0444;
> > +     }
> > +}
> > +
> > +static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > +                   u32 attr, int channel, long *val)
> > +{
> > +     struct drvdata *drvdata = dev_get_drvdata(dev);
> > +     int res = -EINVAL;
> > +
> > +     if (type == hwmon_chip) {
> > +             switch (attr) {
> > +             case hwmon_chip_update_interval:
> > +                     *val = READ_ONCE(drvdata->update_interval);
> > +                     return 0;
> > +
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     spin_lock_irq(&drvdata->wq.lock);
> > +
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             /*
> > +              * fancontrol:
> > +              * 1) remembers pwm* values when it starts
> > +              * 2) needs pwm*_enable to be 1 on controlled fans
> > +              * So make sure we have correct data before allowing pwm* reads.
> > +              */
> > +             switch (attr) {
> > +             case hwmon_pwm_enable:
> > +                     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                                               drvdata->fan_config_received);
> > +
> > +                     if (res == 0)
> > +                             *val = drvdata->fan_type[channel] != FAN_TYPE_NONE;
> > +
> > +                     break;
> > +
> > +             case hwmon_pwm_mode:
> > +                     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                                               drvdata->fan_config_received);
> > +
> > +                     if (res == 0)
> > +                             *val = drvdata->fan_type[channel] == FAN_TYPE_PWM;
> > +
> > +                     break;
> > +
> > +             case hwmon_pwm_input:
> > +                     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                                               drvdata->pwm_status_received);
> > +
> > +                     if (res == 0)
> > +                             *val = scale_pwm_value(drvdata->fan_duty_percent[channel],
> > +                                                    100, 255);
> > +
> > +                     break;
> > +             }
> > +             break;
> > +
> > +     case hwmon_fan:
> > +             /*
> > +              * It's not strictly necessary to wait for *_received in the
> > +              * remaining cases (fancontrol doesn't care about them). But I'm
> > +              * doing it to have consistent behavior.
> > +              */
> > +             if (attr == hwmon_fan_input) {
> > +                     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                                               drvdata->pwm_status_received);
> > +
> > +                     if (res == 0)
> > +                             *val = drvdata->fan_rpm[channel];
> > +             }
> > +             break;
> > +
> > +     case hwmon_in:
> > +             if (attr == hwmon_in_input) {
> > +                     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                                               drvdata->voltage_status_received);
> > +
> > +                     if (res == 0)
> > +                             *val = drvdata->fan_in[channel];
> > +             }
> > +             break;
> > +
> > +     case hwmon_curr:
> > +             if (attr == hwmon_curr_input) {
> > +                     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                                               drvdata->voltage_status_received);
> > +
> > +                     if (res == 0)
> > +                             *val = drvdata->fan_curr[channel];
> > +             }
> > +             break;
> > +
> > +     default:
> > +             break;
> > +     }
> > +
> > +     spin_unlock_irq(&drvdata->wq.lock);
> > +     return res;
> > +}
> > +
> > +static int send_output_report(struct drvdata *drvdata, const void *data,
> > +                           size_t data_size)
> > +{
> > +     int ret;
> > +
> > +     lockdep_assert_held(&drvdata->mutex);
> > +
> This is a local function, and it is easy to prove that the lock
> is held where needed. lockdep_assert_held() is therefore unnecessary.

Ok, I'll remove it.

>
> > +     if (data_size > sizeof(drvdata->output_buffer))
> > +             return -EINVAL;
> > +
> > +     memcpy(drvdata->output_buffer, data, data_size);
> > +
> > +     if (data_size < sizeof(drvdata->output_buffer))
> > +             memset(drvdata->output_buffer + data_size, 0,
> > +                    sizeof(drvdata->output_buffer) - data_size);
> > +
> > +     ret = hid_hw_output_report(drvdata->hid, drvdata->output_buffer,
> > +                                sizeof(drvdata->output_buffer));
> > +     return ret < 0 ? ret : 0;
> > +}
> > +
> > +static int set_pwm(struct drvdata *drvdata, int channel, long val)
> > +{
> > +     int ret;
> > +     u8 duty_percent = scale_pwm_value(val, 255, 100);
> > +
> > +     struct set_fan_speed_report report = {
> > +             .report_id = OUTPUT_REPORT_ID_SET_FAN_SPEED,
> > +             .magic = 1,
> > +             .channel_bit_mask = 1 << channel
> > +     };
> > +
> > +     ret = mutex_lock_interruptible(&drvdata->mutex);
> > +     if (ret)
> > +             return ret;
> > +
> > +     report.duty_percent[channel] = duty_percent;
> > +     ret = send_output_report(drvdata, &report, sizeof(report));
> > +
> > +     /*
> > +      * pwmconfig and fancontrol scripts expect pwm writes to take effect
> > +      * immediately (i. e. read from pwm* sysfs should return the value
> > +      * written into it). The device seems to always accept pwm values - even
> > +      * when there is no fan connected - so update pwm status without waiting
> > +      * for a report, to make pwmconfig and fancontrol happy. Worst case -
> > +      * if the device didn't accept new pwm value for some reason (never seen
> > +      * this in practice) - it will be reported incorrectly only until next
> > +      * update. This avoids "fan stuck" messages from pwmconfig, and
> > +      * fancontrol setting fan speed to 100% during shutdown.
> > +      */
> > +     if (ret == 0) {
> > +             spin_lock_bh(&drvdata->wq.lock);
> > +             drvdata->fan_duty_percent[channel] = duty_percent;
> > +             spin_unlock_bh(&drvdata->wq.lock);
> > +     }
> > +
> > +     mutex_unlock(&drvdata->mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * Workaround for fancontrol/pwmconfig trying to write to pwm*_enable even if it
> > + * already is 1.
> > + */
> > +static int set_pwm_enable(struct drvdata *drvdata, int channel, long val)
> > +{
> > +     long expected_val;
> > +     int res;
> > +
> > +     spin_lock_irq(&drvdata->wq.lock);
> > +
> > +     res = wait_event_interruptible_locked_irq(drvdata->wq,
> > +                                               drvdata->fan_config_received);
> > +
> > +     if (res == 0)
> > +             expected_val = drvdata->fan_type[channel] != FAN_TYPE_NONE;
> > +
> > +     spin_unlock_irq(&drvdata->wq.lock);
> > +
> > +     if (res)
> > +             return res;
> > +
> > +     return (val == expected_val) ? 0 : -EOPNOTSUPP;
> > +}
> > +
> > +/*
> > + * Control byte      | Actual update interval
> > + * 0xff              | 65.5
> > + * 0xf7              | 63.46
> > + * 0x7f              | 32.74
> > + * 0x3f              | 16.36
> > + * 0x1f              | 8.17
> > + * 0x0f              | 4.07
> > + * 0x07              | 2.02
> > + * 0x03              | 1.00
> > + * 0x02              | 0.744
> > + * 0x01              | 0.488
> > + * 0x00              | 0.25
>
> Update interval in what units ? Seconds ?

Yep, it's in seconds, I'll fix the comment.

>
> > + */
> > +static u8 update_interval_to_control_byte(long interval)
> > +{
> > +     if (interval <= 250)
> > +             return 0;
> > +
> > +     return clamp_val(1 + DIV_ROUND_CLOSEST(interval - 488, 256), 0, 255);
> > +}
> > +
> > +static long control_byte_to_update_interval(u8 control_byte)
> > +{ w
> > +     if (control_byte == 0)
> > +             return 250;
> > +
> > +     return 488 + (control_byte - 1) * 256;
> > +}
> > +
> > +static int set_update_interval(struct drvdata *drvdata, long val)
> > +{
> > +     u8 control = update_interval_to_control_byte(val);
> > +     u8 report[] = {
> > +             OUTPUT_REPORT_ID_INIT_COMMAND,
> > +             INIT_COMMAND_SET_UPDATE_INTERVAL,
> > +             0x01,
> > +             0xe8,
> > +             control,
> > +             0x01,
> > +             0xe8,
> > +             control,
> > +     };
> > +     int ret;
> > +
> > +     ret = send_output_report(drvdata, report, sizeof(report));
> > +     if (ret == 0)
> > +             WRITE_ONCE(drvdata->update_interval,
> > +                        control_byte_to_update_interval(control));
>
> Please explain why READ_ONCE / WRITE_ONCE is needed.

hwmon_read accesses drvdata->update_interval without any synchronization.

After reading ktsan wiki:
https://github.com/google/ktsan/wiki/READ_ONCE-and-WRITE_ONCE I
thought it's the correct thing to do.

>
> > +
> > +     return ret;
> > +}
> > +
> > +static int init_device(struct drvdata *drvdata, long update_interval)
> > +{
> > +     int ret;
> > +     u8 detect_fans_report[] = {
> > +             OUTPUT_REPORT_ID_INIT_COMMAND,
> > +             INIT_COMMAND_DETECT_FANS,
> > +     };
> > +
> > +     /*
> > +      * This lock is here only to avoid lockdep warning. Am I using lockdep
> > +      * incorrectly?
> > +      * There's (currently) no way init_device() could be called multiple
> > +      * times concurrently (or concurrently with other functions that lock
> > +      * the mutex).
> > +      */
>
> Self-inflicted damage. In send_output_report(), there is a call
> to lockdep_assert_held(). Of course that will fire if the lock
> is not held.

I understand the call chain. I meant to ask whether I should use
lockdep assert in this case.

I'll remove lockdep assert, and then this lock+unlock too.

>
> > +     mutex_lock(&drvdata->mutex);
> > +
> > +     spin_lock_bh(&drvdata->wq.lock);
> > +     drvdata->fan_config_received = false;
> > +     drvdata->pwm_status_received = false;
> > +     drvdata->voltage_status_received = false;
> > +     spin_unlock_bh(&drvdata->wq.lock);
>
> Per the logic used above, those spinlocks are unnecessary.

Resetting these flags to 'false' should be necessary only in
hid_reset_resume, so I should probably move them there.

I want to be sure that these stores are ordered wrt other accesses to
these flags - i.e. that following hid_raw_event, attribute reads will
see 'false', even if performed right after resume from suspend.

Is it guaranteed without locking the spinlock (or adding other barriers)?

Also, I like to be able to write "these fields are protected by
wq.lock", without exceptions - a simple, trivial pattern.

>
> > +
> > +     ret = send_output_report(drvdata, detect_fans_report,
> > +                              sizeof(detect_fans_report));
> > +
> > +     if (ret == 0)
> > +             ret = set_update_interval(drvdata, update_interval);
> > +
>
> Please use standard error handling throughout.
>         if (ret)
>                 goto unlock;
>         ....
>

Ok, will do.

> > +     mutex_unlock(&drvdata->mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> > +                    u32 attr, int channel, long val)
> > +{
> > +     struct drvdata *drvdata = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             switch (attr) {
> > +             case hwmon_pwm_enable:
> > +                     return set_pwm_enable(drvdata, channel, val);
> > +
> > +             case hwmon_pwm_input:
> > +                     return set_pwm(drvdata, channel, val);
> > +
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +
> > +     case hwmon_chip:
> > +             switch (attr) {
> > +             case hwmon_chip_update_interval:
> > +                     ret = mutex_lock_interruptible(&drvdata->mutex);
> > +                     if (ret)
> > +                             return ret;
> > +
> > +                     ret = set_update_interval(drvdata, val);
> > +
> > +                     mutex_unlock(&drvdata->mutex);
> > +                     return ret;
> > +
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> > +                          u32 attr, int channel, const char **str)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             *str = fan_label[channel];
> > +             return 0;
> > +     case hwmon_curr:
> > +             *str = curr_label[channel];
> > +             return 0;
> > +     case hwmon_in:
> > +             *str = in_label[channel];
> > +             return 0;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static const struct hwmon_ops hwmon_ops = {
> > +     .is_visible = hwmon_is_visible,
> > +     .read = hwmon_read,
> > +     .read_string = hwmon_read_string,
> > +     .write = hwmon_write,
> > +};
> > +
> > +static const struct hwmon_channel_info *channel_info[] = {
> > +     HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> > +                        HWMON_F_INPUT | HWMON_F_LABEL,
> > +                        HWMON_F_INPUT | HWMON_F_LABEL),
> > +     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE,
> > +                        HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE,
> > +                        HWMON_PWM_INPUT | HWMON_PWM_MODE | HWMON_PWM_ENABLE),
> > +     HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
> > +                        HWMON_I_INPUT | HWMON_I_LABEL,
> > +                        HWMON_I_INPUT | HWMON_I_LABEL),
> > +     HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_LABEL,
> > +                        HWMON_C_INPUT | HWMON_C_LABEL,
> > +                        HWMON_C_INPUT | HWMON_C_LABEL),
> > +     HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
> > +     NULL
> > +};
> > +
> > +static const struct hwmon_chip_info chip_info = {
> > +     .ops = &hwmon_ops,
> > +     .info = channel_info,
> > +};
> > +
> > +static int hid_raw_event(struct hid_device *hdev, struct hid_report *report,
> > +                      u8 *data, int size)
> > +{
> > +     struct drvdata *drvdata = hid_get_drvdata(hdev);
> > +     u8 report_id = *data;
> > +
> > +     switch (report_id) {
> > +     case INPUT_REPORT_ID_FAN_CONFIG:
> > +             handle_fan_config_report(drvdata, data, size);
> > +             break;
> > +
> > +     case INPUT_REPORT_ID_FAN_STATUS:
> > +             handle_fan_status_report(drvdata, data, size);
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int hid_reset_resume(struct hid_device *hdev)
> > +{
> > +     struct drvdata *drvdata = hid_get_drvdata(hdev);
> > +
> > +     return init_device(drvdata, READ_ONCE(drvdata->update_interval));
> > +}
> > +
> > +static int hid_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > +{
> > +     struct drvdata *drvdata;
> > +     int ret;
> > +
> > +     drvdata = devm_kzalloc(&hdev->dev, sizeof(struct drvdata), GFP_KERNEL);
> > +     if (!drvdata)
> > +             return -ENOMEM;
> > +
> > +     drvdata->hid = hdev;
> > +     hid_set_drvdata(hdev, drvdata);
> > +
> > +     init_waitqueue_head(&drvdata->wq);
> > +
> > +     mutex_init(&drvdata->mutex);
> > +     devm_add_action(&hdev->dev, (void (*)(void *))mutex_destroy,
> > +                     &drvdata->mutex);
>
> If you are using devm_add_action(), use it for all functions needing
> cleanup, not just for one.

hid_hw_stop() is the default remove callback. As far as I understand,
if added with devm_add_action(), hid_hw_close() will be called after
remove callback, i. e. after hid_hw_stop(). But the correct order
seems to be 1) hid_hw_close 2) hid_hw_stop. Also, hwmon device should
(ideally) be unregistered before hid_hw_stop().

I can move mutex_destroy() into remove callback (and then it'll also
have to be duplicated at the end of hid_probe(), in error exit path).


>
> > +
> > +     ret = hid_parse(hdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = hid_hw_open(hdev);
> > +     if (ret)
> > +             goto out_hw_stop;
> > +
> > +     hid_device_io_start(hdev);
> > +
> > +     init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> > +
> > +     drvdata->hwmon =
> > +             hwmon_device_register_with_info(&hdev->dev,
> > +                                             "nzxt_rgb_fan_controller",
> > +                                             drvdata, &chip_info, NULL);
> > +     if (IS_ERR(drvdata->hwmon)) {
> > +             ret = PTR_ERR(drvdata->hwmon);
> > +             goto out_hw_close;
> > +     }
> > +
> > +     return 0;
> > +
> > +out_hw_close:
> > +     hid_hw_close(hdev);
> > +
> > +out_hw_stop:
> > +     hid_hw_stop(hdev);
> > +     return ret;
> > +}
> > +
> > +static void hid_remove(struct hid_device *hdev)
> > +{
> > +     struct drvdata *drvdata = hid_get_drvdata(hdev);
> > +
> > +     hwmon_device_unregister(drvdata->hwmon);
> > +
> > +     hid_hw_close(hdev);
> > +     hid_hw_stop(hdev);
> > +}
> > +
> > +static const struct hid_device_id hid_id_table[] = {
> > +     { HID_USB_DEVICE(0x1e71, 0x2006) }, /* NZXT Smart Device V2 */
> > +     { HID_USB_DEVICE(0x1e71, 0x200d) }, /* NZXT Smart Device V2 */
> > +     { HID_USB_DEVICE(0x1e71, 0x2009) }, /* NZXT RGB & Fan Controller */
> > +     { HID_USB_DEVICE(0x1e71, 0x200e) }, /* NZXT RGB & Fan Controller */
> > +     { HID_USB_DEVICE(0x1e71, 0x2010) }, /* NZXT RGB & Fan Controller */
> > +     {},
> > +};
> > +
> > +static struct hid_driver hid_driver = {
> > +     .name = "nzxt_rgb_fan_controller",
> > +     .id_table = hid_id_table,
> > +     .probe = hid_probe,
> > +     .remove = hid_remove,
> > +     .raw_event = hid_raw_event,
> > +#ifdef CONFIG_PM
> > +     .reset_resume = hid_reset_resume,
> > +#endif
> > +};
> > +
> > +static int __init nzxt_rgb_fan_controller_init(void)
> > +{
> > +     return hid_register_driver(&hid_driver);
> > +}
> > +
> > +static void __exit nzxt_rgb_fan_controller_exit(void)
> > +{
> > +     hid_unregister_driver(&hid_driver);
> > +}
> > +
> > +MODULE_DEVICE_TABLE(hid, hid_id_table);
> > +MODULE_AUTHOR("Aleksandr Mezin <mezin.alexander@gmail.com>");
> > +MODULE_DESCRIPTION("Driver for NZXT RGB & Fan Controller/Smart Device V2");
> > +MODULE_LICENSE("GPL");
> > +
> > +/*
> > + * With module_init()/module_hid_driver() and the driver built into the kernel:
> > + *
> > + * Driver 'nzxt_rgb_fan_controller' was unable to register with bus_type 'hid'
> > + * because the bus was not initialized.
> > + */
> > +late_initcall(nzxt_rgb_fan_controller_init);
> > +module_exit(nzxt_rgb_fan_controller_exit);
> > --
> > 2.32.0
> >
