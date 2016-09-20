Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59539 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753467AbcITAyt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2016 20:54:49 -0400
Date: Mon, 19 Sep 2016 17:54:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan
 controller
Message-ID: <20160920005443.GB4064@roeck-us.net>
References: <20160919014104.GA30840@roeck-us.net>
 <57E03124.4030202@raptorengineeringinc.com>
 <20160919200413.GA29242@roeck-us.net>
 <57E04B25.4000001@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57E04B25.4000001@raptorengineeringinc.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 19, 2016 at 03:31:33PM -0500, Timothy Pearson wrote:
> On 09/19/2016 03:04 PM, Guenter Roeck wrote:
> > On Mon, Sep 19, 2016 at 01:40:36PM -0500, Timothy Pearson wrote:
> > Not sure I understand. pwm[1-6]_enable = 0 means no fan speed control.
> > Do you mean the (full speed) comment ? 
> 
> "no fan speed control (i.e. fan at full speed)".  What I would like to
> see is "fan disabled (PWM turned off)".
> 
> Is that an acceptable use of the "0" value?
> 
> > Having said that, looking into the datasheet, I see that this is actually
> > a PMBus device. Why don't you just write a PMBus extension driver for it ?
> > AFAICS drivers/hwmon/pmbus/max34440.c would come pretty close and could
> > possibly even be extended to support this chip.
> > 
> > Guenter
> 
> The datasheet states that many functions are not available over PMBus.
> Rather than fight with potentially incomplete silicon support for PMBus
> it was easier to simply write this driver.
> 
And then you are using all pmbus commands ? Seems odd.

I guess I'l buy an evaluation board if one is available and check if your claim
is correct. I am not inclined to accept a non-pmbus driver for a pmbus
device without good reason.

Guenter

> -- 
> Timothy Pearson
> Raptor Engineering
> +1 (415) 727-8645 (direct line)
> +1 (512) 690-0200 (switchboard)
> https://www.raptorengineering.com
