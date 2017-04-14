Return-path: <tglx@linutronix.de>
Date: Fri, 14 Apr 2017 19:35:37 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Tommi Rantala <tt.rantala@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
    Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>,
    linux-hwmon@vger.kernel.org, Sebastian Siewior <bigeasy@linutronix.de>,
    Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
In-Reply-To: <alpine.DEB.2.20.1704121643120.1874@nanos>
Message-ID: <alpine.DEB.2.20.1704141935200.2327@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net> <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com> <alpine.DEB.2.20.1704121124510.1874@nanos> <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
 <alpine.DEB.2.20.1704121248150.1874@nanos> <CA+ydwtrc9E_xuaQSx=P_co3q9EPSyRq3yzSyTgN1kxp0gs35qw@mail.gmail.com> <alpine.DEB.2.20.1704121643120.1874@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 12 Apr 2017, Thomas Gleixner wrote:
> On Wed, 12 Apr 2017, Tommi Rantala wrote:
> > 2017-04-12 13:52 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> > > Can you please try to offline/online CPUs from the console?
> > >
> > > # echo 0 >/sys/devices/system/cpu1/online
> > > # echo 1 >/sys/devices/system/cpu1/online
> > 
> > ok, that works.
> > 
> > > If that works, then try to offline all CPUs (except 0) in the same order as
> > > suspend (1 ... 7) and then online them again in the same order?
> > 
> > Seems to work without problems:
> 
> Good.
> 
> Can you please try the following:
> 
> # for STATE in freezer devices platform processors core; do \
>   echo $STATE; \
>   echo $STATE >/sys/power/pm_test; \
>   echo mem >/sys/power/state
> 
> That should give us at least a hint in which area to dig.

Any news on that?

Thanks,

	tglx
