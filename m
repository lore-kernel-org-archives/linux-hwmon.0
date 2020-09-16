Return-Path: <SRS0=k+/s=CZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A44C43461
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Sep 2020 03:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02ABA2076C
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Sep 2020 03:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4aF3oaB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgIPDBV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Sep 2020 23:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgIPDBU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Sep 2020 23:01:20 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E377C06174A
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2020 20:01:20 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id t76so6404617oif.7
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2020 20:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S3SQtwKhjYSUPUAEjBSDkU/T9pOG9H3QuczxbMdxwhM=;
        b=p4aF3oaBAEzsKmyKSNe3dLoz82O2Veyp5o4h1QnDn7EzsotQMNEVFpITAn0jssqV0F
         WUtiMh/Xa2qH1eZlpzK6M8cIJxino+yvwdGSkLBn9GbaE2ce4RqSkjOYiwb7SHfD9lFl
         4W2qDo1JgetXxe2broW0yNpYAHm1+TyvjZRE4n0XRvA3pbAzKR+tle8Qv8UF0HI7U8mE
         6hx2AoXgRDj1VUZ5najtKl9d91ImMviivGwsfk0Wpa2vMATU+yaKngDje2cPzcV/7E+N
         XJ4eWguj5mCP34NfpL8JBUv4SmyzEFJMeDWyPgSOyDxogKDwtd6hcGqdXPqzeRuBdDQF
         k0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=S3SQtwKhjYSUPUAEjBSDkU/T9pOG9H3QuczxbMdxwhM=;
        b=g8G1aHOK08u3J04kofu3w7DReEoyk/XOPOyyEjq2oaZY1zfQ0ME8RTJJjqBnwzA3eU
         HA3w4BXzYbVfFUP4nCDHLZUnlmmFm6iANczHYhqZahV8f8wE/HuK5yXAUeIPBFFLZqQ0
         WCdaRMqg4PR42ctznQFTP5dX7DbmNLRduZJFC0Hwiczse9P0Dn2769Exd2X0wZfNBcWn
         LD9tbHxdpIeS+knwAKtYt8Dhe7Qq5M8SAFhm3uq0qtqhaWrAOcsBvkTuy9kHiR4F9OVM
         djhKTKTszaSkxzSnFTihZ5WD6SohwqA72Xmhg3HZc1Q0t7yqINz3JWqhed4r1CepfwQH
         XTDA==
X-Gm-Message-State: AOAM532ShdtQQw/k7u693O0jpqOgy7REJ77CCtsgloy9/n34YvWQAvmc
        rI5CJqNYW6GfUvcd4BdYnYQ=
X-Google-Smtp-Source: ABdhPJzNjnYaGu76x33qOKf1s8x8e6loxYYBiPV1AH9cIOdMgaaiKeJhNcKM+UZBQ/Gmp24xrdw7UA==
X-Received: by 2002:a05:6808:557:: with SMTP id i23mr1648450oig.80.1600225279530;
        Tue, 15 Sep 2020 20:01:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 92sm7322138ota.38.2020.09.15.20.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 20:01:19 -0700 (PDT)
Subject: Re: [PATCH] [PATCH] drivers/hwmon/pmbus/delta.c: Add drivers to
 Delta's modules
To:     "xiao.mx.ma" <734056705@qq.com>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@bger.kernel.org,
        xiao.mx.ma@deltaww.com, jiajia.feng@deltaww.com
References: <tencent_B5A4994B379FFE817637FA04BA2EA24BA405@qq.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4a887ee1-27e8-f638-c994-23f602bbf54e@roeck-us.net>
Date:   Tue, 15 Sep 2020 20:01:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <tencent_B5A4994B379FFE817637FA04BA2EA24BA405@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The subject should be something like

[PATCH] hwmon: Driver for Delta power supplies

On 9/15/20 6:28 PM, xiao.mx.ma wrote:
> The <drivers/hwmon/pmbus/delta.c> provides drivers for Delta's modules.
> Currently supports Q54SJ108A2 series and other series will continue to
> be added in the future.

Empty line missing here.

> Signed-off-by: xiao.mx.ma <734056705@qq.com>

Please drop the excessive empty lines and resubmit. Also see other comments
in the code.

If you don't know how to format the file, I would suggest to use
scripts/Lindent as starting point. That still leaves way too many
empty lines, though. Please look into other files for examples,
and run checkpatch --strict.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/Kconfig  |   8 ++
>  drivers/hwmon/pmbus/Makefile |   1 +
>  drivers/hwmon/pmbus/delta.c  | 234 +++++++++++++++++++++++++++++++++++

Documentation/hwmon/delta.rst missing

>  3 files changed, 243 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/delta.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index e35db489b76f..a9468be10d7e 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -45,6 +45,14 @@ config SENSORS_BEL_PFE
>  	  This driver can also be built as a module. If so, the module will
>  	  be called bel-pfe.
>  
> +config SENSORS_DELTA
> +	tristate "DELTA"

Might be better to have a bit more text here. "Delta power suplies", maybe.

> +	help
> +	  If you say yes here you get hardware monitoring support for Delta Power Supplies.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called delta.
> +
>  config SENSORS_IBM_CFFPS
>  	tristate "IBM Common Form Factor Power Supply"
>  	depends on LEDS_CLASS
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index c4b15db996ad..8957f5337002 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_PMBUS)		+= pmbus_core.o
>  obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>  obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>  obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
> +obj-$(CONFIG_SENSORS_DELTA)	+= delta.o
>  obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>  obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
>  obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
> diff --git a/drivers/hwmon/pmbus/delta.c b/drivers/hwmon/pmbus/delta.c
> new file mode 100644
> index 000000000000..090429881c45
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/delta.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/*
> + * Driver for Q54SJ108A2, Q50SN12050, and Q50SN12072 Integrated, Step-Down
> + * Switching Regulators

This does not match the code.

> + *
> + * Copyright 2020 Delta LLC.
> + */
> +
> +
> +#include <linux/bits.h>
> +
> +#include <linux/err.h>
> +
> +#include <linux/i2c.h>
> +
> +#include <linux/init.h>
> +
> +#include <linux/kernel.h>
> +
> +#include <linux/module.h>
> +
> +#include <linux/mutex.h>
> +
> +#include <linux/of_device.h>
> +
> +#include <linux/pmbus.h>
> +
> +#include <linux/util_macros.h>
> +
> +#include "pmbus.h"
> +
> +enum chips {
> +
> +	Q54SJ108A2
> +};
> +
> +static const struct pmbus_driver_info delta_info[] = {
> +
> +[Q54SJ108A2] = {
> +
> +.pages = 1,
> +
> +/* Source : Delta Q54SJ108A2 */
> +
> +.format[PSC_TEMPERATURE] = linear,
> +
> +.format[PSC_VOLTAGE_IN] = linear,
> +
> +.format[PSC_CURRENT_OUT] = linear,
> +
> +
> +.func[0] = PMBUS_HAVE_VIN |
> +
> +PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +
> +PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +
> +PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +
> +PMBUS_HAVE_STATUS_INPUT,

Indentation missing.

> +
> +},
> +
> +};
> +
> +
> +
> +static int delta_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +
> +	struct device *dev = &client->dev;
> +
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +
> +	struct pmbus_driver_info *info;
> +
> +	enum chips chip_id;
> +
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +
> +		I2C_FUNC_SMBUS_BYTE_DATA |
> +
> +		I2C_FUNC_SMBUS_WORD_DATA |
> +
> +		I2C_FUNC_SMBUS_BLOCK_DATA))
> +
> +		return -ENODEV;
> +
> +	if (client->dev.of_node)
> +
> +		chip_id = (enum chips)of_device_get_match_data(dev);
> +
> +	else
> +
> +		chip_id = id->driver_data;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +
> +	if (ret < 0) {
> +
> +		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
> +
> +		return ret;
> +
> +	}
> +
> +	if (ret != 5 || strncmp((buf), "DELTA", 5)) {

Unnecessary ( ) around buf

> +
> +		buf[ret] = '\0';
> +
> +		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
> +
> +		return -ENODEV;
> +
> +	}
> +
> +/*
> + * The chips support reading PMBUS_MFR_MODEL.
> + */
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +
> +	if (ret < 0) {
> +
> +		dev_err(dev, "Failed to read Manufacturer Model\n");
> +
> +		return ret;
> +
> +	}
> +
> +	if (ret != 14 || strncmp((buf), "Q54SJ108A2", 10)) {

Unnecessary ( ) around buf

> +
> +		buf[ret] = '\0';
> +
> +		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
> +
> +		return -ENODEV;
> +
> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
> +
> +	if (ret < 0) {
> +
> +		dev_err(dev, "Failed to read Manufacturer Revision\n");
> +
> +		return ret;
> +
> +	}
> +
> +	if (ret != 4 || buf[0] != 'S') {
> +
> +		buf[ret] = '\0';
> +
> +		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
> +
> +		return -ENODEV;
> +
> +	}
> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +
> +	if (!info)
> +
> +		return -ENOMEM;
> +
> +	memcpy(info, &delta_info[chip_id], sizeof(*info));

"info" isn't modified, so there should be no need to copy it.

> +
> +	return pmbus_do_probe(client, id, info);
> +
> +}
> +
> +
> +
> +static const struct i2c_device_id delta_id[] = {
> +
> +{ "Q54SJ108A2", Q54SJ108A2 },
> +
> +{ },
> +

Indentation missing.

> +};
> +
> +
> +
> +MODULE_DEVICE_TABLE(i2c, delta_id);
> +
> +
> +
> +static const struct of_device_id delta_of_match[] = {
> +
> +{ .compatible = "delta,Q54SJ108A2", .data = (void *)Q54SJ108A2 },
> +
> +{ },
> +
Indentation missing

> +};
> +
> +
> +
> +MODULE_DEVICE_TABLE(of, delta_of_match);
> +
> +
> +
> +static struct i2c_driver delta_driver = {
> +
> +.driver = {
> +
> +.name = "Q54SJ108A2",
> +
> +.of_match_table = delta_of_match,
> +
> +},
> +
> +.probe = delta_probe,
> +
> +.remove = pmbus_do_remove,
> +
> +.id_table = delta_id,
> +
Indentation missing

> +};
> +
> +
> +
> +module_i2c_driver(delta_driver);
> +
> +
> +
> +MODULE_AUTHOR("Delta <734056705@qq.com>");
> +
> +MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2NCAH / Q54SJ108A2NCDH / Q54SJ108A2NCPG / Q54SJ108A2NCPH");

Does not match code.

> +
> +MODULE_LICENSE("GPL");
> 

