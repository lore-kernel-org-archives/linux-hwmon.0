Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC519C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 21:01:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4E622067C
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 21:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m79yl0dR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfFEVBU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 17:01:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44964 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfFEVBU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 17:01:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so13064794pgp.11
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X3+unuZvZdw6OHMPlNTKhxKBdRfHWHwZ0DXXPAD9ed8=;
        b=m79yl0dR+sHf9J65UDWD+d7JEygry06CUYN/h/aEQjdZeFP6W8gIgQOO7GKyUuTNG6
         SfW8q7svS/LbwyEjyGxBNYd+NBXM8ZFG+C9hA1l7Xzl71EXsw2U2sYEnFAn2Lmem6Zki
         MZSBCd1zPwFXwASVu9hRs7DDYR4mriS5tGHRSksg8JY1Nmbr8GP6klK2p1FcR6FjKj3f
         hPh87v/oLIYpRp9rK6gjiFIJ/WiSc2eudsrmBCIK6p9S26e5gIxtWu3NDsZS9pdHy4DF
         hZeSgGgfcdkHLzzHq5qSIRea0ATeuM4N80nu2eB5Kt17RFMAjao+hnST9DBxAB2w8bmJ
         MPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=X3+unuZvZdw6OHMPlNTKhxKBdRfHWHwZ0DXXPAD9ed8=;
        b=krYTGLt2UwpoAgYr97PhJfT+9vQ4PCOLS4fiL3fMN/FZiOxDJjXv6VYPe5qfMIKKLu
         zvy1NGS4PzbB2Ny1TsqbzhUNfPUopfFUWaLg33xZKVIbQpgpVtnycplD7TcZtz7F9KhH
         lNmLKDhb3ZQUvFndiqlDk8XpbZURmId2Wbyde5vXdgQ2CYMfs1IglTa27IvoYYaRWfxd
         FObZA8bchskIZS19YKh1Cau0w6bYl+ZkNQ8uw6bpHnL/TuxPgqORbKuvwdgYubTTT5uY
         SqGTsDBHyHCW+S25VtjYtwJgOV1bZsRtIEbrRHsdZ78ff/fXNaQRdk4+q5WOcfy5XA1X
         1y9w==
X-Gm-Message-State: APjAAAVLwThXp/0TrIoL36ShhPjKuz0ZMqv/AzHwHatLdl/nZdXtZcoh
        bFL6GdgYWJcJvrKS4JLuaToA6AWH
X-Google-Smtp-Source: APXvYqzlmz8wGbSseHV9WmUOMjA03qbjmbd0TWRwIZG39fLmbdhl5W2Ue1VF2eeugbzlk+rBlIOYWw==
X-Received: by 2002:a62:60c2:: with SMTP id u185mr38551955pfb.58.1559768479363;
        Wed, 05 Jun 2019 14:01:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x8sm5612898pfa.46.2019.06.05.14.01.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 14:01:18 -0700 (PDT)
Date:   Wed, 5 Jun 2019 14:01:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus) Add Infineon IRPS5401 driver
Message-ID: <20190605210117.GA1088@roeck-us.net>
References: <1559764141-26105-1-git-send-email-hancock@sedsystems.ca>
 <1559764141-26105-3-git-send-email-hancock@sedsystems.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559764141-26105-3-git-send-email-hancock@sedsystems.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 05, 2019 at 01:49:01PM -0600, Robert Hancock wrote:
> Add a driver to support the Infineon IRPS5401 PMIC. This chip has 5
> pages corresponding to 4 switching outputs and one linear (LDO) output.
> The switching and LDO outputs have slightly different supported
> parameters.
> 

Applied (removed empty line at end of file).

Thanks,
Guenter

> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  drivers/hwmon/pmbus/Kconfig    |  9 ++++++
>  drivers/hwmon/pmbus/Makefile   |  1 +
>  drivers/hwmon/pmbus/irps5401.c | 68 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/irps5401.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 30751eb..8eb5bb4 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -64,6 +64,15 @@ config SENSORS_IR38064
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ir38064.
>  
> +config SENSORS_IRPS5401
> +	tristate "Infineon IRPS5401"
> +	help
> +	  If you say yes here you get hardware monitoring support for the
> +	  Infineon IRPS5401 controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called irps5401.
> +
>  config SENSORS_ISL68137
>  	tristate "Intersil ISL68137"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 2219b93..e4a7dd0 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>  obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>  obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>  obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
> +obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
>  obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
>  obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
>  obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
> diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
> new file mode 100644
> index 0000000..825e9fa
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/irps5401.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for the Infineon IRPS5401M PMIC.
> + *
> + * Copyright (c) 2019 SED Systems, a division of Calian Ltd.
> + *
> + * The device supports VOUT_PEAK, IOUT_PEAK, and TEMPERATURE_PEAK, however
> + * this driver does not currently support them.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define IRPS5401_SW_FUNC (PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | \
> +			  PMBUS_HAVE_STATUS_INPUT | \
> +			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
> +			  PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
> +			  PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | \
> +			  PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
> +
> +#define IRPS5401_LDO_FUNC (PMBUS_HAVE_VIN | \
> +			   PMBUS_HAVE_STATUS_INPUT | \
> +			   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
> +			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
> +			   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | \
> +			   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
> +
> +static struct pmbus_driver_info irps5401_info = {
> +	.pages = 5,
> +	.func[0] = IRPS5401_SW_FUNC,
> +	.func[1] = IRPS5401_SW_FUNC,
> +	.func[2] = IRPS5401_SW_FUNC,
> +	.func[3] = IRPS5401_SW_FUNC,
> +	.func[4] = IRPS5401_LDO_FUNC,
> +};
> +
> +static int irps5401_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	return pmbus_do_probe(client, id, &irps5401_info);
> +}
> +
> +static const struct i2c_device_id irps5401_id[] = {
> +	{"irps5401", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, irps5401_id);
> +
> +static struct i2c_driver irps5401_driver = {
> +	.driver = {
> +		   .name = "irps5401",
> +		   },
> +	.probe = irps5401_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = irps5401_id,
> +};
> +
> +module_i2c_driver(irps5401_driver);
> +
> +MODULE_AUTHOR("Robert Hancock");
> +MODULE_DESCRIPTION("PMBus driver for Infineon IRPS5401");
> +MODULE_LICENSE("GPL");
> +
