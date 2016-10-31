Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36961 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933923AbcJaQSf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2016 12:18:35 -0400
Subject: Re: [PATCH v2 2/2] hwmon: new driver for ST stts751 thermal sensor
To: andrea.merello@gmail.com
References: <20161004235102.GA1055@roeck-us.net>
 <CAN8YU5Oemez-ovyGhmWR0y7D7UUnzuGYjSLTO607U8wrg36F4Q@mail.gmail.com>
 <246c105a-1cad-6b58-dd43-cbfc6a9f87d6@roeck-us.net>
 <CAN8YU5N7NEg8DH8VGrwP1-AJhfHO_Mj_3NSJahZU08ZLthsDFA@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <41a63728-762b-8336-823a-17db3522aabd@roeck-us.net>
Date: Mon, 31 Oct 2016 09:18:23 -0700
MIME-Version: 1.0
In-Reply-To: <CAN8YU5N7NEg8DH8VGrwP1-AJhfHO_Mj_3NSJahZU08ZLthsDFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/31/2016 08:27 AM, Andrea Merello wrote:

>>>
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>> +
>>>>> +     priv->max_alert = priv->max_alert || !!(ret &
>>>>> STTS751_STATUS_TRIPH);
>>>>> +     priv->min_alert = priv->min_alert || !!(ret &
>>>>> STTS751_STATUS_TRIPL);
>>>>> +
>>>>
>>>> I am not really happy about the caching of alert values. This isn't
>>>> really
>>>> common. Usually we report current alert values when reading. I don't
>>>> really
>>>> see why this driver should be different to all the others.
>>>
>>>
>>> OK
>
> I've tried to avoid caching, but as soon as I read the status register
> in the alert handler, the device clears that reg, and it will remain
> cleared up to the next conversion.
>
> So for example if the reader is blocked on poll over the alert
> attribute, it gets unblocked on alert, and it will very likely read
> zero..
>
> The only way I can see for avoiding caching, and for changing the API
> about clearing events as you asked below, is performing a temperature
> read from the temperature registers and doing software compare with
> the limits in show_[max/min]_alert.
>
> Does this sounds OK for you ?
>

Not really. That could be done from user space by just reading the temperature
and comparing it against limits.

If the chip clears the alert bit on read, why would you need a set attribute
to clear it ? From what you are saying, the next alert should update all
alert bits, meaning they would be auto-updated at that time. User space
would then always read the current state. Sure, you would cache the value
in the alert function to be able to read it in the read function, but I
don't see why all the complexity around it in your code would be needed.

You might want to update the alert status in case there is no interrupt
support, though (maybe you do already; I didn't re-check the code).

The 'sensors' code doesn't know that it is supposed to write into the
alert attribute to clear the status, thus unless you have a special
application, an alert would never be cleared. That doesn't sound very
appealing to me.

>>>
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void stts751_alert(struct i2c_client *client,
>>>>> +                     enum i2c_alert_protocol type, unsigned int data)
>>>>> +{
>>>>> +     int ret;
>>>>> +     struct stts751_priv *priv = i2c_get_clientdata(client);
>>>>> +     bool prev_max = priv->max_alert;
>>>>> +     bool prev_min = priv->min_alert;
>>>>> +
>>>>> +     if (type != I2C_PROTOCOL_SMBUS_ALERT)
>>>>> +             return;
>>>>> +
>>>>> +     dev_dbg(&client->dev, "alert!");
>>>>> +
>>>>
>>>>
>>>> Any chance to make this a bit more generic and also support
>>>> interrupts ?
>>>
>>>
>>> May you please elaborate?
>>>
>>> IMHO adding the logic for handling SMBus alerts using IRQs to any
>>> HWmon driver is redundant, because it is already implemented in the
>>> SMBus layer, just right now you need patching SMBus layer for enabling
>>> it from the DT world (a couple of patches for this are floating
>>> around, but they seems not ready for merge yet)... Using this chip
>>> with a generic interrupt is indeed exactly what I'm doing..
>>>
>>> .. Or am I completely missing your point ?
>>>
>> "just right now you need patching SMBus layer for enabling it from the DT
>> world"
>>
>> So it _doesn't_ work, correct ?
>
> I mean, the generic smbus code works for stts751, and the chip seems
> happy. So, in this case, no need to reimplement it elsewhere. It would
> just end up to be a copy-paste from smbus.c.... Just AFAICT we need
> some mechanism to hook smbus code from DT world..
>

Ok, then let's just go with it. If it doesn't work in some application we'll
have to fix it up later.

>>>>> +
>>>>> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_input, NULL, 0);
>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_min, S_IWUSR | S_IRUGO,
>>>>> +                     show_min, set_min, 0);
>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_max, S_IWUSR | S_IRUGO,
>>>>> +                     show_max, set_max, 0);
>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_min_alert, S_IWUSR | S_IRUGO,
>>>>> +                     show_min_alert, set_min_alert, 0);
>>>>> +static SENSOR_DEVICE_ATTR(temp1_event_max_alert, S_IWUSR | S_IRUGO,
>>>>> +                     show_max_alert, set_max_alert, 0);
>>>>> +static SENSOR_DEVICE_ATTR(temp1_therm, S_IWUSR | S_IRUGO, show_therm,
>>>>> +                     set_therm, 0);
>>>>> +static SENSOR_DEVICE_ATTR(temp1_therm_hyst, S_IWUSR | S_IRUGO,
>>>>> show_hyst,
>>>>> +                     set_hyst, 0);
>>>>
>>>>
>>>> Please use standard attribute names.
>>>
>>>
>>> I can convert the event stuff in temp1_[min/max]_alarm for limits and
>>> temp1_alarm for the flag, but it's not obvious to be what should I use
>>> for the therm stuff.. May you please give me advices about this?
>>>
>>> I'd propose temp1_therm_[max/min]_hyst, but they seems not standard
>>> anyway...
>>>
>>
>> From the chip datasheet, this is supposed to reflect overtemperature
>> conditions,
>> stronger than high/low, thus 'crit' seems appropriate.
>
> I see.. I can go with 'crit' :)
>
> Just is there any place where I can document this? Despite the
> datasheet, I can easily imagine real-world usage scenarios, for
> example driving a fan from that signal, where 'crit' might be not so
> intuitive.. Indeed I would like to make it visible the 'crit'
> <->'therm' binding to users. Maybe an additional attribute
> 'temp1_crit_label' or something like that ?
>
You are supposed to provide Documentation/hwmon/stts751, which would
include such information.

A label applies to a sensor, not to a sensor attribute, so that would
not be appropriate.

Thanks,
Guenter

