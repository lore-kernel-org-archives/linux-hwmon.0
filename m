Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37957 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754649AbcIUDEJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2016 23:04:09 -0400
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan
 controller
To: Timothy Pearson <tpearson@raptorengineering.com>
References: <20160919014104.GA30840@roeck-us.net>
 <57E03124.4030202@raptorengineeringinc.com>
 <20160919200413.GA29242@roeck-us.net>
 <57E04B25.4000001@raptorengineeringinc.com>
 <20160920005443.GB4064@roeck-us.net>
 <57E093DB.7030000@raptorengineeringinc.com>
 <57E19104.6050907@raptorengineeringinc.com>
 <20160920195902.GB1934@roeck-us.net>
 <57E195A3.5050703@raptorengineeringinc.com>
Cc: linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <42772060-c1e0-0a2c-ea2d-0c4fbcc5c061@roeck-us.net>
Date: Tue, 20 Sep 2016 20:04:06 -0700
MIME-Version: 1.0
In-Reply-To: <57E195A3.5050703@raptorengineeringinc.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/20/2016 01:01 PM, Timothy Pearson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09/20/2016 02:59 PM, Guenter Roeck wrote:
>> On Tue, Sep 20, 2016 at 02:41:56PM -0500, Timothy Pearson wrote:
>>> On 09/19/2016 07:54 PM, Guenter Roeck wrote:
>>>>> On 09/19/2016 03:04 PM, Guenter Roeck wrote:
>>>>> And then you are using all pmbus commands ? Seems odd.
>>>>
>>>> I guess I'l buy an evaluation board if one is available and check if your claim
>>>> is correct. I am not inclined to accept a non-pmbus driver for a pmbus
>>>> device without good reason.
>>>>
>>>> Guenter
>>>
>>> Regarding the PMBus driver, I looked over the documentation available
>>> here: https://www.kernel.org/doc/Documentation/hwmon/pmbus
>>>
>>> From what I can tell PMBus drivers do not support configuring the fan
>>> control parameters, only monitoring the fan status and speed.  Is this
>>> correct, and if not where would I find the correct documentation?
>>>
>> So far that wasn't needed. That doesn't mean it can not be added.
>>
>> I orderd an evaluation board and will likely spend some time on it myself
>> after I get it.
>>
>> Guenter
>
> OK, sounds good.  I looked back in the notes for this project and we had
> originally considered using a PMBus driver but ran into the kernel
> documentation, noted the missing control features, and I subsequently

It is always useful to talk with the maintainer.

> misinterpreted the datasheet using the kernel docs as a reference.  This
> is why the hwmon driver was implemented.
>

I am still not sure I understand what irked you off in the datasheet.
Is it the "supports a subset of the commands defined in the PMBus
Specfication" ? If so, please keep in mind that every single chip
supporting PMBus will only support a subset of PMBus commands.

> Please let me know if I can be of any assistance.
>
Sure, I'll let you know.

Thanks,
Guenter

