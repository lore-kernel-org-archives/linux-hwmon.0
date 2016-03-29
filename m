Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40733 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755960AbcC2HcC (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 29 Mar 2016 03:32:02 -0400
Date: Tue, 29 Mar 2016 09:31:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Huang Rui <ray.huang@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, spg_linux_kernel@amd.com
Subject: Re: [PATCH v5 2/6] hwmon: (fam15h_power) Add compute unit
 accumulated power
Message-ID: <20160329073158.GC3408@twins.programming.kicks-ass.net>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
 <1459143136-2412-3-git-send-email-ray.huang@amd.com>
 <20160328092952.GB26651@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160328092952.GB26651@pd.tnic>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Mar 28, 2016 at 11:29:52AM +0200, Borislav Petkov wrote:
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

This will not in fact work for Intel, nor if I manage to one day
randomize our CPU numbers on AMD.
