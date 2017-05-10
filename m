Return-path: <tt.rantala@gmail.com>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1705101557100.1979@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
 <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com>
 <alpine.DEB.2.20.1704121124510.1874@nanos> <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
 <alpine.DEB.2.20.1704121248150.1874@nanos> <CA+ydwtrc9E_xuaQSx=P_co3q9EPSyRq3yzSyTgN1kxp0gs35qw@mail.gmail.com>
 <alpine.DEB.2.20.1704121643120.1874@nanos> <alpine.DEB.2.20.1704141935200.2327@nanos>
 <CA+ydwtq9ebDGtWxZGfuxgJVgHgF06Lb3NPgOfA0X90RH=U_1ew@mail.gmail.com>
 <alpine.DEB.2.20.1704231657230.3041@nanos> <CA+ydwtrW28-H9MkYcj44QoGzKuRRRY3+gsjcs8=oNU8HxPcM+Q@mail.gmail.com>
 <alpine.DEB.2.20.1705090914100.1798@nanos> <CA+ydwtprNbXLo-kF3gKvcYJSu=cxVYHFXAW6uyC6voCj1g3KDw@mail.gmail.com>
 <alpine.DEB.2.20.1705101557100.1979@nanos>
From: Tommi Rantala <tt.rantala@gmail.com>
Date: Wed, 10 May 2017 17:02:48 +0300
Message-ID: <CA+ydwtqW=-kJ=w7rB8xmmpshBDGgbtxpcTitzyBjyAyR_HhMaQ@mail.gmail.com>
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Sebastian Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

2017-05-10 17:01 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> On Wed, 10 May 2017, Tommi Rantala wrote:
>> 2017-05-09 10:16 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
>> > On Thu, 4 May 2017, Tommi Rantala wrote:
>> >> Here's the trace output, does it help?
>> >
>> > Not much. Can you please try the following:
>> >
>> > 1) Offline all CPUs except CPU0 before suspend/resume
>>
>> it works!
>>
>> > 2) Offline all CPUs except CPU0 and CPU1 before suspend/resume
>>
>> now it breaks.
>>
>> > 3) Offline all CPUs except CPU0 and CPU2 before suspend/resume
>>
>> works again!
>>
>> (Also works with CPUs 0,2,4,6 onlined.)
>
> Output from /proc/cpuinfo please.

http://termbin.com/vec2
