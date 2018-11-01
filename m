Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33158 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbeKBARy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Nov 2018 20:17:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id i62-v6so1625158pfi.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Nov 2018 08:14:31 -0700 (PDT)
Date: Thu, 1 Nov 2018 08:14:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Trent Piepho <tpiepho@impinj.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181101151428.GB25346@roeck-us.net>
References: <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
 <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
 <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
 <20181030170026.licamhckbznuvcse@pengutronix.de>
 <1540928050.30311.94.camel@impinj.com>
 <20181030201147.GB28185@roeck-us.net>
 <20181101104059.em3bvpdzo2bsyazy@pengutronix.de>
 <e9a896c8-0025-5c4c-d1ee-ab599320fac0@roeck-us.net>
 <20181101145312.wadkj5u2rlr5ewdq@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181101145312.wadkj5u2rlr5ewdq@pengutronix.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 01, 2018 at 03:53:12PM +0100, Marco Felsch wrote:
> On 18-11-01 06:01, Guenter Roeck wrote:
> > On 11/1/18 3:40 AM, Marco Felsch wrote:
> > > On 18-10-30 13:11, Guenter Roeck wrote:
> > > > On Tue, Oct 30, 2018 at 07:34:11PM +0000, Trent Piepho wrote:
> > > > > On Tue, 2018-10-30 at 18:00 +0100, Marco Felsch wrote:
> > > > > > On 18-10-30 06:13, Guenter Roeck wrote:
> > > > > > > On 10/30/18 3:47 AM, Marco Felsch wrote:
> > > > > > > > 
> > > > > > hwmon-gpio-simple sounds ok for me.
> > > > > > 
> > > > > > > The most difficult part of such a driver would probably be to define acceptable
> > > > > > > devicetree properties.
> > > > > > 
> > > > > > That's true! One possible solution could be:
> > > > > > 
> > > > > > hwmon_dev {
> > > > > > 	compatible = "hwmon-gpio-simple";
> > > > > > 	name = "gpio-generic-hwmon";
> > > > > > 	update-interval-ms = 100;
> > > > > > 
> > > > > > 	hwmon-gpio-simple,dev@0 {
> > > > > > 		reg = <0>;
> > > > > > 		gpio = <gpio3 15 GPIO_ACTIVE_LOW>;
> > > > > > 		hwmon-gpio-simple,type = "in";
> > > > > > 		hwmon-gpio-simple,report = "crit_alarm";
> > > > > > 	};
> > > > > > 
> > > > > > 	hwmon-gpio-simple,dev@1 {
> > > > > > 		reg = <1>;
> > > > > > 		gpio = <gpio3 19 GPIO_ACTIVE_LOW>;
> > > > > > 		hwmon-gpio-simple,type = "temp";
> > > > > > 		hwmon-gpio-simple,report = "alarm";
> > > > > > 	};
> > > > > > };
> > > > > 
> > > > > Here's some options:
> > > > > 
> > > > > hwmon_dev {
> > > > > 	/* Orthogonal to existing "gpio-fan" binding. */
> > > > > 	compatible = "gpio-alarm";
> > > > > 	/* Standard DT property for GPIO users is [<name>-]gpios */
> > > > > 	alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>,
> > > > > 	              <&gpio3 19 GPIO_ACTIVE_LOW>;
> > > > > 	/* A <prop>-names property is also a DT standard */
> > > > >          alarm-gpios-names = "in0", "temp0";
> > > > 
> > > > temp1, and it would have to specify which alarm, but, yes, that would
> > > > be better.
> > > > 
> > > > > };
> > > > > 
> > > > > The driver can create hwmon alarm attribute(s) based on the name(s).  I
> > > > > used "alarm" as it seemed to fit the pattern established by the "fan"
> > > > > driver.  Both the gpio-fan and gpio-alarm driver use gpios, but I think
> > > > > considering them one driver for that reason does not make sense.
> > > > > 
> > > > > The names are very Linuxy, something that is not liked in DT bindings.
> > > > > It also doesn't extend well if you need to add more attributes to each
> > > > > alarm.  Here's something that's more like what I did for the gpio-leds
> > > > > binding.
> > > > > 
> > > > > hwmon_dev {
> > > > > 	compatible = "gpio-alarm";
> > > > > 	voltage@0 {
> > > > > 		label = "Battery Voltage Low";
> > > > > 		type = "voltage";
> > > > > 		alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
> > > > > 	};
> > > > > 	cputemp@0 {
> > > > > 		label = "CPU Temperature Critical";
> > > > > 		type = "temperature";
> > > > > 		interrupt-parent = <&gpio3>;
> > > > > 		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> > > > > 	};
> > > > 
> > > > Even better, though the type of alarm (generic, min, max, lcrit, crit,
> > > > cap, emergency, fault) is still needed. That needs to be specified by
> > > > some explicit means, not with a label (though having a label is ok).
> > > 
> > > Thanks for your ideas, looks quite nice.
> > > 
> > > > There could also be more than one alarm per sensor (eg in0_lcrit_alarm,
> > > > in0_min_alarm, in0_max_alarm, in0_crit_alarm), all of which would share
> > > > a single label. Something like
> > > > 
> > > > #define GPIO_ALARM_GENERIC	0
> > > > #define GPIO_ALARM_MIN		1
> > > > ...
> > > > 
> > > > 	voltage@0 {
> > > 
> > > 		reg = <0>;
> > > 
> > > I remember that we have to add a reg property if we want to use xyz@0.
> > > 
> > > > 		label = "Battery Voltage";
> > > > 		type = "voltage";
> > > > 		alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > > > 		alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
> > > > 				&gpio3 16 GPIO_ACTIVE_LOW>;
> > > > 	};
> > > > 
> > > > with some better (acceptable) values for "alarm-type" and the actual fields.
> > > 
> > > Should we use the @<reg> suffix to map it to in<reg>_*_alarm or should
> > > we do something like that:
> > > 
> > > hwmon_dev {
> > > 	compatible = "gpio-alarm";
> > > 
> > > 	voltage {
> > > 		bat@0 {
> > > 			reg = <0>;
> > > 
> > > 	 		label = "Battery Pack1 Voltage";
> > > 			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > > 			interrupt-parent = <&gpio3>;
> > > 			interrupts = <15 IRQ_TYPE_LEVEL_LOW>,
> > > 				     <16 IRQ_TYPE_EDGE_RISING>;
> > > 		
> > > 		};
> > > 
> > > 		bat@1 {
> > > 			reg = <1>;
> > > 
> > > 	 		label = "Battery Pack2 Voltage";
> > > 			alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
> > > 			interrupts-extended = <&gpio3 17 IRQ_TYPE_EDGE_FALLING>,
> > > 					      <&gpio4 18 IRQ_TYPE_EDGE_FALLING>;
> > > 		
> > > 		};
> > > 	};
> > > 
> > > 	temperature {
> > > 		cputemp {
> > > 			label = "CPU Temperature Critical";
> > > 			alarm-type = <GPIO_ALARM_CRIT>;
> > > 			interrupt-parent = <&gpio3>;
> > > 			interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> > > 		};
> > > 	};
> > > };
> > > 
> > Works for me.
> > 
> > > Now the subnodes imply the type. Since the hwmon-gpio-simple should
> > > work interrupt driven all the time we should replace the alarm-gpios by
> > > the interrupt property, so we can use the already existing EDGE
> > > flags, as Trent mentoined. Otherwise we have to asume if
> > > the gpio is low-active then the interrupt should be triggered on a
> > > falling edge.
> > > 
> > 
> > Isn't that configurable with devicetree flags ? I don't think a driver
> > should get involved in deciding the active edge.
> 
> No, AFAIK we can only specify the active level types for gpios. This
> made sense to me, because I saw no gpio-controller which support
> 'edge-level' reporting (however it will be called) currently.
> 
> Deciding the edge within the driver was/is the only solution is found
> currently, but I'm with you, thats a bit stupid. I open minded for other
> solutions.
> 
Thinking about it, interrupts should be triggered on both edges for this
to work. Reason is that we want to report all pin status changes to
userspace. Otherwise userspace would have to poll anyway.

Guenter

> Marco
> 
> > Guenter
> > 
> > 
> > > Marco
> > > 
> > > > Guenter
> > > > 
> > > > > };
> > > > > 
> > > > > Supporting interrupts instead of just a gpio would allow for edge
> > > > > triggering.
> > > > > 
> > > > > I can also see that someone might want to create some kind of time
> > > > > based hysteresis for circuits that don't have that.  While it would be
> > > > > very easy to add a "linux,debounce = <1000>;" property, I imagine that
> > > > > would be rejected as configuration in the DT binding.
> > > 
> > 
> > 
