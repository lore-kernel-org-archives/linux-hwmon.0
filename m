Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36843 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbeJaFIK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 01:08:10 -0400
Received: by mail-pl1-f195.google.com with SMTP id y11-v6so6104571plt.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Oct 2018 13:13:15 -0700 (PDT)
Date: Tue, 30 Oct 2018 13:13:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Message-ID: <20181030201309.GC28185@roeck-us.net>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
 <20181029143521.22122-3-m.felsch@pengutronix.de>
 <20181029195238.GA24689@roeck-us.net>
 <1540847798.30311.47.camel@impinj.com>
 <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
 <1540925347.30311.65.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540925347.30311.65.camel@impinj.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 30, 2018 at 06:49:07PM +0000, Trent Piepho wrote:
> On Mon, 2018-10-29 at 18:12 -0700, Guenter Roeck wrote:
> > On 10/29/18 2:16 PM, Trent Piepho wrote:
> > > 
> > > If we ignore the ability to stop other devices, how is this not a hwmon
> > > device with just alarm features?
> > > 
> > 
> > Possibly, but the ability to stop other devices is at the core of the driver
> > as submitted.
> 
> I was thinking along the lines of a driver for gpio based hardware
> alarms, that did not include the device stop feature.  Would that also
> be quickly NACKed?
> 
I think we are beyond that.

Guenter

> > > I2C/LPC/SPI interface was not connected as an appropriate master was
> > > not available, and the default configuration of the chip was
> > > acceptable.  The chip's alarm outputs are connected to GPIOs, as it
> > > normal for a hwmon chip with alarm outputs.
> > > 
> > 
> > "If we had" is theory. Do we ? We don't usually add code to the kernel
> > just in case the hardware it supports might be out there.
> 
> What I was trying to do was reach the conclusion that a gpio hardware
> alarm as a hwmon driver is appropriate via clear steps.
> 
> A classic hwmon chip should have a hwmon driver.  We all accept that.
> 
> Disconnect i2c interface, keep alarms, does the kernel interface need
> to change?  Seems clear to me the answer is no, should still be hwmon.
> 
> Replace chip with discrete logic, e.g. an op amp and a few resistors
> serving as a voltage comparator, which has the same behavior as the 
> hwmon chip as far as the rest of the system is concerned.  Does the
> kernel interface need to change now?  Again, seems like it shouldn't
> change.
> 
> > 
> > For voltage monitoring, that is not normally the case. It is much more likely
> > that there is in fact a hardware monitoring or power control chip, the
> > (or an) alarm output of that chip is connected to a gpio line, and its control
> > interface is connected. If so, the driver for that chip should be enhanced
> > to support interrupts, and to report the status with its own sysfs attributes.
> 
> I agree that writing a specialized driver that pretends a hwmon chip
> with a control interface is just a gpio wouldn't be appropriate as an
> upstreamable driver for the kernel.  It's more of a one off hack of
> expediency.
> 
> But it's pretty easy to make a voltage alarm circuit with an op amp. 
> Even a differential temperature sensor with hysteresis is just a few
> components.
> 
> Would a hwmon driver for this be unacceptable?
