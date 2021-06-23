Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CCFC2B9F4
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 00:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FD596023F
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 00:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhFWArc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Jun 2021 20:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhFWArb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jun 2021 20:47:31 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD8FC061574;
        Tue, 22 Jun 2021 17:45:15 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id x12so988750ill.4;
        Tue, 22 Jun 2021 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UfbI8l7g2p+gLxjoUcT3k7FQPbfZFcrkQQn/duSKPj4=;
        b=NEJizINVlIxRtMXHaRo81CxyrYoyw00nmqUIn5mHF9mR5EhZdjYi2rmx5CZIBDFAYX
         dLJasDxcVca2T5Y1LQwPSFQs2RbPS4Of+wAQU0rb/YDGZRs8SF+VQ2OU1GjoONuspc9X
         UHIMz64x+xayxFgUHLZvyTVKrk2OgchxDt8LFJezqNFu+EP6vQHWerBF8l7tmKRr5+yC
         +AdUkaSmI7T56FzjS26M0BGzyIoLdzLhlDbvaKOPpbf7/q6Bu3CDvmQEgektJGcabx5J
         bTTga0SHnNPxSLgj9uIxPx5jjp+lel+UoI/hObl+Bs6CsBhXo8jzLf3kvqtlHRJAZ1Dk
         zZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UfbI8l7g2p+gLxjoUcT3k7FQPbfZFcrkQQn/duSKPj4=;
        b=MMu7Oo7uWlyy/5FmtocGfx3iSp6rfkn3KaGHxQJyWDSyf2bAK3A+MJ631G2OEWEfk1
         CldtJ3oA80tjHhfMZtqkudxBj5o+qM3BIDLpXVFWSnsBO4Nq4ynoaN+m7mKAf6YGR/jp
         OZHOgVl+7gBVue1nYYrug4y3HdKydu6kQ0k2YDu4XGgcGm94UfR74bcVcEqpUqCT/Kdj
         DKH0Q6BDJQ6iVSSE2M0RvnQkjoyi4qte3+KnbA3CI5ChwN9DX3YlkSUkI7h3AzaTgKcG
         VRvLGxebgAHrWhhD4emtFgia+mdx/1Pc0aQ3d/MnfPEUdE5MYg3KDggjAzG63pCuUNHq
         I/Zg==
X-Gm-Message-State: AOAM5320lMc7sNlRx7FNGd94Z58Hz1XIQ8F2bC+48UTGF8YJf4+ILRk3
        5jKY65drQXxh3jG4RBz7bBZw0e7smitdCpZ28D4=
X-Google-Smtp-Source: ABdhPJwjaVUcIU2OsIpREzMwSyfv3ZF4w5Ge7tUCkoy0IjxXJ9s4eTVpIYcRCgucEAs99SIIJiqV5rd67Q+zsNFGEWo=
X-Received: by 2002:a05:6e02:156a:: with SMTP id k10mr953954ilu.111.1624409113840;
 Tue, 22 Jun 2021 17:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210622090025.39313-1-ainux.wang@gmail.com> <CAPWE4_wxqOS0VsW9gkh+w9vTyYjzH-q5_Vw=S6hQHQYwVs2YbA@mail.gmail.com>
 <CAMU9jJrAu-X3Jdgvk3oA-w_10Y1q0Kx07FMPFxVzceZHvGBcjw@mail.gmail.com>
In-Reply-To: <CAMU9jJrAu-X3Jdgvk3oA-w_10Y1q0Kx07FMPFxVzceZHvGBcjw@mail.gmail.com>
From:   Ainux Wang <ainux.wang@gmail.com>
Date:   Wed, 23 Jun 2021 08:44:37 +0800
Message-ID: <CAPWE4_zuPoMStQQdwdLdY6am_cS8pFrKNZMcJCtVSNgiCEGAEQ@mail.gmail.com>
Subject: Re: [PATCH v4] hwmon: (pmbus) Add support for MPS MP2949A
To:     teng sterling <sterlingteng@gmail.com>
Cc:     jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 22 Jun 2021 at 19:42, teng sterling <sterlingteng@gmail.com> wrote:
>
> Ainux Wang <ainux.wang@gmail.com> =E4=BA=8E2021=E5=B9=B46=E6=9C=8822=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=885:17=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi, Guenter and others,
> >     This is right subject, [PATCH v4] hwmon: (pmbus) Add support for
> > MPS MP2949A.
> > Best regards,
> > Ainux Wang.
> >
> > On Tue, 22 Jun 2021 at 17:00, <ainux.wang@gmail.com> wrote:
> > >
> > > From: "Ainux.Wang" <ainux.wang@gmail.com>
> > >
> > > Add support for MP2949A device from Monolithic Power Systems, Inc. (M=
PS).
> > > This is a triple-loop, digital, multi-phase controller.
> > > This device:
> > > - Supports up to three power rail.
> > > - Provides 6 pulse-width modulations (PWMs), and can be configured up
> > >   to 6-phase operation for Rail A , up to 2-phase operation for Rail =
B
> > >   and up to 1-phase operation for Rail C.
> > > - The PMBus registers are distributed into three pages: Page 0, Page =
1,
> > >   Page 2. Page 0 contains the registers for Rail A and most of the co=
mmon
> > >   settings for all of the rails. Page 1 contains register information=
 for
> > >   Rail B. Page 2 contains register information for Rail C.
> > > - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 =
and
> > >   IMVP9.
> > >
> > > Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> here,add a line:
> ---
> > >
> > > v4:
> > > - Removed mp2949a_read_byte_data().
> > > - Added space before and after '-' and fixed a bug that is '~' on lin=
e 35.
> > >
> > > v3:
> > > - Added change log here.
> > > - Errors in the document have been modified.
> > > - Fixed PMBUS_VOUT_MODE to MP2949A_MFR_VR_CONFIG.
> > > - Removed unnecessary vout_params and empty line.
> > >
> > > v2:
> > > - Reference has been added to Documentation/hwmon/index.rst.
> > > - Droped 'vendor'.
> > > - Removed change codes of the PMBus core and added mp2949a_identify()
> > >   and mp2949a_read_byte_data() to this driver.
> > >
> > > v1:
> > > - Add support for MPS MP2949A.
> > > ---
> here, delete the line.
>
> I mean:
>
> change log should under "---"
>
> Thanks,
> yanteng
Hi,yanteng,
    Thank you very much, I`m so sorry that i didn`t understand you,
but now i have understood what you mean.
    Thanks for the review again. I'll address it all in v5.
Best regards,
Ainux Wang.


> > >  Documentation/hwmon/index.rst   |   1 +
> > >  Documentation/hwmon/mp2949a.rst |  44 ++++++++++++++
> > >  drivers/hwmon/pmbus/Kconfig     |   9 +++
> > >  drivers/hwmon/pmbus/Makefile    |   1 +
> > >  drivers/hwmon/pmbus/mp2949a.c   | 102 ++++++++++++++++++++++++++++++=
++
> > >  5 files changed, 157 insertions(+)
> > >  create mode 100644 Documentation/hwmon/mp2949a.rst
> > >  create mode 100644 drivers/hwmon/pmbus/mp2949a.c
> > >
> > > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/inde=
x.rst
> > > index 9ed60fa84cbe..56aac3b1678d 100644
> > > --- a/Documentation/hwmon/index.rst
> > > +++ b/Documentation/hwmon/index.rst
> > > @@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
> > >     mcp3021
> > >     menf21bmc
> > >     mlxreg-fan
> > > +   mp2949a
> > >     mp2975
> > >     nct6683
> > >     nct6775
> > > diff --git a/Documentation/hwmon/mp2949a.rst b/Documentation/hwmon/mp=
2949a.rst
> > > new file mode 100644
> > > index 000000000000..0235dec70f63
> > > --- /dev/null
> > > +++ b/Documentation/hwmon/mp2949a.rst
> > > @@ -0,0 +1,44 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +Kernel driver mp2949a
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Supported chips:
> > > +
> > > +  * MPS MP2949A
> > > +
> > > +    Prefix: 'mp2949a'
> > > +
> > > +Author:
> > > +
> > > +       Ainux Wang <ainux.wang@gmail.com>
> > > +
> > > +Description
> > > +-----------
> > > +
> > > +This driver implements support for Monolithic Power Systems, Inc. (M=
PS)
> > > +triple-loop, digital, multi-phase controller MP2949A.
> > > +
> > > +This device:
> > > +
> > > +- Supports up to three power rail.
> > > +- Provides 6 pulse-width modulations (PWMs), and can be configured f=
or
> > > +  to 6-phase operation for Rail A , up to 2-phase operation for Rail=
 B,
> > > +  and up to 1-phase operation for Rail C.
> > > +- The PMBus registers are distributed into three pages: Page 0, Page=
 1,
> > > +  Page 2. Page 0 contains the registers for Rail A and most of the c=
ommon
> > > +  settings for all of the rails. Page 1 contains register informatio=
n for
> > > +  Rail B. Page 2 contains register information for Rail C.
> > > +- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8=
 and
> > > +  IMVP9.
> > > +
> > > +Device supports:
> > > +
> > > +- SVID interface.
> > > +- PMBus rev 1.2 interface.
> > > +
> > > +Device supports direct format for reading output power.
> > > +Device supports linear format for reading input voltage, output curr=
ent,
> > > +and temperature.
> > > +Device supports VID for reading output voltage.
> > > +The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
> > > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfi=
g
> > > index 37a5c39784fa..b1344b265976 100644
> > > --- a/drivers/hwmon/pmbus/Kconfig
> > > +++ b/drivers/hwmon/pmbus/Kconfig
> > > @@ -248,6 +248,15 @@ config SENSORS_MAX8688
> > >           This driver can also be built as a module. If so, the modul=
e will
> > >           be called max8688.
> > >
> > > +config SENSORS_MP2949A
> > > +       tristate "MPS MP2949A"
> > > +       help
> > > +         If you say yes here you get hardware monitoring support for=
 MPS
> > > +         MP2949A Triple Loop Digital Multi-Phase Controller.
> > > +
> > > +         This driver can also be built as a module. If so, the modul=
e will
> > > +         be called mp2949a.
> > > +
> > >  config SENSORS_MP2975
> > >         tristate "MPS MP2975"
> > >         help
> > > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makef=
ile
> > > index f8dcc27cd56a..bfb55ab12da1 100644
> > > --- a/drivers/hwmon/pmbus/Makefile
> > > +++ b/drivers/hwmon/pmbus/Makefile
> > > @@ -28,6 +28,7 @@ obj-$(CONFIG_SENSORS_MAX20751)        +=3D max20751=
.o
> > >  obj-$(CONFIG_SENSORS_MAX31785) +=3D max31785.o
> > >  obj-$(CONFIG_SENSORS_MAX34440) +=3D max34440.o
> > >  obj-$(CONFIG_SENSORS_MAX8688)  +=3D max8688.o
> > > +obj-$(CONFIG_SENSORS_MP2949A)  +=3D mp2949a.o
> > >  obj-$(CONFIG_SENSORS_MP2975)   +=3D mp2975.o
> > >  obj-$(CONFIG_SENSORS_PM6764TR) +=3D pm6764tr.o
> > >  obj-$(CONFIG_SENSORS_PXE1610)  +=3D pxe1610.o
> > > diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp29=
49a.c
> > > new file mode 100644
> > > index 000000000000..d1f36c008e58
> > > --- /dev/null
> > > +++ b/drivers/hwmon/pmbus/mp2949a.c
> > > @@ -0,0 +1,102 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Hardware monitoring driver for Monolithic Power Systems MP2949A
> > > + *
> > > + * Copyright (c) 2021 Lemote Technologies. All rights reserved.
> > > + * Copyright (c) 2021 Ainux <ainux.wang@gmail.com>
> > > + */
> > > +
> > > +#include <linux/err.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/init.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include "pmbus.h"
> > > +
> > > +#define MP2949A_PAGE_NUM               3
> > > +
> > > +#define MP2949A_MFR_VR_CONFIG  0xE4
> > > +
> > > +static int mp2949a_identify(struct i2c_client *client,
> > > +                           struct pmbus_driver_info *info)
> > > +{
> > > +       int i, ret;
> > > +
> > > +       for (i =3D 0; i < MP2949A_PAGE_NUM; i++) {
> > > +               ret =3D pmbus_read_byte_data(client, i, MP2949A_MFR_V=
R_CONFIG);
> > > +               if (ret < 0)
> > > +                       return ret;
> > > +
> > > +               /*
> > > +                * Rail A bit 5, Rail B bit 4, Rail C bit 3.
> > > +                * 1'b1: 5mV  (vr12/imvp8)
> > > +                * 1'b0: 10mv (imvp9)
> > > +                */
> > > +               info->vrm_version[i] =3D (ret & BIT(5 - i)) ? vr12 : =
imvp9;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static struct pmbus_driver_info mp2949a_info =3D {
> > > +       .pages =3D MP2949A_PAGE_NUM,
> > > +       .format[PSC_VOLTAGE_IN] =3D linear,
> > > +       .format[PSC_VOLTAGE_OUT] =3D vid,
> > > +       .format[PSC_CURRENT_OUT] =3D linear,
> > > +       .format[PSC_TEMPERATURE] =3D linear,
> > > +       .format[PSC_POWER] =3D direct,
> > > +       .m[PSC_POWER] =3D 1,
> > > +       .b[PSC_POWER] =3D 0,
> > > +       .R[PSC_POWER] =3D 0,
> > > +       .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_ST=
ATUS_VOUT |
> > > +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > > +               PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT,
> > > +       .func[1] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > > +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > > +               PMBUS_HAVE_POUT,
> > > +       .func[2] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> > > +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > > +               PMBUS_HAVE_POUT,
> > > +       .identify =3D mp2949a_identify,
> > > +};
> > > +
> > > +static int mp2949a_probe(struct i2c_client *client,
> > > +                         const struct i2c_device_id *id)
> > > +{
> > > +       struct pmbus_driver_info *info;
> > > +
> > > +       info =3D devm_kmemdup(&client->dev, &mp2949a_info, sizeof(*in=
fo),
> > > +                           GFP_KERNEL);
> > > +       if (!info)
> > > +               return -ENOMEM;
> > > +
> > > +       return pmbus_do_probe(client, info);
> > > +}
> > > +
> > > +static const struct i2c_device_id mp2949a_id[] =3D {
> > > +       {"mp2949a", 0},
> > > +       {}
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(i2c, mp2949a_id);
> > > +
> > > +static const struct of_device_id mp2949a_of_match[] =3D {
> > > +       {.compatible =3D "mps,mp2949a"},
> > > +       {}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mp2949a_of_match);
> > > +
> > > +static struct i2c_driver mp2949a_driver =3D {
> > > +       .driver =3D {
> > > +               .name =3D "mp2949a",
> > > +               .of_match_table =3D of_match_ptr(mp2949a_of_match),
> > > +       },
> > > +       .probe =3D mp2949a_probe,
> > > +       .id_table =3D mp2949a_id,
> > > +};
> > > +
> > > +module_i2c_driver(mp2949a_driver);
> > > +
> > > +MODULE_AUTHOR("Ainux <ainux.wang@gmail.com>");
> > > +MODULE_DESCRIPTION("PMBus driver for Monolithic Power Systems MP2949=
A");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.18.1
> > >
