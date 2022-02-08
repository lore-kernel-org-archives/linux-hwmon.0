Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49881C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbiBHJMK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Feb 2022 04:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239097AbiBHJMK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Feb 2022 04:12:10 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676BBC03FEC3
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Feb 2022 01:12:08 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h6so10740132wrb.9
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Feb 2022 01:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PJbKv3ScWJ3/TAfgKO6PRsVz/IUNS0H9jBQYHa3CD78=;
        b=MikKXHNC7i8rGs44Asf8Jltk2wDHP5beBwjhNrJRwru1xPj9434goPNBtOm01gMVIK
         nRZtnKT7utsqD8aIkFYbhKrp4NQOyle38PSLs0r2HG3vo1RvzhCJFDIS7GazFXHq6b09
         tnzf6yX8f5EhR0SR+laSdQcmjhJEu+6EsgrmNc0+24LBvmXTUseN45DA/GfPAy1tXq8N
         4KLMlvbltpmOjIcLoy2IcZsWnOEVffib1NqGtaKIBhFI4feR1i+DwmMdBpMquWzL7iL6
         fmmGVGG6R3dWzy3WVCoJl14kCKefoAfykRgUojxb/TfM7gbgoPvjs6Ah3qLYFmX9cyS0
         t/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PJbKv3ScWJ3/TAfgKO6PRsVz/IUNS0H9jBQYHa3CD78=;
        b=CKYO/3Nua1fhlkln/dnKWCUDNiKdGoVhG+TSLXtVYZ1NN+jYTjpM4LJtuPdoxYhN8u
         OinzkoR2nDZc/24RIDFygQyXI6ySFuB2TrkxVnTG1sMJU8NrT754Z+Zcn0db+3n4wD4x
         RnYfBC42RFAt4489Tsp51csNSCFsKr/SEUTbu6zsj/H7NMA9qlEbRKG/a+HRLQPpFbVL
         i/dX+Xf/ChzwB1ScRp9xQbU3s5q6U3O3xXBctp9pHb0/tE4thEL522rCcpHA3FkQLlx1
         +aKAxNqWXwYzsq57p0Qe1wlYZ/H4hS4D22yyL9GlXZezb6lNbPF8oJofOaayxZIbOuyz
         iApw==
X-Gm-Message-State: AOAM531R80Om5ASo/cuF4d/7vb/kOR/ByHeOS3wZckhQOJJoQdnIOaa7
        s3GIjpmZytEAEg1Bvn6Zj0eE93fWNK20zQ==
X-Google-Smtp-Source: ABdhPJxPp5FT1Ln9HKzS0CItdTmHplu9PkCnWQ1NkcWrbT8LwTxXwyvXSrHh1aLxTYM8Z/xM2BydOQ==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr2648769wri.136.1644311526908;
        Tue, 08 Feb 2022 01:12:06 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id 24sm1460362wmf.48.2022.02.08.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:12:06 -0800 (PST)
Date:   Tue, 8 Feb 2022 09:12:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v6 2/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
Message-ID: <YgIz484pt8IJmP85@google.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211224041352.29405-3-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 24 Dec 2021, Quan Nguyen wrote:

> Adds Multi-function devices driver for SMpro co-processor found on the
> Mt.Jade hardware reference platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v6:
>   + Update license part to reflect that this driver is clone from
>   simple-mfd-i2c driver [Quan]
> 
> Changes in v5:
>   + Dropped the use of simple-mfd-i2c driver [Quan]
>   + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
>   sub-devices. This is to avoid DT nodes without resource issue [Quan]
>   + Revised commit message [Quan]
> 
> Changes in v4:
>   + Add "depends on I2C" to fix build issue found by kernel test
>   robot [Guenter]
> 
> Changes in v3:
>   + None
> 
> Changes in v2:
>   + Used 'struct of_device_id's .data attribute [Lee Jones]
> 
>  drivers/mfd/Kconfig     | 12 +++++++
>  drivers/mfd/Makefile    |  1 +
>  drivers/mfd/smpro-mfd.c | 76 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 drivers/mfd/smpro-mfd.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a21cbdf89477..a886da5018b1 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -77,6 +77,18 @@ config MFD_AS3711
>  	help
>  	  Support for the AS3711 PMIC from AMS
>  
> +config MFD_SMPRO
> +	tristate "Ampere Computing MFD SMpro core driver"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to enable SMpro driver support for Ampere's Altra
> +	  processor family.
> +
> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
> +	  be accessed by child devices.
> +
>  config MFD_AS3722
>  	tristate "ams AS3722 Power Management IC"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 4d53e951a92d..fbcd09dce5ce 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -267,6 +267,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
>  
>  obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
>  obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
> +obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
>  obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
>  
>  obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
> diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
> new file mode 100644
> index 000000000000..132d4e2dde12
> --- /dev/null
> +++ b/drivers/mfd/smpro-mfd.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ampere Altra Family SMPro MFD - I2C
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + * Author: Quan Nguyen <quan@os.amperecomputing..com>
> + *
> + * Based on simple-mfd-i2c.c:

Why aren't you just using this?

> + * Copyright (c) by Michael Walle <michael@walle.cc>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/mfd/core.h>
> +#include <linux/regmap.h>
> +
> +/* Identification Registers */
> +#define MANUFACTURER_ID_REG     0x02
> +#define AMPERE_MANUFACTURER_ID  0xCD3A
> +
> +static const struct regmap_config simple_word_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
> +static const struct mfd_cell smpro_devs[] = {
> +	MFD_CELL_NAME("smpro-hwmon"),
> +};

What are the other devices?

> +static int smpro_mfd_probe(struct i2c_client *i2c)
> +{
> +	const struct regmap_config *config;
> +	struct regmap *regmap;
> +	unsigned int val;
> +	int ret;
> +
> +	config = device_get_match_data(&i2c->dev);
> +	if (!config)
> +		config = &simple_word_regmap_config;
> +
> +	regmap = devm_regmap_init_i2c(i2c, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* Check for valid ID */
> +	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != AMPERE_MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				    smpro_devs, ARRAY_SIZE(smpro_devs), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id smpro_mfd_of_match[] = {
> +	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, smpro_mfd_of_match);
> +
> +static struct i2c_driver smpro_mfd_driver = {
> +	.probe_new = smpro_mfd_probe,
> +	.driver = {
> +		.name = "smpro-mfd-i2c",
> +		.of_match_table = smpro_mfd_of_match,
> +	},
> +};
> +module_i2c_driver(smpro_mfd_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("SMPRO MFD - I2C driver");
> +MODULE_LICENSE("GPL v2");

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
