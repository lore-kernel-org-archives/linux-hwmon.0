Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36977 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbeJEC4x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Oct 2018 22:56:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id az3-v6so5688841plb.4
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Oct 2018 13:02:05 -0700 (PDT)
Date: Thu, 4 Oct 2018 13:02:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: hwmon: trace event support?
Message-ID: <20181004200203.GA22946@roeck-us.net>
References: <20181003234657.GA32550@Asurada-Nvidia.nvidia.com>
 <cbc579ab-b95f-4917-154d-95dc0c059a06@roeck-us.net>
 <20181004050838.GA9439@Asurada-Nvidia.nvidia.com>
 <20181004164802.GA16009@roeck-us.net>
 <20181004185846.GB9439@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004185846.GB9439@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Oct 04, 2018 at 11:58:47AM -0700, Nicolin Chen wrote:
> Hello,
> 
> On Thu, Oct 04, 2018 at 09:48:02AM -0700, Guenter Roeck wrote:
> > > > I would not object to adding trace support into the hwmon subsystem.
> > > > However, it should be tied to the new API. I would resist patches
> > > > adding trace support to individual hwmon drivers unless the new API
> > > > is used and additional driver specific trace support is warranted.
> > > 
> > > Yes, my idea is to implement it with the _info API inside the hwmon
> > > core. What do you think about the mentioned solution? Would you be
> > > in favor of a polling work queue?
> > > 
> > > "----------. Similar to tz->poll_queue in thermal_core, hwmon core
> > >  could also have a work queue polling the registered sensor inputs
> > >  (by default disabled; enabled only if users configure poll_delay)
> > >  so that the power data can be generated to Ftrace outputs as well."
> > > 
> > 
> > I am not really in favor of it. This goes well beyond tracing. Tracing
> > by its nature should be non-invasive and impact the system as little as
> > possible. Adding a thread which polls thermal sensors, which are often
> > connected with a slow i2c interface or even blocking, is quite invasive.
> > 
> > I don't mind adding tracing support to trace sensor access. Adding code
> > to poll thermal sensors on a regular basis is a completely different
> > beast. I am not convinced that this should really be done in the kernel.
> > The same could be accomplished with a simple loop from userspace.
> 
> I ain't 100% convinced either. I think at this point we can just
> insert a trace event to the hwmon_attr_show(), unless there is a
> substantial polling queue in the hwmon core as thermal_core has,
> although I am not sure what would be a legit reason to add one.
> 
> > while true; do
> > 	cat /sys/class/hwmon/hwmon1/temp1_input
> > 	sleep 1
> > done
> 
> The power/perf folks were asking about something hands-free, as
> neither thermal nor cpufreq requires extra readings or polling,
> but I feel this should work for them too, reluctantly though.
> 

... the difference being that both are active kernel subsystems,
meaning they do something on their own, while hwmon is by its nature
passive unless triggered by userspace or, sometimes, interrupts.

> > ... and you could actually trace those accesses in the kernel.
> > 
> > Now, if the problem is added overhead due to requiring a sysfs access
> > for each sensor read, we can discuss introducing a different and more
> > efficient user-space ABI (such as adding a hwmon->iio bridge).
> > That would however be a different discussion.
> 
> Yea, that's beyond the topic yet it sounds more interesting for
> certain people I guess, considering the fact that there are two
> ina2xx drivers in both hwmon and iio subsystems.
> 

This of course is quite undesirable, and a solution permitting
support for both ABIs with a single driver would be quite useful.

Guenter
