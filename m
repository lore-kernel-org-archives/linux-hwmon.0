Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33632 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753059AbcDFPaf (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Apr 2016 11:30:35 -0400
Date: Wed, 6 Apr 2016 08:30:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Huang Rui <ray.huang@amd.com>
Cc: Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH v6 2/6] hwmon: (fam15h_power) Add compute unit
 accumulated power
Message-ID: <20160406153025.GA16343@roeck-us.net>
References: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
 <1459928655-6071-3-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459928655-6071-3-git-send-email-ray.huang@amd.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Apr 06, 2016 at 03:44:11PM +0800, Huang Rui wrote:
> This patch adds a member in fam15h_power_data which specifies the
> compute unit accumulated power. It adds do_read_registers_on_cu to do
> all the read to all MSRs and run it on one of the online cores on each
> compute unit with smp_call_function_many(). This behavior can decrease
> IPI numbers.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/hwmon/fam15h_power.c | 72 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
> index 4f695d8..4edbaf0 100644
> --- a/drivers/hwmon/fam15h_power.c
> +++ b/drivers/hwmon/fam15h_power.c
> @@ -25,6 +25,8 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/bitops.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
>  #include <asm/processor.h>
>  #include <asm/msr.h>
>  
> @@ -44,7 +46,9 @@ MODULE_LICENSE("GPL");
>  
>  #define FAM15H_MIN_NUM_ATTRS		2
>  #define FAM15H_NUM_GROUPS		2
> +#define MAX_CUS				8
>  
> +#define MSR_F15H_CU_PWR_ACCUMULATOR	0xc001007a
>  #define MSR_F15H_CU_MAX_PWR_ACCUMULATOR	0xc001007b
>  
>  #define PCI_DEVICE_ID_AMD_15H_M70H_NB_F4 0x15b4
> @@ -59,6 +63,8 @@ struct fam15h_power_data {
>  	struct attribute_group group;
>  	/* maximum accumulated power of a compute unit */
>  	u64 max_cu_acc_power;
> +	/* accumulated power of the compute units */
> +	u64 cu_acc_power[MAX_CUS];
>  };
>  
>  static ssize_t show_power(struct device *dev,
> @@ -125,6 +131,70 @@ static ssize_t show_power_crit(struct device *dev,
>  }
>  static DEVICE_ATTR(power1_crit, S_IRUGO, show_power_crit, NULL);
>  
> +static void do_read_registers_on_cu(void *_data)
> +{
> +	struct fam15h_power_data *data = _data;
> +	int cpu, cu;
> +
> +	cpu = smp_processor_id();
> +

Is this function now defined in non-SMP code ? If so, can you point me to the
patch or branch introducing it ? It doesn't seem to be in mainline or in -next
unless I am missing it.

> +	/*
> +	 * With the new x86 topology modelling, cpu core id actually
> +	 * is compute unit id.
> +	 */
> +	cu = cpu_data(cpu).cpu_core_id;
> +
> +	rdmsrl_safe(MSR_F15H_CU_PWR_ACCUMULATOR, &data->cu_acc_power[cu]);
> +}
> +
> +/*
> + * This function is only able to be called when CPUID
> + * Fn8000_0007:EDX[12] is set.
> + */
> +static int read_registers(struct fam15h_power_data *data)
> +{
> +	int this_cpu, ret, cpu;
> +	int core, this_core;
> +	cpumask_var_t mask;
> +
> +	ret = zalloc_cpumask_var(&mask, GFP_KERNEL);
> +	if (!ret)
> +		return -ENOMEM;
> +
> +	get_online_cpus();
> +	this_cpu = smp_processor_id();
> +
> +	/*
> +	 * Choose the first online core of each compute unit, and then
> +	 * read their MSR value of power and ptsc in a single IPI,
> +	 * because the MSR value of CPU core represent the compute
> +	 * unit's.
> +	 */
> +	core = -1;
> +
> +	for_each_online_cpu(cpu) {
> +		this_core = topology_core_id(cpu);
> +
> +		if (this_core == core)
> +			continue;
> +
> +		core = this_core;
> +
Sorry if I missed some context - is it guaranteed that all cores in the same
compute unit are returned next to each other from for_each_online_cpu() ?

Thanks,
Guenter

> +		/* get any CPU on this compute unit */
> +		cpumask_set_cpu(cpumask_any(topology_sibling_cpumask(cpu)), mask);
> +	}
> +
> +	if (cpumask_test_cpu(this_cpu, mask))
> +		do_read_registers_on_cu(data);
> +
> +	smp_call_function_many(mask, do_read_registers_on_cu, data, true);
> +	put_online_cpus();
> +
> +	free_cpumask_var(mask);
> +
> +	return 0;
> +}
> +
>  static int fam15h_power_init_attrs(struct pci_dev *pdev,
>  				   struct fam15h_power_data *data)
>  {
> @@ -263,7 +333,7 @@ static int fam15h_power_init_data(struct pci_dev *f4,
>  
>  	data->max_cu_acc_power = tmp;
>  
> -	return 0;
> +	return read_registers(data);
>  }
>  
>  static int fam15h_power_probe(struct pci_dev *pdev,
> -- 
> 1.9.1
> 
