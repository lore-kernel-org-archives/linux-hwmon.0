Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49363 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755118AbcHSNPM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2016 09:15:12 -0400
Subject: Re: [PATCH v4] hwmon: (max6650.c) Add devicetree support
To: Mike Looijmans <mike.looijmans@topic.nl>, hjk@hansjkoch.de
References: <1471332001-14576-1-git-send-email-mike.looijmans@topic.nl>
 <47fa9220-4393-7c76-7a81-4127635712e3@roeck-us.net>
 <57B6C9FD.2010709@topic.nl>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e20ed198-38c2-f764-486d-66f66f2c6db4@roeck-us.net>
Date: Fri, 19 Aug 2016 06:13:35 -0700
MIME-Version: 1.0
In-Reply-To: <57B6C9FD.2010709@topic.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/19/2016 01:57 AM, Mike Looijmans wrote:
> (resent through different SMTP server, bounced as spam because of company server's unwanted modifications, sorry if you received this twice now)
>
> On 19-08-16 04:43, Guenter Roeck wrote:
>> On 08/16/2016 12:20 AM, Mike Looijmans wrote:
>>> Parse devicetree parameters for voltage and prescaler setting. This allows
>>> using multiple max6550 devices with varying settings, and also makes it
>>> possible to instantiate and configure the device using devicetree.
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>> v4: Vendor prefix "maxim," for devicetree properties and compatible string
>>>     Split documentation into separate patch
>>> v3: Resubmit because wrong mailing lists used
>>>     Fix style errors as reported by checkpatch.pl
>>>     Fix bug in DT parsing of fan-prescale
>>> v2: Add devicetree binding documentation
>>>     Code changes as suggested by Guenter
>>>     Reduce log info, output only a single line
>>>  drivers/hwmon/max6650.c | 47 ++++++++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 36 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
>>> index 162a520..6beb62c 100644
>>> --- a/drivers/hwmon/max6650.c
>>> +++ b/drivers/hwmon/max6650.c
>>> @@ -39,6 +39,7 @@
>>>  #include <linux/hwmon.h>
>>>  #include <linux/hwmon-sysfs.h>
>>>  #include <linux/err.h>
>>> +#include <linux/of_device.h>
>>>
>>>  /*
>>>   * Insmod parameters
>>> @@ -48,7 +49,7 @@
>>>  static int fan_voltage;
>>>  /* prescaler: Possible values are 1, 2, 4, 8, 16 or 0 for don't change */
>>>  static int prescaler;
>>> -/* clock: The clock frequency of the chip the driver should assume */
>>> +/* clock: The clock frequency of the chip (max6651 can be clocked
>>> externally) */
>>>  static int clock = 254000;
>>>
>>>  module_param(fan_voltage, int, S_IRUGO);
>>> @@ -133,6 +134,19 @@ static const u8 tach_reg[] = {
>>>      MAX6650_REG_TACH3,
>>>  };
>>>
>>> +static const struct of_device_id max6650_dt_match[] = {
>>> +    {
>>> +        .compatible = "maxim,max6650",
>>> +        .data = (void *)1
>>> +    },
>>> +    {
>>> +        .compatible = "maxim,max6651",
>>> +        .data = (void *)4
>>> +    },
>>> +    { },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, max6650_dt_match);
>>> +
>>>  static struct max6650_data *max6650_update_device(struct device *dev)
>>>  {
>>>      struct max6650_data *data = dev_get_drvdata(dev);
>>> @@ -566,6 +580,17 @@ static int max6650_init_client(struct max6650_data *data,
>>>      struct device *dev = &client->dev;
>>>      int config;
>>>      int err = -EIO;
>>> +    u32 voltage;
>>> +    u32 prescale;
>>> +
>>> +    if (of_property_read_u32(dev->of_node, "maxim,fan-microvolt",
>>> +                 &voltage))
>>> +        voltage = fan_voltage;
>>> +    else
>>> +        voltage = voltage > 5500000 ? 12 : 5;
>>
>> I think this should only accept 5V or 12V.
>>
>> Guenter
>
> A 4V, 10V or 13V fan will also work just fine, the voltage register just sets the range of the feedback tachometer.
>
> I don't have strong feelings either way, so if you feel the drive should bail out on anything but 5 or 12, that's fine with me too.
>
Problem with above code is that it isn't clear when the 5V vs. the 12V limit is set.
0V results in 5V, 5.5V results in 5V, 5.500001V results in 12V. That looks pretty
arbitrary. On top of that, the datasheet only mentions 5V and 12V fans, and I am
not aware of the others you are talking about. Per datasheet, the bit selects
either 5V or 12V as fan voltage. So we should stick with that.

> Should I change this and send a v5 patch?
>
Yes, please.

Guenter

