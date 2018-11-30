Return-Path: <michelesr@autistici.org>
Return-path: <michelesr@autistici.org>
Subject: Re: [PATCH] dell-smm-hwmon.c: Add XPS 9570 to supported devices list
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20181130154408.6525-1-michelesr@autistici.org>
 <20181130154935.GA19060@roeck-us.net>
From: Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <026d224f-7f8d-b50f-f269-e6b2408a8822@autistici.org>
Date: Fri, 30 Nov 2018 18:17:43 +0000
MIME-Version: 1.0
In-Reply-To: <20181130154935.GA19060@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter, thanks for your feedback.

On 11/30/18 3:49 PM, Guenter Roeck wrote:

> This is not where to put a Reviewed-by: tag, and the patch is
> not signed and thus can not be applied.

You're right. I'll make sure the patch is properly tagged and signed.

> If you have actual evidence that the problem lies within the driver,
> not with SMM, please share that information.

As you said the problem belongs to the SMM layer, the driver can't do anything
about it. I'll remove that part as it's unnecessary and confusing.

> This is a different problem, not part of this patch, and the information
> does not belong here.

I'll remove that part as well.

Cheers,
Michele.

On 11/30/18 3:49 PM, Guenter Roeck wrote:
> On Fri, Nov 30, 2018 at 03:44:08PM +0000, Michele Sorcinelli wrote:
>> Reviewed by: Pali Rohár <pali.rohar@gmail.com>
>>
> 
> This is not where to put a Reviewed-by: tag, and the patch is
> not signed and thus can not be applied.
> 
>> Allow the module to be loaded on Dell XPS 9570, without having to use
>> the "force=1" option. The module loads without problems, and reports
>> correct values:
>>
>>      $ time cat /proc/i8k
>>      1.0 1.5 -1 35 0 0 0 0 -1 -22
>>      cat /proc/i8k  0.00s user 0.00s system 7% cpu 0.033 total
>>
>> However, the call may freeze the kernel for a very small time due to
>> code running in the SSM layer. This is a known issue with the driver, and
>> can be reproduced with other supported models. Average execution
>> time is 33 ms.
> 
> Is it ? My understanding is that it is an issue with the SMM layer.
> If you have actual evidence that the problem lies within the driver,
> not with SMM, please share that information.
> 
>>
>> The command line tools from i8kutils can properly set the fan speed,
>> although the firmware will override it, unless automatic fan
>> control is disabled with the proper SSM call.
>>
>> Average fans speed (when firwmare automatic control is off):
>>
>> STATE -> RPM
>> 0 0 -> 0 0
>> 1 1 -> 2500 2500
>> 2 2 -> 5100 5100
>> 3 3 -> same as 2 2
>>
>> The SSM procedures I8K_SMM_GET_FAN_TYPE and I8K_SMM_GET_TEMP_TYPE are
>> failing to return valid values to the module, that can't label the fans
>> and initialize the temperature sensors in the hwmon interface.
>>
>> This is a problem in the firmware code, and may be eventually addressed
>> by a new firmware version.
>>
>>      $ sensors dell_smm-virtual-0
>>      dell_smm-virtual-0
>>      Adapter: Virtual device
>>      fan1:        2531 RPM
>>      fan2:        2496 RPM
>>
>> However, the procedures I8K_SMM_GET_FAN and I8K_SMM_GET_TEMP are working
>> properly, as they return correct values. This means that the module
>> could be modified to initialize the sensors without labels and report
>> correct temperatures.
> 
> This is a different problem, not part of this patch, and the information
> does not belong here.
> 
> Guenter
> 
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 9d3ef879d..367a8a617 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -1017,6 +1017,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
>>   			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
>>   		},
>>   	},
>> +	{
>> +		.ident = "Dell XPS 15 9570",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
>> +		},
>> +	},
>>   	{ }
>>   };
>>   
>> -- 
>> 2.19.2
>>
