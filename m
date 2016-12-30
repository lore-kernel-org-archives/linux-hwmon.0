Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43574 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750776AbcL3Az4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Dec 2016 19:55:56 -0500
Subject: Re: [RFC PATCH v2 3/4] hwmon: adc128d818: Trivial code style fixup
To: Alexander Koch <mail@alexanderkoch.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-4-mail@alexanderkoch.net>
 <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
 <3b34c8aa-9d9a-cf88-0d84-8e0d47f9bf44@alexanderkoch.net>
 <20161229194646.GA1575@roeck-us.net>
 <3274026c-9575-b85e-54da-dd1cd3c3ce2f@alexanderkoch.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, trivial@kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a49dc78b-cc66-43d8-57ff-57bdbc0f6dda@roeck-us.net>
Date: Thu, 29 Dec 2016 16:55:52 -0800
MIME-Version: 1.0
In-Reply-To: <3274026c-9575-b85e-54da-dd1cd3c3ce2f@alexanderkoch.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/29/2016 12:30 PM, Alexander Koch wrote:
> On 12/29/2016 08:46 PM, Guenter Roeck wrote:
>> On Thu, Dec 29, 2016 at 07:22:12PM +0100, Alexander Koch wrote:
>>> On 12/26/2016 11:47 AM, Guenter Roeck wrote:
>>>> On 12/23/2016 02:12 PM, Alexander Koch wrote:
>>>>> Replace sysfs symbolic file permissions, e.g. 'S_IRUGO', by octal
>>>>> permissions. This fixes checkpatch.pl warnings.
>>>>>
>>>>> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
>>>> Please do not bother with those warnings and ignore checkpatch.
>>>> We are in the process of doing an automated conversion.
>>> Okay, so I shall create v3 of the patchset, without these changes. I've
>>> found a typo in the 4th patch so I thought about going v3 anyways.
>>>
>>> I've tested operation modes 1-3 on real hardware today and found no
>>> issues so far, so I hope v3 will have good chances of getting accepted.
>>>
>> Pretty much. One request, though: If there is no configuration data
>> from DT, I would like the driver to read the mode from the chip - if for
>> nothing else, this will let me test all modes, but it also supports the
>> case where the chip is configured by BIOS/ROMMON.
>
> Aye, will add this as new fourth patch then. I assume the chip reset in
> adc128_init_client() clears the chip mode as well, so I will read it in
> the operation mode block in adc128_probe().
>
> Just out of interest: how does this help you test the modes? Do you
> configure the chip externally and test it on a platform without
> devicetree support?
>

I use the i2c test driver in the kernel and a module test script, on x86.
See https://github.com/groeck/module-tests. That only works if the driver
does not overwrite the register values on probe.

Not really sure if resetting the chip during probe is such a good idea
in the first place. It is quite unusual.

Guenter

