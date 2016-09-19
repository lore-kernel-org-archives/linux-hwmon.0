Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49579 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752292AbcISUFI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2016 16:05:08 -0400
Date: Mon, 19 Sep 2016 13:05:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan
 controller
Message-ID: <20160919200506.GB29242@roeck-us.net>
References: <20160919014104.GA30840@roeck-us.net>
 <57E02B19.6010709@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57E02B19.6010709@raptorengineeringinc.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 19, 2016 at 01:14:49PM -0500, Timothy Pearson wrote:
> On 09/18/2016 08:41 PM, Guenter Roeck wrote:
> > On Sun, Sep 18, 2016 at 07:50:55PM -0500, Timothy Pearson wrote:
> >> Add a basic driver for the MAX31785, focusing on the fan control
> >> features but ignoring the temperature and voltage monitoring
> >> features of the device.
> >>
> >> This driver supports all fan control modes and tachometer / PWM
> >> readback where applicable.
> >>
> > Could you try using hwmon_device_register_with_info() as available in
> > linux-next ? Hopefully that should reduce driver size (and give the new API
> > some test coverage).
> 
> Ordinarily I'd be willing to try this, but in this case I wouldn't be
> able to test the module on real hardware; it's an embedded system and
> uses the 4.7 kernel at the moment.  Would you be OK with merging a fixed
> version of this patch and I can throw together an untested variant using
> hwmon_device_register_with_info() for future work?
> 
After actually looking into the datasheet, I must admit that I don't
understand why you did not model this as a PMBus driver.

Guenter
