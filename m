Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33667 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbeKERhy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Nov 2018 12:37:54 -0500
Date: Mon, 5 Nov 2018 09:19:17 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181105081917.3af4v2c2wejsfnqe@pengutronix.de>
References: <20181030170026.licamhckbznuvcse@pengutronix.de>
 <1540928050.30311.94.camel@impinj.com>
 <20181030201147.GB28185@roeck-us.net>
 <20181101104059.em3bvpdzo2bsyazy@pengutronix.de>
 <e9a896c8-0025-5c4c-d1ee-ab599320fac0@roeck-us.net>
 <20181101145312.wadkj5u2rlr5ewdq@pengutronix.de>
 <20181101151428.GB25346@roeck-us.net>
 <1541096469.30311.166.camel@impinj.com>
 <20181102063803.blsavuxhi5i2vgog@pengutronix.de>
 <1541199919.30311.224.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541199919.30311.224.camel@impinj.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 18-11-02 23:05, Trent Piepho wrote:
> On Fri, 2018-11-02 at 07:38 +0100, Marco Felsch wrote:
> > On 18-11-01 18:21, Trent Piepho wrote:
> > > On Thu, 2018-11-01 at 08:14 -0700, Guenter Roeck wrote:
> > > > On Thu, Nov 01, 2018 at 03:53:12PM +0100, Marco Felsch wrote:
> > > > > 
> > > > > > 
> > > > > > Isn't that configurable with devicetree flags ? I don't think a driver
> > > > > > should get involved in deciding the active edge.
> > > > > 
> > > > > No, AFAIK we can only specify the active level types for gpios. This
> > > > > made sense to me, because I saw no gpio-controller which support
> > > > > 'edge-level' reporting (however it will be called) currently.
> > > 
> > > Interrupts types are specific to each interrupt controller, but there
> > > is a standard set of flags that, AFAIK, every Linux controller uses. 
> > > These include IRQ_TYPE_EDGE_BOTH, IRQ_TYPE_EDGE_RISING,
> > > IRQ_TYPE_LEVEL_HIGH, and so on.
> > > 
> > > So you can support hardware that is inherently edge or level triggered.
> > 
> > I've been spoken about gpio-controllers and AFAIK there are no edge
> > types. Interrupt-Controller are a different story, as you pointed out
> > above.
> 
> You can use edge triggering with gpios.  Just try writing "rising" or
> "falling" into /sys/class/gpio/gpioX/edge

Can we access the gpios trough the sysfs if they are requested by a
driver?

> It's level you can't do sysfs.  The irq masking necessary isn't
> supported to get it to work in a useful way, i.e. without a live-lock
> IRQ loop.
> 
> But you can in the kernel.
> 
> Normal process is to call gpiod_to_irq() and then use standard IRQF
> flags to select level, edge, etc.

Currently I using the gpiod_to_irq() function to convert the sense gpio
into a irq, but I do some magic to determine the edge. I tought there
might be reasons why there are no edge defines in
include/dt-bindings/gpio/gpio.h.

> > Too fast state changes sounds like a glitch. Anyway, IMHO we should
> 
> Linux has no hard real-time guarantee about interrupt latency, so
> there's no way you can be sure each interrupt is processed before the
> next.
> 
> Trying to track level by interrupting on both edges doesn't work well. 
> You get out of sync and stuck waiting for something that's already
> happened.

Yes, I'm with you. 

> > support support both interrupts and gpios. If the users use gpios they
> > have to poll the gpio, as Guenter pointed out, else we register a
> > irq-handler.
> 
> If gpio(d?)_to_irq returns a valid value, why poll?  It usually works
> to call this.  Plenty of call sites in the kernel that use it and don't
> fallback to polling if it doesn't work.
> 
> I think it's fine to call gpiod_to_irq() and fail if that fails, and
> let a polling fallback be written if and when the need arises.

Okay, so no polling for the current solution. Let me summarize our
solution:
 - no polling (currently)
 - dt-node specifies a gpio instead of a interrupt
   -> gpio <-> irq mapping is done by gpiod_to_irq() and fails if gpio
      doesn't support irq's
 - more alarms per sensor

Only one last thing I tought about:

Using a flat design like you mentioned would lead into a "virtual"
address conflict, since both sensors are on the same level. I tought
about i2c/spi/muxes/graph-devices which don't support such "addressing"
scheme.

hwmon_dev {
	compatible = "gpio-alarm";
	bat@0 {
		reg = <0>;
		label = "Battery Pack1 Voltage";
		type = "voltage";
		alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
		alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
				&gpio3 16 GPIO_ACTIVE_LOW>;
	};
	bat@1 {
		reg = <1>;
		label = "Battery Pack2 Voltage";
		alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
		alarm-gpios = <&gpio3 9 GPIO_ACTIVE_LOW
				&gpio3 1 GPIO_ACTIVE_LOW>;
	};
	cputemp@0 {
		reg = <0>;
		label = "CPU Temperature Critical";
		type = "temperature";
		alarm-type = <GPIO_ALARM_GENRIC>;
		alarm-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
	};
};

Where a more structured layout don't have this "issue".

hwmon_dev {
	compatible = "gpio-alarm";

	voltage {
		bat@0 {
			reg = <0>;
	 		label = "Battery Pack1 Voltage";
			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
			alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
					&gpio3 16 GPIO_ACTIVE_LOW>;
		};
		bat@1 {
			reg = <1>;
	 		label = "Battery Pack2 Voltage";
			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
			alarm-gpios = <&gpio3 9 GPIO_ACTIVE_LOW
					&gpio3 1 GPIO_ACTIVE_LOW>;
		};
	};
	temperature {
		cputemp {
			label = "CPU Temperature Critical";
			alarm-type = <GPIO_ALARM_GENRIC>;
			alarm-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
		};
	};
};

We don't have to take this layout, we can also consider about devices:

hwmon_dev {
	compatible = "gpio-alarm";

	dev@0 {
		reg = <0>;
		voltage {
			label = "Battery Pack1 Voltage";
			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
			alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
					&gpio3 16 GPIO_ACTIVE_LOW>;
		};
		temperature {
			label = "Battery Pack1 Temperature Critical";
			alarm-type = <GPIO_ALARM_GENRIC>;
			alarm-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
		};
	};
	dev@1 {
		reg = <1>;
		temperature {
			label = "CPU Temperature Critical";
			alarm-type = <GPIO_ALARM_GENRIC>;
			alarm-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
		};
	};
};

I don't think that is a issue at all, but I don't know the dt
maintainers opinion of this theme.

Regards,
Marco
