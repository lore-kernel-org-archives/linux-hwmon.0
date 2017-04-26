Return-path: <sam@mendozajonas.com>
Message-ID: <1493168635.1790.6.camel@mendozajonas.com>
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 26 Apr 2017 11:03:55 +1000
In-Reply-To: <248726f5-f1e7-4feb-1917-049173303aa6@roeck-us.net>
References: <20170421042505.20403-1-sam@mendozajonas.com>
	 <248726f5-f1e7-4feb-1917-049173303aa6@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, 2017-04-21 at 06:49 -0700, Guenter Roeck wrote:
> On 04/20/2017 09:25 PM, Samuel Mendoza-Jonas wrote:
> > IR35221 is a Digital DC-DC Multiphase Converter
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > - Tested on a ppc64 system which includes several of these devices.
> > - This patch re-implements the linear reg2data/data2reg functions from
> >   pmbus-core like some other drivers in order to scale some results. Is
> >   this something that would be better off being made generic for pmbus
> >   drivers to call?
> 
> That might make sense. The only other driver is zl6100, or am I missing
> something ?

I believe ltc2978 has a small implementation as well.

> 
> Trying to understand the code, the data format seems to be linear11 with
> an added exponent on top of it. Is that correct ? If so, I wonder if we should
> make that configurable, ie store the additional exponent in R and handle it
> in the pmbus core. Would that help ?

Yes that's essentially what it is. Using R for the extra exponent would
be a neat solution, however at least for this chip commands in the same
class have different scaling exponents (eg VIN_UV_WARN_LIMIT vs
READ_VIN). I'll have a look though and see if I can cover this - maybe a
small wrapper function that updates the exponent in the data returned by
pmbus_read_word_data()/etc?

> 
> If so, and if you have time, feel free to provide patches the modify the
> pmbus core code accordingly.
> 
> > - The resolution of iout0 is apparently configurable between two values,
> >   however the documentation I have access to does not specify how this is
> >   actually configured - currently it is left at the default resolution in
> >   the driver.
> > 
> 
> Nothing we can do about that, but it might make sense to add a note somewhere
> in the driver.
> 
> >  Documentation/hwmon/ir35221   |  87 ++++++++++++
> >  drivers/hwmon/pmbus/Kconfig   |  11 ++
> >  drivers/hwmon/pmbus/Makefile  |   1 +
> >  drivers/hwmon/pmbus/ir35221.c | 322 ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 421 insertions(+)
> >  create mode 100644 Documentation/hwmon/ir35221
> >  create mode 100644 drivers/hwmon/pmbus/ir35221.c
> > 
> > diff --git a/Documentation/hwmon/ir35221 b/Documentation/hwmon/ir35221
> > new file mode 100644
> > index 000000000000..f7e112752c04
> > --- /dev/null
> > +++ b/Documentation/hwmon/ir35221
> > @@ -0,0 +1,87 @@
> > +Kernel driver ir35221
> > +=====================
> > +
> > +Supported chips:
> > +  * Infinion IR35221
> > +    Prefix: 'ir35221'
> > +    Addresses scanned: -
> > +    Datasheet: Datasheet is not publicly available.
> 
> The chip doesn't even publicly exist, which is really annoying :-(.
> 
> > +
> > +Author: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +IR35221 is a Digital DC-DC Multiphase Converter
> > +
> > +
> > +Usage Notes
> > +-----------
> > +
> > +This driver does not probe for PMBus devices. You will have to instantiate
> > +devices explicitly.
> > +
> > +Example: the following commands will load the driver for an IR35221
> > +at address 0x70 on I2C bus #4:
> > +
> > +# modprobe ir35221
> > +# echo ir35221 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
> > +
> > +
> > +Sysfs attributes
> > +----------------
> > +
> > +curr1_label		"iin"
> > +curr1_input		Measured input current
> > +curr1_max		Maximum current
> > +curr1_max_alarm		Current high alarm
> > +
> > +curr[2-3]_label		"iout[1-2]"
> > +curr[2-3]_input		Measured output current
> > +curr[2-3]_crit		Critical maximum current
> > +curr[2-3]_crit_alarm	Current critical high alarm
> > +curr[2-3]_highest	Highest output current
> > +curr[2-3]_lowest	Lowest output current
> > +curr[2-3]_max		Maximum current
> > +curr[2-3]_max_alarm	Current high alarm
> > +
> > +in1_label		"vin"
> > +in1_input		Measured input voltage
> > +in1_crit		Critical maximum input voltage
> > +in1_crit_alarm		Input voltage critical high alarm
> > +in1_highest		Highest input voltage
> > +in1_lowest		Lowest input voltage
> > +in1_min			Minimum input voltage
> > +in1_min_alarm		Input voltage low alarm
> > +
> > +in[2-3]_label		"vout[1-2]"
> > +in[2-3]_input		Measured output voltage
> > +in[2-3]_lcrit		Critical minimum output voltage
> > +in[2-3]_lcrit_alarm	Output voltage critical low alarm
> > +in[2-3]_crit		Critical maximum output voltage
> > +in[2-3]_crit_alarm	Output voltage critical high alarm
> > +in[2-3]_highest		Highest output voltage
> > +in[2-3]_lowest		Lowest output voltage
> > +in[2-3]_max		Maximum output voltage
> > +in[2-3]_max_alarm	Output voltage high alarm
> > +in[2-3]_min		Minimum output voltage
> > +in[2-3]_min_alarm	Output voltage low alarm
> > +
> > +power1_label		"pin"
> > +power1_input		Measured input power
> > +power1_alarm		Input power high alarm
> > +power1_max		Input power limit
> > +
> > +power[2-3]_label	"pout[1-2]"
> > +power[2-3]_input	Measured output power
> > +power[2-3]_max		Output power limit
> > +power[2-3]_max_alarm	Output power high alarm
> > +
> > +temp[1-2]_input		Measured temperature
> > +temp[1-2]_crit		Critical high temperature
> > +temp[1-2]_crit_alarm	Chip temperature critical high alarm
> > +temp[1-2]_highest	Highest temperature
> > +temp[1-2]_lowest	Lowest temperature
> > +temp[1-2]_max		Maximum temperature
> > +temp[1-2]_max_alarm	Chip temperature high alarm
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index cad1229b7e17..88c7d6b116f8 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -159,4 +159,15 @@ config SENSORS_ZL6100
> >  	  This driver can also be built as a module. If so, the module will
> >  	  be called zl6100.
> > 
> > +config SENSORS_IR35221
> > +	tristate "Infineon IR35221"
> > +	default n
> > +	help
> > +	  If you say yes here you get hardware monitoring support for the
> > +	  Infineon IR35221 controller.
> > +
> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called ir35521.
> > +
> > +
> >  endif # PMBUS
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> > index 562132054aaf..75bb7ca619d9 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -5,6 +5,7 @@
> >  obj-$(CONFIG_PMBUS)		+= pmbus_core.o
> >  obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
> >  obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
> > +obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
> >  obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
> >  obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
> >  obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
> > diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
> > new file mode 100644
> > index 000000000000..e73b1aeb0085
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/ir35221.c
> > @@ -0,0 +1,322 @@
> > +/*
> > + * Hardware monitoring driver for IR35221
> > + *
> > + * Copyright (C) IBM Corporation 2017.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/i2c.h>
> 
> Alphabetic order please.
> 
> > +#include "pmbus.h"
> > +
> > +#define IR35221_IC_DEVICE_ID		0xad
> > +#define IR35221_IC_DEVICE_REV		0xae
> > +#define IR35221_USER_DATA_00		0xb0
> > +#define IR35221_USER_DATA_01		0xb1
> > +#define IR35221_MFR_READ_VAUX		0xc4
> > +#define IR35221_MFR_VIN_PEAK		0xc5
> > +#define IR35221_MFR_VOUT_PEAK		0xc6
> > +#define IR35221_MFR_IOUT_PEAK		0xc7
> > +#define IR35221_MFR_TEMP_PEAK		0xc8
> > +#define IR35221_MFR_VIN_VALLEY		0xc9
> > +#define IR35221_MFR_VOUT_VALLEY		0xca
> > +#define IR35221_MFR_IOUT_VALLEY		0xcb
> > +#define IR35221_MFR_TEMP_VALLEY		0xcc
> > +#define IR35221_VOUT_RESET		0xce
> > +#define IR35221_RESET_TRANSITION_RATE	0xcf
> > +#define IR35221_MFR_REG_ACCESS		0xd0
> > +#define IR35221_MFR_I2C_ADDRESS		0xd6
> 
> I don't think those are all used. Please drop the unused definitions.
> 
> > +
> > +static long ir35221_reg2data(int data, enum pmbus_sensor_classes class)
> > +{
> > +	s16 exponent;
> > +	s32 mantissa;
> > +	long val;
> > +
> > +	/* We only modify LINEAR11 formats */
> > +	exponent = ((s16)data) >> 11;
> > +	mantissa = ((s16)((data & 0x7ff) << 5)) >> 5;
> > +
> > +	val = mantissa * 1000L;
> > +
> > +	/* scale result to micro-units for power sensors */
> > +	if (class == PSC_POWER)
> > +		val = val * 1000L;
> > +
> > +	if (exponent >= 0)
> > +		val <<= exponent;
> > +	else
> > +		val >>= -exponent;
> > +
> > +	return val;
> > +}
> > +
> > +#define MAX_MANTISSA	(1023 * 1000)
> > +#define MIN_MANTISSA	(511 * 1000)
> > +
> > +static u16 ir35221_data2reg(long val, enum pmbus_sensor_classes class)
> > +{
> > +	s16 exponent = 0, mantissa;
> > +	bool negative = false;
> > +
> > +	if (val == 0)
> > +		return 0;
> > +
> > +	if (val < 0) {
> > +		negative = true;
> > +		val = -val;
> > +	}
> > +
> > +	/* Power is in uW. Convert to mW before converting. */
> > +	if (class == PSC_POWER)
> > +		val = DIV_ROUND_CLOSEST(val, 1000L);
> > +
> > +	/* Reduce large mantissa until it fits into 10 bit */
> > +	while (val >= MAX_MANTISSA && exponent < 15) {
> > +		exponent++;
> > +		val >>= 1;
> > +	}
> > +	/* Increase small mantissa to improve precision */
> > +	while (val < MIN_MANTISSA && exponent > -15) {
> > +		exponent--;
> > +		val <<= 1;
> > +	}
> > +
> > +	/* Convert mantissa from milli-units to units */
> > +	mantissa = DIV_ROUND_CLOSEST(val, 1000);
> > +
> > +	/* Ensure that resulting number is within range */
> > +	if (mantissa > 0x3ff)
> > +		mantissa = 0x3ff;
> > +
> > +	/* restore sign */
> > +	if (negative)
> > +		mantissa = -mantissa;
> > +
> > +	/* Convert to 5 bit exponent, 11 bit mantissa */
> > +	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
> > +}
> > +
> > +static u16 ir35221_scale_result(s16 data, int shift,
> > +				enum pmbus_sensor_classes class)
> > +{
> > +	long val;
> > +
> > +	val = ir35221_reg2data(data, class);
> > +
> > +	if (shift < 0)
> > +		val >>= -shift;
> > +	else
> > +		val <<= shift;
> > +
> > +	return ir35221_data2reg(val, class);
> > +}
> > +
> > +static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
> > +{
> > +	int ret;
> > +
> > +	switch (reg) {
> > +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> > +	case PMBUS_IOUT_OC_WARN_LIMIT:
> > +		ret = pmbus_read_word_data(client, page, reg);
> > +		ret = ir35221_scale_result(ret, 1, PSC_CURRENT_OUT);
> > +		break;
> > +	case PMBUS_VIN_OV_FAULT_LIMIT:
> > +	case PMBUS_VIN_OV_WARN_LIMIT:
> > +	case PMBUS_VIN_UV_WARN_LIMIT:
> > +		ret = pmbus_read_word_data(client, page, reg);
> > +		ret = ir35221_scale_result(ret, -4, PSC_VOLTAGE_IN);
> > +		break;
> > +	case PMBUS_IIN_OC_WARN_LIMIT:
> > +		ret = pmbus_read_word_data(client, page, reg);
> > +		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> > +	case PMBUS_READ_VIN:
> > +		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
> > +		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
> > +		break;
> > +	case PMBUS_READ_IIN:
> > +		ret = pmbus_read_word_data(client, page, PMBUS_READ_IIN);
> > +		if (page == 0)
> > +			ret = ir35221_scale_result(ret, -4, PSC_CURRENT_IN);
> > +		else
> > +			ret = ir35221_scale_result(ret, -5, PSC_CURRENT_IN);
> 
> Wow, per-page exponent. Someone was inventive.
> If we move scaling to the core, this would still be simpler as the additional
> scale could be handled here.
> 
> > +		break;
> > +	case PMBUS_READ_POUT:
> > +		ret = pmbus_read_word_data(client, page, PMBUS_READ_POUT);
> > +		ret = ir35221_scale_result(ret, -1, PSC_POWER);
> > +		break;
> > +	case PMBUS_READ_PIN:
> > +		ret = pmbus_read_word_data(client, page, PMBUS_READ_PIN);
> > +		ret = ir35221_scale_result(ret, -1, PSC_POWER);
> > +		break;
> > +	case PMBUS_READ_IOUT:
> > +		ret = pmbus_read_word_data(client, page, PMBUS_READ_IOUT);
> > +		if (page == 0)
> > +			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_OUT);
> > +		else
> > +			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_OUT);
> > +		break;
> > +	case PMBUS_VIRT_READ_VIN_MAX:
> > +		ret = pmbus_read_word_data(client, page, IR35221_MFR_VIN_PEAK);
> > +		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
> > +		break;
> > +	case PMBUS_VIRT_READ_VOUT_MAX:
> > +		ret = pmbus_read_word_data(client, page, IR35221_MFR_VOUT_PEAK);
> > +		break;
> > +	case PMBUS_VIRT_READ_IOUT_MAX:
> > +		ret = pmbus_read_word_data(client, page, IR35221_MFR_IOUT_PEAK);
> > +		if (page == 0)
> > +			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> > +		else
> > +			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_IN);
> > +		break;
> > +	case PMBUS_VIRT_READ_TEMP_MAX:
> > +		ret = pmbus_read_word_data(client, page, IR35221_MFR_TEMP_PEAK);
> > +		break;
> > +	case PMBUS_VIRT_READ_VIN_MIN:
> > +		ret = pmbus_read_word_data(client, page,
> > +					   IR35221_MFR_VIN_VALLEY);
> > +		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
> > +		break;
> > +	case PMBUS_VIRT_READ_VOUT_MIN:
> > +		ret = pmbus_read_word_data(client, page,
> > +					   IR35221_MFR_VOUT_VALLEY);
> > +		break;
> > +	case PMBUS_VIRT_READ_IOUT_MIN:
> > +		ret = pmbus_read_word_data(client, page,
> > +					   IR35221_MFR_IOUT_VALLEY);
> > +		if (page == 0)
> > +			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> > +		else
> > +			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_IN);
> > +		break;
> > +	case PMBUS_VIRT_READ_TEMP_MIN:
> > +		ret = pmbus_read_word_data(client, page,
> > +					   IR35221_MFR_TEMP_VALLEY);
> > +		break;
> > +	default:
> > +		ret = -ENODATA;
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
> > +				   u16 word)
> > +{
> > +	int ret;
> > +	u16 val;
> > +
> > +	switch (reg) {
> > +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> > +	case PMBUS_IOUT_OC_WARN_LIMIT:
> > +		val = ir35221_scale_result(word, -1, PSC_CURRENT_OUT);
> > +		ret = pmbus_write_word_data(client, page, reg, val);
> > +		break;
> > +	case PMBUS_VIN_OV_FAULT_LIMIT:
> > +	case PMBUS_VIN_OV_WARN_LIMIT:
> > +	case PMBUS_VIN_UV_WARN_LIMIT:
> > +		val = ir35221_scale_result(word, 4, PSC_VOLTAGE_IN);
> > +		ret = pmbus_write_word_data(client, page, reg, val);
> > +		break;
> > +	case PMBUS_IIN_OC_WARN_LIMIT:
> > +		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
> > +		ret = pmbus_write_word_data(client, page, reg, val);
> > +	default:
> > +		ret = -ENODATA;
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int ir35221_probe(struct i2c_client *client,
> > +			 const struct i2c_device_id *id)
> > +{
> > +	struct pmbus_driver_info *info;
> > +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter,
> > +				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> > +				| I2C_FUNC_SMBUS_READ_WORD_DATA
> > +				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> > +		return -ENODEV;
> > +
> > +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
> > +		return ret;
> > +	}
> > +	if (ret != 2 || strncmp(buf, "RI", strlen("RI"))) {
> > +		dev_err(&client->dev, "MFR_ID unrecognised\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
> > +		return ret;
> > +	}
> > +	if (ret != 2 || !(buf[0] == 0x6c && buf[1] == 0x00)) {
> > +		dev_err(&client->dev, "MFR_MODEL unrecognised\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
> > +			    GFP_KERNEL);
> > +	if (!info)
> > +		return -ENOMEM;
> > +
> > +	info->write_word_data = ir35221_write_word_data;
> > +	info->read_word_data = ir35221_read_word_data;
> > +
> > +	info->pages = 2;
> > +	info->format[PSC_VOLTAGE_IN] = linear;
> > +	info->format[PSC_VOLTAGE_OUT] = linear;
> > +	info->format[PSC_CURRENT_IN] = linear;
> > +	info->format[PSC_CURRENT_OUT] = linear;
> > +	info->format[PSC_POWER] = linear;
> > +	info->format[PSC_TEMPERATURE] = linear;
> > +
> > +	info->func[0] = PMBUS_HAVE_VIN
> > +		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> > +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> > +		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> > +		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> > +		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
> > +	info->func[1] = info->func[0];
> > +
> > +	return pmbus_do_probe(client, id, info);
> > +}
> > +
> > +static const struct i2c_device_id ir35221_id[] = {
> > +	{"ir35221", 0},
> > +	{}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, ir35221_id);
> > +
> > +static struct i2c_driver ir35221_driver = {
> > +	.driver = {
> > +		.name	= "ir35221",
> > +	},
> > +	.probe		= ir35221_probe,
> > +	.remove		= pmbus_do_remove,
> > +	.id_table	= ir35221_id,
> > +};
> > +
> > +module_i2c_driver(ir35221_driver);
> > +
> > +MODULE_AUTHOR("Samuel Mendoza-Jonas <sam@mendozajonas.com");
> > +MODULE_DESCRIPTION("PMBus driver for IR35221");
> > +MODULE_LICENSE("GPL");
> > 
> 
> 
