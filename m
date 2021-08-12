Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CE5C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 14:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2729C610A5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 14:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbhHLOqE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbhHLOqE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Aug 2021 10:46:04 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9365C061756
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Aug 2021 07:45:38 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so8024783otu.5
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Aug 2021 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AIF3Y/NkGOGcFuKBDjtV4uoU10pQMfChi2rfQzqNWmk=;
        b=RzlgE2IvT76Iyv2pr8WsGRaA6ISvkVTw//KSwVA344MbQZsGp90OEGbN0WcijM8UCJ
         VZ/jyFTSZflS4ZQOXIc9BPiXKHCJUVdRel4FKiMOWnm/7i7OIWPxG7flK/5XvVq4oWNE
         KtEWUAtKDLAITMX+ZElCQCGLdO99of0MKVGopvPLVIpYJ/by8LHKyLixlQ4mzOOVb6/i
         U/7ZDNSswY9VelOBO35Th704RYGgwjiTf8kgxNUQtT2dz9FFqwNjDIkGTNWFyMWnSNCU
         EtL03lvId5jO/Xo9hgS1zVr1dHL/7gSMGUpPo4qRU47DqpT2ACikbVbVIcqhIS9nWvEt
         o2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=AIF3Y/NkGOGcFuKBDjtV4uoU10pQMfChi2rfQzqNWmk=;
        b=H3xWrbTuCuUhn89GvwmC/yAXORcP+1VXUfFSqZAuvyFPIlupbAyHrfF7bNXJcogeoo
         ph92NqTi1ryqKdy110OISjpf7kqbNy8Z331BMHAvCD+cpsn3nRr8PdNwVBRuC62VEdl9
         mik4/huJ7skBG2Z0wD+tuByxyVxL+3Cp6g5ufqXjJdWXl5W5+TzeFRafu9p74Ysrjk9L
         X9lAUFZiDfUyWzLQlIttyqWpirQg5pgASj8ucrOjDsINUWb/ulS7DASzjKHchspwZFfT
         GY1XGdyVlqhHsP95KrmRlYagWyzXq7mXkSeOCSnHHKbtZoJCPd5QdJLs69zUUpmgNZOF
         P/fw==
X-Gm-Message-State: AOAM533+Ny2KG3yH3iTOAlUpSoMh7saNck0c50kM0Cx/lVnByuIgZp1A
        7u6s3F4oNs2LJkGKgJKOBIs=
X-Google-Smtp-Source: ABdhPJx5bN+CQrbDem3v2fFYYKFq3sS2WrLuYMj+qn6jVV02c+5a1flG2U2OsLM0PiNUvWFXomsbaw==
X-Received: by 2002:a05:6830:55b:: with SMTP id l27mr3653336otb.171.1628779538221;
        Thu, 12 Aug 2021 07:45:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u19sm650881oiv.28.2021.08.12.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 07:45:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 12 Aug 2021 07:45:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
Message-ID: <20210812144536.GB837928@roeck-us.net>
References: <MW2PR1901MB20282D7F75F763C7FF997CAAA6EA9@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <96555dd8-4664-1d26-2fe4-e7bbc0e85176@roeck-us.net>
 <MW2PR1901MB202895544397746BEA056097A6F99@MW2PR1901MB2028.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW2PR1901MB202895544397746BEA056097A6F99@MW2PR1901MB2028.namprd19.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 12, 2021 at 02:11:58PM +0000, Balac, Arun Saravanan wrote:
> From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> 
> Add hardware monitoring driver for Maxim MAX6620 Fan controller
> 
> Originally-from: L. Grunenberg <contact@lgrunenberg.de>
> Originally-from: Cumulus Networks <support@cumulusnetworks.com>
> Originally-from: Shuotian Cheng <shuche@microsoft.com>
> Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> ---

Updated patches must be sent as new patch and be versioned, not as reply
to a previous version. Also,

<Formletter>  
Change log goes here. If it is missing, I won't know what changed.
That means I will have to dig out older patch versions to compare.
That costs time and would hold up both this patch as well as all other
patches which I still have to review.

For this reason, I will not review patches without change log.
</Formletter>

Guenter

>  Documentation/hwmon/max6620.rst |  46 +++
>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/max6620.c         | 510 ++++++++++++++++++++++++++++++++
>  4 files changed, 567 insertions(+)
>  create mode 100644 Documentation/hwmon/max6620.rst
>  create mode 100644 drivers/hwmon/max6620.c
> 
> diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
> new file mode 100644
> index 000000000000..84c1c44d3de4
> --- /dev/null
> +++ b/Documentation/hwmon/max6620.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver max6620
> +=====================
> +
> +Supported chips:
> +
> +    Maxim MAX6620
> +
> +    Prefix: 'max6620'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
> +
> +Authors:
> +    - L\. Grunenberg <contact@lgrunenberg.de>
> +    - Cumulus Networks <support@cumulusnetworks.com>
> +    - Shuotian Cheng <shuche@microsoft.com>
> +    - Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Maxim MAX6620 fan controller.
> +
> +The driver configures the fan controller in RPM mode. To give the readings more
> +range or accuracy, the desired value can be set by a programmable register
> +(1, 2, 4, 8, 16 or 32). Set higher values for larger speeds.
> +
> +The driver provides the following sensor access in sysfs:
> +
> +================ ======= =====================================================
> +fan[1-4]_alarm   ro      Fan alarm.
> +fan[1-4]_div     rw      Sets the nominal RPM range of the fan. Valid values
> +                         are 1, 2, 4, 8, 16 and 32.
> +fan[1-4]_input   ro      Fan speed in RPM.
> +fan[1-4]_target  rw      Desired fan speed in RPM.
> +================ ======= =====================================================
> +
> +Usage notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e3675377bc5d..74811fbaa266 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31730.
>  
> +config SENSORS_MAX6620
> +	tristate "Maxim MAX6620 fan controller"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the MAX6620
> +	  fan controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max6620.
> +
>  config SENSORS_MAX6621
>  	tristate "Maxim MAX6621 sensor chip"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d712c61c1f5e..9e50ff903931 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
>  obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
>  obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
> +obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
>  obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
>  obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
>  obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
> diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
> new file mode 100644
> index 000000000000..1b709f0fcb7f
> --- /dev/null
> +++ b/drivers/hwmon/max6620.c
> @@ -0,0 +1,510 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Maxim MAX6620
> + *
> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
> + *
> + * based on code written by :
> + * 2007 by Hans J. Koch <hjk@hansjkoch.de>
> + * John Morris <john.morris@spirentcom.com>
> + * Copyright (c) 2003 Spirent Communications
> + * and Claus Gindhart <claus.gindhart@kontron.com>
> + *
> + * This module has only been tested with the MAX6620 chip.
> + *
> + * The datasheet was last seen at:
> + *
> + *        http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/*
> + * MAX 6620 registers
> + */
> +
> +#define MAX6620_REG_CONFIG	0x00
> +#define MAX6620_REG_FAULT	0x01
> +#define MAX6620_REG_CONF_FAN0	0x02
> +#define MAX6620_REG_CONF_FAN1	0x03
> +#define MAX6620_REG_CONF_FAN2	0x04
> +#define MAX6620_REG_CONF_FAN3	0x05
> +#define MAX6620_REG_DYN_FAN0	0x06
> +#define MAX6620_REG_DYN_FAN1	0x07
> +#define MAX6620_REG_DYN_FAN2	0x08
> +#define MAX6620_REG_DYN_FAN3	0x09
> +#define MAX6620_REG_TACH0	0x10
> +#define MAX6620_REG_TACH1	0x12
> +#define MAX6620_REG_TACH2	0x14
> +#define MAX6620_REG_TACH3	0x16
> +#define MAX6620_REG_VOLT0	0x18
> +#define MAX6620_REG_VOLT1	0x1A
> +#define MAX6620_REG_VOLT2	0x1C
> +#define MAX6620_REG_VOLT3	0x1E
> +#define MAX6620_REG_TAR0	0x20
> +#define MAX6620_REG_TAR1	0x22
> +#define MAX6620_REG_TAR2	0x24
> +#define MAX6620_REG_TAR3	0x26
> +#define MAX6620_REG_DAC0	0x28
> +#define MAX6620_REG_DAC1	0x2A
> +#define MAX6620_REG_DAC2	0x2C
> +#define MAX6620_REG_DAC3	0x2E
> +
> +/*
> + * Config register bits
> + */
> +
> +#define MAX6620_CFG_RUN		BIT(7)
> +#define MAX6620_CFG_POR		BIT(6)
> +#define MAX6620_CFG_TIMEOUT	BIT(5)
> +#define MAX6620_CFG_FULLFAN	BIT(4)
> +#define MAX6620_CFG_OSC		BIT(3)
> +#define MAX6620_CFG_WD_MASK	(BIT(2) | BIT(1))
> +#define MAX6620_CFG_WD_2	BIT(1)
> +#define MAX6620_CFG_WD_6	BIT(2)
> +#define MAX6620_CFG_WD10	(BIT(2) | BIT(1))
> +#define MAX6620_CFG_WD		BIT(0)
> +
> +/*
> + * Failure status register bits
> + */
> +
> +#define MAX6620_FAIL_TACH0	BIT(4)
> +#define MAX6620_FAIL_TACH1	BIT(5)
> +#define MAX6620_FAIL_TACH2	BIT(6)
> +#define MAX6620_FAIL_TACH3	BIT(7)
> +#define MAX6620_FAIL_MASK0	BIT(0)
> +#define MAX6620_FAIL_MASK1	BIT(1)
> +#define MAX6620_FAIL_MASK2	BIT(2)
> +#define MAX6620_FAIL_MASK3	BIT(3)
> +
> +#define MAX6620_CLOCK_FREQ	8192 /* Clock frequency in Hz */
> +#define MAX6620_PULSE_PER_REV	2 /* Tachometer pulses per revolution */
> +
> +/* Minimum and maximum values of the FAN-RPM */
> +#define FAN_RPM_MIN	240
> +#define FAN_RPM_MAX	30000
> +
> +static const u8 config_reg[] = {
> +	MAX6620_REG_CONF_FAN0,
> +	MAX6620_REG_CONF_FAN1,
> +	MAX6620_REG_CONF_FAN2,
> +	MAX6620_REG_CONF_FAN3,
> +};
> +
> +static const u8 dyn_reg[] = {
> +	MAX6620_REG_DYN_FAN0,
> +	MAX6620_REG_DYN_FAN1,
> +	MAX6620_REG_DYN_FAN2,
> +	MAX6620_REG_DYN_FAN3,
> +};
> +
> +static const u8 tach_reg[] = {
> +	MAX6620_REG_TACH0,
> +	MAX6620_REG_TACH1,
> +	MAX6620_REG_TACH2,
> +	MAX6620_REG_TACH3,
> +};
> +
> +static const u8 target_reg[] = {
> +	MAX6620_REG_TAR0,
> +	MAX6620_REG_TAR1,
> +	MAX6620_REG_TAR2,
> +	MAX6620_REG_TAR3,
> +};
> +
> +/*
> + * Client data (each client gets its own)
> + */
> +
> +struct max6620_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +	bool valid; /* false until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* register values */
> +	u8 fancfg[4];
> +	u8 fandyn[4];
> +	u8 fault;
> +	u16 tach[4];
> +	u16 target[4];
> +};
> +
> +static u8 max6620_fan_div_from_reg(u8 val)
> +{
> +	return 1 << ((val & 0xE0) >> 5);
> +}
> +
> +static int max6620_update_device(struct device *dev)
> +{
> +	struct max6620_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int i, reg, regval1, regval2;
> +	int ret = 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		for (i = 0; i < 4; i++) {
> +			reg = i2c_smbus_read_byte_data(client, config_reg[i]);
> +			if (reg < 0) {
> +				ret = reg;
> +				goto error;
> +			}
> +			data->fancfg[i] = reg;
> +
> +			reg = i2c_smbus_read_byte_data(client, dyn_reg[i]);
> +			if (reg < 0) {
> +				ret = reg;
> +				goto error;
> +			}
> +			data->fandyn[i] = reg;
> +
> +			regval1 = i2c_smbus_read_byte_data(client, tach_reg[i]);
> +			if (regval1 < 0) {
> +				ret = regval1;
> +				goto error;
> +			}
> +			regval2 = i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
> +			if (regval2 < 0) {
> +				ret = regval2;
> +				goto error;
> +			}
> +			data->tach[i] = ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
> +
> +			regval1 = i2c_smbus_read_byte_data(client, target_reg[i]);
> +			if (regval1 < 0) {
> +				ret = regval1;
> +				goto error;
> +			}
> +			regval2 = i2c_smbus_read_byte_data(client, target_reg[i] + 1);
> +			if (regval2 < 0) {
> +				ret = regval2;
> +				goto error;
> +			}
> +			data->target[i] = ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
> +		}
> +
> +		/*
> +		 * Alarms are cleared on read in case the condition that
> +		 * caused the alarm is removed. Keep the value latched here
> +		 * for providing the register through different alarm files.
> +		 */
> +		reg = i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
> +		if (reg < 0) {
> +			ret = reg;
> +			goto error;
> +		}
> +		data->fault |= (reg >> 4) & (reg & 0x0F);
> +
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static umode_t
> +max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
> +		   int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_alarm:
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_div:
> +		case hwmon_fan_target:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	     int channel, long *val)
> +{
> +	struct max6620_data *data;
> +	struct i2c_client *client;
> +	int ret = 0;
> +	u8 div;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret = max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data = dev_get_drvdata(dev);
> +	client = data->client;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_alarm:
> +			*val = !!(data->fault & BIT(channel));
> +
> +			/* Setting TACH count to re-enable fan fault detection */
> +			if (*val == 1) {
> +				val1 = (data->target[channel] >> 3) & 0xff;
> +				val2 = (data->target[channel] << 5) & 0xe0;
> +				ret = i2c_smbus_write_byte_data(client,
> +								target_reg[channel], val1);
> +				if (ret < 0)
> +					return ret;
> +				ret = i2c_smbus_write_byte_data(client,
> +								target_reg[channel] + 1, val2);
> +				if (ret < 0)
> +					return ret;
> +
> +				mutex_lock(&data->update_lock);
> +				data->fault &= ~(BIT(channel));
> +				mutex_unlock(&data->update_lock);
> +			}
> +
> +			break;
> +		case hwmon_fan_div:
> +			*val = max6620_fan_div_from_reg(data->fandyn[channel]);
> +			break;
> +		case hwmon_fan_input:
> +			if (data->tach[channel] == 0) {
> +				*val = 0;
> +			} else {
> +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val = (60 * div * MAX6620_CLOCK_FREQ) / (data->tach[channel]
> +									  * MAX6620_PULSE_PER_REV);
> +			}
> +			break;
> +		case hwmon_fan_target:
> +			if (data->target[channel] == 0) {
> +				*val = 0;
> +			} else {
> +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val = (60 * div * MAX6620_CLOCK_FREQ) / (data->target[channel]
> +									  * MAX6620_PULSE_PER_REV);
> +			}
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	      int channel, long val)
> +{
> +	struct max6620_data *data;
> +	struct i2c_client *client;
> +	int ret = 0;
> +	u8 div;
> +	u16 tach;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret = max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data = dev_get_drvdata(dev);
> +	client = data->client;
> +	mutex_lock(&data->update_lock);
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_div:
> +			switch (val) {
> +			case 1:
> +				div = 0;
> +				break;
> +			case 2:
> +				div = 1;
> +				break;
> +			case 4:
> +				div = 2;
> +				break;
> +			case 8:
> +				div = 3;
> +				break;
> +			case 16:
> +				div = 4;
> +				break;
> +			case 32:
> +				div = 5;
> +				break;
> +			default:
> +				ret = -EINVAL;
> +				goto error;
> +			}
> +			data->fandyn[channel] &= 0x1F;
> +			data->fandyn[channel] |= div << 5;
> +			ret = i2c_smbus_write_byte_data(client, dyn_reg[channel],
> +							data->fandyn[channel]);
> +			break;
> +		case hwmon_fan_target:
> +			val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
> +			div = max6620_fan_div_from_reg(data->fandyn[channel]);
> +			tach = (60 * div * MAX6620_CLOCK_FREQ) / (val * MAX6620_PULSE_PER_REV);
> +			val1 = (tach >> 3) & 0xff;
> +			val2 = (tach << 5) & 0xe0;
> +			ret = i2c_smbus_write_byte_data(client, target_reg[channel], val1);
> +			if (ret < 0)
> +				break;
> +			ret = i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2);
> +			if (ret < 0)
> +				break;
> +
> +			/* Setting TACH count re-enables fan fault detection */
> +			data->fault &= ~(BIT(channel));
> +
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static const struct hwmon_channel_info *max6620_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM),
> +	NULL
> +};
> +
> +static const struct hwmon_ops max6620_hwmon_ops = {
> +	.read = max6620_read,
> +	.write = max6620_write,
> +	.is_visible = max6620_is_visible,
> +};
> +
> +static const struct hwmon_chip_info max6620_chip_info = {
> +	.ops = &max6620_hwmon_ops,
> +	.info = max6620_info,
> +};
> +
> +static int max6620_init_client(struct max6620_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int config;
> +	int err;
> +	int i;
> +	int reg;
> +
> +	config = i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
> +	if (config < 0) {
> +		dev_err(&client->dev, "Error reading config, aborting.\n");
> +		return config;
> +	}
> +
> +	/*
> +	 * Set bit 4, disable other fans from going full speed on a fail
> +	 * failure.
> +	 */
> +	err = i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x10);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Config write error, aborting.\n");
> +		return err;
> +	}
> +
> +	for (i = 0; i < 4; i++) {
> +		reg = i2c_smbus_read_byte_data(client, config_reg[i]);
> +		if (reg < 0)
> +			return reg;
> +		data->fancfg[i] = reg;
> +
> +		/* Enable RPM mode */
> +		data->fancfg[i] |= 0xa8;
> +		err = i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
> +		if (err < 0)
> +			return err;
> +
> +		/* 2 counts (001) and Rate change 100 (0.125 secs) */
> +		data->fandyn[i] = 0x30;
> +		err = i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
> +		if (err < 0)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static int max6620_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct max6620_data *data;
> +	struct device *hwmon_dev;
> +	int err;
> +
> +	data = devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->update_lock);
> +
> +	err = max6620_init_client(data);
> +	if (err)
> +		return err;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &max6620_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id max6620_id[] = {
> +	{ "max6620", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max6620_id);
> +
> +static struct i2c_driver max6620_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "max6620",
> +	},
> +	.probe_new	= max6620_probe,
> +	.id_table	= max6620_id,
> +};
> +
> +module_i2c_driver(max6620_driver);
> +
> +MODULE_AUTHOR("Lucas Grunenberg");
> +MODULE_DESCRIPTION("MAX6620 sensor driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: ff1176468d368232b684f75e82563369208bc371
> -- 
> 2.32.0
> 
> Please find above the updated patch.
> 
> Thanks,
> Arun Saravanan
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, July 28, 2021 9:25 PM
> To: Balac, Arun Saravanan; jdelvare@suse.com
> Cc: linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
> 
> 
> [EXTERNAL EMAIL] 
> 
> On 7/28/21 7:11 AM, Balac, Arun Saravanan wrote:
> > From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> > 
> > Add hardware monitoring driver for Maxim MAX6620 Fan controller
> > 
> > Originally-from: L. Grunenberg <contact@lgrunenberg.de>
> > Originally-from: Cumulus Networks <support@cumulusnetworks.com>
> > Originally-from: Shuotian Cheng <shuche@microsoft.com>
> > Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> > ---
> >   drivers/hwmon/Kconfig   |  10 +
> >   drivers/hwmon/Makefile  |   1 +
> >   drivers/hwmon/max6620.c | 464 ++++++++++++++++++++++++++++++++++++++++
> 
> Documentation missing.
> 
> >   3 files changed, 475 insertions(+)
> >   create mode 100644 drivers/hwmon/max6620.c
> > 
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index e3675377bc5d..7bb2fbd72db4 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called max31730.
> >   
> > +config SENSORS_MAX6620
> > +	tristate "Maxim MAX6620 sensor chip"
> > +	depends on I2C
> > +	help
> > +	  If you say yes here you get support for the MAX6620
> > +	  sensor chips.
> 
> This is not a sensor, it is a fan controller.
> 
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called max6620.
> > +
> >   config SENSORS_MAX6621
> >   	tristate "Maxim MAX6621 sensor chip"
> >   	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index d712c61c1f5e..9e50ff903931 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
> >   obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
> >   obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
> >   obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
> > +obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
> >   obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
> >   obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
> >   obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
> > diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
> > new file mode 100644
> > index 000000000000..05f6fdc80343
> > --- /dev/null
> > +++ b/drivers/hwmon/max6620.c
> > @@ -0,0 +1,464 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * max6620.c - Linux Kernel module for hardware monitoring.
> 
> Pointless.
> 
> > + *
> > + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
> > + *
> > + * based on code written by :
> > + * 2007 by Hans J. Koch <hjk@hansjkoch.de>
> > + * John Morris <john.morris@spirentcom.com>
> > + * Copyright (c) 2003 Spirent Communications
> > + * and Claus Gindhart <claus.gindhart@kontron.com>
> > + *
> > + * This module has only been tested with the MAX6620 chip.
> > + *
> > + * The datasheet was last seen at:
> > + *
> > + *        https://urldefense.com/v3/__http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf__;!!LpKI!1VdQjyy5Q-_FrmWBxhCaB4bhmElQ75SkuBrVm_q99Rjt5Ejt_AMjK94gP2c_gd_tRYx1Ow$ [pdfserv[.]maxim-ic[.]com]
> > + *
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/i2c.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> 
> Not needed.
> 
> > +#include <linux/err.h>
> 
> Alphabetic include file order, please.
> 
> > +
> > +
> > +/*
> > + * MAX 6620 registers
> > + */
> > +
> > +#define MAX6620_REG_CONFIG	0x00
> > +#define MAX6620_REG_FAULT	0x01
> > +#define MAX6620_REG_CONF_FAN0	0x02
> > +#define MAX6620_REG_CONF_FAN1	0x03
> > +#define MAX6620_REG_CONF_FAN2	0x04
> > +#define MAX6620_REG_CONF_FAN3	0x05
> > +#define MAX6620_REG_DYN_FAN0	0x06
> > +#define MAX6620_REG_DYN_FAN1	0x07
> > +#define MAX6620_REG_DYN_FAN2	0x08
> > +#define MAX6620_REG_DYN_FAN3	0x09
> > +#define MAX6620_REG_TACH0	0x10
> > +#define MAX6620_REG_TACH1	0x12
> > +#define MAX6620_REG_TACH2	0x14
> > +#define MAX6620_REG_TACH3	0x16
> > +#define MAX6620_REG_VOLT0	0x18
> > +#define MAX6620_REG_VOLT1	0x1A
> > +#define MAX6620_REG_VOLT2	0x1C
> > +#define MAX6620_REG_VOLT3	0x1E
> > +#define MAX6620_REG_TAR0	0x20
> > +#define MAX6620_REG_TAR1	0x22
> > +#define MAX6620_REG_TAR2	0x24
> > +#define MAX6620_REG_TAR3	0x26
> > +#define MAX6620_REG_DAC0	0x28
> > +#define MAX6620_REG_DAC1	0x2A
> > +#define MAX6620_REG_DAC2	0x2C
> > +#define MAX6620_REG_DAC3	0x2E
> > +
> > +/*
> > + * Config register bits
> > + */
> > +
> > +#define MAX6620_CFG_RUN		0x80
> > +#define MAX6620_CFG_POR		0x40
> > +#define MAX6620_CFG_TIMEOUT	0x20
> > +#define MAX6620_CFG_FULLFAN	0x10
> > +#define MAX6620_CFG_OSC		0x08
> > +#define MAX6620_CFG_WD_MASK	0x06
> > +#define MAX6620_CFG_WD_2	0x02
> > +#define MAX6620_CFG_WD_6	0x04
> > +#define MAX6620_CFG_WD10	0x06
> > +#define MAX6620_CFG_WD		0x01
> 
> Please use BIT().
> 
> 
> > +
> > +
> > +/*
> > + * Failure status register bits
> > + */
> > +
> > +#define MAX6620_FAIL_TACH0	0x10
> > +#define MAX6620_FAIL_TACH1	0x20
> > +#define MAX6620_FAIL_TACH2	0x40
> > +#define MAX6620_FAIL_TACH3	0x80
> > +#define MAX6620_FAIL_MASK0	0x01
> > +#define MAX6620_FAIL_MASK1	0x02
> > +#define MAX6620_FAIL_MASK2	0x04
> > +#define MAX6620_FAIL_MASK3	0x08
> > +
> > +
> > +/* Minimum and maximum values of the FAN-RPM */
> > +#define FAN_RPM_MIN 240
> > +#define FAN_RPM_MAX 30000
> 
> #define<space>DEFINE<tab>value
> 
> > +
> > +/*
> > + * Insmod parameters
> > + */
> > +
> > +
> > +/* clock: The clock frequency of the chip the driver should assume */
> > +static int clock = 8192;
> > +static u32 np = 2;
> 
> 'clock' is always 8192. np is the number of pulses per revolution,
> and always 2. Please use defines for both.
> 
> > +
> > +module_param(clock, int, 0444);
> > +
> > +static const u8 config_reg[] = {
> > +	MAX6620_REG_CONF_FAN0,
> > +	MAX6620_REG_CONF_FAN1,
> > +	MAX6620_REG_CONF_FAN2,
> > +	MAX6620_REG_CONF_FAN3,
> > +};
> > +
> > +static const u8 dyn_reg[] = {
> > +	MAX6620_REG_DYN_FAN0,
> > +	MAX6620_REG_DYN_FAN1,
> > +	MAX6620_REG_DYN_FAN2,
> > +	MAX6620_REG_DYN_FAN3,
> > +};
> > +
> > +static const u8 tach_reg[] = {
> > +	MAX6620_REG_TACH0,
> > +	MAX6620_REG_TACH1,
> > +	MAX6620_REG_TACH2,
> > +	MAX6620_REG_TACH3,
> > +};
> > +
> > +static const u8 target_reg[] = {
> > +	MAX6620_REG_TAR0,
> > +	MAX6620_REG_TAR1,
> > +	MAX6620_REG_TAR2,
> > +	MAX6620_REG_TAR3,
> > +};
> > +
> > +/*
> > + * Client data (each client gets its own)
> > + */
> > +
> > +struct max6620_data {
> > +	struct i2c_client *client;
> > +	struct mutex update_lock;
> > +	char valid; /* zero until following fields are valid */
> 
> bool. However, I would strongly suggest to drop caching
> except for the fault register.
> 
> > +	unsigned long last_updated; /* in jiffies */
> > +
> > +	/* register values */
> > +	u8 config;
> > +	u8 fancfg[4];
> > +	u8 fandyn[4];
> > +	u8 fault;
> > +	u16 tach[4];
> > +	u16 target[4];
> > +};
> > +
> > +static u8 max6620_fan_div_from_reg(u8 val)
> > +{
> > +	return 1 << ((val & 0xE0) >> 5);
> > +}
> > +
> > +static struct max6620_data *max6620_update_device(struct device *dev)
> > +{
> > +	struct max6620_data *data = dev_get_drvdata(dev);
> > +	struct i2c_client *client = data->client;
> > +	int i;
> > +	u8 fault_reg, regval1, regval2;
> > +
> > +	mutex_lock(&data->update_lock);
> > +
> > +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> > +
> > +		for (i = 0; i < 4; i++) {
> > +			data->fancfg[i] = i2c_smbus_read_byte_data(client, config_reg[i]);
> > +			data->fandyn[i] = i2c_smbus_read_byte_data(client, dyn_reg[i]);
> > +			regval1 = i2c_smbus_read_byte_data(client, tach_reg[i]);
> > +			regval2 = i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
> > +			data->tach[i] = ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
> > +			regval1 = i2c_smbus_read_byte_data(client, target_reg[i]);
> > +			regval2 = i2c_smbus_read_byte_data(client, target_reg[i] + 1);
> > +			data->target[i] = ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
> > +		}
> > +
> > +
> > +		/*
> > +		 * Alarms are cleared on read in case the condition that
> > +		 * caused the alarm is removed. Keep the value latched here
> > +		 * for providing the register through different alarm files.
> > +		 */
> > +		fault_reg = i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
> > +		data->fault |= (fault_reg >> 4) & (fault_reg & 0x0F);
> > +
> > +		data->last_updated = jiffies;
> > +		data->valid = 1;
> > +	}
> > +
> > +	mutex_unlock(&data->update_lock);
> > +
> > +	return data;
> > +}
> > +
> > +static umode_t
> > +max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
> > +		   int channel)
> > +{
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_alarm:
> > +		case hwmon_fan_input:
> > +			return 0444;
> > +		case hwmon_fan_div:
> > +		case hwmon_fan_target:
> > +			return 0644;
> > +		default:
> > +			break;
> > +		}
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > +	     int channel, long *val)
> > +{
> > +	struct max6620_data *data = max6620_update_device(dev);
> > +	int alarm = 0;
> > +	u8 div;
> > +
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_alarm:
> > +			mutex_lock(&data->update_lock);
> > +			if (data->fault & (1 << channel))
> > +				alarm = 1;
> > +
> > +			mutex_unlock(&data->update_lock);
> 
> Locking is pointless here.
> 			*val = !!(data->fault & BIT(channel));
> does the same.
> 
> This code does not clear alarms after reading the attribute,
> or re-enable alarms. Clearing faults by relying on a write
> to fan_target is not appropriate. Alarms should be cleared
> and re-armed after reading an alarm attribute.
> 
> > +			*val = alarm;
> > +
> > +			break;
> > +		case hwmon_fan_div:
> > +			*val = max6620_fan_div_from_reg(data->fandyn[channel]);
> > +			break;
> > +		case hwmon_fan_input:
> > +			if (data->tach[channel] == 0)
> > +				*val = 0;
> > +			else {
> 
> if and else branch both need to use { }.
> 
> Please run checkpatch --strict and fix what it reports.
> 
> > +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
> > +				*val = (60 * div * clock)/(data->tach[channel] * np);
> > +			}
> > +			break;
> > +		case hwmon_fan_target:
> > +			if (data->target[channel] == 0)
> > +				*val = 0;
> > +			else {
> > +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
> > +				*val = (60 * div * clock)/(data->target[channel] * np);
> > +			}
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > +	      int channel, long val)
> > +{
> > +	struct max6620_data *data = dev_get_drvdata(dev);
> > +	struct i2c_client *client = data->client;
> > +	u8 div;
> > +	u16 tach;
> > +	u8 val1;
> > +	u8 val2;
> > +
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_div:
> > +			mutex_lock(&data->update_lock);
> 
> The lock is pointless here. Move it after the switch statement to
> simplify the code.
> 
> > +			switch (val) {
> > +			case 1:
> > +				div = 0;
> > +				break;
> > +			case 2:
> > +				div = 1;
> > +				break;
> > +			case 4:
> > +				div = 2;
> > +				break;
> > +			case 8:
> > +				div = 3;
> > +				break;
> > +			case 16:
> > +				div = 4;
> > +				break;
> > +			case 32:
> > +				div = 5;
> > +				break;
> > +			default:
> > +				mutex_unlock(&data->update_lock);
> > +				return -EINVAL;
> > +			}
> > +			data->fandyn[channel] &= 0x1F;
> > +			data->fandyn[channel] |= div << 5;
> > +			i2c_smbus_write_byte_data(client, dyn_reg[channel],
> > +						  data->fandyn[channel]);
> 
> Please do not ignore errors (everywhere).
> 
> > +			mutex_unlock(&data->update_lock);
> > +
> > +			break;
> > +		case hwmon_fan_target:
> > +			val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
> > +			mutex_lock(&data->update_lock);
> > +
> > +			div = max6620_fan_div_from_reg(data->fandyn[channel]);
> > +			tach = (60 * div * clock)/(val * np);
> > +			val1 = (tach >> 3) & 0xff;
> > +			val2 = (tach << 5) & 0xe0;
> > +			i2c_smbus_write_byte_data(client, target_reg[channel], val1);
> > +			i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2);
> > +
> > +			/* Setting TACH count re-enables fan fault detection */
> > +			data->fault &= ~(1 << channel);
> 
> Maybe, but expecting the user to write to this register to re-arm alarms
> is not appropriate.
> 
> > +
> > +			mutex_unlock(&data->update_lock);
> > +
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const u32 max6620_fan_config[] = {
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info max6620_fan = {
> > +	.type = hwmon_fan,
> > +	.config = max6620_fan_config,
> > +};
> > +
> > +static const struct hwmon_channel_info *max6620_info[] = {
> > +	&max6620_fan,
> > +	NULL
> > +};
> 
> Please use the HWMON_CHANNEL_INFO() macro.
> 
> > +
> > +static const struct hwmon_ops max6620_hwmon_ops = {
> > +	.read = max6620_read,
> > +	.write = max6620_write,
> > +	.is_visible = max6620_is_visible,
> > +};
> > +
> > +static const struct hwmon_chip_info max6620_chip_info = {
> > +	.ops = &max6620_hwmon_ops,
> > +	.info = max6620_info,
> > +};
> > +
> > +static int max6620_init_client(struct i2c_client *client)
> > +{
> > +	struct max6620_data *data = i2c_get_clientdata(client);
> > +	int config;
> > +	int err = -EIO;
> > +	int i;
> > +
> > +	config = i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
> > +
> Unnecessary empty line
> 
> > +	if (config < 0) {
> > +		dev_err(&client->dev, "Error reading config, aborting.\n");
> > +		return err;
> 
> Please do not overwrite error codes. This should return config.
> 
> > +	}
> > +
> > +	/*
> > +	 * Set bit 4, disable other fans from going full speed on a fail
> > +	 * failure.
> > +	 */
> > +	if (i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x10)) {
> > +		dev_err(&client->dev, "Config write error, aborting.\n");
> > +		return err;
> 
> Please return the error code from i2c_smbus_write_byte_data().
> 
> > +	}
> > +
> > +	data->config = config;
> 
> data->config is not used anywhere.
> 
> > +	for (i = 0; i < 4; i++) {
> > +		data->fancfg[i] = i2c_smbus_read_byte_data(client, config_reg[i]);
> > +		/* Enable RPM mode */
> > +		data->fancfg[i] |= 0xa8;
> > +		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
> > +		data->fandyn[i] = i2c_smbus_read_byte_data(client, dyn_reg[i]);
> > +		/* 2 counts (001) and Rate change 100 (0.125 secs) */
> > +		data->fandyn[i] = 0x30;
> > +		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
> 
> Again, please do not ignore error codes. Also, this mostly duplicates
> max6620_update_device().
> 
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int max6620_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct max6620_data *data;
> > +	struct device *hwmon_dev;
> > +	int err;
> > +
> > +	data = devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, data);
> 
> The only reason for this is to use it in max6620_init_client().
> Just pass 'data' to that function instead.
> 
> > +	data->client = client;
> > +	mutex_init(&data->update_lock);
> > +
> > +	/*
> > +	 * Initialize the max6620 chip
> > +	 */
> 
> Pointless comment.
> 
> > +	err = max6620_init_client(client);
> > +	if (err)
> > +		return err;
> > +
> > +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> > +							 data,
> > +							 &max6620_chip_info,
> > +							 NULL);
> > +
> > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static const struct i2c_device_id max6620_id[] = {
> > +	{ "max6620", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max6620_id);
> > +
> > +static struct i2c_driver max6620_driver = {
> > +	.class		= I2C_CLASS_HWMON,
> > +	.driver = {
> > +		.name	= "max6620",
> > +	},
> > +	.probe_new	= max6620_probe,
> > +	.id_table	= max6620_id,
> > +};
> > +
> > +module_i2c_driver(max6620_driver);
> > +
> > +MODULE_AUTHOR("Lucas Grunenberg");
> > +MODULE_DESCRIPTION("MAX6620 sensor driver");
> > +MODULE_LICENSE("GPL");
> > 
> > base-commit: ff1176468d368232b684f75e82563369208bc371
> > 
> 
