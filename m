Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A91C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Apr 2022 15:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237740AbiDYPtf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Apr 2022 11:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236180AbiDYPte (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Apr 2022 11:49:34 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E08E113C8A
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 08:46:30 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id r8so17553786oib.5
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eGCjlVPTT+5ELKKSFO9pwAm6PHjSmX+fmnwQaSirL6Y=;
        b=prZzz0wIOaz62WZcc+cbQEp1/VbYd9eP5U/zw4GgOT7I3QVP87tlJivr0JCKUATKW0
         1/tzEumPw9FxuSIjdaUpJAys9uRyLpiPDrhQrXQjDBd6SvPU/dm4b13dsVUQkdmqoSOp
         48seTrHexmdThEpOcuymOUtP/a1PODKX/IXeBlZRdvVvPvEG5ijUpwk/TkeQrAf7C+9G
         hOzoE5MBRUPB0DHFShiJnFHQhGTMVcRq24fCWVeiTilbFYueCNRmCeLhftWzrbbeOV+e
         8Z4cLJpFOKVHuj5yS9WfOIXcvglPlIuorFWr8XBcd2VQ55LsZZPDMXwB5Xzi9YjNr5Qu
         Mk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=eGCjlVPTT+5ELKKSFO9pwAm6PHjSmX+fmnwQaSirL6Y=;
        b=BHApme6hfPwmnAkLqaPBwu6jSW9GT1+aPf8knHQ+59X5Ch/JXs+BHxkVr7MMUoDvBR
         k5SyKTYaBH7u/1OpttFqhoLI+qsEcDb3oYx87v50Zarn3oB56SQQ2aPtLdXttkZhtuO0
         oy9CXH9sWSJyDjGmQhE3i5GT4E0ltg7djKNlqS8flvO00TdS4/jWv0a5SYuIrxgrz18i
         g6hgN+STxIVgwktVmyu2jP25Zx1lcjUKhMqT4fHqRT+OKmtpLbc8dLLNREOsc1mrXVv/
         1fkl273xjSvdpDm8POxABDcRnWfu8L2FA3t5UIHL1xCwDx6JiDDNzTvFG/IQ9Hi3HdQH
         re1A==
X-Gm-Message-State: AOAM533B6z/mWcklKTQ99ox6GyeSlSwx60ZWGp1JrE5fcxf2l4hVFahW
        30GZVrsCe7uvm0E4PyUcq18=
X-Google-Smtp-Source: ABdhPJx6JN/HbE2bAhTt+HtbibJVa2906yd0bxg8DDDpLKtUS6b8PJb7LB2vkF5A2MbmUlmsaqhf4A==
X-Received: by 2002:a05:6808:178d:b0:322:931a:f88e with SMTP id bg13-20020a056808178d00b00322931af88emr13202684oib.173.1650901589671;
        Mon, 25 Apr 2022 08:46:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0105000000b005fbe5093eb0sm3940112otu.54.2022.04.25.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 08:46:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 25 Apr 2022 08:46:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg Schwendimann <gschwendimann@gmail.com>
Cc:     linux-hwmon@vger.kernel.org,
        Greg Schwendimann <greg.schwendimann@infineon.com>
Subject: Re: [PATCH v2] hwmon: (pmbus) Add support for Infineon Digital
 Multi-phase xdp152 faimly controllers
Message-ID: <20220425154627.GA4168007@roeck-us.net>
References: <20220425140323.4135087-1-greg.schwendimann@infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425140323.4135087-1-greg.schwendimann@infineon.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Greg,

On Mon, Apr 25, 2022 at 10:03:23AM -0400, Greg Schwendimann wrote:
> Add support for devices XDPE152C4 and XDPE15284
> ---

Unfortunately you did not sign your patch. Sorry, I didn't realize this
before, but your patch needs to be signed for me to apply it.

Also, git complains that the documentation file has a couple of spaces
at the end of lines, and that there is an empty line at the end.

Please fix and resubmit. Also, please include change logs when you
send new patch revisions.

Thanks,
Guenter

>  .../devicetree/bindings/trivial-devices.yaml  |   4 +
>  Documentation/hwmon/index.rst                 |   1 +
>  Documentation/hwmon/xdpe152c4.rst             | 119 ++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig                   |   9 ++
>  drivers/hwmon/pmbus/Makefile                  |   1 +
>  drivers/hwmon/pmbus/xdpe152c4.c               |  75 +++++++++++
>  6 files changed, 209 insertions(+)
>  create mode 100644 Documentation/hwmon/xdpe152c4.rst
>  create mode 100644 drivers/hwmon/pmbus/xdpe152c4.c
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 550a2e5c9e05..fc2164c4d108 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -143,6 +143,10 @@ properties:
>            - infineon,xdpe12254
>              # Infineon Multi-phase Digital VR Controller xdpe12284
>            - infineon,xdpe12284
> +            # Infineon Multi-phase Digital VR Controller xdpe152c4
> +          - infineon,xdpe152c4
> +            # Infineon Multi-phase Digital VR Controller xdpe15284
> +          - infineon,xdpe15284
>              # Injoinic IP5108 2.0A Power Bank IC with I2C
>            - injoinic,ip5108
>              # Injoinic IP5109 2.1A Power Bank IC with I2C
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 863b76289159..355c682f9ec4 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -223,6 +223,7 @@ Hardware Monitoring Kernel Drivers
>     wm8350
>     xgene-hwmon
>     xdpe12284
> +   xdpe152c4
>     zl6100
>  
>  .. only::  subproject and html
> diff --git a/Documentation/hwmon/xdpe152c4.rst b/Documentation/hwmon/xdpe152c4.rst
> new file mode 100644
> index 000000000000..ff2db72cae50
> --- /dev/null
> +++ b/Documentation/hwmon/xdpe152c4.rst
> @@ -0,0 +1,119 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver xdpe152
> +=====================
> +
> +Supported chips:
> +
> +  * Infineon XDPE152C4
> +
> +    Prefix: 'xdpe152c4'
> +
> +  * Infineon XDPE15284
> +
> +    Prefix: 'xdpe15284'
> +
> +Authors:
> +
> +    Greg Schwendimann <greg.schwendimann@infineon.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Infineon Digital Multi-phase Controller 
> +XDPE152C4 and XDPE15284 dual loop voltage regulators.
> +The devices are compliant with:
> +
> +- Intel VR13, VR13HC and VR14 rev 1.86
> +  converter specification.
> +- Intel SVID rev 1.93. protocol.
> +- PMBus rev 1.3.1 interface.
> +
> +Devices support linear format for reading input and output voltage, input 
> +and output current, input and output power and temperature.
> +
> +Devices support two pages for telemetry.
> +
> +The driver provides for current: input, maximum and critical thresholds
> +and maximum and critical alarms. Low Critical thresholds and Low critical alarm are
> +supported only for current output.
> +The driver exports the following attributes for via the sysfs files, where
> +indexes 1, 2 are for "iin" and 3, 4 for "iout":
> +
> +**curr[1-4]_crit**
> +
> +**curr[1-4]_crit_alarm**
> +
> +**curr[1-4]_input**
> +
> +**curr[1-4]_label**
> +
> +**curr[1-4]_max**
> +
> +**curr[1-4]_max_alarm**
> +
> +**curr[3-4]_lcrit**
> +
> +**curr[3-4]_lcrit_alarm**
> +
> +**curr[3-4]_rated_max**
> +
> +The driver provides for voltage: input, critical and low critical thresholds
> +and critical and low critical alarms.
> +The driver exports the following attributes for via the sysfs files, where
> +indexes 1, 2 are for "vin" and 3, 4 for "vout":
> +
> +**in[1-4]_min**
> +
> +**in[1-4]_crit**
> +
> +**in[1-4_crit_alarm**
> +
> +**in[1-4]_input**
> +
> +**in[1-4]_label**
> +
> +**in[1-4]_max**
> +
> +**in[1-4]_max_alarm**
> +
> +**in[1-4]_min**
> +
> +**in[1-4]_min_alarm**
> +
> +**in[3-4]_lcrit**
> +
> +**in[3-4]_lcrit_alarm**
> +
> +**in[3-4]_rated_max**
> +
> +**in[3-4]_rated_min**
> +
> +The driver provides for power: input and alarms.
> +The driver exports the following attributes for via the sysfs files, where
> +indexes 1, 2 are for "pin" and 3, 4 for "pout":
> +
> +**power[1-2]_alarm**
> +
> +**power[1-4]_input**
> +
> +**power[1-4]_label**
> +
> +**power[1-4]_max**
> +
> +**power[1-4]_rated_max**
> +
> +The driver provides for temperature: input, maximum and critical thresholds
> +and maximum and critical alarms.
> +The driver exports the following attributes for via the sysfs files:
> +
> +**temp[1-2]_crit**
> +
> +**temp[1-2]_crit_alarm**
> +
> +**temp[1-2]_input**
> +
> +**temp[1-2]_max**
> +
> +**temp[1-2]_max_alarm**
> +
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a2ea1d5a8765..fe0d0e44da4f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -408,6 +408,15 @@ config SENSORS_UCD9200
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ucd9200.
>  
> +config SENSORS_XDPE152
> +	tristate "Infineon XDPE152 family"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDPE15284, XDPE152C4, device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdpe152c4.
> +
>  config SENSORS_XDPE122
>  	tristate "Infineon XDPE122 family"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index a4a96ac71de7..4678fba5012c 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -43,5 +43,6 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>  obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
> +obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
>  obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
> diff --git a/drivers/hwmon/pmbus/xdpe152c4.c b/drivers/hwmon/pmbus/xdpe152c4.c
> new file mode 100644
> index 000000000000..b8a36ef73e45
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdpe152c4.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Infineon Multi-phase Digital VR Controllers
> + *
> + * Copyright (c) 2022 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define XDPE152_PAGE_NUM 2
> +
> +static struct pmbus_driver_info xdpe152_info = {
> +	.pages = XDPE152_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS_TEMP |
> +		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +};
> +
> +static int xdpe152_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kmemdup(&client->dev, &xdpe152_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id xdpe152_id[] = {
> +	{"xdpe152c4", 0},
> +	{"xdpe15284", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, xdpe152_id);
> +
> +static const struct of_device_id __maybe_unused xdpe152_of_match[] = {
> +	{.compatible = "infineon,xdpe152c4"},
> +	{.compatible = "infineon,xdpe15284"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, xdpe152_of_match);
> +
> +static struct i2c_driver xdpe152_driver = {
> +	.driver = {
> +		.name = "xdpe152c4",
> +		.of_match_table = of_match_ptr(xdpe152_of_match),
> +	},
> +	.probe_new = xdpe152_probe,
> +	.id_table = xdpe152_id,
> +};
> +
> +module_i2c_driver(xdpe152_driver);
> +
> +MODULE_AUTHOR("Greg Schwendimann <greg.schwendimann@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDPE152 family");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);
