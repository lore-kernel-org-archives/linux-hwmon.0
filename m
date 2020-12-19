Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E387AC0018C
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 19:16:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD49A2343E
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 19:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbgLSTPy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Dec 2020 14:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727424AbgLSTPy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Dec 2020 14:15:54 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F85C0613CF
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 11:15:05 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s2so6901346oij.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 11:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cvg0mMj3/9iAeAXAFseY1rufUcEGU4I4FlJPpr/ziaQ=;
        b=O6O8HayU6qcp39t0RkxnUqAFXQWwffNedWehI2s+6LznXlcp7w92O/Tnx9pblvo11N
         8r+F2OS9aB/sK/Q4De7Bnd/baWQ1WwEJsGyICNRGrBD2f6YByuapdVWn7SY/AKEQhxIm
         RcrljaielMhQuBOUnbQdedXMuATNdIh2F96lTfd2820KVLwG4fDRohdj7o51DDVGk3/l
         00XBog7Vz9rrUGUzxctruYIykGvtZFteE+2c9wz+lsIIypLyPF3rl3ejvtZ3YvfZ5O6f
         DWkdTK/jcQUzrfTQZktcDn/nWMNTT0I1BbUENM/f6I9vMXuqmDiXXXhcAZc4mLUKWrJ7
         3Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cvg0mMj3/9iAeAXAFseY1rufUcEGU4I4FlJPpr/ziaQ=;
        b=sEjqRhbJdJ/TpKuDxX7612JeEYeee33euUvCqEOS7emOg+xoKZRhe7IeOjP1aP6sSO
         weCRdLWsOkHv+4fpTjyy7Va0jsDqb+A4ARqWaOPNZUX2iMEdwpF1/fvZhxcIqNy11km2
         UyUlo4b/UqP/uL3NX0Bv0gPxJdDK/cyGgfJFEtmIIb13kScKe9Z6YQZZsNOn/Wn2ZW/V
         Q0rmHr07uPL7UiHA58BMNj6RHa5/48plrN063Bj1br6TcRQzO8HKHHXK6YqlmoSOsrSz
         fVyQGZ6xzhbtKxh6SpX8kBDaixmVzyfezcU7haXT29XbLd7MKa7D8FD60ywSsGXRJwDS
         AQlA==
X-Gm-Message-State: AOAM533NZb+Cge/vUkPI3e72H2TxDPOwYiW5viKxjauyeTPeyaSShUfS
        C0XrafLqEk/ZanWphrMGgB3lBDL831Ap5oIax0BD/g==
X-Google-Smtp-Source: ABdhPJzXsvRFkrBUiWRyzBJrbEAD5IQQM8CcX/hmvFzsHIdc2MVX+AYWl3cGSLinoNoh5ylUZurwMbx5NR+P/kbGRfs=
X-Received: by 2002:aca:75cc:: with SMTP id q195mr6669734oic.173.1608405305318;
 Sat, 19 Dec 2020 11:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20201218130329.258254-1-robert.marko@sartura.hr>
 <20201218130329.258254-2-robert.marko@sartura.hr> <9dd93c41-aa11-ebfb-7f72-0ee188268976@roeck-us.net>
In-Reply-To: <9dd93c41-aa11-ebfb-7f72-0ee188268976@roeck-us.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sat, 19 Dec 2020 20:14:54 +0100
Message-ID: <CA+HBbNGjTD+DYeKEix5D4EfudW8-C-r4uft2hy+OBykN7eXfeg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: add Texas Instruments TPS23861 driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 18, 2020 at 3:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/18/20 5:03 AM, Robert Marko wrote:
> > Add basic monitoring support as well as port on/off control for Texas
> > Instruments TPS23861 PoE PSE IC.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> >  drivers/hwmon/Kconfig    |  11 ++
> >  drivers/hwmon/Makefile   |   1 +
> >  drivers/hwmon/tps23861.c | 398 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 410 insertions(+)
> >  create mode 100644 drivers/hwmon/tps23861.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index a850e4f0e0bd..3368ecfa7a9c 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1102,6 +1102,17 @@ config SENSORS_TC654
> >         This driver can also be built as a module. If so, the module
> >         will be called tc654.
> >
> > +config SENSORS_TPS23861
> > +     tristate "Texas Instruments TPS23861 PoE PSE"
> > +     depends on I2C
> > +     select REGMAP_I2C
> > +     help
> > +       If you say yes here you get support for Texas Instruments
> > +       TPS23861 802.3at PoE PSE chips.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called tps23861.
> > +
> >  config SENSORS_MENF21BMC_HWMON
> >       tristate "MEN 14F021P00 BMC Hardware Monitoring"
> >       depends on MFD_MENF21BMC
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 9db2903b61e5..7493e9d5dc43 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -141,6 +141,7 @@ obj-$(CONFIG_SENSORS_MAX31790)    += max31790.o
> >  obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
> >  obj-$(CONFIG_SENSORS_MCP3021)        += mcp3021.o
> >  obj-$(CONFIG_SENSORS_TC654)  += tc654.o
> > +obj-$(CONFIG_SENSORS_TPS23861)       += tps23861.o
> >  obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
> >  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
> >  obj-$(CONFIG_SENSORS_MR75203)        += mr75203.o
> > diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
> > new file mode 100644
> > index 000000000000..e8b614267084
> > --- /dev/null
> > +++ b/drivers/hwmon/tps23861.c
> > @@ -0,0 +1,398 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Driver for the TI TPS23861 PoE PSE.
> > + *
> > + * Author: Robert Marko <robert.marko@sartura.hr>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/regmap.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
>
> Alphabetic include file order, please.

Done in v2.
>
> [ ... ]
>
> > +     hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
> > +                                                        data, tps23861_groups);
>
> Please rework to use devm_hwmon_device_register_with_info().

Done in v2.

Thanks for the remarks.

Regards,
Robert
>
> Thanks,
> Guenter
