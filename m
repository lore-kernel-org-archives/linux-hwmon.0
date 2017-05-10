Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53516 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbdEJUJV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 May 2017 16:09:21 -0400
Date: Wed, 10 May 2017 13:09:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tommi Rantala <tt.rantala@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Handle frozen hotplug state correctly
Message-ID: <20170510200917.GA5628@roeck-us.net>
References: <alpine.DEB.2.20.1705101624460.1979@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1705101624460.1979@nanos>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, May 10, 2017 at 04:30:12PM +0200, Thomas Gleixner wrote:
> The recent conversion to the hotplug state machine missed that the original
> hotplug notifiers did not execute in the frozen state, which is used on
> suspend on resume.
> 
> This does not matter on single socket machines, but on multi socket systems
> this breaks when the device for a non-boot socket is removed when the last
> CPU of that socket is brought offline. The device removal locks up the
> machine hard w/o any debug output.
> 
> Prevent executing the hotplug callbacks when cpuhp_tasks_frozen is true.
> 
> Thanks to Tommi for providing debug information patiently while I failed to
> spot the obvious.
> 
> Fixes: e00ca5df37ad ("hwmon: (coretemp) Convert to hotplug state machine")
> Reported-by: Tommi Rantala <tt.rantala@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Applied, and thanks a lot for fixing the problem!

Guenter

> ---
>  drivers/hwmon/coretemp.c |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -605,6 +605,13 @@ static int coretemp_cpu_online(unsigned
>  	struct platform_data *pdata;
>  
>  	/*
> +	 * Don't execute this on resume as the offline callback did
> +	 * not get executed on suspend.
> +	 */
> +	if (cpuhp_tasks_frozen)
> +		return 0;
> +
> +	/*
>  	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
>  	 * sensors. We check this bit only, all the early CPUs
>  	 * without thermal sensors will be filtered out.
> @@ -654,6 +661,13 @@ static int coretemp_cpu_offline(unsigned
>  	struct temp_data *tdata;
>  	int indx, target;
>  
> +	/*
> +	 * Don't execute this on suspend as the device remove locks
> +	 * up the machine.
> +	 */
> +	if (cpuhp_tasks_frozen)
> +		return 0;
> +
>  	/* If the physical CPU device does not exist, just return */
>  	if (!pdev)
>  		return 0;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
