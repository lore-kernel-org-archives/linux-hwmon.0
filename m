Return-Path: <SRS0=z8gB=3A=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533BFC282DD
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Jan 2020 16:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C79C20882
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Jan 2020 16:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyt9z76F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbgAKQpP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Jan 2020 11:45:15 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55066 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbgAKQpP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Jan 2020 11:45:15 -0500
Received: by mail-pj1-f68.google.com with SMTP id kx11so2281156pjb.4;
        Sat, 11 Jan 2020 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AiN3WNLlV4lIqeM/qLV4947giPS6vbU6YXcjKYzOwCI=;
        b=hyt9z76FdorgcLFItzLc5gsqMQB1eaTTCeUgBWJ25HBLjDKv9hlE/Y4E4LwxQNmpZH
         CPHUSbH6h75B+IjP7kGEjuDLz3Nu++ib8LEI2cqsi/X4aAFzKNANiPdvlz8j6C1rGcAO
         9Dn7DskYLjFtMw8WleAxhYiPsWJuBR2ezqzjdyWOI0/NUNHpT461dguAafsQvUlqfQz4
         TF7YN7I9sQ0GoYtCIpjoOV0vRfDAZ32mAp0g52RI8tzkPDbf90wReLAvGDlJbvFw/nve
         NWc0i9aPVMiQCGmLldMNxxirMy82hWoax6eHqqOpT/sQBi4mGtUmujGAmgT2+DYHjF0d
         XIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=AiN3WNLlV4lIqeM/qLV4947giPS6vbU6YXcjKYzOwCI=;
        b=ADizaeTWNGPbWHewo6PlfKTiC43HJEjIncqHIDNA1CxJaIbQBCxMcaXeJ2bdMN4LR6
         8+76vyAWxoK9VNJvhek7pKxRAf9+mPf5ooEgPl6yQq7WF+LzCZlBH+hANaL4SPntS//M
         4pNarhmSfg+DMUCMsQ4EwnxBFBjuFAyW6WmwcPGelQlXw+iV+N7J0doenkGN5JVDTSbI
         2+IIJqZD/jUS8wNAiuHDbFhC8KtORr71/CqX2NmetHVD9BEEHFjsMI620RNKOdhbIv7R
         vWzsuXet+vlgSh9nOHhfmf/O9QG1NBCcH78iGekfZSuTI6P8RgD+sY8aoHr/pbiN8v3v
         CCXw==
X-Gm-Message-State: APjAAAUSXqalJUxlCoUBa7bFXuq02Pq/lXCj3DtMa2TZb2tM44+R4y5U
        BwFYvRTAs6Hq1COmZbdxq083hFH7
X-Google-Smtp-Source: APXvYqxXdR94PvgQM9S+W/zoRVxdryBFx0yRJtgGoB6TC8rRWCWGejHgSkLqRh4yCHYPpMOBZKhUFg==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id x3mr12787652pjv.45.1578761114700;
        Sat, 11 Jan 2020 08:45:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20sm7321877pfe.168.2020.01.11.08.45.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2020 08:45:14 -0800 (PST)
Date:   Sat, 11 Jan 2020 08:45:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH hwmon-next v1 4/5] hwmon: (pmbus) Add support for
 Infineon Multi-phase xdpe122 family controllers
Message-ID: <20200111164512.GA6486@roeck-us.net>
References: <20200108141140.2175-1-vadimp@mellanox.com>
 <20200108141140.2175-5-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108141140.2175-5-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 08, 2020 at 02:11:39PM +0000, Vadim Pasternak wrote:
> Add support for devices XDPE12250, XDPE12254, XDPE12283, XDPE12284,
> XDPE12286.
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
> ---
>  drivers/hwmon/pmbus/Kconfig     |   9 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/xdpe12284.c | 121 ++++++++++++++++++++++++++++++++++++++++

Please also provide Documentation/hwmon/xdpe12284.rst.

That we don't have that for the TI chips is an oversight from my side
and not a reason to skip it here.

Thanks,
Guenter

>  3 files changed, 131 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/xdpe12284.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 0dd30b07bf18..ae6eb02419e6 100644
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
> +	  XDPE12250, XDPE12254, XDPE12283, XDPE12284, XDPE12286 devices.
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
> index 000000000000..91162cfe1be6
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdpe12284.c
> @@ -0,0 +1,121 @@
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
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT,
> +	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT,
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
> +	{"xdpe12250", 0},
> +	{"xdpe12254", 0},
> +	{"xdpe12283", 0},
> +	{"xdpe12284", 0},
> +	{"xdpe12286", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, xdpe122_id);
> +
> +static const struct of_device_id __maybe_unused xdpe122_of_match[] = {
> +	{.compatible = "infineon, xdpe12250"},
> +	{.compatible = "infineon, xdpe12254"},
> +	{.compatible = "infineon, xdpe12283"},
> +	{.compatible = "infineon, xdpe12284"},
> +	{.compatible = "infineon, xdpe12286"},
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
