Return-Path: <joel.stan@gmail.com>
Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <49c93415-8e92-68f5-b97a-0b270c40e3c6@linux.vnet.ibm.com>
References: <20170606070230.32669-1-andrew@aj.id.au> <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
 <49c93415-8e92-68f5-b97a-0b270c40e3c6@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2017 12:18:11 +0930
Message-ID: <CACPK8Xd4B0o_1e1L_RwNTY7rmYy-09ucgF_O2MrxL27h6z0H=g@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan controller
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Jun 7, 2017 at 1:50 AM, Matthew Barth
<msbarth@linux.vnet.ibm.com> wrote:
>
> On 06/06/17 8:33 AM, Guenter Roeck wrote:
>>
>> On 06/06/2017 12:02 AM, Andrew Jeffery wrote:
>>> Over and above the features of the original patch is support for a
>>> secondary
>>> rotor measurement value that is provided by MAX31785 chips with a revised
>>> firmware. The feature(s) of the firmware are determined at probe time and
>>> extra
>>> attributes exposed accordingly. Specifically, the MFR_REVISION 0x3040 of
>>> the
>>> firmware supports 'slow' and 'fast' rotor reads. The feature is
>>> implemented by
>>> command 0x90 (READ_FAN_SPEED_1) providing a 4-byte response (with the
>>> 'fast'
>>> measurement in the second word) rather than the 2-bytes response in the
>>> original firmware (MFR_REVISION 0x3030).
>>>
>>
>> Taking the pmbus driver question out, why would this warrant another
>> non-standard
>> attribute outside the ABI ? I could see the desire to replace the 'slow'
>> access
>> with the 'fast' one, but provide two attributes ? No, I don't see the
>> point, sorry,
>> even more so without detailed explanation why the second attribute in
>> addition
>> to the first one would add any value.
>
> In the case of counter-rotating(CR) fans which contain two rotors to provide
> more airflow there are then two tach feedbacks. These CR fans take a single
> target speed and provide individual feedbacks for each rotor contained
> within the fan enclosure. Providing these individual feedbacks assists in
> fan fault driven speed changes, improved thermal characterization among
> other things.
>
> Maxim provided this as a 'slow' / 'fast' set of bytes to be user
> compatible(so the 'slow' rotor speed, regardless of which rotor, is in the
> first 2 bytes with the 'slow' version of firmware as well). In some cases,
> mfg systems could have a mix of these revisions.

Andrew, instead of creating the _fast sysfs nodes, I think you could
expose the extra rotors are separate fan devices in sysfs. This would
not introduce new ABI.

Guenter, would this be acceptable to you?

Cheers,

Joel


>
>>
>>> This feature is not documented in the public datasheet[1].
>>>
>>> [1] https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
>>>
>>> The need to read a 4-byte value drives the addition of a helper that is a
>>> cut-down version of i2c_smbus_xfer_emulated(), as 4-byte transactions
>>> aren't a
>>> defined transaction type in the PMBus spec. This seemed more tasteful
>>> than
>>> hacking the PMBus core to support the quirks of a single device.
>>>
>>
>> That is why we have PMBus helper drivers.
>>
>> Guenter
>>
>>> Also changed from Timothy's original posting is I've massaged the locking
>>> a bit
>>> and removed what seemed to be a copy/paste bug around
>>> max31785_fan_set_pulses()
>>> setting the fan_command member.
>>>
>>> Tested on an IBM Witherspoon machine.
>>>
>>> Cheers,
>>>
>>> Andrew
>>>
>>>   Documentation/hwmon/max31785 |  44 +++
>>>   drivers/hwmon/Kconfig        |  10 +
>>>   drivers/hwmon/Makefile       |   1 +
>>>   drivers/hwmon/max31785.c     | 824
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>   4 files changed, 879 insertions(+)
>>>   create mode 100644 Documentation/hwmon/max31785
>>>   create mode 100644 drivers/hwmon/max31785.c
>>>
>>> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
>>> new file mode 100644
>>> index 000000000000..dd891c06401e
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/max31785
>>> @@ -0,0 +1,44 @@
>>> +Kernel driver max31785
>>> +======================
>>> +
>>> +Supported chips:
>>> +  * Maxim MAX31785
>>> +    Prefix: 'max31785'
>>> +    Addresses scanned: 0x52 0x53 0x54 0x55
>>> +    Datasheet: http://pdfserv.maximintegrated.com/en/ds/MAX31785.pdf
>>> +
>>> +Author: Timothy Pearson <tpearson@raptorengineering.com>
>>> +
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +This driver implements support for the Maxim MAX31785 chip.
>>> +
>>> +The MAX31785 controls the speeds of up to six fans using six independent
>>> +PWM outputs. The desired fan speeds (or PWM duty cycles) are written
>>> +through the I2C interface. The outputs drive "4-wire" fans directly,
>>> +or can be used to modulate the fan's power terminals using an external
>>> +pass transistor.
>>> +
>>> +Tachometer inputs monitor fan tachometer logic outputs for precise
>>> (+/-1%)
>>> +monitoring and control of fan RPM as well as detection of fan failure.
>>> +
>>> +
>>> +Sysfs entries
>>> +-------------
>>> +
>>> +fan[1-6]_input           RO  fan tachometer speed in RPM
>>> +fan[1-6]_fault           RO  fan experienced fault
>>> +fan[1-6]_pulses          RW  tachometer pulses per fan revolution
>>> +fan[1-6]_target          RW  desired fan speed in RPM
>>> +pwm[1-6]_enable          RW  pwm mode, 0=disabled, 1=pwm, 2=rpm,
>>> 3=automatic
>>> +pwm[1-6]                 RW  fan target duty cycle (0-255)
>>> +
>>> +Dynamic sysfs entries
>>> +--------------------
>>> +
>>> +Whether these entries are present depends on the firmware features
>>> detected on
>>> +the device during probe.
>>> +
>>> +fan[1-6]_input_fast      RO  fan tachometer speed in RPM (fast rotor
>>> measurement)
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index e80ca81577f4..c75d6072c823 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -886,6 +886,16 @@ config SENSORS_MAX6697
>>>         This driver can also be built as a module.  If so, the module
>>>         will be called max6697.
>>>   +config SENSORS_MAX31785
>>> +    tristate "Maxim MAX31785 sensor chip"
>>> +    depends on I2C
>>> +    help
>>> +      If you say yes here you get support for 6-Channel PWM-Output
>>> +      Fan RPM Controller.
>>> +
>>> +      This driver can also be built as a module.  If so, the module
>>> +      will be called max31785.
>>> +
>>>   config SENSORS_MAX31790
>>>       tristate "Maxim MAX31790 sensor chip"
>>>       depends on I2C
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index f03dd0a15933..dc55722bee88 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -119,6 +119,7 @@ obj-$(CONFIG_SENSORS_MAX6639)    += max6639.o
>>>   obj-$(CONFIG_SENSORS_MAX6642)    += max6642.o
>>>   obj-$(CONFIG_SENSORS_MAX6650)    += max6650.o
>>>   obj-$(CONFIG_SENSORS_MAX6697)    += max6697.o
>>> +obj-$(CONFIG_SENSORS_MAX31785)    += max31785.o
>>>   obj-$(CONFIG_SENSORS_MAX31790)    += max31790.o
>>>   obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>>>   obj-$(CONFIG_SENSORS_MCP3021)    += mcp3021.o
>>> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
>>> new file mode 100644
>>> index 000000000000..fc03b7c8e723
>>> --- /dev/null
>>> +++ b/drivers/hwmon/max31785.c
>>> @@ -0,0 +1,824 @@
>>> +/*
>>> + * max31785.c - Part of lm_sensors, Linux kernel modules for hardware
>>> + *           monitoring.
>>> + *
>>> + * (C) 2016 Raptor Engineering, LLC
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/init.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +
>>> +/* MAX31785 device IDs */
>>> +#define MAX31785_MFR_ID                0x4d
>>> +#define MAX31785_MFR_MODEL            0x53
>>> +
>>> +/* MAX31785 registers */
>>> +#define MAX31785_REG_PAGE            0x00
>>> +#define MAX31785_PAGE_FAN_CONFIG(ch)        (0x00 + (ch))
>>> +#define MAX31785_REG_FAN_CONFIG_1_2        0x3a
>>> +#define MAX31785_REG_FAN_COMMAND_1        0x3b
>>> +#define MAX31785_REG_STATUS_FANS_1_2        0x81
>>> +#define MAX31785_REG_FAN_SPEED_1        0x90
>>> +#define MAX31785_REG_MFR_ID            0x99
>>> +#define MAX31785_REG_MFR_MODEL            0x9a
>>> +#define MAX31785_REG_MFR_REVISION        0x9b
>>> +#define MAX31785_REG_MFR_FAN_CONFIG        0xf1
>>> +#define MAX31785_REG_READ_FAN_PWM        0xf3
>>> +
>>> +/* Fan Config register bits */
>>> +#define MAX31785_FAN_CFG_PWM_ENABLE        0x80
>>> +#define MAX31785_FAN_CFG_CONTROL_MODE_RPM    0x40
>>> +#define MAX31785_FAN_CFG_PULSE_MASK        0x30
>>> +#define MAX31785_FAN_CFG_PULSE_SHIFT        4
>>> +#define MAX31785_FAN_CFG_PULSE_OFFSET        1
>>> +
>>> +/* Fan Status register bits */
>>> +#define MAX31785_FAN_STATUS_FAULT_MASK        0x80
>>> +
>>> +/* Fan Command constants */
>>> +#define MAX31785_FAN_COMMAND_PWM_RATIO        40
>>> +
>>> +#define NR_CHANNEL                6
>>> +
>>> +/* Addresses to scan */
>>> +static const unsigned short normal_i2c[] = {
>>> +    0x52, 0x53, 0x54, 0x55,
>>> +    I2C_CLIENT_END
>>> +};
>>> +
>>> +#define MAX31785_CAP_FAST_ROTOR BIT(0)
>>> +
>>> +/*
>>> + * Client data (each client gets its own)
>>> + *
>>> + * @lock:        Protects device access and access to cached values
>>> + * @valid:        False until fields below it are valid
>>> + * @last_updated:    Last update time in jiffies
>>> + */
>>> +struct max31785 {
>>> +    struct i2c_client    *client;
>>> +    struct mutex        lock;
>>> +    bool            valid;
>>> +    unsigned long        last_updated;
>>> +    u32            capabilities;
>>> +
>>> +    /* Registers */
>>> +    u8    fan_config[NR_CHANNEL];
>>> +    u16    fan_command[NR_CHANNEL];
>>> +    u8    mfr_fan_config[NR_CHANNEL];
>>> +    u8    fault_status[NR_CHANNEL];
>>> +    u16    pwm[NR_CHANNEL];
>>> +    u16    tach_rpm[NR_CHANNEL];
>>> +    u16    tach_rpm_fast[NR_CHANNEL];
>>> +};
>>> +
>>> +static int max31785_set_page(struct i2c_client *client,
>>> +                u8 page)
>>> +{
>>> +    return i2c_smbus_write_byte_data(client, MAX31785_REG_PAGE, page);
>>> +}
>>> +
>>> +static int read_fan_data(struct i2c_client *client, u8 fan, u8 reg,
>>> +                  s32 (*read)(const struct i2c_client *, u8))
>>> +{
>>> +    int rv;
>>> +
>>> +    rv = max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
>>> +    if (rv < 0)
>>> +        return rv;
>>> +
>>> +    return read(client, reg);
>>> +}
>>> +
>>> +static inline int max31785_read_fan_byte(struct i2c_client *client, u8
>>> fan,
>>> +                     u8 reg)
>>> +{
>>> +    return read_fan_data(client, fan, reg, i2c_smbus_read_byte_data);
>>> +}
>>> +
>>> +static inline int max31785_read_fan_word(struct i2c_client *client, u8
>>> fan,
>>> +                     u8 reg)
>>> +{
>>> +    return read_fan_data(client, fan, reg, i2c_smbus_read_word_data);
>>> +}
>>> +
>>> +static int max31785_write_fan_byte(struct i2c_client *client, u8 fan,
>>> +                     u8 reg, u8 data)
>>> +{
>>> +    int err;
>>> +
>>> +    err = max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
>>> +    if (err < 0)
>>> +        return err;
>>> +
>>> +    return i2c_smbus_write_byte_data(client, reg, data);
>>> +}
>>> +
>>> +static int max31785_write_fan_word(struct i2c_client *client, u8 fan,
>>> +                     u8 reg, u16 data)
>>> +{
>>> +    int err;
>>> +
>>> +    err = max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
>>> +    if (err < 0)
>>> +        return err;
>>> +
>>> +    return i2c_smbus_write_word_data(client, reg, data);
>>> +}
>>> +
>>> +/* Cut down version of i2c_smbus_xfer_emulated(), reading 4 bytes */
>>> +static s64 max31785_smbus_read_long_data(struct i2c_client *client, u8
>>> command)
>>> +{
>>> +    unsigned char cmdbuf[1];
>>> +    unsigned char rspbuf[4];
>>> +    s64 rc;
>>> +
>>> +    struct i2c_msg msg[2] = {
>>> +        {
>>> +            .addr = client->addr,
>>> +            .flags = 0,
>>> +            .len = sizeof(cmdbuf),
>>> +            .buf = cmdbuf,
>>> +        },
>>> +        {
>>> +            .addr = client->addr,
>>> +            .flags = I2C_M_RD,
>>> +            .len = sizeof(rspbuf),
>>> +            .buf = rspbuf,
>>> +        },
>>> +    };
>>> +
>>> +    cmdbuf[0] = command;
>>> +
>>> +    rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
>>> +    if (rc < 0)
>>> +        return rc;
>>> +
>>> +    rc = (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
>>> +         (rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
>>> +{
>>> +    s64 rc;
>>> +
>>> +    rc = max31785_set_page(data->client, MAX31785_PAGE_FAN_CONFIG(fan));
>>> +    if (rc)
>>> +        return rc;
>>> +
>>> +    if (data->capabilities & MAX31785_CAP_FAST_ROTOR) {
>>> +        rc = max31785_smbus_read_long_data(data->client,
>>> +                MAX31785_REG_FAN_SPEED_1);
>>> +        if (rc < 0)
>>> +            return rc;
>>> +
>>> +        data->tach_rpm[fan] = rc & 0xffff;
>>> +        data->tach_rpm_fast[fan] = (rc >> 16) & 0xffff;
>>> +
>>> +        return rc;
>>> +    }
>>> +
>>> +    rc = i2c_smbus_read_word_data(data->client,
>>> MAX31785_REG_FAN_SPEED_1);
>>> +    if (rc < 0)
>>> +        return rc;
>>> +
>>> +    data->tach_rpm[fan] = rc;
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static inline bool is_automatic_control_mode(struct max31785 *data,
>>> +            int index)
>>> +{
>>> +    return data->fan_command[index] > 0x7fff;
>>> +}
>>> +
>>> +static struct max31785 *max31785_update_device(struct device *dev)
>>> +{
>>> +    struct max31785 *data = dev_get_drvdata(dev);
>>> +    struct i2c_client *client = data->client;
>>> +    struct max31785 *ret = data;
>>> +    int rv;
>>> +    int i;
>>> +
>>> +    mutex_lock(&data->lock);
>>> +
>>> +    if (!time_after(jiffies, data->last_updated + HZ) && data->valid) {
>>> +        mutex_unlock(&data->lock);
>>> +
>>> +        return ret;
>>> +    }
>>> +
>>> +    for (i = 0; i < NR_CHANNEL; i++) {
>>> +        rv = max31785_read_fan_byte(client, i,
>>> +                MAX31785_REG_STATUS_FANS_1_2);
>>> +        if (rv < 0)
>>> +            goto abort;
>>> +        data->fault_status[i] = rv;
>>> +
>>> +        rv = max31785_update_fan_speed(data, i);
>>> +        if (rv < 0)
>>> +            goto abort;
>>> +
>>> +        if ((data->fan_config[i]
>>> +                    & MAX31785_FAN_CFG_CONTROL_MODE_RPM)
>>> +                || is_automatic_control_mode(data, i)) {
>>> +            rv = max31785_read_fan_word(client, i,
>>> +                    MAX31785_REG_READ_FAN_PWM);
>>> +            if (rv < 0)
>>> +                goto abort;
>>> +            data->pwm[i] = rv;
>>> +        }
>>> +
>>> +        if (!is_automatic_control_mode(data, i)) {
>>> +            /*
>>> +             * Poke watchdog for manual fan control
>>> +             *
>>> +             * XXX (AJ): This isn't documented in the MAX31785
>>> +             * datasheet, or anywhere else it seems.
>>> +             */
>>> +            rv = max31785_write_fan_word(client,
>>> +                    i, MAX31785_REG_FAN_COMMAND_1,
>>> +                    data->fan_command[i]);
>>> +            if (rv < 0)
>>> +                goto abort;
>>> +        }
>>> +    }
>>> +
>>> +    data->last_updated = jiffies;
>>> +    data->valid = true;
>>> +
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return ret;
>>> +
>>> +abort:
>>> +    data->valid = false;
>>> +
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return ERR_PTR(rv);
>>> +
>>> +}
>>> +
>>> +static ssize_t max31785_fan_set_target(struct max31785 *data, int
>>> channel,
>>> +        long rpm)
>>> +{
>>> +    int rc;
>>> +
>>> +    if (rpm > 0x7fff)
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&data->lock);
>>> +
>>> +    /* Write new RPM value */
>>> +    data->fan_command[channel] = rpm;
>>> +    rc = max31785_write_fan_word(data->client, channel,
>>> +                MAX31785_REG_FAN_COMMAND_1,
>>> +                data->fan_command[channel]);
>>> +
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static ssize_t max31785_fan_set_pulses(struct max31785 *data, int
>>> channel,
>>> +        long pulses)
>>> +{
>>> +    int rc;
>>> +
>>> +    if (pulses > 4)
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&data->lock);
>>> +
>>> +    /* XXX (AJ): This sequence disables the fan and sets in PWM mode */
>>> +    data->fan_config[channel] &= MAX31785_FAN_CFG_PULSE_MASK;
>>> +    data->fan_config[channel] |= ((pulses -
>>> MAX31785_FAN_CFG_PULSE_OFFSET)
>>> +                    << MAX31785_FAN_CFG_PULSE_SHIFT);
>>> +
>>> +    /* Write new pulse value */
>>> +    rc = max31785_write_fan_byte(data->client, channel,
>>> +                MAX31785_REG_FAN_CONFIG_1_2,
>>> +                data->fan_config[channel]);
>>> +
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static ssize_t max31785_pwm_set(struct max31785 *data, int channel, long
>>> pwm)
>>> +{
>>> +    int rc;
>>> +
>>> +    if (pwm > 255)
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&data->lock);
>>> +
>>> +    /* Write new PWM value */
>>> +    data->fan_command[channel] = pwm * MAX31785_FAN_COMMAND_PWM_RATIO;
>>> +    rc = max31785_write_fan_word(data->client, channel,
>>> +                MAX31785_REG_FAN_COMMAND_1,
>>> +                data->fan_command[channel]);
>>> +
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static ssize_t max31785_pwm_enable(struct max31785 *data, int channel,
>>> +        long mode)
>>> +{
>>> +    struct i2c_client *client = data->client;
>>> +    int rc;
>>> +
>>> +    mutex_lock(&data->lock);
>>> +
>>> +    switch (mode) {
>>> +    case 0:
>>> +        data->fan_config[channel] =
>>> +            data->fan_config[channel]
>>> +            & ~MAX31785_FAN_CFG_PWM_ENABLE;
>>> +        break;
>>> +    case 1: /* fallthrough */
>>> +    case 2: /* fallthrough */
>>> +    case 3:
>>> +        data->fan_config[channel] =
>>> +            data->fan_config[channel]
>>> +             | MAX31785_FAN_CFG_PWM_ENABLE;
>>> +        break;
>>> +    default:
>>> +        rc = -EINVAL;
>>> +        goto done;
>>> +
>>> +    }
>>> +
>>> +    switch (mode) {
>>> +    case 0:
>>> +        break;
>>> +    case 1:
>>> +        data->fan_config[channel] =
>>> +            data->fan_config[channel]
>>> +            & ~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
>>> +        break;
>>> +    case 2:
>>> +        data->fan_config[channel] =
>>> +            data->fan_config[channel]
>>> +            | MAX31785_FAN_CFG_CONTROL_MODE_RPM;
>>> +        break;
>>> +    case 3:
>>> +        data->fan_command[channel] = 0xffff;
>>> +        break;
>>> +    default:
>>> +        rc = -EINVAL;
>>> +        goto done;
>>> +    }
>>> +
>>> +    rc = max31785_write_fan_byte(client, channel,
>>> +                MAX31785_REG_FAN_CONFIG_1_2,
>>> +                data->fan_config[channel]);
>>> +
>>> +    if (!rc)
>>> +        rc = max31785_write_fan_word(client, channel,
>>> +                MAX31785_REG_FAN_COMMAND_1,
>>> +                data->fan_command[channel]);
>>> +
>>> +done:
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_init_fans(struct max31785 *data)
>>> +{
>>> +    struct i2c_client *client = data->client;
>>> +    int i, rv;
>>> +
>>> +    for (i = 0; i < NR_CHANNEL; i++) {
>>> +        rv = max31785_read_fan_byte(client, i,
>>> +                MAX31785_REG_FAN_CONFIG_1_2);
>>> +        if (rv < 0)
>>> +            return rv;
>>> +        data->fan_config[i] = rv;
>>> +
>>> +        rv = max31785_read_fan_word(client, i,
>>> +                MAX31785_REG_FAN_COMMAND_1);
>>> +        if (rv < 0)
>>> +            return rv;
>>> +        data->fan_command[i] = rv;
>>> +
>>> +        rv = max31785_read_fan_byte(client, i,
>>> +                MAX31785_REG_MFR_FAN_CONFIG);
>>> +        if (rv < 0)
>>> +            return rv;
>>> +        data->mfr_fan_config[i] = rv;
>>> +
>>> +        if (!((data->fan_config[i]
>>> +            & MAX31785_FAN_CFG_CONTROL_MODE_RPM)
>>> +            || is_automatic_control_mode(data, i))) {
>>> +            data->pwm[i] = 0;
>>> +        }
>>> +    }
>>> +
>>> +    return rv;
>>> +}
>>> +
>>> +/* Return 0 if detection is successful, -ENODEV otherwise */
>>> +static int max31785_detect(struct i2c_client *client,
>>> +              struct i2c_board_info *info)
>>> +{
>>> +    struct i2c_adapter *adapter = client->adapter;
>>> +    int rv;
>>> +
>>> +    if (!i2c_check_functionality(adapter,
>>> +            I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
>>> +        return -ENODEV;
>>> +
>>> +    /* Probe manufacturer / model registers */
>>> +    rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_ID);
>>> +    if (rv < 0)
>>> +        return -ENODEV;
>>> +    if (rv != MAX31785_MFR_ID)
>>> +        return -ENODEV;
>>> +
>>> +    rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_MODEL);
>>> +    if (rv < 0)
>>> +        return -ENODEV;
>>> +    if (rv != MAX31785_MFR_MODEL)
>>> +        return -ENODEV;
>>> +
>>> +    strlcpy(info->type, "max31785", I2C_NAME_SIZE);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const u32 max31785_fan_config[] = {
>>> +    HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>>> +    HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>>> +    HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>>> +    HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>>> +    HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>>> +    HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
>>> +    0
>>> +};
>>> +
>>> +static const struct hwmon_channel_info max31785_fan = {
>>> +    .type = hwmon_fan,
>>> +    .config = max31785_fan_config,
>>> +};
>>> +
>>> +static const u32 max31785_pwm_config[] = {
>>> +    HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>>> +    HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>>> +    HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>>> +    HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>>> +    HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>>> +    HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>>> +    0,
>>> +};
>>> +
>>> +static const struct hwmon_channel_info max31785_pwm = {
>>> +    .type = hwmon_pwm,
>>> +    .config = max31785_pwm_config
>>> +};
>>> +
>>> +static const struct hwmon_channel_info *max31785_info[] = {
>>> +    &max31785_fan,
>>> +    &max31785_pwm,
>>> +    NULL,
>>> +};
>>> +
>>> +static int max31785_read_fan(struct max31785 *data, u32 attr, int
>>> channel,
>>> +        long *val)
>>> +{
>>> +    int rc = 0;
>>> +
>>> +    switch (attr) {
>>> +    case hwmon_fan_pulses:
>>> +    {
>>> +        long pulses;
>>> +
>>> +        pulses = data->fan_config[channel];
>>> +        pulses &= MAX31785_FAN_CFG_PULSE_MASK;
>>> +        pulses >>= MAX31785_FAN_CFG_PULSE_SHIFT;
>>> +        pulses += MAX31785_FAN_CFG_PULSE_OFFSET;
>>> +
>>> +        *val = pulses;
>>> +        break;
>>> +    }
>>> +    case hwmon_fan_target:
>>> +    {
>>> +        long target;
>>> +
>>> +        mutex_lock(&data->lock);
>>> +
>>> +        target = data->fan_command[channel];
>>> +
>>> +        if (!(data->fan_config[channel] &
>>> +                MAX31785_FAN_CFG_CONTROL_MODE_RPM))
>>> +            target /= MAX31785_FAN_COMMAND_PWM_RATIO;
>>> +
>>> +        *val = target;
>>> +
>>> +        mutex_unlock(&data->lock);
>>> +
>>> +        break;
>>> +    }
>>> +    case hwmon_fan_input:
>>> +        *val = data->tach_rpm[channel];
>>> +        break;
>>> +    case hwmon_fan_fault:
>>> +        *val = !!(data->fault_status[channel] &
>>> +                MAX31785_FAN_STATUS_FAULT_MASK);
>>> +        break;
>>> +    default:
>>> +        rc = -EOPNOTSUPP;
>>> +        break;
>>> +    };
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_fan_get_fast(struct device *dev,
>>> +                struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct sensor_device_attribute_2 *attr2 =
>>> to_sensor_dev_attr_2(attr);
>>> +    struct max31785 *data = max31785_update_device(dev);
>>> +
>>> +    return sprintf(buf, "%d\n", data->tach_rpm_fast[attr2->index]);
>>> +}
>>> +
>>> +static int max31785_read_pwm(struct max31785 *data, u32 attr, int
>>> channel,
>>> +        long *val)
>>> +{
>>> +    bool is_auto;
>>> +    bool is_rpm;
>>> +    int rc;
>>> +
>>> +    mutex_lock(&data->lock);
>>> +
>>> +    is_rpm = !!(data->fan_config[channel] &
>>> +            MAX31785_FAN_CFG_CONTROL_MODE_RPM);
>>> +    is_auto = is_automatic_control_mode(data, channel);
>>> +
>>> +    switch (attr) {
>>> +    case hwmon_pwm_enable:
>>> +    {
>>> +        bool pwm_enabled;
>>> +
>>> +        pwm_enabled = (data->fan_config[channel] &
>>> +                MAX31785_FAN_CFG_PWM_ENABLE);
>>> +
>>> +        if (!pwm_enabled)
>>> +            *val = 0;
>>> +        else if (is_auto)
>>> +            *val = 3;
>>> +        else if (is_rpm)
>>> +            *val = 2;
>>> +        else
>>> +            *val = 1;
>>> +        break;
>>> +    }
>>> +    case hwmon_pwm_input:
>>> +        if (is_rpm || is_auto)
>>> +            *val = data->pwm[channel] / 100;
>>> +        else
>>> +            *val = data->fan_command[channel]
>>> +                / MAX31785_FAN_COMMAND_PWM_RATIO;
>>> +        break;
>>> +    default:
>>> +        rc = -EOPNOTSUPP;
>>> +    };
>>> +
>>> +    mutex_unlock(&data->lock);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_read(struct device *dev, enum hwmon_sensor_types
>>> type,
>>> +        u32 attr, int channel, long *val)
>>> +{
>>> +    struct max31785 *data;
>>> +    int rc;
>>> +
>>> +    data = max31785_update_device(dev);
>>> +
>>> +    if (IS_ERR(data))
>>> +        return PTR_ERR(data);
>>> +
>>> +    switch (type) {
>>> +    case hwmon_fan:
>>> +        return max31785_read_fan(data, attr, channel, val);
>>> +    case hwmon_pwm:
>>> +        return max31785_read_pwm(data, attr, channel, val);
>>> +    default:
>>> +        rc = -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_write_fan(struct max31785 *data, u32 attr, int
>>> channel,
>>> +        long val)
>>> +{
>>> +    int rc;
>>> +
>>> +    switch (attr) {
>>> +        break;
>>> +    case hwmon_fan_pulses:
>>> +        return max31785_fan_set_pulses(data, channel, val);
>>> +    case hwmon_fan_target:
>>> +        return max31785_fan_set_target(data, channel, val);
>>> +    default:
>>> +        rc = -EOPNOTSUPP;
>>> +    };
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_write_pwm(struct max31785 *data, u32 attr, int
>>> channel,
>>> +        long val)
>>> +{
>>> +    int rc;
>>> +
>>> +    switch (attr) {
>>> +    case hwmon_pwm_enable:
>>> +        return max31785_pwm_enable(data, channel, val);
>>> +    case hwmon_pwm_input:
>>> +        return max31785_pwm_set(data, channel, val);
>>> +    default:
>>> +        rc = -EOPNOTSUPP;
>>> +    };
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int max31785_write(struct device *dev, enum hwmon_sensor_types
>>> type,
>>> +        u32 attr, int channel, long val)
>>> +{
>>> +    struct max31785 *data;
>>> +    int rc;
>>> +
>>> +    data = dev_get_drvdata(dev);
>>> +
>>> +    switch (type) {
>>> +    case hwmon_fan:
>>> +        return max31785_write_fan(data, attr, channel, val);
>>> +    case hwmon_pwm:
>>> +        return max31785_write_pwm(data, attr, channel, val);
>>> +    default:
>>> +        rc = -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    return rc;
>>> +
>>> +}
>>> +
>>> +static umode_t max31785_is_visible(const void *_data,
>>> +        enum hwmon_sensor_types type, u32 attr, int channel)
>>> +{
>>> +    switch (type) {
>>> +    case hwmon_fan:
>>> +        switch (attr) {
>>> +        case hwmon_fan_input:
>>> +        case hwmon_fan_fault:
>>> +            return 0444;
>>> +        case hwmon_fan_pulses:
>>> +        case hwmon_fan_target:
>>> +            return 0644;
>>> +        };
>>> +    case hwmon_pwm:
>>> +        return 0644;
>>> +    default:
>>> +        return 0;
>>> +    };
>>> +}
>>> +
>>> +static const struct hwmon_ops max31785_hwmon_ops = {
>>> +    .is_visible = max31785_is_visible,
>>> +    .read = max31785_read,
>>> +    .write = max31785_write,
>>> +};
>>> +
>>> +static const struct hwmon_chip_info max31785_chip_info = {
>>> +    .ops = &max31785_hwmon_ops,
>>> +    .info = max31785_info,
>>> +};
>>> +
>>> +static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast,
>>> +        NULL, 0);
>>> +static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast,
>>> +        NULL, 1);
>>> +static SENSOR_DEVICE_ATTR(fan3_input_fast, 0444, max31785_fan_get_fast,
>>> +        NULL, 2);
>>> +static SENSOR_DEVICE_ATTR(fan4_input_fast, 0444, max31785_fan_get_fast,
>>> +        NULL, 3);
>>> +static SENSOR_DEVICE_ATTR(fan5_input_fast, 0444, max31785_fan_get_fast,
>>> +        NULL, 4);
>>> +static SENSOR_DEVICE_ATTR(fan6_input_fast, 0444, max31785_fan_get_fast,
>>> +        NULL, 5);
>>> +
>>> +static struct attribute *max31785_attrs[] = {
>>> +    &sensor_dev_attr_fan1_input_fast.dev_attr.attr,
>>> +    &sensor_dev_attr_fan2_input_fast.dev_attr.attr,
>>> +    &sensor_dev_attr_fan3_input_fast.dev_attr.attr,
>>> +    &sensor_dev_attr_fan4_input_fast.dev_attr.attr,
>>> +    &sensor_dev_attr_fan5_input_fast.dev_attr.attr,
>>> +    &sensor_dev_attr_fan6_input_fast.dev_attr.attr,
>>> +    NULL,
>>> +};
>>> +ATTRIBUTE_GROUPS(max31785);
>>> +
>>> +static int max31785_get_capabilities(struct max31785 *data)
>>> +{
>>> +    s32 rc;
>>> +
>>> +    rc = i2c_smbus_read_word_data(data->client,
>>> MAX31785_REG_MFR_REVISION);
>>> +    if (rc < 0)
>>> +        return rc;
>>> +
>>> +    if (rc == 0x3040)
>>> +        data->capabilities |= MAX31785_CAP_FAST_ROTOR;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int max31785_probe(struct i2c_client *client,
>>> +              const struct i2c_device_id *id)
>>> +{
>>> +    struct i2c_adapter *adapter = client->adapter;
>>> +    const struct attribute_group **extra_groups;
>>> +    struct device *dev = &client->dev;
>>> +    struct device *hwmon_dev;
>>> +    struct max31785 *data;
>>> +    int rc;
>>> +
>>> +    if (!i2c_check_functionality(adapter,
>>> +            I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
>>> +        return -ENODEV;
>>> +
>>> +    data = devm_kzalloc(dev, sizeof(struct max31785), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    data->client = client;
>>> +    mutex_init(&data->lock);
>>> +
>>> +    rc = max31785_init_fans(data);
>>> +    if (rc)
>>> +        return rc;
>>> +
>>> +    rc = max31785_get_capabilities(data);
>>> +    if (rc < 0)
>>> +        return rc;
>>> +
>>> +    if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
>>> +        extra_groups = max31785_groups;
>>> +
>>> +    hwmon_dev = devm_hwmon_device_register_with_info(dev,
>>> +            client->name, data, &max31785_chip_info, extra_groups);
>>> +
>>> +    return PTR_ERR_OR_ZERO(hwmon_dev);
>>> +}
>>> +
>>> +static const struct i2c_device_id max31785_id[] = {
>>> +    { "max31785", 0 },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, max31785_id);
>>> +
>>> +static struct i2c_driver max31785_driver = {
>>> +    .class        = I2C_CLASS_HWMON,
>>> +    .probe        = max31785_probe,
>>> +    .driver = {
>>> +        .name    = "max31785",
>>> +    },
>>> +    .id_table    = max31785_id,
>>> +    .detect        = max31785_detect,
>>> +    .address_list    = normal_i2c,
>>> +};
>>> +
>>> +module_i2c_driver(max31785_driver);
>>> +
>>> +MODULE_AUTHOR("Timothy Pearson <tpearson@raptorengineering.com>");
>>> +MODULE_DESCRIPTION("MAX31785 sensor driver");
>>> +MODULE_LICENSE("GPL");
>>>
>>
>
