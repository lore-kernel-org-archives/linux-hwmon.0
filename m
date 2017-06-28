Return-Path: <tom.levens@cern.ch>
Return-path: <tom.levens@cern.ch>
Date: Wed, 28 Jun 2017 17:29:38 +0200
From: Tom Levens <tom.levens@cern.ch>
To: Guenter Roeck <linux@roeck-us.net>
CC: Mike Looijmans <mike.looijmans@topic.nl>, Tom Levens <tom.levens@cern.ch>,
	<jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
In-Reply-To: <20170628150130.GC30968@roeck-us.net>
Message-ID: <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch> <1479384616-12479-3-git-send-email-tom.levens@cern.ch> <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net> <97eb089f-e0e2-1146-6e17-8f9f790433d8@topic.nl>
 <20170628150130.GC30968@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="-1195621031-153106770-1498663783=:31209"
List-ID: <linux-hwmon@vger.kernel.org>

---1195621031-153106770-1498663783=:31209
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8BIT



On Wed, 28 Jun 2017, Guenter Roeck wrote:

> On Wed, Jun 28, 2017 at 04:24:03PM +0200, Mike Looijmans wrote:
>> ﻿On 17-11-16 17:56, Guenter Roeck wrote:
>>> On 11/17/2016 04:10 AM, Tom Levens wrote:
>>>> Updated version of the ltc2990 driver which supports all measurement
>>>> modes available in the chip. The mode can be set through a devicetree
>>>> attribute.
>>>
>>> property
>>>
>>>>
>>>> Signed-off-by: Tom Levens <tom.levens@cern.ch>
>>>> ---
>>>>
>>>> Changes since v1:
>>>>  * Refactored value conversion (patch 1/3)
>>>>  * Split the devicetree binding into separate patch (patch 2/3)
>>>>  * Specifying an invalid mode now returns -EINVAL, previously this
>>>>    only issued a warning and used the default value
>>>>  * Removed the "mode" sysfs attribute, as the mode of the chip is
>>>>    hardware specific and should not be user configurable. This allows much
>>>>    simpler code as a result.
>>>>
>>>> Documentation/hwmon/ltc2990 |   24 ++++---
>>>> drivers/hwmon/Kconfig       |    7 +--
>>>> drivers/hwmon/ltc2990.c     |  167 ++++++++++++++++++++++++++++++++++++-------
>>>> 3 files changed, 159 insertions(+), 39 deletions(-)
>>>>
>>>> diff --git a/Documentation/hwmon/ltc2990 b/Documentation/hwmon/ltc2990
>>>> index c25211e..3ed68f6 100644
>>>> --- a/Documentation/hwmon/ltc2990
>>>> +++ b/Documentation/hwmon/ltc2990
>>>> @@ -8,6 +8,7 @@ Supported chips:
>>>>     Datasheet: http://www.linear.com/product/ltc2990
>>>>
>>>> Author: Mike Looijmans <mike.looijmans@topic.nl>
>>>> +        Tom Levens <tom.levens@cern.ch>
>>>>
>>>>
>>>> Description
>>>> @@ -16,10 +17,8 @@ Description
>>>> LTC2990 is a Quad I2C Voltage, Current and Temperature Monitor.
>>>> The chip's inputs can measure 4 voltages, or two inputs together (1+2 and 3+4)
>>>> can be combined to measure a differential voltage, which is typically used to
>>>> -measure current through a series resistor, or a temperature.
>>>> -
>>>> -This driver currently uses the 2x differential mode only. In order to support
>>>> -other modes, the driver will need to be expanded.
>>>> +measure current through a series resistor, or a temperature with an external
>>>> +diode.
>>>>
>>>>
>>>> Usage Notes
>>>> @@ -32,12 +31,19 @@ devices explicitly.
>>>> Sysfs attributes
>>>> ----------------
>>>>
>>>> +in0_input     Voltage at Vcc pin in millivolt (range 2.5V to 5V)
>>>> +temp1_input   Internal chip temperature in millidegrees Celcius
>>>> +
>>>> +A subset of the following attributes are visible, depending on the measurement
>>>> +mode of the chip.
>>>> +
>>>> +in[1-4]_input Voltage at V[1-4] pin in millivolt
>>>> +temp2_input   External temperature sensor TR1 in millidegrees Celcius
>>>> +temp3_input   External temperature sensor TR2 in millidegrees Celcius
>>>> +curr1_input   Current in mA across V1-V2 assuming a 1mOhm sense resistor
>>>> +curr2_input   Current in mA across V3-V4 assuming a 1mOhm sense resistor
>>>> +
>>>> The "curr*_input" measurements actually report the voltage drop across the
>>>> input pins in microvolts. This is equivalent to the current through a 1mOhm
>>>> sense resistor. Divide the reported value by the actual sense resistor value
>>>> in mOhm to get the actual value.
>>>> -
>>>> -in0_input     Voltage at Vcc pin in millivolt (range 2.5V to 5V)
>>>> -temp1_input   Internal chip temperature in millidegrees Celcius
>>>> -curr1_input   Current in mA across v1-v2 assuming a 1mOhm sense resistor.
>>>> -curr2_input   Current in mA across v3-v4 assuming a 1mOhm sense resistor.
>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>> index 45cef3d..f7096ca 100644
>>>> --- a/drivers/hwmon/Kconfig
>>>> +++ b/drivers/hwmon/Kconfig
>>>> @@ -699,15 +699,12 @@ config SENSORS_LTC2945
>>>>       be called ltc2945.
>>>>
>>>> config SENSORS_LTC2990
>>>> -    tristate "Linear Technology LTC2990 (current monitoring mode only)"
>>>> +    tristate "Linear Technology LTC2990"
>>>>     depends on I2C
>>>>     help
>>>>       If you say yes here you get support for Linear Technology LTC2990
>>>>       I2C System Monitor. The LTC2990 supports a combination of voltage,
>>>> -      current and temperature monitoring, but in addition to the Vcc supply
>>>> -      voltage and chip temperature, this driver currently only supports
>>>> -      reading two currents by measuring two differential voltages across
>>>> -      series resistors.
>>>> +      current and temperature monitoring.
>>>>
>>>>       This driver can also be built as a module. If so, the module will
>>>>       be called ltc2990.
>>>> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
>>>> index 0ec4102..e8d36f5 100644
>>>> --- a/drivers/hwmon/ltc2990.c
>>>> +++ b/drivers/hwmon/ltc2990.c
>>>> @@ -6,11 +6,7 @@
>>>>  *
>>>>  * License: GPLv2
>>>>  *
>>>> - * This driver assumes the chip is wired as a dual current monitor, and
>>>> - * reports the voltage drop across two series resistors. It also reports
>>>> - * the chip's internal temperature and Vcc power supply voltage.
>>>> - *
>>>> - * Value conversion refactored
>>>> + * Value conversion refactored and support for all measurement modes added
>>>>  * by Tom Levens <tom.levens@cern.ch>
>>>>  */
>>>>
>>>> @@ -21,6 +17,7 @@
>>>> #include <linux/i2c.h>
>>>> #include <linux/kernel.h>
>>>> #include <linux/module.h>
>>>> +#include <linux/of.h>
>>>>
>>>> #define LTC2990_STATUS    0x00
>>>> #define LTC2990_CONTROL    0x01
>>>> @@ -35,32 +32,96 @@
>>>> #define LTC2990_CONTROL_KELVIN        BIT(7)
>>>> #define LTC2990_CONTROL_SINGLE        BIT(6)
>>>> #define LTC2990_CONTROL_MEASURE_ALL    (0x3 << 3)
>>>> -#define LTC2990_CONTROL_MODE_CURRENT    0x06
>>>> -#define LTC2990_CONTROL_MODE_VOLTAGE    0x07
>>>> +#define LTC2990_CONTROL_MODE_DEFAULT    0x06
>>>
>>> I think LTC2990_CONTROL_MODE_CURRENT was better - it describes the actual mode.
>>> Changing the define to _DEFAULT does not really improve code readability.
>>>
>>>> +#define LTC2990_CONTROL_MODE_MAX    0x07
>>>> +
>>>> +#define LTC2990_IN0    BIT(0)
>>>> +#define LTC2990_IN1    BIT(1)
>>>> +#define LTC2990_IN2    BIT(2)
>>>> +#define LTC2990_IN3    BIT(3)
>>>> +#define LTC2990_IN4    BIT(4)
>>>> +#define LTC2990_CURR1    BIT(5)
>>>> +#define LTC2990_CURR2    BIT(6)
>>>> +#define LTC2990_TEMP1    BIT(7)
>>>> +#define LTC2990_TEMP2    BIT(8)
>>>> +#define LTC2990_TEMP3    BIT(9)
>>>> +
>>>> +static const int ltc2990_attrs_ena[] = {
>>>> +    LTC2990_IN1 | LTC2990_IN2 | LTC2990_TEMP3,
>>>> +    LTC2990_CURR1 | LTC2990_TEMP3,
>>>> +    LTC2990_CURR1 | LTC2990_IN3 | LTC2990_IN4,
>>>> +    LTC2990_TEMP2 | LTC2990_IN3 | LTC2990_IN4,
>>>> +    LTC2990_TEMP2 | LTC2990_CURR2,
>>>> +    LTC2990_TEMP2 | LTC2990_TEMP3,
>>>> +    LTC2990_CURR1 | LTC2990_CURR2,
>>>> +    LTC2990_IN1 | LTC2990_IN2 | LTC2990_IN3 | LTC2990_IN4
>>>> +};
>>>> +
>>>> +struct ltc2990_data {
>>>> +    struct i2c_client *i2c;
>>>> +    u32 mode;
>>>> +};
>>>>
>>>> /* Return the converted value from the given register in uV or mC */
>>>> -static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, s32 *result)
>>>> +static int ltc2990_get_value(struct i2c_client *i2c, int index, s32 *result)
>>>> {
>>>>     s32 val;
>>>> +    u8 reg;
>>>> +
>>>> +    switch (index) {
>>>> +    case LTC2990_IN0:
>>>> +        reg = LTC2990_VCC_MSB;
>>>> +        break;
>>>> +    case LTC2990_IN1:
>>>> +    case LTC2990_CURR1:
>>>> +    case LTC2990_TEMP2:
>>>> +        reg = LTC2990_V1_MSB;
>>>> +        break;
>>>> +    case LTC2990_IN2:
>>>> +        reg = LTC2990_V2_MSB;
>>>> +        break;
>>>> +    case LTC2990_IN3:
>>>> +    case LTC2990_CURR2:
>>>> +    case LTC2990_TEMP3:
>>>> +        reg = LTC2990_V3_MSB;
>>>> +        break;
>>>> +    case LTC2990_IN4:
>>>> +        reg = LTC2990_V4_MSB;
>>>> +        break;
>>>> +    case LTC2990_TEMP1:
>>>> +        reg = LTC2990_TINT_MSB;
>>>> +        break;
>>>> +    default:
>>>> +        return -EINVAL;
>>>> +    }
>>>>
>>>>     val = i2c_smbus_read_word_swapped(i2c, reg);
>>>>     if (unlikely(val < 0))
>>>>         return val;
>>>>
>>>> -    switch (reg) {
>>>> -    case LTC2990_TINT_MSB:
>>>> -        /* internal temp, 0.0625 degrees/LSB, 13-bit  */
>>>> +    switch (index) {
>>>> +    case LTC2990_TEMP1:
>>>> +    case LTC2990_TEMP2:
>>>> +    case LTC2990_TEMP3:
>>>> +        /* temp, 0.0625 degrees/LSB, 13-bit  */
>>>>         *result = sign_extend32(val, 12) * 1000 / 16;
>>>>         break;
>>>> -    case LTC2990_V1_MSB:
>>>> -    case LTC2990_V3_MSB:
>>>> -         /* Vx-Vy, 19.42uV/LSB. Depends on mode. */
>>>> +    case LTC2990_CURR1:
>>>> +    case LTC2990_CURR2:
>>>> +         /* Vx-Vy, 19.42uV/LSB */
>>>>         *result = sign_extend32(val, 14) * 1942 / 100;
>>>>         break;
>>>> -    case LTC2990_VCC_MSB:
>>>> -        /* Vcc, 305.18Î¼V/LSB, 2.5V offset */
>>>> +    case LTC2990_IN0:
>>>> +        /* Vcc, 305.18uV/LSB, 2.5V offset */
>>>>         *result = sign_extend32(val, 14) * 30518 / (100 * 1000) + 2500;
>>>>         break;
>>>> +    case LTC2990_IN1:
>>>> +    case LTC2990_IN2:
>>>> +    case LTC2990_IN3:
>>>> +    case LTC2990_IN4:
>>>> +        /* Vx: 305.18uV/LSB */
>>>> +        *result = sign_extend32(val, 14) * 30518 / (100 * 1000);
>>>> +        break;
>>>>     default:
>>>>         return -EINVAL; /* won't happen, keep compiler happy */
>>>>     }
>>>> @@ -72,48 +133,104 @@ static ssize_t ltc2990_show_value(struct device *dev,
>>>>                   struct device_attribute *da, char *buf)
>>>> {
>>>>     struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
>>>> +    struct ltc2990_data *data = dev_get_drvdata(dev);
>>>>     s32 value;
>>>>     int ret;
>>>>
>>>> -    ret = ltc2990_get_value(dev_get_drvdata(dev), attr->index, &value);
>>>> +    ret = ltc2990_get_value(data->i2c, attr->index, &value);
>>>>     if (unlikely(ret < 0))
>>>>         return ret;
>>>>
>>>>     return snprintf(buf, PAGE_SIZE, "%d\n", value);
>>>> }
>>>>
>>>> +static umode_t ltc2990_attrs_visible(struct kobject *kobj,
>>>> +                     struct attribute *a, int n)
>>>> +{
>>>> +    struct device *dev = container_of(kobj, struct device, kobj);
>>>> +    struct ltc2990_data *data = dev_get_drvdata(dev);
>>>> +    struct device_attribute *da =
>>>> +            container_of(a, struct device_attribute, attr);
>>>> +    struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
>>>> +
>>>> +    if (attr->index == LTC2990_TEMP1 ||
>>>> +        attr->index == LTC2990_IN0 ||
>>>> +        attr->index & ltc2990_attrs_ena[data->mode])
>>>> +        return a->mode;
>>>> +    else
>>>
>>> Unnecessary else
>>>
>>>> +        return 0;
>>>> +}
>>>> +
>>>> static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> -              LTC2990_TINT_MSB);
>>>> +              LTC2990_TEMP1);
>>>> +static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> +              LTC2990_TEMP2);
>>>> +static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> +              LTC2990_TEMP3);
>>>> static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> -              LTC2990_V1_MSB);
>>>> +              LTC2990_CURR1);
>>>> static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> -              LTC2990_V3_MSB);
>>>> +              LTC2990_CURR2);
>>>> static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> -              LTC2990_VCC_MSB);
>>>> +              LTC2990_IN0);
>>>> +static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> +              LTC2990_IN1);
>>>> +static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> +              LTC2990_IN2);
>>>> +static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> +              LTC2990_IN3);
>>>> +static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ltc2990_show_value, NULL,
>>>> +              LTC2990_IN4);
>>>>
>>>> static struct attribute *ltc2990_attrs[] = {
>>>>     &sensor_dev_attr_temp1_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_temp2_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_temp3_input.dev_attr.attr,
>>>>     &sensor_dev_attr_curr1_input.dev_attr.attr,
>>>>     &sensor_dev_attr_curr2_input.dev_attr.attr,
>>>>     &sensor_dev_attr_in0_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_in1_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_in2_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_in3_input.dev_attr.attr,
>>>> +    &sensor_dev_attr_in4_input.dev_attr.attr,
>>>>     NULL,
>>>> };
>>>> -ATTRIBUTE_GROUPS(ltc2990);
>>>> +
>>>> +static const struct attribute_group ltc2990_group = {
>>>> +    .attrs = ltc2990_attrs,
>>>> +    .is_visible = ltc2990_attrs_visible,
>>>> +};
>>>> +__ATTRIBUTE_GROUPS(ltc2990);
>>>>
>>>> static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>>                  const struct i2c_device_id *id)
>>>> {
>>>>     int ret;
>>>>     struct device *hwmon_dev;
>>>> +    struct ltc2990_data *data;
>>>> +    struct device_node *of_node = i2c->dev.of_node;
>>>>
>>>>     if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>>>>                      I2C_FUNC_SMBUS_WORD_DATA))
>>>>         return -ENODEV;
>>>>
>>>> -    /* Setup continuous mode, current monitor */
>>>> +    data = devm_kzalloc(&i2c->dev, sizeof(struct ltc2990_data), GFP_KERNEL);
>>>> +    if (unlikely(!data))
>>>> +        return -ENOMEM;
>>>> +    data->i2c = i2c;
>>>> +
>>>> +    if (!of_node || of_property_read_u32(of_node, "lltc,mode", &data->mode))
>>>> +        data->mode = LTC2990_CONTROL_MODE_DEFAULT;
>>>
>>> Iam arguing with myself if we should still do this or if we should read the mode
>>> from the chip instead if it isn't provided (after all, it may have been
>>> initialized
>>> by the BIOS/ROMMON).
>>>
>>> Mike, would that break your application, or can you specify the mode in
>>> devicetree ?
>>
>> OMFG, I just spent half the day implementing the exact same thing, and only
>> after sumbmitting it, I stumbled upon this thread. I must be getting old.
>>
>> A well, seems I implemented things a bit differently, so you get to pick and
>> choose which patch was better.
>>
>
> As I just replied to your patch, there is no question here. The compatible
> statement refers to chip compatibility; one can not use it to also provide
> configuration information.
>
>> Whatever happened to this patch though? It didn't make it to mainline,
>> otherwise I'd have found it sooner...
>>
> I'll have to look it up, but I guess I didn't get an updated version.

As far as I remember I had a working V3 of this patch, but it is entirely 
possible that it was never submitted as I have been busy with other 
projects recently. I'll dig it out and check that it is complete.

Cheers,

> Guenter
>
>>
>>>
>>> Thanks,
>>> Guenter
>>>
>>>> +
>>>> +    if (data->mode > LTC2990_CONTROL_MODE_MAX) {
>>>> +        dev_err(&i2c->dev, "Error: Invalid mode %d.\n", data->mode);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    /* Setup continuous mode */
>>>>     ret = i2c_smbus_write_byte_data(i2c, LTC2990_CONTROL,
>>>>                     LTC2990_CONTROL_MEASURE_ALL |
>>>> -                    LTC2990_CONTROL_MODE_CURRENT);
>>>> +                    data->mode);
>>>>     if (ret < 0) {
>>>>         dev_err(&i2c->dev, "Error: Failed to set control mode.\n");
>>>>         return ret;
>>>> @@ -127,7 +244,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>>
>>>>     hwmon_dev = devm_hwmon_device_register_with_groups(&i2c->dev,
>>>>                                i2c->name,
>>>> -                               i2c,
>>>> +                               data,
>>>>                                ltc2990_groups);
>>>>
>>>>     return PTR_ERR_OR_ZERO(hwmon_dev);
>>>>
>>>
>>
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Products
>> Materiaalweg 4, NL-5681 RJ Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
>>
>
---1195621031-153106770-1498663783=:31209--
