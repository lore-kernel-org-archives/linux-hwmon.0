Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Wed, 26 Sep 2018 12:49:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: ina3221: Add power sysfs nodes
Message-ID: <20180926194904.GA10595@Asurada-Nvidia.nvidia.com>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-2-nicoleotsuka@gmail.com>
 <dbf77a33-ae5c-1ac7-c94f-fa5505074adb@roeck-us.net>
 <20180926182006.GB6329@Asurada-Nvidia.nvidia.com>
 <20180926194534.GB18731@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926194534.GB18731@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter,

On Wed, Sep 26, 2018 at 12:45:34PM -0700, Guenter Roeck wrote:
> Hi Nicolin,
> 
> On Wed, Sep 26, 2018 at 11:20:06AM -0700, Nicolin Chen wrote:
> > On Wed, Sep 26, 2018 at 05:34:53AM -0700, Guenter Roeck wrote:
> > > Hi Nicolin,
> > > 
> > > On 09/25/2018 11:42 PM, Nicolin Chen wrote:
> > > > The hwmon sysfs ABI supports powerX_input and powerX_crit. This
> > > > can ease user space programs who care more about power in total
> > > > than voltage or current individually.
> > > > 
> > > > So this patch adds these two sysfs nodes for INA3221 driver.
> > 
> > > Ah, sorry, we can't do that. The sysfs nodes are for chips providing power
> > > registers, not for kernel drivers to provide calculations based on voltage
> > > and current measurements.
> > 
> > Hmm..I saw ina2xx.c and ltc4215.c are doing similar calculations...
> > 
> 
> ina2xx.c doesn't; the chips supported by the driver do have a register
> reporting the power (0x03). ltc4215.c was not reviewed by a hwmon
> maintainer. I think I mentioned before that you can find anything you want
> in the Linux kernel. That doesn't make it right.

OK. In that case, I am dropping this change.

Thanks
Nicolin
