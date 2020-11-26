Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13F2C56201
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 01:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3404620B1F
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 01:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="i5PBsdhH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbgKZBjG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 20:39:06 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:38545 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731060AbgKZBjG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 20:39:06 -0500
Received: from CMGW (unknown [10.9.0.13])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id E01B5140743
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2020 18:39:04 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id i6FUkp6Qsi1lMi6FUknzW1; Wed, 25 Nov 2020 18:39:04 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.2 cv=CoPPSjwD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=evQFzbml-YQA:10 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=64J-flk6gbOkI1un91IA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Vgd8UP9Xtpzz9pNeI40scUxQsv3ndEwlgg0D4uubbcg=; b=i5PBsdhHTJ5jj5Q3XiiRGuBMvg
        J7Bykrf/jvB4SMWA14bcVcIevaT2OpFbTRKWsDmvZINAzwo5ntupk4YOXDQRBHNTT6QlH2TibMRZx
        lkXu+YbwYkAhtFb/wcP6Y/A/jXTmn9Rx4EWmlzcJ75w/DpHX4n/85BxdcgBIrlwB+KQAzkZ1h7pBj
        SZDv2igTGdSsIZmPLPpg/K6S4ellZduwuE40pF4tVhsCb78F30kBcgXtagTznvIRaMmpjinTYo2Ck
        xfGolCCnvCsBTyOY+ojUzpbuAzy9Bz+C22mAzDif5fPZhNGDerIMKJ8mU4iE6aTF/k25/6hBjhU0e
        dbEa7xyA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36376 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1ki6FT-002acJ-Ua; Thu, 26 Nov 2020 01:39:04 +0000
Date:   Wed, 25 Nov 2020 17:39:03 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles <hsu.yungteng@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        alan@redhat.com
Subject: Re: [PATCH v4] hwmon: Add driver for STMicroelectronics PM6764
 Voltage Regulator
Message-ID: <20201126013903.GB111386@roeck-us.net>
References: <859f2714-cedc-0342-4d10-789abd8d2c52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <859f2714-cedc-0342-4d10-789abd8d2c52@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1ki6FT-002acJ-Ua
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:36376
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 19, 2020 at 07:43:41PM +0800, Charles wrote:
> Add the pmbus driver for the STMicroelectronics pm6764 voltage regulator.
> 
> the output voltage use the MFR_READ_VOUT 0xD4
> vout value returned is linear11
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---
> 
> v4:
>  - Add pm6764tr to Documentation/hwmon/index.rst.
> v3:
>  - Add Documentation(Documentation/hwmon/pm6764tr.rst).
>  - Fix include order.
> v2:
>  - Fix formatting.
>  - Remove pmbus_do_remove.
>  - Change from .probe to .probe_new.
> v1:
>  - Initial patchset.
> ---
> 
>  Documentation/hwmon/index.rst    |  1 +
>  Documentation/hwmon/pm6764tr.rst | 33 ++++++++++++++
>  drivers/hwmon/pmbus/Kconfig      |  9 ++++
>  drivers/hwmon/pmbus/Makefile     |  1 +
>  drivers/hwmon/pmbus/pm6764tr.c   | 78 ++++++++++++++++++++++++++++++++
>  5 files changed, 122 insertions(+)
>  create mode 100644 Documentation/hwmon/pm6764tr.rst
>  create mode 100644 drivers/hwmon/pmbus/pm6764tr.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b797db738225..1bbd05e41de4 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -144,6 +144,7 @@ Hardware Monitoring Kernel Drivers
>     pc87360
>     pc87427
>     pcf8591
> +   pm6764tr
>     pmbus
>     powr1220
>     pxe1610
> diff --git a/Documentation/hwmon/pm6764tr.rst
> b/Documentation/hwmon/pm6764tr.rst
> new file mode 100644
> index 000000000000..5e8092e39297
> --- /dev/null
> +++ b/Documentation/hwmon/pm6764tr.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver pm6764tr
> +======================
> +
> +Supported chips:
> +
> +  * ST PM6764TR
> +
> +    Prefix: 'pm6764tr'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: http://www.st.com/resource/en/data_brief/pm6764.pdf
> +
> +Authors:
> + <hsu.yungteng@gmail.com>
> +
> +Description:
> +------------
> +
> +This driver supports the STMicroelectronics PM6764TR chip. The PM6764TR is
> a high
> +performance digital controller designed to power Intel’s VR12.5 processors
> and memories.

This patch is corrupted (line wraps) and thus does not apply.

> +
> +The device utilizes digital technology to implement all control and power
> management
> +functions to provide maximum flexibility and performance. The NVM is
> embedded to store
> +custom configurations. The PM6764TR device features up to 4-phase
> programmable operation.
> +
> +The PM6764TR supports power state transitions featuring VFDE, and
> programmable DPM
> +maintaining the best efficiency over all loading conditions without
> compromising transient
> +response. The device assures fast and independent protectionagainstload
> overcurrent,
> +under/overvoltage and feedback disconnections.
> +
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a25faf69fce3..9c846facce9f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -220,6 +220,15 @@ config SENSORS_MP2975
>        This driver can also be built as a module. If so, the module will
>        be called mp2975.
> 
> +config SENSORS_PM6764TR
> +    tristate "ST PM6764TR"
> +    help
> +      If you say yes here you get hardware monitoring support for ST
> +      PM6764TR.
> +
> +      This driver can also be built as a module. If so, the module will
> +      be called pm6764tr.
> +
>  config SENSORS_PXE1610
>      tristate "Infineon PXE1610"
>      help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 4c97ad0bd791..31ebdef5d4a6 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_SENSORS_MAX31785)    += max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)    += max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)    += max8688.o
>  obj-$(CONFIG_SENSORS_MP2975)    += mp2975.o
> +obj-$(CONFIG_SENSORS_PM6764TR)    += pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)    += pxe1610.o
>  obj-$(CONFIG_SENSORS_TPS40422)    += tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)    += tps53679.o
> diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
> new file mode 100644
> index 000000000000..2ab68036bb0c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/pm6764tr.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for STMicroelectronics digital controller
> PM6764TR
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pmbus.h>
> +#include <linux/slab.h>

Please check include file requirements. (At least) mutex.h and slab.h
seem unnecessary.

> +#include "pmbus.h"
> +
> +#define PM6764TR_PMBUS_READ_VOUT    0xD4
> +
> +static int pm6764tr_read_word_data(struct i2c_client *client, int page, int
> reg)

Another corruption.

> +{
> +    int ret;
> +
> +    switch (reg) {
> +    case PMBUS_VIRT_READ_VMON:
> +        ret = pmbus_read_word_data(client, page, PM6764TR_PMBUS_READ_VOUT);
> +        break;
> +    default:
> +        ret = -ENODATA;
> +        break;
> +    }
> +    return ret;
> +}
> +
> +static struct pmbus_driver_info pm6764tr_info = {
> +    .pages = 1,
> +    .format[PSC_VOLTAGE_IN] = linear,
> +    .format[PSC_VOLTAGE_OUT] = vid,
> +    .format[PSC_TEMPERATURE] = linear,
> +    .format[PSC_CURRENT_OUT] = linear,
> +    .format[PSC_POWER] = linear,
> +    .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |  PMBUS_HAVE_PIN |
> +        PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_VMON |
> +        PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_VOUT |
> +        PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +    .read_word_data = pm6764tr_read_word_data,
> +};
> +
> +static int pm6764tr_probe(struct i2c_client *client,
> +              const struct i2c_device_id *id)

Please align continuation lines with "(" in the preceding line
(checkpatch --strict will tell). 

> +{
> +    return pmbus_do_probe(client, id, &pm6764tr_info);
> +}
> +
> +static const struct i2c_device_id pm6764tr_id[] = {
> +    {"pm6764tr", 0},
> +    {}
> +};
> +MODULE_DEVICE_TABLE(i2c, pm6764tr_id);
> +
> +static const struct of_device_id pm6764tr_of_match[] = {
> +    {.compatible = "pm6764tr"},

As mentioned in the other e-mail, this should be something
like "st,pm6764tr", and a reference should be added to 
Documentation/devicetree/bindings/trivial-devices.yaml.

Thanks,
Guenter

> +    {}
> +};
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver pm6764tr_driver = {
> +    .driver = {
> +           .name = "pm6764tr",
> +           .of_match_table = of_match_ptr(pm6764tr_of_match),
> +           },
> +    .probe_new = pm6764tr_probe,
> +    .id_table = pm6764tr_id,
> +};
> +
> +module_i2c_driver(pm6764tr_driver);
> +
> +MODULE_AUTHOR("Charles Hsu");
> +MODULE_DESCRIPTION("PMBus driver for  ST PM6764TR");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 
