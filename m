Return-Path: <mfe@pengutronix.de>
Return-path: <mfe@pengutronix.de>
Date: Tue, 30 Oct 2018 18:00:26 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Trent Piepho <tpiepho@impinj.com>,
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181030170026.licamhckbznuvcse@pengutronix.de>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
 <20181029143521.22122-3-m.felsch@pengutronix.de>
 <20181029195238.GA24689@roeck-us.net>
 <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
 <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
 <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On 18-10-30 06:13, Guenter Roeck wrote:
> On 10/30/18 3:47 AM, Marco Felsch wrote:
> > On 18-10-29 18:12, Guenter Roeck wrote:
> > > On 10/29/18 2:16 PM, Trent Piepho wrote:

[Snip]

> > > > 
> > > > Consider, what if we had a "classic" hwmon chip, but on this board the
> > > > I2C/LPC/SPI interface was not connected as an appropriate master was
> > > > not available, and the default configuration of the chip was
> > > > acceptable.  The chip's alarm outputs are connected to GPIOs, as it
> > > > normal for a hwmon chip with alarm outputs.
> > > > 
> > > "If we had" is theory. Do we ? We don't usually add code to the kernel
> > > just in case the hardware it supports might be out there.
> > 
> > Yes, there are "good old" hwmon chips without any management interface,
> > e.g. LTC694-3.3, LTC7862, ... also there might be a discrete hw circuit.
> > I think it's better to handle those "simple" chips by a generic hwmon
> > driver. By simple I mean chips which informs the host only by toggling a
> > gpio to report a state. For this purpose my driver (including name
> > convention) isn't generic enough, I think about a hwmon-simple device.
> > Such a device can support reporting states, no voltage/power/temp values.
> > 
> 
> Yes, I agree. It doesn't really make sense to keep adding single-attribute drivers.
> hwmon-gpio-simple, maybe, to indicate that it gets its data from gpio ?

hwmon-gpio-simple sounds ok for me.

> The most difficult part of such a driver would probably be to define acceptable
> devicetree properties.

That's true! One possible solution could be:

hwmon_dev {
	compatible = "hwmon-gpio-simple";
	name = "gpio-generic-hwmon";
	update-interval-ms = 100;

	hwmon-gpio-simple,dev@0 {
		reg = <0>;
		gpio = <gpio3 15 GPIO_ACTIVE_LOW>;
		hwmon-gpio-simple,type = "in";
		hwmon-gpio-simple,report = "crit_alarm";
	};

	hwmon-gpio-simple,dev@1 {
		reg = <1>;
		gpio = <gpio3 19 GPIO_ACTIVE_LOW>;
		hwmon-gpio-simple,type = "temp";
		hwmon-gpio-simple,report = "alarm";
	};
};

[SNIP]

> > > > The ability of the hwmon driver to cause certain other devices to be
> > > > removed is a different question.
> > > > 
> > > I disagree. That functionality is essential to the driver as submitted.
> > 
> > You're right thats important for my use-case, but I got you, thats not a
> > hwmon related problem. If I understood the device-model correctly there
> > are absolut no problems to hot-unplug devices, this is always the case
> > if we unbind a driver from user-space. So why we can't handle it
> > directly in the kernel. Are there any concerns? If not can you give me
> > some hints to get the logic at thr right place.
> > 
> Well, the easiest solution would have been to do nothing code-wise and
> register a gpio-keys instance on the gpio pin to create a KEY_POWER event.
> Of course that might be considered an abuse of the input subsystem,
> as Dmitry has pointed out, and is probably not acceptable. Now, if you
> want that functionality, you could probably write some udev rules and
> accomplish the same by listening for a change event from a sysfs attribute
> supporting it (I think KEY_POWER is not really handled in the kernel,
> but I am not entirely sure).

I came from the input framework, as you pointed out.

> Handling the event in the kernel is more tricky. First, I don't think the
> selective device removal as you have suggested would be acceptable anywhere;
> it may cause all kinds of trouble. The thermal subsystem supports the
> functionality to shut down the kernel in emergencies, but is limited
> in its scope (or at least I think so) to thermal events. Anything else
> would have to be discussed. I for my part prefer handling it from userspace.

Imagine that use-case: There is a custom board design which power off
all external devices and leave the host on for a certain time (a few
seconds) upon a low-voltage detection. Now the pins from the external
devices are floating around and producing a huge amount of interrupts,
so the kernel is really busy handling those interrupts and can't handle
user-space processes anymore. The "host keep-on time" was intended to be
used to save all user data currently processed, but this never happen.
Furthermore there can be a high-priority userspace task which can't be
preempted and the exec_time for this task is greater than the "host
keep-on time". So the task which will unbind the devices gets never
scheduled. Hopefully you get me and understand my outlines and why we
need to do the unbinding within the kernel-space.

One solution could be to split the drivers into to: hwmon for measuring
and notifying, of-unbind to unbind registered devices. For this we need
to get a kernel_notification from the hwmon-framework, so the generic
unbinding driver gets informed. Are you agree with me?

Regards,
Marco
