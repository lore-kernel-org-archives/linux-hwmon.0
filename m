Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44712 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbeJYJbq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Oct 2018 05:31:46 -0400
Date: Wed, 24 Oct 2018 18:01:17 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] hwmon: (core) Inherit power properties to hdev
Message-ID: <20181025010116.GA4543@Asurada-Nvidia.nvidia.com>
References: <20181024193402.16698-1-nicoleotsuka@gmail.com>
 <20181024193402.16698-2-nicoleotsuka@gmail.com>
 <20181025001301.Horde.VCevVrrSs6rOyXT41xiPOzW@cp2.active-venture.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181025001301.Horde.VCevVrrSs6rOyXT41xiPOzW@cp2.active-venture.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Oct 25, 2018 at 12:13:01AM +0000, linux@roeck-us.net wrote:

> > +	if (dev) {
> > +		hdev->driver = dev->driver;
> > +		hdev->power = dev->power;
> > +		hdev->pm_domain = dev->pm_domain;
> > +		hdev->of_node = dev->of_node;
> > +	}
> 
> We'l need to dig into this more; I suspect it may be inappropriate to do this.
> With this change, every hwmon driver supporting (runtime ?) suspend/resume
> will have the problem worked around in #5, and that just seems wrong.

Hmm..that's true...thanks for catching it.

Actually I am not sure the reason of having a child device in
the core, but could we use the parent dev pointer in the hwmon
core as hwmon_dev upon confirming parent dev pointer != NULL?

The problem here is that the power directory under each hwmon
directory is tied to the hwmon_dev pointer, not to the parent
dev pointer, and the hwmon core creates all sysfs nodes based
on the child node. So those nodes under power directory won't
be valid unless we copy all pm information, especially PM ops.

There is an option of ignoring this problem though, while all
hwmon drivers will need to be careful of mixing using the dev
pointers. So it'd be a lot of easier if we could just use the
original dev pointer in the core since we mainly just need to
create sysfs nodes.

Another way of doing this might be to pass down the PM pointer
via _info structure instead of linking it to the parent driver,
which then will forbid all hwmon drivers having its own PM ops
callbacks -- the very opposite way of this patch, and it does
not sound fully reasonable and feasible to me...

What do you think about?

Thanks
Nicolin
