Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60891 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751992AbdDLKw5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2017 06:52:57 -0400
Date: Wed, 12 Apr 2017 12:52:11 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Tommi Rantala <tt.rantala@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
In-Reply-To: <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1704121248150.1874@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net> <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com> <alpine.DEB.2.20.1704121124510.1874@nanos>
 <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 12 Apr 2017, Tommi Rantala wrote:
> 2017-04-12 12:28 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> > On Wed, 12 Apr 2017, Tommi Rantala wrote:
> >> Resume-from-suspend stopped working in HP xw6600 in fedora kernel
> >> 4.10.8-200.fc25.x86_64, while it worked just fine in
> >> 4.9.9-200.fc25.x86_64.
> >>
> >> When powering on the suspended PC, there is no video output, and to
> >> recover, I need to reset the machine.
> >
> > Is there just no video output or is the machine completely frozen? If it's
> > not completely dead, then you might be able to ssh into it.
> 
> It's completely hosed: not possible to ssh, does not respond to ping either.
> 
> I made a quick test with netconsole. After booting with
> no_console_suspend=1, and setting the netconsole parameters, I can get
> kernel messages (to my android phone) when suspending the machine. But
> no messages after the failed resume.

Let's do something else first.

Can you please try to offline/online CPUs from the console?

# echo 0 >/sys/devices/system/cpu1/online
# echo 1 >/sys/devices/system/cpu1/online

If that works, then try to offline all CPUs (except 0) in the same order as
suspend (1 ... 7) and then online them again in the same order?

Thanks,

	tglx

