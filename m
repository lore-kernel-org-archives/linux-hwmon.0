Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9F3E51F4
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139005; cv=pass; b=c/OSzwdOiujgp92tlX5xRNg6FdbyGgSkDlASj6Y9XnXTcJZYUGc+ZOhQt6yr2krRIFUjRO1cCCdctP75raC9fYUbfZYkFPRyHGXU3PHKu1zqCMmwD++tGi/M0RLbcUYHjv3M/NAcgXUFqfkh0CwT97DNSqikzCFcyhuKfGPEbfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139005; c=relaxed/simple;
	bh=15q81HBevs+A9wenGNiMAI9Bff2XPMoTLw/n7wfRpSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRZTyKt3Bxq1mfzKQAJ7JkjsCSRa0+1L6Y8Peah0OUHhSuZqWHeVL6eoKJD1s4TNjqr9V1mu+iZxgL4X8H4hLnPzdSyoKLkoSCVeaxArdmhEDakEYJOnuo0PFN6Tv1jg4eG1tzr5pjFv98T+KTMXbYYDr3XfQF0LQnr2BlW99R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8L2u/aW; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8L2u/aW"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so799702eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 07:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775139002; cv=none;
        d=google.com; s=arc-20240605;
        b=bY6tZJqYJIBmqbVrGfbCQ1uSkPUeWPy+YD1KLf7R17Q4k1BDsNT5s5RGif98vmEd3H
         y9XF6CEqaKfh+qW2nMZTeYt/nqDGUJMIH1ndBpmbJjo1L3Juqt4M5uH3PJ7w+8WMDgb0
         yFK04J8Lvrcq9D1vBWHTDIygKpsogIUtX0nJI3ipN76so1qdzWkNGq9s4J0AW9Y54uQS
         kd5xmzitixRBCGFNB6Z9a1xGaDPiMtkYzAmhlAH4v750cu8Je0x234OCVRImaA7FcCam
         XyQqLRBSqpio9UucK96gnPg1oDVy0d+ApZuDYVj556UKE7xJt5oG+10iLscS03tvRTRD
         d9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egzl6ANfSVtKs6RC5InKgJ5AfRkt8TWotX/Bdl/X9hI=;
        fh=dTcxxOb9F44jV0AMRhu4O+O6MA2MBhbZkNr7wsDYuNk=;
        b=U46psOBc024KqWVE3Zqm2QFkgVjb5YETJ1DUN0UZMQBWaq6ybqdLnL7rgxKfMAVMK4
         LZ8TTaRQtsxzxwZroQ9ahhFJrVZSlVfa44ZPlKaAcdtWQ0OD8DnO89cHa/u7kuxZP6ce
         vkjOzHMlKZenX6IH0rosHpNRLCGZD5K2rkkVB8fBNbr0dTC7OJHuJtHvMpU14hClP8Y0
         muHm8XiaFWQQbH6G1e4quID4oOH1mgKQUxutdQn62ejlhenta4SQ0TeQoyj80pdlRddX
         Mq+IXKKUnDoAMGxN3Qj3f4uzcrPtsyi3n3SoGPcw3J+/CJI5zNGSB4aA+SCU4Pwsoo3L
         wsxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775139002; x=1775743802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egzl6ANfSVtKs6RC5InKgJ5AfRkt8TWotX/Bdl/X9hI=;
        b=d8L2u/aW7fQzvXRIzOR1hiE+6SwH4tjud1SKr2yumXSHfQWpD6QUwkw2Z4SzeOdjQ2
         4zIYrBSVYMreqt89IbtFFYvo4NB9ujooPDr/aMHx2cgmacPpGoQU2aLQKD7YZBhcFE+X
         i2kepajZnVDwPBRjGBVPNLV8HaMd8V/46YPr+DYsC/4/rcBwPwuo9gkCcNLhA/Held34
         teqW3BMx0khAN/fAd7I6m5pHumgETLufamnWH5EO60bDuOtcZMbEBa8Gt4cVOA3Jj497
         2Y5OSCsxzcinv3uE7rgkOjyL9XtlqxoFWdNvMuVaQncjwFQSPt7czERSs9HD7sUN4jaN
         0DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139002; x=1775743802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egzl6ANfSVtKs6RC5InKgJ5AfRkt8TWotX/Bdl/X9hI=;
        b=ZXUcibPliWD4cilBoWGs+UdsTO2wpJ1n2KNIz1DPezqhb48yu/qEbbIGrsGhbzod3l
         vA3ZlaVKR9NXPT2ChajOGbn1LDmF0MI7BYR5cHB/6Z5O2Onl54WA63fExjn2mUAyRmjw
         0QgoUvWQN0GXvDWZLuDAbDM/R/oNTy/I/FDRZCSEhLSqJtDeNc1mpZQGG0424+uD0YLh
         +0UYkwBBfLK9dedrLQ+wMct2UGLoFe+sSPCIUoOheiGtGmAA7kR9uO0nWOilmvTEWI1E
         bY2yhIkYp8KRGV40AejvtGjjL/27axms96Y683yRvPWae0l59vjYyeScVOcwK1Ag1gm4
         MibQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWfpCZTM2hFosJ6ypXUukKatFXNDxfxaOSsIHmg0Y+gyyoOxlPasZn2Kd6f+TixpgqElQSJkoPQj9YQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKRndV8P5tYaHgWGMAA+DwLkCDDKwcG5TwMmnJJh9wxY+wQMN
	nVD+0dO+Y5lGqm48avkSFGVlwp+pPQLKoJJw0/MVNGaAyuI1NdGAmNkrT/pJenkAwW+0nGfsaRR
	WBvDwpiFLaZG82DLa2GjzjTPQv8D+MeJDsg==
X-Gm-Gg: AeBDietwkv26JTOx6lVG/dyUw5WtuOmSSB/SXK9HCC12YPh9w9MYAg4PKcvDmYxI8I7
	eQLQA3uWR19uIL9QgYWz4OD/BOYEexVKIFDCb09NiiT72bcrwgNsXrsJ/b+R8wSqE09cJyKQeyW
	+Pp026xvSCAUIXSOgXIySxIXojARtXkj9mKXXgx1x3w1yjXc6BM556vlL2yUNaxjJ/eN3EAaxkb
	fgOEv41vtPI5v90HUVXJsntCygxLHf3muysU25gLOOQn/YvV3gxdSX1YQ9vAzvFHnAfL2rbLgXX
	BeDnug==
X-Received: by 2002:a05:7301:3d12:b0:2c7:357a:3347 with SMTP id
 5a478bee46e88-2c9323bb066mr4660462eec.16.1775139002109; Thu, 02 Apr 2026
 07:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
 <20260401104550.115715-3-Ashish.Yadav@infineon.com> <258dd77a-a8d9-4540-a32a-91a3f13c6ed5@roeck-us.net>
In-Reply-To: <258dd77a-a8d9-4540-a32a-91a3f13c6ed5@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 2 Apr 2026 19:39:50 +0530
X-Gm-Features: AQROBzBG2ksmulMN2Ba34MJxLNnqxi3QjmSkHZe33Z35q2zbtMR4lwKzdPbdK2E
Message-ID: <CAJKbuCbrqRHcy28TvhkQxh6eiLb1RpWYekx5WXPj6S=qO8CNvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for your valuable feedback and time.
Please find my response in-line.

With Best Regards,
  Ashish Yadav

On Wed, Apr 1, 2026 at 9:26=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> Hi,
>
> On 4/1/26 03:45, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> > XDP720 Digital eFuse Controller provides accurate system telemetry
> > (V, I, P, T) and reports analog current at the IMON pin for post-proces=
sing.
> >
> > The Current and Power measurement depends on the RIMON and GIMON values=
.
> > Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
> > https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp=
720-001-datasheet-en.pdf
> >
> > The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Reg=
ister.
> > The value of RIMON (kohm) can be provided by the user through device tr=
ee using
> > infineon,rimon-micro-ohms  property.
>
> Please have a look at
>
> https://sashiko.dev/#/patchset/20260401104550.115715-1-Ashish.Yadav%40inf=
ineon.com
>
> Main concern is the power measurement range, but also please use 10000000=
00000ULL
> as suggested.

Sure, We will look into it and get back to you.

> Thanks,
> Guenter
>
> > ---
> >   drivers/hwmon/pmbus/Kconfig  |   9 +++
> >   drivers/hwmon/pmbus/Makefile |   1 +
> >   drivers/hwmon/pmbus/xdp720.c | 123 ++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 133 insertions(+)
> >   create mode 100644 drivers/hwmon/pmbus/xdp720.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index fc1273abe357..c419e3ecce90 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -702,6 +702,15 @@ config SENSORS_XDP710
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called xdp710.
> >
> > +config SENSORS_XDP720
> > +     tristate "Infineon XDP720 family"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Inf=
ineon
> > +       XDP720.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called xdp720.
> > +
> >   config SENSORS_XDPE152
> >       tristate "Infineon XDPE152 family"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index d6c86924f887..1cac7ccae79f 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)     +=3D tps546d24.o
> >   obj-$(CONFIG_SENSORS_UCD9000)       +=3D ucd9000.o
> >   obj-$(CONFIG_SENSORS_UCD9200)       +=3D ucd9200.o
> >   obj-$(CONFIG_SENSORS_XDP710)        +=3D xdp710.o
> > +obj-$(CONFIG_SENSORS_XDP720) +=3D xdp720.o
> >   obj-$(CONFIG_SENSORS_XDPE122)       +=3D xdpe12284.o
> >   obj-$(CONFIG_SENSORS_XDPE152)       +=3D xdpe152c4.o
> >   obj-$(CONFIG_SENSORS_ZL6100)        +=3D zl6100.o
> > diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.=
c
> > new file mode 100644
> > index 000000000000..382dc3f9ce80
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/xdp720.c
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Infineon XDP720 Digital eFuse Contro=
ller
> > + *
> > + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of_device.h>
> > +#include <linux/bitops.h>
> > +#include <linux/math64.h>
> > +#include "pmbus.h"
> > +
> > +/*
> > + * The IMON resistor required to generate the system overcurrent prote=
ction.
> > + * Arbitrary default Rimon value: 2k Ohm
> > + */
> > +#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> > +#define XDP720_TELEMETRY_AVG 0xE9
> > +
> > +static struct pmbus_driver_info xdp720_info =3D {
> > +     .pages =3D 1,
> > +     .format[PSC_VOLTAGE_IN] =3D direct,
> > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > +     .format[PSC_CURRENT_OUT] =3D direct,
> > +     .format[PSC_POWER] =3D direct,
> > +     .format[PSC_TEMPERATURE] =3D direct,
> > +
> > +     .m[PSC_VOLTAGE_IN] =3D 4653,
> > +     .b[PSC_VOLTAGE_IN] =3D 0,
> > +     .R[PSC_VOLTAGE_IN] =3D -2,
> > +     .m[PSC_VOLTAGE_OUT] =3D 4653,
> > +     .b[PSC_VOLTAGE_OUT] =3D 0,
> > +     .R[PSC_VOLTAGE_OUT] =3D -2,
> > +     /*
> > +      * Current and Power measurement depends on the RIMON (kOhm) and
> > +      * GIMON(microA/A) values.
> > +      */
> > +     .m[PSC_CURRENT_OUT] =3D 24668,
> > +     .b[PSC_CURRENT_OUT] =3D 0,
> > +     .R[PSC_CURRENT_OUT] =3D -4,
> > +     .m[PSC_POWER] =3D 4486,
> > +     .b[PSC_POWER] =3D 0,
> > +     .R[PSC_POWER] =3D -1,
> > +     .m[PSC_TEMPERATURE] =3D 54,
> > +     .b[PSC_TEMPERATURE] =3D 22521,
> > +     .R[PSC_TEMPERATURE] =3D -1,
> > +
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> > +                PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_=
INPUT |
> > +                PMBUS_HAVE_STATUS_TEMP,
> > +};
> > +
> > +static int xdp720_probe(struct i2c_client *client)
> > +{
> > +     struct pmbus_driver_info *info;
> > +     int ret;
> > +     u32 rimon;
> > +     int gimon;
> > +
> > +     info =3D devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> > +                         GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     ret =3D i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> > +             return ret;
> > +     }
> > +
> > +     ret >>=3D 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> > +     ret &=3D GENMASK(0, 0);
> > +     if (ret =3D=3D 1)
> > +             gimon =3D 18200; /* output gain 18.2 microA/A */
> > +     else
> > +             gimon =3D 9100; /* output gain 9.1 microA/A */
> > +
> > +     if (of_property_read_u32(client->dev.of_node,
> > +                              "infineon,rimon-micro-ohms", &rimon))
> > +             rimon =3D XDP720_DEFAULT_RIMON; /* Default if not set via=
 DT */
> > +     if (rimon =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     /* Adapt the current and power scale for each instance */
> > +     info->m[PSC_CURRENT_OUT] =3D DIV64_U64_ROUND_CLOSEST((u64)
> > +             info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000);
> > +     info->m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64)
> > +             info->m[PSC_POWER] * rimon * gimon, 1000000000000);
> > +
> > +     return pmbus_do_probe(client, info);
> > +}
> > +
> > +static const struct of_device_id xdp720_of_match[] =3D {
> > +     { .compatible =3D "infineon,xdp720" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, xdp720_of_match);
> > +
> > +static const struct i2c_device_id xdp720_id[] =3D {
> > +     { "xdp720" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, xdp720_id);
> > +
> > +static struct i2c_driver xdp720_driver =3D {
> > +     .driver =3D {
> > +                .name =3D "xdp720",
> > +                .of_match_table =3D xdp720_of_match,
> > +     },
> > +     .probe =3D xdp720_probe,
> > +     .id_table =3D xdp720_id,
> > +};
> > +
> > +module_i2c_driver(xdp720_driver);
> > +
> > +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Con=
troller");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
>
