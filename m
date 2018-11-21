Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34750 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbeKUTPo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Nov 2018 14:15:44 -0500
Subject: Re: [PATCH 2/2] hwmon: (ntc_thermistor): add support for B57891S0103
 from Epcos
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20181117121248.32143-1-peda@axentia.se>
 <20181117121248.32143-2-peda@axentia.se>
 <20181119170732.GA27435@roeck-us.net>
 <f1235661-f8f2-9885-1e7f-491f5c234078@axentia.se>
 <20181119212806.GC5795@roeck-us.net>
 <f15d3e1c-1b53-f390-78e2-6a88c77aed05@axentia.se>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
Date: Wed, 21 Nov 2018 00:42:05 -0800
MIME-Version: 1.0
In-Reply-To: <f15d3e1c-1b53-f390-78e2-6a88c77aed05@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/20/18 10:06 PM, Peter Rosin wrote:
> On 2018-11-19 22:28, Guenter Roeck wrote:
>> On Mon, Nov 19, 2018 at 09:16:12PM +0000, Peter Rosin wrote:
>>>>
>>>> Guess I deserve the non-alphabetic order as penalty for not enforcing it
>>>> earlier. I'll accept the patch after DT approval and submit another one
>>>> myself afterwards to restore alphabetic order.
>>>
>>> Right, I'm thinking another good change would be to introduce an enum
>>> into the ntc_thermistor_id array, because the hard-coded numbering in
>>
>> Yes, sounds like a good idea.
>>
>>> the ntc_match variable is a bit fragile in my taste, and that list would
>>> also benefit from being alphabetic. Currently there's simply no way to
>>> add things in the middle without causing mayhem. I thought about doing
>>> that, but didn't want to waste energy doing it up front without knowing
>>> if it would be well received (the driver might have been superseded or
>>
>> It would.
> 
> Right, so I have some patches sorting things out... However, one question

Sounds good.

> before I send them: Is it ok to sort the enum ntc_thermistor_type in the
> include/linux/platform_data/ntc_thermistor.h header or will that break
> stuff?
> 

Should be ok. It is not an UAPI, after all.

Guenter

> Cheers,
> Peter
> 
>> Guenter
>>
>>> something). I'm glad that you have volunteered to clean things up.
>>> Ha! :-)
>>>
>>> Cheers,
>>> Peter
>>>
>>>> Guenter
>>>>
>>>>>   };
>>>>>   
>>>>>   struct ntc_thermistor_platform_data {
>>>>> -- 
>>>>> 2.11.0
>>>>>
>>>
> 
