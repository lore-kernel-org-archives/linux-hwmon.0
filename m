Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44243 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbeKBPym (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Nov 2018 11:54:42 -0400
Date: Fri, 2 Nov 2018 07:48:31 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181102064831.rp7iucpzi753jjw3@pengutronix.de>
References: <20181029195238.GA24689@roeck-us.net>
 <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
 <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
 <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
 <20181030170026.licamhckbznuvcse@pengutronix.de>
 <1540928050.30311.94.camel@impinj.com>
 <20181030201147.GB28185@roeck-us.net>
 <20181101104059.em3bvpdzo2bsyazy@pengutronix.de>
 <1541094101.30311.140.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541094101.30311.140.camel@impinj.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 18-11-01 17:41, Trent Piepho wrote:
> On Thu, 2018-11-01 at 11:40 +0100, Marco Felsch wrote:
> > On 18-10-30 13:11, Guenter Roeck wrote:
> > > On Tue, Oct 30, 2018 at 07:34:11PM +0000, Trent Piepho wrote:
> > > > 
> > > 	voltage@0 {
> > 
> > 		reg = <0>;
> > 
> > I remember that we have to add a reg property if we want to use xyz@0.
> 
> Kernel disables that dtc warning, but still seems good to follow that
> rule.

Yes, but the maintainers won't confirm it without the reg property.

> > > with some better (acceptable) values for "alarm-type" and the actual fields. 
> > 
> > Should we use the @<reg> suffix to map it to in<reg>_*_alarm or should
> > we do something like that:
> 
> Usually the node name, e.g. "node@0", isn't used at all by the driver. 
> It's arbitrary, so the dt author can name it what they want.

Thats true, but we have to use that convention to conform the DT if we
want to use the reg property.

> I've used to identify a device in a udev rule.  So I can have a rule
> that acts on a device based on what I want the device to do, rather
> than what bus and address the device happens to be on.  The latter are
> subject to change based on other devices, SoC pinmuxing, board routing,
> etc.
> 
> Using the "reg" property to identify the input/temp/fan number seems
> totally appropriate to me.

Okay.

> > 
> > hwmon_dev {
> > 	compatible = "gpio-alarm";
> > 
> > 	voltage {
> 
> I think you'd need something like type = "voltage" here instead of
> using the node name.
> 
> > 		bat@0 {
> > 			reg = <0>;
> > 	 		label = "Battery Pack1 Voltage";
> > 		};
> > 
> > 		bat@1 {
> > 			reg = <1>;
> > 	 		label = "Battery Pack2 Voltage";
> > 		};
> > 	};
> 
> Seems better to me to have the flatter tree with each alarm having a
> "type" attribute rather than grouping them by type.

I'm open minded. Guenter what's your prefered solution?

> Usually the tree structure of a DT is meant to show a "contains"
> relationship, one present in the actual hardware.  A bus with devices
> behind it.  Lines attached to controller.  If I've got three op-amps on
> GPIOs, two measuring voltage rails and the third on a thermistor, then
> IMHO all three are peers.  The hardware design doesn't group the two
> voltage rail op-amps in some way that excludes the thermistor op-amp.
> 
> 
> > Now the subnodes imply the type. Since the hwmon-gpio-simple should
> > work interrupt driven all the time we should replace the alarm-gpios by
> 
> Not all GPIOs can generate interrupts.  It would be an unfortunate
> hardware design to use such a GPIO for this.  Seems ok to me to defer
> that problem to the poor sod who needs to support such hardware if it
> ever exists.

Please look at the other mails. It's important for Guenter to support
the non-interrupt case too. It shouldn't be a big deal to implement both
cases.

Marco
