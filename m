Return-Path: <mfe@pengutronix.de>
Return-path: <mfe@pengutronix.de>
Date: Wed, 7 Nov 2018 10:35:29 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181107093529.mwkjbbpipbsoraho@pengutronix.de>
References: <20181030201147.GB28185@roeck-us.net>
 <20181101104059.em3bvpdzo2bsyazy@pengutronix.de>
 <e9a896c8-0025-5c4c-d1ee-ab599320fac0@roeck-us.net>
 <20181101145312.wadkj5u2rlr5ewdq@pengutronix.de>
 <20181101151428.GB25346@roeck-us.net>
 <1541096469.30311.166.camel@impinj.com>
 <20181102063803.blsavuxhi5i2vgog@pengutronix.de>
 <1541199919.30311.224.camel@impinj.com>
 <20181105081917.3af4v2c2wejsfnqe@pengutronix.de>
 <1541537426.30311.271.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541537426.30311.271.camel@impinj.com>
List-ID: <linux-hwmon@vger.kernel.org>

On 18-11-06 20:50, Trent Piepho wrote:
> On Mon, 2018-11-05 at 09:19 +0100, Marco Felsch wrote:
> > On 18-11-02 23:05, Trent Piepho wrote:
> > > On Fri, 2018-11-02 at 07:38 +0100, Marco Felsch wrote:
> > > > 
> > > > > Interrupts types are specific to each interrupt controller, but there
> > > > > is a standard set of flags that, AFAIK, every Linux controller uses. 
> > > > > These include IRQ_TYPE_EDGE_BOTH, IRQ_TYPE_EDGE_RISING,
> > > > > IRQ_TYPE_LEVEL_HIGH, and so on.
> > > > > 
> > > > > So you can support hardware that is inherently edge or level triggered.
> > > > 
> > > > I've been spoken about gpio-controllers and AFAIK there are no edge
> > > > types. Interrupt-Controller are a different story, as you pointed out
> > > > above.
> > > 
> > > You can use edge triggering with gpios.  Just try writing "rising" or
> > > "falling" into /sys/class/gpio/gpioX/edge
> > 
> > Can we access the gpios trough the sysfs if they are requested by a
> > driver?
> 
> When I first did the sysfs interface for gpios, you could do that, but
> David Brownell wanted it so that you can't access gpios via sysfs if a
> driver requested them.  The compromise was that *kernel* code can
> explicitly export to sysfs a gpio that is used by a driver (ie. also
> requested in kernel code), but you couldn't do it just from userspace.
> 
> But that's irrelevant here.  The point is that you can get edge
> triggered interrupts on a gpio and if you don't believe me, just try it
> for yourself and you'll see it works.  The sysfs interface just
> translates into the same calls a kernel driver could make.
> 
> > > It's level you can't do sysfs.  The irq masking necessary isn't
> > > supported to get it to work in a useful way, i.e. without a live-lock
> > > IRQ loop.
> > > 
> > > But you can in the kernel.
> > > 
> > > Normal process is to call gpiod_to_irq() and then use standard IRQF
> > > flags to select level, edge, etc.
> > 
> > Currently I using the gpiod_to_irq() function to convert the sense gpio
> > into a irq, but I do some magic to determine the edge. I tought there
> > might be reasons why there are no edge defines in
> > include/dt-bindings/gpio/gpio.h.
> 
> Just request the interrupt with IRQF_TRIGGER_RISING and it will work on
> almost any SoC.  The reason you see no edge defines with gpio handles
> is that edge and level triggering is a interrupt concept, not a gpio
> concept.  There are no level triggers defined for gpios either.  The
> active low/high flags just define what voltage should be considered
> "asserted".  They aren't intended to be related to interrupts.

Okay, thanks for this hint. So a gpio marked as GPIO_ACTIVE_LOW will
trigger a IRQF_TRIGGER_RISING requested interrupt if the gpio level
(electrical) goes from 1->0? I didn't knew that.

> 
> > Okay, so no polling for the current solution. Let me summarize our
> > solution:
> >  - no polling (currently)
> >  - dt-node specifies a gpio instead of a interrupt
> >    -> gpio <-> irq mapping is done by gpiod_to_irq() and fails if gpio
> >       doesn't support irq's
> >  - more alarms per sensor
> > 
> > Only one last thing I tought about:
> > 
> > Using a flat design like you mentioned would lead into a "virtual"
> > address conflict, since both sensors are on the same level. I tought
> > about i2c/spi/muxes/graph-devices which don't support such "addressing"
> > scheme.
> 
> You mean a temp alarm and a voltage alarm could both be reg = <1>?  I
> don't think anything complains about that.  But it does seem
> undesirable.

Yes, because both types are on the same hierarchy level. As I said it is
more a dt-convention decision.

> > hwmon_dev {
> > 	compatible = "gpio-alarm";
> > 	bat@0 {
> > 		reg = <0>;
> > 		label = "Battery Pack1 Voltage";
> > 		type = "voltage";
> > 		alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> 
> Would have to be <GPIO_ALARM_LCRIT>, <GPIO_ALARM_CRIT>;
> 
> I'm not sure if dt bindings prefer symbolic integer constants vs
> strings for something which is an enumeration like this.  strings seem
> more common to me, e.g. alarm-types = "lcrit", "crit";

That's a good question. I term of parsing, the non string variant should
be faster. I don't have any preference, but will try the string variant
first ;)

Regards,
Marco

> > 		alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
> > 				&gpio3 16 GPIO_ACTIVE_LOW>;
> > 	};
> > 	bat@1 {
> > 		reg = <1>;
> > 		label = "Battery Pack2 Voltage";
> > 		alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > 		alarm-gpios = <&gpio3 9 GPIO_ACTIVE_LOW
> > 				&gpio3 1 GPIO_ACTIVE_LOW>;
> > 	};
> > 	cputemp@0 {
> > 		reg = <0>;
> > 		label = "CPU Temperature Critical";
> > 		type = "temperature";
> > 		alarm-type = <GPIO_ALARM_GENRIC>;
> > 		alarm-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> > 	};
> > };
> > 
> > Where a more structured layout don't have this "issue".
> > 
> > hwmon_dev {
> > 	compatible = "gpio-alarm";
> > 
> > 	voltage {
> > 		bat@0 {
> > 			reg = <0>;
> > 	 		label = "Battery Pack1 Voltage";
> > 			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > 			alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
> > 					&gpio3 16 GPIO_ACTIVE_LOW>;
> > 		};
> > 		bat@1 {
> > 			reg = <1>;
> > 	 		label = "Battery Pack2 Voltage";
> > 			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > 			alarm-gpios = <&gpio3 9 GPIO_ACTIVE_LOW
> > 					&gpio3 1 GPIO_ACTIVE_LOW>;
> > 		};
> > 	};
> > 	temperature {
> > 		cputemp {
> > 			label = "CPU Temperature Critical";
> > 			alarm-type = <GPIO_ALARM_GENRIC>;
> > 			alarm-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> > 		};
> > 	};
> > };
> > 
> > We don't have to take this layout, we can also consider about devices:
> > 
> > hwmon_dev {
> > 	compatible = "gpio-alarm";
> > 
> > 	dev@0 {
> > 		reg = <0>;
> > 		voltage {
> > 			label = "Battery Pack1 Voltage";
> > 			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > 			alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
> > 					&gpio3 16 GPIO_ACTIVE_LOW>;
> > 		};
> > 		temperature {
> > 			label = "Battery Pack1 Temperature Critical";
> > 			alarm-type = <GPIO_ALARM_GENRIC>;
> > 			alarm-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> > 		};
> > 	};
> > 	dev@1 {
> > 		reg = <1>;
> > 		temperature {
> > 			label = "CPU Temperature Critical";
> > 			alarm-type = <GPIO_ALARM_GENRIC>;
> > 			alarm-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
> > 		};
> > 	};
> > };
> > 
> > I don't think that is a issue at all, but I don't know the dt
> > maintainers opinion of this theme.
> > 
> > Regards,
> > Marco
