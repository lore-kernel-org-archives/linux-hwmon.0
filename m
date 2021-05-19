Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6938C43470
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 12:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84063613C0
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 12:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240872AbhESMkF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 May 2021 08:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353410AbhESMkE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 May 2021 08:40:04 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5248EC06175F
        for <linux-hwmon@vger.kernel.org>; Wed, 19 May 2021 05:38:44 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n40so12843037ioz.4
        for <linux-hwmon@vger.kernel.org>; Wed, 19 May 2021 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kafBynMzDoz4nqFg3vduX4WhWwbA2JsB1SuSwUJbPFU=;
        b=EyWCaJfeBSRLgGWYIeqJ4DWxWXWxReCQht22umInfDThiKzpPoflBxQ80urzHAdXwy
         leb6/HStJ4HsRuOCNn5KkLbBv70GaNbZWE+7ncgiobUtHqWJdbpzkHyDXMytl90Gbuez
         iJQ3otKm0L6WEnTVZwnt2isohP3YZaVNJnrN3AUcFdrrnGO0m1frIJXSQfUZ9f3GY+o1
         ZUbGCwLTN9c19v0u2HQPBgzwypzJOFJaCT5Jm2LQnBTLlS30H7GrAKramRInjet9lUw+
         Yz8ns4Z2XTpuCwuOFnABPt28b1FS3B1AbyTEPB32qbDCPcIOs+6AuWeG7mdSucp/wQ/Y
         h1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kafBynMzDoz4nqFg3vduX4WhWwbA2JsB1SuSwUJbPFU=;
        b=f+HVdmt3ILFOwv9M393pmPgoZf67ZPY4GvHLzOq+VDUUZHWbIRIpkc4hKLeib6Wn3d
         uVw33h1lUf2hUCiZuG7xpwoFdhtvDZAJvv4MCTWHzoUmZShvdV6uTeuV9G/RfOKtuGBz
         zQGPXFdfr7YOadN5dBFJqyS3iP/zy1jULufR84ckWx+zKYvKkMxwwtApkjEfgwmb4VdY
         AeZLPeOjvqRg5d+9xTZShEfyA7d3/okqD+/XUe3eBrgZJ3eKS7iTvZPXhWP4qSRwcWO1
         weMsDR2xt0racVMbbAMnW89PlJQHw1qx+DERQmbgdMnw2/jRo8AGQ2cGqesBekubaCDQ
         A4mg==
X-Gm-Message-State: AOAM5325BPt3/sDlhr/6XuXNc1lZuE1PSa8/GVU9L1cmQqkeK9SO+8v4
        4ua5lWUxq2n8MqPMy1Tvg3e6hxpKgm6NxqE1b4Ho+w==
X-Google-Smtp-Source: ABdhPJx+RyNkpN7dXUHF89QU1psD02tQMe7Bf3mCVriAigvbvulN2gsvq1Xkghvoq1t8e6Lzo6ACvQ+nC9Z9FL/hSic=
X-Received: by 2002:a6b:d918:: with SMTP id r24mr9529633ioc.25.1621427923666;
 Wed, 19 May 2021 05:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210430132735.127342-1-robert.marko@sartura.hr> <20210430134810.GA2714262@roeck-us.net>
In-Reply-To: <20210430134810.GA2714262@roeck-us.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 19 May 2021 14:38:32 +0200
Message-ID: <CA+HBbNH+gQOmu_Ho0ivFuGHdu0zBtOrr1474z+7FA1zmNb4bug@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (pmbus) Add driver for Delta DPS-920AB PSU
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 30, 2021 at 3:48 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Apr 30, 2021 at 03:27:33PM +0200, Robert Marko wrote:
> > This adds support for the Delta DPS-920AB PSU.
> >
> > Only missing feature is fan control which the PSU supports.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  Documentation/hwmon/dps920ab.rst | 80 ++++++++++++++++++++++++++++++++
> >  Documentation/hwmon/index.rst    |  1 +
> >  drivers/hwmon/pmbus/Kconfig      |  9 ++++
> >  drivers/hwmon/pmbus/Makefile     |  1 +
> >  drivers/hwmon/pmbus/dps920ab.c   | 63 +++++++++++++++++++++++++
> >  5 files changed, 154 insertions(+)
> >  create mode 100644 Documentation/hwmon/dps920ab.rst
> >  create mode 100644 drivers/hwmon/pmbus/dps920ab.c
> >
> > diff --git a/Documentation/hwmon/dps920ab.rst b/Documentation/hwmon/dps920ab.rst
> > new file mode 100644
> > index 000000000000..df0aef530c7e
> > --- /dev/null
> > +++ b/Documentation/hwmon/dps920ab.rst
> > @@ -0,0 +1,80 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +Kernel driver dps920ab
> > +========================
> > +
> > +Supported chips:
> > +
> > +  * Delta DPS920AB
> > +
> > +    Prefix: 'dps920ab'
> > +
> > +    Addresses scanned: -
> > +
> > +Authors:
> > +    Robert Marko <robert.marko@sartura.hr>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +This driver implements support for Delta DPS920AB 920W 54V DC single output
> > +power supply with PMBus support.
> > +
> > +The driver is a client driver to the core PMBus driver.
> > +Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> > +
> > +
> > +Usage Notes
> > +-----------
> > +
> > +This driver does not auto-detect devices. You will have to instantiate the
> > +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> > +details.
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +======================= ======================================================
> > +curr1_label          "iin"
> > +curr1_input          Measured input current
> > +curr1_crit           Critical maximum current
> > +curr1_crit_alarm     Current critical high alarm
> > +
> > +curr2_label          "iout1"
> > +curr2_input          Measured output current
> > +curr2_crit           Critical maximum current
> > +curr2_crit_alarm     Current critical high alarm
> > +
> > +in1_label            "vin"
> > +in1_input            Measured input voltage
> > +in1_lcrit            Critical minimum input voltage
> > +in1_lcrit_alarm              Input voltage critical low alarm
> > +in1_crit             Critical maximum input voltage
> > +in1_crit_alarm               Input voltage critical high alarm
> > +
> > +in2_label            "vout1"
> > +in2_input            Measured output voltage
> > +in2_lcrit            Critical minimum output voltage
> > +in2_lcrit_alarm              Output voltage critical low alarm
> > +in2_crit             Critical maximum output voltage
> > +in2_crit_alarm               Output voltage critical high alarm
> > +
> > +power1_label         "pin"
> > +power1_input         Measured input power
> > +power1_alarm         Input power high alarm
> > +
> > +power2_label         "pout1"
> > +power2_input         Measured output power
> > +
> > +temp[1-2]_input              Measured temperature
> > +temp[1-2]_crit               Critical high temperature
> > +temp[1-2]_crit_alarm Chip temperature critical high alarm
> > +temp[1-2]_max                Maximum temperature
> > +temp[1-2]_max_alarm  Chip temperature high alarm
> > +
> > +fan1_alarm           Fan 1 warning.
> > +fan1_fault           Fan 1 fault.
> > +fan1_input           Fan 1 speed in RPM.
> > +======================= ======================================================
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> > index 8d5a2df1ecb6..b24436f22052 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -54,6 +54,7 @@ Hardware Monitoring Kernel Drivers
> >     dell-smm-hwmon
> >     dme1737
> >     drivetemp
> > +   dps920ab
> >     ds1621
> >     ds620
> >     emc1403
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 32d2fc850621..865ade0aa205 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -66,6 +66,15 @@ config SENSORS_IBM_CFFPS
> >         This driver can also be built as a module. If so, the module will
> >         be called ibm-cffps.
> >
> > +config SENSORS_DPS920AB
> > +     tristate "Delta DPS920AB Power Supply"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Delta
> > +       DPS920AB Power Supplies.
> > +
> > +       This driver can also be built as a module. If so, the module will
> > +       be called dps920ab.
> > +
> >  config SENSORS_INSPUR_IPSPS
> >       tristate "INSPUR Power System Power Supply"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> > index 6a4ba0fdc1db..f59ba0123d68 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1266) += adm1266.o
> >  obj-$(CONFIG_SENSORS_ADM1275)        += adm1275.o
> >  obj-$(CONFIG_SENSORS_BEL_PFE)        += bel-pfe.o
> >  obj-$(CONFIG_SENSORS_IBM_CFFPS)      += ibm-cffps.o
> > +obj-$(CONFIG_SENSORS_DPS920AB)       += dps920ab.o
> >  obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
> >  obj-$(CONFIG_SENSORS_IR35221)        += ir35221.o
> >  obj-$(CONFIG_SENSORS_IR38064)        += ir38064.o
> > diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
> > new file mode 100644
> > index 000000000000..d579ed9f879c
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/dps920ab.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Driver for Delta DPS920AB PSU
> > + *
> > + * Copyright (C) 2021 Delta Networks, Inc.
> > + * Copyright (C) 2021 Sartura Ltd.
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include "pmbus.h"
> > +
> > +static struct pmbus_driver_info dps920ab_info = {
> > +     .pages = 1,
> > +
> > +     .format[PSC_VOLTAGE_IN] = linear,
> > +     .format[PSC_VOLTAGE_OUT] = linear,
> > +     .format[PSC_CURRENT_IN] = linear,
> > +     .format[PSC_CURRENT_OUT] = linear,
> > +     .format[PSC_POWER] = linear,
> > +     .format[PSC_FAN] = linear,
> > +     .format[PSC_TEMPERATURE] = linear,
> > +
> > +     .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN  |
> > +     PMBUS_HAVE_VOUT  | PMBUS_HAVE_STATUS_VOUT   |
> > +     PMBUS_HAVE_IOUT  | PMBUS_HAVE_STATUS_IOUT   |
> > +     PMBUS_HAVE_TEMP  | PMBUS_HAVE_TEMP2         |
> > +     PMBUS_HAVE_PIN   | PMBUS_HAVE_POUT          |
> > +     PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12  |
> > +     PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> > +};
> > +
> > +static int dps920ab_probe(struct i2c_client *client)
> > +{
> > +     if (!i2c_check_functionality(client->adapter,
> > +                                  I2C_FUNC_SMBUS_BYTE_DATA |
> > +                                  I2C_FUNC_SMBUS_WORD_DATA))
> > +             return -ENODEV;
>
> This check is done in pmbus_do_probe(), and repeating it here does not add
> any value.

Ok, makes sense.
>
> That makes me wonder: Is this driver needed in the first place, or could
> it be added to drivers/hwmon/pmbus/pmbus.c ?

It could be added as a generic driver, but that creates properties in
the sysfs that this thing
does not support like 3 voltage readings, 3 fans, and so on.

Is it okay to keep it as a separate driver then?

Regards,
Robert
>
> Thanks,
> Guenter
>
> > +
> > +     return pmbus_do_probe(client, &dps920ab_info);
> > +}
> > +
> > +static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
> > +     { .compatible = "delta,dps920ab", },
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, dps920ab_of_match);
> > +
> > +static struct i2c_driver dps920ab_driver = {
> > +     .driver = {
> > +                .name = "dps920ab",
> > +                .of_match_table = of_match_ptr(dps920ab_of_match),
> > +     },
> > +     .probe_new = dps920ab_probe,
> > +};
> > +
> > +module_i2c_driver(dps920ab_driver);
> > +
> > +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> > +MODULE_DESCRIPTION("PMBus driver for Delta DPS920AB PSU");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.31.1
> >



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
