Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33396 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601AbcDYO6N (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Apr 2016 10:58:13 -0400
Subject: Re: [PATCH 10/11] hwmon: Add Altera A10-SR power supply alarms
To: tthayer@opensource.altera.com
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-11-git-send-email-tthayer@opensource.altera.com>
 <20160422222402.GA22294@roeck-us.net>
 <571E2CA2.3000900@opensource.altera.com>
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com,
	jdelvare@suse.com, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <571E3080.1020000@roeck-us.net>
Date: Mon, 25 Apr 2016 07:58:08 -0700
MIME-Version: 1.0
In-Reply-To: <571E2CA2.3000900@opensource.altera.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/25/2016 07:41 AM, Thor Thayer wrote:
>
>
> On 04/22/2016 05:24 PM, Guenter Roeck wrote:
>> On Fri, Apr 22, 2016 at 10:33:38AM -0500, tthayer@opensource.altera.com wrote:
>>> From: Thor Thayer <tthayer@opensource.altera.com>
>>>
>>> This patch adds the power supply alarms of the hwmon framework
>>> to the Arria10 System Resource chip.
>>>
>>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>>> ---
>>
>> Please read and follow Documentation/hwmon/sysfs-interface
>> as well as Documentation/hwmon/submitting-patches. At the very least,
>> you are expected to document your driver, and you are expected to
>> use standard attribute names.
>>
>
> OK. I misunderstood. The standard attribute names would be power[1-*]_alarm and the binding documentation the a10sr-hwmon portion for MFD doesn't cover this.
>

power ? Why power ? The names suggest those are voltages.
Also not sure why those names would be in the bindings.

>>>   drivers/hwmon/Kconfig              |    9 ++
>>>   drivers/hwmon/Makefile             |    1 +
>>>   drivers/hwmon/altera-a10sr-hwmon.c |  215 ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 225 insertions(+)
>>>   create mode 100644 drivers/hwmon/altera-a10sr-hwmon.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index ff94007..af08846 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -248,6 +248,15 @@ config SENSORS_ADT7475
>>>         This driver can also be build as a module.  If so, the module
>>>         will be called adt7475.
>>>
>>> +config SENSORS_ALTERA_A10SR
>>> +    bool "Altera Arria10 System Status"
>>> +    depends on MFD_ALTERA_A10SR
>>> +    help
>>> +      If you say yes here you get support for the power ready status
>>> +      for the Arria10's external power supplies on the Arria10 DevKit.
>>> +      These values are read over the SPI bus from the Arria10 System
>>> +      Resource chip.
>>> +
>>>   config SENSORS_ASC7621
>>>       tristate "Andigilog aSC7621"
>>>       depends on I2C
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index 2ef5b7c..17d72a7 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -43,6 +43,7 @@ obj-$(CONFIG_SENSORS_ADT7411)    += adt7411.o
>>>   obj-$(CONFIG_SENSORS_ADT7462)    += adt7462.o
>>>   obj-$(CONFIG_SENSORS_ADT7470)    += adt7470.o
>>>   obj-$(CONFIG_SENSORS_ADT7475)    += adt7475.o
>>> +obj-$(CONFIG_SENSORS_ALTERA_A10SR) += altera-a10sr-hwmon.o
>>>   obj-$(CONFIG_SENSORS_APPLESMC)    += applesmc.o
>>>   obj-$(CONFIG_SENSORS_ARM_SCPI)    += scpi-hwmon.o
>>>   obj-$(CONFIG_SENSORS_ASC7621)    += asc7621.o
>>> diff --git a/drivers/hwmon/altera-a10sr-hwmon.c b/drivers/hwmon/altera-a10sr-hwmon.c
>>> new file mode 100644
>>> index 0000000..1eecc6b
>>> --- /dev/null
>>> +++ b/drivers/hwmon/altera-a10sr-hwmon.c
>>> @@ -0,0 +1,215 @@
>>> +/*
>>> + *  Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify it
>>> + * under the terms and conditions of the GNU General Public License,
>>> + * version 2, as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>> + * more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License along with
>>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>>> + *
>>> + * HW Monitor driver for  Altera Arria10 MAX5 System Resource Chip
>>> + * Adapted from DA9052
>>> + */
>>> +
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/mfd/altera-a10sr.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>
>> Please list include files in alphabetic order.
>>
>
> OK. I thought this was in alphabetical order. I'll update this after figuring out where I was wrong.
>

Sorry, PBKAC on my side.

Guenter

>>> +
>>> +#define ALTR_A10SR_1V0_BIT_POS          ALTR_A10SR_PG1_1V0_SHIFT
>>> +#define ALTR_A10SR_0V95_BIT_POS         ALTR_A10SR_PG1_0V95_SHIFT
>>> +#define ALTR_A10SR_0V9_BIT_POS          ALTR_A10SR_PG1_0V9_SHIFT
>>> +#define ALTR_A10SR_10V_BIT_POS          ALTR_A10SR_PG1_10V_SHIFT
>>> +#define ALTR_A10SR_5V0_BIT_POS          ALTR_A10SR_PG1_5V0_SHIFT
>>> +#define ALTR_A10SR_3V3_BIT_POS          ALTR_A10SR_PG1_3V3_SHIFT
>>> +#define ALTR_A10SR_2V5_BIT_POS          ALTR_A10SR_PG1_2V5_SHIFT
>>> +#define ALTR_A10SR_1V8_BIT_POS          ALTR_A10SR_PG1_1V8_SHIFT
>>> +#define ALTR_A10SR_OP_FLAG_BIT_POS      ALTR_A10SR_PG1_OP_FLAG_SHIFT
>>> +/* 2nd register needs an offset of 8 to get to 2nd register */
>>> +#define ALTR_A10SR_FBC2MP_BIT_POS       (8 + ALTR_A10SR_PG2_FBC2MP_SHIFT)
>>> +#define ALTR_A10SR_FAC2MP_BIT_POS       (8 + ALTR_A10SR_PG2_FAC2MP_SHIFT)
>>> +#define ALTR_A10SR_FMCBVADJ_BIT_POS     (8 + ALTR_A10SR_PG2_FMCBVADJ_SHIFT)
>>> +#define ALTR_A10SR_FMCAVADJ_BIT_POS     (8 + ALTR_A10SR_PG2_FMCAVADJ_SHIFT)
>>> +#define ALTR_A10SR_HL_VDDQ_BIT_POS      (8 + ALTR_A10SR_PG2_HL_VDDQ_SHIFT)
>>> +#define ALTR_A10SR_HL_VDD_BIT_POS       (8 + ALTR_A10SR_PG2_HL_VDD_SHIFT)
>>> +#define ALTR_A10SR_HL_HPS_BIT_POS       (8 + ALTR_A10SR_PG2_HL_HPS_SHIFT)
>>> +#define ALTR_A10SR_HPS_BIT_POS          (8 + ALTR_A10SR_PG2_HPS_SHIFT)
>>> +/* 3rd register needs an offset of 16 to get to 3rd register */
>>> +#define ALTR_A10SR_10V_FAIL_BIT_POS     (16 + ALTR_A10SR_PG3_10V_FAIL_SHIFT)
>>> +#define ALTR_A10SR_FAM2C_BIT_POS        (16 + ALTR_A10SR_PG3_FAM2C_SHIFT)
>>> +
>>> +/**
>>> + * struct altr_a10sr_hwmon - Altera Max5 HWMON device private data structure
>>> + * @device: hwmon class.
>>> + * @regmap: the regmap from the parent device.
>>> + */
>>> +struct altr_a10sr_hwmon {
>>> +    struct device        *class_device;
>>> +    struct regmap        *regmap;
>>> +};
>>> +
>>> +static ssize_t altr_a10sr_read_status(struct device *dev,
>>> +                      struct device_attribute *devattr,
>>> +                      char *buf)
>>> +{
>>> +    struct altr_a10sr_hwmon *hwmon = dev_get_drvdata(dev);
>>> +    int val, ret, index = to_sensor_dev_attr(devattr)->index;
>>> +    int mask = ALTR_A10SR_REG_BIT_MASK(index);
>>> +    unsigned char reg = ALTR_A10SR_PWR_GOOD1_REG +
>>> +                ALTR_A10SR_REG_OFFSET(index);
>>> +
>>> +    ret = regmap_read(hwmon->regmap, reg, &val);
>>
>> The pointer parameter to regmap_read() is unsigned int. I would suggest
>> to use the same variable type to avoid surprises.
>>
> Understood. Thanks.
>
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    return sprintf(buf, "%d\n", !!(~val & mask));
>>
>> Are alarms all active low ?
>>
> Yes, They are actually Power Good signals (Good = high) so I'm inverting.
>
>>> +}
>>> +
>>> +static ssize_t altr_a10sr_hwmon_show_name(struct device *dev,
>>> +                      struct device_attribute *devattr,
>>> +                      char *buf)
>>> +{
>>> +    return sprintf(buf, "altr_a10sr\n");
>>> +}
>>> +
>>> +/* First Power Good Register Bits */
>>> +static SENSOR_DEVICE_ATTR(1v0_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_1V0_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(0v95_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_0V95_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(0v9_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_0V9_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(5v0_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_5V0_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(3v3_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_3V3_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(2v5_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_2V5_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(1v8_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_1V8_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(opflag_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_OP_FLAG_BIT_POS);
>>> +/* Second Power Good Register Bits */
>>> +static SENSOR_DEVICE_ATTR(fbc2mp_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_FBC2MP_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(fac2mp_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_FAC2MP_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(fmcbvadj_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_FMCBVADJ_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(fmcavadj_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_FMCAVADJ_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(hl_vddq_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_HL_VDDQ_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(hl_vdd_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_HL_VDD_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(hlhps_vdd_alarm, S_IRUGO, altr_a10sr_read_status,
>>> +              NULL, ALTR_A10SR_HL_HPS_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(hps_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_HPS_BIT_POS);
>>> +/* Third Power Good Register Bits */
>>> +static SENSOR_DEVICE_ATTR(10v_alarm, S_IRUGO, altr_a10sr_read_status,
>>> +              NULL, ALTR_A10SR_10V_FAIL_BIT_POS);
>>> +static SENSOR_DEVICE_ATTR(fam2c_alarm, S_IRUGO, altr_a10sr_read_status, NULL,
>>> +              ALTR_A10SR_FAM2C_BIT_POS);
>>> +
>>> +static DEVICE_ATTR(name, S_IRUGO, altr_a10sr_hwmon_show_name, NULL);
>>> +
>>> +static struct attribute *altr_a10sr_attr[] = {
>>> +    &dev_attr_name.attr,
>>> +    /* First Power Good Register */
>>> +    &sensor_dev_attr_opflag_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_1v8_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_2v5_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_1v0_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_3v3_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_5v0_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_0v9_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_0v95_alarm.dev_attr.attr,
>>> +    /* Second Power Good Register */
>>> +    &sensor_dev_attr_hps_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_hlhps_vdd_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_hl_vdd_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_hl_vddq_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_fmcavadj_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_fmcbvadj_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_fac2mp_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_fbc2mp_alarm.dev_attr.attr,
>>> +    /* Third Power Good Register */
>>> +    &sensor_dev_attr_10v_alarm.dev_attr.attr,
>>> +    &sensor_dev_attr_fam2c_alarm.dev_attr.attr,
>>
>> Ultimately, this doesn't really make much sense, even with standard attribute
>> names. The ABI assumes that _input attrributes exist. Not sure if that could
>> be solved by providing 'dummy' unreadable input attributes (permission 0);
>> that might be worth a try. If you want to attach names to the attributes,
>> you would need to provide label attributes. Specifically you would need
>>
>>     inX_input (with permission 0) - not sure if that is even possible
>>     inX_alarm
>>     inX_label
>>
> Hmm. OK. I may need to rethink this.
>
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group altr_a10sr_attr_group = {
>>> +    .attrs = altr_a10sr_attr
>>> +};
>>> +
>>> +static int altr_a10sr_hwmon_probe(struct platform_device *pdev)
>>> +{
>>> +    struct altr_a10sr_hwmon *hwmon;
>>> +    int ret;
>>> +    struct altr_a10sr *a10sr = dev_get_drvdata(pdev->dev.parent);
>>> +
>>
>> What if someone creates a stand-alone devicetree property for this driver,
>> and there is no parent (or parent driver data) ?
>>
> I agree if this was a commercially available part. However, this is a specific driver for a programmable logic device (PLD) that will always be part of an MFD parent. The PLD only supports the Altera Development Kit.
>
>>> +    hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
>>> +    if (!hwmon)
>>> +        return -ENOMEM;
>>> +
>>> +    hwmon->regmap = a10sr->regmap;
>>> +
>>> +    platform_set_drvdata(pdev, hwmon);
>>> +
>>> +    ret = sysfs_create_group(&pdev->dev.kobj, &altr_a10sr_attr_group);
>>> +    if (ret)
>>> +        goto err_mem;
>>> +
>>> +    hwmon->class_device = hwmon_device_register(&pdev->dev);
>>> +    if (IS_ERR(hwmon->class_device)) {
>>> +        ret = PTR_ERR(hwmon->class_device);
>>> +        goto err_sysfs;
>>> +    }
>>
>> Please use devm_hwmon_device_register_with_groups().
>>
> Understood. Thanks.
>
> Thanks for reviewing.
>
>>> +
>>> +    return 0;
>>> +
>>> +err_sysfs:
>>> +    sysfs_remove_group(&pdev->dev.kobj, &altr_a10sr_attr_group);
>>> +err_mem:
>>> +    return ret;
>>> +}
>>> +
>>> +static int altr_a10sr_hwmon_remove(struct platform_device *pdev)
>>> +{
>>> +    struct altr_a10sr_hwmon *hwmon = platform_get_drvdata(pdev);
>>> +
>>> +    hwmon_device_unregister(hwmon->class_device);
>>> +    sysfs_remove_group(&pdev->dev.kobj, &altr_a10sr_attr_group);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id altr_a10sr_hwmon_of_match[] = {
>>> +    { .compatible = "altr,a10sr-hwmon" },
>>> +    { },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, altr_a10sr_hwmon_of_match);
>>> +
>>> +static struct platform_driver altr_a10sr_hwmon_driver = {
>>> +    .probe = altr_a10sr_hwmon_probe,
>>> +    .remove = altr_a10sr_hwmon_remove,
>>> +    .driver = {
>>> +        .name = "altr_a10sr_hwmon",
>>> +        .of_match_table = of_match_ptr(altr_a10sr_hwmon_of_match),
>>> +    },
>>> +};
>>> +
>>> +module_platform_driver(altr_a10sr_hwmon_driver);
>>> +
>>> +MODULE_LICENSE("GPL v2");
>>> +MODULE_AUTHOR("Thor Thayer <tthayer@opensource.altera.com>");
>>> +MODULE_DESCRIPTION("HW Monitor driver for Altera Arria10 System Resource Chip");
>>> --
>>> 1.7.9.5
>>>
>

