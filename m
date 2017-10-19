Return-Path: <shuwang@redhat.com>
Return-path: <shuwang@redhat.com>
Date: Wed, 18 Oct 2017 22:28:22 -0400 (EDT)
From: Shu Wang <shuwang@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: fenghua yu <fenghua.yu@intel.com>, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuhu@redhat.com, yizhan@redhat.com
Message-ID: <1715470689.17543079.1508380102988.JavaMail.zimbra@redhat.com>
In-Reply-To: <602729d0-9a01-7e88-3062-cb9d8b0c45a4@roeck-us.net>
References: <20171017084450.4365-1-shuwang@redhat.com> <20171017152550.GA14871@roeck-us.net> <2144493088.17257615.1508296874903.JavaMail.zimbra@redhat.com> <602729d0-9a01-7e88-3062-cb9d8b0c45a4@roeck-us.net>
Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same
 core id
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

> From: "Guenter Roeck" <linux@roeck-us.net>
> To: "Shu Wang" <shuwang@redhat.com>
> Cc: "fenghua yu" <fenghua.yu@intel.com>, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
> linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com
> Sent: Wednesday, October 18, 2017 9:14:39 PM
> Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same core id
> 
> On 10/17/2017 08:21 PM, Shu Wang wrote:
> >> From: "Guenter Roeck" <linux@roeck-us.net>
> >> To: shuwang@redhat.com
> >> Cc: "fenghua yu" <fenghua.yu@intel.com>, jdelvare@suse.com,
> >> linux-hwmon@vger.kernel.org,
> >> linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com
> >> Sent: Tuesday, October 17, 2017 11:25:50 PM
> >> Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same
> >> core id
> >>
> >> On Tue, Oct 17, 2017 at 04:44:50PM +0800, shuwang@redhat.com wrote:
> >>> From: Shu Wang <shuwang@redhat.com>
> >>>
> >>> Fix kernel warning on my 4cpus 2core_id system. The cpu0 and cpu1 have
> >>> same core_id 0, so both cpu0 and cpu1 will try to create file temp2_label
> >>> when it's online.
> >>>
> >> What system/cpu is that ?
> >>
> >> Normally I would assume that each CPU (package) instantiates
> >> a separate instance of the driver.
> > 
> > The system is ThinkPad X1 Carbon 3rd laptop, model 20BTS1N70F.
> > 
> >>
> >>> - coretemp_cpu_online(cpu=0)
> >>>    - create_core_data(cpu=0, attr_no=2)
> >>>     - create_core_attrs(attr_no=2)
> >>> - coretemp_cpu_online(cpu=1)
> >>>    - create_core_data(cpu=1, attr_no=2)
> >>>     - create_core_attrs(attr_no=2)
> >>>
> >>> $ grep -e processor -e 'core id' /proc/cpuinfo
> >>> processor       : 0
> >>> core id         : 0
> >>> processor       : 1
> >>> core id         : 0
> >>> processor       : 2
> >>> core id         : 1
> >>> processor       : 3
> >>> core id         : 1
> >>
> >> Complete output of /proc/cpuinfo might be helpful.
> > 
> > $ cat /proc/cpuinfo
> > processor	: 0
> > vendor_id	: GenuineIntel
> > cpu family	: 6
> > model		: 61
> > model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
> 
> This is a hyperthreading CPU, which should already be handled,

Do you mean that for my system, coretemp_cpu_online should only
be called twice instead of four times to create two core attrs?

> and the problem would affect pretty much everyone. I'll have
> to look into this more closely. Is this with the ToT kernel ?

What's a ToT kernel? The kernel I built was the latest
kernel-4.14.0_rc5+ from linus repo.

> 
> Guenter
> 
