Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Wed, 26 Sep 2018 11:20:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: ina3221: Add power sysfs nodes
Message-ID: <20180926182006.GB6329@Asurada-Nvidia.nvidia.com>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-2-nicoleotsuka@gmail.com>
 <dbf77a33-ae5c-1ac7-c94f-fa5505074adb@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbf77a33-ae5c-1ac7-c94f-fa5505074adb@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Sep 26, 2018 at 05:34:53AM -0700, Guenter Roeck wrote:
> Hi Nicolin,
> 
> On 09/25/2018 11:42 PM, Nicolin Chen wrote:
> > The hwmon sysfs ABI supports powerX_input and powerX_crit. This
> > can ease user space programs who care more about power in total
> > than voltage or current individually.
> > 
> > So this patch adds these two sysfs nodes for INA3221 driver.

> Ah, sorry, we can't do that. The sysfs nodes are for chips providing power
> registers, not for kernel drivers to provide calculations based on voltage
> and current measurements.

Hmm..I saw ina2xx.c and ltc4215.c are doing similar calculations...

> Basic guideline is that we report what is there, not some calculation based
> on it.

I could feel the back thoughts behind the guideline, but this does
give user space programs some trouble -- I have a few programs that
were used to read ina2xx driver which provides power nodes, but now
those programs will have to implement another function to read the
voltage and current separately to do further calculations.

Do you know any better solution for this situation?

> This is even more true for power limits: We can not assume that the power limit
> is (max voltage * max current). or (current voltage * max_current), or anything
> else. We simply don't have the knowledge to make that assumption.

I agree that power limit is a bit tricky here as the voltage could
change depending on the user space, Yes, I assumed that users who
set_power() should be aware of it (whether fixed or dynamical) so
as to decide to configure power limit or just current limit.

Thanks
Nicolin
