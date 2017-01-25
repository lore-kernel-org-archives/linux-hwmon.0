Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57078 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751853AbdAYKxU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2017 05:53:20 -0500
Subject: Re: [PATCH v3 1/2] hwmon: new driver for ST stts751 thermal sensor
To: andrea.merello@gmail.com
References: <1485270141-9222-1-git-send-email-andrea.merello@gmail.com>
 <20170124201846.GA6788@roeck-us.net>
 <CAN8YU5NN5VhcBOXubA+CGD82kkowXdzBU3TQBF9jMxYh8ZZH-Q@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c4b279bb-7e5c-606d-5ef5-aa1ce34585b3@roeck-us.net>
Date: Wed, 25 Jan 2017 02:53:15 -0800
MIME-Version: 1.0
In-Reply-To: <CAN8YU5NN5VhcBOXubA+CGD82kkowXdzBU3TQBF9jMxYh8ZZH-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/25/2017 01:51 AM, Andrea Merello wrote:
> On Tue, Jan 24, 2017 at 9:18 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On Tue, Jan 24, 2017 at 04:02:20PM +0100, Andrea Merello wrote:
>>> This patch adds a HWMON driver for ST Microelectronics STTS751
>>> temperature sensors.
>>>
>>> It does support manual-triggered conversions as well as automatic
>>> conversions. The latter is used when the "event" or "therm" function
>>> is present (declaring the physical wire is attached in the DT).
>>>
>>> Thanks-to: LABBE Corentin [for suggestions]
>>> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
>>> Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Jean Delvare <jdelvare@suse.com>
>>> ---
>>

[ ... ]

>>> +
>>> +static s32 stts751_to_hw(int val)
>>> +{
>>> +     s32 hw_val;
>>> +
>>> +     if (val < 0)
>>> +             hw_val = (val - 62) / 125 * 32;
>>> +     else
>>> +             hw_val = (val + 62) / 125 * 32;
>>> +
>>
>> How about "return DIV_ROUND_CLOSEST(val, 125) * 32;" ?
>
> I admit that I stale this from lm90 without caring too much.. Now,
> looking at it, I realized that we could also improve the calculation
> precision by performing the multiplication before the division:
>
> DIV_ROUND_CLOSEST(val * 32, 125);
>
> (I think doing in this way makes rounding almost useless. Maybe it has
> a slight effect.)
>

The purpose of doing the multiplication afterwards is to make sure
that the lower 5 bits are 0 (or, rather, to shift the result 5 bits
to the left). Doing it first defeats that purpose, and would actually
mess up the rounding (because the lower bits will be ignored by the
hardware). For example, writing 0xff would yield 0xe0, while what
you would probably really want is to write 0x1e0 in that situation.

Guenter

