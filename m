Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4139C11F68
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 14:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A04E613C3
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 14:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhGBPCW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jul 2021 11:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhGBPCV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jul 2021 11:02:21 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1849C061762;
        Fri,  2 Jul 2021 07:59:48 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id x62-20020a4a41410000b029024fb8f731dfso1959541ooa.12;
        Fri, 02 Jul 2021 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MVEsMx8dGu88KSHBeKvG3JheuUIajvKeQVTs1ZMeOh0=;
        b=tiC48MkxsS+84Hr63krn0DI2eTG54MtLwwMRFlLy0pYIcS12vOC+gXjcKPag1HjsRG
         n//a8Dm7jdlhA6ecGgzQAOJtQJJytWeXQjh5V46IVL6E3PuGDqW8ZQYizhEo6YNI4Mm2
         zivZSQYeHc/G3J5C3zPXbCjg4FuYW0L2OAib+y8FhgGdjqoJ0RgU6tlrQXfBJ96X5EYn
         bOr7d4eBSdYcON38D5i26pHIMbgGzSEux5uzs74YOfUz4GCD6ilFG/mbstl+chNEMqKW
         rkPz0iR4aLtD5h7SPtzkOUv1v6z5N0DElToAB2VulbaA6hxZFUzwbwZKA1WWBcydFq1G
         qIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MVEsMx8dGu88KSHBeKvG3JheuUIajvKeQVTs1ZMeOh0=;
        b=nQ5xBCqsCIaKSTV29PuhLldQFyOJMvV32XNqfGwAVF/lcEpXhXWtsPfgLjxb2/zGCo
         V7yhgZJYLTV/HGzfqDCCbG9GtaXMH7GnXMJBmk1mwZu8lT29vaX2Gf/RkSrOiUTs6r38
         If4Wq0VJ6tgCpozHgbY0L2QcjRHbOdUfo6G/pM11aZKgKKOv/yY+5cmX8nrgdimiFyIi
         iUGg0/AwNzentWOusK+Rrq+85EgIWjFleTl9KJmGk4qsLIgowuOtBCl62eCyePwmroLy
         I/4+rmx8MuM38Vh5HV4J0Tar/okR6OZmiZ8IO3z4mClG+nLw7wmVaPU3RZAk4nlegw9u
         CnRw==
X-Gm-Message-State: AOAM531XAG8rZqdXmRaTlMjwDWMOnwGNVjKm4tapg1VTpHNxY+Xz9511
        eQW9EC0BA3LFYlLbt+3ISlU=
X-Google-Smtp-Source: ABdhPJySo41FIu8xHsybd9cLBwr4Cp4/DyQNbezocAfb5s/7xSt7q/qY1svCJGIqDMmiweBDIm4rvA==
X-Received: by 2002:a4a:b917:: with SMTP id x23mr108431ooo.58.1625237988195;
        Fri, 02 Jul 2021 07:59:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l7sm620395otu.76.2021.07.02.07.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 07:59:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     ainux.wang@gmail.com, jdelvare@suse.com, corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
References: <20210702073142.15166-1-ainux.wang@gmail.com>
 <20210702073142.15166-2-ainux.wang@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6 1/2] hwmon: (pmbus) Add support for MPS MP2949A
Message-ID: <779bec56-6f95-1dbd-8025-fd6e4a15f65e@roeck-us.net>
Date:   Fri, 2 Jul 2021 07:59:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702073142.15166-2-ainux.wang@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/2/21 12:31 AM, ainux.wang@gmail.com wrote:
> From: "Ainux.Wang" <ainux.wang@gmail.com>
> 
> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
> This is a triple-loop, digital, multi-phase controller.
> This device:
> - Supports up to three power rail.
> - Provides 6 pulse-width modulations (PWMs), and can be configured up
>    to 6-phase operation for Rail A , up to 2-phase operation for Rail B
>    and up to 1-phase operation for Rail C.
> - The PMBus registers are distributed into three pages: Page 0, Page 1,
>    Page 2. Page 0 contains the registers for Rail A and most of the common
>    settings for all of the rails. Page 1 contains register information for
>    Rail B. Page 2 contains register information for Rail C.
> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
>    IMVP9.
> 
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> ---
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/mp2949a.rst |  44 +++++++++++
>   drivers/hwmon/pmbus/Kconfig     |   9 +++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/mp2949a.c   | 136 ++++++++++++++++++++++++++++++++
>   5 files changed, 191 insertions(+)
>   create mode 100644 Documentation/hwmon/mp2949a.rst
>   create mode 100644 drivers/hwmon/pmbus/mp2949a.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index bc01601ea81a..e62161c0f01e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -138,6 +138,7 @@ Hardware Monitoring Kernel Drivers
>      mcp3021
>      menf21bmc
>      mlxreg-fan
> +   mp2949a
>      mp2888
>      mp2975
>      nct6683
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
> +- Supports up to three power rail.
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
> index ffb609cee3a4..d3a521bead3e 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -258,6 +258,15 @@ config SENSORS_MAX8688
>   	  This driver can also be built as a module. If so, the module will
>   	  be called max8688.
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
>   config SENSORS_MP2888
>   	tristate "MPS MP2888"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 0ed4d596a948..bfdfb599c8ba 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>   obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>   obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>   obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_MP2949A)	+= mp2949a.o
>   obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>   obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
> diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949a.c
> new file mode 100644
> index 000000000000..8f8dd3235298
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2949a.c
> @@ -0,0 +1,136 @@
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
> +static int mp2949a_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	switch (reg) {
> +	/*
> +	 * This chip do not support the VOUT_MODE, STATUS_BYTE command,
> +	 * but return some random data when reading.
> +	 */
> +	case PMBUS_VOUT_MODE:
> +	case PMBUS_STATUS_BYTE:
> +		return -ENXIO;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int mp2949a_read_word_data(struct i2c_client *client, int page,
> +				 int phase, int reg)
> +{
> +
> +	switch (reg) {
> +	/*
> +	 * This chip do not support STATUS_WORD command,
> +	 * but return some random data when reading.
> +	 */
> +	case PMBUS_STATUS_WORD:
> +		return -ENXIO;

One of the status registers should be simulated. See other patch
for details.

> +	default:
> +		return -ENODATA;
> +	}
> +}
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
> +	.read_byte_data = mp2949a_read_byte_data,
> +	.read_word_data = mp2949a_read_word_data,
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
> +MODULE_IMPORT_NS(PMBUS);
> 

