Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36619 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbcKTWa7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2016 17:30:59 -0500
Date: Sun, 20 Nov 2016 14:30:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rt@linuxtronix.de,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [04/20] hwmon/coretemp: Convert to hotplug state machine
Message-ID: <20161120223044.GA6350@roeck-us.net>
References: <20161117183541.8588-5-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161117183541.8588-5-bigeasy@linutronix.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 17, 2016 at 07:35:25PM +0100, Sebastian Andrzej Siewior wrote:
> Install the callbacks via the state machine. Setup and teardown are handled
> by the hotplug core.
> 
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Install, modprobe, modprobe -r, modprobe,

[24078.179118] ------------[ cut here ]------------
[24078.179124] WARNING: CPU: 0 PID: 14 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x6e/0x80
[24078.179125] sysfs: cannot create duplicate filename
'/devices/platform/coretemp.0'

and many more of those.

I can not test the other hwmon drivers in this series, but I would assume
that they have the same problem.

Guenter

> ---
>  drivers/hwmon/coretemp.c | 74 +++++++++++++++---------------------------------
>  1 file changed, 23 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 6a27eb2fed17..390038884f9e 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -676,7 +676,7 @@ static bool is_any_core_online(struct platform_data *pdata)
>  	return false;
>  }
>  
> -static void get_core_online(unsigned int cpu)
> +static int coretemp_cpu_online(unsigned int cpu)
>  {
>  	struct cpuinfo_x86 *c = &cpu_data(cpu);
>  	struct platform_device *pdev = coretemp_get_pdev(cpu);
> @@ -688,12 +688,12 @@ static void get_core_online(unsigned int cpu)
>  	 * without thermal sensors will be filtered out.
>  	 */
>  	if (!cpu_has(c, X86_FEATURE_DTHERM))
> -		return;
> +		return 0;
>  
>  	if (!pdev) {
>  		/* Check the microcode version of the CPU */
>  		if (chk_ucode_version(cpu))
> -			return;
> +			return 0;
>  
>  		/*
>  		 * Alright, we have DTS support.
> @@ -703,7 +703,7 @@ static void get_core_online(unsigned int cpu)
>  		 */
>  		err = coretemp_device_add(cpu);
>  		if (err)
> -			return;
> +			return 0;
>  		/*
>  		 * Check whether pkgtemp support is available.
>  		 * If so, add interfaces for pkgtemp.
> @@ -716,9 +716,10 @@ static void get_core_online(unsigned int cpu)
>  	 * So, just add interfaces for this core.
>  	 */
>  	coretemp_add_core(cpu, 0);
> +	return 0;
>  }
>  
> -static void put_core_offline(unsigned int cpu)
> +static int coretemp_cpu_offline(unsigned int cpu)
>  {
>  	int i, indx;
>  	struct platform_data *pdata;
> @@ -726,7 +727,7 @@ static void put_core_offline(unsigned int cpu)
>  
>  	/* If the physical CPU device does not exist, just return */
>  	if (!pdev)
> -		return;
> +		return 0;
>  
>  	pdata = platform_get_drvdata(pdev);
>  
> @@ -734,7 +735,7 @@ static void put_core_offline(unsigned int cpu)
>  
>  	/* The core id is too big, just return */
>  	if (indx > MAX_CORE_DATA - 1)
> -		return;
> +		return 0;
>  
>  	if (pdata->core_data[indx] && pdata->core_data[indx]->cpu == cpu)
>  		coretemp_remove_core(pdata, indx);
> @@ -747,7 +748,7 @@ static void put_core_offline(unsigned int cpu)
>  	 */
>  	for_each_sibling(i, cpu) {
>  		if (i != cpu) {
> -			get_core_online(i);
> +			coretemp_cpu_online(i);
>  			/*
>  			 * Display temperature sensor data for one HT sibling
>  			 * per core only, so abort the loop after one such
> @@ -764,38 +765,20 @@ static void put_core_offline(unsigned int cpu)
>  	 */
>  	if (!is_any_core_online(pdata))
>  		coretemp_device_remove(cpu);
> +	return 0;
>  }
>  
> -static int coretemp_cpu_callback(struct notifier_block *nfb,
> -				 unsigned long action, void *hcpu)
> -{
> -	unsigned int cpu = (unsigned long) hcpu;
> -
> -	switch (action) {
> -	case CPU_ONLINE:
> -	case CPU_DOWN_FAILED:
> -		get_core_online(cpu);
> -		break;
> -	case CPU_DOWN_PREPARE:
> -		put_core_offline(cpu);
> -		break;
> -	}
> -	return NOTIFY_OK;
> -}
> -
> -static struct notifier_block coretemp_cpu_notifier __refdata = {
> -	.notifier_call = coretemp_cpu_callback,
> -};
> -
>  static const struct x86_cpu_id __initconst coretemp_ids[] = {
>  	{ X86_VENDOR_INTEL, X86_FAMILY_ANY, X86_MODEL_ANY, X86_FEATURE_DTHERM },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, coretemp_ids);
>  
> +static enum cpuhp_state coretemp_hp_online;
> +
>  static int __init coretemp_init(void)
>  {
> -	int i, err;
> +	int err;
>  
>  	/*
>  	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
> @@ -809,44 +792,33 @@ static int __init coretemp_init(void)
>  	if (err)
>  		goto exit;
>  
> -	cpu_notifier_register_begin();
> -	for_each_online_cpu(i)
> -		get_core_online(i);
> +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hwmon/coretemp:online",
> +				coretemp_cpu_online, coretemp_cpu_offline);
> +	if (err < 0)
> +		goto exit_driver_unreg;
> +	coretemp_hp_online = err;
>  
>  #ifndef CONFIG_HOTPLUG_CPU
>  	if (list_empty(&pdev_list)) {
> -		cpu_notifier_register_done();
>  		err = -ENODEV;
> -		goto exit_driver_unreg;
> +		goto exit_hp_unreg;
>  	}
>  #endif
> -
> -	__register_hotcpu_notifier(&coretemp_cpu_notifier);
> -	cpu_notifier_register_done();
>  	return 0;
>  
>  #ifndef CONFIG_HOTPLUG_CPU
> +exit_hp_unreg:
> +	cpuhp_remove_state(coretemp_hp_online);
> +#endif
>  exit_driver_unreg:
>  	platform_driver_unregister(&coretemp_driver);
> -#endif
>  exit:
>  	return err;
>  }
>  
>  static void __exit coretemp_exit(void)
>  {
> -	struct pdev_entry *p, *n;
> -
> -	cpu_notifier_register_begin();
> -	__unregister_hotcpu_notifier(&coretemp_cpu_notifier);
> -	mutex_lock(&pdev_list_mutex);
> -	list_for_each_entry_safe(p, n, &pdev_list, list) {
> -		platform_device_unregister(p->pdev);
> -		list_del(&p->list);
> -		kfree(p);
> -	}
> -	mutex_unlock(&pdev_list_mutex);
> -	cpu_notifier_register_done();
> +	cpuhp_remove_state(coretemp_hp_online);
>  	platform_driver_unregister(&coretemp_driver);
>  }
>  
