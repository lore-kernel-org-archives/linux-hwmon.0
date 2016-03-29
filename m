Return-path: <Ray.Huang@amd.com>
Date: Tue, 29 Mar 2016 11:02:27 +0800
From: Huang Rui <ray.huang@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
	<tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare
	<jdelvare@suse.de>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <spg_linux_kernel@amd.com>
Subject: Re: [PATCH v5 2/6] hwmon: (fam15h_power) Add compute unit
 accumulated power
Message-ID: <20160329030225.GA18406@hr-amur2>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
 <1459143136-2412-3-git-send-email-ray.huang@amd.com>
 <20160328092952.GB26651@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20160328092952.GB26651@pd.tnic>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Mar 28, 2016 at 11:29:52AM +0200, Borislav Petkov wrote:
> On Mon, Mar 28, 2016 at 01:32:12PM +0800, Huang Rui wrote:
> > +
> > +	get_online_cpus();
> > +	this_cpu = get_cpu();
> 
> What now?
> 
> get_online_cpus() is enough.
> 

Will remove get_cpu().

> > +
> > +	/*
> > +	 * Choose the first online core of each compute unit, and then
> > +	 * read their MSR value of power and ptsc in a single IPI,
> > +	 * because the MSR value of CPU core represent the compute
> > +	 * unit's.
> > +	 */
> > +	for_each_online_cpu(cpu) {
> > +		target = cpumask_first(topology_sibling_cpumask(cpu));
> > +		if (!cpumask_test_cpu(target, mask))
> > +			cpumask_set_cpu(target, mask);
> > +	}
> 
> I think you want something like this: iterate over each core and put one
> of them into the mask.
> 
> 	core = -1;
> 
> 	for_each_online_cpu(cpu) {
> 		this_core = topology_core_id(cpu);
> 
> 		if (this_core == core)
> 			continue;
> 
> 		core = this_core;
> 
> 		/* get any CPU on this compute unit */
> 		cpumask_set_cpu(cpumask_any(topology_sibling_cpumask(cpu)), mask);
> 	}
> 

Yep, with new x86 topology for core on AMD, using this way should be
more clear.

Thanks,
Rui
