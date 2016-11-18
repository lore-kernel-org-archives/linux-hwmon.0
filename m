Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-db5eur01on0041.outbound.protection.outlook.com ([104.47.2.41]:42720
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751689AbcKRMjX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2016 07:39:23 -0500
Date: Fri, 18 Nov 2016 13:23:36 +0100
From: Tom Levens <tom.levens@cern.ch>
To: Guenter Roeck <linux@roeck-us.net>
CC: Tom Levens <tom.levens@cern.ch>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
In-Reply-To: <20161117234024.GA26747@roeck-us.net>
Message-ID: <alpine.LRH.2.20.1611181316110.5613@pcbe13573-vm.dyndns.cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch> <1479384616-12479-3-git-send-email-tom.levens@cern.ch> <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net> <582DEB81.6050806@topic.nl> <20161117185654.GA19338@roeck-us.net> <582E0A6C.5010307@topic.nl>
 <20161117215454.GA23571@roeck-us.net> <09DCF2E6-3F08-4F0E-837B-55F591008AAB@cern.ch> <20161117234024.GA26747@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="-1920950886-711264204-1479471820=:5613"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

---1920950886-711264204-1479471820=:5613
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8BIT



On Fri, 18 Nov 2016, Guenter Roeck wrote:

> On Thu, Nov 17, 2016 at 11:25:30PM +0000, Tom Levens wrote:
>> On 17 Nov 2016, at 22:54, Guenter Roeck <linux@roeck-us.net> wrote:
>>> On Thu, Nov 17, 2016 at 08:52:12PM +0100, Mike Looijmans wrote:
>>>> ﻿On 17-11-2016 19:56, Guenter Roeck wrote:
>>>>> On Thu, Nov 17, 2016 at 06:40:17PM +0100, Mike Looijmans wrote:
>>>>>> ﻿On 17-11-16 17:56, Guenter Roeck wrote:
>>>>>>> On 11/17/2016 04:10 AM, Tom Levens wrote:
>>>>>>>> Updated version of the ltc2990 driver which supports all measurement
>>>>>>>> modes available in the chip. The mode can be set through a devicetree
>>>>>>>> attribute.
>>>>>>>
>>>>> [ ... ]
>>>>>
>>>>>>>>
>>>>>>>> static int ltc2990_i2c_probe(struct i2c_client *i2c,
>>>>>>>>                 const struct i2c_device_id *id)
>>>>>>>> {
>>>>>>>>    int ret;
>>>>>>>>    struct device *hwmon_dev;
>>>>>>>> +    struct ltc2990_data *data;
>>>>>>>> +    struct device_node *of_node = i2c->dev.of_node;
>>>>>>>>
>>>>>>>>    if (!i2c_check_functionality(i2c->adapter,
>>>>>>>> I2C_FUNC_SMBUS_BYTE_DATA |
>>>>>>>>                     I2C_FUNC_SMBUS_WORD_DATA))
>>>>>>>>        return -ENODEV;
>>>>>>>>
>>>>>>>> -    /* Setup continuous mode, current monitor */
>>>>>>>> +    data = devm_kzalloc(&i2c->dev, sizeof(struct ltc2990_data),
>>>>>>>> GFP_KERNEL);
>>>>>>>> +    if (unlikely(!data))
>>>>>>>> +        return -ENOMEM;
>>>>>>>> +    data->i2c = i2c;
>>>>>>>> +
>>>>>>>> +    if (!of_node || of_property_read_u32(of_node, "lltc,mode",
>>>>>>>> &data->mode))
>>>>>>>> +        data->mode = LTC2990_CONTROL_MODE_DEFAULT;
>>>>>>>
>>>>>>> Iam arguing with myself if we should still do this or if we should read
>>>>>>> the mode
>>>>>>> from the chip instead if it isn't provided (after all, it may have been
>>>>>>> initialized
>>>>>>> by the BIOS/ROMMON).
>>>>>>
>>>>>> I think the mode should be explicitly set, without default. There's no way
>>>>>> to tell whether the BIOS or bootloader has really set it up or whether the
>>>>>> chip is just reporting whatever it happened to default to. And given the
>>>>>> chip's function, it's unlikely a bootloader would want to initialize it.
>>>>>>
>>>>> Unlikely but possible. Even if we all agree that the chip should be configured
>>>>> by the driver, I don't like imposing that view on everyone else.
>>>>>
>>>>>> My advice would be to make it a required property. If not set, display an
>>>>>> error and bail out.
>>>>>>
>>>>> It is not that easy, unfortunately. It also has to work on a non-devicetree
>>>>> system. I would not object to making the property mandatory, but we would
>>>>> still need to provide non-DT support.
>>>>>
>>>>> My "use case" for taking the current mode from the chip if not specified
>>>>> is that it would enable me to run a module test with all modes. I consider
>>>>> this extremely valuable.
>>>>
>>>> Good point.
>>>>
>>>> The chip defaults to measuring internal temperature only, and the mode
>>>> defaults to "0".
>>>>
>>>> Choosing a mode that doesn't match the actual circuitry could be bad for the
>>>> chip or the board (though unlikely, it'll probably just be useless) since it
>>>> will actively drive some of the inputs in the temperature modes (which is
>>>> default for V3/V4 pins).
>>>>
>>>> Instead of failing, one could choose to set the default mode to "7", which
>>>> just measures the 4 voltages, which would be a harmless mode in all cases.
>>>>
>>>> As a way to let a bootloader set things up, I think it would be a good check
>>>> to see if CONTROL register bits 4:3 are set. If "00", the chip is not
>>>> acquiring data at all, and probably needs configuration still. In that case,
>>>> the mode must be provided by the devicetree (or the default "7").
>>>> If bits 4:3 are "11", it has already been set up to measure its inputs, and
>>>> it's okay to continue doing just that and use the current value of 2:0
>>>> register as default mode (if the devicetree didn't specify any mode at all).
>>>>
>>>
>>> At first glance, agreed, though by default b[3:4] are 00, and only the
>>> internal temperature is measured. Actually, the 5 mode bits are all
>>> relevant to determine what is measured. Maybe it would be better to take
>>> all 5 bits into account instead of blindly setting b[34]:=11 and a specific
>>> setting of b[0:2]. Sure, that would make the mode table a bit larger,
>>> but then ltc2990_attrs_ena[] could be made an u16 array, and a table size
>>> of 64 bytes would not be that bad.
>>
>> I would tend to agree that it should be possible to configure all 5 mode
>> bits through the devicetree. What I would propose is as follows.
>>
>> If a devicetree node exists, the mode parameter(s?) are required and the
>> chip is initialised.
>>
>> If a devicetree node doesn't exist, it is assumed that the chip has
>> already been configured (by the BIOS, etc). The mode is read from the
>> chip to set the visibility of the sysfs attributes. In the worst case, where the
>> chip has not been configured by another source, it would only be possible
>> to measure the internal temperature -- but I think this is an acceptable
>> limitation.
>>
> SGTM.
>
>> The only case that this does not cover is if the device tree node
>> exists but the chip is expected to be configured by some other source.
>> Maybe I am wrong, but I would not expect this to be a terribly common
>> situation.
>>
>> What do you think?
>>
> I would not bother about this case. Just make the mode property mandatory.

What do you think about making the devicetree property a list of two 
integers? Something like

lltc,mode = <7 3>;

which would set mode[2..0]=7 and mode[4..3]=3.

To me, this is easier to setup from the datasheet than a single integer 
value. The other option would be to split it into two properties, but I am 
struggling to come up with suitable names for them -- the datasheet 
helpfully calls both fields "mode".

Cheers,
---1920950886-711264204-1479471820=:5613--
