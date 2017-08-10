Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/4] drivers/hwmon/pmbus: Add IBM power supply hwmon
 driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
References: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501708633-2964-2-git-send-email-eajames@linux.vnet.ibm.com>
 <20170810150027.GE4945@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 10 Aug 2017 10:33:38 -0500
MIME-Version: 1.0
In-Reply-To: <20170810150027.GE4945@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <6bdc25b9-1278-d36d-aeed-1e208f1c9937@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 08/10/2017 10:00 AM, Guenter Roeck wrote:
> On Wed, Aug 02, 2017 at 04:17:10PM -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add the driver to monitor power supplies with hwmon over pmbus.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/pmbus/Kconfig  |  10 +++
>>   drivers/hwmon/pmbus/Makefile |   1 +
>>   drivers/hwmon/pmbus/ibmps.c  | 164 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 175 insertions(+)
>>   create mode 100644 drivers/hwmon/pmbus/ibmps.c
>>
>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>> index 68d717a..4eba657 100644
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -37,6 +37,16 @@ config SENSORS_ADM1275
>>   	  This driver can also be built as a module. If so, the module will
>>   	  be called adm1275.
>>   
>> +config SENSORS_IBMPS
>> +	tristate "IBM Power Supply"
>> +	default n
>> +	help
>> +	  If you say yes here you get hardware monitoring support for IBM
>> +	  power supply.
>> +
>> +	  This driver can also be built as a module. If so, the module will
>> +	  be called ibmps.
>> +
>>   config SENSORS_IR35221
>>   	tristate "Infineon IR35221"
>>   	default n
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>> index 75bb7ca..e37b715 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -5,6 +5,7 @@
>>   obj-$(CONFIG_PMBUS)		+= pmbus_core.o
>>   obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>>   obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>> +obj-$(CONFIG_SENSORS_IBMPS)	+= ibmps.o
>>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>>   obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
>>   obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>> diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
>> new file mode 100644
>> index 0000000..1928dd9
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/ibmps.c
>> @@ -0,0 +1,164 @@
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
>> +#define IBMPS_MFR_FAN_FAULT			BIT(0)
>> +#define IBMPS_MFR_THERMAL_FAULT			BIT(1)
>> +#define IBMPS_MFR_OV_FAULT			BIT(2)
>> +#define IBMPS_MFR_UV_FAULT			BIT(3)
>> +#define IBMPS_MFR_PS_KILL			BIT(4)
>> +#define IBMPS_MFR_OC_FAULT			BIT(5)
>> +#define IBMPS_MFR_VAUX_FAULT			BIT(6)
>> +#define IBMPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>> +
>> +static int ibmps_read_word_data(struct i2c_client *client, int page, int reg);
>> +
>> +static int ibmps_read_byte_data(struct i2c_client *client, int page, int reg)
>> +{
>> +	int rc, mfr;
>> +
>> +	switch (reg) {
>> +	case PMBUS_STATUS_BYTE:
>> +	case PMBUS_STATUS_WORD:
>> +		rc = ibmps_read_word_data(client, page, PMBUS_STATUS_WORD);
>> +		break;
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
>> +
>> +		if (reg == PMBUS_STATUS_FAN_12) {
>> +			if (mfr & IBMPS_MFR_FAN_FAULT)
>> +				rc |= PB_FAN_FAN1_FAULT;
>> +		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
>> +			if (mfr & IBMPS_MFR_THERMAL_FAULT)
>> +				rc |= PB_TEMP_OT_FAULT;
>> +		} else if (reg == PMBUS_STATUS_VOUT) {
>> +			if (mfr & (IBMPS_MFR_OV_FAULT | IBMPS_MFR_VAUX_FAULT))
>> +				rc |= PB_VOLTAGE_OV_FAULT;
>> +			if (mfr & IBMPS_MFR_UV_FAULT)
>> +				rc |= PB_VOLTAGE_UV_FAULT;
>> +		} else if (reg == PMBUS_STATUS_IOUT) {
>> +			if (mfr & IBMPS_MFR_OC_FAULT)
>> +				rc |= PB_IOUT_OC_FAULT;
>> +			if (mfr & IBMPS_MFR_CURRENT_SHARE_WARNING)
>> +				rc |= PB_CURRENT_SHARE_FAULT;
>> +		}
>> +		break;
>> +	default:
>> +		if (reg >= PMBUS_VIRT_BASE)
>> +			return -ENXIO;
>> +
>> +		rc = pmbus_read_byte_data(client, page, reg);
>> +		break;
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static int ibmps_read_word_data(struct i2c_client *client, int page, int reg)
>> +{
>> +	int rc, mfr;
>> +
>> +	switch (reg) {
>> +	case PMBUS_STATUS_BYTE:
>> +	case PMBUS_STATUS_WORD:
>> +		rc = pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
>> +		if (rc < 0)
>> +			return rc;
>> +
>> +		mfr = pmbus_read_byte_data(client, page,
>> +					   PMBUS_STATUS_MFR_SPECIFIC);
>> +		if (mfr < 0)
>> +			return rc;
>> +
>> +		if (mfr & IBMPS_MFR_PS_KILL)
>> +			rc |= PB_STATUS_OFF;
>> +
>> +		if (mfr)
>> +			rc |= PB_STATUS_WORD_MFR;
>> +		break;
>> +	default:
>> +		if (reg >= PMBUS_VIRT_BASE)
>> +			return -ENXIO;
>> +
>> +		rc = pmbus_read_word_data(client, page, reg);
>> +		if (rc < 0)
>> +			rc = ibmps_read_byte_data(client, page, reg);
>> +		break;
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static struct pmbus_driver_info ibmps_info = {
>> +	.pages = 1,
>> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
>> +		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
>> +		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
>> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
>> +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
>> +	.read_byte_data = ibmps_read_byte_data,
>> +	.read_word_data = ibmps_read_word_data,
>> +};
>> +
>> +static int ibmps_probe(struct i2c_client *client,
>> +		       const struct i2c_device_id *id)
>> +{
>> +	return pmbus_do_probe(client, id, &ibmps_info);
>> +}
>> +
>> +static int ibmps_remove(struct i2c_client *client)
>> +{
>> +	return pmbus_do_remove(client);
>> +}
>> +
>> +enum chips { witherspoon };
>> +
>> +static const struct i2c_device_id ibmps_id[] = {
>> +	{ "witherspoon", witherspoon },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ibmps_id);
>> +
>> +static const struct of_device_id ibmps_of_match[] = {
>> +	{ .compatible = "ibm,ibmps" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> Ah yes, as 0day points out, this won't compile.
> Hmmm ..... makes me wonder if and how you tested this.
> Can you provide output from the "sensors" command ?
>
> Guenter

Just a copy/paste goof on my part. It compiled in my development tree, 
as that symbol is defined elsewhere... I'll fix this in the next patch set.

This has been tested with the real power supply. I'm not sure what the 
sensors command is; I don't think I can use it on our test machines. Here:

# ls /sys/bus/i2c/devices/3-0068/hwmon/hwmon10
curr1_alarm   fan1_fault    fan2_input    in2_input power1_input  
temp2_alarm
curr1_input   fan1_input    in1_alarm     in2_label power1_label  
temp2_input
curr1_label   fan1_target   in1_input     name subsystem     temp3_alarm
device        fan2_alarm    in1_label     power temp1_alarm   temp3_input
fan1_alarm    fan2_fault    in2_alarm     power1_alarm temp1_input   uevent

# cat /sys/bus/i2c/devices/3-0068/hwmon/hwmon10/*
0
6125
iout1
cat: read error: Is a directory
0
0
3200
cat: read error: No such device or address
0
0
1568
0
204000
vin
0
12250
vout1
witherspoon_ps
cat: read error: Is a directory
0
120000000
pin
cat: read error: Is a directory
0
31000
0
34000
0
23000

Thanks,
Eddie

>
>> +
>> +static struct i2c_driver ibmps_driver = {
>> +	.driver = {
>> +		.name = "ibmps",
>> +		.of_match_table = ibmps_of_match,
>> +	},
>> +	.probe = ibmps_probe,
>> +	.remove = ibmps_remove,
>> +	.id_table = ibmps_id,
>> +};
>> +
>> +module_i2c_driver(ibmps_driver);
>> +
>> +MODULE_AUTHOR("Eddie James");
>> +MODULE_DESCRIPTION("PMBus driver for IBM power supply");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 1.8.3.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
