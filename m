Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59539 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752015AbcEVPLa (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 11:11:30 -0400
Subject: Re: [PATCH] dell-smm-hwmon: Detect fan with index=2
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842366-17964-1-git-send-email-pali.rohar@gmail.com>
 <5740FB9A.6060803@roeck-us.net> <201605220231.12951@pali>
Cc: Jean Delvare <jdelvare@suse.com>, Tolga Cakir <cevelnet@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5741CC16.1000909@roeck-us.net>
Date: Sun, 22 May 2016 08:11:18 -0700
MIME-Version: 1.0
In-Reply-To: <201605220231.12951@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/21/2016 05:31 PM, Pali Rohár wrote:
> On Sunday 22 May 2016 02:21:46 Guenter Roeck wrote:
>> On 05/21/2016 07:52 AM, Pali Rohár wrote:
>>> Some Dell machines (e.g. Dell Precision M3800) have two fans, first
>>> with index=0 and second with index=2. So export also attributes
>>> for third fan device with index=2.
>>>
>>> Reported-by: Tolga Cakir <cevelnet@gmail.com>
>>> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
>>> ---
>>>
>>>    drivers/hwmon/dell-smm-hwmon.c |   20 +++++++++++++++++++-
>>>    1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> ---
>>>
>>> Hi Tolga! Can you test this patch if sensors see fan device
>>> correctly?
>>
>> I assume this means I should wait for test results before applying
>> the patch ?
>
> Yes, testing should be done.
>
> Do you have some pending/testing/next tree/branch for such patches?
>

I have a hwmon-staging branch. I added your patches to it.

Please use "hwmon: (dell-smm)" in the subject line of your patches.
The subsystem name should come first, the driver name in () is a hwmon
idiosyncrasy, and we don't need to repeat the "hwmon".

Thanks,
Guenter

>> Thanks,
>> Guenter
>>
>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>> b/drivers/hwmon/dell-smm-hwmon.c index 577445f..7a2764a 100644
>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>> @@ -78,6 +78,7 @@ static uint i8k_fan_max = I8K_FAN_HIGH;
>>>
>>>    #define I8K_HWMON_HAVE_TEMP4	(1 << 3)
>>>    #define I8K_HWMON_HAVE_FAN1	(1 << 4)
>>>    #define I8K_HWMON_HAVE_FAN2	(1 << 5)
>>>
>>> +#define I8K_HWMON_HAVE_FAN3	(1 << 6)
>>>
>>>    MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>>>    MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
>>>
>>> @@ -246,7 +247,7 @@ static int _i8k_get_fan_type(int fan)
>>>
>>>    static int i8k_get_fan_type(int fan)
>>>    {
>>>
>>>    	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values
>>>    	*/
>>>
>>> -	static int types[2] = { INT_MIN, INT_MIN };
>>> +	static int types[3] = { INT_MIN, INT_MIN, INT_MIN };
>>>
>>>    	if (types[fan] == INT_MIN)
>>>    	
>>>    		types[fan] = _i8k_get_fan_type(fan);
>>>
>>> @@ -707,6 +708,12 @@ static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO,
>>> i8k_hwmon_show_fan_label, NULL,
>>>
>>>    			  1);
>>>
>>>    static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR,
>>>    i8k_hwmon_show_pwm,
>>>
>>>    			  i8k_hwmon_set_pwm, 1);
>>>
>>> +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan,
>>> NULL, +			  2);
>>> +static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO,
>>> i8k_hwmon_show_fan_label, NULL, +			  2);
>>> +static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR,
>>> i8k_hwmon_show_pwm, +			  i8k_hwmon_set_pwm, 2);
>>>
>>>    static struct attribute *i8k_attrs[] = {
>>>
>>>    	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
>>>
>>> @@ -723,6 +730,9 @@ static struct attribute *i8k_attrs[] = {
>>>
>>>    	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
>>>    	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
>>>    	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
>>>
>>> +	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
>>> +	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
>>> +	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
>>>
>>>    	NULL
>>>
>>>    };
>>>
>>> @@ -747,6 +757,9 @@ static umode_t i8k_is_visible(struct kobject
>>> *kobj, struct attribute *attr,
>>>
>>>    	if (index >= 11 && index <= 13 &&
>>>    	
>>>    	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
>>>    		
>>>    		return 0;
>>>
>>> +	if (index >= 14 && index <= 16 &&
>>> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
>>> +		return 0;
>>>
>>>    	return attr->mode;
>>>
>>>    }
>>>
>>> @@ -788,6 +801,11 @@ static int __init i8k_init_hwmon(void)
>>>
>>>    	if (err >= 0)
>>>    	
>>>    		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
>>>
>>> +	/* Third fan attributes, if fan status is OK */
>>> +	err = i8k_get_fan_status(2);
>>> +	if (err >= 0)
>>> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN3;
>>> +
>>>
>>>    	i8k_hwmon_dev = hwmon_device_register_with_groups(NULL,
>>>    	"dell_smm",
>>>    	
>>>    							  NULL, i8k_groups);
>>>    	
>>>    	if (IS_ERR(i8k_hwmon_dev)) {
>

