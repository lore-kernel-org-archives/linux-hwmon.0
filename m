Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50783 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750794AbdEBE5v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 May 2017 00:57:51 -0400
Subject: Re: Enabling enhanced acoustics on adt7475
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
References: <5b96df9d2ea649daa5f5b8a3896280c4@svr-chch-ex1.atlnz.lc>
 <20170501191605.GA17410@roeck-us.net>
 <007150d629ad4ace84b81466ed08ec63@svr-chch-ex1.atlnz.lc>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9184b01f-4586-57e3-b31d-f4b48f3335c8@roeck-us.net>
Date: Mon, 1 May 2017 21:57:47 -0700
MIME-Version: 1.0
In-Reply-To: <007150d629ad4ace84b81466ed08ec63@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/01/2017 08:45 PM, Chris Packham wrote:
> On 02/05/17 07:16, Guenter Roeck wrote:
>> On Mon, May 01, 2017 at 08:45:14AM +0000, Chris Packham wrote:
>>> Hi,
>>>
>>> I'm looking at adding code to configure the enhanced acoustics on the
>>> ADT7475 and compatible devices.
>>>
>>> I'm wondering if I should be adding these as device-tree properties or
>>> as sysfs attributes. And in either case how these properties/attributes
>>> should behave. The main impact of this would be to provide a mechanism
>>> for configuring how fast the pwm output will change.
>>>
>>> The fact that I wrote "configuring" above makes me lean towards sysfs
>>> attributes. Nothing in Documentation/hwmon/sysfs-interface really covers
>>
>> Definitely. This does not describe hardware.
>>
>>> this. dme1737.c has a pwmN_ramp_rate which would seem close to what I
>>> want. Is there any other precedent I should follow?
>>>
>> There is pwmX_step but that does not describe a ramp rate in time.
>> dme1737.c indeed seems to be the closest match. Nothing else I can think of.
>>
>
> I also found tempN_smoothing_enable and tempN_smoothing_time in
> asc7621.c which lines up quite closely with the adt7475.
>

Your call.

Guenter


