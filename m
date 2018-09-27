Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41491 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbeI1FMk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Sep 2018 01:12:40 -0400
Date: Thu, 27 Sep 2018 15:52:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, afd@ti.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina3221: Add enable sysfs nodes
Message-ID: <20180927225200.GE9198@roeck-us.net>
References: <20180926064245.4091-1-nicoleotsuka@gmail.com>
 <20180926064245.4091-3-nicoleotsuka@gmail.com>
 <0cfe55e1-10d8-ac1f-8b6e-73777074a219@roeck-us.net>
 <20180927222614.GA8430@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927222614.GA8430@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Sep 27, 2018 at 03:26:14PM -0700, Nicolin Chen wrote:
> On Wed, Sep 26, 2018 at 06:06:32AM -0700, Guenter Roeck wrote:
> > > +static inline bool ina3221_is_enable(struct ina3221_data *ina, int channel)
> > 
> > s/is_enable/is_enabled/, maybe ?
> 
> Fixing.
> 
> > > +	return (config & INA3221_CONFIG_CHx_EN(channel)) > 0;
> > 
> > The "> 0" is unnecessary. Conversion to bool is automatic. If you want to make
> > it explicit, please use
> > 
> > 	return !!(config & INA3221_CONFIG_CHx_EN(channel));
> 
> Removing "> 0".
> 
> > It should not be necessary to re-read the value from the chip all the time.
> > I would suggest to cache the value in the 'disabled' variable.
> 
> Regarding this part, I added a cache before sending this one. But
> I realized if the chip got powered off and rebooted during system
> suspend/resume, the cache would not reflect the actual status. As
> I mentioned earlier, this was enlightened by your comments about
> the BIOS. So I feel it'd be safer to read the register every time
> at this point, until I add the suspend/resume feature by syncing
> with regcache. What do you think about it?
> 

The proper fix for this problem would be to add support for suspend /
resume to the driver. At resume time, all channels will have been
re-enabled if the chip was powered off, even if they were explicitly
disabled by devicetree (or via explicit configuration). This means
the driver just behaves badly across suspend/resume, period.
Displaying a raw value instead of a cached one doesn't solve that
problem. By using a cached value, at least the user would not notice
that the chip no longer does what it is supposed to be doing.

I guess we just have different priorities. If I think suspend/resume
is a problem for my use case, I would just go ahead and fix it.
I would not try to write code that doesn't fix the problem causing it,
much less argue for it.

Having said that, I didn't mention that part in my other reply,
meaning I'll accept the code as is.

Thanks,
Guenter
