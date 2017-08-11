Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus): Add POWER system power supply
 driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: robh+dt@kernel.org, jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, mark.rutland@arm.com, devicetree@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        "Edward A. James" <eajames@us.ibm.com>
References: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502403586-20549-3-git-send-email-eajames@linux.vnet.ibm.com>
 <20170811011807.GB10601@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 11 Aug 2017 09:30:59 -0500
MIME-Version: 1.0
In-Reply-To: <20170811011807.GB10601@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <73e48b5c-f284-0109-1ad0-cb3b46f98e0c@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 08/10/2017 08:18 PM, Guenter Roeck wrote:
> On Thu, Aug 10, 2017 at 05:19:45PM -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add the driver to monitor POWER system power supplies with hwmon over
>> pmbus.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/pmbus/Kconfig   |  10 +++
>>   drivers/hwmon/pmbus/Makefile  |   1 +
>>   drivers/hwmon/pmbus/powerps.c | 144 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 155 insertions(+)
>>   create mode 100644 drivers/hwmon/pmbus/powerps.c
>>
>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>> index 68d717a..8925c1a 100644
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -125,6 +125,16 @@ config SENSORS_MAX8688
>>   	  This driver can also be built as a module. If so, the module will
>>   	  be called max8688.
>>   
>> +config SENSORS_POWERPS
>> +	tristate "IBM POWER System Power Supply"
>> +	default n
>> +	help
>> +	  If you say yes here you get hardware monitoring support for the IBM
>> +	  POWER system power supply.
>> +
>> +	  This driver can also be built as a module. If so, the module will
>> +	  be called powerps.
>> +
>>   config SENSORS_TPS40422
>>   	tristate "TI TPS40422"
>>   	default n
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>> index 75bb7ca..3303af5 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
>>   obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>>   obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>>   obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>> +obj-$(CONFIG_SENSORS_POWERPS)	+= powerps.o
>>   obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>>   obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>>   obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>> diff --git a/drivers/hwmon/pmbus/powerps.c b/drivers/hwmon/pmbus/powerps.c
>> new file mode 100644
>> index 0000000..21d28f2
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/powerps.c
>> @@ -0,0 +1,144 @@
>> +/*
>> + * Copyright 2017 IBM Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/module.h>
>> +
>> +#include "pmbus.h"
>> +
>> +/* STATUS_MFR_SPECIFIC bits */
>> +#define POWERPS_MFR_FAN_FAULT			BIT(0)
>> +#define POWERPS_MFR_THERMAL_FAULT		BIT(1)
>> +#define POWERPS_MFR_OV_FAULT			BIT(2)
>> +#define POWERPS_MFR_UV_FAULT			BIT(3)
>> +#define POWERPS_MFR_PS_KILL			BIT(4)
>> +#define POWERPS_MFR_OC_FAULT			BIT(5)
>> +#define POWERPS_MFR_VAUX_FAULT			BIT(6)
>> +#define POWERPS_MFR_CURRENT_SHARE_WARNING	BIT(7)
>> +
>> +static int powerps_read_byte_data(struct i2c_client *client, int page, int reg)
>> +{
>> +	int rc, mfr;
>> +
>> +	switch (reg) {
>> +	case PMBUS_STATUS_VOUT:
>> +	case PMBUS_STATUS_IOUT:
>> +	case PMBUS_STATUS_TEMPERATURE:
>> +	case PMBUS_STATUS_FAN_12:
>> +		rc = pmbus_read_byte_data(client, page, reg);
>> +		if (rc < 0)
>> +			return rc;
>> +
>> +		mfr = pmbus_read_byte_data(client, page,
>> +					   PMBUS_STATUS_MFR_SPECIFIC);
>> +		if (mfr < 0)
>> +			return rc;
> 			return mfr; ?

Well I returned rc because we read the status register without error, so 
just return the status register contents without the additional mfr 
bits. It's not very clear... I better add a comment.

>
>> +
>> +		/* Add MFR_SPECIFIC bits to the standard pmbus status regs. */
>> +		if (reg == PMBUS_STATUS_FAN_12) {
>> +			if (mfr & POWERPS_MFR_FAN_FAULT)
>> +				rc |= PB_FAN_FAN1_FAULT;
>> +		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
>> +			if (mfr & POWERPS_MFR_THERMAL_FAULT)
>> +				rc |= PB_TEMP_OT_FAULT;
>> +		} else if (reg == PMBUS_STATUS_VOUT) {
>> +			if (mfr &
>> +			    (POWERPS_MFR_OV_FAULT | POWERPS_MFR_VAUX_FAULT))
> Wondering - this suggests that there is a VAUX. Would it make sense
> to map it to PMBUS_VIRT_READ_VMON ?

There is no VAUX for this device. The power supply spec calls it "12Vaux 
Fault" but I don't know why.

Thanks for the quick review!
Eddie

>
>> +				rc |= PB_VOLTAGE_OV_FAULT;
>> +			if (mfr & POWERPS_MFR_UV_FAULT)
>> +				rc |= PB_VOLTAGE_UV_FAULT;
>> +		} else if (reg == PMBUS_STATUS_IOUT) {
>> +			if (mfr & POWERPS_MFR_OC_FAULT)
>> +				rc |= PB_IOUT_OC_FAULT;
>> +			if (mfr & POWERPS_MFR_CURRENT_SHARE_WARNING)
>> +				rc |= PB_CURRENT_SHARE_FAULT;
>> +		}
>> +		break;
>> +	default:
>> +		rc = -ENODATA;
>> +		break;
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static int powerps_read_word_data(struct i2c_client *client, int page, int reg)
>> +{
>> +	int rc, mfr;
>> +
>> +	switch (reg) {
>> +	case PMBUS_STATUS_WORD:
>> +		rc = pmbus_read_word_data(client, page, reg);
>> +		if (rc < 0)
>> +			return rc;
>> +
>> +		mfr = pmbus_read_byte_data(client, page,
>> +					   PMBUS_STATUS_MFR_SPECIFIC);
>> +		if (mfr < 0)
>> +			return rc;
> 			return mfr; ?
>
>> +
>> +		if (mfr & POWERPS_MFR_PS_KILL)
>> +			rc |= PB_STATUS_OFF;
>> +		break;
>> +	default:
>> +		rc = -ENODATA;
>> +		break;
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static struct pmbus_driver_info powerps_info = {
>> +	.pages = 1,
>> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
>> +		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
>> +		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
>> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
>> +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
>> +	.read_byte_data = powerps_read_byte_data,
>> +	.read_word_data = powerps_read_word_data,
>> +	.debugfs = true,
>> +};
>> +
>> +static int powerps_probe(struct i2c_client *client,
>> +			 const struct i2c_device_id *id)
>> +{
>> +	return pmbus_do_probe(client, id, &powerps_info);
>> +}
>> +
>> +static const struct i2c_device_id powerps_id[] = {
>> +	{ "power_ps", 1 },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, powerps_id);
>> +
>> +/* IBM provides many compatible power supplies; use a generic name. */
>> +static const struct of_device_id powerps_of_match[] = {
>> +	{ .compatible = "ibm,power-ps" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, powerps_of_match);
>> +
>> +static struct i2c_driver powerps_driver = {
>> +	.driver = {
>> +		.name = "powerps",
>> +		.of_match_table = powerps_of_match,
>> +	},
>> +	.probe = powerps_probe,
>> +	.remove = pmbus_do_remove,
>> +	.id_table = powerps_id,
>> +};
>> +
>> +module_i2c_driver(powerps_driver);
>> +
>> +MODULE_AUTHOR("Eddie James");
>> +MODULE_DESCRIPTION("PMBus driver for POWER system power supplies");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 1.8.3.1
>>
