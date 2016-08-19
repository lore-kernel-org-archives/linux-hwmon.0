Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34256 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754336AbcHSNBa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2016 09:01:30 -0400
Subject: Re: [PATCH] hwmon: (max6650) Allow fan shutdown and a more intuitive
 mode interface
To: Mike Looijmans <mike.looijmans@topic.nl>,
        linux-hwmon@vger.kernel.org
References: <1471334034-14894-1-git-send-email-mike.looijmans@topic.nl>
 <c47e4482-a8e0-6a38-cccb-062b667587ac@roeck-us.net>
 <57B6A8BF.2080508@topic.nl>
Cc: linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5f14ba10-60dd-0e0a-dcd0-f8bbbed33510@roeck-us.net>
Date: Fri, 19 Aug 2016 06:01:13 -0700
MIME-Version: 1.0
In-Reply-To: <57B6A8BF.2080508@topic.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/18/2016 11:35 PM, Mike Looijmans wrote:
> On 19-08-16 04:54, Guenter Roeck wrote:
>> On 08/16/2016 12:53 AM, Mike Looijmans wrote:
>>> The fan can be stopped by writing "0" to fan1_target in sysfs.
>>>
>>> Writing non-zero values to fan1_target or pwm1 in sysfs automatically
>>> selects the corresponding control mode (closed or open loop).
>>>
>>> This allows userspace applications to control the fan speed without
>>> the need to know specific details of the controller (like the fact
>>> that fan1_target does not take effect when pwm1_enable is set to
>>> anything but "2"). Early initialization of the fan controller prevents
>>> overheating, for example when resetting the board while the fan was
>>> completely turned off.
>>>
>>
>> But this is the normal hwmon ABI. It should not be a surprise.
>> On the other side, changing the mode automatically as side effect
>> _is_ a surprise.
>
> I was under the impression that the pwm*_enable=2 mode was intended for
> temperature controlled fans. Reading the docs for a bunch of drivers reveals
> that apart from "0=full on" and "1=manual pwm" there is no standard whatsoever
> for the meaning of this value, each driver assigns its own, forcing userspace
> to know all the details of a particular model. So indeed, I'll have to change
> that. I'll have to write software specific for this fan then, it cannot be
> generic with the current ABI.
>
> I was actually aiming for supporting "off" mode, so I could later (when the
> new hardware arrives) also control a related power supply from this driver.
>
> Guess I should just add a mode "3" to implement "off".
>

What is wrong with "pwm/target 0 equals off" ?

Not sure what you mean with "control a related power supply". Please explain.

>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>> This patch requires the devicetree support patch for the max6650.
>>>
>>> Changes the functionality and interface of the driver, to be able to
>>> initialize the chip at boot, and allows userspace control without
>>> requiring hardware knowledge.
>>>
>>>  .../devicetree/bindings/hwmon/max6650.txt          |   5 +
>>>  Documentation/hwmon/max6650                        |   5 +-
>>>  drivers/hwmon/max6650.c                            | 153 +++++++++++++--------
>>>  3 files changed, 106 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt
>>> b/Documentation/devicetree/bindings/hwmon/max6650.txt
>>> index 2e46e69..724ab3a 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/max6650.txt
>>> +++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
>>> @@ -13,6 +13,10 @@ Optional properties, default is to retain the chip's
>>> current setting:
>>>  - maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
>>>              allow more fine-grained control of slower fans.
>>>              Valid: 1, 2, 4, 8, 16.
>>> +- maxim,fan-target-rpm: Initial requested fan rotation speed. If specified,
>>> the
>>> +            driver selects closed-loop mode and the requested speed.
>>> +            This ensures the fan is already running before userspace
>>> +            takes over.
>>>
>>
>> Needs to be separate patch and be approved by devicetree maintainers. Overall,
>> it would be better to make have the devicetree changces as single patch.
>
> Okay.
>
> How do they get synchronized then, i.e. what if the documentation gets
> approved but the actual implementation does not?
>

You would normally submit a series of patches, so the overall status would be
easy to follow.

Problem with multiple small patches is that it adds load to the devicetree
maintainers, and it never gives them (nor us) a complete picture.

Guenter

