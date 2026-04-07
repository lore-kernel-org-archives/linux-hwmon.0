Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D43A0E99
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Apr 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557832; cv=pass; b=LxLc57oAjV5yU52nn2aCq5AQt9GrmSoZFxkqNBl1eh+UTbcSXyckc43L3m1tQkd9FCHsnsYI7sxR3qwyPnIzYSjx1uPqG1QJloY9zwSQdQxprhw9fRKlMFOCs9DubqLHJoU6MEr35blT7rvtc2ETnyhhCAPy4wUl7S/i1M4KAvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557832; c=relaxed/simple;
	bh=Ba+EPBIXHLX5yi91gfChxyHyKGIt/RO5OcF1N/vWGsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itlqbRjpt3LnyFpBvaNKskMjCD1unhaU/wzJs/byWLFHq1CEEdO9GR4bU3gND1xcW1/nI7dWd1mZOTIFiANGLkn/fiYjPuDBzPnGKPiMQyaff/OhYp+Df4KSBqxNtUFmVe4P5V1aaoXqRXNjToYAAWa7b9NvOjF89ts7o1AXZjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhPqlvBj; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhPqlvBj"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c156c4a9efso6085544eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 03:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557830; cv=none;
        d=google.com; s=arc-20240605;
        b=b45YBjNbhDJM6cFnKFfCTwADZuz1AD4bdqQKJOtvfpej/izm36ANGznFEZ7HJnSjaI
         KN4HmGzxQTZ6Z9YhSivcMJ4T98XVHQVIH1621AErTBdYQOSV/ASWKYIt3m3U/V69spYP
         Beyw1vGwJXU44mL2M3LuyDxPccpMscEZa+CZqDhgz5Kf3qLZtBmysmXLfJt16Vf/Iq1y
         OxwJlvMxvmCwvTCbxzitm80djXYvFrCyVqOyZTQtoXakICcKK7TNBvB2R99EDEs61JiI
         cslth6uzPnrEpZizB3NUvf5G8bUMrmErEGlY5lUExOqFOoYFlVFRMR9jdqMuqSWBdlOC
         Gr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LU59ZAtUrZsopurC7wrRYfVPPQHDPwx0HnnnYqVagoU=;
        fh=xxOFebF2TsUH9ieMmhUp9RvzdTQPwO8W18LEo6R0vUM=;
        b=JC5OG1vzjNIw9jWzLyrNRMobr3wnvajrxUzmHFX0ELh9oE4eUN/4laQDkWq58iFrMQ
         PtLei4KeM4ap+bG+zRkiYlofmLFoJga3+S/hpipT+OGjU0tSWfgRbRfbjWdLZpzayQIS
         sZfcbAdnGU+ZpURkyKgFbhSiuJIQ+ZJU7ktFLgBsKwpPa3pwi0KE3yq5DmzS/Ah79861
         KJfOy1mOGNP3QQ0pExaB5+zmt6MfWpp9e7Sey0dUMJVG+tzuUYqbE4QemY4GvNhzCBER
         A7nIJ/KJ6ObVw2vvQjU0JmCOlyKq7z30NzcT+0jLjgYARaqeJtio+QS6bo2gkqgxPrBB
         uK2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775557830; x=1776162630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU59ZAtUrZsopurC7wrRYfVPPQHDPwx0HnnnYqVagoU=;
        b=OhPqlvBjov9tH41oQAt6fX3Pqt0VWiTl7dBBEHS98f1PL5X/aWBMrx5rE/aKiiiIoi
         IgS1LePj7T+Vq4NKcyERWizj7xY6LnMq7Xo1pGTsCSD5chXG9Y+MaKgBOgNsSfqqLq8h
         KqbFLhcUpEX5q953l/dTWUUURp9rtP5Bk8uQDwxtYIaT/vxDaCPc8FEYeTRT79b7R1Cn
         uA7TuKnSQOHg9RqE/i5OR6Qm6vCNY3c6oyX92DMle+tR+RkJh4KfAMMDZzen0fKU4o5+
         zTluE8ocuABIS1gfmc6p6Jysciamji/cnVZCH2dfsuZE5KPe3dfQJ0r8Gk4s30+eL0Hq
         LKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557830; x=1776162630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU59ZAtUrZsopurC7wrRYfVPPQHDPwx0HnnnYqVagoU=;
        b=BZwvTONpRBaubv/HZyvdIuXMZrgTaYLM3Xd5L/Yc/Budop3YqujyMXRVBbI3zS2iAe
         xGd+dSqapk+BXRDHik9Ug2ekGxHXWlzPOZ+uqY+CJRfoPOVAAl0qnJOBMMrFUcAi6zN/
         2eoEJv8jhPzMS34SFFRf5ONx4NB8fvFPR0ahJM1ZqLudFAqieCq6P7qyk0o0Nwkv3VMv
         V0qRSr/P25x2crA+lyea+zpm3gzmulDoaj7Wu/veau11xJdWr220hj5pjgx+28+0Q5Uj
         npfvmy0AhYwMo48BuyuoUh+o25RUt1C7/qK08RTln5s+D45SZVewFkTKS2J2BO+DQzAC
         P6kw==
X-Gm-Message-State: AOJu0YxFjdCOf+0P0TkcuhKL5xVSQ3YoXUe+AEPbRz9SWswbPpZTygyp
	flUccmqAtlPVtjoap3YRnawNo6dnymrp7qc6XxSEfpIT6JZDzA311l7Jt5USW5mX5edhjA/L67I
	kf2E7cOQE7BmPn4o3p8KN9NoVTx8NYAs=
X-Gm-Gg: AeBDieu6SG4Ma/cqF/x3CRA5HIz2TeGq83ImHNVIOwqhQeilZ/ddHyqgzBCITNWR60H
	iPOD2H8MuAUrpYvtfPas2EAa48kP+x5RqXywhfAWdXxQxIesrd4h6iNUTYZg9t6itbEUzGQTI0Y
	Q7x+BIYgUmk8By2aoeLGjPoOMqKGAW107dOvuwLnLJ841T976IfamMr9S6E+oQdZYxVioL/sm7b
	Wl3WWilIiLmi7m+p2GI3ZotbVF+3AJon03uhuPwP8zukl+sLvITJJ4fvGUZjnIr0iFB1JabCfBf
	Jn5rbfDo/6TKjnmZlOA=
X-Received: by 2002:a05:7300:6d23:b0:2a4:3593:466c with SMTP id
 5a478bee46e88-2cbf9fe2d96mr8206822eec.8.1775557830390; Tue, 07 Apr 2026
 03:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com> <20260406101647.109667-3-Ashish.Yadav@infineon.com>
In-Reply-To: <20260406101647.109667-3-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Tue, 7 Apr 2026 16:00:18 +0530
X-Gm-Features: AQROBzCqb84kfIhnX1-X0hgBC6HBnxqF1ScBqNXT6675NCDCLNPgDaeYR8SOFQc
Message-ID: <CAJKbuCYuor3AstSOuzEK_byqwgdkLsaE9Z9k7kfb3WKpyjK4=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

In this patch, info about vdd-vin-supply is added through
devm_regulator_get_enable().
https://lore.kernel.org/all/20260406101647.109667-2-Ashish.Yadav@infineon.c=
om/

Thanks & Regards
   Ashish Yadav

On Mon, Apr 6, 2026 at 3:47=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.co=
m> wrote:
>
> From: Ashish Yadav <ashish.yadav@infineon.com>
>
> Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.
>
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDP720 Digital eFuse Controller provides accurate system telemetry
> (V, I, P, T) and reports analog current at the IMON pin for post-processi=
ng.
>
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp72=
0-001-datasheet-en.pdf
>
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Regis=
ter.
> The value of RIMON (kohm) can be provided by the user through device tree=
 using
> infineon,rimon-micro-ohms  property.
> ---
>  drivers/hwmon/pmbus/Kconfig  |   9 +++
>  drivers/hwmon/pmbus/Makefile |   1 +
>  drivers/hwmon/pmbus/xdp720.c | 128 +++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/xdp720.c
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..c419e3ecce90 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -702,6 +702,15 @@ config SENSORS_XDP710
>           This driver can also be built as a module. If so, the module wi=
ll
>           be called xdp710.
>
> +config SENSORS_XDP720
> +       tristate "Infineon XDP720 family"
> +       help
> +         If you say yes here you get hardware monitoring support for Inf=
ineon
> +         XDP720.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called xdp720.
> +
>  config SENSORS_XDPE152
>         tristate "Infineon XDPE152 family"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..1cac7ccae79f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)       +=3D tps546d24.o
>  obj-$(CONFIG_SENSORS_UCD9000)  +=3D ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)  +=3D ucd9200.o
>  obj-$(CONFIG_SENSORS_XDP710)   +=3D xdp710.o
> +obj-$(CONFIG_SENSORS_XDP720)   +=3D xdp720.o
>  obj-$(CONFIG_SENSORS_XDPE122)  +=3D xdpe12284.o
>  obj-$(CONFIG_SENSORS_XDPE152)  +=3D xdpe152c4.o
>  obj-$(CONFIG_SENSORS_ZL6100)   +=3D zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> new file mode 100644
> index 000000000000..8729a771f216
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controll=
er
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of_device.h>
> +#include <linux/bitops.h>
> +#include <linux/math64.h>
> +#include "pmbus.h"
> +
> +/*
> + * The IMON resistor required to generate the system overcurrent protect=
ion.
> + * Arbitrary default Rimon value: 2k Ohm
> + */
> +#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_TELEMETRY_AVG 0xE9
> +
> +static struct pmbus_driver_info xdp720_info =3D {
> +       .pages =3D 1,
> +       .format[PSC_VOLTAGE_IN] =3D direct,
> +       .format[PSC_VOLTAGE_OUT] =3D direct,
> +       .format[PSC_CURRENT_OUT] =3D direct,
> +       .format[PSC_POWER] =3D direct,
> +       .format[PSC_TEMPERATURE] =3D direct,
> +
> +       .m[PSC_VOLTAGE_IN] =3D 4653,
> +       .b[PSC_VOLTAGE_IN] =3D 0,
> +       .R[PSC_VOLTAGE_IN] =3D -2,
> +       .m[PSC_VOLTAGE_OUT] =3D 4653,
> +       .b[PSC_VOLTAGE_OUT] =3D 0,
> +       .R[PSC_VOLTAGE_OUT] =3D -2,
> +       /*
> +        * Current and Power measurement depends on the RIMON (kOhm) and
> +        * GIMON(microA/A) values.
> +        */
> +       .m[PSC_CURRENT_OUT] =3D 24668,
> +       .b[PSC_CURRENT_OUT] =3D 0,
> +       .R[PSC_CURRENT_OUT] =3D -4,
> +       .m[PSC_POWER] =3D 4486,
> +       .b[PSC_POWER] =3D 0,
> +       .R[PSC_POWER] =3D -1,
> +       .m[PSC_TEMPERATURE] =3D 54,
> +       .b[PSC_TEMPERATURE] =3D 22521,
> +       .R[PSC_TEMPERATURE] =3D -1,
> +
> +       .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> +                  PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_=
INPUT |
> +                  PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int xdp720_probe(struct i2c_client *client)
> +{
> +       struct pmbus_driver_info *info;
> +       int ret;
> +       u32 rimon;
> +       int gimon;
> +
> +       info =3D devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> +                           GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       ret =3D devm_regulator_get_enable(&client->dev, "vdd-vin");
> +       if (ret)
> +               return dev_err_probe(&client->dev, ret,
> +                       "failed to enable vdd-vin supply\n");
> +
> +       ret =3D i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> +               return ret;
> +       }
> +
> +       ret >>=3D 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> +       ret &=3D GENMASK(0, 0);
> +       if (ret =3D=3D 1)
> +               gimon =3D 18200; /* output gain 18.2 microA/A */
> +       else
> +               gimon =3D 9100; /* output gain 9.1 microA/A */
> +
> +       if (of_property_read_u32(client->dev.of_node,
> +                                "infineon,rimon-micro-ohms", &rimon))
> +               rimon =3D XDP720_DEFAULT_RIMON; /* Default if not set via=
 DT */
> +       if (rimon =3D=3D 0)
> +               return -EINVAL;
> +
> +       /* Adapt the current and power scale for each instance */
> +       info->m[PSC_CURRENT_OUT] =3D DIV64_U64_ROUND_CLOSEST((u64)
> +               info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000UL=
L);
> +       info->m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64)
> +               info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
> +
> +       return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id xdp720_of_match[] =3D {
> +       { .compatible =3D "infineon,xdp720" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, xdp720_of_match);
> +
> +static const struct i2c_device_id xdp720_id[] =3D {
> +       { "xdp720" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(i2c, xdp720_id);
> +
> +static struct i2c_driver xdp720_driver =3D {
> +       .driver =3D {
> +                  .name =3D "xdp720",
> +                  .of_match_table =3D xdp720_of_match,
> +       },
> +       .probe =3D xdp720_probe,
> +       .id_table =3D xdp720_id,
> +};
> +
> +module_i2c_driver(xdp720_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Contr=
oller");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> --
> 2.39.5
>
