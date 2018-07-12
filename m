Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:42068 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbeGLOPj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Jul 2018 10:15:39 -0400
Received: by mail-pf0-f193.google.com with SMTP id l9-v6so9028384pff.9
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Jul 2018 07:05:56 -0700 (PDT)
Subject: Re: [PATCH 3/5] hwmon: adt7475: Change to use adt7475_read macro
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>,
        Jean Delvare <jdelvare@suse.com>
Cc: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
 <20180712010450.10586-4-ikegami@allied-telesis.co.jp>
 <8109bd46-9065-a5e7-9e52-975563cb0df8@roeck-us.net>
 <OSAPR01MB317031FF04DEDDC33E01C2E0DC590@OSAPR01MB3170.jpnprd01.prod.outlook.com>
 <3860355d-ed87-902c-dc54-908c85f98ce4@roeck-us.net>
 <OSAPR01MB31707337DE771DFB3852F44EDC590@OSAPR01MB3170.jpnprd01.prod.outlook.com>
 <e0d479ac-ddd0-710d-65e4-3b8ed4db085a@roeck-us.net>
 <TY2PR01MB3178A7E39660F9AD8BFBC872DC590@TY2PR01MB3178.jpnprd01.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8f91af1d-c7c2-7099-853a-9cfc3e57a662@roeck-us.net>
Date: Thu, 12 Jul 2018 07:05:52 -0700
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB3178A7E39660F9AD8BFBC872DC590@TY2PR01MB3178.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/12/2018 06:47 AM, IKEGAMI Tokunori wrote:
> Hi Guenter-san,
> 
> Sorry but let me consult one more thing.
> 
> Since I have just remembered that there are -EAGAIN and -ETIMEDOUT possible to be returned by I2C driver.
> Those were mentioned to be able to be checked by the hwmon adt7475 driver in our company not long ago.
> Also I have just confirmed the Documentation/i2c/fault-codes so it seems still correct.
> 
> How do you think about this?
> Still those errors also should be just returned to user space?
> 

A driver should return the error codes it receives from lower level drivers, ie
in this case the error code from the i2c controller driver. It should not modify
error return codes. In fact, if a driver does modify error return codes,
static analyzers will complain.

Hope this helps,
Guenter

> Sorry for many times asking you but if you have a time please let me know your opinion.
> 
> Regards,
> Ikegami
> 
>> -----Original Message-----
>> From: IKEGAMI Tokunori
>> Sent: Thursday, July 12, 2018 3:23 PM
>> To: 'Guenter Roeck'; Jean Delvare
>> Cc: PACKHAM Chris; linux-hwmon@vger.kernel.org
>> Subject: RE: [PATCH 3/5] hwmon: adt7475: Change to use adt7475_read macro
>>
>> Hi Guenter-san,
>>
>> Thank you so much for the explanation.
>> I could understand enough it.
>> I will abandon these patches for now.
>>
>>> What is an "I2C error unit" ?
>>
>>    The error unit is caused by the I2C isolator failure device then bad
>> I2C signals causes the error.
>>    Our products have been replaced the device to other new device for the
>> manufacturing.
>>    But still there are many units using the old device and it is possible
>> to be caused the failure behavior in future.
>>    We tried to change the I2C clock speed on the error unit but the issue
>> was not able to be resolved.
>>    By the way we have fixed our original user space driver for other
>> feature to retry for the error.
>>
>>> Yes, the driver should check for errors, but it should report all errors
>>> to user space and neither retry nor silently hide/ignore errors (unless
>>> a problem is known to be a chip problem).
>>
>>    I will do consider this in future.
>>    But at first I will investigate the cause of another voltage warning
>> issue at first.
>>    It is not caused by the I2C error but sometimes detected the voltage
>> warning actually.
>>
>> Regards,
>> Ikegami
>>
>>> -----Original Message-----
>>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
>>> Roeck
>>> Sent: Thursday, July 12, 2018 1:23 PM
>>> To: IKEGAMI Tokunori; Jean Delvare
>>> Cc: PACKHAM Chris; linux-hwmon@vger.kernel.org
>>> Subject: Re: [PATCH 3/5] hwmon: adt7475: Change to use adt7475_read
>> macro
>>>
>>> On 07/11/2018 09:01 PM, IKEGAMI Tokunori wrote:
>>>> Hi Guenter-san,
>>>>
>>>> Thank you so much for your comments.
>>>>
>>>> Oh I see and actually we have some I2C error units in our products.
>>>> The patch is for the error case mainly.
>>>
>>> What is an "I2C error unit" ?
>>>
>>>> But I think that sometimes the I2C error is still caused on the normal
>>> units also actually.
>>>> I am not sure about that the normal units error behavior is caused
>> by
>>> the board (I2C controller) or the chip ADT7476A but probably the former
>>> but not sure.
>>>> So should these patches not be applied to the adt7475 driver as you
>>> mentioned?
>>>>
>>>
>>> Drivers are not responsible for handling bad board behavior, so retries
>>> due to controller or board issues should not be handled by the chip
>>> driver.
>>> Otherwise we would end up having to sprinkle retries into all i2c
>> drivers
>>> in the kernel.
>>>
>>> If the problem is caused by the controller, it should be handled in
>> the
>>> controller driver. If the problem is caused by bad i2c signals, it
>> should
>>> be handled by hardware (or maybe by selecting a different clock speed).
>>>
>>>> At first I thought that the I2C SMBus APIs return error codes but
>> adt7475
>>> driver does not check so it should be checked the error codes.
>>>> Is this not correct?
>>>>
>>>
>>> Yes, the driver should check for errors, but it should report all errors
>>> to user space and neither retry nor silently hide/ignore errors (unless
>>> a problem is known to be a chip problem).
>>>
>>> Guenter
>>>
>>>> To make sure let me confirm above.
>>>>
>>>> Regards,
>>>> Ikegami
>>>>
>>>>> -----Original Message-----
>>>>> From: linux-hwmon-owner@vger.kernel.org
>>>>> [mailto:linux-hwmon-owner@vger.kernel.org] On Behalf Of Guenter
>>> Roeck
>>>>> Sent: Thursday, July 12, 2018 12:42 PM
>>>>> To: IKEGAMI Tokunori; Jean Delvare
>>>>> Cc: PACKHAM Chris; linux-hwmon@vger.kernel.org
>>>>> Subject: Re: [PATCH 3/5] hwmon: adt7475: Change to use adt7475_read
>>> macro
>>>>>
>>>>> On 07/11/2018 07:52 PM, IKEGAMI Tokunori wrote:
>>>>>> Hi Guenter-san,
>>>>>>
>>>>>> Thank you so much for your comments.
>>>>>> Okay now I am thinking to change the adt7475_read macro to a function
>>>>> to repeat for the error case.
>>>>>> If you have any comment about this please let me know.
>>>>>
>>>>> Yes - we should only do this if it is known to be a chip problem.
>>>>> Patching the chip driver for a board (or i2c controller) problem
>>>>> is not appropriate.
>>>>>
>>>>> Guenter
>>>>>
>>>>>> Anyway I will do send v2 version patches later.
>>>>>>
>>>>>> Regards,
>>>>>> Ikegami
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of
>> Guenter
>>>>>>> Roeck
>>>>>>> Sent: Thursday, July 12, 2018 10:50 AM
>>>>>>> To: IKEGAMI Tokunori; Jean Delvare
>>>>>>> Cc: PACKHAM Chris; linux-hwmon@vger.kernel.org
>>>>>>> Subject: Re: [PATCH 3/5] hwmon: adt7475: Change to use
>> adt7475_read
>>>>> macro
>>>>>>>
>>>>>>> On 07/11/2018 06:04 PM, Tokunori Ikegami wrote:
>>>>>>>> It shoudl be same as with other functions to use adt7475_read.
>>>>>>>> So change to use it instead of i2c_smbus_read_byte_data.
>>>>>>>>
>>>>>>>
>>>>>>> I don't see a point in this change. Replacing a function name
>> doesn't
>>>>>>> make
>>>>>>> the code easier to read. If anything, you could consider dropping
>>>>>>> adt7475_read
>>>>>>> and calling i2c_smbus_read_byte_data() directly.
>>>>>>>
>>>>>>> Guenter
>>>>>>>
>>>>>>>> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
>>>>>>>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>>>>>> Cc: linux-hwmon@vger.kernel.org
>>>>>>>> ---
>>>>>>>>      drivers/hwmon/adt7475.c | 2 +-
>>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
>>>>>>>> index a40eb62ee6b1..bad250729e99 100644
>>>>>>>> --- a/drivers/hwmon/adt7475.c
>>>>>>>> +++ b/drivers/hwmon/adt7475.c
>>>>>>>> @@ -1012,7 +1012,7 @@ static ssize_t
>>>>>>> pwm_use_point2_pwm_at_crit_store(struct device *dev,
>>>>>>>>      		return -EINVAL;
>>>>>>>>
>>>>>>>>      	mutex_lock(&data->lock);
>>>>>>>> -	data->config4 = i2c_smbus_read_byte_data(client,
>>>>>>> REG_CONFIG4);
>>>>>>>> +	data->config4 = adt7475_read(REG_CONFIG4);
>>>>>>>>      	if (val)
>>>>>>>>      		data->config4 |= CONFIG4_MAXDUTY;
>>>>>>>>      	else
>>>>>>>>
>>>>>>
>>>>>
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe
>> linux-hwmon"
>>>>> in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at
>> http://vger.kernel.org/majordomo-info.html
> 

