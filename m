Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-bn1on0081.outbound.protection.outlook.com ([157.56.110.81]:28664
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752465AbcFAPlq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jun 2016 11:41:46 -0400
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Borislav Petkov <bp@alien8.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"Hurwitz, Sherry" <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Date: Wed, 1 Jun 2016 15:26:59 +0000
Message-ID: <5FE1E570-430B-4C0D-9100-E213D5B5ACFA@amd.com>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>,<574EE1B3.9010704@roeck-us.net>
In-Reply-To: <574EE1B3.9010704@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



> On Jun 1, 2016, at 9:23 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 06/01/2016 03:04 AM, Borislav Petkov wrote:
>> From: Borislav Petkov <bp@suse.de>
>> 
>> We need to read a bunch of registers on each compute unit and possibly
>> on the current CPU too. Disable preemption around it.
> 
> An explanation would be helpful. Is this a bug fix ? I would like to get
> a confirmation from someone at AMD that this is really necessary.
> 

This change looks good for me. But I am in office this week, I will test it on CZ platform next week.   :-)

Thanks,
Rui

> Thanks,
> Guenter
> 
>> Signed-off-by: Borislav Petkov <bp@suse.de>
>> Cc: Rui Huang <ray.huang@amd.com>
>> Cc: Sherry Hurwitz <sherry.hurwitz@amd.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/hwmon/fam15h_power.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
>> index eb97a9241d17..69bb810f528b 100644
>> --- a/drivers/hwmon/fam15h_power.c
>> +++ b/drivers/hwmon/fam15h_power.c
>> @@ -172,9 +172,9 @@ static void do_read_registers_on_cu(void *_data)
>>   */
>>  static int read_registers(struct fam15h_power_data *data)
>>  {
>> -    int this_cpu, ret, cpu;
>>      int core, this_core;
>>      cpumask_var_t mask;
>> +    int ret, cpu;
>> 
>>      ret = zalloc_cpumask_var(&mask, GFP_KERNEL);
>>      if (!ret)
>> @@ -183,7 +183,6 @@ static int read_registers(struct fam15h_power_data *data)
>>      memset(data->cu_on, 0, sizeof(int) * MAX_CUS);
>> 
>>      get_online_cpus();
>> -    this_cpu = smp_processor_id();
>> 
>>      /*
>>       * Choose the first online core of each compute unit, and then
>> @@ -205,10 +204,13 @@ static int read_registers(struct fam15h_power_data *data)
>>          cpumask_set_cpu(cpumask_any(topology_sibling_cpumask(cpu)), mask);
>>      }
>> 
>> -    if (cpumask_test_cpu(this_cpu, mask))
>> +    preempt_disable();
>> +    smp_call_function_many(mask, do_read_registers_on_cu, data, true);
>> +
>> +    if (cpumask_test_cpu(smp_processor_id(), mask))
>>          do_read_registers_on_cu(data);
>> 
>> -    smp_call_function_many(mask, do_read_registers_on_cu, data, true);
>> +    preempt_enable();
>>      put_online_cpus();
>> 
>>      free_cpumask_var(mask);
> 
