Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57821 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752686AbcLHPej (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 10:34:39 -0500
Subject: Re: [PATCH 06/17] hwmon: (adm1026) Fix overflows seen when writing
 into limit attributes
To: Jean Delvare <jdelvare@suse.de>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-6-git-send-email-linux@roeck-us.net>
 <20161208153349.2ce80f2f@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0c8198ed-492f-faa1-1610-69ef2b98dc5e@roeck-us.net>
Date: Thu, 8 Dec 2016 07:34:35 -0800
MIME-Version: 1.0
In-Reply-To: <20161208153349.2ce80f2f@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jean,

On 12/08/2016 06:33 AM, Jean Delvare wrote:
> On Sun,  4 Dec 2016 20:55:29 -0800, Guenter Roeck wrote:
>> Fix overflows seen when writing large values into voltage limit,
>> temperature limit, temperature offset, and DAC attributes.
>>
>> Overflows are seen due to unbound multiplications and additions.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/hwmon/adm1026.c | 26 +++++++++++++++++---------
>>  1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
>> index e67b9a50ac7c..b2a5d9e5c590 100644
>> --- a/drivers/hwmon/adm1026.c
>> +++ b/drivers/hwmon/adm1026.c
>> @@ -197,8 +197,9 @@ static int adm1026_scaling[] = { /* .001 Volts */
>>  	};
>>  #define NEG12_OFFSET  16000
>>  #define SCALE(val, from, to) (((val)*(to) + ((from)/2))/(from))
>> -#define INS_TO_REG(n, val)  (clamp_val(SCALE(val, adm1026_scaling[n], 192),\
>> -	0, 255))
>> +#define INS_TO_REG(n, val)	\
>> +		SCALE(clamp_val(val, 0, 255 * adm1026_scaling[n] / 192), \
>> +		      adm1026_scaling[n], 192)
>>  #define INS_FROM_REG(n, val) (SCALE(val, 192, adm1026_scaling[n]))
>>
>>  /*
>> @@ -215,11 +216,11 @@ static int adm1026_scaling[] = { /* .001 Volts */
>>  #define DIV_TO_REG(val) ((val) >= 8 ? 3 : (val) >= 4 ? 2 : (val) >= 2 ? 1 : 0)
>>
>>  /* Temperature is reported in 1 degC increments */
>> -#define TEMP_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500)) \
>> -					/ 1000, -127, 127))
>> +#define TEMP_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), \
>> +					   1000)
>>  #define TEMP_FROM_REG(val) ((val) * 1000)
>> -#define OFFSET_TO_REG(val) (clamp_val(((val) + ((val) < 0 ? -500 : 500)) \
>> -					  / 1000, -127, 127))
>> +#define OFFSET_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), \
>> +					     1000)
>
> Sorry for nitpicking but the original code had -127 °C as the negative
> limit. You are changing it to -128 °C without a justification. If it
> matters, it should be at least documented in the commit message. If
> not, it should be left as it was.
>
I had seen -128 as value reported by the chip with one of my register dumps,
which messes up my module tests because it tries to rewrite the value it read
into the attribute, and that fails. Also, the datasheet lists -128 degrees C
as a valid register value.

This is one of those philosophical questions, for which I don't have a really
good answer. Should we clamp to the register limits or to the chip specification ?
I tend to clamp to register limits, because I think that it should always be possible
to write back what was read, but we are highly inconsistent in the various drivers.
Any opinion ?

>>  #define OFFSET_FROM_REG(val) ((val) * 1000)
>>
>>  #define PWM_TO_REG(val) (clamp_val(val, 0, 255))
>> @@ -233,7 +234,8 @@ static int adm1026_scaling[] = { /* .001 Volts */
>>   *   indicates that the DAC could be used to drive the fans, but in our
>>   *   example board (Arima HDAMA) it isn't connected to the fans at all.
>>   */
>> -#define DAC_TO_REG(val) (clamp_val(((((val) * 255) + 500) / 2500), 0, 255))
>> +#define DAC_TO_REG(val) DIV_ROUND_CLOSEST(clamp_val(val, 0, 2500) * 255, \
>> +					  2500)
>>  #define DAC_FROM_REG(val) (((val) * 2500) / 255)
>>
>>  /*
>> @@ -593,7 +595,10 @@ static ssize_t set_in16_min(struct device *dev, struct device_attribute *attr,
>>  		return err;
>>
>>  	mutex_lock(&data->update_lock);
>> -	data->in_min[16] = INS_TO_REG(16, val + NEG12_OFFSET);
>> +	data->in_min[16] = INS_TO_REG(16,
>> +				      clamp_val(val, INT_MIN,
>> +						INT_MAX - NEG12_OFFSET) +
>> +				      NEG12_OFFSET);
>>  	adm1026_write_value(client, ADM1026_REG_IN_MIN[16], data->in_min[16]);
>>  	mutex_unlock(&data->update_lock);
>>  	return count;
>> @@ -618,7 +623,10 @@ static ssize_t set_in16_max(struct device *dev, struct device_attribute *attr,
>>  		return err;
>>
>>  	mutex_lock(&data->update_lock);
>> -	data->in_max[16] = INS_TO_REG(16, val+NEG12_OFFSET);
>> +	data->in_max[16] = INS_TO_REG(16,
>> +				      clamp_val(val, INT_MIN,
>> +						INT_MAX - NEG12_OFFSET) +
>> +				      NEG12_OFFSET);
>>  	adm1026_write_value(client, ADM1026_REG_IN_MAX[16], data->in_max[16]);
>>  	mutex_unlock(&data->update_lock);
>>  	return count;
>
> On these code paths, you end up calling clamp_val() twice. This could
> certainly be avoided, but I'm too lazy to do the math ;-)
>
I know. Problem here is that there are two overflows, one in the calling code
(since it does arithmetic on the input value), and another one in INS_TO_REG().
When I wrote this, I didn't have a good idea how to avoid the first overflow
without a second clamp.

One possibility would be to define INS_TO_REG_NOCLAMP(). Would that be worth it ?

Thanks,
Guenter

