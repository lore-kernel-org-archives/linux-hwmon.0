Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40874 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732205AbeGJUFZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jul 2018 16:05:25 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6AJxT0T097575
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jul 2018 16:04:48 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2k4xvt8dvg-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jul 2018 16:04:48 -0400
Received: from localhost
        by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 10 Jul 2018 14:04:47 -0600
Subject: Re: hwmon driver with misc interface
To: Guenter Roeck <linux@roeck-us.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
 <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
 <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
 <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 10 Jul 2018 15:04:33 -0500
MIME-Version: 1.0
In-Reply-To: <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Message-Id: <516bc180-624f-3645-7f2d-27397ee720b3@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 07/08/2018 08:26 PM, Guenter Roeck wrote:
> On 07/08/2018 06:05 PM, Benjamin Herrenschmidt wrote:
>> On Sun, 2018-07-08 at 16:30 -0700, Guenter Roeck wrote:
>>>
>>> Trying to be be reasonable....
>>>
>>> Let's make some ground rules.
>>>
>>> - Do not attach foreign attributes (not related to hardware 
>>> monitoring) to
>>>     the hwmon device. Attach foreign attributes to its parent, eg 
>>> the platform
>>>     or i2c driver, or to a separate (misc ?) device if that is not 
>>> feasible
>>>     for some reason.
>>> - Avoid foreign subsystem drivers. If the chip has an input device, 
>>> a watchdog,
>>>     and a hardware monitor, there should be three drivers.
>>>     This is to some degree flexible; for example, PMBus drivers may 
>>> register
>>>     as power regulators, and some chips also have gpio support. But 
>>> what,
>>>     for example, the applesmc driver does is really not acceptable.
>>
>> This rule can be a bit nasty if the various "parts" of the chip need
>> tight interlock, share an interrupt etc... the solution to that is to
>> have most of the common code in a "parent" driver that creates child
>> devices with separate drivers that directly link onto the parent and
>> use exported functions, but it can easily bloat the driver
>> significantly for little benefit.
>>
>
> But that is what mfd drivers are for, or am I missing something ?
> After all, it has "multi-function device" right in its name.
>
> Sure, there is somebloat, but on the plus side it ensures that
> all bits and pieces are reviewed by the respective maintainers,
> and the cross-functional API is _forced_ to be clean.
>
>> That said, this is maybe not *too much* of an issue in the OCC case,
>> see below.
>>
>>> - Private hwmon attributes are acceptable as long as they are clearly
>>>     documented and explained as necessary. This is not a free ride; 
>>> you should
>>>     have good reasons for private attributes and be able to explain 
>>> that and why
>>>     you need them. In this context, "because the hardware provides 
>>> the information"
>>>     is not a valid reason. The use case is important, not the fact that
>>>     the hardware provides some random information.
>>>
>>> Can you work with that ?
>>
>> Anything is always possible :-) The main question for me here is
>> whether to keep what we do today:
>>
>>     * sbefifo (the transport driver)
>>       |
>>       * fsi-occ platform driver
>>              ("passes occ hwmon commands to sbefifo and adds /dev/occ")
>>               |
>>               * occ-hwmon
>>
>> Or can I collapse fsi-occ and occ-hwmon into one.
>>
>> Now /dev/occ is just a "raw" interface to send commands to the OCC, via
>> the same path occ-hwmon does. There's locking needed there between the
>> two so it currently happens in fsi-occ.
>>
>>> From what you are saying, you prefer that we keep it separate, which is
>> our current design. I find it a bit messy but it's not a huge deal
>> frankly, so let's do so.
>>
> Other drivers solve that with an API from parent to child, either with
> a direct function call or with a callback function provided to the child.
> Another option would be to handle it through regmap; That nowadays
> supports custom accesses implemented in the parent driver (see 
> regmap_read
> and regmap_write in struct regmap_config). The child driver gets the
> regmap pointer and uses the regmap API. I don't see that as messy.
>
>> The pre-requisite sbefifo driver is now in Greg's tree (and I'll have
>> some fixes for it in -next this week), so you should be able to at
>> least test build when Eddie resubmits.
>>
> Ok.
>
>> As for the various sysfs files for monitoring the base functionality of
>> the occ, Eddie, you can always move them to fsi-occ.
>>
>
> Yes, I think that would be more appropriate.

This still won't work, since then we wouldn't have those attributes 
available in the P8 version of the driver (which has no fsi-occ driver). 
In addition, how would the poll response data get from the hwmon driver 
to the fsi-occ driver? Yet another interface? Seems awkward.

How about debugfs? We don't really mind where the attributes are, just 
that the data is exposed somewhere...

Thanks,
Eddie

>
> Thanks,
> Guenter
>
>> Cheers,
>> Ben.
>>
>

