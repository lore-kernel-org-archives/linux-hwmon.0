Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD94CC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Apr 2022 18:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244645AbiDYSzB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Apr 2022 14:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244618AbiDYSzB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Apr 2022 14:55:01 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435A7B7C4F
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 11:51:56 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e68392d626so11963905fac.4
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Enp/87zDFdpxEQ0valJWR6Lvvb21I3RUfJM0R6uRnPw=;
        b=j2Sk3YXsuUlraY/NObYhVsNMvkRIjW9vgaCr4BcMFj2dY52jsQdKbseTKtqarhHgLd
         sWaVntcmJvdgmlYfruAVeKhgNw5WSTX0t49jNZ1DMKzhOCr3QAMP6YgxtfRCOUQI4kj2
         //o0AQ/1GIhfy0qwdLdDwT0dtB2RnuG0hyNByr+tvPSlGQvPMBHWp3Oe549zGW4dlVH0
         mMWbeCPW14efRhLTE0tprB+yxNcU/RFuIgnIuhSry4/gX3Yky1H6bFlKr+2mPku8/Qw7
         C3sg6NQFkgd1AqFHQWMRr9trPFLPpc7uq0S3aDCTn3mTVKrM+4IhezDxhpyqMi7lCtnV
         r98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Enp/87zDFdpxEQ0valJWR6Lvvb21I3RUfJM0R6uRnPw=;
        b=YeXVQBXGI5ko0TYzbLQlXW/dBG/DVkI/zuPQIRPiVQuEEH/m7Uo43YrCkfZYHh9UZW
         XPj8QWBYETQ/zrp76lb/jjzO/Wm6e6cwXLxqOMNxf50mi3FZT4d4ipqEQT4OUVCT4dz1
         AU11HKReMbWNoHU7EkoNFQbaDjjXNzsjEe6hfYRMc/PwgtXTQ/zEvcdhsZ7hD8sArZD5
         zjI7PZQxaoyRYkiucNrJc2f2Th+u+W5aRkMPmw6bKryaLWWS6bdZjrcIMqmNHiq55RgO
         twIuIdUt9CbzXV3hdzP6QzhLeRlg+mtbM84ZCFXQkZmDe+QEm8pwFF0lilp7FdoAES3g
         t6Aw==
X-Gm-Message-State: AOAM532LaaIppR++c+pLJk8z7gpdTUNlwc/73H8BfShnNQCpkX18gThZ
        oyaWME/VwuVsuU/n6xWLXjs=
X-Google-Smtp-Source: ABdhPJwJhaRnkMGJZvg2/R6fYIJW/HMBny9jMeLDeeN87j0QrbN0hJCRmwylV4Ujb9mAXa/jvAgLag==
X-Received: by 2002:a05:6870:e307:b0:de:e168:c43f with SMTP id z7-20020a056870e30700b000dee168c43fmr12061265oad.140.1650912715283;
        Mon, 25 Apr 2022 11:51:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x15-20020a056830408f00b006054688cba0sm4056705ott.52.2022.04.25.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 11:51:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 25 Apr 2022 11:51:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg Schwendimann <gschwendimann@gmail.com>
Cc:     linux-hwmon@vger.kernel.org,
        Greg Schwendimann <greg.schwendimann@infineon.com>
Subject: Re: [PATCH v3] hwmon: (pmbus) Add support for Infineon Digital
 Multi-phase xdp152 faimly controllers
Message-ID: <20220425185153.GA4177876@roeck-us.net>
References: <20220425183845.4136866-1-greg.schwendimann@infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425183845.4136866-1-greg.schwendimann@infineon.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 25, 2022 at 02:38:45PM -0400, Greg Schwendimann wrote:
> Add support for devices XDPE152C4, XDPE12584.
> 
> Signed-off-by: Greg Schwendimann <greg.schwendimann@infineon.com>

Checkpatch says:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Greg Schwendimann <gschwendimann@gmail.com>' != 'Signed-off-by: Greg Schwendimann <greg.schwendimann@infineon.com>'

Which one do you want ? The e-mail addresses in From: and in Signed-off-by:
need to match. You could add an additional

From: Greg Schwendimann <greg.schwendimann@infineon.com>

at the beginning of the patch or use the gmail.com address to sign it.

Also (again sorry for not bringing this up earlier), checkpatch says:

WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

so you'll need to split the patch into two parts.

Thanks,
Guenter

> ---
>  Removed the extra spaces from xdpe152c4.rst
>  Signed off on the patch
> 
>  .../devicetree/bindings/trivial-devices.yaml  |   4 +
>  Documentation/hwmon/index.rst                 |   1 +
>  Documentation/hwmon/xdpe152c4.rst             | 118 ++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig                   |   9 ++
>  drivers/hwmon/pmbus/Makefile                  |   1 +
>  drivers/hwmon/pmbus/xdpe152c4.c               |  75 +++++++++++
>  6 files changed, 208 insertions(+)
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
> index 000000000000..ab92c32d4d69
> --- /dev/null
> +++ b/Documentation/hwmon/xdpe152c4.rst
> @@ -0,0 +1,118 @@
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
