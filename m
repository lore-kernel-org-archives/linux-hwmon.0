Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:59989 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751711AbdJSIDi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Oct 2017 04:03:38 -0400
Date: Thu, 19 Oct 2017 10:02:50 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
cc: Shu Wang <shuwang@redhat.com>, fenghua yu <fenghua.yu@intel.com>,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com
Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same
 core id
In-Reply-To: <20d0960f-e77a-8ee7-0205-707de46d034d@roeck-us.net>
Message-ID: <alpine.DEB.2.20.1710190953070.1971@nanos>
References: <20171017084450.4365-1-shuwang@redhat.com> <20171017152550.GA14871@roeck-us.net> <2144493088.17257615.1508296874903.JavaMail.zimbra@redhat.com> <602729d0-9a01-7e88-3062-cb9d8b0c45a4@roeck-us.net> <1715470689.17543079.1508380102988.JavaMail.zimbra@redhat.com>
 <20d0960f-e77a-8ee7-0205-707de46d034d@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 18 Oct 2017, Guenter Roeck wrote:
> On 10/18/2017 07:28 PM, Shu Wang wrote:

> > > > > > Fix kernel warning on my 4cpus 2core_id system. The cpu0 and cpu1
> > > > > > have same core_id 0, so both cpu0 and cpu1 will try to create file
> > > > > > temp2_label when it's online.
> > > > > > 
> > > > > 
> > > > > > - coretemp_cpu_online(cpu=0)
> > > > > >     - create_core_data(cpu=0, attr_no=2)
> > > > > >      - create_core_attrs(attr_no=2)
> > > > > > - coretemp_cpu_online(cpu=1)
> > > > > >     - create_core_data(cpu=1, attr_no=2)
> > > > > >      - create_core_attrs(attr_no=2)
> > > > > > 
> > > > > > $ grep -e processor -e 'core id' /proc/cpuinfo
> > > > > > processor       : 0
> > > > > > core id         : 0
> > > > > > processor       : 1
> > > > > > core id         : 0
> > > > > > processor       : 2
> > > > > > core id         : 1
> > > > > > processor       : 3
> > > > > > core id         : 1
> > > > > 
> > > > > Complete output of /proc/cpuinfo might be helpful.
> > > > 
> > > > $ cat /proc/cpuinfo
> > > > processor	: 0
> > > > vendor_id	: GenuineIntel
> > > > cpu family	: 6
> > > > model		: 61
> > > > model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
> > > 
> > > This is a hyperthreading CPU, which should already be handled,
> > 
> > Do you mean that for my system, coretemp_cpu_online should only
> > be called twice instead of four times to create two core attrs?
> > 
> 
> coretemp_add_core() should only be called twice, and cpumask_intersects()
> should filter out the duplicate ones.
> 
>         /*
>          * Check whether a thread sibling is already online. If not add the
>          * interface for this CPU core.
>          */
>         if (!cpumask_intersects(&pdata->cpumask,
> topology_sibling_cpumask(cpu)))
>                 coretemp_add_core(pdev, cpu, 0);
> 
> Thomas, is it possible that something is wrong with this code ?

Hrmm. Not that I can see. The only thing I can think of is that the logical
package association of the CPUs is screwed.

Debug patch below.

Thanks,

	tglx

8<------------
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -611,6 +611,9 @@ static int coretemp_cpu_online(unsigned
 	if (cpuhp_tasks_frozen)
 		return 0;
 
+	pr_info("CPU %u %u pkgid %d\n", cpu, smp_processor_id(),
+		topology_logical_package_id(cpu));
+
 	/*
 	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
 	 * sensors. We check this bit only, all the early CPUs


