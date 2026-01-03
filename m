Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACD131E49
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Jan 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767421351; cv=none; b=YnfnIr7KuSvkyGyzXlxHcvfSO4UXJFu50dX0GS+lRMofbC/rDDQG7shWmt20pbV9h5V9hXJj/03RYUwvVuX4jBbvyJo2y0HNWz81Su1016EEzgbMH0F+HK7PWx2vcXteCyV4FjrhV1jXBPIQjO8mJj4VQhyLUp+tCJPoL0CiZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767421351; c=relaxed/simple;
	bh=MP8JabhSGU6FhHBVr4Jq98QDEJDXmKnubSjIk/hUhA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgdetwMQelVyZBqrEVwZ0FpUlozs3OgFj8lxInGc9WsZOl5r5thAMDCPgLp4446eV49d99X7veiQX7CAzg9XnOdmAa3jDnEUXYupJ6kI7Z4hiTk/wG+3AXy4zZYMZWQfGUEpwZSptmhb1cYKciVaHAMhNP3ETqCp0IH2EWAQfQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFSlVDYP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFSlVDYP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c227206e6dcso12009844a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Jan 2026 22:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767421349; x=1768026149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56hMYu+wJK/gMLQPfw5iouuCOxgY30vVUmrVMB8IaCM=;
        b=EFSlVDYPYUMnWvm5GkAW6XsbocnLBsJOTd42oNtNa/RY0TGNODAizuOF3d/YBPWMay
         NPJmrEwJ6JE9A9gtkikjyLTcLnNXC6AU6n3RssqApfGuBHIf53Ek2354uoTw4pxk8snp
         Y85Ye0BuyNRr+yQOfcUNQK9Znpt44Blf07P1hXr+/wpA0+X10jBixtGFaUMZyADphfcE
         vJRmZ5CfD8Bf3CDiNZ0S9gdXmCzWZVBZ4GtcaDr8Xr2eD6MzzZjeReGFM9YVDgmKvjB2
         KheI9KFhsTXCojSPXESYUWY+WYQbramD4YZ6m7qn+wDblfNrtcSnnLeuXTdEf9nOJs8o
         EYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767421349; x=1768026149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56hMYu+wJK/gMLQPfw5iouuCOxgY30vVUmrVMB8IaCM=;
        b=SdQVfLXAkm9Jp86XnpOm43ohXKF30ANead8N4xTaOs6TnAm64hYYgSiFSBHIGg7tYa
         ypuC36Ojgr6iyH0GpVQDMgIu7yL4gkLVuazFFRhWTSBxHwMu35AlnbbvVTEHk43HBK10
         aU1m99lvMIlUj49JL5KJ4z2QfJQ6irhzSVNNlQGoEv1JEWw2hnLFiym4LHH3tyy4C37k
         9YvApPIENleAfOj4kPhkX8KbJe/l76RDFHA3SLnTxjTAV69Mi5wui0+gZqXjvgEC6BLW
         1DCt9NolhYPfgYUHq9/zemRBtPpQHIh3/A/8qi7sMFjNrM4KxFQKF6p+W+YEUj27cND0
         SasQ==
X-Gm-Message-State: AOJu0YxzbPheg/MmuzB28mKsg1N+BI//q6E/PcEhYROdIiHCaaA1OQEZ
	Sk5VNXy6HY5LSiyXpMNtTyKuHqd0DKQVlQ1ebWkNsX+5xUpB3b7MUe7UPRUv9XPKnX5K2m7yp9r
	ARDX43zfCjGrXvpe6+A0lUL1clbnt7BI=
X-Gm-Gg: AY/fxX7NzqVwB/6Hk0iMLEg+WEHkpc9gPotLH7Dibhn93RuPn8nGHp0OCr5YZGAO0Ra
	AaF6Bky0CxWcan32/4Q6V78xkfZSTFoHv6Aq/4aHQ2nLqQ1x3xuKA6pnyw9RMfG47nK+/vLBlNr
	+5xofxn/GhCiunJQ3DIYcgk6TLxY5LPv//zEUEaIzfnupdfp/PVNNN/3JLAQ2qHbFuYX7irVLFg
	w2wHKE8wnA2IJOnQj7VxgvBj1r3tjJw3ika02Iv3Ph3qmkZrwCks0M0Ei04AE9i1TtVzg==
X-Google-Smtp-Source: AGHT+IGnqZOl/btdqBS/Y62zhVHzVKzy8UpIiACRMktotdDhyJD6RyivtMXlaz5NrTbXgrkEdTasoy1+H3x6IDwi3k4=
X-Received: by 2002:a05:7301:db05:b0:2ae:b073:ae29 with SMTP id
 5a478bee46e88-2b05ec8fbddmr30050310eec.29.1767421348921; Fri, 02 Jan 2026
 22:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231105503.77881-1-Ashish.Yadav@infineon.com> <92d6c340-f18a-4d50-a967-57c3ba8aefbf@roeck-us.net>
In-Reply-To: <92d6c340-f18a-4d50-a967-57c3ba8aefbf@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Sat, 3 Jan 2026 11:52:17 +0530
X-Gm-Features: AQt7F2rlEPi2L1d7wfvOi_hCAMQV36jv2lEiULaKk2ROx6UVcuvUmekkWtpLGiQ
Message-ID: <CAJKbuCZcXf0aJxShiiSwFGNgdcuSOzba8ZxPu0LaukLL3Lt=xw@mail.gmail.com>
Subject: Re: [PATCH] hwmon:(pmbus/tda38740a) Add driver for Infineon
 TDA38740A/TDA38725A Voltage Regulator
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Sure, I will create separate two patches for Devicetree bindings and
PMBUS code changes.

Thanks & Regards
   Ashish Yadav


On Fri, Jan 2, 2026 at 9:58=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Wed, Dec 31, 2025 at 04:25:03PM +0530, ASHISH YADAV wrote:
> > Add the pmbus driver for the Infineon TDA38740A/TDA38725A
> >        voltage regulator.
> >
> > Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> > ---
> >  .../hwmon/pmbus/infineon,tda38740a.yaml       |  73 ++++++
> >  drivers/hwmon/pmbus/Kconfig                   |  16 ++
> >  drivers/hwmon/pmbus/Makefile                  |   1 +
> >  drivers/hwmon/pmbus/tda38740a.c               | 223 ++++++++++++++++++
>
> Devicetree bindings and code changes need to be two separate patches, and
> devicetree changes need to be reviewed by dt maintainers.
>
> >  4 files changed, 313 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,tda38740a.yaml
> >  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda387=
40a.yaml
> > new file mode 100644
> > index 000000000000..07c8eb94807e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.=
yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator wit=
h I2C
> > +
> > +maintainers:
> > +  - ASHISH YADAV <Ashish.Yadav@infineon.com>
> > +
> > +description: |
> > +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchro=
nous Buck Regulator with
> > +  I2C designed for Industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/assets/row/public/documents/24/49/infineon-=
tda38740a-tda38725a-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725a
> > +      - infineon,tda38740a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vout_multiplier:
>
> This most likely needs to be prefixed unless it is a standard
> property.
>
> Also, what is the use case ? The provided value is linear, meaning it is
> self-adjusting. Also, the measurement is normally internal to the pin.
> This needs further explanation.
>
> > +    description: |
> > +      If voltage multiplier present at vout, the voltage at voltage se=
nsor pin
> > +      will be scaled. The properties will convert the raw reading to a=
 more
> > +      meaningful number if voltage multiplier present. It has two numb=
ers,
> > +      numerator ie vout_multiplier[0] and denominator ie vout_multipli=
er[1].
> > +      Therefore, the adjusted vout is equal to
> > +      Vout =3D (Vout * vout_multiplier[0]) / vout_multiplier[1].
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  regulators:
> > +    type: object
> > +    description:
> > +      list of regulators provided by this controller.
> > +
> > +    properties:
> > +      vout:
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        type: object
> > +
> > +        unevaluatedProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        tda38740a@40 {
> > +            compatible =3D "infineon,tda38740a";
> > +            reg =3D <0x40>;
> > +            vout_multiplier =3D <75 70>;
> > +        };
> > +    };
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
> > index 000000000000..4a51b773dcc4
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tda38740a.c
> > @@ -0,0 +1,223 @@
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
> > +#define TDA38725A_IC_DEVICE_ID       "\xA9"
> > +#define TDA38740A_IC_DEVICE_ID       "\xA8"
> > +
> > +static const struct i2c_device_id tda38740a_id[];
> > +
> > +enum chips {
> > +     tda38725a,
> > +     tda38740a
> > +};
> > +
> > +struct tda38740a_data {
> > +     enum chips id;
> > +     struct pmbus_driver_info info;
> > +     u32 vout_multiplier[2];
> > +};
> > +
> > +#define to_tda38740a_data(x)  container_of(x, struct tda38740a_data, i=
nfo)
> > +
> > +static const struct regulator_desc __maybe_unused tda38740a_reg_desc[]=
 =3D {
> > +     PMBUS_REGULATOR("vout", 0),
> > +};
> > +
> > +static int tda38740a_read_word_data(struct i2c_client *client, int pag=
e,
> > +                                     int phase, int reg)
> > +{
> > +     const struct pmbus_driver_info *info =3D pmbus_get_driver_info(cl=
ient);
> > +     const struct tda38740a_data *data =3D to_tda38740a_data(info);
> > +     int ret =3D 0;
>
> Unnecessary variable initialization.
>
> > +
> > +     /* Virtual PMBUS Command not supported */
> > +     if (reg >=3D PMBUS_VIRT_BASE) {
> > +             ret =3D -ENXIO;
> > +             return ret;
>
> Unnecessary assignment to ret.
>
> > +     }
> > +
> > +     switch (reg) {
> > +     case PMBUS_READ_VOUT:
> > +             ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +             pr_info("READ_VOUT Value:%d %d %d\n", ret, data->vout_mul=
tiplier[0],
> > +                                     data->vout_multiplier[1]);
>
> This is completely unacceptable noise.
>
> Missing error check.
>
> > +             ret =3D ((ret * data->vout_multiplier[0])/data->vout_mult=
iplier[1]);
>
> Space around '/'. "linear" properties have an exponent and mantissa.
> The calculations do not take that into account.
>
> > +             break;
> > +     default:
> > +             ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static struct pmbus_driver_info tda38740a_info[] =3D {
> > +     [tda38725a] =3D {
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
>
> Unless I am missing something, both declarations are the same, making it
> pointless to have them separate.
>
> > +     },
> > +};
> > +
> > +static int tda38740a_get_device_id(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
> > +     enum chips id;
> > +     int status;
> > +
> > +     status =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, =
device_id);
> > +     if (status < 0) {
> > +             dev_err(dev, "Failed to read Device Id\n");
> > +             return status;
> > +     }
> > +
> > +     pr_info("PMBUS IC DEVICE_ID:%s\n", device_id);
>
> Unnecessary noise, and pr_info() is inappropriate.
> > +
> > +     if (!strncasecmp(TDA38725A_IC_DEVICE_ID, device_id, strlen(device=
_id))) {
>
> The device seems to be a single-byte hex number, 0xa8 or 0xa9. What is th=
e
> point of using strncasecmp() for the ID match instead of just checking th=
e
> returned length and comparing the first byte directly ?
>
> > +             id =3D tda38725a;
> > +     } else if (!strncasecmp(TDA38740A_IC_DEVICE_ID, device_id, strlen=
(device_id))) {
> > +             id =3D tda38740a;
> > +     } else {
> > +             dev_err(&client->dev, "Unsupported device\n");
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
> > +     enum chips id;
> > +     int chip_id;
> > +
> > +     /* FUNC for I2C SMBUS */
>
> Pointless comment.
>
> > +     if (!i2c_check_functionality(client->adapter,
> > +                     I2C_FUNC_SMBUS_BYTE |
> > +                     I2C_FUNC_SMBUS_BYTE_DATA |
> > +                     I2C_FUNC_SMBUS_WORD_DATA |
> > +                     I2C_FUNC_SMBUS_BLOCK_DATA |
> > +                     I2C_FUNC_SMBUS_PEC))
> > +             dev_warn(&client->dev, "One of the required Func not supp=
orted by I2C adapter.\n");
>
> Either this is critical or not. If not, the warning is pointless.
> If yes, the driver should bail out.
>
> > +
> > +     chip_id =3D tda38740a_get_device_id(client);
> > +     if (chip_id < 0)
> > +             return chip_id;
> > +
> > +     if (dev->of_node)
> > +             id =3D (uintptr_t)of_device_get_match_data(dev);
> > +     else
> > +             id =3D i2c_match_id(tda38740a_id, client)->driver_data;
> > +
>
> Use i2c_get_match_data().
>
> > +     if (chip_id !=3D id)
> > +             dev_warn(&client->dev, "Device mismatch: %d %d\n", id, ch=
ip_id);
>
> Displaying the device ID is pointless here since that is an internal
> value which doesn't mean anything to the user.
>
> > +     else
> > +             pr_info("Device Match %d %d\n", id, chip_id);
>
> Unnecessary noise, and wrong use of pr_info(). Why are you using pr_info
> randomly anyway ? This is odd.
>
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
> > +                             data->vout_multiplier, ARRAY_SIZE(data->v=
out_multiplier))) {
> > +             pr_info("vout_multiplier from Device Tree:%d %d\n",
> > +                             data->vout_multiplier[0], data->vout_mult=
iplier[1]);
> > +     } else {
> > +             pr_info("vout_multiplier not available from Device Tree")=
;
> > +             data->vout_multiplier[0] =3D 0x01;
> > +             data->vout_multiplier[1] =3D 0x01;
> > +             pr_info("vout_multiplier default value:%d %d\n",
> > +                             data->vout_multiplier[0], data->vout_mult=
iplier[1]);
> > +     }
> > +
> > +     return pmbus_do_probe(client, &data->info);
> > +}
> > +
> > +static const struct i2c_device_id tda38740a_id[] =3D {
> > +     {"tda38725a",  tda38725a},
> > +     {"tda38740a",  tda38740a},
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> > +
> > +static const struct of_device_id __maybe_unused tda38740a_of_match[] =
=3D {
> > +     {.compatible =3D "infineon,tda38725a", .data =3D (void *)tda38725=
a },
> > +     {.compatible =3D "infineon,tda38740a", .data =3D (void *)tda38740=
a },
> > +     { }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> > +
> > +/**
> > + *  This is the driver that will be inserted
> > + */
>
> Useless comment.
>
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
