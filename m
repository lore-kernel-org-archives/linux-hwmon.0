Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:33684 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752369AbdF2LiR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jun 2017 07:38:17 -0400
MIME-Version: 1.0
In-Reply-To: <c404694e-fd81-e4e4-569d-9438118f8be8@topic.nl>
References: <1498733135-4729-1-git-send-email-mike.looijmans@topic.nl>
 <CAH6sp9PPO1W3Km7-YbayrP=rbHtVDr4NCu-o4ZvC0UsCEXgyxQ@mail.gmail.com> <c404694e-fd81-e4e4-569d-9438118f8be8@topic.nl>
From: Frans Klaver <fransklaver@gmail.com>
Date: Thu, 29 Jun 2017 13:38:16 +0200
Message-ID: <CAH6sp9O1oaNqAWbSBhgNZtBafFi2YmnJ0jB15DZ4CFu8zT-Rrw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Add LTC2471/LTC2473 driver
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-hwmon@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jun 29, 2017 at 1:30 PM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 29-06-17 13:18, Frans Klaver wrote:
>>
>> On Thu, Jun 29, 2017 at 12:45 PM, Mike Looijmans
>> <mike.looijmans@topic.nl> wrote:
>>>
>>> The LTC2741 and LTC2473 are single voltage monitoring chips. The LTC2473
>>> is similar to the LTC2471 but outputs a signed differential value.
>>>
>>> Datasheet:
>>>    http://cds.linear.com/docs/en/datasheet/24713fb.pdf
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>>   drivers/hwmon/Kconfig   |  10 ++++
>>>   drivers/hwmon/Makefile  |   1 +
>>>   drivers/hwmon/ltc2471.c | 127
>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 138 insertions(+)
>>>   create mode 100644 drivers/hwmon/ltc2471.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index fbde226..c9a2a87 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -673,6 +673,16 @@ config SENSORS_LINEAGE
>>>            This driver can also be built as a module.  If so, the module
>>>            will be called lineage-pem.
>>>
>>> +config SENSORS_LTC2471
>>> +       tristate "Linear Technology LTC2471 and LTC2473"
>>> +       depends on I2C
>>> +       help
>>> +         If you say yes here you get support for Linear Technology
>>> LTC2471
>>> +         and LTC2473 voltage monitors.
>>> +
>>> +         This driver can also be built as a module. If so, the module
>>> will
>>> +         be called ltc2471.
>>> +
>>>   config SENSORS_LTC2945
>>>          tristate "Linear Technology LTC2945"
>>>          depends on I2C
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index 58cc3ac..6f60fe7 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -99,6 +99,7 @@ obj-$(CONFIG_SENSORS_LM93)    += lm93.o
>>>   obj-$(CONFIG_SENSORS_LM95234)  += lm95234.o
>>>   obj-$(CONFIG_SENSORS_LM95241)  += lm95241.o
>>>   obj-$(CONFIG_SENSORS_LM95245)  += lm95245.o
>>> +obj-$(CONFIG_SENSORS_LTC2471)  += ltc2471.o
>>>   obj-$(CONFIG_SENSORS_LTC2945)  += ltc2945.o
>>>   obj-$(CONFIG_SENSORS_LTC2990)  += ltc2990.o
>>>   obj-$(CONFIG_SENSORS_LTC4151)  += ltc4151.o
>>> diff --git a/drivers/hwmon/ltc2471.c b/drivers/hwmon/ltc2471.c
>>> new file mode 100644
>>> index 0000000..17eaad8
>>> --- /dev/null
>>> +++ b/drivers/hwmon/ltc2471.c
>>> @@ -0,0 +1,127 @@
>>> +/*
>>> + * Driver for Linear Technology LTC2471 and LTC2473 voltage monitors
>>> + * The LTC2473 is identical to the 2471, but reports a differential
>>> signal.
>>> + *
>>> + * Copyright (C) 2017 Topic Embedded Products
>>> + * Author: Mike Looijmans <mike.looijmans@topic.nl>
>>> + *
>>> + * License: GPLv2
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +
>>> +enum chips {
>>> +       ltc2471,
>>> +       ltc2473
>>> +};
>>> +
>>> +struct ltc2471_data {
>>> +       struct i2c_client *i2c;
>>> +       bool differential;
>>> +};
>>
>>
>> I haven't checked if there are similar drivers, but how about
>> ltc247x_data? It's a bit odd to tie all naming in this driver to one
>> chip and then support another one as well.
>
>
> Did a query on the linear site, found the LTC2470 and LTC2472 which appear
> to be the SPI versions of the same chip. So yes, using "ltc247x" may cause
> confusion when other drivers arrive. Linear solves this by naming the
> datasheet "ltc24712" but I think that'd be even more confusing.

OK.


>>
>>> +
>>> +/* Reference voltage is 1.25V */
>>> +#define LTC2471_VREF 1250
>>> +
>>> +/* Read two bytes from the I2C bus to obtain the ADC result */
>>> +static int ltc2471_get_value(struct i2c_client *i2c)
>>> +{
>>> +       int ret;
>>> +       __be16 buf;
>>> +
>>> +       ret = i2c_master_recv(i2c, (char *)&buf, 2);
>>> +       if (ret < 0)
>>> +               return ret;
>>> +       if (ret != 2)
>>> +               return -EIO;
>>> +
>>> +       /* MSB first */
>>> +       return be16_to_cpu(buf);
>>> +}
>>> +
>>> +static ssize_t ltc2471_show_value(struct device *dev,
>>> +                                 struct device_attribute *da, char *buf)
>>> +{
>>> +       struct ltc2471_data *data = dev_get_drvdata(dev);
>>> +       int value;
>>> +
>>> +       value = ltc2471_get_value(data->i2c);
>>> +       if (unlikely(value < 0))
>>> +               return value;
>>> +
>>> +       if (data->differential)
>>> +               /* Ranges from -VREF to +VREF with "0" at 0x8000 */
>>> +               value = ((s32)LTC2471_VREF * (s32)(value - 0x8000)) >>
>>> 15;
>>> +       else
>>> +               /* Ranges from 0 to +VREF */
>>> +               value = ((u32)LTC2471_VREF * (u32)value) >> 16;
>>> +
>>> +       return snprintf(buf, PAGE_SIZE, "%d\n", value);
>>> +}
>>> +
>>> +static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ltc2471_show_value, NULL,
>>> 0);
>>
>>
>> Octal permissions are preferred over S_IRUGO and such.
>
>
> Uh, can elaborate on that, or give an example on what you mean by that
> remark?
>
> A quick grep reveils that most (if not all) hwmon devices are currently
> using "S_IRUGO" and such.

I am aware of the fact that lots of drivers use these .Linus filed an
executive decision that octals are preferred over symbols when it
comes to permissions. checkpatch.pl should warn about it nowadays.

Frans
