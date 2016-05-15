Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49569 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753994AbcEOBeJ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 14 May 2016 21:34:09 -0400
Subject: Re: [PATCH 1/1 v2] hwmon: add support for Sensirion SHT3x sensors
To: Pascal Sachs <pascalsachs@gmail.com>, jdelvare@suse.com
References: <1461573746-13767-1-git-send-email-pascalsachs@gmail.com>
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Frey <david.frey@sensirion.com>,
	Pascal Sachs <pascal.sachs@sensirion.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5737D209.1020506@roeck-us.net>
Date: Sat, 14 May 2016 18:34:01 -0700
MIME-Version: 1.0
In-Reply-To: <1461573746-13767-1-git-send-email-pascalsachs@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/25/2016 01:42 AM, Pascal Sachs wrote:
> From: David Frey <david.frey@sensirion.com>
>
> This driver implements support for the Sensirion SHT3x-DIS chip,
> a humidity and temperature sensor. Temperature is measured
> in degrees celsius, relative humidity is expressed as a percentage.
> In the sysfs interface, all values are scaled by 1000,
> i.e. the value for 31.5 degrees celsius is 31500.
>
> Signed-off-by: Pascal Sachs <pascal.sachs@sensirion.com>
> ---
> Patch was generated against kernel v4.6-rc5
>
>   Documentation/hwmon/sht3x           |  66 ++++
>   drivers/hwmon/Kconfig               |  10 +
>   drivers/hwmon/Makefile              |   1 +
>   drivers/hwmon/sht3x.c               | 675 ++++++++++++++++++++++++++++++++++++
>   drivers/hwmon/twl4030-madc-hwmon.c  |   1 +

Please drop this change.

>   include/linux/platform_data/sht3x.h |  25 ++
>   6 files changed, 778 insertions(+)
>   create mode 100644 Documentation/hwmon/sht3x
>   create mode 100644 drivers/hwmon/sht3x.c
>   create mode 100644 include/linux/platform_data/sht3x.h
>

Please run checkpatch --strict over your patch. There are lots of
unnecessary/undesirable empty lines and spaces. It would also tell you
about the presumably left-over FIXME in twl4030-madc-hwmon.c.

> diff --git a/Documentation/hwmon/sht3x b/Documentation/hwmon/sht3x
> new file mode 100644
> index 0000000..c04748d
> --- /dev/null
> +++ b/Documentation/hwmon/sht3x
> @@ -0,0 +1,66 @@
> +Kernel driver sht3x
> +===================
> +
> +Supported chips:
> +  * Sensirion SHT3x-DIS
> +    Prefix: 'sht3x'
> +    Addresses scanned: none
> +    Datasheet: http://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/Humidity/Sensirion_Humidity_Datasheet_SHT3x_DIS.pdf
> +
> +Author:
> +  David Frey <david.frey@sensirion.com>
> +  Pascal Sachs <pascal.sachs@sensirion.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for the Sensirion SHT3x-DIS chip, a humidity
> +and temperature sensor. Temperature is measured in degrees celsius, relative
> +humidity is expressed as a percentage. In the sysfs interface, all values are
> +scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
> +
> +The device communicates with the I2C protocol. Sensors can have the I2C
> +addresses 0x44 or 0x45, depending on the wiring. See
> +Documentation/i2c/instantiating-devices for methods to instantiate the device.
> +
> +There are two options configurable by means of sht3x_platform_data:
> +1. blocking (pull the I2C clock line down while performing the measurement) or
> +   non-blocking mode. Blocking mode will guarantee the fastest result but
> +   the I2C bus will be busy during that time. By default, non-blocking mode
> +   is used. Make sure clock-stretching works properly on your device if you
> +   want to use blocking mode.
> +2. high or low accuracy. High accuracy is used by default and using it is
> +   strongly recommended.
> +
> +The sht3x sensor supports a single shot mode as well as 5 periodic measure
> +modes, which can be controlled with the frequency sysfs interface.
> +The allowed frequencies are as follows:
> +  *     0  single shot mode
> +  *   500   0.5 Hz periodic measurement
> +  *  1000   1   Hz periodic measurement
> +  *  2000   2   Hz periodic measurement
> +  *  4000   4   Hz periodic measurement
> +  * 10000  10   Hz periodic measurement
> +
> +While in periodic measure mode, read out of humidity and temperature values are
> +not supported. Nevertheless it is possible to read out the values with maximal

Really ? I seem to be missing this in the datasheet. Section 4.4 suggests that
both are supported. Besides, this would be really odd - what would be the point
of periodic mode (or any mode, for that matter) if it doesn't really measure
anything ?

> +the same frequency as the periodic measure mode.

This text does not really make sense to me. Should one of those "periodic" be
"single shot" ?

> +
> +sysfs-Interface
> +---------------
> +
> +temp1_input:        temperature input
> +humidity1_input:    humidity input
> +temp1_max:          temperature max value
> +temp1_max_hyst:     temperature hysteresis value for max limit
> +humidity1_max:      humidity max value
> +humidity1_max_hyst: humidity hysteresis value for max limit
> +temp1_min:          temperature min value
> +temp1_min_hyst:     temperature hysteresis value for min limit
> +humidity1_min:      humidity min value
> +humidity1_min_hyst: humidity hysteresis value for min limit
> +frequency:          Measurement frequency, 0 for single shot, frequency in
> +                    mHz for periodic measurement

Please use standard attributes (update_interval).

> +soft_reset:         Soft reset the internal state of the sensor, clear the
> +                    status register, clear the alert and switch back to
> +                    single shot mode

Makes me really unhappy. It is not a standard attribute, there is no clear
indication why it is needed, and it affects other attributes (mode)
without updating the command pointer, thus probably breaking things.

In general, if the chip is that unstable that it needs to be reset
once in a while, that should be auto-detected if possible and be handled
automatically. A manual "please reset me" attribute is the worst possible
solution and should only be used if absolutely necessary.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5c2d13a..76f4c53 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1254,6 +1254,16 @@ config SENSORS_SHT21
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called sht21.
>
> +config SENSORS_SHT3x
> +	tristate "Sensiron humidity and temperature sensors. SHT3x and compat."
> +	depends on I2C && CRC8

Per lib/Kconfig, drivers are supposed to select CRC8 if it is needed.

[ Kind of surprising that it doesn't seem to be used anywhere, but maybe
   I am missing something. ]

> +	help
> +	  If you say yes here you get support for the Sensiron SHT30 and SHT31
> +	  humidity and temperature sensors.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sht3x.
> +
>   config SENSORS_SHTC1
>   	tristate "Sensiron humidity and temperature sensors. SHTC1 and compat."
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 58cc3ac..999ff2d 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -137,6 +137,7 @@ obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>   obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
>   obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
>   obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
> +obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
>   obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
>   obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
>   obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> new file mode 100644
> index 0000000..97f72b8
> --- /dev/null
> +++ b/drivers/hwmon/sht3x.c
> @@ -0,0 +1,675 @@
> +/* Sensirion SHT3x-DIS humidity and temperature sensor driver.
> + * The SHT3x comes in many different versions, this driver is for the
> + * I2C version only.
> + *
> + * Copyright (C) 2016 Sensirion AG, Switzerland
> + * Author: David Frey <david.frey@sensirion.com>
> + * Author: Pascal Sachs <pascal.sachs@sensirion.com>
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
> +
> +#include <asm/page.h>
> +#include <linux/crc8.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/platform_data/sht3x.h>
> +
> +/* commands (high precision mode) */
> +static const unsigned char sht3x_cmd_measure_blocking_hpm[]    = { 0x2c, 0x06 };
> +static const unsigned char sht3x_cmd_measure_nonblocking_hpm[] = { 0x24, 0x00 };
> +
> +/* commands (low power mode) */
> +static const unsigned char sht3x_cmd_measure_blocking_lpm[]    = { 0x2c, 0x10 };
> +static const unsigned char sht3x_cmd_measure_nonblocking_lpm[] = { 0x24, 0x16 };
> +
> +/* commands for periodic mode */
> +static const unsigned char sht3x_cmd_measure_periodic_mode[]   = { 0xe0, 0x00 };
> +static const unsigned char sht3x_cmd_break[]                   = { 0x30, 0x93 };
> +
> +/* other commands */
> +static const unsigned char sht3x_cmd_clear_status_reg[]        = { 0x30, 0x41 };
> +static const unsigned char sht3x_cmd_soft_reset[]              = { 0x30, 0xa2 };
> +
> +/* delays for non-blocking i2c commands, both in us */
> +#define SHT3X_NONBLOCKING_WAIT_TIME_HPM  15000
> +#define SHT3X_NONBLOCKING_WAIT_TIME_LPM   4000
> +
> +#define SHT3X_WORD_LEN         2
> +#define SHT3X_CMD_LENGTH       2
> +#define SHT3X_CRC8_LEN         1
> +#define SHT3X_RESPONSE_LENGTH  6
> +#define SHT3X_CRC8_LEN         1

Defined twice.

> +#define SHT3X_CRC8_POLYNOMIAL  0x31
> +#define SHT3X_CRC8_INIT        0xFF
> +#define SHT3X_ID_SHT           0
> +#define SHT3X_ID_STS           1

Please use an enum for the IDs.

> +
> +DECLARE_CRC8_TABLE(sht3x_crc8_table);
> +
> +/* periodic measure commands (high precision mode) */
> +static const char periodic_measure_commands_hpm[][SHT3X_CMD_LENGTH] = {
> +	/* 0.5 measurements per second */
> +	{0x20, 0x32},
> +	/* 1 measurements per second */
> +	{0x21, 0x30},
> +	/* 2 measurements per second */
> +	{0x22, 0x36},
> +	/* 4 measurements per second */
> +	{0x23, 0x34},
> +	/* 10 measurements per second */
> +	{0x27, 0x37},
> +};
> +
> +/* periodic measure commands (low power mode) */
> +static const char periodic_measure_commands_lpm[][SHT3X_CMD_LENGTH] = {
> +	/* 0.5 measurements per second */
> +	{0x20, 0x2f},
> +	/* 1 measurements per second */
> +	{0x21, 0x2d},
> +	/* 2 measurements per second */
> +	{0x22, 0x2b},
> +	/* 4 measurements per second */
> +	{0x23, 0x29},
> +	/* 10 measurements per second */
> +	{0x27, 0x2a},
> +};
> +
> +struct sht3x_alert_commands {
> +	const char read_command[SHT3X_CMD_LENGTH];
> +	const char write_command[SHT3X_CMD_LENGTH];
> +};
> +
> +const struct sht3x_alert_commands alert_commands[] = {
> +	/* temp1_max, humidity1_max */
> +	{ {0xe1, 0x1f}, {0x61, 0x1d} },
> +	/* temp_1_max_hyst, humidity1_max_hyst */
> +	{ {0xe1, 0x14}, {0x61, 0x16} },
> +	/* temp1_min, humidity1_min */
> +	{ {0xe1, 0x02}, {0x61, 0x00} },
> +	/* temp_1_min_hyst, humidity1_min_hyst */
> +	{ {0xe1, 0x09}, {0x61, 0x0B} },
> +};
> +
> +
> +static const u16 mode_to_frequency[] = {
> +	    0,
> +	  500,
> +	 1000,
> +	 2000,
> +	 4000,
> +	10000,
> +};
> +
> +struct sht3x_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +
> +	u8 mode;
> +	const unsigned char *command;
> +	u32 wait_time;			/* in us*/
> +
> +	struct sht3x_platform_data setup;
> +
> +	int temperature;	/* 1000 * temperature in dgr C */
> +	u32 humidity;		/* 1000 * relative humidity in %RH */
> +};
> +
> +
> +static int find_index(const u16 *list, size_t size, u16 value)
> +{

Two of those parameters are really constants, since only mode_to_frequency[]
and its size are passed as argument. Please reference the array directly.

> +	size_t index = 0;
> +
> +	while (index < size && list[index] != value)
> +		index++;
> +
> +	return index == size ? -1 : index;

If you return an error, please use a proper error code,
and pass it on in the calling code.

I would suggest, however, to implement a best-match algorithm instead
of expecting the user to find valid values.

> +}
> +
> +static int sht3x_read_from_command(struct i2c_client *client,
> +				   struct sht3x_data *data,
> +				   const char *command,
> +				   char *buf, int length, u32 wait_time)
> +{
> +	int ret;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	ret = i2c_master_send(client, command, SHT3X_CMD_LENGTH);
> +
> +	if (ret != SHT3X_CMD_LENGTH) {
> +		ret = ret < 0 ? ret : -EIO;
> +		goto out;
> +	}
> +
> +	if (wait_time)
> +		usleep_range(wait_time, wait_time + 1000);
> +
> +	ret = i2c_master_recv(client, buf, length);
> +	if (ret != length) {
> +		ret = ret < 0 ? ret : -EIO;
> +		goto out;
> +	}
> +
> +	ret = 0;
> +out:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +
> +}
> +
> +static int sht3x_extract_temperature(u16 raw)
> +{
> +	/*
> +	 * From datasheet:
> +	 * T = -45 + 175 * ST / 2^16
> +	 * Adapted for integer fixed point (3 digit) arithmetic.
> +	 */
> +	return ((21875 * (int)raw) >> 13) - 45000;
> +}
> +
> +static u32 sht3x_extract_humidity(u16 raw)
> +{
> +	/*
> +	 * From datasheet:
> +	 * RH = 100 * SRH / 2^16
> +	 * Adapted for integer fixed point (3 digit) arithmetic.
> +	 */
> +	return (12500 * (int)raw) >> 13;
> +}
> +
> +/* sysfs attributes */
> +static struct sht3x_data *sht3x_update_client(struct device *dev)
> +{
> +	struct sht3x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned char buf[SHT3X_RESPONSE_LENGTH];
> +	u16 val;
> +	int ret;
> +
> +	ret = sht3x_read_from_command(client, data,  data->command,
> +				      buf, sizeof(buf), data->wait_time);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	val = be16_to_cpup((__be16 *) buf);
> +	data->temperature = sht3x_extract_temperature(val);
> +	val = be16_to_cpup((__be16 *) (buf + 3));
> +	data->humidity = sht3x_extract_humidity(val);
> +
Having this code not mutex-protected means that the variables can have
more or less random values if there are multiple readers.

> +	return data;
> +}
> +
> +static ssize_t temp1_input_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct sht3x_data *data = sht3x_update_client(dev);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return sprintf(buf, "%d\n", data->temperature);
> +}
> +
> +static ssize_t humidity1_input_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct sht3x_data *data = sht3x_update_client(dev);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return sprintf(buf, "%d\n", data->humidity);
> +}
> +
> +static int alert_read_raw(struct device *dev,
> +			  struct device_attribute *attr,
> +			  char *buffer, int length)
> +{
> +	int ret;
> +	u8 index;
> +	const struct sht3x_alert_commands *commands;
> +	struct sht3x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +
> +	index = to_sensor_dev_attr(attr)->index;
> +	commands = &alert_commands[index];
> +
> +	ret = sht3x_read_from_command(client, data, commands->read_command,
> +				      buffer, length, 0);

Normally, limit temperatures don't change. Reading it from the chip
repeatedly doesn't really add much if any value, and in this case will
cause substantial latencies. Why not just cache the values ? This
would also simplify and speed up changing values a lot.

> +
> +	return ret;
> +}
> +
> +static ssize_t temp1_alert_read(struct device *dev,
> +				struct device_attribute *attr,
> +				int *temperature)
> +{
> +	int ret;
> +	u16 raw;
> +	char buffer[SHT3X_RESPONSE_LENGTH];
> +
> +	ret = alert_read_raw(dev, attr, buffer, SHT3X_RESPONSE_LENGTH);
> +	if (ret)
> +		return ret;
> +
> +	raw = be16_to_cpup((__be16 *) buffer);
> +
> +	/*
> +	 * lower 9 bits are temperature MSB
> +	 */
> +	*temperature = sht3x_extract_temperature((raw & 0x01ff) << 7);
> +
> +	return 0;
> +}
> +
> +
> +static ssize_t temp1_alert_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	int ret;
> +	int temperature;
> +
> +	ret = temp1_alert_read(dev, attr, &temperature);
> +	if (ret)
> +		return ret;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", temperature);
> +}
> +
> +
> +static ssize_t humidity1_alert_read(struct device *dev,
> +				    struct device_attribute *attr,
> +				    u32 *humidity)
> +{
> +	int ret;
> +	u16 raw;
> +	char buffer[SHT3X_RESPONSE_LENGTH];
> +
> +	ret = alert_read_raw(dev, attr, buffer, SHT3X_RESPONSE_LENGTH);
> +	if (ret)
> +		return ret;
> +
> +	raw = be16_to_cpup((__be16 *) buffer);
> +
> +	/*
> +	 * top 7 bits are the humidity MSB,
> +	 */
> +	*humidity = sht3x_extract_humidity(raw & 0xfe00);
> +
> +	return 0;
> +}
> +
> +static ssize_t humidity1_alert_show(struct device *dev,
> +				    struct device_attribute *attr,
> +				    char *buf)
> +{
> +	int ret;
> +	u32 humidity;
> +
> +	ret = humidity1_alert_read(dev, attr, &humidity);
> +	if (ret)
> +		return ret;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", humidity);
> +}
> +
> +static size_t alert_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  size_t count,
> +			  int temperature,
> +			  u32 humidity)
> +{
> +	char buffer[SHT3X_CMD_LENGTH + SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
> +	char *position = buffer;
> +	int ret;
> +	u16 raw;
> +	u8 index;
> +	struct sht3x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	const struct sht3x_alert_commands *commands;
> +
> +	index = to_sensor_dev_attr(attr)->index;
> +	commands = &alert_commands[index];
> +
> +	memcpy(position, commands->write_command, SHT3X_CMD_LENGTH);
> +	position += SHT3X_CMD_LENGTH;
> +	/*
> +	 * ST = (T + 45) / 175 * 2^16
> +	 * SRH = RH / 100 * 2^16
> +	 * adapted for fixed point arithmetic and packed the same as
> +	 * in alert_show()
> +	 */
> +	raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
> +	raw |= (((u32)humidity * 42950) >> 16) & 0xfe00;

humidity is already u32.

> +
> +	*(__be16 *)(position) = cpu_to_be16(raw);
> +	position += SHT3X_WORD_LEN;
> +	*position = crc8(sht3x_crc8_table,
> +			 (position - SHT3X_WORD_LEN),

Unnecessary ( )

> +			 SHT3X_WORD_LEN,
> +			 SHT3X_CRC8_INIT);
> +
> +
> +	ret = i2c_master_send(client, buffer, sizeof(buffer));
> +	if (ret != sizeof(buffer))
> +		return ret < 0 ? ret : -EIO;
> +
> +	return count;
> +
> +}
> +
> +static ssize_t temp1_alert_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf,
> +				 size_t count)
> +{
> +	int temperature;
> +	u32 humidity;
> +	int ret;
> +
> +	ret = kstrtoint(buf, 0, &temperature);
> +
> +	if (ret)
> +		return -EINVAL;
> +
> +	temperature = clamp_val(temperature, -45000, 130000);
> +
> +	/*
> +	 * use old humidity alert value since we can only update
> +	 * temperature and humidity alerts together
> +	 */
> +	ret = humidity1_alert_read(dev, attr, &humidity);
> +	if (ret)
> +		return ret;
> +
> +	ret = alert_store(dev, attr, count, temperature, humidity);
> +
> +	return ret;
> +}
> +
> +static ssize_t humidity1_alert_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf,
> +				     size_t count)
> +{
> +	int temperature;
> +	u32 humidity;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 0, &humidity);
> +
> +	if (ret)
> +		return -EINVAL;
> +
> +	humidity = clamp_val(humidity, 0, 100000);
> +
> +	/*
> +	 * use old temperature alert value since we can only update
> +	 * temperature and humidity alerts together
> +	 */
> +	ret = temp1_alert_read(dev, attr, &temperature);
> +	if (ret)
> +		return ret;
> +
> +	ret = alert_store(dev, attr, count, temperature, humidity);
> +
> +	return ret;
> +}
> +
> +static void sht3x_select_command(struct sht3x_data *data)
> +{
> +	/*
> +	 * In blocking mode (clock stretching mode) the I2C bus
> +	 * is blocked for other traffic, thus the call to i2c_master_recv()
> +	 * will wait until the data is ready. For non blocking mode, we
> +	 * have to wait ourselves.
> +	 */
> +	if (data->mode > 0) {
> +		data->command = sht3x_cmd_measure_periodic_mode;
> +		data->wait_time = 0;
> +	} else if (data->setup.blocking_io) {
> +		data->command = data->setup.high_precision ?
> +				sht3x_cmd_measure_blocking_hpm :
> +				sht3x_cmd_measure_blocking_lpm;
> +		data->wait_time = 0;
> +	} else {
> +		if (data->setup.high_precision) {
> +			data->command = sht3x_cmd_measure_nonblocking_hpm;
> +			data->wait_time = SHT3X_NONBLOCKING_WAIT_TIME_HPM;
> +		} else {
> +			data->command = sht3x_cmd_measure_nonblocking_lpm;
> +			data->wait_time = SHT3X_NONBLOCKING_WAIT_TIME_LPM;
> +		}
> +	}
> +}
> +
> +static ssize_t frequency_show(struct device *dev,
> +			      struct device_attribute *attr,
> +			      char *buf) {
> +	struct sht3x_data *data = dev_get_drvdata(dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", mode_to_frequency[data->mode]);
> +}
> +
> +static ssize_t frequency_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf,
> +			       size_t count) {
> +	u16 frequency;
> +	int mode;
> +	int ret;
> +	const char *command;
> +	struct sht3x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +
> +	ret = kstrtou16(buf, 0, &frequency);
> +
> +	if (ret)
> +		return -EINVAL;
> +
> +	mode = find_index(mode_to_frequency, sizeof(mode_to_frequency),
> +			  frequency);
> +
> +	/* invalid frequency */
> +	if (mode < 0)
> +		return -EINVAL;
> +
> +	/* mode did not change */
> +	if (mode == data->mode)
> +		return count;
> +
> +	/* abort periodic measure */
> +	ret = i2c_master_send(client, sht3x_cmd_break, SHT3X_CMD_LENGTH);
> +	if (ret != SHT3X_CMD_LENGTH)
> +		return ret < 0 ? ret : -EIO;
> +	data->mode = 0;
> +
> +	if (mode > 0) {
> +		if (data->setup.high_precision)
> +			command = periodic_measure_commands_hpm[mode - 1];
> +		else
> +			command = periodic_measure_commands_lpm[mode - 1];
> +
> +		/* select mode */
> +		ret = i2c_master_send(client, command, SHT3X_CMD_LENGTH);
> +		if (ret != SHT3X_CMD_LENGTH)
> +			return ret < 0 ? ret : -EIO;
> +	}
> +
> +	/* select mode and command */
> +	data->mode = mode;
> +	sht3x_select_command(data);
> +
All that unprotected ? What happens if multiple processes write
different values in parallel ?

> +	return count;
> +}
> +
> +static ssize_t soft_reset(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *buf,
> +			  size_t count) {
> +	int ret;
> +	struct sht3x_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +
> +	/* break if in periodic measure mode */
> +	if (data->mode > 0) {
> +		ret = i2c_master_send(client, sht3x_cmd_break,
> +				      SHT3X_CMD_LENGTH);
> +		if (ret != SHT3X_CMD_LENGTH)
> +			return ret < 0 ? ret : -EIO;
> +		data->mode = 0;
> +	}
> +
> +	/* clear status register */
> +	ret = i2c_master_send(client, sht3x_cmd_clear_status_reg,
> +			      SHT3X_CMD_LENGTH);
> +	if (ret != SHT3X_CMD_LENGTH)
> +		return ret < 0 ? ret : -EIO;
> +
> +	/* soft reset */
> +	ret = i2c_master_send(client, sht3x_cmd_soft_reset, SHT3X_CMD_LENGTH);
> +	if (ret != SHT3X_CMD_LENGTH)
> +		return ret < 0 ? ret : -EIO;
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, temp1_input_show, NULL, 0);
> +static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, humidity1_input_show,
> +			  NULL, 0);
> +static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR, temp1_alert_show,
> +			  temp1_alert_store, 0);
> +static SENSOR_DEVICE_ATTR(humidity1_max, S_IRUGO | S_IWUSR,
> +			  humidity1_alert_show, humidity1_alert_store, 0);
> +static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR, temp1_alert_show,
> +			  temp1_alert_store, 1);
> +static SENSOR_DEVICE_ATTR(humidity1_max_hyst, S_IRUGO | S_IWUSR,
> +			  humidity1_alert_show, humidity1_alert_store, 1);
> +static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO | S_IWUSR, temp1_alert_show,
> +			  temp1_alert_store, 2);
> +static SENSOR_DEVICE_ATTR(humidity1_min, S_IRUGO | S_IWUSR,
> +			  humidity1_alert_show, humidity1_alert_store, 2);
> +static SENSOR_DEVICE_ATTR(temp1_min_hyst, S_IRUGO | S_IWUSR,
> +			  temp1_alert_show, temp1_alert_store, 3);
> +static SENSOR_DEVICE_ATTR(humidity1_min_hyst, S_IRUGO | S_IWUSR,
> +			  humidity1_alert_show, humidity1_alert_store, 3);
> +static SENSOR_DEVICE_ATTR(frequency, S_IRUGO | S_IWUSR, frequency_show,
> +			  frequency_store, 0);
> +static SENSOR_DEVICE_ATTR(soft_reset, S_IWUSR, NULL, soft_reset, 0);
> +
> +static struct attribute *sht3x_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_max.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_max_hyst.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_min.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_min_hyst.dev_attr.attr,
> +	&sensor_dev_attr_frequency.dev_attr.attr,
> +	&sensor_dev_attr_soft_reset.dev_attr.attr,

Limit attributes without alarm attributes is kind of unusual.
Looking into the datasheet, the chip does support a status register
with alert bits. Any reason for not providing alert attributes ?

> +	NULL
> +};
> +
> +static struct attribute *sts3x_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	NULL
> +};
> +
> +ATTRIBUTE_GROUPS(sht3x);
> +ATTRIBUTE_GROUPS(sts3x);
> +
> +static int sht3x_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	int ret;
> +	struct sht3x_data *data;
> +	struct device *hwmon_dev;
> +	struct i2c_adapter *adap = client->adapter;
> +	struct device *dev = &client->dev;
> +	const struct attribute_group **attribute_groups;
> +
> +	/*
> +	 * we require full i2c support since the sht3x uses multi-byte read and
> +	 * writes as well as multi-byte commands which are not supported by
> +	 * the smbus protocol
> +	 */
> +	if (!i2c_check_functionality(adap, I2C_FUNC_I2C))
> +		return -ENODEV;
> +
> +	ret = i2c_master_send(client, sht3x_cmd_clear_status_reg,
> +			      SHT3X_CMD_LENGTH);
> +	if (ret != SHT3X_CMD_LENGTH)
> +		return ret < 0 ? ret : -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->setup.blocking_io = false;
> +	data->setup.high_precision = true;
> +	data->mode = 0;
> +	data->client = client;
> +	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
> +
> +	if (client->dev.platform_data)
> +		data->setup = *(struct sht3x_platform_data *)dev->platform_data;
> +	sht3x_select_command(data);
> +	mutex_init(&data->update_lock);
> +
> +	if (id->driver_data == SHT3X_ID_STS)
> +		attribute_groups = sts3x_groups;
> +	else
> +		attribute_groups = sht3x_groups;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
> +			client->name,
> +			data, attribute_groups);
> +
> +	if (IS_ERR(hwmon_dev))
> +		dev_dbg(dev, "unable to register hwmon device\n");
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +/* device ID table */
> +static const struct i2c_device_id sht3x_id[] = {
> +	{"sht3x", SHT3X_ID_SHT},
> +	{"sts3x", SHT3X_ID_STS},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, sht3x_id);
> +
> +static struct i2c_driver sht3x_i2c_driver = {
> +	.driver.name = "sht3x",
> +	.probe       = sht3x_probe,
> +	.id_table    = sht3x_id,
> +};
> +
> +module_i2c_driver(sht3x_i2c_driver);
> +
> +MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
> +MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
> +MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/twl4030-madc-hwmon.c b/drivers/hwmon/twl4030-madc-hwmon.c
> index b5caf7f..8201173 100644
> --- a/drivers/hwmon/twl4030-madc-hwmon.c
> +++ b/drivers/hwmon/twl4030-madc-hwmon.c
> @@ -25,6 +25,7 @@
>    */
>   #include <linux/init.h>
>   #include <linux/module.h>
> +//FIXME this is used for clamp_val

Drop.

>   #include <linux/kernel.h>
>   #include <linux/i2c/twl.h>
>   #include <linux/device.h>
> diff --git a/include/linux/platform_data/sht3x.h b/include/linux/platform_data/sht3x.h
> new file mode 100644
> index 0000000..46af9a0
> --- /dev/null
> +++ b/include/linux/platform_data/sht3x.h
> @@ -0,0 +1,25 @@
> +/*
> + * Copyright (C) 2015 Sensirion AG, Switzerland
> + * Author: David Frey <david.frey@sensirion.com>
> + * Author: Pascal Sachs <pascal.sachs@sensirion.com>
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
> +
> +#ifndef __SHT3X_H_
> +#define __SHT3X_H_
> +
> +struct sht3x_platform_data {
> +	bool blocking_io;
> +	bool high_precision;
> +};
> +#endif /* __SHT3X_H_ */
>

