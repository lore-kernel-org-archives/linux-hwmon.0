Return-Path: <mfe@pengutronix.de>
Return-path: <mfe@pengutronix.de>
Date: Tue, 30 Oct 2018 11:47:06 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Trent Piepho <tpiepho@impinj.com>,
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
 <20181029143521.22122-3-m.felsch@pengutronix.de>
 <20181029195238.GA24689@roeck-us.net>
 <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

thanks for the quick response, please see my comments below.

On 18-10-29 18:12, Guenter Roeck wrote:
> On 10/29/18 2:16 PM, Trent Piepho wrote:
> > On Mon, 2018-10-29 at 12:52 -0700, Guenter Roeck wrote:
> > > On Mon, Oct 29, 2018 at 03:35:21PM +0100, Marco Felsch wrote:
> > > > Most the time low voltage detection happens on a external device
> > > > e.g. a pmic or any other hw-logic. Some of such devices can pass the
> > > > power state (good/bad) to the host via i2c or by toggling a gpio.
> > > > 
> > > > This patch adds the support to evaluate a gpio line to determine
> > > > the power good/bad state. The state is represented by the
> > > > in0_lcrit_alarm. Furthermore the driver supports to release device from
> > > > their driver upon a low voltage detection. This feature is supported by
> > > > OF-based firmware only.
> > > > 
> > > 
> > > NACK, sorry.
> > > 
> > > hwmon is strictly about monitoring, not about taking any action, and much
> > > less about removing devices from the system after some status change,
> > > it be a gpio pin value or anything else. Other than that, the driver simply
> > > maps a gpio pin to a (pretty much arbitrary) sysfs attribute, for which
> > > a driver isn't really needed.
> > > 
> > > I don't know if there is a space in the kernel for handling the problem
> > > you are trying to solve, but it isn't hwmon.
> > 
> > If we ignore the ability to stop other devices, how is this not a hwmon
> > device with just alarm features?
> > 
> Possibly, but the ability to stop other devices is at the core of the driver
> as submitted.
> 
> > It seems to map the hwmon interface quite directly.
> 
> Agreed.
> 
> > 
> > Consider, what if we had a "classic" hwmon chip, but on this board the
> > I2C/LPC/SPI interface was not connected as an appropriate master was
> > not available, and the default configuration of the chip was
> > acceptable.  The chip's alarm outputs are connected to GPIOs, as it
> > normal for a hwmon chip with alarm outputs.
> > 
> "If we had" is theory. Do we ? We don't usually add code to the kernel
> just in case the hardware it supports might be out there.

Yes, there are "good old" hwmon chips without any management interface,
e.g. LTC694-3.3, LTC7862, ... also there might be a discrete hw circuit.
I think it's better to handle those "simple" chips by a generic hwmon
driver. By simple I mean chips which informs the host only by toggling a
gpio to report a state. For this purpose my driver (including name
convention) isn't generic enough, I think about a hwmon-simple device.
Such a device can support reporting states, no voltage/power/temp values.

> > Are the alarms no longer appropriate to appear in hwmon?  But if we
> > connect the chip's I2C interface, then those same alarms should appear
> > in hwmon?
> > 
> > That just doesn't make sense to me.
> > 
> > Also consider the gpio-fan driver.  That's pretty much just an
> > interface to a gpio too.
> > Or consider the leds-gpio driver.  That allows a gpio controlled LED to
> > appear in the kernel's led subsystem.  It doesn't do anything besides
> > turn the gpio on and off.  It's hardly needed if all we cared about was
> > controlling the LED in some way.  Yet it's used quite often.
> > 
> 
> The difference here is that those are distinct drivers, with no other hardware
> behind it to control the LEDs or to report fan speeds.
> 
> For voltage monitoring, that is not normally the case. It is much more likely
> that there is in fact a hardware monitoring or power control chip, the
> (or an) alarm output of that chip is connected to a gpio line, and its control
> interface is connected. If so, the driver for that chip should be enhanced
> to support interrupts, and to report the status with its own sysfs attributes.
> 
> Agreed, that might be more work for a given hardware, and it would have to
> be repeated for each chip with that configuration which doesn't already
> have interrupt support. Meaning, unfortunately, almost all hwmon drivers.
> It might even be necessary to implement an i2c or spi controller driver
> if that does not exist. But it would be the appropriate solution.

Please see my above comments.

> > So it seems perfectly correct to me that a GPIO based hardware
> > monitoring alarm should appear in the kernel's hardware monitoring
> > subsystem with all the other hardware monitoring alarms.
> > 
> We can only consider a driver reporting a specific attribute if there
> is a board which doesn't support anything else.
> 
> > The ability of the hwmon driver to cause certain other devices to be
> > removed is a different question.
> > 
> I disagree. That functionality is essential to the driver as submitted.

You're right thats important for my use-case, but I got you, thats not a
hwmon related problem. If I understood the device-model correctly there
are absolut no problems to hot-unplug devices, this is always the case
if we unbind a driver from user-space. So why we can't handle it
directly in the kernel. Are there any concerns? If not can you give me
some hints to get the logic at thr right place.

Thanks,
Marco

> Guenter
> 
