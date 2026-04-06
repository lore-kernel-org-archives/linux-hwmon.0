Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29395281369
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Apr 2026 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775452991; cv=pass; b=kiPJsbQXvi7LPwulDoJFpsOoY6B4AS2R5axsNAq8xsx7AFndPVT2STzFHFWWm8aIpZ0ENKbpal9OQjh6RtBrFiDkSWUBzI0U4eHSdT7LbO76BCsXDCVRYckHOnVtgZn780JII1h3I7zi5OEDOqWf7LrMYDNP0p09h7fWBtbyVDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775452991; c=relaxed/simple;
	bh=pmqmGi74XFifJGe/W8o2WSMJ56SPmq5USqQVfpfONnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gee6Gr2e15q/xzZc10mpJIAVpK/WPke7Ug/nqTmh6DZQ4k7Xm0xhVUQLnp4+PBgv3l2UewmTNMhlNPk1/9rRxbQS8qPhLOYRBU7rd3ZWCSjUCVgwIIOEp7Tr/0FNplnO6L2Tb+ufYgEhrYTFpnqwRpUTcHSdvj10Ug4i96H99kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOIeWLij; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOIeWLij"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so8520186eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Apr 2026 22:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775452988; cv=none;
        d=google.com; s=arc-20240605;
        b=jQV12AE3oeJ/gNWk9WZbnvvTJShbrPnddfZnV9UQ9M+3JegVzdjDtkbN5voRpaZMXe
         B5FDB6ptQp08FUUmiq9a5EGYIMp2pLUfGQGuP6KkL6wpMcPf3e+uYrNhL770wCucPHBq
         uOOWM/3yuCyfW8LgAAq4PpiHeT6r9LAaFUf8O0re0qrX1uWqEkf6zBMiecaDnGceVdOk
         iudnanfg0csPBV8S1tKpKzMgbTRlpMdSASiV7mgyIow+tupEYtYmoxNVVIb6XMX/EdPi
         7eyiC+vL2oPBtiwlOyqdV4sgKHo4mf78a4AO+aJa3LkXCleFbwnqLy1yRTeMoygqWFYL
         PfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JScUNGYjYXJk6pL/6v5D9MekunPJMAuMgF+LVrfPZzI=;
        fh=snafpddnkg7NtcxyDwkY2MycwoAcM2KaxkrSgnN4oBo=;
        b=V9wq4jtYxTwj+SBmTi57jz29YakNfY9z6HfH9wbg463BB89H0iT+CqDdxqko42PvxP
         UffRalFlJauVacpy3n/Tgccwg4UEiw8idMDuJy0dQyw0WJIya62lioEtUITAM82/fbas
         m6zF8VLOVQ2mPxC+81kabhUoZ45e9pMSRPsMI1gub7vKo8gnTJL0nXRzeQtUHUyMSvUp
         Qwht95b1lRrOgDQJmxPMElf9/UOPdgUo0CBfKq5mTz1Q8BtU/vDMx1XyCrIkpo7x9XeH
         3eez33kBrIdYW80HOAeuM6bX1pHxhG7Pt7JI/eBvTC0lq0NstXtB37kELDibq8c2zOlS
         K9TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775452988; x=1776057788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JScUNGYjYXJk6pL/6v5D9MekunPJMAuMgF+LVrfPZzI=;
        b=pOIeWLijWihELSgWT1lL2bXY8E2P1aSlHQb6tnJUfjOBRRpD85o7uDxFtvRVhH116V
         l7QeK9mHxs1ILWvkCATHVkiwiZ0j0H0RYg4ptC5WPPQ/l34TKRqot5fjK96MAeEDG9eq
         tnGh7T56mGv6hLlIeT2mCnkzCRxMcpApz4SqnfT50UNzMMdCiRo4/0Q/0DR8aRE48T+N
         6u5Ep0rzXEdCkmn/6my2tMNKBJFqz3vSEirFUSwWpbmU6AqdwSY74MTzvpMwH1srOsbB
         bJbfP4PM0IdawARib9F9PihJgWvsih5oOef5/7c+i/tclq4tF5QYV7hJ7teUtsFgEOQg
         ctgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775452988; x=1776057788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JScUNGYjYXJk6pL/6v5D9MekunPJMAuMgF+LVrfPZzI=;
        b=cijQ8q0FlihI9W/ywEFEOi5ZDFi3OS317PmbKEcKuGniNs2Fkc1vSIIC2zMuBmr1zv
         76FS0U5hZh9hYSLogi/o6fSAudjUVmehuuRHEf6Pzi6kK3VTFWtoep+TmAOparjZ+sd9
         m1MZhJwNuOek/fob1lOKq2ELaenqD61C1ESSibqCluYDjFUfwH9RiH9g1zCzaEomza6T
         43VAc94p2KIa5N55JkUcxoSnsUV4ODpiSgxpBmOD+e/5GSkGEazqJlYNylgtyUx1m1tf
         Gp0onxhbnkww2qMl/eE0mUgcgbmGql3o7xtP8SFGuxXyPUSqP9LfvrsWrG6Uquh8YdaB
         SD2g==
X-Forwarded-Encrypted: i=1; AJvYcCWWpk2jhOlYnuiklN90p+fWT9Sevs8cQ4WmXaKj5ze4mGv1PW9nMx4RGofC+jlkztLvHyfquhFfj9apfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzfZUrYyzRj1ErXyw/ODHQMyh/RUpBRqBac0wjkT/+a8CpoZB
	JyTsmyxlSW0o56sfkl14v93St8JdOfR5YuIq97FJ82YyMFsrOT/bs5+flSaxX9fHMXPT3DAMhFz
	6zC/oazodHW8OlcBEpX6uANaaAlDigIY=
X-Gm-Gg: AeBDietM2wCaZQIi/1csc1I1iMA7AulL/0pr15z3zdfAMbQc9gAwXNHiuSSwsY2kG6k
	eQdTT+SzpIkvRZfvsqC/ImJD1SThc1euhhjwr2moPQ1vXxw6P9iR060C4aVWdgKSkuIgl6a1Nva
	2bZrz5ftuSUcBazE5xACFq/c2iiDo7UTvDjuRmb10warh+pHmZHT1c5AVmE6grMzJoWTzwG9Eoj
	lX9YS5wureaqo05y+lHVMgli3NmrXVo2nx0vyZjT1iJLBLdDfMklFxt4bS/ZDWnXaiM4zqTy/RQ
	atH6coS+
X-Received: by 2002:a05:7300:371f:b0:2c5:76d1:7f95 with SMTP id
 5a478bee46e88-2cbfc763331mr5665654eec.28.1775452988149; Sun, 05 Apr 2026
 22:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
 <20260401104550.115715-3-Ashish.Yadav@infineon.com> <258dd77a-a8d9-4540-a32a-91a3f13c6ed5@roeck-us.net>
 <CAJKbuCbrqRHcy28TvhkQxh6eiLb1RpWYekx5WXPj6S=qO8CNvQ@mail.gmail.com>
In-Reply-To: <CAJKbuCbrqRHcy28TvhkQxh6eiLb1RpWYekx5WXPj6S=qO8CNvQ@mail.gmail.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 6 Apr 2026 10:52:55 +0530
X-Gm-Features: AQROBzChv8k9FUYO_LpJsrRFW6RPcKfcAPDVPpp64oX5hyy_4TND2QYXYKyXuMw
Message-ID: <CAJKbuCZveZx4BytbeaEU2x9z0m92HPbBUZYSpJ8StUEkwq+cqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I hope you=E2=80=99re doing well.

I=E2=80=99m writing to provide an update regarding the m[PSC_POWER] issue
identified in the following
patchset: https://sashiko.dev/#/patchset/20260401104550.115715-1-Ashish.Yad=
av%40infineon.com.

The discrepancy was caused by an incorrect divisor in the power
calculation. Specifically:
info->m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64) info->m[PSC_POWER]
* rimon * gimon, 1000000000000);

The divisor should be 10^15 rather than 10^12.
With this correction, the [PSC_POWER] value scales correctly to 163.29
(previously 16329).

I will include this fix in the next version of the patch.
Apologies for any inconvenience this may have caused, and thank you
for your time and feedback.

With Best Regards,
   Ashish Yadav


On Thu, Apr 2, 2026 at 7:39=E2=80=AFPM ashish yadav <ashishyadav78@gmail.co=
m> wrote:
>
> Hi Guenter,
>
> Thanks for your valuable feedback and time.
> Please find my response in-line.
>
> With Best Regards,
>   Ashish Yadav
>
> On Wed, Apr 1, 2026 at 9:26=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> >
> > Hi,
> >
> > On 4/1/26 03:45, ASHISH YADAV wrote:
> > > From: Ashish Yadav <ashish.yadav@infineon.com>
> > >
> > > Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.
> > >
> > > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > > ---
> > > XDP720 Digital eFuse Controller provides accurate system telemetry
> > > (V, I, P, T) and reports analog current at the IMON pin for post-proc=
essing.
> > >
> > > The Current and Power measurement depends on the RIMON and GIMON valu=
es.
> > > Please look into data sheet sections 5.4.2 and 5.4.4 for more details=
:
> > > https://www.infineon.com/assets/row/public/documents/24/49/infineon-x=
dp720-001-datasheet-en.pdf
> > >
> > > The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS R=
egister.
> > > The value of RIMON (kohm) can be provided by the user through device =
tree using
> > > infineon,rimon-micro-ohms  property.
> >
> > Please have a look at
> >
> > https://sashiko.dev/#/patchset/20260401104550.115715-1-Ashish.Yadav%40i=
nfineon.com
> >
> > Main concern is the power measurement range, but also please use 100000=
0000000ULL
> > as suggested.
>
> Sure, We will look into it and get back to you.
>
> > Thanks,
> > Guenter
> >
> > > ---
> > >   drivers/hwmon/pmbus/Kconfig  |   9 +++
> > >   drivers/hwmon/pmbus/Makefile |   1 +
> > >   drivers/hwmon/pmbus/xdp720.c | 123 ++++++++++++++++++++++++++++++++=
+++
> > >   3 files changed, 133 insertions(+)
> > >   create mode 100644 drivers/hwmon/pmbus/xdp720.c
> > >
> > > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfi=
g
> > > index fc1273abe357..c419e3ecce90 100644
> > > --- a/drivers/hwmon/pmbus/Kconfig
> > > +++ b/drivers/hwmon/pmbus/Kconfig
> > > @@ -702,6 +702,15 @@ config SENSORS_XDP710
> > >         This driver can also be built as a module. If so, the module =
will
> > >         be called xdp710.
> > >
> > > +config SENSORS_XDP720
> > > +     tristate "Infineon XDP720 family"
> > > +     help
> > > +       If you say yes here you get hardware monitoring support for I=
nfineon
> > > +       XDP720.
> > > +
> > > +       This driver can also be built as a module. If so, the module =
will
> > > +       be called xdp720.
> > > +
> > >   config SENSORS_XDPE152
> > >       tristate "Infineon XDPE152 family"
> > >       help
> > > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makef=
ile
> > > index d6c86924f887..1cac7ccae79f 100644
> > > --- a/drivers/hwmon/pmbus/Makefile
> > > +++ b/drivers/hwmon/pmbus/Makefile
> > > @@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)     +=3D tps546d24.=
o
> > >   obj-$(CONFIG_SENSORS_UCD9000)       +=3D ucd9000.o
> > >   obj-$(CONFIG_SENSORS_UCD9200)       +=3D ucd9200.o
> > >   obj-$(CONFIG_SENSORS_XDP710)        +=3D xdp710.o
> > > +obj-$(CONFIG_SENSORS_XDP720) +=3D xdp720.o
> > >   obj-$(CONFIG_SENSORS_XDPE122)       +=3D xdpe12284.o
> > >   obj-$(CONFIG_SENSORS_XDPE152)       +=3D xdpe152c4.o
> > >   obj-$(CONFIG_SENSORS_ZL6100)        +=3D zl6100.o
> > > diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp72=
0.c
> > > new file mode 100644
> > > index 000000000000..382dc3f9ce80
> > > --- /dev/null
> > > +++ b/drivers/hwmon/pmbus/xdp720.c
> > > @@ -0,0 +1,123 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Hardware monitoring driver for Infineon XDP720 Digital eFuse Cont=
roller
> > > + *
> > > + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> > > + */
> > > +
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/init.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/math64.h>
> > > +#include "pmbus.h"
> > > +
> > > +/*
> > > + * The IMON resistor required to generate the system overcurrent pro=
tection.
> > > + * Arbitrary default Rimon value: 2k Ohm
> > > + */
> > > +#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> > > +#define XDP720_TELEMETRY_AVG 0xE9
> > > +
> > > +static struct pmbus_driver_info xdp720_info =3D {
> > > +     .pages =3D 1,
> > > +     .format[PSC_VOLTAGE_IN] =3D direct,
> > > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > > +     .format[PSC_CURRENT_OUT] =3D direct,
> > > +     .format[PSC_POWER] =3D direct,
> > > +     .format[PSC_TEMPERATURE] =3D direct,
> > > +
> > > +     .m[PSC_VOLTAGE_IN] =3D 4653,
> > > +     .b[PSC_VOLTAGE_IN] =3D 0,
> > > +     .R[PSC_VOLTAGE_IN] =3D -2,
> > > +     .m[PSC_VOLTAGE_OUT] =3D 4653,
> > > +     .b[PSC_VOLTAGE_OUT] =3D 0,
> > > +     .R[PSC_VOLTAGE_OUT] =3D -2,
> > > +     /*
> > > +      * Current and Power measurement depends on the RIMON (kOhm) an=
d
> > > +      * GIMON(microA/A) values.
> > > +      */
> > > +     .m[PSC_CURRENT_OUT] =3D 24668,
> > > +     .b[PSC_CURRENT_OUT] =3D 0,
> > > +     .R[PSC_CURRENT_OUT] =3D -4,
> > > +     .m[PSC_POWER] =3D 4486,
> > > +     .b[PSC_POWER] =3D 0,
> > > +     .R[PSC_POWER] =3D -1,
> > > +     .m[PSC_TEMPERATURE] =3D 54,
> > > +     .b[PSC_TEMPERATURE] =3D 22521,
> > > +     .R[PSC_TEMPERATURE] =3D -1,
> > > +
> > > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN =
|
> > > +                PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATU=
S_INPUT |
> > > +                PMBUS_HAVE_STATUS_TEMP,
> > > +};
> > > +
> > > +static int xdp720_probe(struct i2c_client *client)
> > > +{
> > > +     struct pmbus_driver_info *info;
> > > +     int ret;
> > > +     u32 rimon;
> > > +     int gimon;
> > > +
> > > +     info =3D devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info)=
,
> > > +                         GFP_KERNEL);
> > > +     if (!info)
> > > +             return -ENOMEM;
> > > +
> > > +     ret =3D i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> > > +     if (ret < 0) {
> > > +             dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret >>=3D 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value =
*/
> > > +     ret &=3D GENMASK(0, 0);
> > > +     if (ret =3D=3D 1)
> > > +             gimon =3D 18200; /* output gain 18.2 microA/A */
> > > +     else
> > > +             gimon =3D 9100; /* output gain 9.1 microA/A */
> > > +
> > > +     if (of_property_read_u32(client->dev.of_node,
> > > +                              "infineon,rimon-micro-ohms", &rimon))
> > > +             rimon =3D XDP720_DEFAULT_RIMON; /* Default if not set v=
ia DT */
> > > +     if (rimon =3D=3D 0)
> > > +             return -EINVAL;
> > > +
> > > +     /* Adapt the current and power scale for each instance */
> > > +     info->m[PSC_CURRENT_OUT] =3D DIV64_U64_ROUND_CLOSEST((u64)
> > > +             info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000=
);
> > > +     info->m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64)
> > > +             info->m[PSC_POWER] * rimon * gimon, 1000000000000);
> > > +
> > > +     return pmbus_do_probe(client, info);
> > > +}
> > > +
> > > +static const struct of_device_id xdp720_of_match[] =3D {
> > > +     { .compatible =3D "infineon,xdp720" },
> > > +     {}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, xdp720_of_match);
> > > +
> > > +static const struct i2c_device_id xdp720_id[] =3D {
> > > +     { "xdp720" },
> > > +     {}
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, xdp720_id);
> > > +
> > > +static struct i2c_driver xdp720_driver =3D {
> > > +     .driver =3D {
> > > +                .name =3D "xdp720",
> > > +                .of_match_table =3D xdp720_of_match,
> > > +     },
> > > +     .probe =3D xdp720_probe,
> > > +     .id_table =3D xdp720_id,
> > > +};
> > > +
> > > +module_i2c_driver(xdp720_driver);
> > > +
> > > +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> > > +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse C=
ontroller");
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_IMPORT_NS("PMBUS");
> >
