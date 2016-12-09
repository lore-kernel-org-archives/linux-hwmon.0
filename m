Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36662 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750747AbcLISRj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Dec 2016 13:17:39 -0500
Date: Fri, 9 Dec 2016 10:17:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, rt@linuxtronix.de,
        Sebastian Andrzej Siewior <bigeasy@breakpoint.cc>,
        rt@linutronix.de
Subject: Re: [PATCH 06/20] hwmon/via-cputemp: Convert to hotplug state machine
Message-ID: <20161209181737.GB24142@roeck-us.net>
References: <20161117183541.8588-1-bigeasy@linutronix.de>
 <20161117183541.8588-7-bigeasy@linutronix.de>
 <alpine.DEB.2.20.1612091238360.3794@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1612091238360.3794@nanos>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 09, 2016 at 12:53:30PM +0100, Thomas Gleixner wrote:
> Guenter,
> 
> On Thu, 17 Nov 2016, Sebastian Andrzej Siewior wrote:
> 
> > Install the callbacks via the state machine and let the core invoke the
> > callbacks on the already online CPUs. When the hotplug state is
> > unregistered the cleanup function is called for each cpu. So both cpu loops
> > in init() and exit() are not longer required.
> 
> Can we please get those two VIA patches merged for 4.10? They are blocking
> the final removal of the CPU hotplug notifier crap.
> 
> The first one which removes that loop is really harmless as there are no
> multisocket VIAs. Heterogenous cores in a single die would be surprising
> and the loop check would be the least of our worries in that case. IOW, it
> would never get so far...
> 
I had queued that one already.

> The one converting the notifier is not changing any of the functionality.
> 
> I cannot test on all VIA SMP variants either, but at least on the one I
> have access to it just works.
> 
I queued up the second patch as well. Hope it does not blow up on us.
Sorry, I got a bit nervous after the coretemp experience.

Thanks,
Guenter
