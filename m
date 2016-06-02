Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:42347 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148AbcFBHuI (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Jun 2016 03:50:08 -0400
Date: Thu, 2 Jun 2016 09:47:54 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
cc: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>,
	linux-hwmon@vger.kernel.org, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
In-Reply-To: <20160602072619.GB10803@pd.tnic>
Message-ID: <alpine.DEB.2.11.1606020946430.3629@nanos>
References: <1464775486-23446-1-git-send-email-bp@alien8.de> <574EE1B3.9010704@roeck-us.net> <20160601134126.GB22373@pd.tnic> <20160601181509.GB10954@roeck-us.net> <20160602072619.GB10803@pd.tnic>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 2 Jun 2016, Borislav Petkov wrote:
>  static int read_registers(struct fam15h_power_data *data)
>  {
> -	int this_cpu, ret, cpu;
>  	int core, this_core;
>  	cpumask_var_t mask;
> +	int ret, cpu;
>  
>  	ret = zalloc_cpumask_var(&mask, GFP_KERNEL);
>  	if (!ret)
> @@ -183,7 +183,6 @@ static int read_registers(struct fam15h_power_data *data)
>  	memset(data->cu_on, 0, sizeof(int) * MAX_CUS);
>  
>  	get_online_cpus();
> -	this_cpu = smp_processor_id();
>  
>  	/*
>  	 * Choose the first online core of each compute unit, and then
> @@ -205,10 +204,13 @@ static int read_registers(struct fam15h_power_data *data)
>  		cpumask_set_cpu(cpumask_any(topology_sibling_cpumask(cpu)), mask);
>  	}
>  
> -	if (cpumask_test_cpu(this_cpu, mask))
> +	preempt_disable();
> +	smp_call_function_many(mask, do_read_registers_on_cu, data, true);
> +
> +	if (cpumask_test_cpu(smp_processor_id(), mask))
>  		do_read_registers_on_cu(data);
>  
> -	smp_call_function_many(mask, do_read_registers_on_cu, data, true);
> +	preempt_enable();
>  	put_online_cpus();

What's wrong with using:

       on_each_cpu_mask()

Which does all that magic for you?

Thanks,

	tglx
