Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36697 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbcFXUTh (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 16:19:37 -0400
Date: Fri, 24 Jun 2016 13:19:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Andrew F. Davis" <afd@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] hwmon: Add support for INA3221 Triple
 Current/Voltage Monitors
Message-ID: <20160624201934.GB18324@roeck-us.net>
References: <20160610153233.6169-1-afd@ti.com>
 <20160610153233.6169-2-afd@ti.com>
 <20160610164435.GA9125@roeck-us.net>
 <5764860E.1040305@ti.com>
 <576565DB.5040007@roeck-us.net>
 <576D4B9B.8030503@ti.com>
 <20160624164651.GB21447@roeck-us.net>
 <576D6E50.6000604@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576D6E50.6000604@ti.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 24, 2016 at 12:30:56PM -0500, Andrew F. Davis wrote:
> On 06/24/2016 11:46 AM, Guenter Roeck wrote:
> > On Fri, Jun 24, 2016 at 10:02:51AM -0500, Andrew F. Davis wrote:
> >> On 06/18/2016 10:16 AM, Guenter Roeck wrote:
> >>>
> >>> The chip registers are 16 bit. Can you repeat the command using the "w"
> >>> option ?
> >>>
> >>
> >> # i2cdump -y 2 0x40 w
> >>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> >> 00: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> 08: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> 10: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> 18: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> 20: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> 28: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> 30: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> 38: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> 40: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> 48: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> 50: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> 58: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> 60: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> 68: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> 70: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> 78: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> 80: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> 88: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> 90: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> 98: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> a0: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> a8: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> b0: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> b8: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> c0: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> c8: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> d0: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> d8: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> >> e0: 2771 0000 0000 0000 0000 0000 0000 f87f
> >> e8: f87f f87f f87f f87f f87f 0000 fe7f 0300
> >> f0: 1027 2823 ffff ffff ffff ffff ffff ffff
> >> f8: ffff ffff XXXX f8f8 ffff ffff 4954 2032
> > 
> > Thanks a lot!
> > 
> 
> Feel free to completely ignore the first register dump I sent, I did it
> for the wrong device anyway :).
> 
> I had just gotten done reading this:
> https://lkml.org/lkml/2015/12/10/459
> and accidentally got EVMs confused did the test for the TMP461, but it
> does look like on startup register 0x16 can be used to differentiate the
> parts, if the TMP461 hadn't gone into a different driver.
> 
Good catch.

That makes me wonder if we should move tmp461 support to the lm90 driver.
What do you think ? Problem is that tmp461 will be auto-detected as tmp451
by the lm90 driver, which is less than perfect.

My test script for ina3221 only accepts a single value - 16380 - for the
limit registers. Seems odd. I'll have to look into it some more.

Guenter
