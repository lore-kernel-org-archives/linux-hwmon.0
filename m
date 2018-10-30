Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34499 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbeJ3WGj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Oct 2018 18:06:39 -0400
Received: by mail-pl1-f194.google.com with SMTP id f10-v6so5547485plr.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Oct 2018 06:13:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Trent Piepho <tpiepho@impinj.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
 <20181029143521.22122-3-m.felsch@pengutronix.de>
 <20181029195238.GA24689@roeck-us.net> <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
 <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
Date: Tue, 30 Oct 2018 06:13:11 -0700
MIME-Version: 1.0
In-Reply-To: <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/30/18 3:47 AM, Marco Felsch wrote:
> Hi Guenter,
> 
> thanks for the quick response, please see my comments below.
> 
> On 18-10-29 18:12, Guenter Roeck wrote:
>> On 10/29/18 2:16 PM, Trent Piepho wrote:
>>> On Mon, 2018-10-29 at 12:52 -0700, Guenter Roeck wrote:
>>>> On Mon, Oct 29, 2018 at 03:35:21PM +0100, Marco Felsch wrote:
>>>>> Most the time low voltage detection happens on a external device
>>>>> e.g. a pmic or any other hw-logic. Some of such devices can pass the
>>>>> power state (good/bad) to the host via i2c or by toggling a gpio.
>>>>>
>>>>> This patch adds the support to evaluate a gpio line to determine
>>>>> the power good/bad state. The state is represented by the
>>>>> in0_lcrit_alarm. Furthermore the driver supports to release device from
>>>>> their driver upon a low voltage detection. This feature is supported by
>>>>> OF-based firmware only.
>>>>>
>>>>
>>>> NACK, sorry.
>>>>
>>>> hwmon is strictly about monitoring, not about taking any action, and much
>>>> less about removing devices from the system after some status change,
>>>> it be a gpio pin value or anything else. Other than that, the driver simply
>>>> maps a gpio pin to a (pretty much arbitrary) sysfs attribute, for which
>>>> a driver isn't really needed.
>>>>
>>>> I don't know if there is a space in the kernel for handling the problem
>>>> you are trying to solve, but it isn't hwmon.
>>>
>>> If we ignore the ability to stop other devices, how is this not a hwmon
>>> device with just alarm features?
>>>
>> Possibly, but the ability to stop other devices is at the core of the driver
>> as submitted.
>>
>>> It seems to map the hwmon interface quite directly.
>>
>> Agreed.
>>
>>>
>>> Consider, what if we had a "classic" hwmon chip, but on this board the
>>> I2C/LPC/SPI interface was not connected as an appropriate master was
>>> not available, and the default configuration of the chip was
>>> acceptable.  The chip's alarm outputs are connected to GPIOs, as it
>>> normal for a hwmon chip with alarm outputs.
>>>
>> "If we had" is theory. Do we ? We don't usually add code to the kernel
>> just in case the hardware it supports might be out there.
> 
> Yes, there are "good old" hwmon chips without any management interface,
> e.g. LTC694-3.3, LTC7862, ... also there might be a discrete hw circuit.
> I think it's better to handle those "simple" chips by a generic hwmon
> driver. By simple I mean chips which informs the host only by toggling a
> gpio to report a state. For this purpose my driver (including name
> convention) isn't generic enough, I think about a hwmon-simple device.
> Such a device can support reporting states, no voltage/power/temp values.
> 

Yes, I agree. It doesn't really make sense to keep adding single-attribute drivers.
hwmon-gpio-simple, maybe, to indicate that it gets its data from gpio ?
The most difficult part of such a driver would probably be to define acceptable
devicetree properties.

>>> Are the alarms no longer appropriate to appear in hwmon?  But if we
>>> connect the chip's I2C interface, then those same alarms should appear
>>> in hwmon?
>>>
>>> That just doesn't make sense to me.
>>>
>>> Also consider the gpio-fan driver.  That's pretty much just an
>>> interface to a gpio too.
>>> Or consider the leds-gpio driver.  That allows a gpio controlled LED to
>>> appear in the kernel's led subsystem.  It doesn't do anything besides
>>> turn the gpio on and off.  It's hardly needed if all we cared about was
>>> controlling the LED in some way.  Yet it's used quite often.
>>>
>>
>> The difference here is that those are distinct drivers, with no other hardware
>> behind it to control the LEDs or to report fan speeds.
>>
>> For voltage monitoring, that is not normally the case. It is much more likely
>> that there is in fact a hardware monitoring or power control chip, the
>> (or an) alarm output of that chip is connected to a gpio line, and its control
>> interface is connected. If so, the driver for that chip should be enhanced
>> to support interrupts, and to report the status with its own sysfs attributes.
>>
>> Agreed, that might be more work for a given hardware, and it would have to
>> be repeated for each chip with that configuration which doesn't already
>> have interrupt support. Meaning, unfortunately, almost all hwmon drivers.
>> It might even be necessary to implement an i2c or spi controller driver
>> if that does not exist. But it would be the appropriate solution.
> 
> Please see my above comments.
> 
>>> So it seems perfectly correct to me that a GPIO based hardware
>>> monitoring alarm should appear in the kernel's hardware monitoring
>>> subsystem with all the other hardware monitoring alarms.
>>>
>> We can only consider a driver reporting a specific attribute if there
>> is a board which doesn't support anything else.
>>
>>> The ability of the hwmon driver to cause certain other devices to be
>>> removed is a different question.
>>>
>> I disagree. That functionality is essential to the driver as submitted.
> 
> You're right thats important for my use-case, but I got you, thats not a
> hwmon related problem. If I understood the device-model correctly there
> are absolut no problems to hot-unplug devices, this is always the case
> if we unbind a driver from user-space. So why we can't handle it
> directly in the kernel. Are there any concerns? If not can you give me
> some hints to get the logic at thr right place.
> 
Well, the easiest solution would have been to do nothing code-wise and
register a gpio-keys instance on the gpio pin to create a KEY_POWER event.
Of course that might be considered an abuse of the input subsystem,
as Dmitry has pointed out, and is probably not acceptable. Now, if you
want that functionality, you could probably write some udev rules and
accomplish the same by listening for a change event from a sysfs attribute
supporting it (I think KEY_POWER is not really handled in the kernel,
but I am not entirely sure).

Handling the event in the kernel is more tricky. First, I don't think the
selective device removal as you have suggested would be acceptable anywhere;
it may cause all kinds of trouble. The thermal subsystem supports the
functionality to shut down the kernel in emergencies, but is limited
in its scope (or at least I think so) to thermal events. Anything else
would have to be discussed. I for my part prefer handling it from userspace.

Guenter
