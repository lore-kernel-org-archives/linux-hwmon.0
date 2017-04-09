Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44807 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752188AbdDIPYK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Apr 2017 11:24:10 -0400
Date: Sun, 9 Apr 2017 08:24:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170409152407.GB23984@roeck-us.net>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
 <20170312132544.GA17687@roeck-us.net>
 <20170312141522.GL21222@n2100.armlinux.org.uk>
 <20170312142634.GA1917@roeck-us.net>
 <20170321134430.GA3177@roeck-us.net>
 <20170321140812.GZ21222@n2100.armlinux.org.uk>
 <20170321170503.GC13789@roeck-us.net>
 <20170409153806.6dac6bbd@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170409153806.6dac6bbd@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Apr 09, 2017 at 03:38:06PM +0200, Jean Delvare wrote:
> Hi Guenter,
> 
> On Tue, 21 Mar 2017 10:05:03 -0700, Guenter Roeck wrote:
> > I'll submit the patch as-is upstream; at least it doesn't break anything.
> > If it doesn't fix your problem, we'll have to look at it again at a later
> > point.
> 
> Given that this patch fixes a regression in kernels v4.7 to v.4.10,
> shouldn't it go to stable@?
> 
The patch has a Fixes: tag, so that should happen automatically. 
I'll have to check if it applies cleanly to earlier kernels and if
necessary send backport(s) to Greg.

> As a side note, I think the second half of the patch is redundant, it
> only makes registration slightly faster on IT8705F, and could have bad
> side effects at least in theory. The first half seems sufficient to
> me...
> 
It only affects systems with two Super-IO chips, and I wanted to play safe. The
worst side effect I can imagine would be that a second chip in a system with
IT8705 as first chip would not be accepted, which is not worse than before
when only one chip was supported.

Thanks,
Guenter
