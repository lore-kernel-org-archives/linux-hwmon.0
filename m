Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Wed, 10 Oct 2018 17:24:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Add operating mode support
Message-ID: <20181011002411.GA10379@Asurada-Nvidia.nvidia.com>
References: <20181010043310.30873-1-nicoleotsuka@gmail.com>
 <20181010043310.30873-3-nicoleotsuka@gmail.com>
 <32c22986-544e-aca1-12bf-9080667cf499@roeck-us.net>
 <20181010230906.GB1706@Asurada-Nvidia.nvidia.com>
 <20181010234300.GA25480@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181010234300.GA25480@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Wed, Oct 10, 2018 at 04:43:00PM -0700, Guenter Roeck wrote:
> > > The effort to do all this using CPU cycles would in most if not all cases
> > > outweigh any perceived power savings. As such, I just don't see the
> > > practical use case.
> > 
> > It really depends on the use case and how often the one-shot gets
> > triggered. For battery-powered devices, running in the continuous
> > mode does consume considerable power based on the measurement from
> > our power folks. If a system is running in a power sensitive mode,
> > while it still needs to occasionally check the inputs, it could be
> > a use case for one-shot mode, though it's purely a user decision.
> > 
> That would actually be a use case for runtime power management.
> The power used by a modern sensor chip is miniscule compared
> to the power consumed by other components in the system,
> which may explain why no one bothered looking into runtime
> power management for sensors.
> 
> This is also an argument against any device or subsystem specific solution:
> Users will want to be able to control power consumption for all devices
> in the system, not just for sensors. A device specific power control
> mechanism would, from user space perspective, be a nightmare.

That makes sense to me. Actually we wanted a solution more on the
driver side so that user space doesn't need to be involved. But our
downstream solution (switching different modes when certain number
of CPUs get hot plugged in/out) wasn't accepted years ago by other
subsystem maintainers, being commented that it's a user decision,
IIRC. So I thought that having a sysfs node might be a generic way
for "user decision". But I guess I should have tried to seek for a
solution in the kernel like runtime PM as you said.

> > > power-down mode effectively reinvents runtime power management (runtime
> > > suspend/resume support) and is thus simply unacceptable.
> > 
> > Similar to one-shot, if a system is in a low power mode where it
> > doesn't want to check the inputs anymore, I feel the user space
> > could at least make the decision to turn on/off the chips, I am
> > not quite sure if the generic runtime PM system already has this
> > kind of support though.
> > 
> Please look up "runtime power management". It provides the basic
> mechanism to turn off / disable a device if it is not used. The point
> here is that the basic mechanism is there, even though it may not
> be perfect. If it is not perfect, it needs to be improved.
> Implementing a per-subsystem alternate method would be the wrong
> approach.

I have implemented runtime PM suspend/resume in other drivers but
what I know is that it relies on someone to call get_sync and put
functions accordingly and it doesn't seem to have built-in system
level low-power or power-sensitive mode for those use cases that
I mentioned previously. But I agree with your point and will take
a closer look.

One more question here, and this might sound a bit abuse of using
the existing hwmon ABI: would it sound plausible to you that the
driver powers down the chip when all three channels get disabled
via in[123]_enable nodes? :)

Thanks
Nicolin
