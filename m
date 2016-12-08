Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42185 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752087AbcLHPSm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 10:18:42 -0500
Subject: Re: [PATCH 01/17] hwmon: (adm9240) Fix overflows seen when writing
 into limit attributes
To: Jean Delvare <jdelvare@suse.de>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <20161208142910.425f1b0f@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <157c8cef-2628-3355-51d0-fb45672391f8@roeck-us.net>
Date: Thu, 8 Dec 2016 07:18:37 -0800
MIME-Version: 1.0
In-Reply-To: <20161208142910.425f1b0f@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/08/2016 05:29 AM, Jean Delvare wrote:
> Hi Guenter,
>
> On Sun,  4 Dec 2016 20:55:24 -0800, Guenter Roeck wrote:
>> Module test reports:
>>
>> in0_min: Suspected overflow: [3320 vs. 0]
>> in0_max: Suspected overflow: [3320 vs. 0]
>> in4_min: Suspected overflow: [15938 vs. 0]
>> in4_max: Suspected overflow: [15938 vs. 0]
>> temp1_max: Suspected overflow: [127000 vs. 0]
>> temp1_max_hyst: Suspected overflow: [127000 vs. 0]
>> aout_output: Suspected overflow: [1250 vs. 0]
>>
>> Code analysis reveals that the overflows are caused by conversions
>> from unsigned long to long to int, combined with multiplications on
>> passed values.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/hwmon/adm9240.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
>> index 2fe1828bd10b..347afacedcf5 100644
>> --- a/drivers/hwmon/adm9240.c
>> +++ b/drivers/hwmon/adm9240.c
>> @@ -98,12 +98,14 @@ static inline unsigned int IN_FROM_REG(u8 reg, int n)
>>
>>  static inline u8 IN_TO_REG(unsigned long val, int n)
>>  {
>> +	val = clamp_val(val, 0, INT_MAX / 192 - 12000);
>>  	return clamp_val(SCALE(val, 192, nom_mv[n]), 0, 255);
>>  }
>
> I understand the idea of clamping before the conversion to avoid the
> overflow. However I would have hoped that clamping the input makes
> clamping the output unneeded. Clamping is full of tests, which aren't
> cheap as they break the CPU instruction prediction, so we should not
> abuse it.
>
I am not that much concerned about this here, since the limits are not
usually set continuously. I agree though, since it is always better
to keep the code as simple as possible.

> Would the following work?
>
> static inline u8 IN_TO_REG(unsigned long val, int n)
> {
> 	val = clamp_val(val, 0, nom_mv[n] * 255 / 192);
> 	return SCALE(val, 192, nom_mv[n]);
> }
>
> This should be more compact and faster.
>
>>
>>  /* temperature range: -40..125, 127 disables temperature alarm */
>>  static inline s8 TEMP_TO_REG(long val)
>>  {
>> +	val = clamp_val(val, INT_MIN + 1000, INT_MAX - 1000);
>>  	return clamp_val(SCALE(val, 1, 1000), -40, 127);
>>  }
>>
>> @@ -122,6 +124,7 @@ static inline unsigned int FAN_FROM_REG(u8 reg, u8 div)
>>  /* analog out 0..1250mV */
>>  static inline u8 AOUT_TO_REG(unsigned long val)
>>  {
>> +	val = clamp_val(val, 0, INT_MAX / 255 - 1250);
>>  	return clamp_val(SCALE(val, 255, 1250), 0, 255);
>>  }
>>
>
> Same comment and same suggested solution for these two functions:
>
> /* temperature range: -40..125, 127 disables temperature alarm */
> static inline s8 TEMP_TO_REG(long val)
> {
> 	val = clamp_val(val, -40000, 127000);
> 	return SCALE(val, 1, 1000);
> }
>
> /* analog out 0..1250mV */
> static inline u8 AOUT_TO_REG(unsigned long val)
> {
> 	val = clamp_val(val, 0, 1250);
> 	return SCALE(val, 255, 1250);
> }
>
Should work. I'll give it a try.

Guenter

