Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7C363C7F
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Jan 2026 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975831; cv=none; b=IR90fpjJ5RM+Congtpf4uxUYKRx7Ya6YABc48pqXzPJeuaxLAhwas9ybNreVDj8cwMQbQMDrjepy1DySPkm3vuEbmK7Nlhx/CkJfsDwftVqVO9X376HbYeVWHlYclNHIdhKCv5wT73Usj0pd1o+5hr4nfuQSgkGuovL7mByDrYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975831; c=relaxed/simple;
	bh=T7Q37yJAdMXYq236jv4V/1sQh9sGG/CntmKjZoGuzrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asscl58BjsJozGIqY1FMZ6BraZha30K/6Jt819KRH1U3FgmybBCQtu3h1glYVSfuySHdINnyENQWfJH2MiptvH7RwcioQCbAYIB9n9Yvvaes7vHCmMSHW0AIs+A0+kCHgJgi46AUB6BJ6/af1quNq2WSa5IPC0JhsHHLlsRICbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGb58dzo; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGb58dzo"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b05fe2bf14so5933973eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 08:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767975829; x=1768580629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUOytvSVJwvJo730m0I3yzst0Ur7ufRm3hBsNY1BUd4=;
        b=AGb58dzoPAMpfq+DMk4nlNdxK0BeNtTkhlLWTvlEDg0gYowPveooO3kL0ByXTOkZ28
         w4XW8Ov+iB4SZkVl2Fo9Hb1hEO5xKuoxF5LGPc8xdlv1EzuAMo8SJFTHVF++VdwIpBw6
         uuWb3kLCHYdXFGo++Z7b0TMb6KW2NBKcFYOjIPciXHMJjq019hcOChWsX1I1WwTJR5mS
         OJZbXTv4i8vwxQOwP5qotUkLtzqQeEP7dt9snSJWQCzpwnKOuzqkKc1L2KFHLnX65gWL
         aOEP4c+/YtpZemPpB4onEVv5nrIJau8xnz2gM4zTV6aXzwVIboOwrflV5gj6AHJakh7L
         4t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975829; x=1768580629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUOytvSVJwvJo730m0I3yzst0Ur7ufRm3hBsNY1BUd4=;
        b=GSkUdOKm2yAhsWbK4ZsKTl2yCCklqDHOTwG24/awLG24z44X2uiRss0Sii9eZ/Qopq
         LDn5cg5ksr14VspkLoVIHLR596d93jEC3XQoc1T85UEAPbR1mq7w/TD3LMpdboXvR1D1
         Yti3I4cIiGYGHOjTlkUCQTOcYeEdrJWivBg6gxlHUIx8/5N5Hl/pStUU/fLP4C1gUcIu
         7YX2YdQQdLaq5RsCfmGJyt6/M706GygYjBJ5rDAIK9VtQPBE0Ru8Hzyr6jcGUYO0gITA
         TmUFrhIaxPYH7jiV7wqwm1v9tAO20TnMDt8xoKf6W8Jpvwkz793cWsOLpMdj+1F9q1Do
         atyA==
X-Gm-Message-State: AOJu0Yy3J5SEob+rYou14lXVLHn84IObitOb8EIDpwhwqEcMb5jrvcMx
	cx4cElpdqVC8UXbsRbFV6iNb+D0HgjJyG67QxEvkvVdvDR5zWTaeQbeBcsrVDPsfiLTK6KFN0yp
	jJrqrWS/DLfOzZmqwRbyQ0/22b60r8Aw=
X-Gm-Gg: AY/fxX6UzuCPFWjzu9tWptRMytDjjxWge5X9522uNeyAUMVVxJInG0U/RuzKvQmgjdU
	CjLPhz6h6uFzhkrsjsYZgJTStCEGuQSy4LnRiGojqifwUc2f0AqhDqRqeB1gUbiZ7k3ykv/R2JB
	dR8Uwqcvb8SK10otoI6G74xdC0eAXpJ8QONtPbRaCR+d9AHkqY9/yDpIyJGU4MqEBWceLUasW0K
	WmwjSZEmOEVYf8pgRoWgH23raJdS4vBjPHJUqGfAxN9ZCdXjCG1fkiXgI+t2O9PuMovE1k=
X-Google-Smtp-Source: AGHT+IENp7TgFWZ6pfqsT9iycNcKECCjYN/94+Wg62N+utunG0u7WdmR/qM+FHjHmBk62prKnO6VpYB+d6t1o66RDN4=
X-Received: by 2002:a05:7301:fa6:b0:2a4:3593:968d with SMTP id
 5a478bee46e88-2b17d221b06mr5808193eec.10.1767975828659; Fri, 09 Jan 2026
 08:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
In-Reply-To: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Fri, 9 Jan 2026 21:53:37 +0530
X-Gm-Features: AZwV_QgVoMWbmemkXz7YXJPtvzrZ-gmROHuB1FNb30nfyLeiVgda-HVSFd3bSXE
Message-ID: <CAJKbuCZ34vDJXMvxmPkDcEfNm5UQyf3HcKjh0xDCmV9WGd1p+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Could you please review the current patch.
Thanks for your time and valuable feedback in the previous patch.

You can find documentation (dt-bindings) of this driver here:
https://lkml.org/lkml/2026/1/7/1122

With Best Regards
   Ashish Yadav

  Ashish Yadav

On Wed, Jan 7, 2026 at 8:15=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.co=
m> wrote:
>
> Add the pmbus driver for the Infineon TDA38740A/TDA38725A
> DC-DC voltage regulator.
>
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> ---
> Changes in v2:
>  - Review comments address.
>  - Another Patch for Devicetree binding submitted for Driver
>    Documentation.
> ---
>  drivers/hwmon/pmbus/Kconfig     |  16 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/tda38740a.c | 203 ++++++++++++++++++++++++++++++++
>  3 files changed, 220 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..e7d7ff1b57df 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -602,6 +602,22 @@ config SENSORS_TDA38640_REGULATOR
>           If you say yes here you get regulator support for Infineon
>           TDA38640 as regulator.
>
> +config SENSORS_TDA38740A
> +       tristate "Infineon TDA38740A"
> +       help
> +         If you say yes here you get hardware monitoring support for Inf=
ineon
> +         TDA38740A/25A.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called tda38740a.
> +
> +config SENSORS_TDA38740A_REGULATOR
> +       bool "Regulator support for TDA38740A and compatibles"
> +       depends on SENSORS_TDA38740A && REGULATOR
> +       help
> +         If you say yes here you get regulator support for Infineon
> +         TDA38740A/25A as regulator.
> +
>  config SENSORS_TPS25990
>         tristate "TI TPS25990"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..f422c80cf3d8 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_SENSORS_PXE1610) +=3D pxe1610.o
>  obj-$(CONFIG_SENSORS_Q54SJ108A2)       +=3D q54sj108a2.o
>  obj-$(CONFIG_SENSORS_STPDDC60) +=3D stpddc60.o
>  obj-$(CONFIG_SENSORS_TDA38640) +=3D tda38640.o
> +obj-$(CONFIG_SENSORS_TDA38740A)  +=3D tda38740a.o
>  obj-$(CONFIG_SENSORS_TPS25990) +=3D tps25990.o
>  obj-$(CONFIG_SENSORS_TPS40422) +=3D tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679) +=3D tps53679.o
> diff --git a/drivers/hwmon/pmbus/tda38740a.c b/drivers/hwmon/pmbus/tda387=
40a.c
> new file mode 100644
> index 000000000000..b31e1b5c6916
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740a.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/**
> + * Hardware monitoring driver for Infineon Integrated-pol-voltage-regula=
tors
> + * Driver for TDA38725A and TDA38740A
> + *
> + * Copyright (c) 2025 Infineon Technologies
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regulator/driver.h>
> +#include "pmbus.h"
> +
> +#define TDA38725A_IC_DEVICE_ID "\xA9"
> +#define TDA38740A_IC_DEVICE_ID "\xA8"
> +
> +static const struct i2c_device_id tda38740a_id[];
> +
> +enum chips { tda38725a, tda38740a };
> +
> +struct tda38740a_data {
> +       enum chips id;
> +       struct pmbus_driver_info info;
> +       u32 vout_voltage_multiplier[2];
> +};
> +
> +#define to_tda38740a_data(x) container_of(x, struct tda38740a_data, info=
)
> +
> +static const struct regulator_desc __maybe_unused tda38740a_reg_desc[] =
=3D {
> +       PMBUS_REGULATOR("vout", 0),
> +};
> +
> +static int tda38740a_read_word_data(struct i2c_client *client, int page,
> +                                   int phase, int reg)
> +{
> +       const struct pmbus_driver_info *info =3D pmbus_get_driver_info(cl=
ient);
> +       const struct tda38740a_data *data =3D to_tda38740a_data(info);
> +       int ret;
> +
> +       /* Virtual PMBUS Command not supported */
> +       if (reg >=3D PMBUS_VIRT_BASE)
> +               return -ENXIO;
> +
> +       switch (reg) {
> +       case PMBUS_READ_VOUT:
> +               ret =3D pmbus_read_word_data(client, page, phase, reg);
> +               if (ret < 0)
> +                       return ret;
> +               ret =3D ((ret * data->vout_voltage_multiplier[0]) /
> +                      data->vout_voltage_multiplier[1]);
> +               break;
> +       case PMBUS_VOUT_COMMAND:
> +       case PMBUS_VOUT_MAX:
> +       case PMBUS_VOUT_MARGIN_HIGH:
> +       case PMBUS_VOUT_MARGIN_LOW:
> +       case PMBUS_VOUT_TRANSITION_RATE:
> +       case PMBUS_VOUT_DROOP:
> +       case PMBUS_VOUT_SCALE_LOOP:
> +       case PMBUS_VOUT_OV_FAULT_LIMIT:
> +       case PMBUS_VOUT_UV_FAULT_LIMIT:
> +       case PMBUS_IOUT_OC_FAULT_LIMIT:
> +       case PMBUS_OT_FAULT_LIMIT:
> +       case PMBUS_OT_WARN_LIMIT:
> +       case PMBUS_VIN_OV_FAULT_LIMIT:
> +       case PMBUS_STATUS_WORD:
> +       case PMBUS_READ_VIN:
> +       case PMBUS_READ_IIN:
> +       case PMBUS_READ_IOUT:
> +       case PMBUS_READ_TEMPERATURE_1:
> +       case PMBUS_READ_POUT:
> +       case PMBUS_READ_PIN:
> +               ret =3D pmbus_read_word_data(client, page, phase, reg);
> +               break;
> +       default:
> +               ret =3D -ENODATA;
> +               break;
> +       }
> +       return ret;
> +}
> +
> +static struct pmbus_driver_info tda38740a_info[] =3D {
> +       [tda38740a] =3D {
> +               .pages =3D 1,
> +               .read_word_data =3D tda38740a_read_word_data,
> +               .format[PSC_VOLTAGE_IN] =3D linear,
> +               .format[PSC_VOLTAGE_OUT] =3D linear,
> +               .format[PSC_CURRENT_OUT] =3D linear,
> +               .format[PSC_CURRENT_IN] =3D linear,
> +               .format[PSC_POWER] =3D linear,
> +               .format[PSC_TEMPERATURE] =3D linear,
> +
> +               .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +                       | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +                       | PMBUS_HAVE_IIN
> +                       | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +                       | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +                       | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
> +               .num_regulators =3D 1,
> +               .reg_desc =3D tda38740a_reg_desc,
> +#endif
> +       },
> +};
> +
> +static int tda38740a_get_device_id(struct i2c_client *client)
> +{
> +       u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
> +       enum chips id;
> +       int status;
> +
> +       status =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
> +                                          device_id);
> +       if (status < 0 || status > 1) {
> +               dev_err(&client->dev,
> +                       "Failed to read Device ID or unexpected/unsupport=
ed Device\n");
> +               return -ENODEV;
> +       }
> +
> +       if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, 1)) {
> +               id =3D tda38725a;
> +       } else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id, 1)) {
> +               id =3D tda38740a;
> +       } else {
> +               dev_err(&client->dev, "Unsupported device with ID:%s\n",
> +                       device_id);
> +               return -ENODEV;
> +       }
> +
> +       return id;
> +}
> +
> +static int tda38740a_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct tda38740a_data *data;
> +       int chip_id;
> +
> +       if (!i2c_check_functionality(client->adapter,
> +                                    I2C_FUNC_SMBUS_BYTE |
> +                                            I2C_FUNC_SMBUS_BYTE_DATA |
> +                                            I2C_FUNC_SMBUS_WORD_DATA |
> +                                            I2C_FUNC_SMBUS_BLOCK_DATA))
> +               return -ENODEV;
> +
> +       chip_id =3D tda38740a_get_device_id(client);
> +       if (chip_id < 0)
> +               return chip_id;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +       data->id =3D chip_id;
> +       memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info))=
;
> +
> +       if (!of_property_read_u32_array(client->dev.of_node, "infineon,vo=
ut-voltage-multiplier",
> +                                       data->vout_voltage_multiplier,
> +                   ARRAY_SIZE(data->vout_voltage_multiplier))) {
> +               dev_info(&client->dev,
> +                        "vout-voltage-multiplier from Device Tree:%d %d\=
n",
> +                        data->vout_voltage_multiplier[0],
> +                        data->vout_voltage_multiplier[1]);
> +       } else {
> +               dev_info(&client->dev,
> +                        "vout-voltage-multiplier not available from Devi=
ce Tree,using default values");
> +               data->vout_voltage_multiplier[0] =3D 0x01;
> +               data->vout_voltage_multiplier[1] =3D 0x01;
> +       }
> +
> +       return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740a_id[] =3D { { "tda38725a", td=
a38725a },
> +                                                    { "tda38740a", tda38=
740a },
> +                                                    {} };
> +
> +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> +
> +static const struct of_device_id __maybe_unused tda38740a_of_match[] =3D=
 {
> +       { .compatible =3D "infineon,tda38725a", .data =3D (void *)tda3872=
5a },
> +       { .compatible =3D "infineon,tda38740a", .data =3D (void *)tda3874=
0a },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> +
> +static struct i2c_driver tda38740a_driver =3D {
> +       .driver =3D {
> +               .name =3D "tda38740a",
> +               .of_match_table =3D of_match_ptr(tda38740a_of_match),
> +       },
> +       .probe =3D tda38740a_probe,
> +       .id_table =3D tda38740a_id,
> +};
> +
> +module_i2c_driver(tda38740a_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725A/40A IPOL");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> --
> 2.39.5
>
