Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53971 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbcFKCt6 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 10 Jun 2016 22:49:58 -0400
Subject: Re: [PATCH v2] hwmon: added kernel module for FTS BMC chip "Teutates"
To: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>,
	linux-hwmon <linux-hwmon@vger.kernel.org>
References: <1465385997-30315-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Cc: Thilo Cestonaro <thilo@cestona.ro>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <575B7C51.9030004@roeck-us.net>
Date: Fri, 10 Jun 2016 19:49:53 -0700
MIME-Version: 1.0
In-Reply-To: <1465385997-30315-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/08/2016 04:39 AM, Thilo Cestonaro wrote:
> From: Thilo Cestonaro <thilo@cestona.ro>
>
> This driver implements support for the FTS BMC Chip "Teutates".
>
> Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
> ---
>   Documentation/hwmon/ftsteutates |  24 ++
>   drivers/hwmon/Kconfig           |  11 +
>   drivers/hwmon/Makefile          |   1 +
>   drivers/hwmon/ftsteutates.c     | 731 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 767 insertions(+)
>   create mode 100644 Documentation/hwmon/ftsteutates
>   create mode 100644 drivers/hwmon/ftsteutates.c
>
> diff --git a/Documentation/hwmon/ftsteutates b/Documentation/hwmon/ftsteutates
> new file mode 100644
> index 0000000..318c9eb
> --- /dev/null
> +++ b/Documentation/hwmon/ftsteutates
> @@ -0,0 +1,24 @@
> +Kernel driver ftsteutates
> +=====================
> +
> +Supported chips:
> +  * FTS Teutates
> +    Prefix: 'ftsteutates'
> +    Addresses scanned: I2C 0x73 (7-Bit)
> +
> +Author: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
> +
> +
> +Description
> +-----------
> +The BMC Teutates is the Eleventh generation of Superior System
> +monitoring and thermal management solution. It is builds on the basic
> +functionality of the BMC Theseus and contains several new features and
> +enhancements. It can monitor up to 4 voltages, 16 temperatures and
> +8 fans. It also contains an integrated watchdog which is currently
> +implemented in this driver.
> +
> +Specification of the chip can be found here:
> +ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Products/Mainboards/ \
> +	Industrial&ExtendedLifetime/D344x-S/IndustrialTools_D344x-S/      \
> +	Linux_SystemMonitoring&Watchdog&GPIO

ftp:///pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_Ext_1.20.pdf
ftp:///pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index ff94007..5c98e55 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -486,6 +486,17 @@ config SENSORS_FSCHMD
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called fschmd.
>
> +config SENSORS_FTSTEUTATES
> +	tristate "Fujitsu Technology Solutions sensor chip Teutates"
> +	depends on X86 && I2C

Does it really depends on X86 ? that is unusual for an i2c chip.
At least in theory it should be architecture independent.

> +	help
> +	  If you say yes here you get support for the Fujitsu Technology
> +      Solutions (FTS) sensor chip "Teutates" including support for
> +      the integrated watchdog.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called ftsteutates.
> +
>   config SENSORS_GL518SM
>   	tristate "Genesys Logic GL518SM"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 2ef5b7c..dcad5f7 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_SENSORS_F71882FG)	+= f71882fg.o
>   obj-$(CONFIG_SENSORS_F75375S)	+= f75375s.o
>   obj-$(CONFIG_SENSORS_FAM15H_POWER) += fam15h_power.o
>   obj-$(CONFIG_SENSORS_FSCHMD)	+= fschmd.o
> +obj-$(CONFIG_SENSORS_FTSTEUTATES) += ftsteutates.o
>   obj-$(CONFIG_SENSORS_G760A)	+= g760a.o
>   obj-$(CONFIG_SENSORS_G762)	+= g762.o
>   obj-$(CONFIG_SENSORS_GL518SM)	+= gl518sm.o
> diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
> new file mode 100644
> index 0000000..0381e84
> --- /dev/null
> +++ b/drivers/hwmon/ftsteutates.c
> @@ -0,0 +1,731 @@
> +/*
> + * ftsteutates.c, Support for the FTS Systemmonitoring Chip "Teutates"
> + *
> + * Copyright (C) 2016 Fujitsu Technology Solutions GmbH,
> + *		  Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/sysfs.h>
> +
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>
> +#include <linux/watchdog.h>
> +
Please list include files in alphabetic order.

> +#define FTSTEUTATES_DEVICE_ID_REG			0x0000
> +#define FTSTEUTATES_DEVICE_REVISION_REG		0x0001
> +#define FTSTEUTATES_DEVICE_STATUS_REG		0x0004
> +#define FTSTEUTATES_SATELLITE_STATUS_REG	0x0005
> +#define FTSTEUTATES_EVENT_STATUS_REG		0x0006
> +#define FTSTEUTATES_GLOBAL_CONTROL_REG		0x0007
> +
> +#define FTSTEUTATES_SENSOR_EVENT_REG		0x0010
> +
> +#define FTSTEUTATES_FAN_EVENT_REG			0x0014
> +#define FTSTEUTATES_FAN_PRESENT_REG			0x0015
> +
> +#define FTSTEUTATES_POWER_ON_TIME_COUNTER_A 0x007A
> +#define FTSTEUTATES_POWER_ON_TIME_COUNTER_B 0x007B
> +#define FTSTEUTATES_POWER_ON_TIME_COUNTER_C 0x007C
> +
> +#define FTSTEUTATES_PAGE_SELECT_REG			0x007F
> +
> +#define FTSTEUTATES_WATCHDOG_TIME_PRESET	0x000B
> +
> +/* currently undocumented register: Bit1 = 1 => 1 second watchdog resolution */
> +#define FTSTEUTATES_WATCHDOG_CONTROL		0x5081
> +#define FTSTEUTATES_WATCHDOG_RESOLUTION		1
> +

This define is quite pointless.

> +#define FTSTEUTATES_NO_FAN_SENSORS			0x08
> +#define FTSTEUTATES_NO_TEMP_SENSORS			0x10
> +#define FTSTEUTATES_NO_VOLT_SENSORS			0x04
> +

Still pretty long defines. How about 's/FTSTEUTATES/FTS/' ?

The same is true for function name prefixes. fts_ would be sufficient.
ftsteutates_ doesn't really add any value.

> +#define temp_sysfs_attr_group(offset) \
> +static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO, show_temp_value, \
> +			  NULL, offset - 1); \
> +static SENSOR_DEVICE_ATTR(temp##offset##_fault, S_IRUGO, show_temp_fault, \
> +			  NULL, offset - 1); \
> +static SENSOR_DEVICE_ATTR(temp##offset##_alarm, S_IRUGO | S_IWUSR, \
> +			 show_temp_alarm, clear_temp_alarm, offset - 1); \
> +static struct attribute *ftsteutates_temp##offset##_attrs[] = { \
> +	&sensor_dev_attr_temp##offset##_input.dev_attr.attr, \
> +	&sensor_dev_attr_temp##offset##_fault.dev_attr.attr, \
> +	&sensor_dev_attr_temp##offset##_alarm.dev_attr.attr, \
> +	NULL \
> +}; \
> +static struct attribute_group ftsteutates_temp##offset##_attrs_group = { \
> +	.attrs = ftsteutates_temp##offset##_attrs \
> +}
> +
Please don't use such macros. Checkpatch (and I) get confused by it.

> +#define fan_sysfs_attr_group(offset) \
> +static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO, show_fan_value, NULL, \
> +			  offset - 1); \
> +static SENSOR_DEVICE_ATTR(fan##offset##_source, S_IRUGO, show_fan_source, \
> +			  NULL, offset - 1); \
> +static SENSOR_DEVICE_ATTR(fan##offset##_alarm, S_IRUGO | S_IWUSR, \
> +			 show_fan_alarm, clear_fan_alarm, offset - 1); \
> +static struct attribute *ftsteutates_fan##offset##_attrs[] = { \
> +	&sensor_dev_attr_fan##offset##_input.dev_attr.attr, \
> +	&sensor_dev_attr_fan##offset##_source.dev_attr.attr, \
> +	&sensor_dev_attr_fan##offset##_alarm.dev_attr.attr, \
> +	NULL \
> +}; \
> +static struct attribute_group ftsteutates_fan##offset##_attrs_group = { \
> +	.is_visible = ftsteutates_fan_isvisible, \
> +	.attrs = ftsteutates_fan##offset##_attrs \
> +}

> +
> +/* possible addresses */
> +static const unsigned short normal_i2c[] = { 0x73, I2C_CLIENT_END };
> +
> +static struct i2c_device_id ftsteutates_id[] = {
> +	{ "ftsteutates", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ftsteutates_id);
> +
> +struct ftsteutates_data {
> +	struct i2c_client *client;
> +	struct device *hwmon_dev;
> +	struct mutex update_lock;
> +	bool valid; /* zero until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* voltage */
> +	u8 volt[FTSTEUTATES_NO_VOLT_SENSORS];
> +
> +	/* temprature */
> +	u8 temp_input[FTSTEUTATES_NO_TEMP_SENSORS]; /* value */
> +	bool temp_alarm[FTSTEUTATES_NO_TEMP_SENSORS]; /* alarm */
> +
> +	/* fan */
> +	bool fan_present[FTSTEUTATES_NO_FAN_SENSORS]; /* presence */
> +	u8 fan_input[FTSTEUTATES_NO_FAN_SENSORS]; /* revolutions per second */
> +	u8 fan_source[FTSTEUTATES_NO_FAN_SENSORS]; /* sensor source */
> +	bool fan_alarm[FTSTEUTATES_NO_FAN_SENSORS]; /* alarm */
> +};
> +DEFINE_MUTEX(access_lock);
> +static bool watchdog_initialized = 0;
> +
Please keep those variables in struct ftsteutates_data. Just pass 'data' to the functions
needing it.

On a side note, you don't need to initialize static variables with 0, and DEFINE_MUTEX
(without static) defines a global variable.

> +/* input fan speed */
> +static const u16 FTSTEUTATES_REG_FAN_input[FTSTEUTATES_NO_FAN_SENSORS] = {

FTS_REG_FAN_INPUT[] would be a bot shorter. Please use either all uppercase
or all lowercase, but not a mix.

> +	  0x0020, 0x0021, 0x0022, 0x0023,
> +	  0x0024, 0x0025, 0x0026, 0x0027 /* teutates */

I don't think those comments add any value. You might also consider a macro instead.

#define FTS_REG_FAN_INPUT(x)	((x) + 0x20)

The same is true for the other register arrays except for the voltages.

> +};
> +/* fan sensor source */
> +static const u16 FTSTEUTATES_REG_FAN_source[FTSTEUTATES_NO_FAN_SENSORS] = {
> +	  0x0030, 0x0031, 0x0032, 0x0033,
> +	  0x0034, 0x0035, 0x0036, 0x0037 /* teutates */
> +};
> +/* fan control */
> +static const u16 FTSTEUTATES_REG_FAN_control[FTSTEUTATES_NO_FAN_SENSORS] = {
> +	  0x4881, 0x4981, 0x4A81, 0x4B81,
> +	  0x4C81, 0x4D81, 0x4E81, 0x4F81 /* teutates */
> +};
> +
> +/* input temprature */
> +static const u16 FTSTEUTATES_REG_TEMP_input[FTSTEUTATES_NO_TEMP_SENSORS] = {
> +	  0x0040, 0x0041, 0x0042, 0x0043, 0x0044,
> +	  0x0045, 0x0046, 0x0047, 0x0048, 0x0049,
> +	  0x004A, 0x004B, 0x004C, 0x004D, 0x004E,
> +	  0x004F /* teutates */
> +};
> +/* control temprature */
> +static const u16 FTSTEUTATES_REG_TEMP_control[FTSTEUTATES_NO_TEMP_SENSORS] = {
> +	  0x0681, 0x0781, 0x0881, 0x0981, 0x0A81,
> +	  0x0B81, 0x0C81, 0x0D81, 0x0E81, 0x0F81,
> +	  0x1081, 0x1181, 0x1281, 0x1381, 0x1481,
> +	  0x1581 /* teutates */
> +};
> +
> +/* voltage in */
> +static const u16 FTSTEUTATES_REG_VOLT[FTSTEUTATES_NO_VOLT_SENSORS] = {
> +	  0x001A, 0x0018, 0x0019, 0x001B /* teutates */
> +};
> +
> +/*****************************************************************************/
> +/* I2C Helper functions							     */
> +/*****************************************************************************/
> +int ftsteutates_read_byte(struct i2c_client *client, unsigned short reg)
> +{
> +	int ret = -1;
> +	unsigned char page = reg>>8;
> +
> +	mutex_lock(&access_lock);
> +	dev_dbg(&client->dev, "page select - page: 0x%.02x\n", page);
> +	ret = i2c_smbus_write_byte_data(client, FTSTEUTATES_PAGE_SELECT_REG,
> +				page);

Please align continuation lines with '('.

> +
> +	if (ret != 0)

Semantics: ret < 0 indicates an error.

> +		goto error;
> +
> +	reg &= 0xFF;
> +	ret = i2c_smbus_read_byte_data(client, reg);
> +	dev_dbg(&client->dev, "read - reg: 0x%.02x: val: 0x%.02x\n", reg, ret);
> +
> +error:
> +	mutex_unlock(&access_lock);
> +	return ret;
> +}
> +
> +int ftsteutates_write_byte(struct i2c_client *client, unsigned short reg,
> +						   unsigned char value)
> +{
> +	int ret;
> +	unsigned char page = reg>>8;
> +
> +	mutex_lock(&access_lock);
> +	dev_dbg(&client->dev, "page select - page: 0x%.02x\n", page);
> +	ret = i2c_smbus_write_byte_data(client, FTSTEUTATES_PAGE_SELECT_REG,
> +				page);
> +
> +	if (ret != 0)

	ret < 0

> +		goto error;
> +
> +	reg &= 0xFF;
> +	dev_dbg(&client->dev,
> +		"write - reg: 0x%.02x: val: 0x%.02x\n", reg, value);
> +	ret = i2c_smbus_write_byte_data(client, reg, value);
> +
> +error:
> +	mutex_unlock(&access_lock);
> +	return ret;
> +}
> +
> +/*****************************************************************************/
> +/* Data Updater Helper function						     */
> +/*****************************************************************************/
> +static struct ftsteutates_data *ftsteutates_update_device(struct device *dev)
> +{
> +	struct ftsteutates_data *data = dev_get_drvdata(dev);
> +	int i;
> +	int present, alarm, status;
> +
> +	mutex_lock(&data->update_lock);
> +	if (!time_after(jiffies, data->last_updated + 2 * HZ) && data->valid)
> +		goto exit;
> +
> +	status = ftsteutates_read_byte(data->client,
> +				       FTSTEUTATES_DEVICE_STATUS_REG);
> +	if(status < 0) {
> +		dev_err(dev, "couldn't read device status register\n");

Please drop those error messages. The error should be returned to the caller.
[ I am concerned with clogging the log if the chip has a problem ]
Add
		data = ERR_PTR(ret);
instead and check the error in the calling code.

> +		goto exit;
> +	}
> +	data->valid = !!(status & 0x02);
> +	if (!data->valid)

Should this return an error, or just report the old values ?

> +		goto exit;
> +
> +	present = ftsteutates_read_byte(data->client,
> +					FTSTEUTATES_FAN_PRESENT_REG);
> +	if(present < 0) {
> +		dev_err(dev, "couldn't read fan present register\n");
> +		goto exit;
> +	}
> +
> +	alarm = ftsteutates_read_byte(data->client, FTSTEUTATES_FAN_EVENT_REG);
> +	if(present < 0) {
> +		dev_err(dev, "couldn't read fan event register\n");
> +		goto exit;
> +	}
> +
> +	for (i = 0; i < FTSTEUTATES_NO_FAN_SENSORS; i++) {
> +		data->fan_present[i] = !!(present & (1<<i));
> +		if (data->fan_present[i]) {
> +			data->fan_alarm[i] = !!(alarm & (1<<i));
> +
> +			data->fan_input[i] = ftsteutates_read_byte(data->client,
> +						  FTSTEUTATES_REG_FAN_input[i]);
> +			if(data->fan_input[i] < 0) {
> +				dev_err(dev,
> +					"couldn't read fan input register\n");
> +				goto exit;
> +			}
> +
> +			data->fan_source[i] = ftsteutates_read_byte(
> +						 data->client,
> +						 FTSTEUTATES_REG_FAN_source[i]);
> +			if(data->fan_source[i] < 0) {
> +				dev_err(dev,
> +					"couldn't read fan source register\n");
> +				goto exit;
> +			}
> +		} else {
> +			data->fan_alarm[i] = 0;
> +			data->fan_input[i] = 0;
> +			data->fan_source[i] = 0;
> +		}
> +	}
> +
> +	alarm = ftsteutates_read_byte(data->client,
> +				      FTSTEUTATES_SENSOR_EVENT_REG);
> +	if(alarm < 0) {
> +		dev_err(dev, "couldn't read sensor alarm register\n");
> +		goto exit;
> +	}
> +
> +	for (i = 0; i < FTSTEUTATES_NO_TEMP_SENSORS; i++) {
> +		data->temp_input[i] = ftsteutates_read_byte(data->client,
> +						FTSTEUTATES_REG_TEMP_input[i]);
> +		if(data->temp_input[i] < 0) {

temp_input[] is unsigned, so this is never < 0.

Doesn't gcc give you a warning about this ? Try compiling with W=1.

> +			dev_err(dev,
> +				"couldn't read temperature input register\n");
> +			goto exit;
> +		}
> +		data->temp_alarm[i] = !!(alarm & (1<<i));

Since there is only one temperature alarm register, it would be easier
to just have "u8 temp_alarm" and access it with "data->temp_alarm & BIT(1)".
The same is true for fan alarms.

> +	}
> +
> +	for (i = 0; i < FTSTEUTATES_NO_VOLT_SENSORS; i++) {
> +		data->volt[i] = ftsteutates_read_byte(data->client,
> +						      FTSTEUTATES_REG_VOLT[i]);
> +		if(data->volt[i] < 0) {
> +			dev_err(dev, "couldn't read voltage register\n");
> +			goto exit;
> +		}
> +	}
> +	data->last_updated = jiffies;
> +
> +exit:
> +	mutex_unlock(&data->update_lock);
> +	return data;
> +}
> +
> +/*****************************************************************************/
> +/* Watchdog functions							     */
> +/*****************************************************************************/
> +static int ftsteutates_wdt_set_timeout(struct watchdog_device *wdd,
> +				       unsigned int timeout_seconds)
> +{
> +	wdd->timeout = DIV_ROUND_UP(wdd->timeout,
> +				    FTSTEUTATES_WATCHDOG_RESOLUTION);

Dividing by 1 and rounding up does not do anything.

The timeout is in seconds, which effectively means that you don't need
this function at all (the core will set the timeout variable if the function
is not there and updating the timeout is supported).

> +	return 0;
> +}
> +
> +static int ftsteutates_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct ftsteutates_data *data;
> +
> +	data = watchdog_get_drvdata(wdd);
> +	return ftsteutates_write_byte(data->client,
> +			       FTSTEUTATES_WATCHDOG_TIME_PRESET, wdd->timeout);
> +}
> +
> +static int ftsteutates_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct ftsteutates_data *data;
> +
> +	data = watchdog_get_drvdata(wdd);
> +	return ftsteutates_write_byte(data->client,
> +			FTSTEUTATES_WATCHDOG_TIME_PRESET, 0);
> +}
> +
> +static const struct watchdog_info ftsteutates_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
> +	.identity = "FTS Teutates Hardware Watchdog",
> +};
> +
> +static const struct watchdog_ops ftsteutates_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = ftsteutates_wdt_start,
> +	.stop = ftsteutates_wdt_stop,
> +	.set_timeout = ftsteutates_wdt_set_timeout,
> +};
> +
> +static struct watchdog_device ftsteutates_wdt = {
> +	.info = &ftsteutates_wdt_info,
> +	.ops = &ftsteutates_wdt_ops,
> +};
> +
> +/*****************************************************************************/
> +/* SysFS handler functions						     */
> +/*****************************************************************************/
> +static const int multi[4] = { 11, 11, 39, 10 };
> +static ssize_t show_in_value(struct device *dev,
> +			     struct device_attribute *devattr, char *buf)
> +{
> +	/* got from the systemboard specification */

What ? multi ? If so, please move the comment to the variable declaration.
Also, this seems to be board specific, and could therefore be different
on another board. It should therefore not be hard-coded in the driver.

You have two options:

- Keep the data unadjusted (ie report 0.. 3.3V) and document to the user
   how to adjust it using sensors3.conf.
- If you can use DMI to identify a platform, you could provide the factors
   for that platform to the driver using platform data.

> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +	unsigned int val = (multi[index] * data->volt[index] * 330) / 256;
> +
> +	return sprintf(buf, "%u\n", val);
> +}
> +
> +static ssize_t show_temp_value(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +	int value = data->temp_input[index];
> +
> +	/* 00h Temperature = Sensor Error */
> +	return sprintf(buf, "%d\n", value > 0 ? (value - 64) * 1000 : 0);
> +}
> +
> +static ssize_t show_temp_fault(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +
> +	/* 00h Temperature = Sensor Error */
> +	return sprintf(buf, "%d\n", data->temp_input[index] == 0);
> +}
> +
> +static ssize_t show_temp_alarm(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +
> +	return sprintf(buf, "%u\n", data->temp_alarm[index]);
> +}
> +
> +static ssize_t
> +clear_temp_alarm(struct device *dev, struct device_attribute *devattr,
> +				 const char *buf, size_t count)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +	unsigned long val;
> +	unsigned char reg;
> +
> +	if (kstrtoul(buf, 10, &val) || val != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->update_lock);
> +	reg = ftsteutates_read_byte(data->client,
> +				    FTSTEUTATES_REG_TEMP_control[index]);
> +	if(reg < 0) {
> +		dev_err(dev, "couldn't read temp control register\n");
> +		count = -EIO;

Please return the error code reported by ftsteutates_read_byte(),
and please drop the error messages.

> +		goto error;
> +	}
> +
> +	val = ftsteutates_write_byte(data->client,
> +				     FTSTEUTATES_REG_TEMP_control[index],
> +				     reg | 0x1);
> +	if(val < 0) {
> +		dev_err(dev, "couldn't read temp control register\n");
> +		count = -EIO;

Same here.

> +		goto error;
> +	}
> +	data->valid = 0;

		= false;

> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
> +
> +static umode_t ftsteutates_fan_isvisible(struct kobject *kobj,
> +					 struct attribute *attr, int index)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +	struct device_attribute *dev_attr = container_of(attr,
> +						struct device_attribute, attr);
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(dev_attr);
> +	umode_t ret = attr->mode;
> +
> +	if(!data->valid || !data->fan_present[sattr->index])
> +		ret = 0;
> +

That doesn't work. With your code, both data->valid and data->fan_present[]
are updated at runtime. Unless there is some other means to detect if a fan
is present, you'll have to always display all fan attributes.
No worries, you are in good company.

> +	return ret;
> +}
> +
> +static ssize_t show_fan_value(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);

Here is where you should check if ftsteutates_update_device(dev) returned an error.

	if (ERR_PTR(data)
		return PTR_ERR(data);

> +
> +	return sprintf(buf, "%u\n", data->fan_input[index] * 60);
> +}
> +
> +static ssize_t show_fan_source(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +
> +	if (data->fan_present[index]) {
> +		if (data->fan_source[index] == 0xFF)
> +			return sprintf(buf, "none\n");
> +		else
> +			return sprintf(buf, "%d\n", data->fan_source[index]);

fan_source is u8 -> %u

> +	} else
> +		return sprintf(buf, "-\n");

Should be "none". Per datasheet, the chip should return 0xff in this case.
I would suggest to drop the "if (data->fan_present[index])" here and just
report what the chip reports.

Side note: coding style error. Should be
	} else {
		...
	}

> +}
> +
> +static ssize_t show_fan_alarm(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +
> +	return sprintf(buf, "%d\n", data->fan_alarm[index]);
> +}
> +
> +static ssize_t
> +clear_fan_alarm(struct device *dev, struct device_attribute *devattr,
> +				const char *buf, size_t count)
> +{
> +	int index = to_sensor_dev_attr(devattr)->index;
> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
> +	unsigned long val;
> +	unsigned char reg;
> +
> +	if (kstrtoul(buf, 10, &val) || val != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->update_lock);
> +	reg = ftsteutates_read_byte(data->client,
> +		FTSTEUTATES_REG_FAN_control[index]);
> +	if(reg < 0) {
> +		dev_err(dev, "couldn't read fan control register\n");
> +		count = -EIO;

Like everywhere else, please return the original error code.

> +		goto error;
> +	}
> +
> +	val = ftsteutates_write_byte(data->client,
> +		FTSTEUTATES_REG_FAN_control[index], reg | 0x1);
> +	if(val < 0) {
> +		dev_err(dev, "couldn't write fan control register\n");
> +		count = -EIO;
> +		goto error;
> +	}
> +	data->valid = 0;

		= false;

> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
> +
> +/*****************************************************************************/
> +/* SysFS structs							     */
> +/*****************************************************************************/
> +temp_sysfs_attr_group(1);
> +temp_sysfs_attr_group(2);
> +temp_sysfs_attr_group(3);
> +temp_sysfs_attr_group(4);
> +temp_sysfs_attr_group(5);
> +temp_sysfs_attr_group(6);
> +temp_sysfs_attr_group(7);
> +temp_sysfs_attr_group(8);
> +temp_sysfs_attr_group(9);
> +temp_sysfs_attr_group(10);
> +temp_sysfs_attr_group(11);
> +temp_sysfs_attr_group(12);
> +temp_sysfs_attr_group(13);
> +temp_sysfs_attr_group(14);
> +temp_sysfs_attr_group(15);
> +temp_sysfs_attr_group(16);
> +
> +fan_sysfs_attr_group(1);
> +fan_sysfs_attr_group(2);
> +fan_sysfs_attr_group(3);
> +fan_sysfs_attr_group(4);
> +fan_sysfs_attr_group(5);
> +fan_sysfs_attr_group(6);
> +fan_sysfs_attr_group(7);
> +fan_sysfs_attr_group(8);
> +

The idea with is_visible is to have one group, not lots of groups. The is_visible
function get the index from the passed device attribute, and use it to determine
if an attribute should be visible or not. Please see examples in other drivers.
In this case, it might make sense to have a group for temperature sensors, a group
for fans, and a group for voltages, but not a group per fan and per temperature sensor.

> +static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_in_value, NULL, 0);
> +static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_in_value, NULL, 1);
> +static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_in_value, NULL, 2);
> +static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_in_value, NULL, 3);
> +static struct attribute *ftsteutates_voltage_attrs[] = {
> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_in2_input.dev_attr.attr,
> +	&sensor_dev_attr_in3_input.dev_attr.attr,
> +	&sensor_dev_attr_in4_input.dev_attr.attr,
> +	NULL
> +};
> +static struct attribute_group ftsteutates_voltage_attrs_group = {
> +	.attrs = ftsteutates_voltage_attrs
> +};
> +
> +static const struct attribute_group *ftsteutates_attr_groups[] = {
> +	&ftsteutates_voltage_attrs_group,
> +	&ftsteutates_temp1_attrs_group,
> +	&ftsteutates_temp2_attrs_group,
> +	&ftsteutates_temp3_attrs_group,
> +	&ftsteutates_temp4_attrs_group,
> +	&ftsteutates_temp5_attrs_group,
> +	&ftsteutates_temp6_attrs_group,
> +	&ftsteutates_temp7_attrs_group,
> +	&ftsteutates_temp8_attrs_group,
> +	&ftsteutates_temp9_attrs_group,
> +	&ftsteutates_temp10_attrs_group,
> +	&ftsteutates_temp11_attrs_group,
> +	&ftsteutates_temp12_attrs_group,
> +	&ftsteutates_temp13_attrs_group,
> +	&ftsteutates_temp14_attrs_group,
> +	&ftsteutates_temp15_attrs_group,
> +	&ftsteutates_temp16_attrs_group,
> +	&ftsteutates_fan1_attrs_group,
> +	&ftsteutates_fan2_attrs_group,
> +	&ftsteutates_fan3_attrs_group,
> +	&ftsteutates_fan4_attrs_group,
> +	&ftsteutates_fan5_attrs_group,
> +	&ftsteutates_fan6_attrs_group,
> +	&ftsteutates_fan7_attrs_group,
> +	&ftsteutates_fan8_attrs_group,
> +	NULL
> +};
> +
> +/*****************************************************************************/
> +/* Module initialization / remove functions				     */
> +/*****************************************************************************/
> +static int ftsteutates_detect(struct i2c_client *client,
> +			      struct i2c_board_info *info)
> +{
> +	int val = ftsteutates_read_byte(client, FTSTEUTATES_DEVICE_ID_REG);
> +
> +	/* Baseboard Management Controller */
> +	if (val > 0 && (val & 0xF0) == 0x10) {
> +		switch (val & 0x0F) {
> +		case 0x01:
> +			strlcpy(info->type, ftsteutates_id[0].name,
> +			I2C_NAME_SIZE);
> +			info->flags = 0;
> +			return 0;
> +		}
> +	}
> +	return -ENODEV;
> +}
> +
As mentioned earlier, please drop the detect function.
There is no reliable means to detect the chip.

> +static int ftsteutates_remove(struct i2c_client *client)
> +{
> +	if(watchdog_initialized) {

Hmm ... please run your patch through checkpatch.

total: 19 errors, 1 warnings, 22 checks, 779 lines checked

is a bit on the high side. There should be no warnings, no errors, and a limited
(and explainable) number of checks.

> +		watchdog_unregister_device(&ftsteutates_wdt);
> +		ftsteutates_wdt_stop(&ftsteutates_wdt);
> +	}
> +	return 0;
> +}
> +
> +static int ftsteutates_watchdog_init(struct ftsteutates_data *data)
> +{
> +	int ret;
> +
> +	ret = ftsteutates_read_byte(data->client,
> +				    FTSTEUTATES_WATCHDOG_CONTROL);
> +	if(ret < 0) {
> +		dev_err(&data->client->dev,
> +			"couldn't read watchdog control register\n");

You display another error message on return from this function, which I think is
sufficient.

> +		return ret;
> +	}
> +
> +	ret = ftsteutates_write_byte(data->client,
> +				     FTSTEUTATES_WATCHDOG_CONTROL,
> +				     ret | 0x2);

Please add a comment here and describe that you are setting 1-second resolution.
Also please use BIT() where appropriate.

> +	if(ret < 0) {
> +		dev_err(&data->client->dev,
> +			"couldn't set watchdog resolution\n");
> +		return ret;
> +	}
> +
> +	ret = ftsteutates_read_byte(data->client,
> +				    FTSTEUTATES_WATCHDOG_TIME_PRESET);
> +	if(ret < 0) {
> +		dev_err(&data->client->dev,
> +			"couldn't read watchdog time preset register\n");
> +		return ret;
> +	}
> +
> +	/* Register our watchdog part */
> +	ftsteutates_wdt.parent = &data->client->dev;
> +	ftsteutates_wdt.timeout = ret * FTSTEUTATES_WATCHDOG_RESOLUTION;

This sets 'timeout' to 0 if the watchdog is disabled. I don't think
this is what you want, or is it ?

Also, if the register is != 0, doesn't that mean that the watchdog is
already running ? If so, you should tell the watchdog core about it
by setting the WDOG_HW_RUNNING flag and by setting max_hw_heartbeat_ms
instead of max_timeout.

> +	ftsteutates_wdt.min_timeout = FTSTEUTATES_WATCHDOG_RESOLUTION * 1;
> +	ftsteutates_wdt.max_timeout = FTSTEUTATES_WATCHDOG_RESOLUTION * 0xFF;
> +	watchdog_set_drvdata(&ftsteutates_wdt, data);
> +	ret = watchdog_register_device(&ftsteutates_wdt);
> +	return ret;
> +}
> +
> +static int ftsteutates_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{
> +	u8 revision;
> +	struct ftsteutates_data *data;
> +	int err;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct ftsteutates_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->update_lock);
> +	data->client = client;
> +
> +	revision = ftsteutates_read_byte(client,
> +					 FTSTEUTATES_DEVICE_REVISION_REG);
> +	if(revision < 0) {

Be careful with your error checks. revision is u8, which is never < 0.

> +		dev_err(&client->dev,
> +			"couldn't read device revision register\n");
> +		return revision;
> +	}
> +
> +	data->hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
> +					"ftsteutates", data,
> +					ftsteutates_attr_groups);
> +	if (IS_ERR(data->hwmon_dev)) {
> +		err = PTR_ERR(data->hwmon_dev);
> +		dev_err(&client->dev, "could not register hwmon device\n");
> +		goto exit_detach;

Unnecessary. Just return the error.

> +	}
> +
> +	err = ftsteutates_watchdog_init(data);
> +	if (err) {
> +		dev_err(&client->dev,
> +			"Registering watchdog device failed: %d\n", err);
> +		goto exit_detach;

Unnecessary. Just return the error.

> +	}
> +	watchdog_initialized = 1;

No global variables, please. Besides, I don't think the variable is needed
in the first place.

> +
> +	dev_info(&client->dev, "Detected FTS Teutates chip, revision: %d.%d\n",
> +		 (revision & 0xF0)>>4, revision & 0x0F);
> +	return 0;
> +
> +exit_detach:
> +	ftsteutates_remove(client); /* will also free data for us */
> +	return err;
> +}
> +
> +/*****************************************************************************/
> +/* Module Details							     */
> +/*****************************************************************************/
> +static struct i2c_driver ftsteutates_driver = {
> +	.class	  = I2C_CLASS_HWMON,

Not needed if there is no detect function.

> +	.driver = {
> +		.name	 = "ftsteutates",
> +	},
> +	.id_table	= ftsteutates_id,
> +	.probe	  = ftsteutates_probe,
> +	.remove	   = ftsteutates_remove,
> +	.detect	   = ftsteutates_detect,
> +	.address_list = normal_i2c,
> +};
> +
> +module_i2c_driver(ftsteutates_driver);
> +
> +MODULE_AUTHOR("Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>");
> +MODULE_DESCRIPTION("FTS Teutates driver");
> +MODULE_LICENSE("GPL");
>

