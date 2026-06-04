Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3D23D7FF
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jun 2026 04:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780546775; cv=pass; b=uieSiq3Cz/5IlYT/vR/ZGAEHKjxleiE4afyF9g7hfsgwzWzVSXR3YmHIgGkhBSkM5TPNQxyUqGSWFat8WcMvpo1c0mU/l9nIsD/nU/6fIN0qKk9WxaNp8oTp14R7ZatWPxY0Rq0BIqZZgKaY4mEEgciuuHhygxE7BA2nZMAW32Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780546775; c=relaxed/simple;
	bh=uaLE3q3twaE652hU3nleFALsFxnkm6CofA9TRrcjNWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9nTBEUGn0B3LUzJrKrz2t8mkMhstS4wDJKB/uNFwAPiqZilWaqI0qsCN3FWZKkrVe/E9pnCZwRH+eIKCy8SCG47cMkXOi6bqX/0lyw82TnAqHUmNlTjtjDeihbRabeyGnNTEs+DXwZzw1Ku65RCXLJv+YazTg6tjNiu911qVH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgoI5+Cx; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgoI5+Cx"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30749947917so548589eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 21:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780546772; cv=none;
        d=google.com; s=arc-20240605;
        b=OybOI02wTIuV9cEiLH44tUjxc4eX8tTsrIBv3OaDpFR6rEMy+9Ww2d8kT/OwPJhI/I
         Co/E2ADcyv1Loo+AeUIvPtQjrPR4L9N2lBCJho9RtWQOTErQhKXLPaSWoG/Hu2CfxFz2
         zjEyZ9H3xeMn9+tFLQk5O8FkY2/2kVSJmUS78Ma3h3YBp8TgfQZ7I2A6B6Pdb5lH3G4l
         CqqVnsm8o+RVHlEgMRc9JwYWZxlJs3x2OJU/8b+17GdQeSuusEe10j4ndyCmMhJnD/MK
         euKLRiAopqxgygzsgCImAOCXzVFl6mp5fk3N1KQ5PFcFDK9K0fH2R/hKccHFFsZ1MYQY
         xP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYfaO4i77jLKii4NsUZxSox4Y8J2HdIjpZtTWWMQHco=;
        fh=xxOFebF2TsUH9ieMmhUp9RvzdTQPwO8W18LEo6R0vUM=;
        b=M6folH8WyaICKHmcXncWoKzj4WqcAR6XrvdUD5hpStSbBlU67MStfAO6W9661khfnt
         1bR/ZhNT2KlJVgIMoRlPnH/FAh6/BFR9Vhe5PF4Z2G7GJlEiIVhlvWQDDw6uLGJU4OXK
         4cy63KOuNnJlJ3kz2xpUdXSX0wkW9o+F0pzRm0ttDvQ5sf0aylQUh3ozlAOXl/775xsY
         2i+fV9LKCjoO+jNFTvBGZRn2SEOVbwO9sdT3kF4aUMMdAJEJIvDuID46VUo8HiHgP+Iw
         9YkmibGDQq/kmcOPmIDZ7CcRbJ0GQSmQ3B4Z7RtKPoftJsX3EQEQpjyxBLpwP8SKdJLt
         ryUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780546772; x=1781151572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYfaO4i77jLKii4NsUZxSox4Y8J2HdIjpZtTWWMQHco=;
        b=ZgoI5+CxsadquDUtkatncIdx6cEHfQUuAeyytN1eGh1DdxEQPQ39hzaL6N1ePGJ+tG
         6z/7wfc99DUO3jShCcAJhwwh62VD3COldpZmwnQWt/FqAv4NyYOwzFhraOzIim7vA/lr
         xBrgC91AX4GTCzXvmUM8RTCMw7o7peoG3iGPj0QNinX49ckQ83G/oqD8aaECG1NtGj1X
         nY9ShNhKOrgV+IwgvNSMnsPO6W4VMhfWQuKhPF7d+Ta9WUYBsjoIbbJ+JXwyihACk0Fv
         IsXLOzBGLi/hy4JXug+DrFgqEeTT6riQZCHqKA2J507BLPUEqNqj6oFE79yWkIbVMIGW
         hYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780546772; x=1781151572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYfaO4i77jLKii4NsUZxSox4Y8J2HdIjpZtTWWMQHco=;
        b=qYYITOnheeaHMPehWZFiR+QM7KUq0AZECXbz5ta3q6qt/wy1WeoEz8A01sF0kidJ6h
         v9VlI0Gsy0lEXxCN9f+94km7qDEAH0fYCyRoL92egvJUXSBroNqduooM+xID57Q02eZv
         6yhghQ1X33VFYoZCOEsJ6PrVs+3BYlU8A9JUmRMpTn/GbqsDTBLeK5FVsH4iHBa2FdXv
         bgoAk8MLtJN1dKvrCHe1BMhPALoUFNgXz9fGx4VewlVFdnGQ9+8fXDSzH48hLGlEPV9d
         dePcHc/EekRIPISn89rIumDDRm6tITXD/s3UMTt1I3sL0R65EkxINqXDwVZi3lCI/6/v
         K4rw==
X-Gm-Message-State: AOJu0YxSYcTGKlcjJvuSHu+2AoHLxzot3PdsjXNdXmU3R9qwunRd/1uu
	jL40uyolqV7XOkIYe4xWYvnHL0cutgMz/rvy6MRBgqa8G/oV4WRjRBP/ZQFGfNS/uFJiYllcyco
	egtnsHti8dQJimBncSPMIJ1mUYxewXY8=
X-Gm-Gg: Acq92OHaVw5yRp/feEwPcsDAnUhM/uFnLWVCsjMfeejnUggvSS+ZxO0LmjU/ab8oTWf
	r8rSEiZDeW/M6AZBZlMek/tlOTtvIZ+dRW2mBV/QYj3bUivJCnUlQvkWsYhx5J+lkHYFMFh8BjN
	MR6+INIBNhYEMGsLPLdManmCnNBa3PYUl2zfXL0NrBa9OTPYyZE3UYokE+cRpl4DA0ioJSicsC7
	camJViuIqZlrPXxJVTdV3qzb+yGbHuy2dqJRKfaGarLrczu3OBAD/xvF508eItHwol2iWuq5lz0
	sLfyuphsTV+mo4y83zaR/wMIt32yAQ==
X-Received: by 2002:a05:7300:ed87:b0:304:e2a5:689a with SMTP id
 5a478bee46e88-3074fbbc128mr3384459eec.21.1780546771374; Wed, 03 Jun 2026
 21:19:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601090925.3781-1-Ashish.Yadav@infineon.com> <20260601090925.3781-3-Ashish.Yadav@infineon.com>
In-Reply-To: <20260601090925.3781-3-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 4 Jun 2026 09:49:17 +0530
X-Gm-Features: AVHnY4KX8BzPdqHUTyemHjLaZHv8vbULBmaC40qMGZaTkBAFW2CAC9JCAgE8ujM
Message-ID: <CAJKbuCa7cxKBbLob93ob_VBBJ+wH0A9SAwYWwWq9uT90-3iGnA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp730
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I hope you are doing well.

Could you please look into this patch and provide you feedback.
Thank you for your time and assistance.

With Best Regards,
  Ashish Yadav



On Mon, Jun 1, 2026 at 2:40=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.co=
m> wrote:
>
> From: Ashish Yadav <ashish.yadav@infineon.com>
>
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
>
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDP720/XDP730 Digital eFuse Controllers provides accurate system telemetr=
y
> (V, I, P, T) and reports analog current at the IMON pin for post-processi=
ng.
>
> Both parts share the same PMBus register map and direct-format
> coefficients; they differ in the GIMON gain step exposed via the
> TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
> (XDP720: pin 9, XDP730: pin 20).
>
> The Current and Power measurement depends on the RIMON and GIMON values.
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Regis=
ter.
> The value of RIMON (kohm) can be provided by the user through device tree=
 using
> infineon,rimon-micro-ohms  property.
> ---
>  drivers/hwmon/pmbus/Kconfig  |   2 +-
>  drivers/hwmon/pmbus/xdp720.c | 167 +++++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..a9e86d92b044 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -715,7 +715,7 @@ config SENSORS_XDP720
>         tristate "Infineon XDP720 family"
>         help
>           If you say yes here you get hardware monitoring support for Inf=
ineon
> -         XDP720.
> +         XDP720 and XDP730 Digital eFuse Controllers.
>
>           This driver can also be built as a module. If so, the module wi=
ll
>           be called xdp720.
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> index 8729a771f216..1a5eab09f2fd 100644
> --- a/drivers/hwmon/pmbus/xdp720.c
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -1,128 +1,159 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controll=
er
> + * Hardware monitoring driver for Infineon XDP720 / XDP730 Digital
> + * eFuse Controllers.
> + *
> + * Both parts share the same PMBus register map and direct-format
> + * coefficients; they differ in the GIMON gain step exposed via
> + * the TELEMETRY_AVG register and in the VDD_VIN pin number.
>   *
>   * Copyright (c) 2026 Infineon Technologies. All rights reserved.
>   */
>
> +#include <linux/bitops.h>
>  #include <linux/i2c.h>
> -#include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> -#include <linux/of_device.h>
> -#include <linux/bitops.h>
>  #include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  #include "pmbus.h"
>
>  /*
> - * The IMON resistor required to generate the system overcurrent protect=
ion.
> - * Arbitrary default Rimon value: 2k Ohm
> + * The IMON resistor required to generate the system overcurrent
> + * protection.  Arbitrary default Rimon value: 2 kOhm (in micro-ohms).
>   */
> -#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> -#define XDP720_TELEMETRY_AVG 0xE9
> +#define XDP720_DEFAULT_RIMON           2000000000U     /* 2 kohm */
> +#define XDP720_TELEMETRY_AVG           0xE9
> +#define XDP720_TELEMETRY_AVG_GIMON     BIT(10)         /* high/low GIMON=
 select */
> +
> +/* Chip identifiers carried in OF match-data and i2c_device_id->driver_d=
ata. */
> +enum xdp720_chip_id {
> +       CHIP_XDP720 =3D 0,
> +       CHIP_XDP730,
> +};
>
> -static struct pmbus_driver_info xdp720_info =3D {
> +struct xdp720_data {
> +       enum xdp720_chip_id      id;
> +       struct pmbus_driver_info info;
> +};
> +
> +static const struct pmbus_driver_info xdp720_info =3D {
>         .pages =3D 1,
> -       .format[PSC_VOLTAGE_IN] =3D direct,
> -       .format[PSC_VOLTAGE_OUT] =3D direct,
> -       .format[PSC_CURRENT_OUT] =3D direct,
> -       .format[PSC_POWER] =3D direct,
> -       .format[PSC_TEMPERATURE] =3D direct,
> -
> -       .m[PSC_VOLTAGE_IN] =3D 4653,
> -       .b[PSC_VOLTAGE_IN] =3D 0,
> -       .R[PSC_VOLTAGE_IN] =3D -2,
> -       .m[PSC_VOLTAGE_OUT] =3D 4653,
> -       .b[PSC_VOLTAGE_OUT] =3D 0,
> -       .R[PSC_VOLTAGE_OUT] =3D -2,
> +       .format[PSC_VOLTAGE_IN]         =3D direct,
> +       .format[PSC_VOLTAGE_OUT]        =3D direct,
> +       .format[PSC_CURRENT_OUT]        =3D direct,
> +       .format[PSC_POWER]              =3D direct,
> +       .format[PSC_TEMPERATURE]        =3D direct,
> +
> +       .m[PSC_VOLTAGE_IN]      =3D 4653,
> +       .b[PSC_VOLTAGE_IN]      =3D 0,
> +       .R[PSC_VOLTAGE_IN]      =3D -2,
> +       .m[PSC_VOLTAGE_OUT]     =3D 4653,
> +       .b[PSC_VOLTAGE_OUT]     =3D 0,
> +       .R[PSC_VOLTAGE_OUT]     =3D -2,
>         /*
> -        * Current and Power measurement depends on the RIMON (kOhm) and
> -        * GIMON(microA/A) values.
> +        * Current and Power measurement depend on the RIMON (micro-ohm)
> +        * and GIMON (microA/A) values; scaled per-instance in probe().
>          */
> -       .m[PSC_CURRENT_OUT] =3D 24668,
> -       .b[PSC_CURRENT_OUT] =3D 0,
> -       .R[PSC_CURRENT_OUT] =3D -4,
> -       .m[PSC_POWER] =3D 4486,
> -       .b[PSC_POWER] =3D 0,
> -       .R[PSC_POWER] =3D -1,
> -       .m[PSC_TEMPERATURE] =3D 54,
> -       .b[PSC_TEMPERATURE] =3D 22521,
> -       .R[PSC_TEMPERATURE] =3D -1,
> +       .m[PSC_CURRENT_OUT]     =3D 24668,
> +       .b[PSC_CURRENT_OUT]     =3D 0,
> +       .R[PSC_CURRENT_OUT]     =3D -4,
> +       .m[PSC_POWER]           =3D 4486,
> +       .b[PSC_POWER]           =3D 0,
> +       .R[PSC_POWER]           =3D -1,
> +       .m[PSC_TEMPERATURE]     =3D 54,
> +       .b[PSC_TEMPERATURE]     =3D 22521,
> +       .R[PSC_TEMPERATURE]     =3D -1,
>
>         .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> -                  PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_=
INPUT |
> -                  PMBUS_HAVE_STATUS_TEMP,
> +                  PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
> +                  PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
>  };
>
>  static int xdp720_probe(struct i2c_client *client)
>  {
> -       struct pmbus_driver_info *info;
> +       struct xdp720_data *data;
>         int ret;
> -       u32 rimon;
>         int gimon;
> +       u32 rimon;
>
> -       info =3D devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> -                           GFP_KERNEL);
> -       if (!info)
> +       data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
>                 return -ENOMEM;
>
> +       data->id =3D (enum xdp720_chip_id)(uintptr_t)i2c_get_match_data(c=
lient);
> +       data->info =3D xdp720_info;
> +
>         ret =3D devm_regulator_get_enable(&client->dev, "vdd-vin");
>         if (ret)
>                 return dev_err_probe(&client->dev, ret,
> -                       "failed to enable vdd-vin supply\n");
> +                                    "failed to enable vdd-vin supply\n")=
;
>
>         ret =3D i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> -       if (ret < 0) {
> -               dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> -               return ret;
> +       if (ret < 0)
> +               return dev_err_probe(&client->dev, ret,
> +                                    "failed to read TELEMETRY_AVG\n");
> +
> +       /* Bit 10 of TELEMETRY_AVG selects the GIMON gain step in microA/=
A */
> +       switch (data->id) {
> +       case CHIP_XDP720:
> +               gimon =3D (ret & XDP720_TELEMETRY_AVG_GIMON) ? 18200 : 91=
00;
> +               dev_info(&client->dev, "Initialised XDP720 instance\n");
> +               break;
> +       case CHIP_XDP730:
> +               gimon =3D (ret & XDP720_TELEMETRY_AVG_GIMON) ? 20000 : 10=
000;
> +               dev_info(&client->dev, "Initialised XDP730 instance\n");
> +               break;
> +       default:
> +               return -EINVAL;
>         }
>
> -       ret >>=3D 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> -       ret &=3D GENMASK(0, 0);
> -       if (ret =3D=3D 1)
> -               gimon =3D 18200; /* output gain 18.2 microA/A */
> -       else
> -               gimon =3D 9100; /* output gain 9.1 microA/A */
> -
> -       if (of_property_read_u32(client->dev.of_node,
> -                                "infineon,rimon-micro-ohms", &rimon))
> -               rimon =3D XDP720_DEFAULT_RIMON; /* Default if not set via=
 DT */
> +       if (device_property_read_u32(&client->dev,
> +                                    "infineon,rimon-micro-ohms", &rimon)=
)
> +               rimon =3D XDP720_DEFAULT_RIMON;   /* Default if not in FW=
 */
>         if (rimon =3D=3D 0)
>                 return -EINVAL;
>
> -       /* Adapt the current and power scale for each instance */
> -       info->m[PSC_CURRENT_OUT] =3D DIV64_U64_ROUND_CLOSEST((u64)
> -               info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000UL=
L);
> -       info->m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64)
> -               info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
> +       /* Adapt the current and power scale for each instance. */
> +       data->info.m[PSC_CURRENT_OUT] =3D DIV64_U64_ROUND_CLOSEST((u64)
> +               data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
> +               1000000000000ULL);
> +       data->info.m[PSC_POWER] =3D DIV64_U64_ROUND_CLOSEST((u64)
> +               data->info.m[PSC_POWER] * rimon * gimon,
> +               1000000000000000ULL);
>
> -       return pmbus_do_probe(client, info);
> +       return pmbus_do_probe(client, &data->info);
>  }
>
>  static const struct of_device_id xdp720_of_match[] =3D {
> -       { .compatible =3D "infineon,xdp720" },
> -       {}
> +       { .compatible =3D "infineon,xdp720", .data =3D (void *)CHIP_XDP72=
0 },
> +       { .compatible =3D "infineon,xdp730", .data =3D (void *)CHIP_XDP73=
0 },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(of, xdp720_of_match);
>
>  static const struct i2c_device_id xdp720_id[] =3D {
> -       { "xdp720" },
> -       {}
> +       { "xdp720", CHIP_XDP720 },
> +       { "xdp730", CHIP_XDP730 },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(i2c, xdp720_id);
>
>  static struct i2c_driver xdp720_driver =3D {
>         .driver =3D {
> -                  .name =3D "xdp720",
> -                  .of_match_table =3D xdp720_of_match,
> +               .name           =3D "xdp720",
> +               .of_match_table =3D xdp720_of_match,
>         },
> -       .probe =3D xdp720_probe,
> -       .id_table =3D xdp720_id,
> +       .probe          =3D xdp720_probe,
> +       .id_table       =3D xdp720_id,
>  };
>
>  module_i2c_driver(xdp720_driver);
>
>  MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> -MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Contr=
oller");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFus=
e Controllers");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("PMBUS");
> --
> 2.39.5
>
