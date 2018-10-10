Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35073 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbeJKHHb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Oct 2018 03:07:31 -0400
Date: Wed, 10 Oct 2018 16:43:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Add operating mode support
Message-ID: <20181010234300.GA25480@roeck-us.net>
References: <20181010043310.30873-1-nicoleotsuka@gmail.com>
 <20181010043310.30873-3-nicoleotsuka@gmail.com>
 <32c22986-544e-aca1-12bf-9080667cf499@roeck-us.net>
 <20181010230906.GB1706@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181010230906.GB1706@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nicolin,

On Wed, Oct 10, 2018 at 04:09:07PM -0700, Nicolin Chen wrote:
> Hello Guenter,
> 
> On Wed, Oct 10, 2018 at 06:22:39AM -0700, Guenter Roeck wrote:
> 
> > > The hwmon core now has a new optional mode interface. So this patch
> > > just implements this mode support so that user space can check and
> > > configure via sysfs node its operating modes: power-down, one-shot,
> > > and continuous modes.
> 
> > One-shot mode on its own does not make sense or add value: It would require
> > explicit driver support to trigger a reading, wait for the result, and
> > report it back to the user. If the intent here is to have the user write the
> > mode (which triggers the one-shot reading), wait a bit, and then read the
> > results, that doesn't make sense because standard userspace applications
> > won't know that. Also, that would be unsynchronized - one has to read the
> > CVRF bit in the mask/enable register to know if the reading is complete.
> 
> I think I oversimplified the one-shot mode here and you are right:
> there should be a one-shot reading routine; the conversion time in
> the configuration register also needs to be taken care of.
> 
> > The effort to do all this using CPU cycles would in most if not all cases
> > outweigh any perceived power savings. As such, I just don't see the
> > practical use case.
> 
> It really depends on the use case and how often the one-shot gets
> triggered. For battery-powered devices, running in the continuous
> mode does consume considerable power based on the measurement from
> our power folks. If a system is running in a power sensitive mode,
> while it still needs to occasionally check the inputs, it could be
> a use case for one-shot mode, though it's purely a user decision.
> 
That would actually be a use case for runtime power management.
The power used by a modern sensor chip is miniscule compared
to the power consumed by other components in the system,
which may explain why no one bothered looking into runtime
power management for sensors.

This is also an argument against any device or subsystem specific solution:
Users will want to be able to control power consumption for all devices
in the system, not just for sensors. A device specific power control
mechanism would, from user space perspective, be a nightmare.

> > power-down mode effectively reinvents runtime power management (runtime
> > suspend/resume support) and is thus simply unacceptable.
> 
> Similar to one-shot, if a system is in a low power mode where it
> doesn't want to check the inputs anymore, I feel the user space
> could at least make the decision to turn on/off the chips, I am
> not quite sure if the generic runtime PM system already has this
> kind of support though.
> 
Please look up "runtime power management". It provides the basic
mechanism to turn off / disable a device if it is not used. The point
here is that the basic mechanism is there, even though it may not
be perfect. If it is not perfect, it needs to be improved.
Implementing a per-subsystem alternate method would be the wrong
approach.

> > I am open to help explore adding support for runtime power management
> > to the hwmon subsystem, but that would be less than straightforward and
> > require an actual use case to warrant the effort.
> 
> Is there any feasible solution from your point of view?
> 

You mean to implement runtime suspend/resume for hwmon drivers,
or some other approach ? As for implementing it in hwmon drivers,
I don't know; I don't recall this ever coming up, and never
thought about it. This is where the use case comes in - if done,
it has to be done properly, which will require some thinking and
a substantial amount of time. It simply does not make sense to
spend time on that effort if there is no actual use case.

Implementing an alternate mechanism is simply a no-go.

Guenter
