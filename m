Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:44327 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1045710AbdDWPCK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Apr 2017 11:02:10 -0400
Date: Sun, 23 Apr 2017 17:01:53 +0200 (CEST)
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
In-Reply-To: <CA+ydwtq9ebDGtWxZGfuxgJVgHgF06Lb3NPgOfA0X90RH=U_1ew@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1704231657230.3041@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net> <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com> <alpine.DEB.2.20.1704121124510.1874@nanos> <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
 <alpine.DEB.2.20.1704121248150.1874@nanos> <CA+ydwtrc9E_xuaQSx=P_co3q9EPSyRq3yzSyTgN1kxp0gs35qw@mail.gmail.com> <alpine.DEB.2.20.1704121643120.1874@nanos> <alpine.DEB.2.20.1704141935200.2327@nanos>
 <CA+ydwtq9ebDGtWxZGfuxgJVgHgF06Lb3NPgOfA0X90RH=U_1ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, 15 Apr 2017, Tommi Rantala wrote:

> 2017-04-14 20:35 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> > On Wed, 12 Apr 2017, Thomas Gleixner wrote:
> >>
> >> Can you please try the following:
> >>
> >> # for STATE in freezer devices platform processors core; do \
> >>   echo $STATE; \
> >>   echo $STATE >/sys/power/pm_test; \
> >>   echo mem >/sys/power/state
> >>
> >> That should give us at least a hint in which area to dig.
> >
> > Any news on that?
> 
> Sorry, was traveling.
> 
> Testing with 4.10.8-200.fc25.x86_64: freezer, devices and platform are
> OK, it breaks at "processors".
> The screen stays off, and the machine no longer answers to ping.
> 
> (Without coretemp loaded, the machine survives all the states. There
> are some graphics glitches and radeon error messages)

That's odd. I tried on a similar machine (w/o a radeon card) and it just
works with the coretemp module loaded.

Can you please do a CPU hotplug cycle (just one CPU) with the cpuhp events
in the tracer enabled. Send me the trace output so I might be able to spot
whats different and what interdependencies between other callbacks might be
there.

I'm traveling for a week now. I come back to this after my travel; if I
forget, please send me a reminder.

Thanks,

	tglx
