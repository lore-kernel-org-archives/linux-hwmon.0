Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:43613 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751159AbcC1Jdc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 28 Mar 2016 05:33:32 -0400
Date: Mon, 28 Mar 2016 11:33:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: Huang Rui <ray.huang@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, spg_linux_kernel@amd.com
Subject: Re: [PATCH v5 4/6] hwmon: (fam15h_power) Introduce a cpu accumulated
 power reporting algorithm
Message-ID: <20160328093327.GC26651@pd.tnic>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
 <1459143136-2412-5-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1459143136-2412-5-git-send-email-ray.huang@amd.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Mar 28, 2016 at 01:32:14PM +0800, Huang Rui wrote:
> This patch introduces an algorithm that computes the average power by
> reading a delta value of “core power accumulator” register during
> measurement interval, and then dividing delta value by the length of
> the time interval.
> 
> User is able to use power1_average entry to measure the processor power
> consumption and power1_average_interval entry to set the interval.
> 
> A simple example:
> 
> ray@hr-ub:~/tip$ sensors
> fam15h_power-pci-00c4
> Adapter: PCI adapter
> power1:       19.58 mW (avg =   2.55 mW, interval =   0.01 s)
>                        (crit =  15.00 W)
> 
> ...
> 
> The result is current average processor power consumption in 10
> millisecond. The unit of the result is uWatt.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Cc: Borislav Petkov <bp@alien8.de>
> ---
>  drivers/hwmon/fam15h_power.c | 119 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
> index de6f52b..003564b 100644
> --- a/drivers/hwmon/fam15h_power.c
> +++ b/drivers/hwmon/fam15h_power.c
> @@ -27,6 +27,8 @@
>  #include <linux/bitops.h>
>  #include <linux/cpu.h>
>  #include <linux/cpumask.h>
> +#include <linux/time.h>
> +#include <linux/sched.h>
>  #include <asm/processor.h>
>  #include <asm/msr.h>
>  
> @@ -48,6 +50,9 @@ MODULE_LICENSE("GPL");
>  #define FAM15H_NUM_GROUPS		2
>  #define MAX_CUS				8
>  
> +/* set maximum interval as 1 second */
> +#define MAX_INTERVAL			1000
> +
>  #define MSR_F15H_CU_PWR_ACCUMULATOR	0xc001007a
>  #define MSR_F15H_CU_MAX_PWR_ACCUMULATOR	0xc001007b
>  #define MSR_F15H_PTSC			0xc0010280
> @@ -68,6 +73,9 @@ struct fam15h_power_data {
>  	u64 cu_acc_power[MAX_CUS];
>  	/* performance timestamp counter */
>  	u64 cpu_sw_pwr_ptsc[MAX_CUS];
> +	/* online/offline status of current compute unit */
> +	int cu_on[MAX_CUS];
> +	unsigned long power_period;
>  };
>  
>  static ssize_t show_power(struct device *dev,
> @@ -149,6 +157,8 @@ static void do_read_registers_on_cu(void *_data)
>  
>  	rdmsrl_safe(MSR_F15H_CU_PWR_ACCUMULATOR, &data->cu_acc_power[cu]);
>  	rdmsrl_safe(MSR_F15H_PTSC, &data->cpu_sw_pwr_ptsc[cu]);
> +
> +	data->cu_on[cu] = 1;
>  }
>  
>  /*
> @@ -165,6 +175,8 @@ static int read_registers(struct fam15h_power_data *data)
>  	if (!ret)
>  		return -ENOMEM;
>  
> +	memset(data->cu_on, 0, sizeof(int) * MAX_CUS);
> +
>  	get_online_cpus();
>  	this_cpu = get_cpu();
>  
> @@ -192,18 +204,117 @@ static int read_registers(struct fam15h_power_data *data)
>  	return 0;
>  }
>  
> +static ssize_t acc_show_power(struct device *dev,
> +			      struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct fam15h_power_data *data = dev_get_drvdata(dev);
> +	u64 prev_cu_acc_power[MAX_CUS], prev_ptsc[MAX_CUS],
> +	    jdelta[MAX_CUS];
> +	u64 tdelta, avg_acc;
> +	int cu, cu_num, ret;
> +	signed long leftover;
> +
> +	/*
> +	 * With the new x86 topology modelling, x86_max_cores is the
> +	 * compute unit number.
> +	 */
> +	cu_num = boot_cpu_data.x86_max_cores;
> +
> +	ret = read_registers(data);
> +	if (ret)
> +		return 0;
> +
> +	for (cu = 0; cu < cu_num; cu++) {
> +		prev_cu_acc_power[cu] = data->cu_acc_power[cu];
> +		prev_ptsc[cu] = data->cpu_sw_pwr_ptsc[cu];
> +	}
> +
> +	leftover = schedule_timeout_interruptible(msecs_to_jiffies(data->power_period));
> +	if (leftover)
> +		return 0;
> +
> +	ret = read_registers(data);
> +	if (ret)
> +		return 0;
> +
> +	for (cu = 0, avg_acc = 0; cu < cu_num; cu++) {
> +		/* check if current compute unit is online */
> +		if (data->cu_on[cu] == 0)
> +			continue;
> +
> +		if (data->cu_acc_power[cu] < prev_cu_acc_power[cu]) {
> +			jdelta[cu] = data->max_cu_acc_power + data->cu_acc_power[cu];
> +			jdelta[cu] -= prev_cu_acc_power[cu];
> +		} else {
> +			jdelta[cu] = data->cu_acc_power[cu] - prev_cu_acc_power[cu];
> +		}
> +		tdelta = data->cpu_sw_pwr_ptsc[cu] - prev_ptsc[cu];
> +		jdelta[cu] *= data->cpu_pwr_sample_ratio * 1000;
> +		do_div(jdelta[cu], tdelta);
> +
> +		/* the unit is microWatt */
> +		avg_acc += jdelta[cu];
> +	}
> +
> +	return sprintf(buf, "%llu\n", (unsigned long long)avg_acc);
> +}
> +static DEVICE_ATTR(power1_average, S_IRUGO, acc_show_power, NULL);
> +
> +static ssize_t acc_show_power_period(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct fam15h_power_data *data = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%lu\n", data->power_period);
> +}
> +
> +static ssize_t acc_set_power_period(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct fam15h_power_data *data = dev_get_drvdata(dev);
> +	unsigned long temp;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &temp);
> +	if (ret)
> +		return ret;
> +
> +	if (temp > MAX_INTERVAL)
> +		return -EINVAL;
> +
> +	/* the interval value should be greater than 0 */
> +	if (temp <= 0)
> +		return -EINVAL;
> +
> +	data->power_period = temp;
> +
> +	return count;
> +}
> +static DEVICE_ATTR(power1_average_interval, S_IRUGO | S_IWUSR,
> +		   acc_show_power_period, acc_set_power_period);
> +
>  static int fam15h_power_init_attrs(struct pci_dev *pdev,
>  				   struct fam15h_power_data *data)
>  {
>  	int n = FAM15H_MIN_NUM_ATTRS;
>  	struct attribute **fam15h_power_attrs;
>  	struct cpuinfo_x86 *c = &boot_cpu_data;
> +	u32 cpuid;
>  
>  	if (c->x86 == 0x15 &&
>  	    (c->x86_model <= 0xf ||
>  	     (c->x86_model >= 0x60 && c->x86_model <= 0x7f)))
>  		n += 1;
>  
> +	cpuid = cpuid_edx(0x80000007);
> +
> +	/* check if processor supports accumulated power */
> +	if (cpuid & BIT(12))
> +		n += 2;

	if (boot_cpu_has(X86_FEATURE_ACC_POWER))

> +
>  	fam15h_power_attrs = devm_kcalloc(&pdev->dev, n,
>  					  sizeof(*fam15h_power_attrs),
>  					  GFP_KERNEL);
> @@ -218,6 +329,11 @@ static int fam15h_power_init_attrs(struct pci_dev *pdev,
>  	     (c->x86_model >= 0x60 && c->x86_model <= 0x7f)))
>  		fam15h_power_attrs[n++] = &dev_attr_power1_input.attr;
>  
> +	if (cpuid & BIT(12)) {

Ditto.

> +		fam15h_power_attrs[n++] = &dev_attr_power1_average.attr;
> +		fam15h_power_attrs[n++] = &dev_attr_power1_average_interval.attr;
> +	}
> +
>  	data->group.attrs = fam15h_power_attrs;
>  
>  	return 0;
> @@ -330,6 +446,9 @@ static int fam15h_power_init_data(struct pci_dev *f4,
>  
>  	data->max_cu_acc_power = tmp;
>  
> +	/* set default interval as 10 ms */

Because...?

> +	data->power_period = 10;
> +
>  	return read_registers(data);
>  }
>  
> -- 
> 1.9.1
> 
> 

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
