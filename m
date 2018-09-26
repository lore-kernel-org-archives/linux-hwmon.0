Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40349 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbeI0CAI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Sep 2018 22:00:08 -0400
Date: Wed, 26 Sep 2018 12:45:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: ina3221: Add power sysfs nodes
Message-ID: <20180926194534.GB18731@roeck-us.net>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-2-nicoleotsuka@gmail.com>
 <dbf77a33-ae5c-1ac7-c94f-fa5505074adb@roeck-us.net>
 <20180926182006.GB6329@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926182006.GB6329@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nicolin,

On Wed, Sep 26, 2018 at 11:20:06AM -0700, Nicolin Chen wrote:
> On Wed, Sep 26, 2018 at 05:34:53AM -0700, Guenter Roeck wrote:
> > Hi Nicolin,
> > 
> > On 09/25/2018 11:42 PM, Nicolin Chen wrote:
> > > The hwmon sysfs ABI supports powerX_input and powerX_crit. This
> > > can ease user space programs who care more about power in total
> > > than voltage or current individually.
> > > 
> > > So this patch adds these two sysfs nodes for INA3221 driver.
> 
> > Ah, sorry, we can't do that. The sysfs nodes are for chips providing power
> > registers, not for kernel drivers to provide calculations based on voltage
> > and current measurements.
> 
> Hmm..I saw ina2xx.c and ltc4215.c are doing similar calculations...
> 

ina2xx.c doesn't; the chips supported by the driver do have a register
reporting the power (0x03). ltc4215.c was not reviewed by a hwmon
maintainer. I think I mentioned before that you can find anything you want
in the Linux kernel. That doesn't make it right.

> > Basic guideline is that we report what is there, not some calculation based
> > on it.
> 
> I could feel the back thoughts behind the guideline, but this does
> give user space programs some trouble -- I have a few programs that
> were used to read ina2xx driver which provides power nodes, but now
> those programs will have to implement another function to read the
> voltage and current separately to do further calculations.
> 
> Do you know any better solution for this situation?
> 

Userspace simply must not assume that power attributes exist and calculate
it from voltage and current attributes if needed.

> > This is even more true for power limits: We can not assume that the power limit
> > is (max voltage * max current). or (current voltage * max_current), or anything
> > else. We simply don't have the knowledge to make that assumption.
> 
> I agree that power limit is a bit tricky here as the voltage could
> change depending on the user space, Yes, I assumed that users who
> set_power() should be aware of it (whether fixed or dynamical) so
> as to decide to configure power limit or just current limit.
> 

You just can not make any such assumptions, sorry. Limit attributes
absolutely must be reflected in hardware. 

Thanks,
Guenter
