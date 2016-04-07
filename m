Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37588 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752451AbcDGFZX (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Apr 2016 01:25:23 -0400
Subject: Re: [PATCH v6 2/6] hwmon: (fam15h_power) Add compute unit accumulated
 power
To: Huang Rui <ray.huang@amd.com>
References: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
 <1459928655-6071-3-git-send-email-ray.huang@amd.com>
 <20160406153025.GA16343@roeck-us.net> <20160407050551.GA30309@hr-amur2>
Cc: Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5705EF43.4090307@roeck-us.net>
Date: Wed, 6 Apr 2016 22:25:23 -0700
MIME-Version: 1.0
In-Reply-To: <20160407050551.GA30309@hr-amur2>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/06/2016 10:05 PM, Huang Rui wrote:
> On Wed, Apr 06, 2016 at 08:30:25AM -0700, Guenter Roeck wrote:
>> On Wed, Apr 06, 2016 at 03:44:11PM +0800, Huang Rui wrote:
>>>
>>> +static void do_read_registers_on_cu(void *_data)
>>> +{
>>> +	struct fam15h_power_data *data = _data;
>>> +	int cpu, cu;
>>> +
>>> +	cpu = smp_processor_id();
>>> +
>>
>> Is this function now defined in non-SMP code ? If so, can you point me to the
>> patch or branch introducing it ? It doesn't seem to be in mainline or in -next
>> unless I am missing it.
>>
>
> In include/linux/smp.h
>
>
> #else /* !SMP */
>
> static inline void smp_send_stop(void) { }
>
> /*
>   *      These macros fold the SMP functionality into a single CPU system
>   */
> #define raw_smp_processor_id()                  0
>
> ...
>
> /*
>   * smp_processor_id(): get the current CPU ID.
>   *
>   * if DEBUG_PREEMPT is enabled then we check whether it is
>   * used in a preemption-safe way. (smp_processor_id() is safe
>   * if it's used in a preemption-off critical section, or in
>   * a thread that is bound to the current CPU.)
>   *
>   * NOTE: raw_smp_processor_id() is for internal use only
>   * (smp_processor_id() is the preferred variant), but in rare
>   * instances it might also be used to turn off false positives
>   * (i.e. smp_processor_id() use that the debugging code reports but
>   * which use for some reason is legal). Don't use this to hack around
>   * the warning message, as your code might not work under PREEMPT.
>   */
> #ifdef CONFIG_DEBUG_PREEMPT
>    extern unsigned int debug_smp_processor_id(void);
> # define smp_processor_id() debug_smp_processor_id()
> #else
> # define smp_processor_id() raw_smp_processor_id()
> #endif
>
>
> Actually smp_processor_id() should returns 0 if we disable CONFIG_SMP.
>
>>> +	/*
>>> +	 * With the new x86 topology modelling, cpu core id actually
>>> +	 * is compute unit id.
>>> +	 */
>>> +	cu = cpu_data(cpu).cpu_core_id;
>>> +
>>> +	rdmsrl_safe(MSR_F15H_CU_PWR_ACCUMULATOR, &data->cu_acc_power[cu]);
>>> +}
>>> +
>>> +/*
>>> + * This function is only able to be called when CPUID
>>> + * Fn8000_0007:EDX[12] is set.
>>> + */
>>> +static int read_registers(struct fam15h_power_data *data)
>>> +{
>>> +	int this_cpu, ret, cpu;
>>> +	int core, this_core;
>>> +	cpumask_var_t mask;
>>> +
>>> +	ret = zalloc_cpumask_var(&mask, GFP_KERNEL);
>>> +	if (!ret)
>>> +		return -ENOMEM;
>>> +
>>> +	get_online_cpus();
>>> +	this_cpu = smp_processor_id();
>>> +
>>> +	/*
>>> +	 * Choose the first online core of each compute unit, and then
>>> +	 * read their MSR value of power and ptsc in a single IPI,
>>> +	 * because the MSR value of CPU core represent the compute
>>> +	 * unit's.
>>> +	 */
>>> +	core = -1;
>>> +
>>> +	for_each_online_cpu(cpu) {
>>> +		this_core = topology_core_id(cpu);
>>> +
>>> +		if (this_core == core)
>>> +			continue;
>>> +
>>> +		core = this_core;
>>> +
>> Sorry if I missed some context - is it guaranteed that all cores in the same
>> compute unit are returned next to each other from for_each_online_cpu() ?
>>
>
> Yes, there is a documentation which introduced from v4.6-rc2:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f7be8610bca88e59dd2fd5d98fcbc5031ef0e079
>
>     - topology_core_id();
>
>      The ID of the core to which a thread belongs. It is also printed in /proc/cpuinfo
>      "core_id."
>
> ...
>
>        AMD nomenclature for CMT systems:
>
>          [node 0] -> [Compute Unit 0] -> [Compute Unit Core 0] -> Linux CPU 0
>                                       -> [Compute Unit Core 1] -> Linux CPU 1
>                   -> [Compute Unit 1] -> [Compute Unit Core 0] -> Linux CPU 2
>                                       -> [Compute Unit Core 1] -> Linux CPU 3
>
> ray@hr-ub:~/tip$ cat /proc/cpuinfo | grep "core id"
> core id         : 0
> core id         : 0
> core id         : 1
> core id         : 1
>
> "this_core" here actually means the [Compute Unit] id which current
> [Compute Unit Core] belongs to. And "cpu" here means the [Compute Unit Core].
>
Ok, thanks.

Guenter


