Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48485 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752028AbcISUEP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2016 16:04:15 -0400
Date: Mon, 19 Sep 2016 13:04:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan
 controller
Message-ID: <20160919200413.GA29242@roeck-us.net>
References: <20160919014104.GA30840@roeck-us.net>
 <57E03124.4030202@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57E03124.4030202@raptorengineeringinc.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 19, 2016 at 01:40:36PM -0500, Timothy Pearson wrote:
> On 09/18/2016 08:41 PM, Guenter Roeck wrote:
> >> +Sysfs entries
> >> +-------------
> >> +
> >> +fan[1-6]_input           RO  fan tachometer speed in RPM
> >> +fan[1-6]_fault           RO  fan experienced fault
> >> +fan[1-6]_target          RW  desired fan speed in RPM
> >> +fan[1-6]_control_mode    RW  desired control mode: rpm, pwm, or auto
> > 
> > Please use pwm[]_enable (see API)
> > 
> >> +pwm[1-6]_enable          RW  output enabled, 0=disabled, 1=enabled
> > 
> > Per API: 0 = no fan speed control (full speed), 1 = manual fan speed control
> > enabled (using pwm[1-*]), 2+: automatic fan speed control
> > 
> >> +pwm[1-6]                 RW  fan target duty cycle (0-255)
> 
> This particular device has a per-output PWM disable bit.  How should
> this be handled?  I don't want to globally enable outputs that are not
> connector or may possibly be incorrectly connected depending on hardware
> design.
> 
Not sure I understand. pwm[1-6]_enable = 0 means no fan speed control.
Do you mean the (full speed) comment ? 

Having said that, looking into the datasheet, I see that this is actually
a PMBus device. Why don't you just write a PMBus extension driver for it ?
AFAICS drivers/hwmon/pmbus/max34440.c would come pretty close and could
possibly even be extended to support this chip.

Guenter
