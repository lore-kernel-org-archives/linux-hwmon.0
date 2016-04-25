Return-path: <afd@ti.com>
Subject: Re: [PATCH v2 2/2] hwmon: Add support for INA3221 Triple
 Current/Voltage Monitors
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <1461090519-3386-1-git-send-email-afd@ti.com>
 <1461090519-3386-3-git-send-email-afd@ti.com> <571BA88C.3020203@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <571E6FD1.6070409@ti.com>
Date: Mon, 25 Apr 2016 14:28:17 -0500
MIME-Version: 1.0
In-Reply-To: <571BA88C.3020203@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 04/23/2016 11:53 AM, Guenter Roeck wrote:
> On 04/19/2016 11:28 AM, Andrew F. Davis wrote:
>> Add support for the the INA3221 26v capable, Triple channel,
>> Bi-Directional, Zero-Drift, Low-/High-Side, Current/Voltage Monitor
>> with I2C interface.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   Documentation/hwmon/ina3221 |  35 ++++
>>   drivers/hwmon/Kconfig       |  11 ++
>>   drivers/hwmon/Makefile      |   1 +
>>   drivers/hwmon/ina3221.c     | 405
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 452 insertions(+)
>>   create mode 100644 Documentation/hwmon/ina3221
>>   create mode 100644 drivers/hwmon/ina3221.c
>>
>> diff --git a/Documentation/hwmon/ina3221 b/Documentation/hwmon/ina3221
>> new file mode 100644
>> index 0000000..82fd6b6
>> --- /dev/null
>> +++ b/Documentation/hwmon/ina3221
>> @@ -0,0 +1,35 @@
>> +Kernel driver ina3221
>> +=====================
>> +
>> +Supported chips:
>> +  * Texas Instruments INA3221
>> +    Prefix: 'ina3221'
>> +    Addresses: I2C 0x40 - 0x43
>> +    Datasheet: Publicly available at the Texas Instruments website
>> +               http://www.ti.com/
>> +
>> +Author: Andrew F. Davis <afd@ti.com>
>> +
>> +Description
>> +-----------
>> +
>> +The Texas Instruments INA3221 monitors voltage, current, and power on
>> the high
>> +side of up to three D.C. power supplies. The INA3221 monitors both
>> shunt drop
>> +and supply voltage, with programmable conversion times and averaging,
>> current
>> +and power are calculated host-side from these.
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +in[123]_input           Bus voltage(mV) channels
>> +curr[123]_input         Current(mA) measurement channels
>> +shunt[123]_resistor     Shunt resistance(uOhm) channels
>> +in[456]_input           Shunt voltage(uV) for channels 1, 2, and 3
>> respectively
>> +in[456]_crit            Critical alert shunt voltage(uV) setting,
>> activates the
>> +                          corresponding alarm when the respective
>> shunt voltage
>> +                          is above this value
>> +in[456]_crit_alarm      Critical alert shunt voltage limit exceeded
>> +in[456]_max             Warning alert shunt voltage(uV) setting,
>> activates the
>> +                          corresponding alarm when the respective
>> shunt voltage
>> +                          average is above this value.
>> +in[456]_max_alarm       Warning alert shunt voltage limit exceeded
> 
> The primary use case for shunt resistor measurements is to report currents.
> Even the datasheets says so. The primary means to set and report warning
> and
> critical limits should therefore be the current attributes.
> 
> I accepted reporting the direct voltage values because, as it was
> pointed out
> to me earlier, it can be useful to know the voltage drop across the shunt
> resistors. I start to regret that :-(.
> 
> Please report alarms and limits with the current attributes.
> 

No problem, will rework this.

>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 5c2d13a..de08242 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1503,6 +1503,17 @@ config SENSORS_INA2XX
>>         This driver can also be built as a module.  If so, the module
>>         will be called ina2xx.
>>
>> +config SENSORS_INA3221
>> +    tristate "Texas Instruments INA3221 Triple Power Monitor"
>> +    depends on I2C
>> +    select REGMAP_I2C
>> +    help
>> +      If you say yes here you get support for  the TI INA3221 Triple
>> Power
>> +      Monitor.
>> +
>> +      This driver can also be built as a module.  If so, the module
>> +      will be called ina3221.
>> +
>>   config SENSORS_TC74
>>       tristate "Microchip TC74"
>>       depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 58cc3ac..83e8ab0 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -77,6 +77,7 @@ obj-$(CONFIG_SENSORS_IBMPOWERNV)+= ibmpowernv.o
>>   obj-$(CONFIG_SENSORS_IIO_HWMON) += iio_hwmon.o
>>   obj-$(CONFIG_SENSORS_INA209)    += ina209.o
>>   obj-$(CONFIG_SENSORS_INA2XX)    += ina2xx.o
>> +obj-$(CONFIG_SENSORS_INA3221)    += ina3221.o
>>   obj-$(CONFIG_SENSORS_IT87)    += it87.o
>>   obj-$(CONFIG_SENSORS_JC42)    += jc42.o
>>   obj-$(CONFIG_SENSORS_JZ4740)    += jz4740-hwmon.o
>> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
>> new file mode 100644
>> index 0000000..5350c28
>> --- /dev/null
>> +++ b/drivers/hwmon/ina3221.c
>> @@ -0,0 +1,405 @@
>> +/*
>> + * INA3221 Triple Current/Voltage Monitor
>> + *
>> + * Copyright (C) 2016 Texas Instruments Incorporated -
>> http://www.ti.com/
>> + *    Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * General Public License for more details.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
> 
> Please list include files in alphabetic order. hwmon include files
> are nothing special and don't need to be separated.
> 

ACK

>> +
>> +#define INA3221_DRIVER_NAME        "ina3221"
>> +
>> +#define INA3221_CONFIG            0x00
>> +#define INA3221_SHUNT1            0x01
>> +#define INA3221_BUS1            0x02
>> +#define INA3221_SHUNT2            0x03
>> +#define INA3221_BUS2            0x04
>> +#define INA3221_SHUNT3            0x05
>> +#define INA3221_BUS3            0x06
>> +#define INA3221_CRIT1            0x07
>> +#define INA3221_WARN1            0x08
>> +#define INA3221_CRIT2            0x09
>> +#define INA3221_WARN2            0x0a
>> +#define INA3221_CRIT3            0x0b
>> +#define INA3221_WARN3            0x0c
>> +#define INA3221_SHUNT_SUM        0x0d
>> +#define INA3221_SHUNT_SUM_LIMIT        0x0e
>> +#define INA3221_MASK_ENABLE        0x0f
>> +#define INA3221_POWERV_HLIMIT        0x10
>> +#define INA3221_POWERV_LLIMIT        0x11
> 
> Please drop unused register defines.
> 

ACK

> Note that you _could_ consider implementing voltage and
> voltage limit attributes and attach them, say, to in1.
> Just document that the limits (and the associated warning)
> are associated with the maximum/minimum of all voltages.
> Similar, you could implement shunt voltage summary and shunt
> voltage summary limit attributes.
> 

I'll keep that in mind so I can add those if the need ever arises.

>> +
>> +#define INA3221_CONFIG_MODE_SHUNT    BIT(1)
>> +#define INA3221_CONFIG_MODE_BUS        BIT(2)
>> +#define INA3221_CONFIG_MODE_CONTINUOUS    BIT(3)
>> +
>> +#define INA3221_RSHUNT_DEFAULT        10000
>> +
>> +enum ina3221_fields {
>> +    /* Configuration */
>> +    F_RST,
>> +
>> +    /* Alert Flags */
>> +    F_WF3, F_WF2, F_WF1,
>> +    F_CF3, F_CF2, F_CF1,
>> +
>> +    /* sentinel */
>> +    F_MAX_FIELDS
>> +};
>> +
>> +static const struct reg_field ina3221_reg_fields[] = {
>> +    [F_RST] = REG_FIELD(INA3221_CONFIG, 15, 15),
>> +
>> +    [F_WF3] = REG_FIELD(INA3221_MASK_ENABLE, 3, 3),
>> +    [F_WF2] = REG_FIELD(INA3221_MASK_ENABLE, 4, 4),
>> +    [F_WF1] = REG_FIELD(INA3221_MASK_ENABLE, 5, 5),
>> +    [F_CF3] = REG_FIELD(INA3221_MASK_ENABLE, 7, 7),
>> +    [F_CF2] = REG_FIELD(INA3221_MASK_ENABLE, 8, 8),
>> +    [F_CF1] = REG_FIELD(INA3221_MASK_ENABLE, 9, 9),
>> +};
>> +
>> +enum ina3221_channels {
>> +    INA3221_CHANNEL1,
>> +    INA3221_CHANNEL2,
>> +    INA3221_CHANNEL3,
>> +    INA3221_NUM_CHANNELS
>> +};
>> +
>> +static const int shunt_registers[] = {
>> +    [INA3221_CHANNEL1] = INA3221_SHUNT1,
>> +    [INA3221_CHANNEL2] = INA3221_SHUNT2,
>> +    [INA3221_CHANNEL3] = INA3221_SHUNT3,
>> +};
>> +
>> +/**
>> + * struct ina3221_data - device specific information
>> + * @dev: Device structure
>> + * @regmap: Register map of the device
>> + * @fields: Register fields of the device
>> + */
>> +struct ina3221_data {
>> +    struct device *dev;
>> +    struct regmap *regmap;
>> +    struct regmap_field *fields[F_MAX_FIELDS];
>> +    unsigned int shunt_resistors[INA3221_NUM_CHANNELS];
>> +};
>> +
>> +static int ina3221_read_value(struct ina3221_data *ina, unsigned int
>> reg,
>> +                  int *val)
>> +{
>> +    unsigned int regval;
>> +    int ret;
>> +
>> +    ret = regmap_read(ina->regmap, reg, &regval);
>> +    if (ret)
>> +        return ret;
>> +
>> +    *val = sign_extend32(regval >> 3, 12);
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t ina3221_show_voltage(struct device *dev,
>> +                    struct device_attribute *attr, char *buf)
>> +{
>> +    struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>> +    struct ina3221_data *ina = dev_get_drvdata(dev);
>> +    unsigned int reg = sd_attr->index;
>> +    int val, voltage_mv, ret;
>> +
>> +    ret = ina3221_read_value(ina, reg, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (reg == INA3221_BUS1 ||
>> +        reg == INA3221_BUS2 ||
>> +        reg == INA3221_BUS3)
>> +        voltage_mv = val * 8;
>> +    else
>> +        voltage_mv = val * 40;
>> +
>> +    return snprintf(buf, PAGE_SIZE, "%d\n", voltage_mv);
>> +}
>> +
>> +static ssize_t ina3221_set_voltage(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>> +    struct ina3221_data *ina = dev_get_drvdata(dev);
>> +    unsigned int reg = sd_attr->index;
>> +    int val, ret;
>> +
>> +    ret = kstrtoint(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* clamp value */
>> +    val = (val > 163800) ? 163800 : val;
>> +    val = (val < -163800) ? -163800 : val;
>> +
>> +    /* 1 / 40uV(scale) << 3(register shift) = 5 */
>> +    val = DIV_ROUND_CLOSEST(val, 5) & 0xfff8;
>> +
>> +    ret = regmap_write(ina->regmap, reg, val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t ina3221_show_current(struct device *dev,
>> +                    struct device_attribute *attr, char *buf)
>> +{
>> +    struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>> +    struct ina3221_data *ina = dev_get_drvdata(dev);
>> +    unsigned int channel = sd_attr->index;
>> +    unsigned int shunt_reg, resistance_uo;
>> +    int val, current_ma, shunt_voltage_mv, ret;
>> +
>> +    shunt_reg = shunt_registers[channel];
>> +    resistance_uo = ina->shunt_resistors[channel];
>> +
>> +    ret = ina3221_read_value(ina, shunt_reg, &val);
>> +    if (ret)
>> +        return ret;
>> +    shunt_voltage_mv = val * 40000;
>> +
>> +    current_ma = DIV_ROUND_CLOSEST(shunt_voltage_mv, resistance_uo);
>> +
>> +    return snprintf(buf, PAGE_SIZE, "%d\n", current_ma);
>> +}
>> +
>> +static ssize_t ina3221_show_shunt(struct device *dev,
>> +                  struct device_attribute *attr, char *buf)
>> +{
>> +    struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>> +    struct ina3221_data *ina = dev_get_drvdata(dev);
>> +    unsigned int channel = sd_attr->index;
>> +    unsigned int resistance_uo;
>> +
>> +    resistance_uo = ina->shunt_resistors[channel];
>> +
>> +    return snprintf(buf, PAGE_SIZE, "%d\n", resistance_uo);
>> +}
>> +
>> +static ssize_t ina3221_set_shunt(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf, size_t count)
>> +{
>> +    struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>> +    struct ina3221_data *ina = dev_get_drvdata(dev);
>> +    unsigned int channel = sd_attr->index;
>> +    unsigned int val;
>> +    int ret;
>> +
>> +    ret = kstrtouint(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (val == 0)
>> +        return -EINVAL;
>> +
>> +    ina->shunt_resistors[channel] = val;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t ina3221_show_alert(struct device *dev,
>> +                  struct device_attribute *attr, char *buf)
>> +{
>> +    struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>> +    struct ina3221_data *ina = dev_get_drvdata(dev);
>> +    unsigned int field = sd_attr->index;
>> +    unsigned int regval;
>> +    int ret;
>> +
>> +    ret = regmap_field_read(ina->fields[field], &regval);
>> +    if (ret)
>> +        return ret;
>> +
> 
> This is problematic. The datasheet suggests that alert flags are cleared
> after the mask/enable register is read. The practical result will be that
> any alert will be reported only once or not at all. I think you'll need
> some logic to cache the alert register value, and only reset individual
> alert bits after a matching channel reading indicates that the alert
> condition is no longer valid. Unless I am missing something, you won't
> be able to use regmap_read_field(), since reading the register will reset
> all non-reported alert bits.
> 

I thought about this also but when testing the actual behavior seems to
be that the flag is set as long as the current is over-limit, and clear
whenever it is not, I'm not sure what the datasheet is referring to or
if it is simply in error.

>> +    return snprintf(buf, PAGE_SIZE, "%d\n", regval);
>> +}
>> +
>> +/* bus voltage */
>> +static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ina3221_show_voltage,
>> NULL, INA3221_BUS1);
>> +static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ina3221_show_voltage,
>> NULL, INA3221_BUS2);
>> +static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ina3221_show_voltage,
>> NULL, INA3221_BUS3);
>> +
>> +/* calculated current */
>> +static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ina3221_show_current,
>> NULL, INA3221_CHANNEL1);
>> +static SENSOR_DEVICE_ATTR(curr2_input, S_IRUGO, ina3221_show_current,
>> NULL, INA3221_CHANNEL2);
>> +static SENSOR_DEVICE_ATTR(curr3_input, S_IRUGO, ina3221_show_current,
>> NULL, INA3221_CHANNEL3);
>> +
>> +/* shunt resistance */
>> +static SENSOR_DEVICE_ATTR(shunt1_resistor, (S_IRUGO | S_IWUSR),
>> ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL1);
>> +static SENSOR_DEVICE_ATTR(shunt2_resistor, (S_IRUGO | S_IWUSR),
>> ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL2);
>> +static SENSOR_DEVICE_ATTR(shunt3_resistor, (S_IRUGO | S_IWUSR),
>> ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL3);
>> +
>> +/* shunt voltage */
>> +static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ina3221_show_voltage,
>> NULL, INA3221_SHUNT1);
>> +static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, ina3221_show_voltage,
>> NULL, INA3221_SHUNT2);
>> +static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, ina3221_show_voltage,
>> NULL, INA3221_SHUNT3);
>> +
>> +/* critical shunt voltage */
>> +static SENSOR_DEVICE_ATTR(in4_crit, (S_IRUGO | S_IWUSR),
>> ina3221_show_voltage, ina3221_set_voltage, INA3221_CRIT1);
>> +static SENSOR_DEVICE_ATTR(in5_crit, (S_IRUGO | S_IWUSR),
>> ina3221_show_voltage, ina3221_set_voltage, INA3221_CRIT2);
>> +static SENSOR_DEVICE_ATTR(in6_crit, (S_IRUGO | S_IWUSR),
>> ina3221_show_voltage, ina3221_set_voltage, INA3221_CRIT3);
>> +
>> +/* critical shunt voltage alert */
>> +static SENSOR_DEVICE_ATTR(in4_crit_alarm, S_IRUGO,
>> ina3221_show_alert, NULL, F_CF1);
>> +static SENSOR_DEVICE_ATTR(in5_crit_alarm, S_IRUGO,
>> ina3221_show_alert, NULL, F_CF2);
>> +static SENSOR_DEVICE_ATTR(in6_crit_alarm, S_IRUGO,
>> ina3221_show_alert, NULL, F_CF3);
>> +
>> +/* warning shunt voltage */
>> +static SENSOR_DEVICE_ATTR(in4_max, (S_IRUGO | S_IWUSR),
>> ina3221_show_voltage, ina3221_set_voltage, INA3221_WARN1);
>> +static SENSOR_DEVICE_ATTR(in5_max, (S_IRUGO | S_IWUSR),
>> ina3221_show_voltage, ina3221_set_voltage, INA3221_WARN2);
>> +static SENSOR_DEVICE_ATTR(in6_max, (S_IRUGO | S_IWUSR),
>> ina3221_show_voltage, ina3221_set_voltage, INA3221_WARN3);
>> +
>> +/* warning shunt voltage alert */
>> +static SENSOR_DEVICE_ATTR(in4_max_alarm, S_IRUGO, ina3221_show_alert,
>> NULL, F_WF1);
>> +static SENSOR_DEVICE_ATTR(in5_max_alarm, S_IRUGO, ina3221_show_alert,
>> NULL, F_WF2);
>> +static SENSOR_DEVICE_ATTR(in6_max_alarm, S_IRUGO, ina3221_show_alert,
>> NULL, F_WF3);
>> +
>> +static struct attribute *ina3221_attrs[] = {
>> +    /* channel 1 */
>> +    &sensor_dev_attr_in1_input.dev_attr.attr,
>> +    &sensor_dev_attr_curr1_input.dev_attr.attr,
>> +    &sensor_dev_attr_shunt1_resistor.dev_attr.attr,
>> +    &sensor_dev_attr_in4_input.dev_attr.attr,
>> +    &sensor_dev_attr_in4_crit.dev_attr.attr,
>> +    &sensor_dev_attr_in4_crit_alarm.dev_attr.attr,
>> +    &sensor_dev_attr_in4_max.dev_attr.attr,
>> +    &sensor_dev_attr_in4_max_alarm.dev_attr.attr,
>> +
>> +    /* channel 2 */
>> +    &sensor_dev_attr_in2_input.dev_attr.attr,
>> +    &sensor_dev_attr_curr2_input.dev_attr.attr,
>> +    &sensor_dev_attr_shunt2_resistor.dev_attr.attr,
>> +    &sensor_dev_attr_in5_input.dev_attr.attr,
>> +    &sensor_dev_attr_in5_crit.dev_attr.attr,
>> +    &sensor_dev_attr_in5_crit_alarm.dev_attr.attr,
>> +    &sensor_dev_attr_in5_max.dev_attr.attr,
>> +    &sensor_dev_attr_in5_max_alarm.dev_attr.attr,
>> +
>> +    /* channel 3 */
>> +    &sensor_dev_attr_in3_input.dev_attr.attr,
>> +    &sensor_dev_attr_curr3_input.dev_attr.attr,
>> +    &sensor_dev_attr_shunt3_resistor.dev_attr.attr,
>> +    &sensor_dev_attr_in6_input.dev_attr.attr,
>> +    &sensor_dev_attr_in6_crit.dev_attr.attr,
>> +    &sensor_dev_attr_in6_crit_alarm.dev_attr.attr,
>> +    &sensor_dev_attr_in6_max.dev_attr.attr,
>> +    &sensor_dev_attr_in6_max_alarm.dev_attr.attr,
>> +
>> +    NULL,
>> +};
>> +ATTRIBUTE_GROUPS(ina3221);
>> +
>> +static const struct regmap_range ina3221_yes_ranges[] = {
>> +    regmap_reg_range(INA3221_SHUNT1, INA3221_BUS3),
>> +    regmap_reg_range(INA3221_MASK_ENABLE, INA3221_MASK_ENABLE),
>> +};
>> +
>> +static const struct regmap_access_table ina3221_volatile_table = {
>> +    .yes_ranges = ina3221_yes_ranges,
>> +    .n_yes_ranges = ARRAY_SIZE(ina3221_yes_ranges),
>> +};
>> +
>> +static const struct regmap_config ina3221_regmap_config = {
>> +    .reg_bits = 8,
>> +    .val_bits = 16,
>> +
>> +    .cache_type = REGCACHE_RBTREE,
>> +    .volatile_table = &ina3221_volatile_table,
>> +};
>> +
>> +static int ina3221_probe(struct i2c_client *client,
>> +             const struct i2c_device_id *id)
>> +{
>> +    struct ina3221_data *ina;
>> +    struct device *hwmon_dev;
>> +    int i, ret;
>> +
>> +    ina = devm_kzalloc(&client->dev, sizeof(*ina), GFP_KERNEL);
>> +    if (!ina)
>> +        return -ENOMEM;
>> +    i2c_set_clientdata(client, ina);
>> +
> 
> Not used anywhere.
> 
>> +    ina->dev = &client->dev;
> 
> ina->dev is only used in this function and therefore not needed in
> struct ina3221_data.
> 

I'll remove these.

>> +
>> +    ina->regmap = devm_regmap_init_i2c(client, &ina3221_regmap_config);
>> +    if (IS_ERR(ina->regmap)) {
>> +        dev_err(ina->dev, "Unable to allocate register map\n");
>> +        return PTR_ERR(ina->regmap);
>> +    }
>> +
>> +    for (i = 0; i < F_MAX_FIELDS; i++) {
>> +        ina->fields[i] = devm_regmap_field_alloc(ina->dev,
>> +                             ina->regmap,
>> +                             ina3221_reg_fields[i]);
>> +        if (IS_ERR(ina->fields[i])) {
>> +            dev_err(ina->dev, "Unable to allocate regmap fields\n");
>> +            return PTR_ERR(ina->fields[i]);
>> +        }
>> +    }
>> +
>> +    for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
>> +        u32 value;
>> +        ret = of_property_read_u32_index(client->dev.of_node,
>> +                         "shunt-resistors", i, &value);
>> +        if (ret || value == 0)
>> +            ina->shunt_resistors[i] = INA3221_RSHUNT_DEFAULT;
>> +        else
>> +            ina->shunt_resistors[i] = value;
>> +    }
>> +
>> +    ret = regmap_field_write(ina->fields[F_RST], true);
>> +    if (ret) {
>> +        dev_err(ina->dev, "Unable to reset device\n");
>> +        return ret;
>> +    }
>> +
>> +    hwmon_dev = devm_hwmon_device_register_with_groups(ina->dev,
>> +                               client->name,
>> +                               ina, ina3221_groups);
>> +    if (IS_ERR(hwmon_dev)) {
>> +        dev_err(ina->dev, "Unable register hwmon device\n");
> 
> Unable to ...
> 

ACK

>> +        return PTR_ERR(hwmon_dev);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct i2c_device_id ina3221_ids[] = {
>> +    { "ina3221", 0 },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ina3221_ids);
>> +
>> +static struct i2c_driver ina3221_i2c_driver = {
>> +    .driver = {
>> +        .name = INA3221_DRIVER_NAME,
> 
> Since you are using devicetree properties, you should also provide
> .of_match_table.
> 

Will add.

Thanks,
Andrew

>> +    },
>> +    .probe = ina3221_probe,
>> +    .id_table = ina3221_ids,
>> +};
>> +module_i2c_driver(ina3221_i2c_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("Texas Instruments INA3221 HWMon Driver");
>> +MODULE_LICENSE("GPL v2");
>>
> 
