Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E186BC48BE8
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 19:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B93B561261
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 19:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhFRTl2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhFRTl1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 15:41:27 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E25C061574;
        Fri, 18 Jun 2021 12:39:17 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id r16so11748640oiw.3;
        Fri, 18 Jun 2021 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rnpYU2qMk7u4KF21WrsPADdQxmL/CyohwDlT9pyljHo=;
        b=IAhUaIJ/L5Sv/odAzhA++kLUikeWPd/xj3iHaNhk7YR/AUyq1XqD5ACh5/CO1e0ZKB
         Xdh6OonUAOUHa7mz/4pCTIw93l+Ep+PZ5tutyDt9FdeCfsZ5qAqyZZUQR1oQCYnaEZ3e
         k2kFzwzXogBHxOvCBIyDNICW1Hf4IckPqlEoDVNu6HtJDpILpP8WdqJZ8hXyj5o+AgX9
         ANjMlpMeh6G1+C5c99CaYvIpzqw1uNhIZtCn6stZRSLFrdm0jezeHe/tHpxSjNoBX9Oi
         O3APMEwslXPMLndxquZAkvXM8fgMd7XMlEZGit4XH/gnbzq8cjZmpmtMyrcq9UW3km5p
         9B6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=rnpYU2qMk7u4KF21WrsPADdQxmL/CyohwDlT9pyljHo=;
        b=b+okSeemPiR5PyhbQjdfrPT6LpUX5kKCPx65DZODqPSTn9mA1aNTMfC4iK39E01BCQ
         w5tT00X56eGp5QDtzQMasKY1u2XICY9kUUu5ohgG8Pk+4WWu1LpVBkM0hlGB93MdaF/l
         Rdl4UsoNW9ouPtXZi2anlkfHgbpxtgrhpoFjNNjzTXHDEn3RYeYHs+m6G20iCZ6UTekS
         adhLBA1jnxJTZvt6U9WiKBelbGxqWC594nMpvvgvexeepRXt9kLgXXXwFHt8xLNDa4Zp
         tbMcqAb0MU4Z5g2S90QFKnLknXyAqzRCI1RZVveSo5+aCed62Cdp+kiDlr3uHnKhj+5M
         +Jtg==
X-Gm-Message-State: AOAM5332RRjCr/v6JReiwU6CDbSfS735dG/fHbH/3yaf3YPuaYMxS2wQ
        Ud+p0NtJunYGHRbqPOIjKdA=
X-Google-Smtp-Source: ABdhPJwyDozG4pqG87CC9gj6FAtJWxO6Jew91+/Pk4G1my/8AUtzK59tn3yktAcWAXvpzbUR463+gw==
X-Received: by 2002:a05:6808:34a:: with SMTP id j10mr15301749oie.149.1624045156877;
        Fri, 18 Jun 2021 12:39:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c205sm1986754oib.20.2021.06.18.12.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:39:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Jun 2021 12:39:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     ainux.wang@gmail.com
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, sterlingteng@gmail.com,
        chenhuacai@kernel.org, chenhuacai@loongson.cn
Subject: Re: [PATCH v2] hwmon: (pmbus) Add support for MPS MP2949A
Message-ID: <20210618193914.GA1664689@roeck-us.net>
References: <20210618030934.27376-1-ainux.wang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618030934.27376-1-ainux.wang@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 18, 2021 at 11:09:34AM +0800, ainux.wang@gmail.com wrote:
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
>   IMVP9 with only one DAC for each rail to generate REF.
> 
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> ---

Change log goes here. My normal response to patches with missing change log is:

<Formletter>  
Change log goes here. If it is missing, I won't know what changed.
That means I will have to dig out older patch versions to compare.
That costs time and would hold up both this patch as well as all other
patches which I still have to review.

For this reason, I will not review patches without change log.
</Formletter>

so you are lucky that your previous version is recent enough that I remember
at least some of it. However, please do provide change logs in the future.

>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/mp2949a.rst |  44 ++++++++++++
>  drivers/hwmon/pmbus/Kconfig     |   9 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/mp2949a.c   | 119 ++++++++++++++++++++++++++++++++
>  5 files changed, 174 insertions(+)
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
> index 000000000000..ac4084e067f1
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
> +- Supports up to three power rail.

rails

> +- Provides 6 pulse-width modulations (PWMs), and can be configured up

can be configured for ...

> +  to 6-phase operation for Rail A , up to 2-phase operation for Rail B

Rail B,

> +  and up to 1-phase operation for Rail C.
> +- The PMBus registers are distributed into three pages: Page 0, Page 1,
> +  Page 2. Page 0 contains the registers for Rail A and most of the common
> +  settings for all of the rails. Page 1 contains register information for
> +  Rail B. Page 2 contains register information for Rail C.
> +- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
> +  IMVP9 with only one DAC for each rail to generate REF.

Please explain REF.

> +
> +Device supports:
> +
> +- SVID interface.
> +- PMBus rev 1.2 interface.
> +
> +Device supports direct format for reading output power.
> +Device supports linear format for reading input voltage and output current

input voltage, output current, and temperature.

> +and temperature.
> +Device supports VID for reading output voltage.
> +The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.

The following

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
> index 000000000000..d68e8526abe3
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2949a.c
> @@ -0,0 +1,119 @@
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
> +static int mp2949a_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/* This chip do not support the VOUT_MODE command. */

s/do/does/

This warrants a more detailed explanation: What happens if the command
is sent to the chip, and why is it not possible to rely on the standard
response to unsupported commands ? 

> +		return -EINVAL;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int mp2949a_identify(struct i2c_client *client,
> +			    struct pmbus_driver_info *info)
> +{
> +	u8 vout_params;
> +	int i, ret;
> +
> +	for (i = 0; i < MP2949A_PAGE_NUM; i++) {
> +		/* Read the register with VOUT scaling value.*/
> +		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
                                                      ^^^^^^^^^^^^^^^
Should this be MFR_VR_CONFIG ?

> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Rail A bit 5, Rail B bit 4, Rail C bit 3.
> +		 * 1'b1: 5mV  (vr12/imvp8)
> +		 * 1'b0: 10mv (imvp9)
> +		 */
> +		vout_params = ret & ~BIT(5-i);

space before and after '-'. vout_params is really unnecessary; just do
the check directly in the if() statement.

> +		if (vout_params)
> +			info->vrm_version[i] = vr12;
> +		else
> +			info->vrm_version[i] = imvp9;
> +

Unnecessary empty line.

checkpatch --strict reports this and the above problem, plus another
alignment problem. Please fix everything it reports.

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
> +	.read_byte_data = mp2949a_read_byte_data,
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
> -- 
> 2.18.1
> 
