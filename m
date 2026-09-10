Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B9481AA4
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043756; cv=pass; b=BF8tn7Zdbt1GEXwbs3wW98ndi4akgPhtClw/0QyvLtaF6wDTBjL2QF1veapRlBg7+3m/Xncv1c07gj4lFTT184200fEhixAWQSzPlTX0JWsMhlqCFUMJ1tkb+h6DUWdJHx85Dt/fn54E8qTWwPuYB9cBf/7Zh0q+ssQcDalAJrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043756; c=relaxed/simple;
	bh=3QNl9J8mitkeiSvGDN/UT/SMZ+Mm0hyaBOOHnWAVZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0/UHJODWXnjAOnxcmalFivqQ1WnoytWxefvNaVjnJLARBAbsm7cGvl8inwluW9fbtEyhlmjjbBW6kuwQ8Mpx+w4C21OTG0rQxhCMa1VtLalo0lKDeKf/rH806FpKDPrz7PeqWCIl1/4QEW0MIVfMrPN25j1eeGPvM8gqJ7eLAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayC0bF8k; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayC0bF8k"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78fb1fb9508so654072137.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 05:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789043753; cv=none;
        d=google.com; s=arc-20260327;
        b=BQrbZ1z+mRz5witAupsFBBy0IUyfs/cYLYnChwzM2i/z3XICsXvfQVfNam6FaU3tJl
         3EmpWKNI0frHyXGFyW24bpDOLE4/BvCeYQe7iOAUVuMbHX9Y6p0HUDGNo/wSs0ML7LhS
         wZpJwHfBq7g/U+Amz94E1+O9w2bopl1td8lYL9Wy/EAOuKtLphQJeL2rnJx8tm2/ZeHH
         wMk/EXyjPnhrCQF/T7g5im0auTy8oQW2UFmyHYzzIl85M2l2M96GB7MolfdhLoudKuQd
         FMHxuHYYqPAfiEMlhb7eq5D4q1gELQQ+HPL84nNMFEid4ZWMft308OkBGJvrdxqbPoy1
         OEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USiUqUD8S/Y9N+JUYgnVXLlnBrLijvaF9UlhS8aFiXQ=;
        fh=ZK/zikAtlrA+DXAKA7IVY6iYJssSfIl0itpwJL+ckcE=;
        b=pvC2+vmldTVRfN0FrUyg7occF1W8PYO2io4ir6BFj1EVk9CwucFY5JPxUSajivscCQ
         QF8o7x1zvPwVW+bOdG6YkfXIXn7mr3SKUW3RT6rwpbWH01UL8cAttS4DSK/mX23CnO6t
         snIjyk0/BSU7oZesHiwcBlOvsqj8HDHDGUwqzHyvd28cGtrwwGcSdFegFHcVpjXxjuI0
         vdVEMN0mgWCeOLp47BSeii5M8T7GRvYA7nBvk1xb88VSB5SaCOnUGDQlgkDyh7FVV9l4
         zqWZlAUHgvaO09avRI5z3WkyqcLP6SKYVwXTaE1Z1i2Vfd1cAZXJTRcrKzHkI/kJn4RY
         N05A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043753; x=1789648553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USiUqUD8S/Y9N+JUYgnVXLlnBrLijvaF9UlhS8aFiXQ=;
        b=ayC0bF8k6H8t+Z2k24lB2s+2ovZFT35f05B8BP2UUaYrrzFdixaJkbLn38cTMizLoZ
         eCemnrUrQ6AtJs5fTgUTu1xsgq3mmOETqYKVyuy+RBlWn9/3ONqD26uTODMavumCgM2+
         4M6wzdH0uKs/q8IRFxfxCQhlDTeeYlL8YI+xiULgiNr8V/bFeb4V1Ai7EKtxY4zonYLZ
         IQu+pWme5mBup/Toy0UiI6V4Bc0NHGtquuYRe1cCEG5Lm7T19wEQnOuljANGva7DoYRl
         pd/IYOcnjNA33NFhbFW+07GBgCOrBb+gnszS3eh+1iNYO9rlCwDJXqToxGGIyffeRkFq
         yOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043753; x=1789648553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USiUqUD8S/Y9N+JUYgnVXLlnBrLijvaF9UlhS8aFiXQ=;
        b=F8Sdmn9ylUTdMSY5XCweft2v2qLLh+Q9BiBfmWYju9kPgemPnImjaxp5o59q/TPq0l
         LMEGCaMRdpA+cO7Or7RAMXWcsdNhG/Xq+TECzhgzKNSi0MKBq7QUFZirYMe/JhvT83Qu
         J2yUm++Q/g81gpTeiVUru8FWYhzHMwN/td4elbQOqo4JjL5ViE60vwBiberIARfJfI1Y
         j7vKSb5yIdH/yPNFg5cCkao94QghHgHoUyy02rbaHoEPknP/JF06BFccPOYc7PIEd7vV
         1ppDvNHtrwOjRfh/dbtpLOI9l9DRPLs82AizX64jRKprcI/Zy7G6p69iCg0n39aWmYMC
         ajRw==
X-Forwarded-Encrypted: i=1; AKwUvBz68R1F0hU8zWAAii4WEZgrvQpzPb1VlY6VyXguHyg7R785Xuukr9Esm9mNdDQjr8xUYQjiaHcZYCaY/g==@vger.kernel.org
X-Gm-Message-State: AFuF++lE17AT/sLGZDICsY95Na7tDAFbOLNywqoJoOovaQXj+flNgnvQ
	p48Q4lUh0MbNUbLR/jlhOvCtdoVyRvIKKpQK1beT1ENh7z1Y8la1BwSy/dfO3ln4Q7gsS8GL361
	lFLUNi70dWWc5lGyy3FChmWmQjfwxV+Y=
X-Gm-Gg: AYBFou3kwh9qUdVPNfQfWV/LwtxaLMkviCcMONEeTVxZsNClMdtvZQrFYjoMMDHgECL
	msrGyunyk6JYD13bVXyMGGhKg2g8VD61x734LdYaRogsThexYoT3Fg18wgv3Jtiwp2w3+D4+clp
	FWqZCE6qMjrC6AJrpB/N5q9UUAITVTrMY7UWByudXkJMBCL7tCAVGiXiOGD8rtqb5f3NyISxRki
	81xo8LU41dlwn5NoqSiFvcsTJ6aBSjHqE+OotNK/AKWk0W4dO/h8jfFPPxdxSNQmXgTq6YYk5f4
	15EGoLvivxVnLCnXpzWMEF1oN37bEYFLuE+/hpIUj5ziWCLnBwHnfh+3mM1qAFGWpD1GqQ==
X-Received: by 2002:a67:eb48:0:b0:791:740b:7ce6 with SMTP id
 ada2fe7eead31-791741bc3bemr534083137.11.1789043753031; Thu, 10 Sep 2026
 05:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com> <045b177a-7501-4c73-871e-5d9f78d6bcce@roeck-us.net>
In-Reply-To: <045b177a-7501-4c73-871e-5d9f78d6bcce@roeck-us.net>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 10 Sep 2026 20:35:41 +0800
X-Gm-Features: AcwNN1XoHSr8FamRmjmrT765YkGEYJIbBi0T4ehpgPPy_ta7um_0KmhY6LlEwRM
Message-ID: <CAPBH0A81ksHcGJPar-rTU+UVfOTxuV_RtSwdV1cuYEdhoWeo_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
To: Guenter Roeck <linux@roeck-us.net>
Cc: Colin Huang <colin.huang2@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 9/9/26 23:18, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add a PMBus driver for Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >   drivers/hwmon/pmbus/Kconfig    |   9 +++
> >   drivers/hwmon/pmbus/Makefile   |   1 +
> >   drivers/hwmon/pmbus/tda38740.c | 150 ++++++++++++++++++++++++++++++++=
+++++++++
>
> Documentation is missing.
>
Hi Guenter,

Thanks for review.

I will prepare Documentation/hwmon/tda38740.rst file for this driver.

> >   3 files changed, 160 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index bcfdc4ce4c10..e4ca80dd0574 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
> >         If you say yes here you get regulator support for Infineon
> >         TDA38640 as regulator.
> >
> > +config SENSORS_TDA38740
> > +     tristate "Infineon TDA38725/TDA38740"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Inf=
ineon
> > +       TDA38725 and TDA38740.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called tda38740.
> > +
> >   config SENSORS_TPS25990
> >       tristate "TI TPS25990"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index e288fe72a437..eb06d47816fd 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)     +=3D stef48h28.o
> >   obj-$(CONFIG_SENSORS_SQ24860)       +=3D sq24860.o
> >   obj-$(CONFIG_SENSORS_STPDDC60)      +=3D stpddc60.o
> >   obj-$(CONFIG_SENSORS_TDA38640)      +=3D tda38640.o
> > +obj-$(CONFIG_SENSORS_TDA38740)       +=3D tda38740.o
> >   obj-$(CONFIG_SENSORS_TPS25990)      +=3D tps25990.o
> >   obj-$(CONFIG_SENSORS_TPS40422)      +=3D tps40422.o
> >   obj-$(CONFIG_SENSORS_TPS53679)      +=3D tps53679.o
> > diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38=
740.c
> > new file mode 100644
> > index 000000000000..df5173d8da0c
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tda38740.c
> > @@ -0,0 +1,150 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Infineon TDA38725/TDA38740
> > + *
> > + * Copyright (c) 2023 9elements GmbH
> > + *
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include "pmbus.h"
> > +
> > +#define TDA38740_VOUT_SCALE_DEFAULT_MICRO    1000000
> > +#define TDA38740_VOUT_SCALE_MIN_MICRO                100000
> > +#define TDA38740_VOUT_SCALE_MAX_MICRO                2000000
> > +
> > +struct tda38740_data {
> > +     struct pmbus_driver_info info;
> > +     u32 vout_scale_micro;
> > +};
> > +
> > +static int tda38740_read_word_data(struct i2c_client *client, int page=
,
> > +                                int phase, int reg)
> > +{
> > +     const struct tda38740_data *data;
> > +     int ret;
> > +     u64 scaled;
> > +
> > +     if (reg !=3D PMBUS_READ_VOUT)
> > +             return -ENODATA;
> > +
> > +     ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     data =3D container_of(pmbus_get_driver_info(client), struct tda38=
740_data,
> > +                         info);
> > +
> > +     scaled =3D (u64)ret * data->vout_scale_micro;
> > +     scaled =3D DIV_ROUND_CLOSEST_ULL(scaled,
> > +                                    TDA38740_VOUT_SCALE_DEFAULT_MICRO)=
;
> > +
>
> The chip supports VOUT_SCALE_LOOP, which should be used for any VOUT scal=
ing.
> VOUT values should not be manipulated manually.
>
> Also, Sashiko is correct in complaining about not scaling other VOUT
> related commands, both on the read and write side. The chip _does_ suppor=
t
> limit commands.

I will remove the code related vout_scale_micro  support.

>
> > +     return clamp_val(scaled, 0, U16_MAX);
> > +}
> > +
> > +/*
> > + * TDA38725/TDA38740 only support Linear format for VOUT related comma=
nds,
> > + * with exponents in the range of -8 to -12 (see datasheet VOUT_MODE
> > + * description). Direct format is not supported by this device.
> > + */
> > +static int tda38740_identify(struct i2c_client *client,
> > +                          struct pmbus_driver_info *info)
> > +{
> > +     int vout_mode;
> > +
> > +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > +     if (vout_mode < 0 || vout_mode =3D=3D 0xff)
> > +             return vout_mode < 0 ? vout_mode : -ENODEV;
> > +
> > +     if ((vout_mode >> 5) !=3D 0)
> > +             return -ENODEV;
> > +
> > +     info->format[PSC_VOLTAGE_OUT] =3D linear;
> > +
> > +     return 0;
> > +}
> > +
> > +static struct pmbus_driver_info tda38740_info =3D {
> > +     .pages =3D 1,
>
> The chips support the PAGE command, described as "Allows access
> of each loop via paging". I don't know what exactly that refers to,
> but it does look like it supports multiple pages.


TDA38725/TDA38740 are 40A/25A "Single-voltage" Synchronous Buck Regulator
It's one page.

> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_CURRENT_IN] =3D linear,
> > +     .format[PSC_POWER] =3D linear,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +         | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +         | PMBUS_HAVE_IIN
> > +         | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +         | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +         | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> > +     .identify =3D tda38740_identify,
> > +};
> > +
> > +static int tda38740_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct tda38740_data *data;
> > +     const char *propname;
> > +     u32 vout_scale_micro;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     propname =3D "infineon,vout-scale-micro";
> > +     if (device_property_present(dev, propname)) {
> > +             ret =3D device_property_read_u32(dev, propname, &vout_sca=
le_micro);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "%s property read fail.\n",
> > +                                          propname);
> > +     } else {
> > +             vout_scale_micro =3D TDA38740_VOUT_SCALE_DEFAULT_MICRO;
> > +     }
> > +
> > +     if (vout_scale_micro < TDA38740_VOUT_SCALE_MIN_MICRO ||
> > +         vout_scale_micro > TDA38740_VOUT_SCALE_MAX_MICRO)
> > +             return -EINVAL;
> > +
> > +     memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> > +     data->vout_scale_micro =3D vout_scale_micro;
> > +     data->info.read_word_data =3D tda38740_read_word_data;
> > +
> > +     return pmbus_do_probe(client, &data->info);
> > +}
> > +
> > +static const struct i2c_device_id tda38740_id[] =3D {
> > +     { .name =3D "tda38725"},
> > +     { .name =3D "tda38740"},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, tda38740_id);
> > +
> > +static const struct of_device_id __maybe_unused tda38740_of_match[] =
=3D {
> > +     { .compatible =3D "infineon,tda38725"},
> > +     { .compatible =3D "infineon,tda38740"},
> > +     { },
>
> No "," here.
I will remove it.

>
> > +};
> > +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> > +
> > +/* This is the driver that will be inserted */
>
> Pointless comment.
>
I will remove it.

> > +static struct i2c_driver tda38740_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "tda38740",
> > +             .of_match_table =3D of_match_ptr(tda38740_of_match),
> > +     },
> > +     .probe =3D tda38740_probe,
> > +     .id_table =3D tda38740_id,
> > +};
> > +
> > +module_i2c_driver(tda38740_driver);
> > +
> > +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
> >
>
