Return-Path: <shuwang@redhat.com>
Return-path: <shuwang@redhat.com>
Date: Thu, 19 Oct 2017 06:10:08 -0400 (EDT)
From: Shu Wang <shuwang@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>
Cc: fenghua yu <fenghua.yu@intel.com>, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuhu@redhat.com, yizhan@redhat.com
Message-ID: <1903571460.17610295.1508407808892.JavaMail.zimbra@redhat.com>
In-Reply-To: <alpine.DEB.2.20.1710190953070.1971@nanos>
References: <20171017084450.4365-1-shuwang@redhat.com> <20171017152550.GA14871@roeck-us.net> <2144493088.17257615.1508296874903.JavaMail.zimbra@redhat.com> <602729d0-9a01-7e88-3062-cb9d8b0c45a4@roeck-us.net> <1715470689.17543079.1508380102988.JavaMail.zimbra@redhat.com> <20d0960f-e77a-8ee7-0205-707de46d034d@roeck-us.net> <alpine.DEB.2.20.1710190953070.1971@nanos>
Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same
 core id
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

> From: "Thomas Gleixner" <tglx@linutronix.de>
> To: "Guenter Roeck" <linux@roeck-us.net>
> Cc: "Shu Wang" <shuwang@redhat.com>, "fenghua yu" <fenghua.yu@intel.com>, jdelvare@suse.com,
> linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com
> Sent: Thursday, October 19, 2017 4:02:50 PM
> Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same core id
> 
> On Wed, 18 Oct 2017, Guenter Roeck wrote:
> > On 10/18/2017 07:28 PM, Shu Wang wrote:
> 
> > > > > > > Fix kernel warning on my 4cpus 2core_id system. The cpu0 and cpu1
> > > > > > > have same core_id 0, so both cpu0 and cpu1 will try to create
> > > > > > > file
> > > > > > > temp2_label when it's online.
> > > > > > > 
> > > > > > 
> > > > > > > - coretemp_cpu_online(cpu=0)
> > > > > > >     - create_core_data(cpu=0, attr_no=2)
> > > > > > >      - create_core_attrs(attr_no=2)
> > > > > > > - coretemp_cpu_online(cpu=1)
> > > > > > >     - create_core_data(cpu=1, attr_no=2)
> > > > > > >      - create_core_attrs(attr_no=2)
> > > > > > > 
> > > > > > > $ grep -e processor -e 'core id' /proc/cpuinfo
> > > > > > > processor       : 0
> > > > > > > core id         : 0
> > > > > > > processor       : 1
> > > > > > > core id         : 0
> > > > > > > processor       : 2
> > > > > > > core id         : 1
> > > > > > > processor       : 3
> > > > > > > core id         : 1
> > > > > > 
> > > > > > Complete output of /proc/cpuinfo might be helpful.
> > > > > 
> > > > > $ cat /proc/cpuinfo
> > > > > processor	: 0
> > > > > vendor_id	: GenuineIntel
> > > > > cpu family	: 6
> > > > > model		: 61
> > > > > model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
> > > > 
> > > > This is a hyperthreading CPU, which should already be handled,
> > > 
> > > Do you mean that for my system, coretemp_cpu_online should only
> > > be called twice instead of four times to create two core attrs?
> > > 
> > 
> > coretemp_add_core() should only be called twice, and cpumask_intersects()
> > should filter out the duplicate ones.
> > 
> >         /*
> >          * Check whether a thread sibling is already online. If not add the
> >          * interface for this CPU core.
> >          */
> >         if (!cpumask_intersects(&pdata->cpumask,
> > topology_sibling_cpumask(cpu)))
> >                 coretemp_add_core(pdev, cpu, 0);
> > 
> > Thomas, is it possible that something is wrong with this code ?

Sorry, I got the root cause, not coretemp's problem. I enabled numa=fake=2
cmdline param to simulate 2 nodes on my systems. 2 threads of the a same core
happened to be on different node, so they are not siblings.
  
Thanks for you reply

> 
> Hrmm. Not that I can see. The only thing I can think of is that the logical
> package association of the CPUs is screwed.
> 
> Debug patch below.
> 
> Thanks,
