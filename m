Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:43406 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933965AbdJQPZx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Oct 2017 11:25:53 -0400
Date: Tue, 17 Oct 2017 08:25:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: shuwang@redhat.com
Cc: fenghua.yu@intel.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        chuhu@redhat.com, yizhan@redhat.com
Subject: Re: [PATCH] hwmon: (coretemp) remove duplicated coretemp for same
 core id
Message-ID: <20171017152550.GA14871@roeck-us.net>
References: <20171017084450.4365-1-shuwang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171017084450.4365-1-shuwang@redhat.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 17, 2017 at 04:44:50PM +0800, shuwang@redhat.com wrote:
> From: Shu Wang <shuwang@redhat.com>
> 
> Fix kernel warning on my 4cpus 2core_id system. The cpu0 and cpu1 have
> same core_id 0, so both cpu0 and cpu1 will try to create file temp2_label
> when it's online.
> 
What system/cpu is that ?

Normally I would assume that each CPU (package) instantiates
a separate instance of the driver.

> - coretemp_cpu_online(cpu=0)
>   - create_core_data(cpu=0, attr_no=2)
>    - create_core_attrs(attr_no=2)
> - coretemp_cpu_online(cpu=1)
>   - create_core_data(cpu=1, attr_no=2)
>    - create_core_attrs(attr_no=2)
> 
> $ grep -e processor -e 'core id' /proc/cpuinfo
> processor       : 0
> core id         : 0
> processor       : 1
> core id         : 0
> processor       : 2
> core id         : 1
> processor       : 3
> core id         : 1

Complete output of /proc/cpuinfo might be helpful.

> 
> dmesg:
> sysfs: cannot create duplicate filename '/devices/platform/coretemp.0/hwmon/hwmon3/temp2_label'
> sysfs: cannot create duplicate filename '/devices/platform/coretemp.0/hwmon/hwmon3/temp3_label'
> WARNING: CPU: 3 PID: 27 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x58/0x70
> Call Trace:
>  sysfs_add_file_mode_ns+0x170/0x180
>  internal_create_group+0xe3/0x2c0
>  sysfs_create_group+0x13/0x20
>  create_core_data+0x3ab/0x5e0 [coretemp]
>  coretemp_cpu_online+0x14b/0x1f7 [coretemp]
>  ? create_core_data+0x5e0/0x5e0 [coretemp]
>  cpuhp_invoke_callback+0xae/0x5c0
>  ? __schedule+0x295/0x880
>  cpuhp_thread_fun+0xcb/0x170
>  smpboot_thread_fn+0x110/0x160
> 
> Signed-off-by: Shu Wang <shuwang@redhat.com>
> ---
>  drivers/hwmon/coretemp.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index c13a4fd86b3c..2fb29ab1080b 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -459,6 +459,17 @@ static struct temp_data *init_temp_data(unsigned int cpu, int pkg_flag)
>  	return tdata;
>  }
>  
> +static void coretemp_remove_core(struct platform_data *pdata, int indx)
> +{
> +	struct temp_data *tdata = pdata->core_data[indx];
> +
> +	/* Remove the sysfs attributes */
> +	sysfs_remove_group(&pdata->hwmon_dev->kobj, &tdata->attr_group);
> +
> +	kfree(pdata->core_data[indx]);
> +	pdata->core_data[indx] = NULL;
> +}
> +
>  static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  			    int pkg_flag)
>  {
> @@ -479,6 +490,10 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  	if (attr_no > MAX_CORE_DATA - 1)
>  		return -ERANGE;
>  
> +	tdata = pdata->core_data[attr_no];
> +	if (tdata != NULL)
> +		coretemp_remove_core(pdata, attr_no);
> +

That looks more like a hack than a fix. Presumably the other cpu/core
is still online ?

>  	tdata = init_temp_data(cpu, pkg_flag);
>  	if (!tdata)
>  		return -ENOMEM;
> @@ -527,17 +542,6 @@ coretemp_add_core(struct platform_device *pdev, unsigned int cpu, int pkg_flag)
>  		dev_err(&pdev->dev, "Adding Core %u failed\n", cpu);
>  }
>  
> -static void coretemp_remove_core(struct platform_data *pdata, int indx)
> -{
> -	struct temp_data *tdata = pdata->core_data[indx];
> -
> -	/* Remove the sysfs attributes */
> -	sysfs_remove_group(&pdata->hwmon_dev->kobj, &tdata->attr_group);
> -
> -	kfree(pdata->core_data[indx]);
> -	pdata->core_data[indx] = NULL;
> -}
> -
>  static int coretemp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -- 
> 2.13.5
> 
