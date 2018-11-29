Return-Path: <michelesr@autistici.org>
Return-path: <michelesr@autistici.org>
Subject: Re: [PATCH] dell-smm-hwmon.c: Add XPS 9570 to supported devices list
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org
References: <20181127230637.8673-1-michelesr@autistici.org>
 <fee13b89-90d1-0c62-84f1-4f282ca36c61@autistici.org>
 <20181128125613.7sblicuf6xqd7lun@pali>
 <0d8fa793-2823-949e-1f4d-68824717b487@autistici.org>
 <8f9f8a22-0d32-f938-5a6d-21d5cf1e91a5@autistici.org>
 <20181129094808.5bhuar6ysjcz7ntb@pali>
From: Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <cae2d443-84a0-b076-356c-24f5346f0767@autistici.org>
Date: Thu, 29 Nov 2018 21:42:54 +0000
MIME-Version: 1.0
In-Reply-To: <20181129094808.5bhuar6ysjcz7ntb@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

I've been playing with smm.c from a old version of i8kutils, that
is just an userspace utility to trigger the SMM RPC:

http://sprunge.us/llxG7R

I used that in combination with the following test script:

http://sprunge.us/izJmQK

I managed to run that on a XPS 9560 and 9570 and compare the results.

XPS 9560: http://sprunge.us/xCLNSy
XPS 9570: http://sprunge.us/wSFTKs

The main difference between 9560 and 9570 is that the calls to get
the type of either fan or temperature sensor are not working (they all 
return 0xfff in the eax register), where in the 9560 they're returning
proper values.

However, it looks like the call for reading values (fan speed or 
temperatures) are all returning proper values in 9570 as well.

I'm assuming the following:

- API should be the same between 9560 and 9670 (why should Dell change
   it just now, and just for a single feature?);
- in the 9670 the type calls are not implemented correctly;
- the sensor indexes should be correct (because they work when used to
   read the temperature directly)

I also tried using higher indexes but I always get 0xffff.

We could either wait for Dell to eventually release a firmware update
that implements those calls correctly or we could force the reading of
the temperatures even if the type is not returned properly (although
I didn't know how to map the sensor with the proper label).

I'm not keen to try other unknown procedures as I don't know what could
happen, but I've found that other documented procedures are working 
properly (eg. set fan speed, read firmware version, disable fan control,
enable fan control, etc.), so again I think the API shouldn't have changed.

Let me know your thoughts.

Thanks,
Michele.

On 11/29/18 9:48 AM, Pali Rohár wrote:
> On Wednesday 28 November 2018 23:23:07 Michele Sorcinelli wrote:
>> I tried to debug the temperature sensor probing with some printk()
>> around the code... it looks like the ssm calls are all returning -22
>> as result:
>>
>> [   90.565793] Calling i8k_get_temp_type(0)
>> [   90.565795] Inside i8k_get_temp_type() with sensors = 0
>> [   90.565795] Performing i8k_smm call
>> [   90.567708] Result of the i8k_smm call: -22
>> [   90.567708] Return value of i8k_get_temp_type: -22
>> [   90.567709] Result of i8k_get_temp_type(0): -22
>> [   90.567709] Calling i8k_get_temp_type(1)
>> [   90.567710] Inside i8k_get_temp_type() with sensors = 1
>> [   90.567710] Performing i8k_smm call
>> [   90.568567] Result of the i8k_smm call: -22
>> [   90.568567] Return value of i8k_get_temp_type: -22
>> [   90.568568] Result of i8k_get_temp_type(0): -22
>> [   90.568568] Calling i8k_get_temp_type(2)
>> [   90.568568] Inside i8k_get_temp_type() with sensors = 2
>> [   90.568569] Performing i8k_smm call
>> [   90.569441] Result of the i8k_smm call: -22
>> [   90.569441] Return value of i8k_get_temp_type: -22
>> [   90.569442] Result of i8k_get_temp_type(0): -22
>> [   90.569442] Calling i8k_get_temp_type(3)
>> [   90.569442] Inside i8k_get_temp_type() with sensors = 3
>> [   90.569443] Performing i8k_smm call
>> [   90.570321] Result of the i8k_smm call: -22
>> [   90.570322] Return value of i8k_get_temp_type: -22
>> [   90.570322] Result of i8k_get_temp_type(0): -22
>>
>> So this must be the reason for which sensors aren't detected.
> 
> Yes. SMM just say "I do not support this temp sensor". Also it is
> possible that Dell's SMM does not implement it at all.
> 
> You can try to play with it more and check if temp sensor does not have
> higher index.
> 
> But I cannot help more. As you said it is RPC black-box.
> 
>> AFAIK, SSM code is much of a black-box and finding how to fix
>> this will probably require some reverse engineering.
>>
>> However, apart from this and the fact that kernel hangs during
>> the SSM call (that is reasonable and again not much can't be done),
>> everything looks fine.
>>
>> Let me know if you want me to include more information in the commit message
>> for the patch or want me to do more testing.
> 
> That is enough. You can add my
> 
> Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> 
> and hwmon maintainers could pick up this patch.
> 
>> On 11/28/18 1:01 PM, Michele Sorcinelli wrote:
>>> Yes, values are reported correctly when the fan are on. I tested it
>>> by disabling the firmware automatic control using
>>> https://github.com/TomFreudenberg/dell-bios-fan-control and then running
>>> i8kfan 1 1 and i8kfan 2 2, which brought the fans to 2500 and 5100
>>> respectively.
>>>
>>> When automatic control is on I can see intermediate speeds as well.
>>>
>>> Is there anything that can be done to help the driver to discover
>>> the temperature sensors?
>>>
>>> On 11/28/18 12:56 PM, Pali Rohár wrote:
>>>> On Wednesday 28 November 2018 12:30:31 Michele Sorcinelli wrote:
>>>>> The output of sensors related to the is:
>>>>>
>>>>> dell_smm-virtual-0
>>>>> Adapter: Virtual device
>>>>> fan1:           0 RPM
>>>>> fan2:           0 RPM
>>>>
>>>> Ok, this means that both fans are turned off.
>>>>
>>>> When you start fans, have both number meaningful/correct value?
>>>>
>>>>> This suggests that temperature sensors are not discovered.
>>>>
>>>> Yes, probably they are unsupported or not discovered. But this is not
>>>> a problem.
>>>>
>>>>> Speeds reported in the hwmon interface are consistent with the others.
>>>>>
>>>>>
>>>>> On 11/27/18 11:06 PM, Michele Sorcinelli wrote:
>>>>>> Allow the module to be loaded on Dell XPS 9570, without having to use
>>>>>> the "force=1" option. The module loads without problems, and reports
>>>>>> correct fan values:
>>>>>>
>>>>>>        $ time cat /proc/i8k
>>>>>>        1.0 1.5 -1 35 0 0 0 0 -1 -22
>>>>>>        cat /proc/i8k  0.00s user 0.00s system 7% cpu 0.033 total
>>>>>>
>>>>>> However, the call may freeze the kernel for a very small time due to
>>>>>> code running in the SSM layer. This is a known issue with
>>>>>> the driver, and
>>>>>> can be reproduced with other supported models. Average execution
>>>>>> time is 33 ms.
>>>>>>
>>>>>> The command line tools from i8kutils can properly set the fan speed,
>>>>>> although the firmware will override it, unless automatic fan
>>>>>> control is disabled with the proper SSM call.
>>>>>>
>>>>>> Average fans speed (when firwmare automatic control is off):
>>>>>>
>>>>>> STATE -> RPM
>>>>>> 0 0 -> 0 0
>>>>>> 1 1 -> 2500 2500
>>>>>> 2 2 -> 5100 5100
>>>>>> 3 3 -> same as 2 2
>>>>>> ---
>>>>>>     drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>>>>>>     1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>>>>> b/drivers/hwmon/dell-smm-hwmon.c
>>>>>> index 9d3ef879d..367a8a617 100644
>>>>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>>>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>>>>> @@ -1017,6 +1017,13 @@ static const struct dmi_system_id
>>>>>> i8k_dmi_table[] __initconst = {
>>>>>>                 DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
>>>>>>             },
>>>>>>         },
>>>>>> +    {
>>>>>> +        .ident = "Dell XPS 15 9570",
>>>>>> +        .matches = {
>>>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
>>>>>> +        },
>>>>>> +    },
>>>>>>         { }
>>>>>>     };
>>>>>>
>>>>
> 
