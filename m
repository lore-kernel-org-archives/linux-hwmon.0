Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37507 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968584AbdD1OLk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Apr 2017 10:11:40 -0400
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        linux-hwmon@vger.kernel.org
References: <20170421042505.20403-1-sam@mendozajonas.com>
 <248726f5-f1e7-4feb-1917-049173303aa6@roeck-us.net>
 <1493168635.1790.6.camel@mendozajonas.com>
 <1493354043.32554.1.camel@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0ce48f3c-9c7b-4bf8-2ed7-817098ecdfdf@roeck-us.net>
Date: Fri, 28 Apr 2017 07:11:37 -0700
MIME-Version: 1.0
In-Reply-To: <1493354043.32554.1.camel@mendozajonas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/27/2017 09:34 PM, Samuel Mendoza-Jonas wrote:
> On Wed, 2017-04-26 at 11:03 +1000, Samuel Mendoza-Jonas wrote:
>> On Fri, 2017-04-21 at 06:49 -0700, Guenter Roeck wrote:
>>> On 04/20/2017 09:25 PM, Samuel Mendoza-Jonas wrote:
>>>> IR35221 is a Digital DC-DC Multiphase Converter
>>>>
>>>> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
>>>> ---
>>>> - Tested on a ppc64 system which includes several of these devices.
>>>> - This patch re-implements the linear reg2data/data2reg functions from
>>>>   pmbus-core like some other drivers in order to scale some results. Is
>>>>   this something that would be better off being made generic for pmbus
>>>>   drivers to call?
>>>
>>> That might make sense. The only other driver is zl6100, or am I missing
>>> something ?
>>
>> I believe ltc2978 has a small implementation as well.
>>
>>>
>>> Trying to understand the code, the data format seems to be linear11 with
>>> an added exponent on top of it. Is that correct ? If so, I wonder if we should
>>> make that configurable, ie store the additional exponent in R and handle it
>>> in the pmbus core. Would that help ?
>>
>> Yes that's essentially what it is. Using R for the extra exponent would
>> be a neat solution, however at least for this chip commands in the same
>> class have different scaling exponents (eg VIN_UV_WARN_LIMIT vs
>> READ_VIN). I'll have a look though and see if I can cover this - maybe a
>> small wrapper function that updates the exponent in the data returned by
>> pmbus_read_word_data()/etc?
>
> After thinking about this for a bit I don't think it's as straightforward
>  as I would like :)
>

Hm ... lets drop this for now; we can always revisit it later. Can you address
the other comments and resubmit ?

Thanks,
Guenter

