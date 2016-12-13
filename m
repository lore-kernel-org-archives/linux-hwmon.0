Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38428 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933304AbcLMOwj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Dec 2016 09:52:39 -0500
Subject: Re: [PATCH 03/17] hwmon: (lm93) Fix overflows seen when writing into
 limit attributes
To: Jean Delvare <jdelvare@suse.de>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-3-git-send-email-linux@roeck-us.net>
 <20161213150100.4248a8e2@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f4a065d1-81a8-7668-92c8-cb4507f3fd99@roeck-us.net>
Date: Tue, 13 Dec 2016 06:52:37 -0800
MIME-Version: 1.0
In-Reply-To: <20161213150100.4248a8e2@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/13/2016 06:01 AM, Jean Delvare wrote:
> Hi Guetner,
>
> I kept the more tasty one for last ;-)
>
> On Sun,  4 Dec 2016 20:55:26 -0800, Guenter Roeck wrote:
>> Module test shows a large number of overflows, caused by missing clamps
>> as well as various conversions between variable types.
>>
>> Also fix temperature calculations for hysteresis and offset registers.
>> For those, temperature calculations were a mix of millisecond and second
>> based, causing reported and accepted hysteresis and offset temperatures
>> to be widely off target.
>>
>> This also changes the offset and base temperature attributes to be
>> officially reported and set in milli-degrees C. This was already the case
>> for the base temperature attribute, even though it was documented to be
>> reported and set in degrees C.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  Documentation/hwmon/lm93 | 26 ++++++++++++-------------
>>  drivers/hwmon/lm93.c     | 49 +++++++++++++++++++++++++-----------------------
>>  2 files changed, 39 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/hwmon/lm93 b/Documentation/hwmon/lm93
>> index f3b2ad2ceb01..7bda7f0291e4 100644
>> --- a/Documentation/hwmon/lm93
>> +++ b/Documentation/hwmon/lm93
>> @@ -174,25 +174,25 @@ a "0" disables it. The h/w default is 0x0f (all temperatures bound).
>>
>>  The function y = f(x) takes a source temperature x to a PWM output y.  This
>>  function of the LM93 is derived from a base temperature and a table of 12
>> -temperature offsets.  The base temperature is expressed in degrees C in the
>> -sysfs files temp<n>_auto_base.  The offsets are expressed in cumulative
>> -degrees C, with the value of offset <i> for temperature value <n> being
>> +temperature offsets.  The base temperature is expressed in milli-degrees C in
>> +the sysfs files temp<n>_auto_base.  The offsets are expressed in cumulative
>> +milli-degrees C, with the value of offset <i> for temperature value <n> being
>>  contained in the file temp<n>_auto_offset<i>.  E.g. if the base temperature
>>  is 40C:
>>
>>       offset #	temp<n>_auto_offset<i>	range		pwm
>>  	 1		0		-		 25.00%
>>  	 2		0		-		 28.57%
>> -	 3		1		40C - 41C	 32.14%
>> -	 4		1		41C - 42C	 35.71%
>> -	 5		2		42C - 44C	 39.29%
>> -	 6		2		44C - 46C	 42.86%
>> -	 7		2		48C - 50C	 46.43%
>> -	 8		2		50C - 52C	 50.00%
>> -	 9		2		52C - 54C	 53.57%
>> -	10		2		54C - 56C	 57.14%
>> -	11		2		56C - 58C	 71.43%
>> -	12		2		58C - 60C	 85.71%
>> +	 3		500		40C - 41C	 32.14%
>> +	 4		500		41C - 42C	 35.71%
>> +	 5		1000		42C - 44C	 39.29%
>> +	 6		1000		44C - 46C	 42.86%
>> +	 7		1000		48C - 50C	 46.43%
>> +	 8		1000		50C - 52C	 50.00%
>> +	 9		1000		52C - 54C	 53.57%
>> +	10		1000		54C - 56C	 57.14%
>> +	11		1000		56C - 58C	 71.43%
>> +	12		1000		58C - 60C	 85.71%
>>  					> 60C		100.00%
>
> I'm a bit confused, I would have expected 1000 and 2000 for
> temp<n>_auto_offset<i>, not 500 and 1000? Otherwise I can't see how you
> get the announced ranges.
>
Let me look into it again. The driver has some other issues
with voltage limit ranges which I'll need to address as well.
I'll hold this patch until after the rc - no need to hurry.

>>
>>  Valid offsets are in the range 0C <= x <= 7.5C in 0.5C increments.
>> diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
>> index 90bb04858117..7b3152368e3b 100644
>> --- a/drivers/hwmon/lm93.c
>> +++ b/drivers/hwmon/lm93.c
>> (...)
>
> Code changes all look good to me, good job. Hairy code :-/
>
It most definitely is. Thanks!

Guenter

> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>

