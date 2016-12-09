Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:48450 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753632AbcLIL4P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Dec 2016 06:56:15 -0500
Date: Fri, 9 Dec 2016 12:53:30 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, rt@linuxtronix.de,
        Guenter Roeck <linux@roeck-us.net>,
        Sebastian Andrzej Siewior <bigeasy@breakpoint.cc>,
        rt@linutronix.de
Subject: Re: [PATCH 06/20] hwmon/via-cputemp: Convert to hotplug state
 machine
In-Reply-To: <20161117183541.8588-7-bigeasy@linutronix.de>
Message-ID: <alpine.DEB.2.20.1612091238360.3794@nanos>
References: <20161117183541.8588-1-bigeasy@linutronix.de> <20161117183541.8588-7-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Guenter,

On Thu, 17 Nov 2016, Sebastian Andrzej Siewior wrote:

> Install the callbacks via the state machine and let the core invoke the
> callbacks on the already online CPUs. When the hotplug state is
> unregistered the cleanup function is called for each cpu. So both cpu loops
> in init() and exit() are not longer required.

Can we please get those two VIA patches merged for 4.10? They are blocking
the final removal of the CPU hotplug notifier crap.

The first one which removes that loop is really harmless as there are no
multisocket VIAs. Heterogenous cores in a single die would be surprising
and the loop check would be the least of our worries in that case. IOW, it
would never get so far...

The one converting the notifier is not changing any of the functionality.

I cannot test on all VIA SMP variants either, but at least on the one I
have access to it just works.

Thanks,

	tglx

