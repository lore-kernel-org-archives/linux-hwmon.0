Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9200636A009
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 07:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289065; cv=none; b=ZbeFMX3HW/Z2iLatB51SKpk737M4VpAGPZHgOKhxu4U105WA22qPOC7lM8iBxF1y+i2p1z4HPHk30HlvWN9mOaplOU4SEcbFPYxFpKdPb5INcu4GV7q53oYSHrcoGufbp8XX5H8WOAPhv801bUWcjqv7Sbvxuhu1ZMk604/ecyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289065; c=relaxed/simple;
	bh=BPj6rd9Zk93EO/G+bn4rbaBY2eaRV2cr3U5MsZTBOQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g87WH/0+sBNhTxR0b2TUuqoJfqeMvQJoTrkFFcr4q/soU07tHt9BrhFfpY9zvZ/2WaiBRaYs/YH+MZrUJZHCVySTw6/d3KmGu980WXHDpVxg4ZvdsZgYHIX6AwSgckcjT7wzimhce8YJ4JJf9XhQnQst9vuUA9akXQ7uoD390yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXJMcShj; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXJMcShj"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae5af476e1so2913170eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 23:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768289062; x=1768893862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi7aqXG+py9eB3OSrxPBr17wRL1b5YG9XuUcO42Y71A=;
        b=AXJMcShjRGcAfwvhaRjTnYh1qQTvHOrCOnXngN7RGdeNrZoMRRUDzm1cmTWsTfdbnR
         AHlS2A7lYdjXluNV+Lgu3EvZ8cClbIDJFVN0BmjYjCzZx8nkhPL92el8mFMeCsSgMv3c
         c/FrtDf30q4BpRqLSytAiZ/KeBX5MT/IbCueWuOUtV4rUbYuVHNyC+o0mKIgMqpO4MxW
         O4z/UPqrbUNLiwGMJwW6WkhOWt+K6iBZvLxlA9zVACVhZieSSnWeQafpD8TrJL7kqLqQ
         N5kl81iOPuQZoseV6OMEWmxBWIOBpo0l1uK+3p6EcYw+7zF+P2pcalDg29jTlsU79Elz
         sxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768289062; x=1768893862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fi7aqXG+py9eB3OSrxPBr17wRL1b5YG9XuUcO42Y71A=;
        b=c7fjj3aoNINMtAVVYRDBgOQxQQyc5Rg7/c5jtdWXztJa06NAl+07Oo5uKQtvJ/TNJh
         n1WuMaB4TO+P0oOocrB6yvQFAxpgZcnkZPfPxL7jbATRc++XR2/0p+lSUhwcbUqIas2b
         IZLTxmu3SIOXAPOoGmmzoskaVHXuQ5UbC4c5XPad5ESCsbt5k0kqwwVAJadsGvoNgA+k
         iFKJdYjLzgwIWAhqOtSvntUxGSyNqvoY84Jjs1HZYWNJQ24qzeoqDVvDjJ0ifmIYSw70
         CKFeNFmDQfqf6ZRLUpcPYRBoRfx4hR+IG+VUgk9aiVVmFJwkW/6ztin5MZJitWy1hiCg
         n2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVncVFf9JpqLXwYlaqWDlEL4xJKyDS4LeUQsx883peuQvEH9r9PLXZWoCWLTVVHP0yhQfI1askeNzi09w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMkCnNWy0qvoAoRBtDGuVNvxJry7JqQLaN5Zd4aBmccXvUG5p
	Zm3FtRc3yOqK5K/YtpGdrLUwyBjYPDf6YwvSaAgmJw07VdicDZjSCRaqZC1QTHCBhxLO7wwgl7T
	fH/5qV+yejg483SfYzbXohcttU/0DPWo=
X-Gm-Gg: AY/fxX7BTN3g+bmdyjdQUwBgjBASsmPaj2ox1eA+F9slSlqmjK4LjbriVkLqVwHK9VM
	Umbfnau1BSLNuJ1J3qikLlevqwpJY6h4bwZEUzaKjes4jH5AR4FpKw1zQXFpQyqkvH+YZri35Py
	pHkD4AynXFfqglehBxWgEUpPOf2YqYL9ctz1BJF6T7AfFNvirAUIFMq9eU/eTZhLxgXAVUn+qxX
	Be+fjA+ji42RZu+M4ubB2SyigAzLtxu/XyMM+EW7C8WoErIHhE0xW4Y6A9+dQFcrf30xCy9
X-Received: by 2002:a05:7300:bf8a:b0:2ae:5076:b61 with SMTP id
 5a478bee46e88-2b44f205c54mr1659540eec.3.1768289062398; Mon, 12 Jan 2026
 23:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com> <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net>
In-Reply-To: <03da3b10-dfe9-466a-9dc9-b51e29938e3e@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Tue, 13 Jan 2026 12:54:10 +0530
X-Gm-Features: AZwV_Qj67qX5Y6IyOltha0CsBNV0ZlJjrM9y2HNqeYRMkaY3dEUUMIcLW9PdQQg
Message-ID: <CAJKbuCYcRMrX5H5rWXWXOz4FCZi5iu8CCE2Oi3WEsWqEikqsYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage
 Regulator Driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for your time and review comments.
Please find my answer inline.

With Regards
  Ashish

On Tue, Jan 13, 2026 at 3:21=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/7/26 06:45, ASHISH YADAV wrote:
> > Add the pmbus driver for the Infineon TDA38740A/TDA38725A
> > DC-DC voltage regulator.
> >
> > Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> > ---
> > Changes in v2:
> >   - Review comments address.
>
> That is not a change log.

ACK, I  will  address it in the v3 release .
>
> >   - Another Patch for Devicetree binding submitted for Driver
> >     Documentation.
> > ---
> >   drivers/hwmon/pmbus/Kconfig     |  16 +++
> >   drivers/hwmon/pmbus/Makefile    |   1 +
> >   drivers/hwmon/pmbus/tda38740a.c | 203 +++++++++++++++++++++++++++++++=
+
>
> Documentation is missing.

ACK, I  will  address it in the v3 release .

> >   3 files changed, 220 insertions(+)
> >   create mode 100644 drivers/hwmon/pmbus/tda38740a.c
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
> >   config SENSORS_TPS25990
> >       tristate "TI TPS25990"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index 349a89b6d92e..f422c80cf3d8 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -58,6 +58,7 @@ obj-$(CONFIG_SENSORS_PXE1610)       +=3D pxe1610.o
> >   obj-$(CONFIG_SENSORS_Q54SJ108A2)    +=3D q54sj108a2.o
> >   obj-$(CONFIG_SENSORS_STPDDC60)      +=3D stpddc60.o
> >   obj-$(CONFIG_SENSORS_TDA38640)      +=3D tda38640.o
> > +obj-$(CONFIG_SENSORS_TDA38740A)  +=3D tda38740a.o
> >   obj-$(CONFIG_SENSORS_TPS25990)      +=3D tps25990.o
> >   obj-$(CONFIG_SENSORS_TPS40422)      +=3D tps40422.o
> >   obj-$(CONFIG_SENSORS_TPS53679)      +=3D tps53679.o
> > diff --git a/drivers/hwmon/pmbus/tda38740a.c b/drivers/hwmon/pmbus/tda3=
8740a.c
> > new file mode 100644
> > index 000000000000..b31e1b5c6916
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tda38740a.c
> > @@ -0,0 +1,203 @@
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
> > +     u32 vout_voltage_multiplier[2];
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
>
> Why is this needed (instead of just returning -ENODATA) ?
>
ACK, I  will  address it in the v3 release .
> > +     switch (reg) {
> > +     case PMBUS_READ_VOUT:
> > +             ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +             if (ret < 0)
> > +                     return ret;
> > +             ret =3D ((ret * data->vout_voltage_multiplier[0]) /
> > +                    data->vout_voltage_multiplier[1]);
>
> The need for this, especially why it would only be needed for PMBUS_READ_=
VOUT
> but not for any other VOUT related commands, is still insufficiently expl=
ained
> (and I failed to understand the rationale provided earlier).
>

It is specifically needed for READ_VOUT as it is being used by
external controller to monitor the rail health.
Other Vout related parameters are used internally in the IC to for
output voltage related protections and does not impact any external
decision making.

> > +             break;
> > +     case PMBUS_VOUT_COMMAND:
> > +     case PMBUS_VOUT_MAX:
> > +     case PMBUS_VOUT_MARGIN_HIGH:
> > +     case PMBUS_VOUT_MARGIN_LOW:
> > +     case PMBUS_VOUT_TRANSITION_RATE:
> > +     case PMBUS_VOUT_DROOP:
> > +     case PMBUS_VOUT_SCALE_LOOP:
> > +     case PMBUS_VOUT_OV_FAULT_LIMIT:
> > +     case PMBUS_VOUT_UV_FAULT_LIMIT:
> > +     case PMBUS_IOUT_OC_FAULT_LIMIT:
> > +     case PMBUS_OT_FAULT_LIMIT:
> > +     case PMBUS_OT_WARN_LIMIT:
> > +     case PMBUS_VIN_OV_FAULT_LIMIT:
> > +     case PMBUS_STATUS_WORD:
> > +     case PMBUS_READ_VIN:
> > +     case PMBUS_READ_IIN:
> > +     case PMBUS_READ_IOUT:
> > +     case PMBUS_READ_TEMPERATURE_1:
> > +     case PMBUS_READ_POUT:
> > +     case PMBUS_READ_PIN:
> > +             ret =3D pmbus_read_word_data(client, page, phase, reg);
>
> I fail to see why this would be necessary. Just return -ENODATA.
>
ACK, I  will  address it in the v3 release .

> > +             break;
> > +     default:
> > +             ret =3D -ENODATA;
> > +             break;
> > +     }
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
> > +             dev_err(&client->dev,
> > +                     "Failed to read Device ID or unexpected/unsupport=
ed Device\n");
>
> How about printing the device ID here if it is unsupported ?
> It could be printed as hex string.
>
ACK, I  will  address it in the v3 release .

> > +             return -ENODEV;
> > +     }
> > +
> > +     if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, 1)) {
> > +             id =3D tda38725a;
> > +     } else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id, 1)) {
> > +             id =3D tda38740a;
> > +     } else {
> > +             dev_err(&client->dev, "Unsupported device with ID:%s\n",
> > +                     device_id);
>
> device_id is not terminated, and it is not a user readable string.
> It should be printed as hex string, or as hex byte (0xXX).
>
ACK, I  will  address it in the v3 release .

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
> > +     if (!of_property_read_u32_array(client->dev.of_node, "infineon,vo=
ut-voltage-multiplier",
> > +                                     data->vout_voltage_multiplier,
> > +                 ARRAY_SIZE(data->vout_voltage_multiplier))) {
> > +             dev_info(&client->dev,
> > +                      "vout-voltage-multiplier from Device Tree:%d %d\=
n",
> > +                      data->vout_voltage_multiplier[0],
> > +                      data->vout_voltage_multiplier[1]);
> > +     } else {
> > +             dev_info(&client->dev,
> > +                      "vout-voltage-multiplier not available from Devi=
ce Tree,using default values");
> > +             data->vout_voltage_multiplier[0] =3D 0x01;
> > +             data->vout_voltage_multiplier[1] =3D 0x01;
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
> > +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725A/40A IPOL");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
>
