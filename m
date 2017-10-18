Return-Path: <shuwang@redhat.com>
Return-path: <shuwang@redhat.com>
Date: Tue, 17 Oct 2017 23:21:14 -0400 (EDT)
From: Shu Wang <shuwang@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: fenghua yu <fenghua.yu@intel.com>, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuhu@redhat.com, yizhan@redhat.com
Message-ID: <2144493088.17257615.1508296874903.JavaMail.zimbra@redhat.com>
In-Reply-To: <20171017152550.GA14871@roeck-us.net>
References: <20171017084450.4365-1-shuwang@redhat.com> <20171017152550.GA14871@roeck-us.net>
Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same
 core id
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

> From: "Guenter Roeck" <linux@roeck-us.net>
> To: shuwang@redhat.com
> Cc: "fenghua yu" <fenghua.yu@intel.com>, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
> linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com
> Sent: Tuesday, October 17, 2017 11:25:50 PM
> Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same core id
> 
> On Tue, Oct 17, 2017 at 04:44:50PM +0800, shuwang@redhat.com wrote:
> > From: Shu Wang <shuwang@redhat.com>
> > 
> > Fix kernel warning on my 4cpus 2core_id system. The cpu0 and cpu1 have
> > same core_id 0, so both cpu0 and cpu1 will try to create file temp2_label
> > when it's online.
> > 
> What system/cpu is that ?
> 
> Normally I would assume that each CPU (package) instantiates
> a separate instance of the driver.

The system is ThinkPad X1 Carbon 3rd laptop, model 20BTS1N70F.

> 
> > - coretemp_cpu_online(cpu=0)
> >   - create_core_data(cpu=0, attr_no=2)
> >    - create_core_attrs(attr_no=2)
> > - coretemp_cpu_online(cpu=1)
> >   - create_core_data(cpu=1, attr_no=2)
> >    - create_core_attrs(attr_no=2)
> > 
> > $ grep -e processor -e 'core id' /proc/cpuinfo
> > processor       : 0
> > core id         : 0
> > processor       : 1
> > core id         : 0
> > processor       : 2
> > core id         : 1
> > processor       : 3
> > core id         : 1
> 
> Complete output of /proc/cpuinfo might be helpful.

$ cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 61
model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
stepping	: 4
microcode	: 0x25
cpu MHz		: 2593.949
cache size	: 4096 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 20
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt dtherm ida arat pln pts
bugs		:
bogomips	: 5187.89
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 61
model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
stepping	: 4
microcode	: 0x25
cpu MHz		: 2593.949
cache size	: 4096 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 20
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt dtherm ida arat pln pts
bugs		:
bogomips	: 5209.02
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 61
model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
stepping	: 4
microcode	: 0x25
cpu MHz		: 2593.949
cache size	: 4096 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 4
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 20
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt dtherm ida arat pln pts
bugs		:
bogomips	: 5201.77
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 61
model name	: Intel(R) Core(TM) i7-5600U CPU @ 2.60GHz
stepping	: 4
microcode	: 0x25
cpu MHz		: 2593.949
cache size	: 4096 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 4
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 20
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt dtherm ida arat pln pts
bugs		:
bogomips	: 5202.42
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

> 
> > 
> > dmesg:
> > sysfs: cannot create duplicate filename
> > '/devices/platform/coretemp.0/hwmon/hwmon3/temp2_label'
> > sysfs: cannot create duplicate filename
> > '/devices/platform/coretemp.0/hwmon/hwmon3/temp3_label'
> > WARNING: CPU: 3 PID: 27 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x58/0x70
> > Call Trace:
> >  sysfs_add_file_mode_ns+0x170/0x180
> >  internal_create_group+0xe3/0x2c0
> >  sysfs_create_group+0x13/0x20
> >  create_core_data+0x3ab/0x5e0 [coretemp]
> >  coretemp_cpu_online+0x14b/0x1f7 [coretemp]
> >  ? create_core_data+0x5e0/0x5e0 [coretemp]
> >  cpuhp_invoke_callback+0xae/0x5c0
> >  ? __schedule+0x295/0x880
> >  cpuhp_thread_fun+0xcb/0x170
> >  smpboot_thread_fn+0x110/0x160
> > 
> > Signed-off-by: Shu Wang <shuwang@redhat.com>
> > ---
> >  drivers/hwmon/coretemp.c | 26 +++++++++++++++-----------
> >  1 file changed, 15 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> > index c13a4fd86b3c..2fb29ab1080b 100644
> > --- a/drivers/hwmon/coretemp.c
> > +++ b/drivers/hwmon/coretemp.c
> > @@ -459,6 +459,17 @@ static struct temp_data *init_temp_data(unsigned int
> > cpu, int pkg_flag)
> >  	return tdata;
> >  }
> >  
> > +static void coretemp_remove_core(struct platform_data *pdata, int indx)
> > +{
> > +	struct temp_data *tdata = pdata->core_data[indx];
> > +
> > +	/* Remove the sysfs attributes */
> > +	sysfs_remove_group(&pdata->hwmon_dev->kobj, &tdata->attr_group);
> > +
> > +	kfree(pdata->core_data[indx]);
> > +	pdata->core_data[indx] = NULL;
> > +}
> > +
> >  static int create_core_data(struct platform_device *pdev, unsigned int
> >  cpu,
> >  			    int pkg_flag)
> >  {
> > @@ -479,6 +490,10 @@ static int create_core_data(struct platform_device
> > *pdev, unsigned int cpu,
> >  	if (attr_no > MAX_CORE_DATA - 1)
> >  		return -ERANGE;
> >  
> > +	tdata = pdata->core_data[attr_no];
> > +	if (tdata != NULL)
> > +		coretemp_remove_core(pdata, attr_no);
> > +
> 
> That looks more like a hack than a fix. Presumably the other cpu/core
> is still online ?
> 
> >  	tdata = init_temp_data(cpu, pkg_flag);
> >  	if (!tdata)
> >  		return -ENOMEM;
> > @@ -527,17 +542,6 @@ coretemp_add_core(struct platform_device *pdev,
> > unsigned int cpu, int pkg_flag)
> >  		dev_err(&pdev->dev, "Adding Core %u failed\n", cpu);
> >  }
> >  
> > -static void coretemp_remove_core(struct platform_data *pdata, int indx)
> > -{
> > -	struct temp_data *tdata = pdata->core_data[indx];
> > -
> > -	/* Remove the sysfs attributes */
> > -	sysfs_remove_group(&pdata->hwmon_dev->kobj, &tdata->attr_group);
> > -
> > -	kfree(pdata->core_data[indx]);
> > -	pdata->core_data[indx] = NULL;
> > -}
> > -
> >  static int coretemp_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > --
> > 2.13.5
> > 
> 
