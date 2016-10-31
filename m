Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <246c105a-1cad-6b58-dd43-cbfc6a9f87d6@roeck-us.net>
References: <20161004235102.GA1055@roeck-us.net> <CAN8YU5Oemez-ovyGhmWR0y7D7UUnzuGYjSLTO607U8wrg36F4Q@mail.gmail.com>
 <246c105a-1cad-6b58-dd43-cbfc6a9f87d6@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Mon, 31 Oct 2016 16:27:11 +0100
Message-ID: <CAN8YU5N7NEg8DH8VGrwP1-AJhfHO_Mj_3NSJahZU08ZLthsDFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>,
	Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Oct 19, 2016 at 4:50 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 10/19/2016 05:16 AM, Andrea Merello wrote:
>>
>> On Wed, Oct 5, 2016 at 1:51 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On Tue, Sep 27, 2016 at 02:07:27PM +0200, Andrea Merello wrote:
>>>>
>>>> This patch adds a HWMON driver for ST Microelectronics STTS751
>>>> temperature sensors.
>>>>
>>>> It does support temperature reading (of course), SMBUS alert
>>>> functionality and "therm" output.
>>>>
>>>> Thanks-to: LABBE Corentin [for suggestions]
>>>> Thanks-to: Guenter Roeck [for suggestions/discussions]
>>>> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
>>>> Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Jean Delvare <jdelvare@suse.com>
>>>> ---
>>>>  drivers/hwmon/Kconfig   |  12 +-
>>>>  drivers/hwmon/Makefile  |   2 +-
>>>>  drivers/hwmon/stts751.c | 805
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 817 insertions(+), 2 deletions(-)
>>>>  create mode 100644 drivers/hwmon/stts751.c
>>>>
>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>> index eaf2f91..4e70b42 100644
>>>> --- a/drivers/hwmon/Kconfig
>>>> +++ b/drivers/hwmon/Kconfig
>>>> @@ -1448,6 +1448,16 @@ config SENSORS_SCH5636
>>>>         This driver can also be built as a module.  If so, the module
>>>>         will be called sch5636.
>>>>
>>>> +config SENSORS_STTS751
>>>> +     tristate "ST Microelectronics STTS751"
>>>> +     depends on I2C
>>>> +     help
>>>> +       If you say yes here you get support for STTS751
>>>> +       temperature sensor chips.
>>>> +
>>>> +       This driver can also be built as a module. If so, the module
>>>> +       will be called stts751.
>>>> +
>>>>  config SENSORS_SMM665
>>>>       tristate "Summit Microelectronics SMM665"
>>>>       depends on I2C
>>>> @@ -1506,7 +1516,7 @@ config SENSORS_ADS7871
>>>>
>>>>  config SENSORS_AMC6821
>>>>       tristate "Texas Instruments AMC6821"
>>>> -     depends on I2C
>>>> +     depends on I2C
>>>
>>>
>>> ???
>>
>>
>> My editor is kind enough to automatically kill trailing spaces.. I'll
>> take care of moving this one in another patch in next series version..
>>
>>>
>>>>       help
>>>>         If you say yes here you get support for the Texas Instruments
>>>>         AMC6821 hardware monitoring chips.
>>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>>> index fe87d28..1114130 100644
>>>> --- a/drivers/hwmon/Makefile
>>>> +++ b/drivers/hwmon/Makefile
>>>> @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_SMM665)      += smm665.o
>>>>  obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>>>>  obj-$(CONFIG_SENSORS_SMSC47M1)       += smsc47m1.o
>>>>  obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>>>> +obj-$(CONFIG_SENSORS_STTS751)        += stts751.o
>>>>  obj-$(CONFIG_SENSORS_AMC6821)        += amc6821.o
>>>>  obj-$(CONFIG_SENSORS_TC74)   += tc74.o
>>>>  obj-$(CONFIG_SENSORS_THMC50) += thmc50.o
>>>> @@ -169,4 +170,3 @@ obj-$(CONFIG_SENSORS_WM8350)      += wm8350-hwmon.o
>>>>  obj-$(CONFIG_PMBUS)          += pmbus/
>>>>
>>>>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>>>> -
>>>
>>>
>>> Looks like an unnecessary whitespace change.
>>
>>
>> Like above..
>>
>>>
>>>> diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
>>>> new file mode 100644
>>>> index 0000000..8358e04
>>>> --- /dev/null
>>>> +++ b/drivers/hwmon/stts751.c
>>>> @@ -0,0 +1,805 @@
>>>> +/*
>>>> + * STTS751 sensor driver
>>>> + *
>>>> + * Copyright (C) 2016 Istituto Italiano di Tecnologia - RBCS - EDL
>>>> + * Robotics, Brain and Cognitive Sciences department
>>>> + * Electronic Design Laboratory
>>>> + *
>>>> + * Written by Andrea Merello <andrea.merello@gmail.com>
>>>> + *
>>>> + * Based on  LM95241 driver and LM90 driver
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License as published by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + */
>>>> +
>>>> +
>>>
>>> No douple empty lines please.
>>
>>
>> OK. BTW do you use some enhanced "checkpatch" script in order to catch
>> issues like these?
>>
>
> In this case my brain, but checkpatch --strict reports it as well.

OK, Thanks.

>
>>>
>>>> +#include <linux/bitops.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/hwmon.h>
>>>> +#include <linux/hwmon-sysfs.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/jiffies.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/of_irq.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/sysfs.h>
>>>> +#include <linux/util_macros.h>
>>>> +
>>>> +#define DEVNAME "stts751"
>>>> +
>>>> +static const unsigned short normal_i2c[] = {
>>>> +     0x48, 0x49, 0x38, 0x39,  /* STTS751-0 */
>>>> +     0x4A, 0x4B, 0x3A, 0x3B,  /* STTS751-1 */
>>>> +     I2C_CLIENT_END };
>>>> +
>>>> +#define STTS751_REG_TEMP_H   0x00
>>>> +#define STTS751_REG_STATUS   0x01
>>>> +#define STTS751_STATUS_TRIPL BIT(5)
>>>> +#define STTS751_STATUS_TRIPH BIT(6)
>>>> +#define STTS751_STATUS_BUSY  BIT(8)
>>>> +#define STTS751_REG_TEMP_L   0x02
>>>> +#define STTS751_REG_CONF     0x03
>>>> +#define STTS751_CONF_RES_MASK        0x0C
>>>> +#define STTS751_CONF_RES_SHIFT  2
>>>> +#define STTS751_CONF_EVENT_DIS  BIT(7)
>>>> +#define STTS751_CONF_STOP    BIT(6)
>>>> +#define STTS751_REG_RATE     0x04
>>>> +#define STTS751_REG_HLIM_H   0x05
>>>> +#define STTS751_REG_HLIM_L   0x06
>>>> +#define STTS751_REG_LLIM_H   0x07
>>>> +#define STTS751_REG_LLIM_L   0x08
>>>> +#define STTS751_REG_ONESHOT  0x0F
>>>> +#define STTS751_REG_TLIM     0x20
>>>> +#define STTS751_REG_HYST     0x21
>>>> +#define STTS751_REG_SMBUS_TO 0x22
>>>> +
>>>> +#define STTS751_REG_PROD_ID  0xFD
>>>> +#define STTS751_REG_MAN_ID   0xFE
>>>> +#define STTS751_REG_REV_ID   0xFF
>>>> +
>>>> +#define STTS751_0_PROD_ID    0x00
>>>> +#define STTS751_1_PROD_ID    0x01
>>>> +#define ST_MAN_ID            0x53
>>>> +
>>>> +/* stick with HW defaults */
>>>> +#define STTS751_THERM_DEFAULT        85000
>>>> +#define STTS751_HYST_DEFAULT 10000
>>>> +#define STTS751_EVENT_MAX_DEFAULT 85000
>>>> +#define STTS751_EVENT_MIN_DEFAULT 0
>>>> +
>>>> +#define STTS751_RACE_RETRY   5
>>>> +#define STTS751_CONV_TIMEOUT 100 /* mS */
>>>> +#define STTS751_CACHE_TIME   100 /* mS */
>>>> +
>>>> +/*
>>>> + * Possible update intervals are (in mS):
>>>> + * 16000, 8000, 4000, 2000, 1000, 500, 250, 125, 62.5, 31.25
>>>> + * However we are not going to complicate things too much and we stick
>>>> to the
>>>> + * approx value in mS.
>>>> + */
>>>> +static const int stts751_intervals[] = {
>>>> +     16000, 8000, 4000, 2000, 1000, 500, 250, 125, 63, 31
>>>> +};
>>>> +
>>>> +struct stts751_priv {
>>>> +     struct device *dev;
>>>> +     struct i2c_client *client;
>>>> +     struct mutex access_lock;
>>>> +     unsigned long interval;
>>>> +     int res;
>>>> +     bool gen_therm, gen_event;
>>>> +     int event_max, event_min;
>>>> +     int therm;
>>>> +     int hyst;
>>>> +     bool smbus_timeout;
>>>> +     int temp;
>>>> +     unsigned long last_update;
>>>> +     u8 config;
>>>> +     bool min_alert, max_alert;
>>>> +     bool data_valid;
>>>> +
>>>> +     /*
>>>> +      * Temperature/interval is always present.
>>>> +      * Depending by DT therm and event are dynamically added.
>>>> +      * There are max 4 entries plus the guard
>>>> +      */
>>>> +     const struct attribute_group *groups[5];
>>>> +};
>>>> +
>>>> +/*
>>>> + * These functions converts temperature from HW format to integer
>>>> format and
>>>> + * vice-vers. They are (mostly) taken from lm90 driver. Unit is in mC.
>>>> + */
>>>> +static int stts751_to_deg(s32 hw_val)
>>>> +{
>>>> +     return hw_val * 125 / 32;
>>>> +}
>>>> +
>>>> +static s16 stts751_to_hw(int val, s32 *hw_val)
>>>> +{
>>>> +     /* HW works in range -64C to +127C */
>>>> +     if ((val > 127000) || (val < -64000))
>>>
>>>
>>> Extra ( ). However, clamp_val(val, -64000, 127000) is preferred here
>>> instead of returning an error (we don't want to force users to guess
>>> valid ranges).
>>>
>>> The upper limit should probably be 127937, though, per datasheet.
>>
>>
>>
>> OK
>>
>>>> +             return -EINVAL;
>>>> +
>>>> +     if (val < 0)
>>>> +             *hw_val = (val - 62) / 125 * 32;
>>>> +     else
>>>> +             *hw_val = (val + 62) / 125 * 32;
>>>> +
>>>
>>> By having this function return an int, you could combine the 16-bit
>>> return
>>> value with the error code, and the extra parameter would not be necessary
>>> (even more so since this function should not return an error in the first
>>> place).
>>
>>
>> OK, now it's never failing.
>>>
>>>
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int stts751_adjust_resolution(struct stts751_priv *priv)
>>>> +{
>>>> +     u8 res;
>>>> +
>>>> +     switch (priv->interval) {
>>>> +     case 9:
>>>> +             /* 10 bits */
>>>> +             res = 0;
>>>> +             break;
>>>> +     case 8:
>>>> +             /* 11 bits */
>>>> +             res = 1;
>>>> +             break;
>>>> +     default:
>>>> +             /* 12 bits */
>>>> +             res = 3;
>>>> +             break;
>>>> +     }
>>>> +
>>>> +     if (priv->res == res)
>>>> +             return 0;
>>>> +
>>>> +     priv->config &= ~STTS751_CONF_RES_MASK;
>>>> +     priv->config |= res << STTS751_CONF_RES_SHIFT;
>>>> +
>>>> +     return i2c_smbus_write_byte_data(priv->client,
>>>> +                             STTS751_REG_CONF, priv->config);
>>>> +}
>>>> +
>>>> +static int stts751_update_temp(struct stts751_priv *priv)
>>>> +{
>>>> +     s32 integer1, integer2, frac;
>>>> +     int ret = 0;
>>>> +
>>>> +     mutex_lock(&priv->access_lock);
>>>> +
>>>> +     /*
>>>> +      * There is a trick here, like in the lm90 driver. We have to read
>>>> two
>>>> +      * registers to get the sensor temperature, but we have to beware
>>>> a
>>>> +      * conversion could occur between the readings. We could use the
>>>> +      * one-shot conversion register, but we don't want to do this
>>>> (disables
>>>> +      * hardware monitoring). So the solution used here is to read the
>>>> high
>>>> +      * byte once, then the low byte, then the high byte again. If the
>>>> new
>>>> +      * high byte matches the old one, then we have a valid reading.
>>>> Else we
>>>> +      * have to read the low byte again, and now we believe we have a
>>>> correct
>>>> +      * reading.
>>>> +      */
>>>> +     integer1 = i2c_smbus_read_byte_data(priv->client,
>>>> STTS751_REG_TEMP_H);
>>>> +     if (integer1 < 0) {
>>>> +             dev_dbg(&priv->client->dev,
>>>> +                     "I2C read failed (temp H). ret: %x\n", ret);
>>>> +             ret = integer1;
>>>> +             goto exit;
>>>> +     }
>>>> +
>>>> +     frac = i2c_smbus_read_byte_data(priv->client, STTS751_REG_TEMP_L);
>>>> +     if (frac < 0) {
>>>> +             dev_dbg(&priv->client->dev,
>>>> +                     "I2C read failed (temp L). ret: %x\n", ret);
>>>> +             ret = frac;
>>>> +             goto exit;
>>>> +     }
>>>> +
>>>> +     integer2 = i2c_smbus_read_byte_data(priv->client,
>>>> STTS751_REG_TEMP_H);
>>>> +     if (integer2 < 0) {
>>>> +             dev_dbg(&priv->client->dev,
>>>> +                     "I2C 2nd read failed (temp H). ret: %x\n", ret);
>>>> +             ret = integer2;
>>>> +             goto exit;
>>>> +     }
>>>> +
>>>> +     if (integer1 != integer2) {
>>>> +             frac = i2c_smbus_read_byte_data(priv->client,
>>>> +                                             STTS751_REG_TEMP_L);
>>>> +             if (frac < 0) {
>>>> +                     dev_dbg(&priv->client->dev,
>>>> +                             "I2C 2nd read failed (temp L). ret: %x\n",
>>>> ret);
>>>> +                     ret = frac;
>>>> +                     goto exit;
>>>> +             }
>>>> +     }
>>>> +
>>>> +exit:
>>>> +     mutex_unlock(&priv->access_lock);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     priv->temp = stts751_to_deg((integer1 << 8) | frac);
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static int stts751_set_temp_reg(struct stts751_priv *priv, int temp,
>>>> +                             bool is_frac, u8 hreg, u8 lreg)
>>>> +{
>>>> +     s32 hwval;
>>>> +     int ret;
>>>> +
>>>> +     if (stts751_to_hw(temp, &hwval))
>>>> +             return -EINVAL;
>>>> +
>>>> +     mutex_lock(&priv->access_lock);
>>>> +     ret = i2c_smbus_write_byte_data(priv->client, hreg, hwval >> 8);
>>>> +     if (ret)
>>>> +             goto exit;
>>>> +     if (is_frac)
>>>> +             ret = i2c_smbus_write_byte_data(priv->client,
>>>> +                                             lreg, hwval & 0xff);
>>>> +exit:
>>>> +     mutex_unlock(&priv->access_lock);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static int stts751_update_alert(struct stts751_priv *priv)
>>>> +{
>>>> +     int ret;
>>>> +
>>>> +     /* not for us.. */
>>>> +     if (!priv->gen_event)
>>>> +             return 0;
>>>> +
>>>> +     ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_STATUS);
>>>> +
>>>
>>> Please no empty line between functions and checking of return values.
>>
>>
>> OK
>>
>>>> +     if (ret < 0)
>>>> +             return ret;
>>>> +
>>>> +     priv->max_alert = priv->max_alert || !!(ret &
>>>> STTS751_STATUS_TRIPH);
>>>> +     priv->min_alert = priv->min_alert || !!(ret &
>>>> STTS751_STATUS_TRIPL);
>>>> +
>>>
>>> I am not really happy about the caching of alert values. This isn't
>>> really
>>> common. Usually we report current alert values when reading. I don't
>>> really
>>> see why this driver should be different to all the others.
>>
>>
>> OK

I've tried to avoid caching, but as soon as I read the status register
in the alert handler, the device clears that reg, and it will remain
cleared up to the next conversion.

So for example if the reader is blocked on poll over the alert
attribute, it gets unblocked on alert, and it will very likely read
zero..

The only way I can see for avoiding caching, and for changing the API
about clearing events as you asked below, is performing a temperature
read from the temperature registers and doing software compare with
the limits in show_[max/min]_alert.

Does this sounds OK for you ?

>>
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static void stts751_alert(struct i2c_client *client,
>>>> +                     enum i2c_alert_protocol type, unsigned int data)
>>>> +{
>>>> +     int ret;
>>>> +     struct stts751_priv *priv = i2c_get_clientdata(client);
>>>> +     bool prev_max = priv->max_alert;
>>>> +     bool prev_min = priv->min_alert;
>>>> +
>>>> +     if (type != I2C_PROTOCOL_SMBUS_ALERT)
>>>> +             return;
>>>> +
>>>> +     dev_dbg(&client->dev, "alert!");
>>>> +
>>>
>>>
>>> Any chance to make this a bit more generic and also support
>>> interrupts ?
>>
>>
>> May you please elaborate?
>>
>> IMHO adding the logic for handling SMBus alerts using IRQs to any
>> HWmon driver is redundant, because it is already implemented in the
>> SMBus layer, just right now you need patching SMBus layer for enabling
>> it from the DT world (a couple of patches for this are floating
>> around, but they seems not ready for merge yet)... Using this chip
>> with a generic interrupt is indeed exactly what I'm doing..
>>
>> .. Or am I completely missing your point ?
>>
> "just right now you need patching SMBus layer for enabling it from the DT
> world"
>
> So it _doesn't_ work, correct ?

I mean, the generic smbus code works for stts751, and the chip seems
happy. So, in this case, no need to reimplement it elsewhere. It would
just end up to be a copy-paste from smbus.c.... Just AFAICT we need
some mechanism to hook smbus code from DT world..

> The problem with SMBus alert is that each chip implements it differently,
> to the point where it is difficult to implement it such that it supports
> more than one chip on the same bus. For the most part, chip interrupt
> lines are thus not connected to the i2c controller but to, for example,
> a gpio pin, and each chip on the same bus has a separate interrupt.
> I am looking forward to see how this is going to be supported in the
> i2c infrastructure. For my part, I long since gave up on it, but I'll
> be happy to stand corrected.

Hmm, I didn't know about all those weirdness in devices :(

BTW this sounds like saying that we need to make the smbus code
device-bound, rather bus-bound, but even in this case the smbus code
can still be generic rather than being buried in each slave driver..
At least for those device like stts751 for with the generic code
works..

Consider also that indeed we still need to send the ARAs over the bus,
and AFAIK those will hit all devices on the bus.. So this thing seems
that needs to be somehow centralized anyway.. I'm honestly unsure if I
could support alerts in, say, stts751 driver, handling by myself the
IRQ line and sending ARAs over the bus without impacting other devices
on the same bus, even if they have their own IRQs..

I mean even if I do implement all this stuff in my driver,  I'm not
sure it will help much when you have multiple devices with different
IRQs on the same bus.. I even suspect this can complicate things..  :/

... Please correct me if I'm wrong; any discussion on this topic would
be appreciated :)

BTW it seems that other hwmon drivers, like lm90, are doing the same,
relying on generic SMBus support.. For example lm90 doing
if (type != I2C_PROTOCOL_SMBUS_ALERT)
    return;

>
>>>
>>>> +     mutex_lock(&priv->access_lock);
>>>> +     ret = stts751_update_alert(priv);
>>>> +     if (ret < 0) {
>>>> +             /* default to worst case */
>>>> +             priv->max_alert = true;
>>>> +             priv->min_alert = true;
>>>> +
>>>> +             if (!(prev_max && prev_min)) {
>>>> +                     dev_warn(&priv->client->dev,
>>>> +                             "Alert received, but can't communicate to
>>>> the device. Something bad happening? Triggering all alarms!");
>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (!prev_max && priv->max_alert) {
>>>> +             dev_notice(&client->dev, "got alert for HIGH
>>>> temperature");
>>>> +
>>>> +             /* unblock alert poll */
>>>> +             sysfs_notify(&priv->dev->kobj, NULL,
>>>> "temp1_event_max_alert");
>>>> +             kobject_uevent(&priv->dev->kobj, KOBJ_CHANGE);
>>>> +     }
>>>> +
>>>> +     if (!prev_min && priv->min_alert) {
>>>> +             dev_notice(&client->dev, "got alert for LOW temperature");
>>>> +
>>>> +             /* unblock alert poll */
>>>> +             sysfs_notify(&priv->dev->kobj, NULL,
>>>> "temp1_event_min_alert");
>>>> +             kobject_uevent(&priv->dev->kobj, KOBJ_CHANGE);
>>>> +     }
>>>> +     mutex_unlock(&priv->access_lock);
>>>> +}
>>>> +
>>>> +static ssize_t show_max_alert(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +                       char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->max_alert);
>>>> +}
>>>> +
>>>> +static ssize_t set_max_alert(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +                    const char *buf, size_t count)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     mutex_lock(&priv->access_lock);
>>>> +     priv->max_alert = false;
>>>> +     mutex_unlock(&priv->access_lock);
>>>> +
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static ssize_t show_min_alert(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +                       char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->min_alert);
>>>> +}
>>>> +
>>>> +static ssize_t set_min_alert(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +                    const char *buf, size_t count)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     mutex_lock(&priv->access_lock);
>>>> +     priv->min_alert = false;
>>>> +     mutex_unlock(&priv->access_lock);
>>>> +
>>>
>>> This is highly unusual. If the alert needs to be cleared, please
>>> auto-clear it
>>> when reading.
>>
>>
>> OK
>>
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static ssize_t show_input(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                       char *buf)
>>>> +{
>>>> +     int ret;
>>>> +     int cache_time = STTS751_CACHE_TIME * HZ / 1000;
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     /*
>>>> +      * Adjust the cache time wrt the sample rate. We do 4X in order to
>>>> get
>>>> +      * a new measure in no more than 1/4 of the sample time (that
>>>> seemed
>>>> +      * reasonable to me).
>>>> +      */
>>>> +     cache_time = stts751_intervals[priv->interval] / 4 * HZ / 1000;
>>>> +
>>>> +     if (time_after(jiffies, priv->last_update + cache_time) ||
>>>> +             !priv->data_valid) {
>>>> +             ret = stts751_update_temp(priv);
>>>> +             if (ret)
>>>> +                     return ret;
>>>> +             priv->last_update = jiffies;
>>>> +             priv->data_valid = true;
>>>> +     }
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->temp);
>>>> +}
>>>> +
>>>> +static ssize_t show_therm(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                     char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->therm);
>>>> +}
>>>> +
>>>> +
>>>> +static ssize_t set_therm(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                    const char *buf, size_t count)
>>>> +{
>>>> +     int ret;
>>>> +     long temp;
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     if (kstrtol(buf, 10, &temp) < 0)
>>>> +             return -EINVAL;
>>>> +
>>>> +     ret = stts751_set_temp_reg(priv, temp, false, STTS751_REG_TLIM,
>>>> 0);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>
>>> Does it really add value to use the same function for 8- and 16-bit
>>> registers ?
>>> Seems to me it just makes the code more complicated.
>>
>>
>> I haven't a strong opinion about this.. it's this complication vs a
>> slight code duplication.. I've changed this in the way you suggest :)
>>
>>>> +     dev_dbg(dev, "setting therm %ld", temp);
>>>> +
>>>> +     priv->therm = temp;
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static ssize_t show_hyst(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                     char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->hyst);
>>>> +}
>>>> +
>>>> +
>>>> +static ssize_t set_hyst(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                    const char *buf, size_t count)
>>>> +{
>>>> +     int ret;
>>>> +     long temp;
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     if (kstrtol(buf, 10, &temp) < 0)
>>>> +             return -EINVAL;
>>>> +
>>>
>>> Per ABI, this is supposed to be an absolute temperature. For the chip,
>>> it is a delta. You'll have to do some calculation to convert the absolute
>>> value into a delta. Same for the show command.
>>
>>
>> OK
>>
>>>
>>>> +     ret = stts751_set_temp_reg(priv, temp, false, STTS751_REG_HYST,
>>>> 0);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     dev_dbg(dev, "setting hyst %ld", temp);
>>>> +
>>>> +     priv->hyst = temp;
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static ssize_t show_max(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                     char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->event_max);
>>>> +}
>>>> +
>>>> +static ssize_t set_max(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                    const char *buf, size_t count)
>>>> +{
>>>> +     int ret;
>>>> +     long temp;
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     if (kstrtol(buf, 10, &temp) < 0)
>>>> +             return -EINVAL;
>>>> +
>>>> +     ret = stts751_set_temp_reg(priv, temp, true,
>>>> +                             STTS751_REG_HLIM_H, STTS751_REG_HLIM_L);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     dev_dbg(dev, "setting event max %ld", temp);
>>>> +     priv->event_max = temp;
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static ssize_t show_min(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                     char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->event_min);
>>>> +}
>>>> +
>>>> +
>>>
>>>
>>> Single empty line, please.
>>
>>
>> OK
>>
>>>
>>>> +static ssize_t set_min(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                    const char *buf, size_t count)
>>>> +{
>>>> +     int ret;
>>>> +     long temp;
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     if (kstrtol(buf, 10, &temp) < 0)
>>>> +             return -EINVAL;
>>>> +
>>>> +     ret = stts751_set_temp_reg(priv, temp, true,
>>>> +                             STTS751_REG_LLIM_H, STTS751_REG_LLIM_L);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     dev_dbg(dev, "setting event min %ld", temp);
>>>> +
>>>> +     priv->event_min = temp;
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static ssize_t show_interval(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +                          char *buf)
>>>> +{
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     return snprintf(buf, PAGE_SIZE - 1, "%d\n",
>>>> +                     stts751_intervals[priv->interval]);
>>>> +}
>>>> +
>>>> +static ssize_t set_interval(struct device *dev, struct device_attribute
>>>> *attr,
>>>> +                         const char *buf, size_t count)
>>>> +{
>>>> +     unsigned long val;
>>>> +     int idx;
>>>> +     int ret = 0;
>>>> +     struct stts751_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +     if (kstrtoul(buf, 10, &val) < 0)
>>>> +             return -EINVAL;
>>>> +
>>>> +     idx = find_closest_descending(val, stts751_intervals,
>>>> +                             ARRAY_SIZE(stts751_intervals));
>>>> +
>>>> +     dev_dbg(dev, "setting interval. req:%lu, idx: %d, val: %d", val,
>>>> idx,
>>>> +             stts751_intervals[idx]);
>>>> +
>>>> +     if (priv->interval == idx)
>>>> +             return count;
>>>> +
>>>> +     mutex_lock(&priv->access_lock);
>>>> +
>>>> +     /* speed up, lower the resolution, then modify convrate */
>>>> +     if (priv->interval < idx) {
>>>> +             priv->interval = idx;
>>>> +             ret = stts751_adjust_resolution(priv);
>>>> +             if (ret)
>>>> +                     goto exit;
>>>> +     }
>>>> +
>>>> +     ret = i2c_smbus_write_byte_data(priv->client, STTS751_REG_RATE,
>>>> idx);
>>>> +     if (ret)
>>>> +             goto exit;
>>>> +
>>>> +     /* slow down, modify convrate, then raise resolution */
>>>> +     if (priv->interval != idx) {
>>>> +             priv->interval = idx;
>>>> +             ret = stts751_adjust_resolution(priv);
>>>> +             if (ret)
>>>> +                     goto exit;
>>>> +
>>>
>>> Extra empty line.
>>>
>>> Is it really necessary to have this code twice ? What is the harm in
>>> just doing it once, either before or after setting the conversion rate ?
>>
>>
>> In early development stages I've become suspicious about the chip
>> starting to misbehave if I ever set, even briefly, an invalid
>> configuration.
>>
>> I tried to avoid that by setting rate and resolution in such an order
>> that never ends up in an invalid configuration. The order is thus not
>> fixed and depends by what changes are you doing..
>>
>> (I'm not completely sure: I've hit something strange and I thought it
>> could be because of this, and once I changed my code this way I never
>> hit that again)..
>>
> Please add a respective comment into the code describing the reasons.

OK

>
>>>> +     }
>>>> +exit:
>>>> +     mutex_unlock(&priv->access_lock);
>>>> +
>>>> +     return count;
>>>> +}
>>>> +
>>>> +static int stts751_detect(struct i2c_client *new_client,
>>>> +                       struct i2c_board_info *info)
>>>> +{
>>>> +     struct i2c_adapter *adapter = new_client->adapter;
>>>> +     const char *name;
>>>> +     int mfg_id, prod_id, rev_id;
>>>> +
>>>> +     if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
>>>> +             return -ENODEV;
>>>> +
>>>> +     mfg_id = i2c_smbus_read_byte_data(new_client, ST_MAN_ID);
>>>> +     if (mfg_id != ST_MAN_ID)
>>>> +             return -ENODEV;
>>>> +
>>>> +     prod_id = i2c_smbus_read_byte_data(new_client,
>>>> STTS751_REG_PROD_ID);
>>>> +
>>>> +     switch (prod_id) {
>>>> +     case STTS751_0_PROD_ID:
>>>> +             name = "STTS751-0";
>>>> +             break;
>>>> +     case STTS751_1_PROD_ID:
>>>> +             name = "STTS751-1";
>>>> +             break;
>>>> +     default:
>>>> +             return -ENODEV;
>>>> +     }
>>>> +     dev_info(&new_client->dev, "Chip %s detected!", name);
>>>> +
>>>
>>> Is this noise necessary ?
>>
>>
>> OK, changed in dev_dbg.
>>
>>>
>>>> +     rev_id = i2c_smbus_read_byte_data(new_client, STTS751_REG_REV_ID);
>>>> +
>>>> +     if (rev_id != 0x1) {
>>>
>>>
>>> You might want to check for an error here (and return -ENODEV if you get
>>> one).
>>
>>
>> OK
>>
>>>> +             dev_notice(&new_client->dev,
>>>> +                     "Chip revision 0x%x is untested\nPlease report
>>>> whether it works to andrea.merello@gmail.com",
>>>> +                     rev_id);
>>>> +     }
>>>> +
>>>> +     strlcpy(info->type, name, I2C_NAME_SIZE);
>>>
>>>
>>> This doesn't match the driver name (or, rather, the values in
>>> stts751_id). Does this instantiate the driver ? That would surprise
>>> me.
>>
>>
>> It does, but I'll double check what the heck I've done here :)
>>
>
> Either case this should return a string matching stts751_id[], otherwise
> auto-detection
> and manual or devicetree based instantiation would return different names.

I'm going to stick to the only one string we have in stts751id_[].
Differentiating STTS751-0 from STTS751-1 indeed seems useless for
anything but reporting that name in dev_dbg.

> Does your use case even include the detect function ?

Oh.. I've checked, and it seems that right now no one is ever calling
my detect funcion indeed..

>
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int stts751_init_chip(struct stts751_priv *priv)
>>>> +{
>>>> +     int ret;
>>>> +
>>>> +     priv->config = STTS751_CONF_EVENT_DIS | STTS751_CONF_STOP;
>>>> +     ret = i2c_smbus_write_byte_data(priv->client, STTS751_REG_CONF,
>>>> +                                     priv->config);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     ret = i2c_smbus_write_byte_data(priv->client, STTS751_REG_RATE,
>>>> +                                     priv->interval);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     /* invalid, to force update */
>>>> +     priv->res = -1;
>>>> +     ret = stts751_adjust_resolution(priv);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     ret = i2c_smbus_write_byte_data(priv->client,
>>>> +                                     STTS751_REG_SMBUS_TO,
>>>> +                                     priv->smbus_timeout ? 0x80 : 0);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +
>>>> +     if (priv->gen_event) {
>>>> +             ret = stts751_set_temp_reg(priv, priv->event_max, true,
>>>> +                                     STTS751_REG_HLIM_H,
>>>> STTS751_REG_HLIM_L);
>>>> +             if (ret)
>>>> +                     return ret;
>>>> +
>>>> +             ret = stts751_set_temp_reg(priv, priv->event_min, true,
>>>> +                                     STTS751_REG_LLIM_H,
>>>> STTS751_REG_LLIM_L);
>>>
>>>
>>> Those registers all have power-up defaults. Unless there is a good
>>> reason,
>>> we should not overwrite them. In some applications, the values may be
>>> initialized from the BIOS/ROMMON.
>>
>>
>> OK. I've changed it for all those regs but the smsbus timeout stuff:
>> I think that this depends by the kind of I2C controller the device is
>> attached to, so I'd still getting that from DT. Even if someone
>> already initialized it (assuming it did it correctly, and the DT is
>> correct also) I'll eventually end up in overwriting it with the same
>> value.
>>
>> Do you agree with this ?
>>
> Ok to overwrite it if you have devicetree data, but otherwise you should
> not touch it.

OK

>
>>>> +             if (ret)
>>>> +                     return ret;
>>>> +             priv->config &= ~STTS751_CONF_EVENT_DIS;
>>>> +     }
>>>> +
>>>> +     if (priv->gen_therm) {
>>>> +             ret = stts751_set_temp_reg(priv, priv->therm, false,
>>>> +                                     STTS751_REG_TLIM, 0);
>>>> +             if (ret)
>>>> +                     return ret;
>>>> +
>>>> +             ret = stts751_set_temp_reg(priv, priv->hyst, false,
>>>> +                                     STTS751_REG_HYST, 0);
>>>> +             if (ret)
>>>> +                     return ret;
>>>> +     }
>>>> +
>>>> +     priv->config &= ~STTS751_CONF_STOP;
>>>> +     ret = i2c_smbus_write_byte_data(priv->client,
>>>> +                                     STTS751_REG_CONF, priv->config);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_input, NULL, 0);
>>>> +static SENSOR_DEVICE_ATTR(temp1_event_min, S_IWUSR | S_IRUGO,
>>>> +                     show_min, set_min, 0);
>>>> +static SENSOR_DEVICE_ATTR(temp1_event_max, S_IWUSR | S_IRUGO,
>>>> +                     show_max, set_max, 0);
>>>> +static SENSOR_DEVICE_ATTR(temp1_event_min_alert, S_IWUSR | S_IRUGO,
>>>> +                     show_min_alert, set_min_alert, 0);
>>>> +static SENSOR_DEVICE_ATTR(temp1_event_max_alert, S_IWUSR | S_IRUGO,
>>>> +                     show_max_alert, set_max_alert, 0);
>>>> +static SENSOR_DEVICE_ATTR(temp1_therm, S_IWUSR | S_IRUGO, show_therm,
>>>> +                     set_therm, 0);
>>>> +static SENSOR_DEVICE_ATTR(temp1_therm_hyst, S_IWUSR | S_IRUGO,
>>>> show_hyst,
>>>> +                     set_hyst, 0);
>>>
>>>
>>> Please use standard attribute names.
>>
>>
>> I can convert the event stuff in temp1_[min/max]_alarm for limits and
>> temp1_alarm for the flag, but it's not obvious to be what should I use
>> for the therm stuff.. May you please give me advices about this?
>>
>> I'd propose temp1_therm_[max/min]_hyst, but they seems not standard
>> anyway...
>>
>
> From the chip datasheet, this is supposed to reflect overtemperature
> conditions,
> stronger than high/low, thus 'crit' seems appropriate.

I see.. I can go with 'crit' :)

Just is there any place where I can document this? Despite the
datasheet, I can easily imagine real-world usage scenarios, for
example driving a fan from that signal, where 'crit' might be not so
intuitive.. Indeed I would like to make it visible the 'crit'
<->'therm' binding to users. Maybe an additional attribute
'temp1_crit_label' or something like that ?

>
>>>
>>>> +static SENSOR_DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
>>>> +                     show_interval, set_interval, 0);
>>>> +
>>>> +/* always present */
>>>> +static struct attribute *stts751_temp_attrs[] = {
>>>> +     &sensor_dev_attr_temp1_input.dev_attr.attr,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group stts751_temp_group = {
>>>> +     .attrs = stts751_temp_attrs,
>>>> +};
>>>> +
>>>> +/* present when therm pin or event pin are connected */
>>>> +static struct attribute *stts751_interval_attrs[] = {
>>>> +     &sensor_dev_attr_update_interval.dev_attr.attr,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group stts751_interval_group = {
>>>> +     .attrs = stts751_interval_attrs,
>>>> +};
>>>> +
>>>> +/* present when event pin is connected */
>>>> +static struct attribute *stts751_event_attrs[] = {
>>>> +     &sensor_dev_attr_temp1_event_min.dev_attr.attr,
>>>> +     &sensor_dev_attr_temp1_event_max.dev_attr.attr,
>>>> +     &sensor_dev_attr_temp1_event_min_alert.dev_attr.attr,
>>>> +     &sensor_dev_attr_temp1_event_max_alert.dev_attr.attr,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group stts751_event_group = {
>>>> +     .attrs = stts751_event_attrs,
>>>> +};
>>>> +
>>>> +/* present when therm pin is connected */
>>>> +static struct attribute *stts751_therm_attrs[] = {
>>>> +     &sensor_dev_attr_temp1_therm.dev_attr.attr,
>>>> +     &sensor_dev_attr_temp1_therm_hyst.dev_attr.attr,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group stts751_therm_group = {
>>>> +     .attrs = stts751_therm_attrs,
>>>> +};
>>>> +
>>>> +static int stts751_probe(struct i2c_client *client,
>>>> +                      const struct i2c_device_id *id)
>>>> +{
>>>> +     struct stts751_priv *priv;
>>>> +     int ret;
>>>> +     int groups_idx = 0;
>>>> +     struct device_node *np = client->dev.of_node;
>>>> +
>>>> +     priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>>>> +     if (!priv)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     priv->client = client;
>>>> +     i2c_set_clientdata(client, priv);
>>>> +     mutex_init(&priv->access_lock);
>>>> +
>>>> +     /* default to 2 samples per second */
>>>> +     priv->interval = 5;
>>>> +     /* default to timeout enable, as per chip default */
>>>> +     priv->smbus_timeout = true;
>>>> +     priv->last_update = 0;
>>>> +     priv->data_valid = false;
>>>> +     priv->max_alert = false;
>>>> +     priv->min_alert = false;
>>>> +     priv->gen_therm = false;
>>>> +     priv->gen_event = false;
>>>
>>>
>>> Unnecessary initializations.
>>
>>
>> OK
>>
>>>
>>>> +     priv->therm = STTS751_THERM_DEFAULT;
>>>> +     priv->hyst = STTS751_HYST_DEFAULT;
>>>> +     priv->event_max = STTS751_EVENT_MAX_DEFAULT;
>>>> +     priv->event_min = STTS751_EVENT_MIN_DEFAULT;
>>>> +
>>>
>>> I think it would be better to read the initial values from the chip
>>> (also see above).
>>>
>>
>> OK
>>
>>>> +     if (np) {
>>>> +             priv->gen_therm = of_property_read_bool(np, "has-therm");
>>>> +             priv->gen_event = of_property_read_bool(np, "has-event");
>>>> +             priv->smbus_timeout = !of_property_read_bool(np,
>>>> +                                             "smbus-timeout-disable");
>>>> +     } else {
>>>> +             dev_notice(&client->dev, "No DT data. Event/therm
>>>> disabled\n");
>>>
>>>
>>> Seems to be quite rude to penaltize non-DT systems this way.
>>
>>
>> That's gone since the two props "has-therm" and "has-event" are now
>> gone. Any suggestion please about how to get the
>> "smbus-timeout-disable" stuff in non-DT case ?
>>
> Platform data, or better use device properties for both cases.

OK, I've switched to device properties.

>
>>>> +     }
>>>> +
>>>> +     dev_dbg(&client->dev, "gen_event: %s, gen_therm: %s",
>>>> +             priv->gen_event ? "YES" : "NO",
>>>> +             priv->gen_therm ? "YES" : "NO");
>>>> +
>>>> +     priv->groups[groups_idx++] = &stts751_temp_group;
>>>> +     priv->groups[groups_idx++] = &stts751_interval_group;
>>>
>>>
>>> Any reason for having multiple groups here ?
>>
>>
>> Not anymore, as per your suggesion below, they are gone :)
>>
>>>> +
>>>> +     if (priv->gen_therm)
>>>> +             priv->groups[groups_idx++] = &stts751_therm_group;
>>>> +
>>>> +     if (priv->gen_event)
>>>> +             priv->groups[groups_idx++] = &stts751_event_group;
>>>> +
>>>
>>> Why are those groups optional ? This is quite unusual. Even if the chip
>>> is not
>>> connected to alert or interrupt lines, it still supports limit registers
>>> and
>>> reports alerts. On top of that, at least interrupt support can be
>>> detected
>>> automatically (from client->irq) and would not need a devicetree
>>> property.
>>
>>
>> Props "has-therm" and "has-event" gone; please see above about IRQ stuf..
>>
>>> I think you really only need a single group, and all attributes should
>>> always
>>> be available.
>>
>>
>> OK
>>
>>>
>>>> +     priv->groups[groups_idx] = NULL;
>>>
>>>
>>> Unnecessary initialization. devm_kzalloc() initializes priv with 0.
>>
>>
>> OK
>>
>>>> +
>>>> +     ret = stts751_init_chip(priv);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     priv->dev = devm_hwmon_device_register_with_groups(&client->dev,
>>>> +                                                     client->name,
>>>> priv,
>>>> +                                                     priv->groups);
>>>> +     return PTR_ERR_OR_ZERO(priv->dev);
>>>> +}
>>>> +
>>>> +static const struct i2c_device_id stts751_id[] = {
>>>> +     { "stts751", 0 },
>>>> +     { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(i2c, stts751_id);
>>>> +
>>>> +static struct i2c_driver stts751_driver = {
>>>> +     .class          = I2C_CLASS_HWMON,
>>>> +     .driver = {
>>>> +             .name   = DEVNAME,
>>>> +     },
>>>> +     .probe          = stts751_probe,
>>>> +     .id_table       = stts751_id,
>>>> +     .detect         = stts751_detect,
>>>> +     .alert          = stts751_alert,
>>>> +     .address_list   = normal_i2c,
>>>> +};
>>>> +
>>>> +module_i2c_driver(stts751_driver);
>>>> +
>>>> +MODULE_AUTHOR("Andrea Merello <andrea.merello@gmail.com>");
>>>> +MODULE_DESCRIPTION("STTS751 sensor driver");
>>>> +MODULE_LICENSE("GPL");
>>>> --
>>>> 2.7.4
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon"
>>>> in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
