Return-Path: <arvind.yadav.cs@gmail.com>
Return-path: <arvind.yadav.cs@gmail.com>
Subject: Re: [v2] hwmon: adt7475: constify attribute_group structures
To: Guenter Roeck <linux@roeck-us.net>
References: <a067ef24035b924b03137a2e4dfa93eba6f6d080.1502098447.git.arvind.yadav.cs@gmail.com>
 <20170809020510.GA22544@roeck-us.net>
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <d4d330d9-18db-9bba-4cc6-54d738d64bcd@gmail.com>
Date: Wed, 9 Aug 2017 09:46:34 +0530
MIME-Version: 1.0
In-Reply-To: <20170809020510.GA22544@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

yes, Sorry for noise. After rebase, it' was showing unchanged.


On Wednesday 09 August 2017 07:35 AM, Guenter Roeck wrote:
> On Mon, Aug 07, 2017 at 03:06:29PM +0530, Arvind Yadav wrote:
>> attribute_group are not supposed to change at runtime. All functions
>> working with attribute_group provided by <linux/sysfs.h> work with
>> const attribute_group. So mark the non-const structs as const.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> Kind of confused by this one. I applied a similar patch from you
> back in July ??
>
> Guenter
>
>> ---
>> change in v2:
>>              subject was not correct. Removed 'wusbhc' and '.'.
>>
>>   drivers/hwmon/adt7475.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
>> index 1baa213..9ef8499 100644
>> --- a/drivers/hwmon/adt7475.c
>> +++ b/drivers/hwmon/adt7475.c
>> @@ -1319,14 +1319,14 @@ static SENSOR_DEVICE_ATTR_2(pwm3_stall_disable, S_IRUGO | S_IWUSR,
>>   	NULL
>>   };
>>   
>> -static struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
>> -static struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
>> -static struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
>> -static struct attribute_group in0_attr_group = { .attrs = in0_attrs };
>> -static struct attribute_group in3_attr_group = { .attrs = in3_attrs };
>> -static struct attribute_group in4_attr_group = { .attrs = in4_attrs };
>> -static struct attribute_group in5_attr_group = { .attrs = in5_attrs };
>> -static struct attribute_group vid_attr_group = { .attrs = vid_attrs };
>> +static const struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
>> +static const struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
>> +static const struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
>> +static const struct attribute_group in0_attr_group = { .attrs = in0_attrs };
>> +static const struct attribute_group in3_attr_group = { .attrs = in3_attrs };
>> +static const struct attribute_group in4_attr_group = { .attrs = in4_attrs };
>> +static const struct attribute_group in5_attr_group = { .attrs = in5_attrs };
>> +static const struct attribute_group vid_attr_group = { .attrs = vid_attrs };
>>   
>>   static int adt7475_detect(struct i2c_client *client,
>>   			  struct i2c_board_info *info)
~arvind
