Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFAEC432BE
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F07E60525
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhIBNuL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Sep 2021 09:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbhIBNuL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Sep 2021 09:50:11 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6C2C061575
        for <linux-hwmon@vger.kernel.org>; Thu,  2 Sep 2021 06:49:12 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 6so2587650oiy.8
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Sep 2021 06:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bsjqZfBBmVoekeKXu8N4Ygaf5uusS5LON5qVxQlvVmc=;
        b=GhbniSJi6VJMSOJEy4qDskBuOtpZLX8uW2z0ImmzRBAWGw0QEtrzuBKWbP6c2lG7m/
         ltZijvWouE9CVDQ7Rl0Jg+kHFAHFCaIISvscwF0dOSHES7xZAE26VBXh9GnGrNIPL9i4
         I2TQyZtZ1AEMuZu9y6lzX1UwcgjwZ5NUbj6y9bWMBlBvqYwEJ2Y34d0I4QfUJUdDs8h+
         I4HgQjG5+fg+ZO7jG3XJ/0p5/tfImd8EM2gOm9IMCAlwP2gkjDY4quXu6sWG+e3Sx23W
         oB+6W+3hThHrwoWICVzRztTWZScJqA1vwMwnD3/c9OaP+j4bEB3rX7i44DVqaWRgX56d
         H6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bsjqZfBBmVoekeKXu8N4Ygaf5uusS5LON5qVxQlvVmc=;
        b=FIurM0713T0QnX64LllVxnU6JHJkLhd9nquLTSmUBsCYjsN5ZoXyD9Ly3QpPaE2vBB
         rZCiEGGHiBBDe9MH3xvpI8Nv3M07ryphoDA0W0/cqfK6apSWWr+xKDPQm6tC9LZ9toOQ
         pMF5qWR6zk6jXI4fmrS9Oe3/J8Bx9f0NbcNDmtmoQ0kJVfl0fF5bpMykR0U0jPRRnRan
         OAk43jMJmYqqwI7t5OMWv4AASjj6NWNydaoBT9WYNHRfTzRbnrnynGtlTDVbyLQxEVcv
         y2tmqhzBEX7AadxAT+2xSBjdhF3e4Lv9X/Voq5UjYZ3Nh3lTrmdXsr9XPlmtZxNOvKI3
         +5bg==
X-Gm-Message-State: AOAM531YU/Dh4wrG+fyDYDMYe6JaxKhyhm6DvZvlSax/pFzWVveskkVp
        pSvH2lbRg/l/Of+q7HV1kZ6n8L1sFiw=
X-Google-Smtp-Source: ABdhPJyImZaHVpbOAoEsA/bTWDHXkqlgiKxtSLV8+hkXDldnsMTmV7uc97wxkE0z+DpyJZKbBQz7hg==
X-Received: by 2002:a05:6808:17a6:: with SMTP id bg38mr2311793oib.88.1630590551884;
        Thu, 02 Sep 2021 06:49:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 8sm387478oix.7.2021.09.02.06.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 06:49:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver
To:     "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <MW2PR1901MB20282C7BCF058732B6357661A6C59@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <20210824205528.GA3417735@roeck-us.net>
 <MW2PR1901MB202860B0CFCEF7D6B2C719B7A6CE9@MW2PR1901MB2028.namprd19.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <67873a1f-1ae0-1f42-7ce5-b3799d0f2e8a@roeck-us.net>
Date:   Thu, 2 Sep 2021 06:49:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MW2PR1901MB202860B0CFCEF7D6B2C719B7A6CE9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/2/21 5:59 AM, Balac, Arun Saravanan wrote:
> Thanks for the review comments. Will resolve them and send the updated version for review.
> 
>>> +++ b/drivers/hwmon/max6620.c
>>> @@ -0,0 +1,507 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Hardware monitoring driver for Maxim MAX6620
>>> + *
>>> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
>>
>> Is this intentional, or was it supposed to be 2021 ?
>>
>>> + *
> 
> The copyright statement was the one present in initial version from the above author and has not been modified.
> Request you to let me know if it has to be changed to 2021.
> 

In that case it should be 2012, but it should probably say something like

"Originally from L. Grunenberg.
  (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>

  (c) 2021 (your or Dell's copyright)

Guenter

> 
> Regards,
> Arun Saravanan
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, August 25, 2021 2:25 AM
> To: Balac, Arun Saravanan
> Cc: jdelvare@suse.com; linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver
> 
> 
> [EXTERNAL EMAIL]
> 
> On Tue, Aug 24, 2021 at 11:59:26AM +0000, Balac, Arun Saravanan wrote:
>> From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
>>
>> Add hardware monitoring driver for Maxim MAX6620 Fan controller
>>
>> Originally-from: L. Grunenberg <contact@lgrunenberg.de>
>> Originally-from: Cumulus Networks <support@cumulusnetworks.com>
>> Originally-from: Shuotian Cheng <shuche@microsoft.com>
>> Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
>> ---
>>
>> <Formletter>
>> Changelog:
>> - Include '<linux/bits.h>'.
>> - Use BIT() macro in 'max6620_fan_div_from_reg'.
>> - Define functions 'max6620_fan_rpm_to_tach' , 'max6620_fan_tach_to_rpm'
>>     for RPM to tach conversion and vice versa.
>> - Drop 'reg' variable and use only variable 'ret' for validation and use of value
>>     returned by i2c_smbus_read_byte_data in 'max6620_update_device'.
>> - Remove unnecessary enclosing parentheses.
>> </Formletter>
>>
> 
> <Formletter> and </Formletter> were intended to show that the text in between
> was auto-generated, not supposed to be includes in the actual change log.
> 
>>   Documentation/hwmon/max6620.rst |  46 +++
> 
> Needs to be added to Documentation/hwmon/index.rst
> 
>>   drivers/hwmon/Kconfig           |  10 +
>>   drivers/hwmon/Makefile          |   1 +
>>   drivers/hwmon/max6620.c         | 507 ++++++++++++++++++++++++++++++++
>>   4 files changed, 564 insertions(+)
>>   create mode 100644 Documentation/hwmon/max6620.rst
>>   create mode 100644 drivers/hwmon/max6620.c
>>
>>
>> base-commit: ff1176468d368232b684f75e82563369208bc371
>>
>> diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
>> new file mode 100644
>> index 000000000000..84c1c44d3de4
>> --- /dev/null
>> +++ b/Documentation/hwmon/max6620.rst
>> @@ -0,0 +1,46 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +Kernel driver max6620
>> +=====================
>> +
>> +Supported chips:
>> +
>> +    Maxim MAX6620
>> +
>> +    Prefix: 'max6620'
>> +
>> +    Addresses scanned: none
>> +
>> +    Datasheet: https://urldefense.com/v3/__http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf__;!!LpKI!2F_9PYXKGKcU2EVLtM4q-fFP1VkDADkUBkRoeet8KfrP1t3jVCOVDCdzlkNKQYKmHwK5UQ$ [pdfserv[.]maxim-ic[.]com]
>> +
>> +Authors:
>> +    - L\. Grunenberg <contact@lgrunenberg.de>
>> +    - Cumulus Networks <support@cumulusnetworks.com>
>> +    - Shuotian Cheng <shuche@microsoft.com>
>> +    - Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for Maxim MAX6620 fan controller.
>> +
>> +The driver configures the fan controller in RPM mode. To give the readings more
>> +range or accuracy, the desired value can be set by a programmable register
>> +(1, 2, 4, 8, 16 or 32). Set higher values for larger speeds.
>> +
>> +The driver provides the following sensor access in sysfs:
>> +
>> +================ ======= =====================================================
>> +fan[1-4]_alarm   ro      Fan alarm.
>> +fan[1-4]_div     rw      Sets the nominal RPM range of the fan. Valid values
>> +                         are 1, 2, 4, 8, 16 and 32.
>> +fan[1-4]_input   ro      Fan speed in RPM.
>> +fan[1-4]_target  rw      Desired fan speed in RPM.
>> +================ ======= =====================================================
>> +
>> +Usage notes
>> +-----------
>> +
>> +This driver does not auto-detect devices. You will have to instantiate the
>> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>> +details.
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index e3675377bc5d..74811fbaa266 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called max31730.
>>   
>> +config SENSORS_MAX6620
>> +	tristate "Maxim MAX6620 fan controller"
>> +	depends on I2C
>> +	help
>> +	  If you say yes here you get support for the MAX6620
>> +	  fan controller.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called max6620.
>> +
>>   config SENSORS_MAX6621
>>   	tristate "Maxim MAX6621 sensor chip"
>>   	depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index d712c61c1f5e..9e50ff903931 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
>>   obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>>   obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
>>   obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
>> +obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
>>   obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
>>   obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
>>   obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
>> diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
>> new file mode 100644
>> index 000000000000..af2301ac9513
>> --- /dev/null
>> +++ b/drivers/hwmon/max6620.c
>> @@ -0,0 +1,507 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Hardware monitoring driver for Maxim MAX6620
>> + *
>> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
> 
> Is this intentional, or was it supposed to be 2021 ?
> 
>> + *
>> + * based on code written by :
>> + * 2007 by Hans J. Koch <hjk@hansjkoch.de>
>> + * John Morris <john.morris@spirentcom.com>
>> + * Copyright (c) 2003 Spirent Communications
>> + * and Claus Gindhart <claus.gindhart@kontron.com>
>> + *
>> + * This module has only been tested with the MAX6620 chip.
>> + *
>> + * The datasheet was last seen at:
>> + *
>> + *        https://urldefense.com/v3/__http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf__;!!LpKI!2F_9PYXKGKcU2EVLtM4q-fFP1VkDADkUBkRoeet8KfrP1t3jVCOVDCdzlkNKQYKmHwK5UQ$ [pdfserv[.]maxim-ic[.]com]
>> + *
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +
>> +/*
>> + * MAX 6620 registers
>> + */
>> +
>> +#define MAX6620_REG_CONFIG	0x00
>> +#define MAX6620_REG_FAULT	0x01
>> +#define MAX6620_REG_CONF_FAN0	0x02
>> +#define MAX6620_REG_CONF_FAN1	0x03
>> +#define MAX6620_REG_CONF_FAN2	0x04
>> +#define MAX6620_REG_CONF_FAN3	0x05
>> +#define MAX6620_REG_DYN_FAN0	0x06
>> +#define MAX6620_REG_DYN_FAN1	0x07
>> +#define MAX6620_REG_DYN_FAN2	0x08
>> +#define MAX6620_REG_DYN_FAN3	0x09
>> +#define MAX6620_REG_TACH0	0x10
>> +#define MAX6620_REG_TACH1	0x12
>> +#define MAX6620_REG_TACH2	0x14
>> +#define MAX6620_REG_TACH3	0x16
>> +#define MAX6620_REG_VOLT0	0x18
>> +#define MAX6620_REG_VOLT1	0x1A
>> +#define MAX6620_REG_VOLT2	0x1C
>> +#define MAX6620_REG_VOLT3	0x1E
>> +#define MAX6620_REG_TAR0	0x20
>> +#define MAX6620_REG_TAR1	0x22
>> +#define MAX6620_REG_TAR2	0x24
>> +#define MAX6620_REG_TAR3	0x26
>> +#define MAX6620_REG_DAC0	0x28
>> +#define MAX6620_REG_DAC1	0x2A
>> +#define MAX6620_REG_DAC2	0x2C
>> +#define MAX6620_REG_DAC3	0x2E
>> +
>> +/*
>> + * Config register bits
>> + */
>> +
>> +#define MAX6620_CFG_RUN		BIT(7)
>> +#define MAX6620_CFG_POR		BIT(6)
>> +#define MAX6620_CFG_TIMEOUT	BIT(5)
>> +#define MAX6620_CFG_FULLFAN	BIT(4)
>> +#define MAX6620_CFG_OSC		BIT(3)
>> +#define MAX6620_CFG_WD_MASK	(BIT(2) | BIT(1))
>> +#define MAX6620_CFG_WD_2	BIT(1)
>> +#define MAX6620_CFG_WD_6	BIT(2)
>> +#define MAX6620_CFG_WD10	(BIT(2) | BIT(1))
>> +#define MAX6620_CFG_WD		BIT(0)
>> +
>> +/*
>> + * Failure status register bits
>> + */
>> +
>> +#define MAX6620_FAIL_TACH0	BIT(4)
>> +#define MAX6620_FAIL_TACH1	BIT(5)
>> +#define MAX6620_FAIL_TACH2	BIT(6)
>> +#define MAX6620_FAIL_TACH3	BIT(7)
>> +#define MAX6620_FAIL_MASK0	BIT(0)
>> +#define MAX6620_FAIL_MASK1	BIT(1)
>> +#define MAX6620_FAIL_MASK2	BIT(2)
>> +#define MAX6620_FAIL_MASK3	BIT(3)
>> +
>> +#define MAX6620_CLOCK_FREQ	8192 /* Clock frequency in Hz */
>> +#define MAX6620_PULSE_PER_REV	2 /* Tachometer pulses per revolution */
>> +
>> +/* Minimum and maximum values of the FAN-RPM */
>> +#define FAN_RPM_MIN	240
>> +#define FAN_RPM_MAX	30000
>> +
>> +static const u8 config_reg[] = {
>> +	MAX6620_REG_CONF_FAN0,
>> +	MAX6620_REG_CONF_FAN1,
>> +	MAX6620_REG_CONF_FAN2,
>> +	MAX6620_REG_CONF_FAN3,
>> +};
>> +
>> +static const u8 dyn_reg[] = {
>> +	MAX6620_REG_DYN_FAN0,
>> +	MAX6620_REG_DYN_FAN1,
>> +	MAX6620_REG_DYN_FAN2,
>> +	MAX6620_REG_DYN_FAN3,
>> +};
>> +
>> +static const u8 tach_reg[] = {
>> +	MAX6620_REG_TACH0,
>> +	MAX6620_REG_TACH1,
>> +	MAX6620_REG_TACH2,
>> +	MAX6620_REG_TACH3,
>> +};
>> +
>> +static const u8 target_reg[] = {
>> +	MAX6620_REG_TAR0,
>> +	MAX6620_REG_TAR1,
>> +	MAX6620_REG_TAR2,
>> +	MAX6620_REG_TAR3,
>> +};
>> +
>> +/*
>> + * Client data (each client gets its own)
>> + */
>> +
>> +struct max6620_data {
>> +	struct i2c_client *client;
>> +	struct mutex update_lock;
>> +	bool valid; /* false until following fields are valid */
>> +	unsigned long last_updated; /* in jiffies */
>> +
>> +	/* register values */
>> +	u8 fancfg[4];
>> +	u8 fandyn[4];
>> +	u8 fault;
>> +	u16 tach[4];
>> +	u16 target[4];
>> +};
>> +
>> +static u8 max6620_fan_div_from_reg(u8 val)
>> +{
>> +	return BIT((val & 0xE0) >> 5);
>> +}
>> +
>> +static u16 max6620_fan_rpm_to_tach(u8 div, int rpm)
>> +{
>> +	return (60 * div * MAX6620_CLOCK_FREQ) / (rpm * MAX6620_PULSE_PER_REV);
>> +}
>> +
>> +static int max6620_fan_tach_to_rpm(u8 div, u16 tach)
>> +{
>> +	return (60 * div * MAX6620_CLOCK_FREQ) / (tach * MAX6620_PULSE_PER_REV);
>> +}
>> +
>> +static int max6620_update_device(struct device *dev)
>> +{
>> +	struct max6620_data *data = dev_get_drvdata(dev);
>> +	struct i2c_client *client = data->client;
>> +	int i;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&data->update_lock);
>> +
>> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
>> +		for (i = 0; i < 4; i++) {
>> +			ret = i2c_smbus_read_byte_data(client, config_reg[i]);
>> +			if (ret < 0)
>> +				goto error;
>> +			data->fancfg[i] = ret;
>> +
>> +			ret = i2c_smbus_read_byte_data(client, dyn_reg[i]);
>> +			if (ret < 0)
>> +				goto error;
>> +			data->fandyn[i] = ret;
>> +
>> +			ret = i2c_smbus_read_byte_data(client, tach_reg[i]);
>> +			if (ret < 0)
>> +				goto error;
>> +			data->tach[i] = (ret << 3) & 0x7f8;
>> +			ret = i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
>> +			if (ret < 0)
>> +				goto error;
>> +			data->tach[i] |= (ret >> 5) & 0x7;
>> +
>> +			ret = i2c_smbus_read_byte_data(client, target_reg[i]);
>> +			if (ret < 0)
>> +				goto error;
>> +			data->target[i] = (ret << 3) & 0x7f8;
>> +			ret = i2c_smbus_read_byte_data(client, target_reg[i] + 1);
>> +			if (ret < 0)
>> +				goto error;
>> +			data->target[i] |= (ret >> 5) & 0x7;
>> +		}
>> +
>> +		/*
>> +		 * Alarms are cleared on read in case the condition that
>> +		 * caused the alarm is removed. Keep the value latched here
>> +		 * for providing the register through different alarm files.
>> +		 */
>> +		ret = i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
>> +		if (ret < 0)
>> +			goto error;
>> +		data->fault |= (ret >> 4) & (ret & 0x0F);
>> +
>> +		data->last_updated = jiffies;
>> +		data->valid = true;
>> +	}
>> +
>> +error:
>> +	mutex_unlock(&data->update_lock);
>> +	return ret;
>> +}
>> +
>> +static umode_t
>> +max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
>> +		   int channel)
>> +{
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		switch (attr) {
>> +		case hwmon_fan_alarm:
>> +		case hwmon_fan_input:
>> +			return 0444;
>> +		case hwmon_fan_div:
>> +		case hwmon_fan_target:
>> +			return 0644;
>> +		default:
>> +			break;
>> +		}
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	     int channel, long *val)
>> +{
>> +	struct max6620_data *data;
>> +	struct i2c_client *client;
>> +	int ret = 0;
> 
> Unnecessary initialization.
> 
>> +	u8 div;
>> +	u8 val1;
>> +	u8 val2;
>> +
>> +	ret = max6620_update_device(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +	data = dev_get_drvdata(dev);
>> +	client = data->client;
> 
> It might be easier to assign those above, with the variable declaration,
> but that is just a suggestion.
> 
>> +
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		switch (attr) {
>> +		case hwmon_fan_alarm:
>> +			*val = !!(data->fault & BIT(channel));
>> +
>> +			/* Setting TACH count to re-enable fan fault detection */
>> +			if (*val == 1) {
>> +				val1 = (data->target[channel] >> 3) & 0xff;
>> +				val2 = (data->target[channel] << 5) & 0xe0;
>> +				ret = i2c_smbus_write_byte_data(client,
>> +								target_reg[channel], val1);
>> +				if (ret < 0)
>> +					return ret;
>> +				ret = i2c_smbus_write_byte_data(client,
>> +								target_reg[channel] + 1, val2);
>> +				if (ret < 0)
>> +					return ret;
>> +
>> +				mutex_lock(&data->update_lock);
>> +				data->fault &= ~BIT(channel);
>> +				mutex_unlock(&data->update_lock);
> 
> The lock needs to be extended across the write operations above and the
> assignment to *val. Otherwise multiple read operations in parallel could
> create random return values.
> 
>> +			}
>> +
>> +			break;
>> +		case hwmon_fan_div:
>> +			*val = max6620_fan_div_from_reg(data->fandyn[channel]);
>> +			break;
>> +		case hwmon_fan_input:
>> +			if (data->tach[channel] == 0) {
>> +				*val = 0;
>> +			} else {
>> +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
>> +				*val = max6620_fan_tach_to_rpm(div, data->tach[channel]);
>> +			}
>> +			break;
>> +		case hwmon_fan_target:
>> +			if (data->target[channel] == 0) {
>> +				*val = 0;
>> +			} else {
>> +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
>> +				*val = max6620_fan_tach_to_rpm(div, data->target[channel]);
>> +			}
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +		break;
>> +
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	      int channel, long val)
>> +{
>> +	struct max6620_data *data;
>> +	struct i2c_client *client;
>> +	int ret = 0;
> 
> Unnecessary initialization.
> 
>> +	u8 div;
>> +	u16 tach;
>> +	u8 val1;
>> +	u8 val2;
>> +
>> +	ret = max6620_update_device(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +	data = dev_get_drvdata(dev);
>> +	client = data->client;
> 
> As above.
> 
>> +	mutex_lock(&data->update_lock);
>> +
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		switch (attr) {
>> +		case hwmon_fan_div:
>> +			switch (val) {
>> +			case 1:
>> +				div = 0;
>> +				break;
>> +			case 2:
>> +				div = 1;
>> +				break;
>> +			case 4:
>> +				div = 2;
>> +				break;
>> +			case 8:
>> +				div = 3;
>> +				break;
>> +			case 16:
>> +				div = 4;
>> +				break;
>> +			case 32:
>> +				div = 5;
>> +				break;
>> +			default:
>> +				ret = -EINVAL;
>> +				goto error;
>> +			}
>> +			data->fandyn[channel] &= 0x1F;
>> +			data->fandyn[channel] |= div << 5;
>> +			ret = i2c_smbus_write_byte_data(client, dyn_reg[channel],
>> +							data->fandyn[channel]);
>> +			break;
>> +		case hwmon_fan_target:
>> +			val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
>> +			div = max6620_fan_div_from_reg(data->fandyn[channel]);
>> +			tach = max6620_fan_rpm_to_tach(div, val);
>> +			val1 = (tach >> 3) & 0xff;
>> +			val2 = (tach << 5) & 0xe0;
>> +			ret = i2c_smbus_write_byte_data(client, target_reg[channel], val1);
>> +			if (ret < 0)
>> +				break;
>> +			ret = i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2);
>> +			if (ret < 0)
>> +				break;
>> +
>> +			/* Setting TACH count re-enables fan fault detection */
>> +			data->fault &= ~BIT(channel);
>> +
>> +			break;
>> +		default:
>> +			ret = -EOPNOTSUPP;
>> +			break;
>> +		}
>> +		break;
>> +
>> +	default:
>> +		ret = -EOPNOTSUPP;
>> +		break;
>> +	}
>> +
>> +error:
>> +	mutex_unlock(&data->update_lock);
>> +	return ret;
>> +}
>> +
>> +static const struct hwmon_channel_info *max6620_info[] = {
>> +	HWMON_CHANNEL_INFO(fan,
>> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
>> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
>> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
>> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_ops max6620_hwmon_ops = {
>> +	.read = max6620_read,
>> +	.write = max6620_write,
>> +	.is_visible = max6620_is_visible,
>> +};
>> +
>> +static const struct hwmon_chip_info max6620_chip_info = {
>> +	.ops = &max6620_hwmon_ops,
>> +	.info = max6620_info,
>> +};
>> +
>> +static int max6620_init_client(struct max6620_data *data)
>> +{
>> +	struct i2c_client *client = data->client;
>> +	int config;
>> +	int err;
>> +	int i;
>> +	int reg;
>> +
>> +	config = i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
>> +	if (config < 0) {
>> +		dev_err(&client->dev, "Error reading config, aborting.\n");
>> +		return config;
>> +	}
>> +
>> +	/*
>> +	 * Set bit 4, disable other fans from going full speed on a fail
>> +	 * failure.
>> +	 */
>> +	err = i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x10);
>> +	if (err < 0) {
>> +		dev_err(&client->dev, "Config write error, aborting.\n");
>> +		return err;
>> +	}
>> +
>> +	for (i = 0; i < 4; i++) {
>> +		reg = i2c_smbus_read_byte_data(client, config_reg[i]);
>> +		if (reg < 0)
>> +			return reg;
>> +		data->fancfg[i] = reg;
>> +
>> +		/* Enable RPM mode */
>> +		data->fancfg[i] |= 0xa8;
>> +		err = i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
>> +		if (err < 0)
>> +			return err;
>> +
>> +		/* 2 counts (001) and Rate change 100 (0.125 secs) */
>> +		data->fandyn[i] = 0x30;
>> +		err = i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int max6620_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct max6620_data *data;
>> +	struct device *hwmon_dev;
>> +	int err;
>> +
>> +	data = devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->client = client;
>> +	mutex_init(&data->update_lock);
>> +
>> +	err = max6620_init_client(data);
>> +	if (err)
>> +		return err;
>> +
>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>> +							 data,
>> +							 &max6620_chip_info,
>> +							 NULL);
>> +
>> +	return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static const struct i2c_device_id max6620_id[] = {
>> +	{ "max6620", 0 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, max6620_id);
>> +
>> +static struct i2c_driver max6620_driver = {
>> +	.class		= I2C_CLASS_HWMON,
>> +	.driver = {
>> +		.name	= "max6620",
>> +	},
>> +	.probe_new	= max6620_probe,
>> +	.id_table	= max6620_id,
>> +};
>> +
>> +module_i2c_driver(max6620_driver);
>> +
>> +MODULE_AUTHOR("Lucas Grunenberg");
>> +MODULE_DESCRIPTION("MAX6620 sensor driver");
>> +MODULE_LICENSE("GPL");

