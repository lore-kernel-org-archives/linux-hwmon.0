Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from devianza.investici.org ([198.167.222.108]:28966 "EHLO
        devianza.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbeLHPeg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Dec 2018 10:34:36 -0500
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
To: Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
From: Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <cabfdc6d-069d-0b75-cafb-1a108178d4a0@autistici.org>
Date: Sat, 8 Dec 2018 15:34:32 +0000
MIME-Version: 1.0
In-Reply-To: <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

> Please _always_ version your patches, and add a changelog, at least if you
> would like to see it applied. I have now two patches which look almost the same,
> meaning I would have to pull both versions, compare, and hope to apply the
> correct one.

The only change is in i8k_is_visible():

     // first version
     +	if (index >= 20 && index <= 22 &&
                 !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
                     return 0;
     -	if (index >= 11 && index <= 13 &&
     +	if (index >= 23 && index <= 25 &&
                 !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
                     return 0;
     -	if (index >= 14 && index <= 16 &&
     +	if (index >= 26 && index <= 28 &&
                 !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
                     return 0;

     // second version
     +	if (index >= 20 && index <= 22 &&
                 !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
                     return 0;
     -	if (index >= 11 && index <= 13 &&
     +	if (index >= 23 && index <= 25 &&
                 !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
                     return 0;
     -	if (index >= 14 && index <= 16 &&
     +	if (index >= 26 && index <= 28 &&
                 !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
                     return 0;

Now the indexes in the if conditions have been changed to properly match the
entries in the i8k_attrs array:

     &sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
     &sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
     &sensor_dev_attr_pwm1.dev_attr.attr,	/* 22 */
     &sensor_dev_attr_fan2_input.dev_attr.attr,	/* 23 */
     &sensor_dev_attr_fan2_label.dev_attr.attr,	/* 24 */
     &sensor_dev_attr_pwm2.dev_attr.attr,	/* 25 */
     &sensor_dev_attr_fan3_input.dev_attr.attr,	/* 26 */
     &sensor_dev_attr_fan3_label.dev_attr.attr,	/* 27 */
     &sensor_dev_attr_pwm3.dev_attr.attr,	/* 28 */

> Anyway, I would like to get some feedback if this can cause regressions
> on systems which don't support that many sensors and maybe report something
> completely different if one tries to read the high-numbered sensors.
> I seem to recall that there was a reason for checking the type and not just
> trying to read sensor values.

AFAIK, i8k_get_temp() should return error if the sensor is not available, thus
the sensor won't be initialized in the hwmon interface. Unfortunately, I don't
have other machines to test it.


On 12/8/18 4:24 AM, Guenter Roeck wrote:
> On 12/7/18 4:56 PM, Michele Sorcinelli wrote:
>> The code has been extended to support up to 10 temperature sensors.
>>
>> The i8k_get_temp_type() calls inside i8k_init_hwmon() have been replaced
>> with i8k_get_temp() as in some laptop firmwares the related SMM procedure
>> is not implemented correctly so i8k_get_temp_type() can't be used to
>> discover temperature sensors.
>>
>> Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
> 
> Please _always_ version your patches, and add a changelog, at least if you
> would like to see it applied. I have now two patches which look almost the same,
> meaning I would have to pull both versions, compare, and hope to apply the
> correct one.
> 
> Anyway, I would like to get some feedback if this can cause regressions
> on systems which don't support that many sensors and maybe report something
> completely different if one tries to read the high-numbered sensors.
> I seem to recall that there was a reason for checking the type and not just
> trying to read sensor values.
> 
> Guenter
> 
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 113 +++++++++++++++++++++++++++------
>>   1 file changed, 94 insertions(+), 19 deletions(-)
>>   mode change 100644 => 100755 drivers/hwmon/dell-smm-hwmon.c
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> old mode 100644
>> new mode 100755
>> index 367a8a617..b58f756ea
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -82,9 +82,16 @@ static bool disallow_fan_support;
>>   #define I8K_HWMON_HAVE_TEMP2    (1 << 1)
>>   #define I8K_HWMON_HAVE_TEMP3    (1 << 2)
>>   #define I8K_HWMON_HAVE_TEMP4    (1 << 3)
>> -#define I8K_HWMON_HAVE_FAN1    (1 << 4)
>> -#define I8K_HWMON_HAVE_FAN2    (1 << 5)
>> -#define I8K_HWMON_HAVE_FAN3    (1 << 6)
>> +#define I8K_HWMON_HAVE_TEMP5    (1 << 4)
>> +#define I8K_HWMON_HAVE_TEMP6    (1 << 5)
>> +#define I8K_HWMON_HAVE_TEMP7    (1 << 6)
>> +#define I8K_HWMON_HAVE_TEMP8    (1 << 7)
>> +#define I8K_HWMON_HAVE_TEMP9    (1 << 8)
>> +#define I8K_HWMON_HAVE_TEMP10    (1 << 9)
>> +
>> +#define I8K_HWMON_HAVE_FAN1    (1 << 10)
>> +#define I8K_HWMON_HAVE_FAN2    (1 << 11)
>> +#define I8K_HWMON_HAVE_FAN3    (1 << 12)
>>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>>   MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
>> @@ -743,6 +750,25 @@ static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>>   static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 3);
>>   static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>>                 3);
>> +static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 4);
>> +static SENSOR_DEVICE_ATTR(temp5_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>> +              4);
>> +static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 5);
>> +static SENSOR_DEVICE_ATTR(temp6_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>> +              5);
>> +static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 6);
>> +static SENSOR_DEVICE_ATTR(temp7_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>> +              6);
>> +static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 7);
>> +static SENSOR_DEVICE_ATTR(temp8_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>> +              7);
>> +static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 8);
>> +static SENSOR_DEVICE_ATTR(temp9_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>> +              8);
>> +static SENSOR_DEVICE_ATTR(temp10_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 9);
>> +static SENSOR_DEVICE_ATTR(temp10_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>> +              9);
>> +
>>   static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, i8k_hwmon_show_fan, NULL, 0);
>>   static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
>>                 0);
>> @@ -770,15 +796,27 @@ static struct attribute *i8k_attrs[] = {
>>       &sensor_dev_attr_temp3_label.dev_attr.attr,    /* 5 */
>>       &sensor_dev_attr_temp4_input.dev_attr.attr,    /* 6 */
>>       &sensor_dev_attr_temp4_label.dev_attr.attr,    /* 7 */
>> -    &sensor_dev_attr_fan1_input.dev_attr.attr,    /* 8 */
>> -    &sensor_dev_attr_fan1_label.dev_attr.attr,    /* 9 */
>> -    &sensor_dev_attr_pwm1.dev_attr.attr,        /* 10 */
>> -    &sensor_dev_attr_fan2_input.dev_attr.attr,    /* 11 */
>> -    &sensor_dev_attr_fan2_label.dev_attr.attr,    /* 12 */
>> -    &sensor_dev_attr_pwm2.dev_attr.attr,        /* 13 */
>> -    &sensor_dev_attr_fan3_input.dev_attr.attr,    /* 14 */
>> -    &sensor_dev_attr_fan3_label.dev_attr.attr,    /* 15 */
>> -    &sensor_dev_attr_pwm3.dev_attr.attr,        /* 16 */
>> +    &sensor_dev_attr_temp5_input.dev_attr.attr,    /* 8 */
>> +    &sensor_dev_attr_temp5_label.dev_attr.attr,    /* 9 */
>> +    &sensor_dev_attr_temp6_input.dev_attr.attr,    /* 10 */
>> +    &sensor_dev_attr_temp6_label.dev_attr.attr,    /* 11 */
>> +    &sensor_dev_attr_temp7_input.dev_attr.attr,    /* 12 */
>> +    &sensor_dev_attr_temp7_label.dev_attr.attr,    /* 13 */
>> +    &sensor_dev_attr_temp8_input.dev_attr.attr,    /* 14 */
>> +    &sensor_dev_attr_temp8_label.dev_attr.attr,    /* 15 */
>> +    &sensor_dev_attr_temp9_input.dev_attr.attr,    /* 16 */
>> +    &sensor_dev_attr_temp9_label.dev_attr.attr,    /* 17 */
>> +    &sensor_dev_attr_temp10_input.dev_attr.attr,    /* 18 */
>> +    &sensor_dev_attr_temp10_label.dev_attr.attr,    /* 19 */
>> +    &sensor_dev_attr_fan1_input.dev_attr.attr,    /* 20 */
>> +    &sensor_dev_attr_fan1_label.dev_attr.attr,    /* 21 */
>> +    &sensor_dev_attr_pwm1.dev_attr.attr,        /* 22 */
>> +    &sensor_dev_attr_fan2_input.dev_attr.attr,    /* 23 */
>> +    &sensor_dev_attr_fan2_label.dev_attr.attr,    /* 24 */
>> +    &sensor_dev_attr_pwm2.dev_attr.attr,        /* 25 */
>> +    &sensor_dev_attr_fan3_input.dev_attr.attr,    /* 26 */
>> +    &sensor_dev_attr_fan3_label.dev_attr.attr,    /* 27 */
>> +    &sensor_dev_attr_pwm3.dev_attr.attr,        /* 28 */
>>       NULL
>>   };
>> @@ -802,13 +840,32 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>>       if (index >= 6 && index <= 7 &&
>>           !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
>>           return 0;
>> -    if (index >= 8 && index <= 10 &&
>> +    if (index >= 8 && index <= 9 &&
>> +        !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
>> +        return 0;
>> +    if (index >= 10 && index <= 11 &&
>> +        !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
>> +        return 0;
>> +    if (index >= 12 && index <= 13 &&
>> +        !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
>> +        return 0;
>> +    if (index >= 14 && index <= 15 &&
>> +        !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
>> +        return 0;
>> +    if (index >= 16 && index <= 17 &&
>> +        !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
>> +        return 0;
>> +    if (index >= 18 && index <= 19 &&
>> +        !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
>> +        return 0;
>> +
>> +    if (index >= 20 && index <= 22 &&
>>           !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
>>           return 0;
>> -    if (index >= 11 && index <= 13 &&
>> +    if (index >= 23 && index <= 25 &&
>>           !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
>>           return 0;
>> -    if (index >= 14 && index <= 16 &&
>> +    if (index >= 26 && index <= 28 &&
>>           !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
>>           return 0;
>> @@ -828,19 +885,37 @@ static int __init i8k_init_hwmon(void)
>>       i8k_hwmon_flags = 0;
>>       /* CPU temperature attributes, if temperature type is OK */
>> -    err = i8k_get_temp_type(0);
>> +    err = i8k_get_temp(0);
>>       if (err >= 0)
>>           i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP1;
>>       /* check for additional temperature sensors */
>> -    err = i8k_get_temp_type(1);
>> +    err = i8k_get_temp(1);
>>       if (err >= 0)
>>           i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP2;
>> -    err = i8k_get_temp_type(2);
>> +    err = i8k_get_temp(2);
>>       if (err >= 0)
>>           i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP3;
>> -    err = i8k_get_temp_type(3);
>> +    err = i8k_get_temp(3);
>>       if (err >= 0)
>>           i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
>> +    err = i8k_get_temp(4);
>> +    if (err >= 0)
>> +        i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP5;
>> +    err = i8k_get_temp(5);
>> +    if (err >= 0)
>> +        i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP6;
>> +    err = i8k_get_temp(6);
>> +    if (err >= 0)
>> +        i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP7;
>> +    err = i8k_get_temp(7);
>> +    if (err >= 0)
>> +        i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP8;
>> +    err = i8k_get_temp(8);
>> +    if (err >= 0)
>> +        i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP9;
>> +    err = i8k_get_temp(9);
>> +    if (err >= 0)
>> +        i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP10;
>>       /* First fan attributes, if fan status or type is OK */
>>       err = i8k_get_fan_status(0);
>>
> 
