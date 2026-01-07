Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E128D308F05
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Jan 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786369; cv=none; b=kQyjdV2wKi4P1haZ7cCH3d+OELkgMXFFoqKNcf+7fAFL93hNfGFl4YdQsB0bHpbiqvf2FEqPEF+2t4H5Oay0aBhpK0WGUbKZMCAnglSMgLN0ft8BfkUTeq6jJ2HSdLSZj7nI6/X7BZVgj6qsoQx9ks8DRiciBwqPZ6kZwrwVMgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786369; c=relaxed/simple;
	bh=WOhOvxCcW7coobqxBxlfk5x0HGEcphbI7VXbpxpktjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7sdVzdcSEE+/q+aWQP595gaZTefzDU1ZBE996gGUYJfcb4nHy0z3tFF6b5+soownyqtWoI3b51J0urRIQXQ1NgMjQ/2SZY3Gg4hRUJCWO0qb/e4u2MImAQ3tVO/S3KtWgAW1NxLrcytB6uVPyz35jVzDXCKOzbUt5RZAbrdLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVffSVQg; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVffSVQg"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ae29ddaed9so336439eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jan 2026 03:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767786366; x=1768391166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T55D6o/NXSb69kLDxe1kOeiqHUVOM3EddD4s6JzZ7WA=;
        b=EVffSVQgQKmaJiLzl3FvRWC2sOeVPWCIwi5FHucIZ5lkc37HKPVLpDs8JHzb2WnA8+
         J8nlm9UqH06aTrKh0PzfYxm/c0KZslD5X2HCatMHJJYOhi0ij+af6AXSuf5GwknPJX6e
         paaLUsQLAKkxrdrXZdGdFyefuYSk+kZHosfqEWYSsu0+IYcGSZUkDAUEZnlWBwsUVNbX
         +v+EYK0pCl9zZCy5Po2xhq8/0DYdIdU7OadUxL8pPncw7PllArKWHjZgg83TY/kKF2Xp
         iFXS48QSQ+Zr0wjUHd7zryFmT5du97uKyXaqsmuE9E3kjT7UkDID99V3aWyhmIrK5h8n
         iyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786366; x=1768391166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T55D6o/NXSb69kLDxe1kOeiqHUVOM3EddD4s6JzZ7WA=;
        b=ndScgCXU/HszKgopxx65l5TLKOyB+PUayjHgufR5cA/poCacgmE1mWppZrRXUB++sM
         Jh+o+sQDr7MGWCsGdcYjp8YqnB9OBE8Lj97Na/TltsMNRfi5g2pEPNQoFbPVLtTZpd8g
         iz3t6aSxJ4tV/vXPVv+fZPoFl0RhUbFysAVEeL9gDMJbpiSW1H7cAfhO9h8QBMhscPjy
         gaCjbkt3tjfwySKtQ2ZFQq7L+Nb0KcKWpSB9RfkXdz+DT35mu6E35dqwUwOCnmWMMxe9
         T6UJG8/XFGGr1V1SGGKn05YlSHkhVD4wQEjxRBHhsVOlNMclOfMGw8N5BosaW+yqDRE4
         mziQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVzYOZQfIL1grbiG9yYYIFGCPAKgVq0AycewaDgbnaU7v+t02kvs+Lp21Z0TkSdIMRa4FSUnh88OGCow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeQ8C1/14gn/5nDwlhD20gfw5yurM275KllcRbrG8RE8E4TxI
	sY2gn/aPdeZBpU9BMT9UTs09jckMQ8EnaXZTX/+j7WQbOvrgWuyDLAIZTWg4v9cAyCsfHo/SBkj
	73beJa3368JGe4ubXRA3Z4KiQcgn0pls0iThXwSU=
X-Gm-Gg: AY/fxX6PqQ0lvPW1lQy9FggV+3byjLSJGC3dF9DQNMOILUYYC+ED+FGaEWPXniSAL3J
	xMJLPaQlXo2ORrxGayby6g7UgRN0PRraDai4faxCY8hMr7n0AHLTg6vThKMVWPTHZ0YEavg/soJ
	DNCpUbtq5GMEFDJHDDTZIr6AmexS5NU8hxjkAFBce7VSTtAAHbbtYZHCeTEs0eIoTpRGUuUGp52
	pLulgmVlWymAgVsVjRepOZ15UqTT7Pt0cWaCNOzXTRpAIY1HpGBDhp5XlMfkwvgiU5W4Q==
X-Google-Smtp-Source: AGHT+IEc/AadOSNagsZDbtmhgMV5VUI91HSoN/yDZGdruLzmkHK8Vdskp7/afnnMHMiDmvFwHLMPOaryPZihqeLtFfc=
X-Received: by 2002:a05:7300:1343:b0:2a4:3593:ccb9 with SMTP id
 5a478bee46e88-2b17c5f0fb3mr1583749eec.0.1767786365387; Wed, 07 Jan 2026
 03:46:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104105351.68907-1-Ashish.Yadav@infineon.com> <a8c3586b-5baa-4cf8-996d-b99082bf2563@roeck-us.net>
In-Reply-To: <a8c3586b-5baa-4cf8-996d-b99082bf2563@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Wed, 7 Jan 2026 17:15:53 +0530
X-Gm-Features: AQt7F2oER_oH7AUvYpE96afnUCmZCvSlkqyP6IhHwowblpc1gqj-6cyWO_fjjPo
Message-ID: <CAJKbuCZWjioOBFXQU+F7kA3dyjG5oQcnwW2WDcyi3Pfub7npUQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon:(pmbus/tda38740a) TDA38740A Voltage Regulator Driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 9:10=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Sun, Jan 04, 2026 at 04:23:51PM +0530, ASHISH YADAV wrote:
> > Add the pmbus driver for the Infineon TDA38740A/TDA38725A
> >       DC-DC voltage regulator.
>
> No need for indentation.
ACK
>
> >
> > Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
>
> No change log, no versioning, the devicetree description was not separate=
d
> but dropped or submitted entirely separately without copying hwmon,
> no explanation for the new property, review feedback not completely
> addressed.
ACK, I will share the details in the next commit.
>
> More comments inline.
>
> > ---
> >  drivers/hwmon/pmbus/Kconfig     |  16 +++
> >  drivers/hwmon/pmbus/Makefile    |   1 +
> >  drivers/hwmon/pmbus/tda38740a.c | 182 ++++++++++++++++++++++++++++++++
>
> Driver documentation missing.
ACK, I will submit another patch for device tree binding.
>
> >  3 files changed, 199 insertions(+)
> >  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index f3fb94cebf1a..e7d7ff1b57df 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -602,6 +602,22 @@ config SENSORS_TDA38640_REGULATOR
> >         If you say yes here you get regulator support for Infineon
> >         TDA38640 as regulator.
> >
> > +config SENSORS_TDA38740A
> > +     tristate "Infineon TDA38740A"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Inf=
ineon
> > +       TDA38740A/25A.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called tda38740a.
> > +
> > +config SENSORS_TDA38740A_REGULATOR
> > +     bool "Regulator support for TDA38740A and compatibles"
> > +     depends on SENSORS_TDA38740A && REGULATOR
> > +     help
> > +       If you say yes here you get regulator support for Infineon
> > +       TDA38740A/25A as regulator.
> > +
> >  config SENSORS_TPS25990
> >       tristate "TI TPS25990"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index 349a89b6d92e..f422c80cf3d8 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -58,6 +58,7 @@ obj-$(CONFIG_SENSORS_PXE1610)       +=3D pxe1610.o
> >  obj-$(CONFIG_SENSORS_Q54SJ108A2)     +=3D q54sj108a2.o
> >  obj-$(CONFIG_SENSORS_STPDDC60)       +=3D stpddc60.o
> >  obj-$(CONFIG_SENSORS_TDA38640)       +=3D tda38640.o
> > +obj-$(CONFIG_SENSORS_TDA38740A)  +=3D tda38740a.o
> >  obj-$(CONFIG_SENSORS_TPS25990)       +=3D tps25990.o
> >  obj-$(CONFIG_SENSORS_TPS40422)       +=3D tps40422.o
> >  obj-$(CONFIG_SENSORS_TPS53679)       +=3D tps53679.o
> > diff --git a/drivers/hwmon/pmbus/tda38740a.c b/drivers/hwmon/pmbus/tda3=
8740a.c
> > new file mode 100644
> > index 000000000000..3402bbf2cc47
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tda38740a.c
> > @@ -0,0 +1,182 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/**
> > + * Hardware monitoring driver for Infineon Integrated-pol-voltage-regu=
lators
> > + * Driver for TDA38725A and TDA38740A
> > + *
> > + * Copyright (c) 2025 Infineon Technologies
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/regulator/driver.h>
> > +#include "pmbus.h"
> > +
> > +#define TDA38725A_IC_DEVICE_ID "\xA9"
> > +#define TDA38740A_IC_DEVICE_ID "\xA8"
> > +
> > +static const struct i2c_device_id tda38740a_id[];
> > +
> > +enum chips { tda38725a, tda38740a };
> > +
> > +struct tda38740a_data {
> > +     enum chips id;
> > +     struct pmbus_driver_info info;
> > +     u32 vout_multiplier[2];
> > +};
> > +
> > +#define to_tda38740a_data(x) container_of(x, struct tda38740a_data, in=
fo)
> > +
> > +static const struct regulator_desc __maybe_unused tda38740a_reg_desc[]=
 =3D {
> > +     PMBUS_REGULATOR("vout", 0),
> > +};
> > +
> > +static int tda38740a_read_word_data(struct i2c_client *client, int pag=
e,
> > +                                 int phase, int reg)
> > +{
> > +     const struct pmbus_driver_info *info =3D pmbus_get_driver_info(cl=
ient);
> > +     const struct tda38740a_data *data =3D to_tda38740a_data(info);
> > +     int ret;
> > +
> > +     /* Virtual PMBUS Command not supported */
> > +     if (reg >=3D PMBUS_VIRT_BASE)
> > +             return -ENXIO;
> > +
> > +     switch (reg) {
> > +     case PMBUS_READ_VOUT:
> > +             ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +             if (ret < 0)
> > +                     return ret;
> > +             ret =3D ((ret * data->vout_multiplier[0]) /
> > +                    data->vout_multiplier[1]);
>
> Repeating me, but the rationale (use case) for the multiplier is still no=
t
> provided, much less why it would be needed for READ_VOUT but not for any
> of the other VOUT related commands. The data sheet does not provide an
> explanation (section 13.3 does not explain the need for it, or suggest
> that READ_VOUT would return a bad value, much less why only READ_VOUT wou=
ld
> require scaling or why adjusting VOUT_SCALE_LOOP would not be sufficient)=
.
>

      TDA38740/25 pin strap parts are available in two flavors of 1:1 & 1:2
      vout scale loop.
      For the 1:1 vout_scale_loop version, there is no need for any resisto=
r
      divider as output voltage sense pins are directly connected to
      the output.

      For a 1:2 scale loop version, it is recommended to use 499 ohms each =
for
      top and bottom across the feedback path.
      However, in some applications customers tend to use an intentional
      resistor divider across the output with a different divider ratio oth=
er
      than 1:1 or 1:2 to alter the actual output voltage.

      For example, if pin strap part is set to Vboot of 0.7V,they use a
      resistor divider to generate 0.75V using the equation provided in
      Section 13.3 of the datasheet.In this case, as there are only two
      vout_scale_loop options of 1:1 and 1:2 that the IC can identify,
      Read_Vout would still read as 0.7V in the telemetry and the baseboard
      management controllers would use this telemetry data to monitor the
      rail parameters leading to false tripping of the system.
      This multiplier is used to offset the telemetry output voltage Read_V=
out
      so that the telemetry data is reported correctly to the monitoring
      controller,in this example the multiplier would be 0.75/0.7 =3D 1.071=
.

      This multiplier is required only for any external monitoring of the r=
ail
      output voltage. All the other Vout related parameters are used
      internally by the IC and there is only a slight impact on the fault
      thresholds.The impact can be calculated using equations in Section 13=
.3
      of the datasheet.


> > +             break;
> > +     default:
> > +             ret =3D pmbus_read_word_data(client, page, phase, reg);
>
> Should return -ENODATA and let the calling code handle it.
>
ACK
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static struct pmbus_driver_info tda38740a_info[] =3D {
> > +     [tda38740a] =3D {
> > +             .pages =3D 1,
> > +             .read_word_data =3D tda38740a_read_word_data,
> > +             .format[PSC_VOLTAGE_IN] =3D linear,
> > +             .format[PSC_VOLTAGE_OUT] =3D linear,
> > +             .format[PSC_CURRENT_OUT] =3D linear,
> > +             .format[PSC_CURRENT_IN] =3D linear,
> > +             .format[PSC_POWER] =3D linear,
> > +             .format[PSC_TEMPERATURE] =3D linear,
> > +
> > +             .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +                     | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +                     | PMBUS_HAVE_IIN
> > +                     | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +                     | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +                     | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> > +#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
> > +             .num_regulators =3D 1,
> > +             .reg_desc =3D tda38740a_reg_desc,
> > +#endif
> > +     },
> > +};
> > +
> > +static int tda38740a_get_device_id(struct i2c_client *client)
> > +{
> > +     u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
> > +     enum chips id;
> > +     int status;
> > +
> > +     status =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
> > +                                        device_id);
> > +     if (status < 0 || status > 1) {
> > +             dev_err(&client->dev, "Failed to read Device Id %x\n", st=
atus);
>
> Not necessarily. If status > 1 it is just unexpected/unsupported.
>
ACK

> > +             return -ENODEV;
> > +     }
> > +
> > +     if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, strlen(device_id))=
) {
> > +             id =3D tda38725a;
>
> device_id[] is not initialized, meaning its contents are random. There is=
 no
> guarantee that the returned data is a string either, 0-terminated or not.
> Thus, strlen() is wrong.
ACK
>
> > +     } else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id,
> > +                        strlen(device_id))) {
> > +             id =3D tda38740a;
> > +     } else {
> > +             dev_err(&client->dev, "Unsupported device\n");
>
> Consider telling the user the ID of the unsupported device.
>
ACK
> > +             return -ENODEV;
> > +     }
> > +
> > +     return id;
> > +}
> > +
> > +static int tda38740a_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct tda38740a_data *data;
> > +     int chip_id;
> > +
> > +     if (!i2c_check_functionality(client->adapter,
> > +                                  I2C_FUNC_SMBUS_BYTE |
> > +                                          I2C_FUNC_SMBUS_BYTE_DATA |
> > +                                          I2C_FUNC_SMBUS_WORD_DATA |
> > +                                          I2C_FUNC_SMBUS_BLOCK_DATA))
> > +             return -ENODEV;
> > +
> > +     chip_id =3D tda38740a_get_device_id(client);
> > +     if (chip_id < 0)
> > +             return chip_id;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +     data->id =3D chip_id;
> > +     memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info))=
;
> > +
> > +     if (!of_property_read_u32_array(client->dev.of_node, "vout_multip=
lier",
> > +                                     data->vout_multiplier,
> > +                                     ARRAY_SIZE(data->vout_multiplier)=
)) {
> > +             dev_info(&client->dev,
> > +                      "vout_multiplier from Device Tree:%d %d\n",
> > +                      data->vout_multiplier[0], data->vout_multiplier[=
1]);
> > +     } else {
> > +             dev_info(&client->dev,
> > +                      "vout_multiplier not available from Device Tree"=
);
> > +             data->vout_multiplier[0] =3D 0x01;
> > +             data->vout_multiplier[1] =3D 0x01;
> > +             dev_info(&client->dev, "vout_multiplier default value:%d =
%d\n",
> > +                      data->vout_multiplier[0], data->vout_multiplier[=
1]);
>
> Drop the noise.
ACK
>
> > +     }
> > +
> > +     return pmbus_do_probe(client, &data->info);
> > +}
> > +
> > +static const struct i2c_device_id tda38740a_id[] =3D { { "tda38725a", =
tda38725a },
> > +                                                  { "tda38740a", tda38=
740a },
> > +                                                  {} };
> > +
> > +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> > +
> > +static const struct of_device_id __maybe_unused tda38740a_of_match[] =
=3D {
> > +     { .compatible =3D "infineon,tda38725a", .data =3D (void *)tda3872=
5a },
> > +     { .compatible =3D "infineon,tda38740a", .data =3D (void *)tda3874=
0a },
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> > +
> > +static struct i2c_driver tda38740a_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "tda38740a",
> > +             .of_match_table =3D of_match_ptr(tda38740a_of_match),
> > +     },
> > +     .probe =3D tda38740a_probe,
> > +     .id_table =3D tda38740a_id,
> > +};
> > +
> > +module_i2c_driver(tda38740a_driver);
> > +
> > +MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Infineon IPOL");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
> > --
> > 2.39.5
> >
