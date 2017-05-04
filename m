Return-path: <tt.rantala@gmail.com>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1704231657230.3041@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
 <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com>
 <alpine.DEB.2.20.1704121124510.1874@nanos> <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
 <alpine.DEB.2.20.1704121248150.1874@nanos> <CA+ydwtrc9E_xuaQSx=P_co3q9EPSyRq3yzSyTgN1kxp0gs35qw@mail.gmail.com>
 <alpine.DEB.2.20.1704121643120.1874@nanos> <alpine.DEB.2.20.1704141935200.2327@nanos>
 <CA+ydwtq9ebDGtWxZGfuxgJVgHgF06Lb3NPgOfA0X90RH=U_1ew@mail.gmail.com> <alpine.DEB.2.20.1704231657230.3041@nanos>
From: Tommi Rantala <tt.rantala@gmail.com>
Date: Thu, 4 May 2017 18:39:32 +0300
Message-ID: <CA+ydwtrW28-H9MkYcj44QoGzKuRRRY3+gsjcs8=oNU8HxPcM+Q@mail.gmail.com>
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Sebastian Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

2017-04-23 18:01 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> On Sat, 15 Apr 2017, Tommi Rantala wrote:
>
>> Testing with 4.10.8-200.fc25.x86_64: freezer, devices and platform are
>> OK, it breaks at "processors".
>> The screen stays off, and the machine no longer answers to ping.
>>
>> (Without coretemp loaded, the machine survives all the states. There
>> are some graphics glitches and radeon error messages)
>
> That's odd. I tried on a similar machine (w/o a radeon card) and it just
> works with the coretemp module loaded.
>
> Can you please do a CPU hotplug cycle (just one CPU) with the cpuhp events
> in the tracer enabled. Send me the trace output so I might be able to spot
> whats different and what interdependencies between other callbacks might be
> there.

Hi,

Here's the trace output, does it help?

http://termbin.com/qugr

-Tommi
