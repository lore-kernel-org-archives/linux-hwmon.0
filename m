Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Thu, 4 Oct 2018 11:58:47 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: hwmon: trace event support?
Message-ID: <20181004185846.GB9439@Asurada-Nvidia.nvidia.com>
References: <20181003234657.GA32550@Asurada-Nvidia.nvidia.com>
 <cbc579ab-b95f-4917-154d-95dc0c059a06@roeck-us.net>
 <20181004050838.GA9439@Asurada-Nvidia.nvidia.com>
 <20181004164802.GA16009@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004164802.GA16009@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hello,

On Thu, Oct 04, 2018 at 09:48:02AM -0700, Guenter Roeck wrote:
> > > I would not object to adding trace support into the hwmon subsystem.
> > > However, it should be tied to the new API. I would resist patches
> > > adding trace support to individual hwmon drivers unless the new API
> > > is used and additional driver specific trace support is warranted.
> > 
> > Yes, my idea is to implement it with the _info API inside the hwmon
> > core. What do you think about the mentioned solution? Would you be
> > in favor of a polling work queue?
> > 
> > "----------. Similar to tz->poll_queue in thermal_core, hwmon core
> >  could also have a work queue polling the registered sensor inputs
> >  (by default disabled; enabled only if users configure poll_delay)
> >  so that the power data can be generated to Ftrace outputs as well."
> > 
> 
> I am not really in favor of it. This goes well beyond tracing. Tracing
> by its nature should be non-invasive and impact the system as little as
> possible. Adding a thread which polls thermal sensors, which are often
> connected with a slow i2c interface or even blocking, is quite invasive.
> 
> I don't mind adding tracing support to trace sensor access. Adding code
> to poll thermal sensors on a regular basis is a completely different
> beast. I am not convinced that this should really be done in the kernel.
> The same could be accomplished with a simple loop from userspace.

I ain't 100% convinced either. I think at this point we can just
insert a trace event to the hwmon_attr_show(), unless there is a
substantial polling queue in the hwmon core as thermal_core has,
although I am not sure what would be a legit reason to add one.

> while true; do
> 	cat /sys/class/hwmon/hwmon1/temp1_input
> 	sleep 1
> done

The power/perf folks were asking about something hands-free, as
neither thermal nor cpufreq requires extra readings or polling,
but I feel this should work for them too, reluctantly though.

> ... and you could actually trace those accesses in the kernel.
> 
> Now, if the problem is added overhead due to requiring a sysfs access
> for each sensor read, we can discuss introducing a different and more
> efficient user-space ABI (such as adding a hwmon->iio bridge).
> That would however be a different discussion.

Yea, that's beyond the topic yet it sounds more interesting for
certain people I guess, considering the fact that there are two
ina2xx drivers in both hwmon and iio subsystems.

> > > Note that this also applies to hwmon drivers registering through
> > > thermal. The thermal subsystem calls the _info API but misuses it
> > > to avoid a warning generated when using the old API. Of course,
> > > I have no influence over the hwmon code in the thermal subsystem,
> > > so whatever is done there is essentially wild-wild-west.
> > 
> > I saw they have some obvious code in the hwmon core. If you want,
> > we can keep the polling work queue and trace events away from it,
> > which sounds plausible to me considering that thermal subsystem
> > has its own polling work queue and trace events for sensor data.
> 
> The code in the hwmon core is different. I am referring to hwmon code
> in the thermal core.

I see, though I can't foresee a conflict if we just add a trace
event in the hwmon_attr_show(). And it seems, at least now, it
passes a NULL chip pointer via the _info API.

Thank you
Nicolin
