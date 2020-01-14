Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD78C33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7DE82467A
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYUslha2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgANOIL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:08:11 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41398 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgANOIL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:08:11 -0500
Received: by mail-pf1-f195.google.com with SMTP id w62so6638794pfw.8;
        Tue, 14 Jan 2020 06:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cNwSNuEWthog2Uc9I5uGN7zK/GfKfLc0AgMZaQKPttE=;
        b=fYUslha2Z1MlC6PhkmuMaOJqlbbk1NG/GkSnSq12xvW4rfqqQ3P9saDo5vfDn/wGWm
         zQXuicESRISRZxgbwefSrTJzukNcZp+unGNFK03iifKCNX45bQ/xo16VzMGIvPNOVWSh
         0LS7cnCdzVORA4XelhOy1Qsii6M4Uf1lHR5TuysJNHnrWaDMTx50BUqjgC83PFF5F+a7
         /GmElf8U8uTcOvVKowowRPLGEd7jYEBFEwG3wDhnyay+5mDZOKWyB1Sufdvo8nQ5fmfV
         lalmG3gjRcMhtr/qGjwtorTjK67FmzdTmWX2azYgcCnkGrqIxl3LIJvlOZF3jjb9xa1M
         pdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cNwSNuEWthog2Uc9I5uGN7zK/GfKfLc0AgMZaQKPttE=;
        b=Ku0k1kb1cEwz7YZOooUTWEIzLzV1M4g5/wvRpe7G03p8KYTzHcWicFPUl9/Q7XO60R
         Ca57elHOpD6YwNKfGkUqGcsrK/Bscl2KxbZTOral/BEAZ0Fm0+x/eCK/NEG6Q3ERxiOa
         xMPhNFho7Fq+Cr+Zt6xs7xAWxh+w2Os5KZquBAJeKU8P4P0zEn52XX6f/bHfPoEDFAyc
         HQGMtqDu0hakGsgkPgQEC39ppSfM9jwkQ1ZZZ81H3iBoy9ZfFi7a8sAG0FSooDm6zC/B
         QF0MXFjl31q5345Ax6JYgU9zpbl/vZlQ3c0UZk3HEg1nDj5jsT98sX37DL4F4k/4OZmO
         MegA==
X-Gm-Message-State: APjAAAXsObnf5eMjyqjt5Zadl7vbbpsi0/J50Zvq8xZC1p+CuMzCqwVW
        aqvOLELirrwM8zR7CGK80A/gZRZ6
X-Google-Smtp-Source: APXvYqytoCooYlsKv50jBxbkw4F52gFkHDzgJN1t1Y4JSSSTD726tUxtT5qz/UNDvSLsm2wVp9F97g==
X-Received: by 2002:a65:5a8f:: with SMTP id c15mr26676326pgt.259.1579010890319;
        Tue, 14 Jan 2020 06:08:10 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u128sm18908439pfu.60.2020.01.14.06.08.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:08:09 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:08:08 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v1 4/6] hwmon: (pmbus) Add support for
 Infineon Multi-phase xdpe122 family controllers
Message-ID: <20200114140808.GA6334@roeck-us.net>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-5-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-5-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:39PM +0000, Vadim Pasternak wrote:
> Add support for devices XDPE12254, XDPE12284.
> 
> All these device support two pages.
> The below lists of VOUT_MODE command readout with their related VID
> protocols, Digital to Analog Converter steps, supported by these
> devices:
> VR12.0 mode, 5-mV DAC - 0x01;
> VR12.5 mode, 10-mV DAC - 0x02;
> IMVP9 mode, 5-mV DAC - 0x03;
> AMD mode 6.25mV - 0x10.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next (with fix applied - see below).

Thanks,
Guenter

> ---
> RFC-v1:
>  Changes added by Vadim:
>  - Add format for current in;
>  - Extend functions for both pages with "PMBUS_HAVE_IIN",
>    "PMBUS_HAVE_PIN" and "PMBUS_HAVE_STATUS_INPUT".
>  - Drop others than xdpe12284, xdpe12254 devices, since there is not
>    clear confirmation from Infineon regarding availability of the
>    others.
> ---
>  drivers/hwmon/pmbus/Kconfig     |   9 ++++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/xdpe12284.c | 116 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/xdpe12284.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 0dd30b07bf18..128e91de5209 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -228,6 +228,15 @@ config SENSORS_UCD9200
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ucd9200.
>  
> +config SENSORS_XDPE122
> +	tristate "Infineon XDPE122 family"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDPE12254, XDPE12284, device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdpe12284.
> +
>  config SENSORS_ZL6100
>  	tristate "Intersil ZL6100 and compatibles"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 3f8c1014938b..5421fcc0a01c 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -26,4 +26,5 @@ obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
> +obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
> new file mode 100644
> index 000000000000..cb03ce30a527
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdpe12284.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Infineon Multi-phase Digital VR Controllers
> + *
> + * Copyright (c) 2020 Mellanox Technologies. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define XDPE122_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
> +#define XDPE122_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV DAC */
> +#define XDPE122_PROT_IMVP9_10MV		0x03 /* IMVP9 mode, 10-mV DAC */
> +#define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
> +#define XDPE122_PAGE_NUM		2
> +
> +static int xdpe122_identify(struct i2c_client *client,
> +			    struct pmbus_driver_info *info)
> +{
> +	u8 vout_params;
> +	int i, ret;
> +
> +	for (i = 0; i < XDPE122_PAGE_NUM; i++) {
> +		/* Read the register with VOUT scaling value.*/
> +		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
> +		if (ret < 0)
> +			return ret;
> +
> +		vout_params = ret & GENMASK(4, 0);
> +
> +		switch (vout_params) {
> +		case XDPE122_PROT_VR12_5_10MV:
> +			info->vrm_version[i] = vr13;
> +			break;
> +		case XDPE122_PROT_VR12_5MV:
> +			info->vrm_version[i] = vr12;
> +			break;
> +		case XDPE122_PROT_IMVP9_10MV:
> +			info->vrm_version[i] = imvp9;

			break;

> +		case XDPE122_AMD_625MV:
> +			info->vrm_version[i] = amd625mv;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info xdpe122_info = {
> +	.pages = XDPE122_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +	.identify = xdpe122_identify,
> +};
> +
> +static int xdpe122_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kmemdup(&client->dev, &xdpe122_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id xdpe122_id[] = {
> +	{"xdpe12254", 0},
> +	{"xdpe12284", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, xdpe122_id);
> +
> +static const struct of_device_id __maybe_unused xdpe122_of_match[] = {
> +	{.compatible = "infineon, xdpe12254"},
> +	{.compatible = "infineon, xdpe12284"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, xdpe122_of_match);
> +
> +static struct i2c_driver xdpe122_driver = {
> +	.driver = {
> +		.name = "xdpe12284",
> +		.of_match_table = of_match_ptr(xdpe122_of_match),
> +	},
> +	.probe = xdpe122_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = xdpe122_id,
> +};
> +
> +module_i2c_driver(xdpe122_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE122 family");
> +MODULE_LICENSE("GPL");
