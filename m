Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FD3C4321E
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Nov 2022 17:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiKZRuP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Nov 2022 12:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKZRuO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Nov 2022 12:50:14 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0AF14D0F
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 09:50:13 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so1083556ooi.5
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2022 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V744ePbJsfscAqhN8jGw7+vUBIeepMqhs+jv+zhc8fE=;
        b=VD289eXxkwYoh9/NRXDrEr0+nK9GX8apgdoJSAwmai6GJK9cK5MAS3vkWEUP/5AxoI
         FlIRgU742XOp+MMIZGkrP1ZZGpvUs8fh1YAj5nsFTu8ZwNdcZp6F7IBeu4hNn/C1sJsc
         Tys85BngG82/fIGZNMnMEObTd3Axlgl0TcehAvuU7aOobzMR0oxw0GIrGlch94iViYwX
         ZTO206YOC+jXeZx/oqnN0wzb88KqwXcBCLX2CADzgaiCW8Gq1mNGDekeRGnsJDrmske5
         cZdxeVX4G638VLB6D9eox2/url2W8d39804I7MbrED35z3PdjPC2cdDr+GyD3L3edvN2
         0Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V744ePbJsfscAqhN8jGw7+vUBIeepMqhs+jv+zhc8fE=;
        b=N+H5Cd0MQAPT0YU6Czczaqta4i8Cq9qxEjTTb7dhqHYEHrR8g+DCvg8qnBjjE9ULiu
         /1z9r+v/bXl4o0a/DthVjx+MA/ql6kLlMc7b5bg0jUUpjgdcf86LuQUUS0OUKjB1LQkq
         v8bG8hfbiTi2RoiTjWOYNcyUZvoPRW2NlSxOdi3lRplfIDEKTUEyAB5og6fWDCpHzRTT
         YTawWgW6uPxNXSSyMTJoCnbsMVRKUys2TS62trN1AeSBkBaFYh2swE8lRr8fo3kIvpPV
         m8KVOWgfINTH8Akvn37xLsxOWljWrS+qQUu6PiHyohfHBeNGIklxOYM8wlQlx4kpgV1E
         3X1w==
X-Gm-Message-State: ANoB5plY+dzhlLwCmUffhTFkq2NZCDbbNtKqlBRrnk6eAYYyZxw6XzHQ
        1SoiK51KMsXFWdbhqrCHlao=
X-Google-Smtp-Source: AA0mqf6dAcQiIRM44AjBRNy9prKkunfxEoT2P7ktjpdD2RsDxmoBQkieWHJFv3w3q/GZBA+km+fTHA==
X-Received: by 2002:a4a:be99:0:b0:49f:cb3c:5be9 with SMTP id o25-20020a4abe99000000b0049fcb3c5be9mr10065266oop.25.1669485012247;
        Sat, 26 Nov 2022 09:50:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j7-20020a4adf47000000b0049fda92594asm2679205oou.23.2022.11.26.09.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 09:50:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec33655d-4070-4107-4c5c-f798ebe56b73@roeck-us.net>
Date:   Sat, 26 Nov 2022 09:50:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
 <20221126171711.1078309-2-saravanan@linumiz.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 2/3] hwmon: (pmbus/mpq7932) Add a support for mpq7932
 Power Management IC
In-Reply-To: <20221126171711.1078309-2-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/26/22 09:17, Saravanan Sekar wrote:
> The MPQ7932 is a power management IC designed to operate from 5V buses to
> power a variety of ADAS SOCs. Six integrated buck converters power a
> variety of target rails configurable over PMBus interface.
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>

I find no reference to this chip anywhere. Can you provide one ?

Also, please refrain from cryptic abbreviations. You may know what
ADAS means, but I have no idea.

> ---
>   drivers/hwmon/pmbus/Kconfig   |   9 ++
>   drivers/hwmon/pmbus/Makefile  |   1 +
>   drivers/hwmon/pmbus/mpq7932.c | 150 ++++++++++++++++++++++++++++++++++
>   3 files changed, 160 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/mpq7932.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 89668af67206..5e938768bd77 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -317,6 +317,15 @@ config SENSORS_MP5023
>   	  This driver can also be built as a module. If so, the module will
>   	  be called mp5023.
>   
> +config SENSORS_MPQ7932_REGULATOR

Drop "_REGULATOR".

> +	tristate "MPS MPQ7932 buck regulator"
> +	help
> +	  If you say yes here you get six integrated buck converter
> +	  regulator support for power management IC MPS MPQ7932.
> +

This primarily adds hardware monitoring support. Referring to it
only as regulator is misleading. Please also refer to hardware
monitoring functionality. More on that below.

> +	  This driver can also be built as a module. If so, the module will
> +	  be called mpq7932.
> +
>   config SENSORS_PIM4328
>   	tristate "Flex PIM4328 and compatibles"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 0002dbe22d52..28a534629cc3 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>   obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>   obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
> +obj-$(CONFIG_SENSORS_MPQ7932_REGULATOR) += mpq7932.o
>   obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
>   obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>   obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
> diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
> new file mode 100644
> index 000000000000..23d3ccdaed1e
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpq7932.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// mpq7932.c  - regulator driver for mps mpq7932
> +//
> +// Copyright 2022 Monolithic Power Systems, Inc
> +//
> +// Author: Saravanan Sekar <saravanan@linumiz.com>
> +

No C++ comments in hwmon subsystem, please, unless mandated.

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/of_device.h>
> +#include <linux/pmbus.h>
> +#include <linux/i2c.h>

Alphabetic include file order, please.

> +#include "pmbus.h"
> +
> +#define MPQ7932_BUCK_UV_MIN		206250
> +#define MPQ7932_UV_STEP			6250
> +#define MPQ7932_N_VOLTAGES		0xFF
> +#define MPQ7932_NUM_PAGES		6
> +
> +#define MPQ7932_TON_DELAY		0x60
> +#define MPQ7932_VOUT_STARTUP_SLEW	0xA3
> +#define MPQ7932_VOUT_SHUTDOWN_SLEW	0xA5
> +#define MPQ7932_VOUT_SLEW_MASK		GENMASK(1, 0)
> +#define MPQ7932_TON_DELAY_MASK		GENMASK(4, 0)
> +
> +#define MPQ7932BUCK(_id)					\
> +	[_id] = {						\
> +		.id = _id,					\
> +		.name = ("buck" # _id),				\
> +		.of_match = of_match_ptr("buck" # _id),		\
> +		.regulators_node = "regulators",		\
> +		.ops = &pmbus_regulator_ops,			\
> +		.type = REGULATOR_VOLTAGE,			\
> +		.min_uV = MPQ7932_BUCK_UV_MIN,			\
> +		.uV_step = MPQ7932_UV_STEP,			\
> +		.n_voltages = MPQ7932_N_VOLTAGES,		\
> +	}

Why not use PMBUS_REGULATOR_STEP ?

> +
> +struct mpq7932_data {
> +	struct pmbus_driver_info info;
> +	struct pmbus_platform_data pdata;
> +};
> +
> +static struct regulator_desc mpq7932_regulators_desc[] = {
> +	MPQ7932BUCK(0),
> +	MPQ7932BUCK(1),
> +	MPQ7932BUCK(2),
> +	MPQ7932BUCK(3),
> +	MPQ7932BUCK(4),
> +	MPQ7932BUCK(5),
> +};
> +
> +static int mpq7932_write_word_data(struct i2c_client *client, int page, int reg,
> +			       u16 word)
> +{
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_COMMAND:
> +		return pmbus_write_byte_data(client, page, reg, (u8)word);
> +

This needs explanation. VOUT_COMMAND directly sets a voltage, and the provided
value is in ULINEAR16 format. Just using its lower 8 bits seems, at the very
least, odd.

> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int mpq7932_read_word_data(struct i2c_client *client, int page,
> +				  int phase, int reg)
> +{
> +
> +	switch (reg) {
> +	case PMBUS_MFR_VOUT_MIN:
> +		return 0;
> +
> +	case PMBUS_MFR_VOUT_MAX:
> +		return MPQ7932_N_VOLTAGES;
> +

This is not how this is intended to work. If the chip does not provide
those properties, they should not be faked.

> +	case PMBUS_READ_VOUT:
> +		return pmbus_read_byte_data(client, page, PMBUS_VOUT_COMMAND);
> +
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int mpq7932_probe(struct i2c_client *client)
> +{
> +	struct mpq7932_data *data;
> +	struct pmbus_driver_info *info;
> +	struct device *dev = &client->dev;
> +	int i;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_WORD_DATA))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mpq7932_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	info = &data->info;
> +	info->pages = MPQ7932_NUM_PAGES;
> +	info->num_regulators = ARRAY_SIZE(mpq7932_regulators_desc);
> +	info->reg_desc = mpq7932_regulators_desc;
> +	info->format[PSC_VOLTAGE_OUT] = direct;
> +	info->m[PSC_VOLTAGE_OUT] = 160;
> +	info->b[PSC_VOLTAGE_OUT] = -33;
> +	for (i = 0; i < info->pages; i++) {
> +		info->func[i] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +				| PMBUS_HAVE_STATUS_TEMP;
> +	}
> +

Is that really all the chip supports ? No input data, no current
or power measurements ?

Is this even a real PMBus chip, or a fake one which claims to support
PMBus but in reality doesn't ?

> +	info->read_word_data = mpq7932_read_word_data;
> +	info->write_word_data = mpq7932_write_word_data;
> +
> +	data->pdata.flags = PMBUS_NO_CAPABILITY;
> +	dev->platform_data = &data->pdata;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id mpq7932_of_match[] = {
> +	{ .compatible = "mps,mpq7932"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpq7932_of_match);
> +
> +static const struct i2c_device_id mpq7932_id[] = {
> +	{ "mpq7932", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, mpq7932_id);
> +
> +static struct i2c_driver mpq7932_regulator_driver = {

PMBus drivers are not primarily regulator drivers. They
are hardware monitoring drivers. It is difficult for me to
determine, due to lack of information about this chip,
what it actually supports. If the chip is really a regulator
masquerading as PMBus chip, you might want to consider writing
a regulator driver for it.

Guenter

> +	.driver = {
> +		.name = "mpq7932",
> +		.of_match_table = of_match_ptr(mpq7932_of_match),
> +	},
> +	.probe_new = mpq7932_probe,
> +	.id_table = mpq7932_id,
> +};
> +module_i2c_driver(mpq7932_regulator_driver);
> +
> +MODULE_AUTHOR("Saravanan Sekar <saravanan@linumiz.com>");
> +MODULE_DESCRIPTION("MPQ7932 PMIC regulator driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);

