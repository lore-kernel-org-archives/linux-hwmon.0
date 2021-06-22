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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB51C48BC2
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jun 2021 01:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7608560C3D
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jun 2021 01:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhFVBey (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Jun 2021 21:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhFVBey (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jun 2021 21:34:54 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24868C061574;
        Mon, 21 Jun 2021 18:32:39 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id a11so10257177ilf.2;
        Mon, 21 Jun 2021 18:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HpQnyaR4oQX0d3cEIx2quVliTHquaNusKhnyCpKaB2Q=;
        b=qPafNwaE992pA4kHVvlB5EXO+zz1daJhGRQIu2Ahub8eYz0iO6EYnNOtTExSa1ctl8
         TSW+AyF/Pb7OQIcBXQ5Qt3exNeSKPJqGTlpLgjy/WnFDFyWwAlBsre9QU/hnXinKXEKL
         ufbQVIKfmfbSRgPqL7vu2sD7vUFSfo7jeKEPOD9SrdoJSOTwjy6uAoZJL8iXGmwmWTa/
         5eaLrX9EVFcSJY8XmC2cSJXqu7Q07Iz+fUwH/0P5ptasjKs0xBAiwSNMrktU8q9yZshW
         iDk4kxXnJ4zygmR8AZdFYQuzBjZQhi4AOAKaEPH9LnL7M97kcXkoUo/pUY+J8470OwYC
         lsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HpQnyaR4oQX0d3cEIx2quVliTHquaNusKhnyCpKaB2Q=;
        b=GkfSpqUcCJ9Yp3wkFspIIPHRRdphWwBED4+f01B/not0bwg9SUaWnkWnOXXrFwg5Mc
         rzN3cTKveOV5+eALLT/iEmozZ4bdJQwLKV8IID9bVVO4GM8dO/l9BNDW+ITX/cVuQ6CI
         8ENeWuNpa6PE6PkgM+HgQ1heCi6OJBzrFPIcgrLK3oYLNy+KTAEZQKn+mlVf/4VxQlqe
         lyLTchtF/Cz6Zz21ghmMnUIRPHCAFjfn1/QCwwECIObmhxiKL3mGKaLB1WgzoWmfmpxR
         OtZegEWoxACDXXc62J+CSUziKmYlB1OWVIWr5wJjHixEFHYQVysTmNuxrJhxIZxOi2u3
         yzYg==
X-Gm-Message-State: AOAM530L55qHILwajmCM2VJDkF009wHsfihYxCv81ytRXN34AWNEUfSE
        4WAsvtZDOwHMGGD6qAIMwgOEsY6KuP6BpnA/uBU=
X-Google-Smtp-Source: ABdhPJx+CYtCZzJfaGfIex2cQYqGLgp5BeW/HMxgfK4P+egOUFZiI91yQ481sKnsMh2DRhP0CqInBXlnS2tBtmpGnX4=
X-Received: by 2002:a05:6e02:13e5:: with SMTP id w5mr828363ilj.112.1624325558517;
 Mon, 21 Jun 2021 18:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210618030934.27376-1-ainux.wang@gmail.com> <20210618193914.GA1664689@roeck-us.net>
In-Reply-To: <20210618193914.GA1664689@roeck-us.net>
From:   Ainux Wang <ainux.wang@gmail.com>
Date:   Tue, 22 Jun 2021 09:32:01 +0800
Message-ID: <CAPWE4_z=V+ZntfZfDA22Zz9OB_tFLm_uTm3veyReVnjH3Cf-=A@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus) Add support for MPS MP2949A
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, teng sterling <sterlingteng@gmail.com>,
        chenhuacai@kernel.org, chenhuacai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi=EF=BC=8CGuenter
    Thanks for the review. It all sounds reasonable. I'll address it all in=
 v3.
Best regards,
Ainux Wang.


On Sat, 19 Jun 2021 at 03:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jun 18, 2021 at 11:09:34AM +0800, ainux.wang@gmail.com wrote:
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
> >   IMVP9 with only one DAC for each rail to generate REF.
> >
> > Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> > ---
>
> Change log goes here. My normal response to patches with missing change l=
og is:
>
> <Formletter>
> Change log goes here. If it is missing, I won't know what changed.
> That means I will have to dig out older patch versions to compare.
> That costs time and would hold up both this patch as well as all other
> patches which I still have to review.
>
> For this reason, I will not review patches without change log.
> </Formletter>
>
> so you are lucky that your previous version is recent enough that I remem=
ber
> at least some of it. However, please do provide change logs in the future=
.
>
> >  Documentation/hwmon/index.rst   |   1 +
> >  Documentation/hwmon/mp2949a.rst |  44 ++++++++++++
> >  drivers/hwmon/pmbus/Kconfig     |   9 +++
> >  drivers/hwmon/pmbus/Makefile    |   1 +
> >  drivers/hwmon/pmbus/mp2949a.c   | 119 ++++++++++++++++++++++++++++++++
> >  5 files changed, 174 insertions(+)
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
> > index 000000000000..ac4084e067f1
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
>
> rails
>
> > +- Provides 6 pulse-width modulations (PWMs), and can be configured up
>
> can be configured for ...
>
> > +  to 6-phase operation for Rail A , up to 2-phase operation for Rail B
>
> Rail B,
>
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
> > +  IMVP9 with only one DAC for each rail to generate REF.
>
> Please explain REF.
>
> > +
> > +Device supports:
> > +
> > +- SVID interface.
> > +- PMBus rev 1.2 interface.
> > +
> > +Device supports direct format for reading output power.
> > +Device supports linear format for reading input voltage and output cur=
rent
>
> input voltage, output current, and temperature.
>
> > +and temperature.
> > +Device supports VID for reading output voltage.
> > +The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
>
> The following
>
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
> > index 000000000000..d68e8526abe3
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/mp2949a.c
> > @@ -0,0 +1,119 @@
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
> > +static int mp2949a_read_byte_data(struct i2c_client *client, int page,=
 int reg)
> > +{
> > +     switch (reg) {
> > +     case PMBUS_VOUT_MODE:
> > +             /* This chip do not support the VOUT_MODE command. */
>
> s/do/does/
>
> This warrants a more detailed explanation: What happens if the command
> is sent to the chip, and why is it not possible to rely on the standard
> response to unsupported commands ?
>
> > +             return -EINVAL;
> > +     default:
> > +             return -ENODATA;
> > +     }
> > +}
> > +
> > +static int mp2949a_identify(struct i2c_client *client,
> > +                         struct pmbus_driver_info *info)
> > +{
> > +     u8 vout_params;
> > +     int i, ret;
> > +
> > +     for (i =3D 0; i < MP2949A_PAGE_NUM; i++) {
> > +             /* Read the register with VOUT scaling value.*/
> > +             ret =3D pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
>                                                       ^^^^^^^^^^^^^^^
> Should this be MFR_VR_CONFIG ?
>
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /*
> > +              * Rail A bit 5, Rail B bit 4, Rail C bit 3.
> > +              * 1'b1: 5mV  (vr12/imvp8)
> > +              * 1'b0: 10mv (imvp9)
> > +              */
> > +             vout_params =3D ret & ~BIT(5-i);
>
> space before and after '-'. vout_params is really unnecessary; just do
> the check directly in the if() statement.
>
> > +             if (vout_params)
> > +                     info->vrm_version[i] =3D vr12;
> > +             else
> > +                     info->vrm_version[i] =3D imvp9;
> > +
>
> Unnecessary empty line.
>
> checkpatch --strict reports this and the above problem, plus another
> alignment problem. Please fix everything it reports.
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
