Return-path: <tanureal@opensource.wolfsonmicro.com>
Subject: Re: How to add nano precision measurement to hwmon
To: Guenter Roeck <linux@roeck-us.net>,
        Lucas Tanure
	<tanureal@opensource.wolfsonmicro.com>,
        <linux-hwmon@vger.kernel.org>
References: <32c30882-2466-a992-158b-870cc8af5b40@opensource.cirrus.com>
 <3d1fd9fc-9b90-9bb7-3f5d-920c38c8c3c6@roeck-us.net>
CC: <patches@opensource.cirrus.com>
From: Lucas Tanure <tanureal@opensource.wolfsonmicro.com>
Message-ID: <11f62875-5d58-0282-f329-042f162e4ee6@opensource.cirrus.com>
Date: Sun, 19 Feb 2017 08:53:26 +0000
MIME-Version: 1.0
In-Reply-To: <3d1fd9fc-9b90-9bb7-3f5d-920c38c8c3c6@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 19/02/2017 02:10, Guenter Roeck wrote:
> Hi Lucas,
>
> On 02/17/2017 08:07 AM, Lucas Tanure wrote:
>> Hi,
>>
>> We have here in our company an internal hardware platform for our 
>> linux development that can measure current in a few circuits with 
>> nanoamps precision.
>> The measured values are exposed by a 32bit register that must read as 
>> a 32bit float.
>>
>> If we follow the hwmon sysfs interface we loss precision converting 
>> to milliamps, where the final value exposed is zero.
>>
>> Example :
>> Measure 291nA becomes 0mA under sysfs curr1_input
>>
>> The best solution for me would be a file in sysfs that I could just 
>> expose the float from my register (like curr1_input_float), this 
>> solution has two benefits for me:
>>
>> - I wouldn't need to convert my internal float to int
>> - This would give the best precision that I can have from my hardware
>>
>> The value could be exposed as a 32bit hex string, like 0x349c3abc.
>>
>> So, how should I proceed with this ?
>>
>
> A hex string would be really bad; userspace (generic) would not know 
> what to do with it.
>
> You could on purpose violate the ABI and report the current in 
> nano-Amps with currX_input
> (properly documented). This way the sensors command would still work 
> after proper
> adjustments in /etc/sensors3.conf. If the current sense resistor is 
> configurable,
> you could also not tell me at all and assume a current sense resistor 
> which is
> 1,000,000 times larger than the one you actually use (after all, 
> currency is
> usually measured as voltage loss over a current sense resistor).
>
> Another possibility would be to add a curr1_input_na attribute, but I 
> would prefer
> the above mechanism.
>
> Guenter

Hi Guenter,

You don't see any option to expose the 32bit float to user space ?
I would rather not deal with float conversion inside the kernel, as the 
numbers become too large to deal and I lose precision.

Thanks

Lucas Tanure
