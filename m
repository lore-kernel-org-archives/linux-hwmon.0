Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33802 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbeLKO2N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Dec 2018 09:28:13 -0500
Subject: Re: [PATCH 21/30] hwmon: (da9052-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Support Opensource <Support.Opensource@diasemi.com>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
 <1544479728-30077-22-git-send-email-linux@roeck-us.net>
 <6ED8E3B22081A4459DAC7699F3695FB7021C50E52E@SW-EX-MBX02.diasemi.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ea1a6013-2738-a636-3835-6cc57becd6ec@roeck-us.net>
Date: Tue, 11 Dec 2018 06:28:10 -0800
MIME-Version: 1.0
In-Reply-To: <6ED8E3B22081A4459DAC7699F3695FB7021C50E52E@SW-EX-MBX02.diasemi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/11/18 3:47 AM, Steve Twiss wrote:
> Hi Guenter,
> 
> On 10 December 2018 22:09, Guenter Roeck wrote:
> 
>> Subject: [PATCH 21/30] hwmon: (da9052-hwmon) Use permission specific
>> SENSOR[_DEVICE]_ATTR variants
>>
>> Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
>> to improve readbility, and to reduce the chance of inconsistencies.
>>
>> Also replace any remaining S_<PERMS> in the driver with octal values.
>>
>> The conversion was done automatically with coccinelle. The semantic patches
>> and the scripts used to generate this commit log are available at
>> https://github.com/groeck/coccinelle-patches/hwmon/.
>>
>> This patch does not introduce functional changes. It was verified by
>> compiling the old and new files and comparing text and data sizes.
>>
>> Cc: Support Opensource <support.opensource@diasemi.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/hwmon/da9052-hwmon.c | 105 ++++++++++++++++------------------------
> 
> Thanks,
> 
> I am assuming this previous patch [01/10] hwmon: Introduce SENSOR_DEVICE_ATTR_{RO,RW,WO} and variants
> from this set, https://patchwork.kernel.org/patch/9489915/ and,
> + #define SENSOR_DEVICE_ATTR_RO(_name, _func, _index)            \
> +        SENSOR_DEVICE_ATTR(_name, 0444, _func##_show, NULL, _index)
> 

Yes, of course. Sorry, I should have mentioned it.

> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> 
Thanks!

Guenter
