Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59813 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdEATQL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 May 2017 15:16:11 -0400
Date: Mon, 1 May 2017 12:16:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: Enabling enhanced acoustics on adt7475
Message-ID: <20170501191605.GA17410@roeck-us.net>
References: <5b96df9d2ea649daa5f5b8a3896280c4@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b96df9d2ea649daa5f5b8a3896280c4@svr-chch-ex1.atlnz.lc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, May 01, 2017 at 08:45:14AM +0000, Chris Packham wrote:
> Hi,
> 
> I'm looking at adding code to configure the enhanced acoustics on the 
> ADT7475 and compatible devices.
> 
> I'm wondering if I should be adding these as device-tree properties or 
> as sysfs attributes. And in either case how these properties/attributes 
> should behave. The main impact of this would be to provide a mechanism 
> for configuring how fast the pwm output will change.
> 
> The fact that I wrote "configuring" above makes me lean towards sysfs 
> attributes. Nothing in Documentation/hwmon/sysfs-interface really covers 

Definitely. This does not describe hardware.

> this. dme1737.c has a pwmN_ramp_rate which would seem close to what I 
> want. Is there any other precedent I should follow?
> 
There is pwmX_step but that does not describe a ramp rate in time.
dme1737.c indeed seems to be the closest match. Nothing else I can think of.

Guenter
