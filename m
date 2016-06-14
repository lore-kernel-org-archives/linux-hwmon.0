Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58393 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161306AbcFNCBd (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 13 Jun 2016 22:01:33 -0400
Subject: Re: [PATCH] dell-smm-hwmon: Detect fan with index=2
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842366-17964-1-git-send-email-pali.rohar@gmail.com>
 <20160531110334.GD29844@pali>
 <CABcamCCmiuAGA_v3xf=wZy7wq9e1dgOsQbobiPX_BxwA_TOpzQ@mail.gmail.com>
 <201606132026.31893@pali>
Cc: Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <575F656B.2040902@roeck-us.net>
Date: Mon, 13 Jun 2016 19:01:15 -0700
MIME-Version: 1.0
In-Reply-To: <201606132026.31893@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/13/2016 11:26 AM, Pali Rohár wrote:
> Guenter, I think you can take this patch also with Tolga's Tested-by.
>

The patch on its own doesn't apply. It depends on 'Cache fan-type calls ...'.
Should I take that patch as well ?

Also, the test feedback was informal. I can not convert it to a formal
Tested-by: without explicit permission (some people don't want to see
their e-mail address in kernel logs).

Guenter

> On Wednesday 01 June 2016 13:34:47 Tolga Cakir wrote:
>> Hi Pali,
>>
>> thanks for the patch and sorry for the delay! I've checked out
>> https://git.kernel.org/cgit/linux/kernel/git/groeck/linux-staging.git
>> /commit/?h=hwmon-staging&id=86c050c82dd527b17cf47043831f03646f402a88
>> and ran it on my Dell M3800. It correctly works for identifying 2
>> fans, one listed as "Processor Fan" and the other as "Video Fan".
>>
>> The freeze only causes "Processor Fan" to run at maximum btw., "Video
>> Fan" seems to be untouched. I don't get identical rpm values for both
>> of them, so they are indeed 2 independent fans. E.g. at ~70°C, I get
>> 2300rpm for CPU and 2400rpm for Video. Looks good to me.
>>
>> Cheers,
>> Tolga Cakir
>>
>> 2016-05-31 13:03 GMT+02:00 Pali Rohár <pali.rohar@gmail.com>:
>>> Tolga, can you test this patch if is working for you correctly?
>>>
>>> On Saturday 21 May 2016 16:52:46 Pali Rohár wrote:
>>>> Some Dell machines (e.g. Dell Precision M3800) have two fans,
>>>> first with index=0 and second with index=2. So export also
>>>> attributes for third fan device with index=2.
>>>>
>>>> Reported-by: Tolga Cakir <cevelnet@gmail.com>
>>>> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
>>>> ---
>>>>
>>>>   drivers/hwmon/dell-smm-hwmon.c |   20 +++++++++++++++++++-
>>>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>> ---
>>>>
>>>> Hi Tolga! Can you test this patch if sensors see fan device
>>>> correctly?
>>>>
>>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>>> b/drivers/hwmon/dell-smm-hwmon.c index 577445f..7a2764a 100644
>>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>>> @@ -78,6 +78,7 @@ static uint i8k_fan_max = I8K_FAN_HIGH;
>>>>
>>>>   #define I8K_HWMON_HAVE_TEMP4 (1 << 3)
>>>>   #define I8K_HWMON_HAVE_FAN1  (1 << 4)
>>>>   #define I8K_HWMON_HAVE_FAN2  (1 << 5)
>>>>
>>>> +#define I8K_HWMON_HAVE_FAN3  (1 << 6)
>>>>
>>>>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>>>>   MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
>>>>
>>>> @@ -246,7 +247,7 @@ static int _i8k_get_fan_type(int fan)
>>>>
>>>>   static int i8k_get_fan_type(int fan)
>>>>   {
>>>>
>>>>        /* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache
>>>>        values */
>>>>
>>>> -     static int types[2] = { INT_MIN, INT_MIN };
>>>> +     static int types[3] = { INT_MIN, INT_MIN, INT_MIN };
>>>>
>>>>        if (types[fan] == INT_MIN)
>>>>
>>>>                types[fan] = _i8k_get_fan_type(fan);
>>>>
>>>> @@ -707,6 +708,12 @@ static SENSOR_DEVICE_ATTR(fan2_label,
>>>> S_IRUGO, i8k_hwmon_show_fan_label, NULL,
>>>>
>>>>                          1);
>>>>
>>>>   static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
>>>>   i8k_hwmon_show_pwm,
>>>>
>>>>                          i8k_hwmon_set_pwm, 1);
>>>>
>>>> +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO,
>>>> i8k_hwmon_show_fan, NULL, +                       2);
>>>> +static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO,
>>>> i8k_hwmon_show_fan_label, NULL, +                       2);
>>>> +static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
>>>> i8k_hwmon_show_pwm, +                       i8k_hwmon_set_pwm,
>>>> 2);
>>>>
>>>>   static struct attribute *i8k_attrs[] = {
>>>>
>>>>        &sensor_dev_attr_temp1_input.dev_attr.attr,     /* 0 */
>>>>
>>>> @@ -723,6 +730,9 @@ static struct attribute *i8k_attrs[] = {
>>>>
>>>>        &sensor_dev_attr_fan2_input.dev_attr.attr,      /* 11 */
>>>>        &sensor_dev_attr_fan2_label.dev_attr.attr,      /* 12 */
>>>>        &sensor_dev_attr_pwm2.dev_attr.attr,            /* 13 */
>>>>
>>>> +     &sensor_dev_attr_fan3_input.dev_attr.attr,      /* 14 */
>>>> +     &sensor_dev_attr_fan3_label.dev_attr.attr,      /* 15 */
>>>> +     &sensor_dev_attr_pwm3.dev_attr.attr,            /* 16 */
>>>>
>>>>        NULL
>>>>
>>>>   };
>>>>
>>>> @@ -747,6 +757,9 @@ static umode_t i8k_is_visible(struct kobject
>>>> *kobj, struct attribute *attr,
>>>>
>>>>        if (index >= 11 && index <= 13 &&
>>>>
>>>>            !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
>>>>
>>>>                return 0;
>>>>
>>>> +     if (index >= 14 && index <= 16 &&
>>>> +         !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
>>>> +             return 0;
>>>>
>>>>        return attr->mode;
>>>>
>>>>   }
>>>>
>>>> @@ -788,6 +801,11 @@ static int __init i8k_init_hwmon(void)
>>>>
>>>>        if (err >= 0)
>>>>
>>>>                i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
>>>>
>>>> +     /* Third fan attributes, if fan status is OK */
>>>> +     err = i8k_get_fan_status(2);
>>>> +     if (err >= 0)
>>>> +             i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN3;
>>>> +
>>>>
>>>>        i8k_hwmon_dev = hwmon_device_register_with_groups(NULL,
>>>>        "dell_smm",
>>>>
>>>>                                                          NULL, i8k_groups);
>>>>
>>>>        if (IS_ERR(i8k_hwmon_dev)) {
>>>
>>> --
>>> Pali Rohár
>>> pali.rohar@gmail.com
>

