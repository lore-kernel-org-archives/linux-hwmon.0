Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3631FC4321E
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 12:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiK0MkL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 07:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiK0MkL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 07:40:11 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66976150
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:40:09 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j4so13542322lfk.0
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfNtCSkSRQll5ZX6o9UVd17HAgyCMwZu68MeoLtWMps=;
        b=G+DIU2yoXMKd6s87s3/yULCRq4SDU8yg/jKLafnqryCAe22O/TrFXLu/QbOBK+IAqJ
         5QwsHhQBXATPRhBB3l8ahP8x4G23Opb/L4eETC7w/BRmxF6/0DnY+MCi5mqe/NLs+1ef
         IiHn+EDAEWL7LZh/RpTPAfXxkdgq/jJEowSNmCcrdSHDxl59xYRU8ffxkTq8SrLOg3hD
         J76SNPFsN9LxMXEpMclBrk3OSmgoM5bV4loyqgePQKiVoQRR6zmnYExzBRexRbbakGZ0
         iQw3R1+iS7QvJ1V3B0tjoWliaFBQkByqq4Xj6rzz3rcHtdnkBbl7JVYRmw4Cq3kwT6Ls
         YwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfNtCSkSRQll5ZX6o9UVd17HAgyCMwZu68MeoLtWMps=;
        b=jd02WCzBhCZvAlyqz5SvbQ7qlAQqWMHHbXBtpgqZkr8PcqIGaea8xRsTEZJZMF5xef
         qjWai+0h9YKYnDo9l4pD16zQ3I+3AAH0Edb42ODdHShi2T2hBIYfZeSoVSdgVVY+439d
         YI7vXF/QcoWnoCReACtngh8pTuWUDOxq6ri3rhI6IvVgZaOC4Mfsnf2pL0XTzKeHj6gk
         i/+3eoE3mLXFwQ3wPuWwuFXSJVWpfmzEKzdH9phql2iETGUguEyVr8cZMFfhvBU8b4IL
         17horpT7kviEG5rx/dCh5CbiLj4GD9G7hax8VtqglRjTK69IiqjlO+hPTs8uoUdV2i4M
         x18Q==
X-Gm-Message-State: ANoB5plha8fqTfU9abWhPLj2WVklL6MXvtsc4B8P7Cbxd9KqM5plN4lN
        E2kcj5GV+4ASofDHhYmleF1gzQBDkLPYO7pM
X-Google-Smtp-Source: AA0mqf48SSqXlqYw0CMTBRU9NBV/6QU7/3xT5zu/d8NHxKLsJt8abV8fpqw/K5peMMui9Msmg3CBLQ==
X-Received: by 2002:ac2:41d4:0:b0:4af:cd2:f8d5 with SMTP id d20-20020ac241d4000000b004af0cd2f8d5mr16337788lfi.489.1669552808221;
        Sun, 27 Nov 2022 04:40:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e10-20020a05651236ca00b004991437990esm1300158lfs.11.2022.11.27.04.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:40:07 -0800 (PST)
Message-ID: <3a7324d9-7067-0a4b-2ed3-4515b96f5928@linaro.org>
Date:   Sun, 27 Nov 2022 13:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] hwmon: (pmbus/mpq7932) Add a support for mpq7932
 Power Management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
 <20221126171711.1078309-2-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221126171711.1078309-2-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 18:17, Saravanan Sekar wrote:
> The MPQ7932 is a power management IC designed to operate from 5V buses to
> power a variety of ADAS SOCs. Six integrated buck converters power a
> variety of target rails configurable over PMBus interface.
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  drivers/hwmon/pmbus/Kconfig   |   9 ++
>  drivers/hwmon/pmbus/Makefile  |   1 +
>  drivers/hwmon/pmbus/mpq7932.c | 150 ++++++++++++++++++++++++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/mpq7932.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 89668af67206..5e938768bd77 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -317,6 +317,15 @@ config SENSORS_MP5023
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp5023.
>  
> +config SENSORS_MPQ7932_REGULATOR
> +	tristate "MPS MPQ7932 buck regulator"

It's a regulator, not hwmon.

> +	help
> +	  If you say yes here you get six integrated buck converter
> +	  regulator support for power management IC MPS MPQ7932.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mpq7932.
> +
>  config SENSORS_PIM4328
>  	tristate "Flex PIM4328 and compatibles"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 0002dbe22d52..28a534629cc3 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>  obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
> +obj-$(CONFIG_SENSORS_MPQ7932_REGULATOR) += mpq7932.o
>  obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
>  obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
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
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/of_device.h>
> +#include <linux/pmbus.h>
> +#include <linux/i2c.h>
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
> +	.driver = {
> +		.name = "mpq7932",
> +		.of_match_table = of_match_ptr(mpq7932_of_match),

Missing maybe_unused, so drop of_match_ptr.

Best regards,
Krzysztof

