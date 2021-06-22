Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70B2C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jun 2021 06:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B01A56128C
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jun 2021 06:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhFVGyy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Jun 2021 02:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVGyx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jun 2021 02:54:53 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257FAC061574;
        Mon, 21 Jun 2021 23:52:38 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id s19so12165959ioc.3;
        Mon, 21 Jun 2021 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0CTp97a81INgnIqFPyse78wOE/x/IFJ3vsFTafomRFk=;
        b=XLHhWf59qsx1TvhT5au+8GOzixpmc2h/A17s0SOaJutJLbQwoqcejCfZg03E4D//00
         LlEHJyrAKH6KoQCpVKMc5/8sjJ1a9vwyqoFRAbjxIwfqglIriyEZcetO3r8dVBFDEDKI
         qxArvM+M2KH7QeOVc8Z/Zf0oxLbdl9FSAGuH5iXB1ZqyRtPnkoVlrWnBYo2/l3HEw7Ax
         1aSNvdYVbOuuCCkot+FxzqSl22tOrBXcVmt+z84U/E6ha+zgStjZ1CkhiArhuVdiCLjT
         tB3rzZpyTW+qiv2QBDc8QKVtIa6vctnfqMAIZr7KgPbgkmBXvEW7X9y8kkvylj8f/nGD
         d5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0CTp97a81INgnIqFPyse78wOE/x/IFJ3vsFTafomRFk=;
        b=fKyZgSVgH/ERsex0Fe8qktk0VdJkBlyQjnQsJkU0POJlxcmj015UtvRkMV3f4dv/rv
         ubiAJPSZAvWr6u7kRQb3zrGriDp4k6osYOuoK75IsbXa06lMoaBD3zTWOeA/xgaUE/6z
         24YtyQmAejOEvT6/aUm2LuQ4NAB7+LTcgqHTpcsNqKFb2OxuEB1JVVdGUCN1MqRs7j0l
         TVwFm56GDsR3PaTnJksDi7iNStpfZ2nylHoR7YNYPph74uniMhGYBnaVLLcpH9RY04ff
         r/uCJoDmY87pPVoxX74joPT3u8i3Hviy86Q5chlTcHSHi4y2w86TofvdWozmZvCPUuxE
         y4Tg==
X-Gm-Message-State: AOAM5308I8XCMxgeRoMZNd1zyNqPDJiyW7FyLBOzKekIIxtPrgZvRt2R
        mGrny5Ak18fkqZUODjTPxIKq7P3BSoXJKb6MFT4=
X-Google-Smtp-Source: ABdhPJz3oT0p5qSChgdQP3YiUJqg5nGitolGt6qaPT/UpFULs7KlGPO4vOJQzjdHBQ5om417bg4SdKEPiWiBwQZJ7pU=
X-Received: by 2002:a02:ca4a:: with SMTP id i10mr2412829jal.141.1624344757401;
 Mon, 21 Jun 2021 23:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210622015011.5703-1-ainux.wang@gmail.com> <20210622031553.GA642176@roeck-us.net>
In-Reply-To: <20210622031553.GA642176@roeck-us.net>
From:   Ainux Wang <ainux.wang@gmail.com>
Date:   Tue, 22 Jun 2021 14:51:59 +0800
Message-ID: <CAPWE4_z3GERsP8fcRLSwOVnr680pGVg37J25Qjmi926MsbeZHw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (pmbus) Add support for MPS MP2949A
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, teng sterling <sterlingteng@gmail.com>,
        chenhuacai@kernel.org, chenhuacai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi=EF=BC=8C Guenter
    Thanks for the review. I'll address it all in v4.
Best regards,
Ainux Wang.

On Tue, 22 Jun 2021 at 11:15, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jun 22, 2021 at 09:50:11AM +0800, ainux.wang@gmail.com wrote:
> > From: "Ainux.Wang" <ainux.wang@gmail.com>
> >
> > Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS=
).
> > This is a triple-loop, digital, multi-phase controller.
> > This device:
> > - Supports up to three power rail.
> > - Provides 6 pulse-width modulations (PWMs), and can be configured up
> >   to 6-phase operation for Rail A , up to 2-phase operation for Rail B
> >   and up to 1-phase operation for Rail C.
> > - The PMBus registers are distributed into three pages: Page 0, Page 1,
> >   Page 2. Page 0 contains the registers for Rail A and most of the comm=
on
> >   settings for all of the rails. Page 1 contains register information f=
or
> >   Rail B. Page 2 contains register information for Rail C.
> > - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 an=
d
> >   IMVP9.
> >
> > Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> >
> > v3:
> > - Added change log here.
> > - Errors in the document have been modified.
> > - Fixed PMBUS_VOUT_MODE to MP2949A_MFR_VR_CONFIG.
> > - Removed unnecessary vout_params and empty line.
> >
> > v2:
> > - Reference has been added to Documentation/hwmon/index.rst.
> > - Droped 'vendor'.
> > - Removed change codes of the PMBus core and added mp2949a_identify()
> >   and mp2949a_read_byte_data() to this driver.
> >
> > v1:
> > - Add support for MPS MP2949A.
> > ---
> >  Documentation/hwmon/index.rst   |   1 +
> >  Documentation/hwmon/mp2949a.rst |  44 ++++++++++++
> >  drivers/hwmon/pmbus/Kconfig     |   9 +++
> >  drivers/hwmon/pmbus/Makefile    |   1 +
> >  drivers/hwmon/pmbus/mp2949a.c   | 118 ++++++++++++++++++++++++++++++++
> >  5 files changed, 173 insertions(+)
> >  create mode 100644 Documentation/hwmon/mp2949a.rst
> >  create mode 100644 drivers/hwmon/pmbus/mp2949a.c
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index 9ed60fa84cbe..56aac3b1678d 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
> >     mcp3021
> >     menf21bmc
> >     mlxreg-fan
> > +   mp2949a
> >     mp2975
> >     nct6683
> >     nct6775
> > diff --git a/Documentation/hwmon/mp2949a.rst b/Documentation/hwmon/mp29=
49a.rst
> > new file mode 100644
> > index 000000000000..0235dec70f63
> > --- /dev/null
> > +++ b/Documentation/hwmon/mp2949a.rst
> > @@ -0,0 +1,44 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Kernel driver mp2949a
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +
> > +  * MPS MP2949A
> > +
> > +    Prefix: 'mp2949a'
> > +
> > +Author:
> > +
> > +     Ainux Wang <ainux.wang@gmail.com>
> > +
> > +Description
> > +-----------
> > +
> > +This driver implements support for Monolithic Power Systems, Inc. (MPS=
)
> > +triple-loop, digital, multi-phase controller MP2949A.
> > +
> > +This device:
> > +
> > +- Supports up to three power rail.
> > +- Provides 6 pulse-width modulations (PWMs), and can be configured for
> > +  to 6-phase operation for Rail A , up to 2-phase operation for Rail B=
,
> > +  and up to 1-phase operation for Rail C.
> > +- The PMBus registers are distributed into three pages: Page 0, Page 1=
,
> > +  Page 2. Page 0 contains the registers for Rail A and most of the com=
mon
> > +  settings for all of the rails. Page 1 contains register information =
for
> > +  Rail B. Page 2 contains register information for Rail C.
> > +- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 a=
nd
> > +  IMVP9.
> > +
> > +Device supports:
> > +
> > +- SVID interface.
> > +- PMBus rev 1.2 interface.
> > +
> > +Device supports direct format for reading output power.
> > +Device supports linear format for reading input voltage, output curren=
t,
> > +and temperature.
> > +Device supports VID for reading output voltage.
> > +The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 37a5c39784fa..b1344b265976 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -248,6 +248,15 @@ config SENSORS_MAX8688
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called max8688.
> >
> > +config SENSORS_MP2949A
> > +     tristate "MPS MP2949A"
> > +     help
> > +       If you say yes here you get hardware monitoring support for MPS
> > +       MP2949A Triple Loop Digital Multi-Phase Controller.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called mp2949a.
> > +
> >  config SENSORS_MP2975
> >       tristate "MPS MP2975"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index f8dcc27cd56a..bfb55ab12da1 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -28,6 +28,7 @@ obj-$(CONFIG_SENSORS_MAX20751)      +=3D max20751.o
> >  obj-$(CONFIG_SENSORS_MAX31785)       +=3D max31785.o
> >  obj-$(CONFIG_SENSORS_MAX34440)       +=3D max34440.o
> >  obj-$(CONFIG_SENSORS_MAX8688)        +=3D max8688.o
> > +obj-$(CONFIG_SENSORS_MP2949A)        +=3D mp2949a.o
> >  obj-$(CONFIG_SENSORS_MP2975) +=3D mp2975.o
> >  obj-$(CONFIG_SENSORS_PM6764TR)       +=3D pm6764tr.o
> >  obj-$(CONFIG_SENSORS_PXE1610)        +=3D pxe1610.o
> > diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949=
a.c
> > new file mode 100644
> > index 000000000000..744c88b8ebca
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/mp2949a.c
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Hardware monitoring driver for Monolithic Power Systems MP2949A
> > + *
> > + * Copyright (c) 2021 Lemote Technologies. All rights reserved.
> > + * Copyright (c) 2021 Ainux <ainux.wang@gmail.com>
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +#define MP2949A_PAGE_NUM             3
> > +
> > +#define MP2949A_MFR_VR_CONFIG        0xE4
> > +
> > +static int mp2949a_read_byte_data(struct i2c_client *client, int page,=
 int reg)
> > +{
> > +     switch (reg) {
> > +     case PMBUS_VOUT_MODE:
> > +             /*
> > +              * This chip do not support the VOUT_MODE command.
> > +              * There is not VOUT_MODE command in MP2949A datasheet P2=
9~P31.
> > +              * So there is a EINVAL in here.
> > +              */
> > +             return -EINVAL;
>
> This is not a reason to add this code. The PMBus core handles this situat=
ion.
> Please explain why this is needed. "The chip does not support this comman=
d"
> is not a reason.
>
> > +     default:
> > +             return -ENODATA;
> > +     }
> > +}
> > +
> > +static int mp2949a_identify(struct i2c_client *client,
> > +                         struct pmbus_driver_info *info)
> > +{
> > +     int i, ret;
> > +
> > +     for (i =3D 0; i < MP2949A_PAGE_NUM; i++) {
> > +             ret =3D pmbus_read_byte_data(client, i, MP2949A_MFR_VR_CO=
NFIG);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /*
> > +              * Rail A bit 5, Rail B bit 4, Rail C bit 3.
> > +              * 1'b1: 5mV  (vr12/imvp8)
> > +              * 1'b0: 10mv (imvp9)
> > +              */
> > +             info->vrm_version[i] =3D (ret & ~BIT(5-i)) ? vr12 : imvp9=
;
>
> Space before and after '-'.
> Also, why ~ ? This evaluates all bits except the target bit.
>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct pmbus_driver_info mp2949a_info =3D {
> > +     .pages =3D MP2949A_PAGE_NUM,
> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_VOLTAGE_OUT] =3D vid,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .format[PSC_POWER] =3D direct,
> > +     .m[PSC_POWER] =3D 1,
> > +     .b[PSC_POWER] =3D 0,
> > +     .R[PSC_POWER] =3D 0,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS=
_VOUT |
> > +             PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +             PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT,
> > +     .func[1] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +             PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +             PMBUS_HAVE_POUT,
> > +     .func[2] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > +             PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > +             PMBUS_HAVE_POUT,
> > +     .identify =3D mp2949a_identify,
> > +     .read_byte_data =3D mp2949a_read_byte_data,
> > +};
> > +
> > +static int mp2949a_probe(struct i2c_client *client,
> > +                       const struct i2c_device_id *id)
> > +{
> > +     struct pmbus_driver_info *info;
> > +
> > +     info =3D devm_kmemdup(&client->dev, &mp2949a_info, sizeof(*info),
> > +                         GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     return pmbus_do_probe(client, info);
> > +}
> > +
> > +static const struct i2c_device_id mp2949a_id[] =3D {
> > +     {"mp2949a", 0},
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, mp2949a_id);
> > +
> > +static const struct of_device_id mp2949a_of_match[] =3D {
> > +     {.compatible =3D "mps,mp2949a"},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mp2949a_of_match);
> > +
> > +static struct i2c_driver mp2949a_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "mp2949a",
> > +             .of_match_table =3D of_match_ptr(mp2949a_of_match),
> > +     },
> > +     .probe =3D mp2949a_probe,
> > +     .id_table =3D mp2949a_id,
> > +};
> > +
> > +module_i2c_driver(mp2949a_driver);
> > +
> > +MODULE_AUTHOR("Ainux <ainux.wang@gmail.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Monolithic Power Systems MP2949A"=
);
> > +MODULE_LICENSE("GPL");
> > --
> > 2.18.1
> >
