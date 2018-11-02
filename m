Return-Path: <mfe@pengutronix.de>
Return-path: <mfe@pengutronix.de>
Date: Fri, 2 Nov 2018 07:38:03 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181102063803.blsavuxhi5i2vgog@pengutronix.de>
References: <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
 <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
 <20181030170026.licamhckbznuvcse@pengutronix.de>
 <1540928050.30311.94.camel@impinj.com>
 <20181030201147.GB28185@roeck-us.net>
 <20181101104059.em3bvpdzo2bsyazy@pengutronix.de>
 <e9a896c8-0025-5c4c-d1ee-ab599320fac0@roeck-us.net>
 <20181101145312.wadkj5u2rlr5ewdq@pengutronix.de>
 <20181101151428.GB25346@roeck-us.net>
 <1541096469.30311.166.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541096469.30311.166.camel@impinj.com>
List-ID: <linux-hwmon@vger.kernel.org>

On 18-11-01 18:21, Trent Piepho wrote:
> On Thu, 2018-11-01 at 08:14 -0700, Guenter Roeck wrote:
> > On Thu, Nov 01, 2018 at 03:53:12PM +0100, Marco Felsch wrote:
> > > 
> > > > 
> > > > Isn't that configurable with devicetree flags ? I don't think a driver
> > > > should get involved in deciding the active edge.
> > > 
> > > No, AFAIK we can only specify the active level types for gpios. This
> > > made sense to me, because I saw no gpio-controller which support
> > > 'edge-level' reporting (however it will be called) currently.
> 
> Interrupts types are specific to each interrupt controller, but there
> is a standard set of flags that, AFAIK, every Linux controller uses. 
> These include IRQ_TYPE_EDGE_BOTH, IRQ_TYPE_EDGE_RISING,
> IRQ_TYPE_LEVEL_HIGH, and so on.
> 
> So you can support hardware that is inherently edge or level triggered.

I've been spoken about gpio-controllers and AFAIK there are no edge
types. Interrupt-Controller are a different story, as you pointed out
above.

> I have used edge triggered interrupts on GPIO pins on many designs.
> 
> From what I remember, most hwmon chips use level triggered signals. 
> The general process in the driver:
> 
> Level goes to asserted, IRQ handler invoked
> Ack interrupt in hwmon chip's alarm register, which usually de-asserts
> the alarm line
> Set bit in driver state to indicate the alarm attribute should be set
> sysfs_notify anything polling the attribute
> If alarm line did not de-assert on ack, leave IRQ masked
> Sysfs attribute stays set until userspace process acks it (by reading)

Okay, thanks for that hint. Should we reference this in the
Documentation/hwmon/sysfs-interface?

> The important part here is that the alarm is latched in the driver.  We
> don't just report the current alarm status in the attribute.  Otherwise
> an alarm could come and go without anyone noticing if they didn't read
> the attribute at just the right time.
> 
> Put another way, the hwmon alarm attribute means an alarm occurred
> since the last time the attribute was reset.  It does not mean the
> alarm is currently active.
> 
> This also means the driver does not need to continuously track the
> alarm status.  Once we detect the first alarm, we don't care what it
> does until the alarm status is reset and we need to watch for alarms
> again.
> 
> If one has something like an op-amp voltage comparator, I think the
> driver would register a level interrupt.  It be left masked after the
> irq handler notes the alarm, to prevent immediately re-asserting.  This
> is normal for level interrupts that can not be de-asserted by an action
> of the irq handler.  It would be unmasked on the ack/read of the alarm
> attribute.  That would trigger another interrupt if the alarm signal is
> still asserted.
> 
> If instead, you tried registering for IRQs on both edges, then it's not
> reliable.  It's possible for the edges to come in too fast, before the
> irq controller or the kernel is ready for them, and then you get out of
> sync.

Too fast state changes sounds like a glitch. Anyway, IMHO we should
support support both interrupts and gpios. If the users use gpios they
have to poll the gpio, as Guenter pointed out, else we register a
irq-handler.

Marco
