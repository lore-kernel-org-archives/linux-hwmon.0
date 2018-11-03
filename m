Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40370 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbeKCMIy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Nov 2018 08:08:54 -0400
Subject: Re: [PATCH v4 1/5] hwmon: (core) Add pm ops to hwmon class
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20181025235122.3240-1-nicoleotsuka@gmail.com>
 <20181025235122.3240-2-nicoleotsuka@gmail.com>
 <20181102175435.GA4749@roeck-us.net>
 <20181102194854.GA26329@Asurada-Nvidia.nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <52ca82e6-d63c-22e9-8577-5e6d48c17770@roeck-us.net>
Date: Fri, 2 Nov 2018 19:59:06 -0700
MIME-Version: 1.0
In-Reply-To: <20181102194854.GA26329@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/2/18 12:48 PM, Nicolin Chen wrote:
> On Fri, Nov 02, 2018 at 10:54:35AM -0700, Guenter Roeck wrote:
> 
>>> Actually, pm_runtime core also scans a class-level pm pointer:
>>>           else if (dev->class && dev->class->pm)
>>>                    ops = dev->class->pm;
>>>
>>> This means that hwmon class in the hwmon core could actually
>>> have its own generic pm callbacks so that a registered driver
>>> would have the capability to link their own callbacks to the
>>> hwmon core's.
>>>
>>> So this patch adds a pm pointer to the hwmon class with some
>>> generic pm callbacks of system suspend/resume and pm_runtime
>>> suspend/resume, and also allows hwmon drivers to pass valid
>>> pm pointers through _with_info API when registering devices.
>>>
>>
>> Just to give an update: I am not happy with having to add hwmon
>> specific pm callbacks. That doesn't look right to me. I'll have
>> to spend time figuring out how other virtual devices handle this
>> situation. Unfortunately, time is always scarce, so this will likely
>> take a while.
> 
> That's okay. Would it be possible then for me to add PM runtime
> functions just in ina3221, without touching hwmon core? It will
> belong to the I2C device, not hwmon device any more.
> 

If that works, sure. We can always add generic support later.

Guenter

>> Also, please note that I won't accept function macros. I understand
>> that are used a lot, especially in older hwmon drivers, but they just
>> make the code more difficult to read and often add unnecessary code.
> 
> Okay. Will be careful to use them in future hwmon patches.
> 
> Thanks
> Nicolin
> 
