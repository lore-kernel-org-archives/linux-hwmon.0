Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32973 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933395AbeGIB0M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Jul 2018 21:26:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id r5-v6so872828pgv.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Jul 2018 18:26:12 -0700 (PDT)
Subject: Re: hwmon driver with misc interface
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James <eajames@linux.vnet.ibm.com>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
 <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
 <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
Date: Sun, 8 Jul 2018 18:26:09 -0700
MIME-Version: 1.0
In-Reply-To: <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/08/2018 06:05 PM, Benjamin Herrenschmidt wrote:
> On Sun, 2018-07-08 at 16:30 -0700, Guenter Roeck wrote:
>>
>> Trying to be be reasonable....
>>
>> Let's make some ground rules.
>>
>> - Do not attach foreign attributes (not related to hardware monitoring) to
>>     the hwmon device. Attach foreign attributes to its parent, eg the platform
>>     or i2c driver, or to a separate (misc ?) device if that is not feasible
>>     for some reason.
>> - Avoid foreign subsystem drivers. If the chip has an input device, a watchdog,
>>     and a hardware monitor, there should be three drivers.
>>     This is to some degree flexible; for example, PMBus drivers may register
>>     as power regulators, and some chips also have gpio support. But what,
>>     for example, the applesmc driver does is really not acceptable.
> 
> This rule can be a bit nasty if the various "parts" of the chip need
> tight interlock, share an interrupt etc... the solution to that is to
> have most of the common code in a "parent" driver that creates child
> devices with separate drivers that directly link onto the parent and
> use exported functions, but it can easily bloat the driver
> significantly for little benefit.
> 

But that is what mfd drivers are for, or am I missing something ?
After all, it has "multi-function device" right in its name.

Sure, there is somebloat, but on the plus side it ensures that
all bits and pieces are reviewed by the respective maintainers,
and the cross-functional API is _forced_ to be clean.

> That said, this is maybe not *too much* of an issue in the OCC case,
> see below.
> 
>> - Private hwmon attributes are acceptable as long as they are clearly
>>     documented and explained as necessary. This is not a free ride; you should
>>     have good reasons for private attributes and be able to explain that and why
>>     you need them. In this context, "because the hardware provides the information"
>>     is not a valid reason. The use case is important, not the fact that
>>     the hardware provides some random information.
>>
>> Can you work with that ?
> 
> Anything is always possible :-) The main question for me here is
> whether to keep what we do today:
> 
> 	* sbefifo (the transport driver)
> 	  |
> 	  * fsi-occ platform driver
>              ("passes occ hwmon commands to sbefifo and adds /dev/occ")
>               |
>               * occ-hwmon
> 
> Or can I collapse fsi-occ and occ-hwmon into one.
> 
> Now /dev/occ is just a "raw" interface to send commands to the OCC, via
> the same path occ-hwmon does. There's locking needed there between the
> two so it currently happens in fsi-occ.
> 
>>From what you are saying, you prefer that we keep it separate, which is
> our current design. I find it a bit messy but it's not a huge deal
> frankly, so let's do so.
> 
Other drivers solve that with an API from parent to child, either with
a direct function call or with a callback function provided to the child.
Another option would be to handle it through regmap; That nowadays
supports custom accesses implemented in the parent driver (see regmap_read
and regmap_write in struct regmap_config). The child driver gets the
regmap pointer and uses the regmap API. I don't see that as messy.

> The pre-requisite sbefifo driver is now in Greg's tree (and I'll have
> some fixes for it in -next this week), so you should be able to at
> least test build when Eddie resubmits.
> 
Ok.

> As for the various sysfs files for monitoring the base functionality of
> the occ, Eddie, you can always move them to fsi-occ.
> 

Yes, I think that would be more appropriate.

Thanks,
Guenter

> Cheers,
> Ben.
> 

