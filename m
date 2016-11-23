Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44311 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938728AbcKWP34 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2016 10:29:56 -0500
Subject: Re: [PATCH 06/20] hwmon/via-cputemp: Convert to hotplug state machine
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org
References: <20161117183541.8588-1-bigeasy@linutronix.de>
 <20161117183541.8588-7-bigeasy@linutronix.de>
Cc: rt@linuxtronix.de, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <24e0d47a-ee49-1f0d-ca2a-4158d2480a80@roeck-us.net>
Date: Wed, 23 Nov 2016 07:29:45 -0800
MIME-Version: 1.0
In-Reply-To: <20161117183541.8588-7-bigeasy@linutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/17/2016 10:35 AM, Sebastian Andrzej Siewior wrote:
> Install the callbacks via the state machine and let the core invoke the
> callbacks on the already online CPUs. When the hotplug state is
> unregistered the cleanup function is called for each cpu. So both cpu loops
> in init() and exit() are not longer required.
>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

I would like to apply this patch, but I can not test it, and I want to make sure
it survives multiple removal/insertion sequences. Can someone give me a Tested-by: ?

Thanks,
Guenter

> ---
>  drivers/hwmon/via-cputemp.c | 61 ++++++++++++---------------------------------
>  1 file changed, 16 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/hwmon/via-cputemp.c b/drivers/hwmon/via-cputemp.c
> index 5b9866b1b437..ee5377ecd7a9 100644
> --- a/drivers/hwmon/via-cputemp.c
> +++ b/drivers/hwmon/via-cputemp.c
> @@ -220,7 +220,7 @@ struct pdev_entry {
>  static LIST_HEAD(pdev_list);
>  static DEFINE_MUTEX(pdev_list_mutex);
>
> -static int via_cputemp_device_add(unsigned int cpu)
> +static int via_cputemp_online(unsigned int cpu)
>  {
>  	int err;
>  	struct platform_device *pdev;
> @@ -261,7 +261,7 @@ static int via_cputemp_device_add(unsigned int cpu)
>  	return err;
>  }
>
> -static void via_cputemp_device_remove(unsigned int cpu)
> +static int via_cputemp_down_prep(unsigned int cpu)
>  {
>  	struct pdev_entry *p;
>
> @@ -272,33 +272,13 @@ static void via_cputemp_device_remove(unsigned int cpu)
>  			list_del(&p->list);
>  			mutex_unlock(&pdev_list_mutex);
>  			kfree(p);
> -			return;
> +			return 0;
>  		}
>  	}
>  	mutex_unlock(&pdev_list_mutex);
> +	return 0;
>  }
>
> -static int via_cputemp_cpu_callback(struct notifier_block *nfb,
> -				    unsigned long action, void *hcpu)
> -{
> -	unsigned int cpu = (unsigned long) hcpu;
> -
> -	switch (action) {
> -	case CPU_ONLINE:
> -	case CPU_DOWN_FAILED:
> -		via_cputemp_device_add(cpu);
> -		break;
> -	case CPU_DOWN_PREPARE:
> -		via_cputemp_device_remove(cpu);
> -		break;
> -	}
> -	return NOTIFY_OK;
> -}
> -
> -static struct notifier_block via_cputemp_cpu_notifier __refdata = {
> -	.notifier_call = via_cputemp_cpu_callback,
> -};
> -
>  static const struct x86_cpu_id __initconst cputemp_ids[] = {
>  	{ X86_VENDOR_CENTAUR, 6, 0xa, }, /* C7 A */
>  	{ X86_VENDOR_CENTAUR, 6, 0xd, }, /* C7 D */
> @@ -307,6 +287,8 @@ static const struct x86_cpu_id __initconst cputemp_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cputemp_ids);
>
> +static enum cpuhp_state via_temp_online;
> +
>  static int __init via_cputemp_init(void)
>  {
>  	int i, err;
> @@ -318,44 +300,33 @@ static int __init via_cputemp_init(void)
>  	if (err)
>  		goto exit;
>
> -	cpu_notifier_register_begin();
> -	for_each_online_cpu(i)
> -		via_cputemp_device_add(i);
> +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hwmon/via:online",
> +				via_cputemp_online, via_cputemp_down_prep);
> +	if (err < 0)
> +		goto exit_driver_unreg;
> +	via_temp_online = err;
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
> -	__register_hotcpu_notifier(&via_cputemp_cpu_notifier);
> -	cpu_notifier_register_done();
>  	return 0;
>
>  #ifndef CONFIG_HOTPLUG_CPU
> +exit_hp_unreg:
> +	cpuhp_remove_state_nocalls(via_temp_online);
> +#endif
>  exit_driver_unreg:
>  	platform_driver_unregister(&via_cputemp_driver);
> -#endif
>  exit:
>  	return err;
>  }
>
>  static void __exit via_cputemp_exit(void)
>  {
> -	struct pdev_entry *p, *n;
> -
> -	cpu_notifier_register_begin();
> -	__unregister_hotcpu_notifier(&via_cputemp_cpu_notifier);
> -	mutex_lock(&pdev_list_mutex);
> -	list_for_each_entry_safe(p, n, &pdev_list, list) {
> -		platform_device_unregister(p->pdev);
> -		list_del(&p->list);
> -		kfree(p);
> -	}
> -	mutex_unlock(&pdev_list_mutex);
> -	cpu_notifier_register_done();
> +	cpuhp_remove_state(via_temp_online);
>  	platform_driver_unregister(&via_cputemp_driver);
>  }
>
>

