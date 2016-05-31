Return-path: <pascalsachs@gmail.com>
Subject: Re: [PATCH 1/1 v4] hwmon: add support for Sensirion SHT3x sensors
To: Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
References: <1464619588-3354-1-git-send-email-pascalsachs@gmail.com>
 <574C602E.1070702@roeck-us.net>
Cc: corbet@lwn.net, pascal.sachs@sensirion.com, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Frey <david.frey@sensirion.com>
From: Pascal Sachs <pascalsachs@gmail.com>
Message-ID: <574D386B.8020805@gmail.com>
Date: Tue, 31 May 2016 09:08:27 +0200
MIME-Version: 1.0
In-Reply-To: <574C602E.1070702@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter

I want to thank you again for the fast and detailed code review.
I really appreciate it.

Am 30.05.2016 um 17:45 schrieb Guenter Roeck:
> Hi Pascal,
>
> On 05/30/2016 07:46 AM, Pascal Sachs wrote:
>> From: David Frey <david.frey@sensirion.com>
>>
>> This driver implements support for the Sensirion SHT3x-DIS chip,
>> a humidity and temperature sensor. Temperature is measured
>> in degrees celsius, relative humidity is expressed as a percentage.
>> In the sysfs interface, all values are scaled by 1000,
>> i.e. the value for 31.5 degrees celsius is 31500.
>>
>
> Getting there. Mostly nitpicks this time.
>
>> Signed-off-by: Pascal Sachs <pascal.sachs@sensirion.com>
>> ---
>> Patch was generated against kernel v4.7-rc1
>>
> A changelog would be useful.
Sure, I will add one with the next submission
>
>
>>   Documentation/hwmon/sht3x           | 72 ++++
>>   drivers/hwmon/Kconfig               |  11 +
>>   drivers/hwmon/Makefile              |   1 +
>>   drivers/hwmon/sht3x.c               | 724 
>> ++++++++++++++++++++++++++++++++++++
>>   include/linux/platform_data/sht3x.h |  25 ++
>>   5 files changed, 833 insertions(+)
>>   create mode 100644 Documentation/hwmon/sht3x
>>   create mode 100644 drivers/hwmon/sht3x.c
>>   create mode 100644 include/linux/platform_data/sht3x.h
>>
>> diff --git a/Documentation/hwmon/sht3x b/Documentation/hwmon/sht3x
>> new file mode 100644
>> index 0000000..f5aa633
>> --- /dev/null
>> +++ b/Documentation/hwmon/sht3x
>> @@ -0,0 +1,72 @@
>> +Kernel driver sht3x
>> +===================
>> +
>> +Supported chips:
>> +  * Sensirion SHT3x-DIS
>> +    Prefix: 'sht3x'
>> +    Addresses scanned: none
>> +    Datasheet: 
>> http://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/Humidity/Sensirion_Humidity_Datasheet_SHT3x_DIS.pdf
>> +
>> +Author:
>> +  David Frey <david.frey@sensirion.com>
>> +  Pascal Sachs <pascal.sachs@sensirion.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for the Sensirion SHT3x-DIS chip, a 
>> humidity
>> +and temperature sensor. Temperature is measured in degrees celsius, 
>> relative
>> +humidity is expressed as a percentage. In the sysfs interface, all 
>> values are
>> +scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
>> +
>> +The device communicates with the I2C protocol. Sensors can have the I2C
>> +addresses 0x44 or 0x45, depending on the wiring. See
>> +Documentation/i2c/instantiating-devices for methods to instantiate 
>> the device.
>> +
>> +There are two options configurable by means of sht3x_platform_data:
>> +1. blocking (pull the I2C clock line down while performing the 
>> measurement) or
>> +   non-blocking mode. Blocking mode will guarantee the fastest 
>> result but
>> +   the I2C bus will be busy during that time. By default, 
>> non-blocking mode
>> +   is used. Make sure clock-stretching works properly on your device 
>> if you
>> +   want to use blocking mode.
>> +2. high or low accuracy. High accuracy is used by default and using 
>> it is
>> +   strongly recommended.
>> +
>> +The sht3x sensor supports a single shot mode as well as 5 periodic 
>> measure
>> +modes, which can be controlled with the update_interval sysfs 
>> interface.
>> +The allowed update_interval in milliseconds are as follows:
>> +  *     0   single shot mode
>> +  *  2000   0.5 Hz periodic measurement
>> +  *  1000   1   Hz periodic measurement
>> +  *   500   2   Hz periodic measurement
>> +  *   250   4   Hz periodic measurement
>> +  *   100  10   Hz periodic measurement
>> +
>> +In the periodic measure mode, the sensor automatically triggers a 
>> measurement
>> +with the configured update interval on the chip. When a temperature 
>> or humidity
>> +reading exceeds the configured limits, the alert attribute is set to 
>> 1 and
>> +the alert pin on the sensor is set to high.
>> +When the temperature and humidity readings move back between the 
>> hysteresis
>> +values, the alert bit is set to 0 and the alert pin on the sensor is 
>> set to
>> +low.
>> +
>> +sysfs-Interface
>> +---------------
>> +
>> +temp1_input:        temperature input
>> +humidity1_input:    humidity input
>> +temp1_max:          temperature max value
>> +temp1_max_hyst:     temperature hysteresis value for max limit
>> +humidity1_max:      humidity max value
>> +humidity1_max_hyst: humidity hysteresis value for max limit
>> +temp1_min:          temperature min value
>> +temp1_min_hyst:     temperature hysteresis value for min limit
>> +humidity1_min:      humidity min value
>> +humidity1_min_hyst: humidity hysteresis value for min limit
>> +temp1_alarm:        alarm flag is set to 1 if the temperature is 
>> outside the
>> +                    configured limits. Alarm only works in periodic 
>> measure mode
>> +humidity1_alarm:    alarm flag is set to 1 if the humidity is 
>> outside the
>> +                    configured limits. Alarm only works in periodic 
>> measure mode
>> +update_interval:    update interval, 0 for single shot, interval in 
>> msec
>> +                    for periodic measurement. If the interval is not 
>> supported
>> +                    by the sensor, the next faster interval is chosen
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index ff94007..e0be99a 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1265,6 +1265,17 @@ config SENSORS_SHT21
>>         This driver can also be built as a module.  If so, the module
>>         will be called sht21.
>>
>> +config SENSORS_SHT3x
>> +    tristate "Sensiron humidity and temperature sensors. SHT3x and 
>> compat."
>> +    depends on I2C
>> +    select CRC8
>> +    help
>> +      If you say yes here you get support for the Sensiron SHT30 and 
>> SHT31
>> +      humidity and temperature sensors.
>> +
>> +      This driver can also be built as a module.  If so, the module
>> +      will be called sht3x.
>> +
>>   config SENSORS_SHTC1
>>       tristate "Sensiron humidity and temperature sensors. SHTC1 and 
>> compat."
>>       depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 2ef5b7c..406b18b 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -138,6 +138,7 @@ obj-$(CONFIG_SENSORS_SCH5627)    += sch5627.o
>>   obj-$(CONFIG_SENSORS_SCH5636)    += sch5636.o
>>   obj-$(CONFIG_SENSORS_SHT15)    += sht15.o
>>   obj-$(CONFIG_SENSORS_SHT21)    += sht21.o
>> +obj-$(CONFIG_SENSORS_SHT3x)    += sht3x.o
>>   obj-$(CONFIG_SENSORS_SHTC1)    += shtc1.o
>>   obj-$(CONFIG_SENSORS_SIS5595)    += sis5595.o
>>   obj-$(CONFIG_SENSORS_SMM665)    += smm665.o
>> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
>> new file mode 100644
>> index 0000000..2251117
>> --- /dev/null
>> +++ b/drivers/hwmon/sht3x.c
>> @@ -0,0 +1,724 @@
>> +/* Sensirion SHT3x-DIS humidity and temperature sensor driver.
>> + * The SHT3x comes in many different versions, this driver is for the
>> + * I2C version only.
>> + *
>> + * Copyright (C) 2016 Sensirion AG, Switzerland
>> + * Author: David Frey <david.frey@sensirion.com>
>> + * Author: Pascal Sachs <pascal.sachs@sensirion.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <asm/page.h>
>> +#include <linux/crc8.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/platform_data/sht3x.h>
>> +
>> +/* commands (high precision mode) */
>> +static const unsigned char sht3x_cmd_measure_blocking_hpm[] = { 
>> 0x2c, 0x06 };
>> +static const unsigned char sht3x_cmd_measure_nonblocking_hpm[] = { 
>> 0x24, 0x00 };
>> +
>> +/* commands (low power mode) */
>> +static const unsigned char sht3x_cmd_measure_blocking_lpm[] = { 
>> 0x2c, 0x10 };
>> +static const unsigned char sht3x_cmd_measure_nonblocking_lpm[] = { 
>> 0x24, 0x16 };
>> +
>> +/* commands for periodic mode */
>> +static const unsigned char sht3x_cmd_measure_periodic_mode[] = { 
>> 0xe0, 0x00 };
>> +static const unsigned char sht3x_cmd_break[] = { 0x30, 0x93 };
>> +
>> +/* other commands */
>> +static const unsigned char sht3x_cmd_read_status_reg[] = { 0xf3, 
>> 0x2d };
>> +static const unsigned char sht3x_cmd_clear_status_reg[] = { 0x30, 
>> 0x41 };
>> +
>> +/* delays for non-blocking i2c commands, both in us */
>> +#define SHT3X_NONBLOCKING_WAIT_TIME_HPM  15000
>> +#define SHT3X_NONBLOCKING_WAIT_TIME_LPM   4000
>> +
>> +#define SHT3X_WORD_LEN         2
>> +#define SHT3X_CMD_LENGTH       2
>> +#define SHT3X_CRC8_LEN         1
>> +#define SHT3X_RESPONSE_LENGTH  6
>> +#define SHT3X_CRC8_POLYNOMIAL  0x31
>> +#define SHT3X_CRC8_INIT        0xFF
>> +
>> +enum sht3x_chips {
>> +    sht3x,
>> +    sts3x,
>> +};
>> +
>> +enum sht3x_limits {
>> +    limit_max = 0,
>> +    limit_max_hyst,
>> +    limit_min,
>> +    limit_min_hyst,
>> +};
>> +
>> +DECLARE_CRC8_TABLE(sht3x_crc8_table);
>> +
>> +/* periodic measure commands (high precision mode) */
>> +static const char periodic_measure_commands_hpm[][SHT3X_CMD_LENGTH] = {
>> +    /* 0.5 measurements per second */
>> +    {0x20, 0x32},
>> +    /* 1 measurements per second */
>> +    {0x21, 0x30},
>> +    /* 2 measurements per second */
>> +    {0x22, 0x36},
>> +    /* 4 measurements per second */
>> +    {0x23, 0x34},
>> +    /* 10 measurements per second */
>> +    {0x27, 0x37},
>> +};
>> +
>> +/* periodic measure commands (low power mode) */
>> +static const char periodic_measure_commands_lpm[][SHT3X_CMD_LENGTH] = {
>> +    /* 0.5 measurements per second */
>> +    {0x20, 0x2f},
>> +    /* 1 measurements per second */
>> +    {0x21, 0x2d},
>> +    /* 2 measurements per second */
>> +    {0x22, 0x2b},
>> +    /* 4 measurements per second */
>> +    {0x23, 0x29},
>> +    /* 10 measurements per second */
>> +    {0x27, 0x2a},
>> +};
>> +
>> +struct sht3x_limit_commands {
>> +    const char read_command[SHT3X_CMD_LENGTH];
>> +    const char write_command[SHT3X_CMD_LENGTH];
>> +};
>> +
>> +static const struct sht3x_limit_commands limit_commands[] = {
>> +    /* temp1_max, humidity1_max */
>> +    [limit_max] = { {0xe1, 0x1f}, {0x61, 0x1d} },
>> +    /* temp_1_max_hyst, humidity1_max_hyst */
>> +    [limit_max_hyst] = { {0xe1, 0x14}, {0x61, 0x16} },
>> +    /* temp1_min, humidity1_min */
>> +    [limit_min] = { {0xe1, 0x02}, {0x61, 0x00} },
>> +    /* temp_1_min_hyst, humidity1_min_hyst */
>> +    [limit_min_hyst] = { {0xe1, 0x09}, {0x61, 0x0B} },
>> +};
>> +
>> +#define SHT3X_NUM_LIMIT_CMD  ARRAY_SIZE(limit_commands)
>> +
>> +static const u16 mode_to_update_interval[] = {
>> +       0,
>
> I think this is problematic. See below.
>
>> +    2000,
>> +    1000,
>> +     500,
>> +     250,
>> +     100,
>> +};
>> +
>> +struct sht3x_data {
>> +    struct i2c_client *client;
>> +    struct mutex i2c_lock; /* lock for sending i2c commands */
>> +    struct mutex data_lock; /* lock for updating driver data */
>> +
>> +    u8 mode;
>> +    const unsigned char *command;
>> +    u32 wait_time;            /* in us*/
>> +    unsigned long last_update;    /* last update in periodic mode*/
>> +
>> +    struct sht3x_platform_data setup;
>> +
>> +    /*
>> +     * cached values for temperature and humidity and limits
>> +     * the limits arrays have the following order:
>> +     * max, max_hyst, min, min_hyst
>> +     */
>> +    int temperature;
>> +    int temperature_limits[SHT3X_NUM_LIMIT_CMD];
>> +    u32 humidity;
>> +    u32 humidity_limits[SHT3X_NUM_LIMIT_CMD];
>> +};
>> +
>> +static u8 get_mode_from_update_interval(u16 value)
>> +{
>> +    size_t index;
>> +    u8 number_of_modes = ARRAY_SIZE(mode_to_update_interval);
>> +
>> +    if (value == 0)
>> +        return 0;
>> +
>> +    /* find next faster update interval */
>> +    for (index = 1; index < number_of_modes; index++) {
>> +        if (mode_to_update_interval[index] <= value)
>> +            return index;
>> +    }
>> +
>> +    return number_of_modes - 1;
>> +}
>> +
>> +static int sht3x_read_from_command(struct i2c_client *client,
>> +                   struct sht3x_data *data,
>> +                   const char *command,
>> +                   char *buf, int length, u32 wait_time)
>> +{
>> +    int ret;
>> +
>> +    mutex_lock(&data->i2c_lock);
>> +    ret = i2c_master_send(client, command, SHT3X_CMD_LENGTH);
>> +
>> +    if (ret != SHT3X_CMD_LENGTH) {
>> +        ret = ret < 0 ? ret : -EIO;
>> +        goto out;
>> +    }
>> +
>> +    if (wait_time)
>> +        usleep_range(wait_time, wait_time + 1000);
>> +
>> +    ret = i2c_master_recv(client, buf, length);
>> +    if (ret != length) {
>> +        ret = ret < 0 ? ret : -EIO;
>> +        goto out;
>> +    }
>> +
>> +    ret = 0;
>> +out:
>> +    mutex_unlock(&data->i2c_lock);
>> +    return ret;
>> +}
>> +
>> +static int sht3x_extract_temperature(u16 raw)
>> +{
>> +    /*
>> +     * From datasheet:
>> +     * T = -45 + 175 * ST / 2^16
>> +     * Adapted for integer fixed point (3 digit) arithmetic.
>> +     */
>> +    return ((21875 * (int)raw) >> 13) - 45000;
>> +}
>> +
>> +static u32 sht3x_extract_humidity(u16 raw)
>> +{
>> +    /*
>> +     * From datasheet:
>> +     * RH = 100 * SRH / 2^16
>> +     * Adapted for integer fixed point (3 digit) arithmetic.
>> +     */
>> +    return (12500 * (int)raw) >> 13;
>
> Why typecast to "int" ? raw is u16, return value is u32.
>
>> +}
>> +
>> +static struct sht3x_data *sht3x_update_client(struct device *dev)
>> +{
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +    struct i2c_client *client = data->client;
>> +    u16 interval_ms = mode_to_update_interval[data->mode];
>
> If data->mode == 0, interval_ms == 0,
>
>> +    unsigned long interval_jiffies = msecs_to_jiffies(interval_ms);
>
> ... interval_jiffies == 1,
>
>> +    unsigned char buf[SHT3X_RESPONSE_LENGTH];
>> +    u16 val;
>> +    int ret = 0;
>> +
>> +    mutex_lock(&data->data_lock);
>> +    /* only update once per interval in periodic mode */
>> +    if (time_after(jiffies, data->last_update + interval_jiffies)) {
>
> ... and the command is executed every other timer tick. Is that 
> intentional ?
Yes, this is how it should behave. In single shot mode the sensor 
measures values on demand, which means every time the sysfs interface is 
called, a measurement is triggered. In periodic mode however the 
measurement process is handled internally by the sensor and read out 
only makes sense if a new reading is available.
>
>
>> +        ret = sht3x_read_from_command(client, data, data->command, buf,
>> +                          sizeof(buf), data->wait_time);
>> +        if (ret)
>> +            goto out;
>> +
>> +        val = be16_to_cpup((__be16 *)buf);
>> +        data->temperature = sht3x_extract_temperature(val);
>> +        val = be16_to_cpup((__be16 *)(buf + 3));
>> +        data->humidity = sht3x_extract_humidity(val);
>> +        data->last_update = jiffies;
>> +    }
>> +
>> +out:
>> +    mutex_unlock(&data->data_lock);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    return data;
>> +}
>> +
>> +/* sysfs attributes */
>> +static ssize_t temp1_input_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    struct sht3x_data *data = sht3x_update_client(dev);
>> +
>> +    if (IS_ERR(data))
>> +        return PTR_ERR(data);
>> +
>> +    return sprintf(buf, "%d\n", data->temperature);
>> +}
>> +
>> +static ssize_t humidity1_input_show(struct device *dev,
>> +                    struct device_attribute *attr, char *buf)
>> +{
>> +    struct sht3x_data *data = sht3x_update_client(dev);
>> +
>> +    if (IS_ERR(data))
>> +        return PTR_ERR(data);
>> +
>> +    return sprintf(buf, "%d\n", data->humidity);
>
> humidity is u32 -> %u.
>
>> +}
>> +
>> +/*
>> + * limits_update must only be called from probe or with data_lock held
>> + */
>> +static int limits_update(struct sht3x_data *data)
>> +{
>> +    int ret;
>> +    u8 index;
>> +    int temperature;
>> +    u32 humidity;
>> +    u16 raw;
>> +    char buffer[SHT3X_RESPONSE_LENGTH];
>> +    const struct sht3x_limit_commands *commands;
>> +    struct i2c_client *client = data->client;
>> +
>> +    for (index = 0; index < SHT3X_NUM_LIMIT_CMD; index++) {
>> +        commands = &limit_commands[index];
>> +        ret = sht3x_read_from_command(client, data,
>> +                          commands->read_command, buffer,
>> +                          SHT3X_RESPONSE_LENGTH, 0);
>> +
>> +        if (ret)
>> +            return ret;
>> +
>> +        raw = be16_to_cpup((__be16 *)buffer);
>> +        temperature = sht3x_extract_temperature((raw & 0x01ff) << 7);
>> +        humidity = sht3x_extract_humidity(raw & 0xfe00);
>> +        data->temperature_limits[index] = temperature;
>> +        data->humidity_limits[index] = humidity;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t temp1_limit_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buf)
>> +{
>> +    int temperature_limit;
>> +    u8 index;
>
> How about:
>
>     struct sht3x_data *data = dev_get_drvdata(dev);
>     int temperature_limit = data->temperature_limits[index];
>     u8 index = to_sensor_dev_attr(attr)->index;
Ok, I can change that
>
>
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +
>> +    index = to_sensor_dev_attr(attr)->index;
>> +    temperature_limit = data->temperature_limits[index];
>> +
>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", temperature_limit);
>> +}
>> +
>> +static ssize_t humidity1_limit_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    int humidity_limit;
>> +    u8 index;
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +
>> +    index = to_sensor_dev_attr(attr)->index;
>> +    humidity_limit = data->humidity_limits[index];
>> +
> Initialize with declaration ?
>
>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", humidity_limit);
>
> data->humidity_limit[] is u32, so humidity_limit should be u32 as well.
>
>> +}
>> +
>> +static size_t limit_store(struct device *dev,
>> +              struct device_attribute *attr,
>> +              size_t count,
>> +              int temperature,
>> +              u32 humidity)
>> +{
>> +    char buffer[SHT3X_CMD_LENGTH + SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
>> +    char *position = buffer;
>> +    int ret;
>> +    u16 raw;
>> +    u8 index;
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +    struct i2c_client *client = data->client;
>> +    const struct sht3x_limit_commands *commands;
>> +
>> +    index = to_sensor_dev_attr(attr)->index;
>
> Initialize with declaration ?
>
>> +    commands = &limit_commands[index];
>> +
>> +    memcpy(position, commands->write_command, SHT3X_CMD_LENGTH);
>> +    position += SHT3X_CMD_LENGTH;
>> +    /*
>> +     * ST = (T + 45) / 175 * 2^16
>> +     * SRH = RH / 100 * 2^16
>> +     * adapted for fixed point arithmetic and packed the same as
>> +     * in limit_show()
>> +     */
>> +    raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
>> +    raw |= ((humidity * 42950) >> 16) & 0xfe00;
>> +
>> +    *((__be16 *)position) = cpu_to_be16(raw);
>> +    position += SHT3X_WORD_LEN;
>> +    *position = crc8(sht3x_crc8_table,
>> +             position - SHT3X_WORD_LEN,
>> +             SHT3X_WORD_LEN,
>> +             SHT3X_CRC8_INIT);
>> +
>> +    mutex_lock(&data->data_lock);
>> +    mutex_lock(&data->i2c_lock);
>> +    ret = i2c_master_send(client, buffer, sizeof(buffer));
>> +    mutex_unlock(&data->i2c_lock);
>> +
>> +    if (ret != sizeof(buffer))
>> +        goto out;
>> +
>> +    data->temperature_limits[index] = temperature;
>> +    data->humidity_limits[index] = humidity;
>> +
>> +out:
>> +    mutex_unlock(&data->data_lock);
>> +    if (ret != sizeof(buffer))
>> +        return  ret < 0 ? ret : -EIO;
>> +
>> +    return count;
>
> I would prefer something like
>
>         if (ret != sizeof(buffer)) {
>                 if (ret >= 0)
>                         ret = -EIO;
>                 goto out;
>         }
>
>         ret = count;
>         data->temperature_limits[index] = temperature;
>         data->humidity_limits[index] = humidity;
> out:
>         mutex_unlock(&data->data_lock);
>         return ret;
>
> which I think would be cleaner. See below though for locking issues.
OK, wasn't sure if it is appropriate to handle error and valid return in 
the same variable
>
>
>> +}
>> +
>> +static ssize_t temp1_limit_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf,
>> +                 size_t count)
>> +{
>> +    int temperature;
>> +    u32 humidity;
>> +    u8 index;
>> +    int ret;
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +
>> +    ret = kstrtoint(buf, 0, &temperature);
>> +
> No empty line here please.
>
>> +    if (ret)
>> +        return -EINVAL;
>
>
>         return ret;
>
>> +
>> +    temperature = clamp_val(temperature, -45000, 130000);
>> +
>> +    index = to_sensor_dev_attr(attr)->index;
>
> Initialize with declaration ?
>
>> +    humidity = data->humidity_limits[index];
>> +
>
> You need to read humidity with the lock active, to avoid 
> inconsistencies if
> humidity is updated in parallel.
>
> Maybe
>     lock()
>     ret = limit_store(dev, attr, count, temperature, 
> data->humidity_limits[index]);
>     unlock();
>
> limit_store() only uses attr to get the index (again). Maybe just pass 
> index ?
Yes, seems easier to understand
>
>
>> +    ret = limit_store(dev, attr, count, temperature, humidity);
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t humidity1_limit_store(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     const char *buf,
>> +                     size_t count)
>> +{
>> +    int temperature;
>> +    u32 humidity;
>> +    u8 index;
>> +    int ret;
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +
>> +    ret = kstrtou32(buf, 0, &humidity);
>> +
> No empty line here please.
>
>> +    if (ret)
>> +        return -EINVAL;
>
>         return ret;
>
>> +
>> +    humidity = clamp_val(humidity, 0, 100000);
>> +    index = to_sensor_dev_attr(attr)->index;
>
> Initialize index with declaration ?
>
>> +    temperature = data->temperature_limits[index];
>
> Same problem as above with locking.
>
>> +
>> +    ret = limit_store(dev, attr, count, temperature, humidity);
>> +
>> +    return ret;
>> +}
>> +
>> +static void sht3x_select_command(struct sht3x_data *data)
>> +{
>> +    /*
>> +     * In blocking mode (clock stretching mode) the I2C bus
>> +     * is blocked for other traffic, thus the call to i2c_master_recv()
>> +     * will wait until the data is ready. For non blocking mode, we
>> +     * have to wait ourselves.
>> +     */
>> +    if (data->mode > 0) {
>> +        data->command = sht3x_cmd_measure_periodic_mode;
>> +        data->wait_time = 0;
>> +    } else if (data->setup.blocking_io) {
>> +        data->command = data->setup.high_precision ?
>> +                sht3x_cmd_measure_blocking_hpm :
>> +                sht3x_cmd_measure_blocking_lpm;
>> +        data->wait_time = 0;
>> +    } else {
>> +        if (data->setup.high_precision) {
>> +            data->command = sht3x_cmd_measure_nonblocking_hpm;
>> +            data->wait_time = SHT3X_NONBLOCKING_WAIT_TIME_HPM;
>> +        } else {
>> +            data->command = sht3x_cmd_measure_nonblocking_lpm;
>> +            data->wait_time = SHT3X_NONBLOCKING_WAIT_TIME_LPM;
>> +        }
>> +    }
>> +}
>> +
>> +static int status_register_read(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buffer, int length)
>> +{
>> +    int ret;
>> +
> No empty line here please.
>
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +    struct i2c_client *client = data->client;
>> +
>> +    ret = sht3x_read_from_command(client, data, 
>> sht3x_cmd_read_status_reg,
>> +                      buffer, length, 0);
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t temp1_alarm_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buf)
>> +{
>> +    int ret;
>> +    int length = SHT3X_WORD_LEN + SHT3X_CRC8_LEN;
>> +    char buffer[length];
>> +
>> +    ret = status_register_read(dev, attr, buffer, length);
>> +
> No empty line here please.
>
>> +    if (ret)
>> +        return ret;
>> +
>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", !!(buffer[0] & 0x04));
>> +}
>> +
>> +static ssize_t humidity1_alarm_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    int ret;
>> +    int length = SHT3X_WORD_LEN + SHT3X_CRC8_LEN;
>> +    char buffer[length];
>> +
>> +    ret = status_register_read(dev, attr, buffer, length);
>> +
> No empty line here please.
>
>> +    if (ret)
>> +        return ret;
>> +
>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", !!(buffer[0] & 0x08));
>> +}
>> +
>> +static ssize_t update_interval_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +
>> +    return scnprintf(buf, PAGE_SIZE, "%d\n",
>> +             mode_to_update_interval[data->mode]);
>
>     %u
>
>> +}
>> +
>> +static ssize_t update_interval_store(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     const char *buf,
>> +                     size_t count)
>> +{
>> +    u16 update_interval;
>> +    u8 mode;
>> +    int ret;
>> +    const char *command;
>> +    struct sht3x_data *data = dev_get_drvdata(dev);
>> +    struct i2c_client *client = data->client;
>> +
>> +    ret = kstrtou16(buf, 0, &update_interval);
>> +
> No empty line here please.
>
>> +    if (ret)
>> +        return -EINVAL;
>
>         return ret;
>
>> +
>> +    mode = get_mode_from_update_interval(update_interval);
>> +
>> +    /* mode did not change */
>> +    if (mode == data->mode)
>> +        return count;
>> +
> That doesn't really mean anything here, since the check is outside the 
> lock,
> and mode may change right after you checked it. Either check from within
> the lock or not at all.
>
>
>> +    mutex_lock(&data->i2c_lock);
>> +    mutex_lock(&data->data_lock);
>> +    /* abort periodic measure */
>> +    ret = i2c_master_send(client, sht3x_cmd_break, SHT3X_CMD_LENGTH);
>> +    if (ret != SHT3X_CMD_LENGTH)
>> +        goto out;
>> +    data->mode = 0;
>> +
>
> Can you explain why you set data->mode = 0 here ?
To do any changes to the configuration while in periodic mode we have to
send a break command to the sensor, which then falls back to single shot
mode (mode = 0). Therefore for consistency reasons we set the mode to
the value it actually is at this point.
If setting the new mode fails, we are still in single shot mode. Like 
this we
ensure that the data->mode is always correct.
>
>> +    if (mode > 0) {
>> +        if (data->setup.high_precision)
>> +            command = periodic_measure_commands_hpm[mode - 1];
>> +        else
>> +            command = periodic_measure_commands_lpm[mode - 1];
>> +
>> +        /* select mode */
>> +        ret = i2c_master_send(client, command, SHT3X_CMD_LENGTH);
>> +        if (ret != SHT3X_CMD_LENGTH)
>> +            goto out;
>> +    }
>> +
>> +    /* select mode and command */
>> +    data->mode = mode;
>> +    sht3x_select_command(data);
>> +
>> +out:
>> +    mutex_unlock(&data->data_lock);
>> +    mutex_unlock(&data->i2c_lock);
>
> Reverse order would be better for lock/unlock since elsewhere you lock 
> data_lock
> first, followed by i2c_lock.
Ok
>
>
>> +    if (ret != SHT3X_CMD_LENGTH)
>> +        return ret < 0 ? ret : -EIO;
>> +
>> +    return count;
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, temp1_input_show, 
>> NULL, 0);
>> +static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, 
>> humidity1_input_show,
>> +              NULL, 0);
>> +static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR,
>> +              temp1_limit_show, temp1_limit_store,
>> +              limit_max);
>> +static SENSOR_DEVICE_ATTR(humidity1_max, S_IRUGO | S_IWUSR,
>> +              humidity1_limit_show, humidity1_limit_store,
>> +              limit_max);
>> +static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR,
>> +              temp1_limit_show, temp1_limit_store,
>> +              limit_max_hyst);
>> +static SENSOR_DEVICE_ATTR(humidity1_max_hyst, S_IRUGO | S_IWUSR,
>> +              humidity1_limit_show, humidity1_limit_store,
>> +              limit_max_hyst);
>> +static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO | S_IWUSR,
>> +              temp1_limit_show, temp1_limit_store,
>> +              limit_min);
>> +static SENSOR_DEVICE_ATTR(humidity1_min, S_IRUGO | S_IWUSR,
>> +              humidity1_limit_show, humidity1_limit_store,
>> +              limit_min);
>> +static SENSOR_DEVICE_ATTR(temp1_min_hyst, S_IRUGO | S_IWUSR,
>> +              temp1_limit_show, temp1_limit_store,
>> +              limit_min_hyst);
>> +static SENSOR_DEVICE_ATTR(humidity1_min_hyst, S_IRUGO | S_IWUSR,
>> +              humidity1_limit_show, humidity1_limit_store,
>> +              limit_min_hyst);
>> +static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, temp1_alarm_show, 
>> NULL, 0);
>> +static SENSOR_DEVICE_ATTR(humidity1_alarm, S_IRUGO, 
>> humidity1_alarm_show,
>> +              NULL, 0);
>> +static SENSOR_DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
>> +              update_interval_show, update_interval_store, 0);
>> +
>> +static struct attribute *sht3x_attrs[] = {
>> +    &sensor_dev_attr_temp1_input.dev_attr.attr,
>> +    &sensor_dev_attr_humidity1_input.dev_attr.attr,
>> +    &sensor_dev_attr_temp1_max.dev_attr.attr,
>> +    &sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
>> +    &sensor_dev_attr_humidity1_max.dev_attr.attr,
>> +    &sensor_dev_attr_humidity1_max_hyst.dev_attr.attr,
>> +    &sensor_dev_attr_temp1_min.dev_attr.attr,
>> +    &sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
>> +    &sensor_dev_attr_humidity1_min.dev_attr.attr,
>> +    &sensor_dev_attr_humidity1_min_hyst.dev_attr.attr,
>> +    &sensor_dev_attr_temp1_alarm.dev_attr.attr,
>> +    &sensor_dev_attr_humidity1_alarm.dev_attr.attr,
>> +    &sensor_dev_attr_update_interval.dev_attr.attr,
>> +    NULL
>> +};
>> +
>> +static struct attribute *sts3x_attrs[] = {
>> +    &sensor_dev_attr_temp1_input.dev_attr.attr,
>> +    NULL
>> +};
>> +
>> +ATTRIBUTE_GROUPS(sht3x);
>> +ATTRIBUTE_GROUPS(sts3x);
>> +
>> +static int sht3x_probe(struct i2c_client *client,
>> +               const struct i2c_device_id *id)
>> +{
>> +    int ret;
>> +    struct sht3x_data *data;
>> +    struct device *hwmon_dev;
>> +    struct i2c_adapter *adap = client->adapter;
>> +    struct device *dev = &client->dev;
>> +    const struct attribute_group **attribute_groups;
>> +
>> +    /*
>> +     * we require full i2c support since the sht3x uses multi-byte 
>> read and
>> +     * writes as well as multi-byte commands which are not supported by
>> +     * the smbus protocol
>> +     */
>> +    if (!i2c_check_functionality(adap, I2C_FUNC_I2C))
>> +        return -ENODEV;
>> +
>> +    ret = i2c_master_send(client, sht3x_cmd_clear_status_reg,
>> +                  SHT3X_CMD_LENGTH);
>> +    if (ret != SHT3X_CMD_LENGTH)
>> +        return ret < 0 ? ret : -ENODEV;
>> +
>> +    data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    data->setup.blocking_io = false;
>> +    data->setup.high_precision = true;
>> +    data->mode = 0;
>> +    data->last_update = 0;
>> +    data->client = client;
>> +    crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
>> +
>> +    if (client->dev.platform_data)
>> +        data->setup = *(struct sht3x_platform_data 
>> *)dev->platform_data;
>> +
>> +    sht3x_select_command(data);
>> +
>> +    mutex_init(&data->i2c_lock);
>> +    mutex_init(&data->data_lock);
>> +
>> +    ret = limits_update(data);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (id->driver_data == sts3x)
>> +        attribute_groups = sts3x_groups;
>> +    else
>> +        attribute_groups = sht3x_groups;
>> +
>> +    hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>> +                               client->name,
>> +                               data,
>> +                               attribute_groups);
>> +
>> +    if (IS_ERR(hwmon_dev))
>> +        dev_dbg(dev, "unable to register hwmon device\n");
>> +
>> +    return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +/* device ID table */
>> +static const struct i2c_device_id sht3x_ids[] = {
>> +    {"sht3x", sht3x},
>> +    {"sts3x", sts3x},
>> +    {}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, sht3x_ids);
>> +
>> +static struct i2c_driver sht3x_i2c_driver = {
>> +    .driver.name = "sht3x",
>> +    .probe       = sht3x_probe,
>> +    .id_table    = sht3x_ids,
>> +};
>> +
>> +module_i2c_driver(sht3x_i2c_driver);
>> +
>> +MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
>> +MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
>> +MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor 
>> driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/platform_data/sht3x.h 
>> b/include/linux/platform_data/sht3x.h
>> new file mode 100644
>> index 0000000..46af9a0
>> --- /dev/null
>> +++ b/include/linux/platform_data/sht3x.h
>> @@ -0,0 +1,25 @@
>> +/*
>> + * Copyright (C) 2015 Sensirion AG, Switzerland
>
> 2016 ?
Yes, those years just change too fast ;-)
>
>
>> + * Author: David Frey <david.frey@sensirion.com>
>> + * Author: Pascal Sachs <pascal.sachs@sensirion.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef __SHT3X_H_
>> +#define __SHT3X_H_
>> +
>> +struct sht3x_platform_data {
>> +    bool blocking_io;
>> +    bool high_precision;
>> +};
>> +#endif /* __SHT3X_H_ */
>>
>
