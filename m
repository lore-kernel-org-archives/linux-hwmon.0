Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38846 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbeJaFGp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 01:06:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id f8-v6so6205351pgq.5
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Oct 2018 13:11:50 -0700 (PDT)
Date: Tue, 30 Oct 2018 13:11:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181030201147.GB28185@roeck-us.net>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
 <20181029143521.22122-3-m.felsch@pengutronix.de>
 <20181029195238.GA24689@roeck-us.net>
 <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
 <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
 <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
 <20181030170026.licamhckbznuvcse@pengutronix.de>
 <1540928050.30311.94.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540928050.30311.94.camel@impinj.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 30, 2018 at 07:34:11PM +0000, Trent Piepho wrote:
> On Tue, 2018-10-30 at 18:00 +0100, Marco Felsch wrote:
> > On 18-10-30 06:13, Guenter Roeck wrote:
> > > On 10/30/18 3:47 AM, Marco Felsch wrote:
> > > > 
> > hwmon-gpio-simple sounds ok for me.
> > 
> > > The most difficult part of such a driver would probably be to define acceptable
> > > devicetree properties.
> > 
> > That's true! One possible solution could be:
> > 
> > hwmon_dev {
> > 	compatible = "hwmon-gpio-simple";
> > 	name = "gpio-generic-hwmon";
> > 	update-interval-ms = 100;
> > 
> > 	hwmon-gpio-simple,dev@0 {
> > 		reg = <0>;
> > 		gpio = <gpio3 15 GPIO_ACTIVE_LOW>;
> > 		hwmon-gpio-simple,type = "in";
> > 		hwmon-gpio-simple,report = "crit_alarm";
> > 	};
> > 
> > 	hwmon-gpio-simple,dev@1 {
> > 		reg = <1>;
> > 		gpio = <gpio3 19 GPIO_ACTIVE_LOW>;
> > 		hwmon-gpio-simple,type = "temp";
> > 		hwmon-gpio-simple,report = "alarm";
> > 	};
> > };
> 
> Here's some options:
> 
> hwmon_dev {
> 	/* Orthogonal to existing "gpio-fan" binding. */
> 	compatible = "gpio-alarm";
> 	/* Standard DT property for GPIO users is [<name>-]gpios */
> 	alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>,
> 	              <&gpio3 19 GPIO_ACTIVE_LOW>;
> 	/* A <prop>-names property is also a DT standard */
>         alarm-gpios-names = "in0", "temp0";

temp1, and it would have to specify which alarm, but, yes, that would
be better.

> };
> 
> The driver can create hwmon alarm attribute(s) based on the name(s).  I
> used "alarm" as it seemed to fit the pattern established by the "fan"
> driver.  Both the gpio-fan and gpio-alarm driver use gpios, but I think
> considering them one driver for that reason does not make sense.
> 
> The names are very Linuxy, something that is not liked in DT bindings. 
> It also doesn't extend well if you need to add more attributes to each
> alarm.  Here's something that's more like what I did for the gpio-leds
> binding.
> 
> hwmon_dev {
> 	compatible = "gpio-alarm";
> 	voltage@0 {
> 		label = "Battery Voltage Low";
> 		type = "voltage";
> 		alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
> 	};
> 	cputemp@0 {
> 		label = "CPU Temperature Critical";
> 		type = "temperature";
> 		interrupt-parent = <&gpio3>;
> 		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> 	};

Even better, though the type of alarm (generic, min, max, lcrit, crit,
cap, emergency, fault) is still needed. That needs to be specified by
some explicit means, not with a label (though having a label is ok).

There could also be more than one alarm per sensor (eg in0_lcrit_alarm,
in0_min_alarm, in0_max_alarm, in0_crit_alarm), all of which would share
a single label. Something like

#define GPIO_ALARM_GENERIC	0
#define GPIO_ALARM_MIN		1
...

	voltage@0 {
		label = "Battery Voltage";
		type = "voltage";
		alarm-type = <GPIO_ALARM_LCRIT, GPIO_ALARM_CRIT>;
		alarm-gpios = <&gpio3 15 GPIO_ACTIVE_LOW
				&gpio3 16 GPIO_ACTIVE_LOW>;
	};

with some better (acceptable) values for "alarm-type" and the actual fields. 

Guenter

> };
> 
> Supporting interrupts instead of just a gpio would allow for edge
> triggering.      
> 
> I can also see that someone might want to create some kind of time
> based hysteresis for circuits that don't have that.  While it would be
> very easy to add a "linux,debounce = <1000>;" property, I imagine that
> would be rejected as configuration in the DT binding.
