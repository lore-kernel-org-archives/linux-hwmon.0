Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F97DC64E7B
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 13:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB6BF217A0
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 13:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgLBNY0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Dec 2020 08:24:26 -0500
Received: from gproxy3-pub.mail.unifiedlayer.com ([69.89.30.42]:41109 "EHLO
        gproxy3-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726567AbgLBNYZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Dec 2020 08:24:25 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id D7555402B3
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Dec 2020 06:23:35 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kS6ZkyGKHDlydkS6Zklfu9; Wed, 02 Dec 2020 06:23:35 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=COQEoyjD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=8b9GpE9nAAAA:8 a=gXLdhW2jAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=64J-flk6gbOkI1un91IA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=T3LWEMljR5ZiDmsYVIUa:22 a=Dn9eIPSr_RzuO0KTJioD:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yai6RlLMf2iF9dG1o2AJCZj8WAbMBVEu2RcDAH563bU=; b=RXbICKByoSeBHukdOj3l0Vp0ry
        pRXm4jWlnP2EdHr+ErjaKLHvhx1Ga7vusv7tZOkBCFF2/X2Td0ipkBi5YOvtzSlKzwDXm9eLPuvlV
        28tV0xq50wG2ODk8gy9cLsQk4tPDTS6Flckx/EiMbyv64ctL+xD9upF4GEriT/hnnyY44NqTGPZgs
        veoeQf8BHKGfQtrto/BZjIxC1qlD9BNBj4D3ifTUzDt1fSXpnR9jK0She3MTxlhdvMHWhibhgwdAl
        Z65nP2UdN5BqA6MAYB80IvV2e/6fCazV9hx52+IwcSmYUlrL9wmtdH1cK+HZaacnfxIZJ0UIvkvln
        za+Sr9xA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37720 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkS6Y-001uvT-Rm; Wed, 02 Dec 2020 13:23:34 +0000
Date:   Wed, 2 Dec 2020 05:23:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles <hsu.yungteng@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        alan@redhat.com
Subject: Re: [PATCH v6] hwmon: Add driver for STMicroelectronics PM6764
 Voltage Regulator
Message-ID: <20201202132334.GA168086@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkS6Y-001uvT-Rm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:37720
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org:  HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 02, 2020 at 02:11:04PM +0800, Charles wrote:
> Add the pmbus driver for the STMicroelectronics pm6764 voltage regulator.
> 
> the output voltage use the MFR_READ_VOUT 0xD4
> vout value returned is linear11
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---
> 
> v6:
>  - Fix misspelling.
> v5:
>  - Add MAINTAINERS.
>  - Add a reference into trivial-devices.yaml.
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
> 
> ---
>  Documentation/hwmon/index.rst    |  1 +
>  Documentation/hwmon/pm6764tr.rst | 32 ++++++++++++++
>  MAINTAINERS                      |  7 +++
>  drivers/hwmon/pmbus/Kconfig      |  9 ++++
>  drivers/hwmon/pmbus/Makefile     |  1 +
>  drivers/hwmon/pmbus/pm6764tr.c   | 76 ++++++++++++++++++++++++++++++++
>  6 files changed, 126 insertions(+)
>  create mode 100644 Documentation/hwmon/pm6764tr.rst
>  create mode 100644 drivers/hwmon/pmbus/pm6764tr.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b797db738225..1bbd05e41de4 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -144,6 +144,7 @@ Hardware Monitoring Kernel Drivers
>     pc87360
>     pc87427
>     pcf8591
> +   pm6764tr
>     pmbus
>     powr1220
>     pxe1610
> diff --git a/Documentation/hwmon/pm6764tr.rst b/Documentation/hwmon/pm6764tr.rst
> new file mode 100644
> index 000000000000..a1fb8fea2326
> --- /dev/null
> +++ b/Documentation/hwmon/pm6764tr.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver pm6764tr
> +======================
> +
> +Supported chips:
> +
> +  * ST PM6764TR
> +
> +    Prefix: 'pm6764tr'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: http://www.st.com/resource/en/data_brief/pm6764.pdf
> +
> +Authors:
> +	<hsu.yungteng@gmail.com>
> +
> +Description:
> +------------
> +
> +This driver supports the STMicroelectronics PM6764TR chip. The PM6764TR is a high
> +performance digital controller designed to power Intel’s VR12.5 processors and memories.
> +
> +The device utilizes digital technology to implement all control and power management
> +functions to provide maximum flexibility and performance. The NVM is embedded to store
> +custom configurations. The PM6764TR device features up to 4-phase programmable operation.
> +
> +The PM6764TR supports power state transitions featuring VFDE, and programmable DPM
> +maintaining the best efficiency over all loading conditions without compromising transient
> +response. The device assures fast and independent protection against load overcurrent,
> +under/overvoltage and feedback disconnections.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 94ac10a153c7..a3fea132c4ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13904,6 +13904,13 @@ M:	Logan Gunthorpe <logang@deltatee.com>
>  S:	Maintained
>  F:	drivers/dma/plx_dma.c
> +PM6764TR DRIVER

I dn't know what happened, but this line ...

> +M:	Charles Hsu	<hsu.yungteng@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/pm6764tr.rst
> +F:	drivers/hwmon/pmbus/pm6764tr.c
> +
>  PM-GRAPH UTILITY
>  M:	"Todd E Brandt" <todd.e.brandt@linux.intel.com>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a25faf69fce3..9c846facce9f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -220,6 +220,15 @@ config SENSORS_MP2975
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp2975.
> +config SENSORS_PM6764TR

... and this line report that the patch is corrupted when I try to apply it.
Looking into the files, there is supposed to be an empty line before
"config SENSORS_PM6764TR" and before "PM6764TR DRIVER". If I add those
empty lines, the patch applies. checkpatch also reports problems associated
with that corruption as well as other problems. On top of that, the patch
does not show up in patchwork.

Please fix whatever is causing those problems and resubmit. I would suggest
to try to apply the patch yourself with "git am ..." before you send it out.

You'll also need a separate patch to add st,pm6764tr to trivial_devices.

Thanks,
Guenter

> +	tristate "ST PM6764TR"
> +	help
> +	  If you say yes here you get hardware monitoring support for ST
> +	  PM6764TR.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called pm6764tr.
> +
>  config SENSORS_PXE1610
>  	tristate "Infineon PXE1610"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 4c97ad0bd791..31ebdef5d4a6 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
> +obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
> new file mode 100644
> index 000000000000..70747c21c66e
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/pm6764tr.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for STMicroelectronics digital controller PM6764TR
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +#define PM6764TR_PMBUS_READ_VOUT	0xD4
> +
> +static int pm6764tr_read_word_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_VMON:
> +		ret = pmbus_read_word_data(client, page, PM6764TR_PMBUS_READ_VOUT);
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info pm6764tr_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |  PMBUS_HAVE_PIN |
> +	    PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_VMON |
> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data = pm6764tr_read_word_data,
> +};
> +
> +static int pm6764tr_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	return pmbus_do_probe(client, id, &pm6764tr_info);
> +}
> +
> +static const struct i2c_device_id pm6764tr_id[] = {
> +	{"pm6764tr", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, pm6764tr_id);
> +
> +static const struct of_device_id pm6764tr_of_match[] = {
> +	{.compatible = "st,pm6764tr"},
> +	{}
> +};
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver pm6764tr_driver = {
> +	.driver = {
> +		   .name = "pm6764tr",
> +		   .of_match_table = of_match_ptr(pm6764tr_of_match),
> +		   },
> +	.probe_new = pm6764tr_probe,
> +	.id_table = pm6764tr_id,
> +};
> +
> +module_i2c_driver(pm6764tr_driver);
> +
> +MODULE_AUTHOR("Charles Hsu");
> +MODULE_DESCRIPTION("PMBus driver for  ST PM6764TR");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 
