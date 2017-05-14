Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49388 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751064AbdENVzb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 May 2017 17:55:31 -0400
Subject: Re: [PATCH v3 3/4] hwmon: (adt7475) temperature smoothing
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
 <20170511034524.22698-4-chris.packham@alliedtelesis.co.nz>
 <7b544105-655d-ec92-2690-1ff094339e7c@roeck-us.net>
 <17bdded5bf794ba08348ce304bc05f82@svr-chch-ex1.atlnz.lc>
Cc: Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f09619cc-c63a-dac6-f63d-8b679a72d3ba@roeck-us.net>
Date: Sun, 14 May 2017 14:55:25 -0700
MIME-Version: 1.0
In-Reply-To: <17bdded5bf794ba08348ce304bc05f82@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/14/2017 02:23 PM, Chris Packham wrote:
> On 15/05/17 03:40, Guenter Roeck wrote:
>> On 05/10/2017 08:45 PM, Chris Packham wrote:
>>> When enabled temperature smoothing allows ramping the fan speed over a
>>> configurable period of time instead of jumping to the new speed
>>> instantaneously.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Changes in v2:
>>> - use a single tempN_smoothing attribute
>>
>> This is a bit confusing. tempN suggests that the attribute would be associated
>> with a given temperature, not with fan control. Not that I have a better idea
>> for an attribute name, though, so unless you find a better name I am ok with it.
>>
>
> The datasheet is a bit confusing in this respect.
>
>  From the description of register 0x62:
>
> "Assuming that PWMx is associated with the Remote 1 temperature channel,
> these bits define the maximum rate of change of the PWMx output for
> Remote 1 temperature related changes. Instead of the fan speed jumping
> instantaneously to its newly determined speed, it ramps
> gracefully at the rate determined by these bits. This feature ultimately
> enhances the acoustics of the fan."
>
> Based on my reading it's a property of the temperature input not of the
> PWM. If you changed pwmN_auto_channels_temp this setting would stay with
> the temperature sensor not the PWM.
>

Agreed, that is why I said that I don't have a better idea ...

Guenter

