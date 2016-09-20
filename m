Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42714 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751124AbcITT7E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2016 15:59:04 -0400
Date: Tue, 20 Sep 2016 12:59:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan
 controller
Message-ID: <20160920195902.GB1934@roeck-us.net>
References: <20160919014104.GA30840@roeck-us.net>
 <57E03124.4030202@raptorengineeringinc.com>
 <20160919200413.GA29242@roeck-us.net>
 <57E04B25.4000001@raptorengineeringinc.com>
 <20160920005443.GB4064@roeck-us.net>
 <57E093DB.7030000@raptorengineeringinc.com>
 <57E19104.6050907@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57E19104.6050907@raptorengineeringinc.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 20, 2016 at 02:41:56PM -0500, Timothy Pearson wrote:
> On 09/19/2016 07:54 PM, Guenter Roeck wrote:
> >> On 09/19/2016 03:04 PM, Guenter Roeck wrote:
> >> And then you are using all pmbus commands ? Seems odd.
> > 
> > I guess I'l buy an evaluation board if one is available and check if your claim
> > is correct. I am not inclined to accept a non-pmbus driver for a pmbus
> > device without good reason.
> > 
> > Guenter
> 
> Regarding the PMBus driver, I looked over the documentation available
> here: https://www.kernel.org/doc/Documentation/hwmon/pmbus
> 
> From what I can tell PMBus drivers do not support configuring the fan
> control parameters, only monitoring the fan status and speed.  Is this
> correct, and if not where would I find the correct documentation?
> 
So far that wasn't needed. That doesn't mean it can not be added.

I orderd an evaluation board and will likely spend some time on it myself
after I get it.

Guenter
