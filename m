Return-Path: <michelesr@autistici.org>
Return-path: <michelesr@autistici.org>
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
 <20181210105823.xq3mnrlfgdx63etl@pali>
From: Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <9af87094-05d8-3168-8bd2-7d60c9643286@autistici.org>
Date: Mon, 10 Dec 2018 11:53:58 +0000
MIME-Version: 1.0
In-Reply-To: <20181210105823.xq3mnrlfgdx63etl@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

That's a valid point, I honestly didn't think about it.

I opened a thread in the Dell community forum about the broken SSM procedures
but I didn't get any reply. I wonder what's the best way to inform the firmware
developers.

https://www.dell.com/community/XPS/Broken-SMM-procedures-in-XPS-9570-firmware/m-p/6229521

On 12/10/18 10:58 AM, Pali Rohár wrote:
> On Friday 07 December 2018 20:24:49 Guenter Roeck wrote:
>> Anyway, I would like to get some feedback if this can cause regressions
>> on systems which don't support that many sensors and maybe report something
>> completely different if one tries to read the high-numbered sensors.
>> I seem to recall that there was a reason for checking the type and not just
>> trying to read sensor values.
> 
> There can be also different problem for sensors which are turned off.
> E.g. on notebooks with switchable graphic cards which have included
> temperature sensors. When graphic card is turned off, then SMM returns
> error when asking for temperature value (for obvious reason). But
> temperature type still returns correct value "this is GPU sensors".
> 
> So we cannot replace temp_type check by temp_value check. It introduce
> race condition between "starting GPU" and initializing dell-smm hwmon.
> Now linux kernel has support for dynamic turning ON/OFF switchable GPU,
> so we need to care about these race conditions too.
> 
