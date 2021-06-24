Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B86EC49EA6
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Jun 2021 13:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CB2A613C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Jun 2021 13:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhFXNUQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Jun 2021 09:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhFXNUP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Jun 2021 09:20:15 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AB4C061574;
        Thu, 24 Jun 2021 06:17:55 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so5515949oti.2;
        Thu, 24 Jun 2021 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tD+EeAfWxV6YXOYlQGtZWWcd+4sJu+KyyuwzVqngZT4=;
        b=FvkOj73gFYhBn52LPkeruknUtt66srlo7sQpnfJeiCaWYmuWtVLA7Dxt8ZY0e/SiRF
         A8UoYomeIA7o+thrtwEoB/I908OPiDpdXRlUhwTtKxY6vjE94zTVnv15eC/1NkM/qBXS
         ur+LPGWnZUqgO4Nrzb4CcFOY20XpmpJ3dbebXSGunUW/1SsJQ3ihn9LeNWnP4diLO8K5
         xhbFW+iGTOYSDJi5WzRKpwHUyW49dcc29/w2wrq5ei7HzWweAEadslbAZJEbZgjmdU2h
         ocThVY14kHtb6gB7UkINuWPmRXWfZcrhsgckRNRML/JddX3KZxIuJv3Lag+jUDzP1Ukr
         qwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=tD+EeAfWxV6YXOYlQGtZWWcd+4sJu+KyyuwzVqngZT4=;
        b=I+E43ocdrqTh9MCFplP/2G0oL5h+HxntH8efyzonQocV9/csrZjFi3nVmQRh/uZDJg
         b1Ks4wDj38WoNARVF+4c52vzOUczm0SIr1KwUAF/TyvYa4UCRaYUQ7iEa/93nseH+4/w
         jYI0HbJsoiumuJXSca1eDVK+3ObADtKjoPZdZL03DfVY9Ar+3+xASCui3ppgiS0dNeMT
         Vki0yBjUFQc5jXkGGJqQ6hvyctcUdBLetFMd5Jku2amayO9hsRyz+6fY4XKO1rW8rnSO
         uUweRltA2y+ivFS+Ntjx8AXkAk7kLHJKziFCLbVpeE0OK62M/V/7aqIvrG/aClnm69Kr
         Ei1A==
X-Gm-Message-State: AOAM532ctQ3QL59vwVQbAPW16jYf8WzIMWtgbovZQBcgyej9pzBGzOWM
        p88LpQV2TkqR8jYfB7B4ZlY=
X-Google-Smtp-Source: ABdhPJy9dtzkNusSJ4sTe4eYi92miZGMN6tw3Iu6d1jYCoilyNGKKOW+/vWHIGhKmeSu6kUgfQeiaA==
X-Received: by 2002:a05:6830:1da4:: with SMTP id z4mr4697513oti.83.1624540675104;
        Thu, 24 Jun 2021 06:17:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r2sm664577otd.54.2021.06.24.06.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 06:17:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Jun 2021 06:17:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     ainux.wang@gmail.com
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, sterlingteng@gmail.com,
        chenhuacai@kernel.org, chenhuacai@loongson.cn
Subject: Re: [PATCH v5] hwmon: (pmbus) Add support for MPS MP2949A
Message-ID: <20210624131752.GA2788536@roeck-us.net>
References: <20210623005426.15731-1-ainux.wang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623005426.15731-1-ainux.wang@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 23, 2021 at 08:54:26AM +0800, ainux.wang@gmail.com wrote:
> From: "Ainux.Wang" <ainux.wang@gmail.com>
> 
> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
> This is a triple-loop, digital, multi-phase controller.
> This device:
> - Supports up to three power rail.
> - Provides 6 pulse-width modulations (PWMs), and can be configured up
>   to 6-phase operation for Rail A , up to 2-phase operation for Rail B
>   and up to 1-phase operation for Rail C.
> - The PMBus registers are distributed into three pages: Page 0, Page 1,
>   Page 2. Page 0 contains the registers for Rail A and most of the common
>   settings for all of the rails. Page 1 contains register information for
>   Rail B. Page 2 contains register information for Rail C.
> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
>   IMVP9.
> 
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> ---
> v5:
> - Moved change log to right here.
> v4:
> - Removed mp2949a_read_byte_data().

Your other question left me confused. I had previously asked to provide
a rationale for filtering out the PMBUS_VOUT_MODE command, and I had
stated that "the chip does not support it" is not a valid reason. However,
"the chip does not support it but does not report an error when reading
it" _is_ a valid reason. So what happens when the PMBus core reads
PMBUS_VOUT_MODE ? Does the chip return an error, or some random data ?

Thanks,
Guenter

> - Added space before and after '-' and fixed a bug that is '~' on line 35.
> 
> v3:
> - Added change log here.
> - Errors in the document have been modified.
> - Fixed PMBUS_VOUT_MODE to MP2949A_MFR_VR_CONFIG.
> - Removed unnecessary vout_params and empty line.
> 
> v2:
> - Reference has been added to Documentation/hwmon/index.rst.
> - Droped 'vendor'.
> - Removed change codes of the PMBus core and added mp2949a_identify()
>   and mp2949a_read_byte_data() to this driver.
> 
> v1:
> - Add support for MPS MP2949A.
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/mp2949a.rst |  44 ++++++++++++++
>  drivers/hwmon/pmbus/Kconfig     |   9 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/mp2949a.c   | 102 ++++++++++++++++++++++++++++++++
>  5 files changed, 157 insertions(+)
>  create mode 100644 Documentation/hwmon/mp2949a.rst
>  create mode 100644 drivers/hwmon/pmbus/mp2949a.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9ed60fa84cbe..56aac3b1678d 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
>     mcp3021
>     menf21bmc
>     mlxreg-fan
> +   mp2949a
>     mp2975
>     nct6683
>     nct6775
> diff --git a/Documentation/hwmon/mp2949a.rst b/Documentation/hwmon/mp2949a.rst
> new file mode 100644
> index 000000000000..0235dec70f63
> --- /dev/null
> +++ b/Documentation/hwmon/mp2949a.rst
> @@ -0,0 +1,44 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2949a
> +====================
> +
> +Supported chips:
> +
> +  * MPS MP2949A
> +
> +    Prefix: 'mp2949a'
> +
> +Author:
> +
> +	Ainux Wang <ainux.wang@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +triple-loop, digital, multi-phase controller MP2949A.
> +
> +This device:
> +
> +- Supports up to three power rails.
> +- Provides 6 pulse-width modulations (PWMs), and can be configured for
> +  to 6-phase operation for Rail A , up to 2-phase operation for Rail B,
> +  and up to 1-phase operation for Rail C.
> +- The PMBus registers are distributed into three pages: Page 0, Page 1,
> +  Page 2. Page 0 contains the registers for Rail A and most of the common
> +  settings for all of the rails. Page 1 contains register information for
> +  Rail B. Page 2 contains register information for Rail C.
> +- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
> +  IMVP9.
> +
> +Device supports:
> +
> +- SVID interface.
> +- PMBus rev 1.2 interface.
> +
> +Device supports direct format for reading output power.
> +Device supports linear format for reading input voltage, output current,
> +and temperature.
> +Device supports VID for reading output voltage.
> +The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 37a5c39784fa..b1344b265976 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -248,6 +248,15 @@ config SENSORS_MAX8688
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max8688.
>  
> +config SENSORS_MP2949A
> +	tristate "MPS MP2949A"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MP2949A Triple Loop Digital Multi-Phase Controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp2949a.
> +
>  config SENSORS_MP2975
>  	tristate "MPS MP2975"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index f8dcc27cd56a..bfb55ab12da1 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_MP2949A)	+= mp2949a.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
> diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949a.c
> new file mode 100644
> index 000000000000..d1f36c008e58
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2949a.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Monolithic Power Systems MP2949A
> + *
> + * Copyright (c) 2021 Lemote Technologies. All rights reserved.
> + * Copyright (c) 2021 Ainux <ainux.wang@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define MP2949A_PAGE_NUM		3
> +
> +#define MP2949A_MFR_VR_CONFIG	0xE4
> +
> +static int mp2949a_identify(struct i2c_client *client,
> +			    struct pmbus_driver_info *info)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < MP2949A_PAGE_NUM; i++) {
> +		ret = pmbus_read_byte_data(client, i, MP2949A_MFR_VR_CONFIG);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Rail A bit 5, Rail B bit 4, Rail C bit 3.
> +		 * 1'b1: 5mV  (vr12/imvp8)
> +		 * 1'b0: 10mv (imvp9)
> +		 */
> +		info->vrm_version[i] = (ret & BIT(5 - i)) ? vr12 : imvp9;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info mp2949a_info = {
> +	.pages = MP2949A_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = 0,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT,
> +	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_POUT,
> +	.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_POUT,
> +	.identify = mp2949a_identify,
> +};
> +
> +static int mp2949a_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kmemdup(&client->dev, &mp2949a_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id mp2949a_id[] = {
> +	{"mp2949a", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mp2949a_id);
> +
> +static const struct of_device_id mp2949a_of_match[] = {
> +	{.compatible = "mps,mp2949a"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp2949a_of_match);
> +
> +static struct i2c_driver mp2949a_driver = {
> +	.driver = {
> +		.name = "mp2949a",
> +		.of_match_table = of_match_ptr(mp2949a_of_match),
> +	},
> +	.probe = mp2949a_probe,
> +	.id_table = mp2949a_id,
> +};
> +
> +module_i2c_driver(mp2949a_driver);
> +
> +MODULE_AUTHOR("Ainux <ainux.wang@gmail.com>");
> +MODULE_DESCRIPTION("PMBus driver for Monolithic Power Systems MP2949A");
> +MODULE_LICENSE("GPL");
