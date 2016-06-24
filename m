Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53699 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbcFXSSf (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 24 Jun 2016 14:18:35 -0400
Date: Fri, 24 Jun 2016 11:18:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nishanth Menon <nm@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (tmp102) Use devm_add_action to register
 cleanup function
Message-ID: <20160624181827.GA11632@roeck-us.net>
References: <1466728108-2512-1-git-send-email-linux@roeck-us.net>
 <576D401D.80700@ti.com>
 <576D4421.8080704@roeck-us.net>
 <576D49AA.8020406@roeck-us.net>
 <576D505E.3020308@ti.com>
 <20160624163604.GA21447@roeck-us.net>
 <576D75B8.2050406@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576D75B8.2050406@ti.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 24, 2016 at 01:02:32PM -0500, Nishanth Menon wrote:
> On 06/24/2016 11:36 AM, Guenter Roeck wrote:
> > On Fri, Jun 24, 2016 at 10:23:10AM -0500, Nishanth Menon wrote:
> >> On 06/24/2016 09:54 AM, Guenter Roeck wrote:
> >>> On 06/24/2016 07:30 AM, Guenter Roeck wrote:
> >>>> Hi Nishanth,
> >>>>
> >>>> On 06/24/2016 07:13 AM, Nishanth Menon wrote:
> >>>>> On 06/23/2016 07:28 PM, Guenter Roeck wrote:
> >>>>>> By registering a cleanup function with devm_add_action(), we can
> >>>>>> simplify the error path in the probe function and drop the remove
> >>>>>> function entirely.
> >>>>>>
> >>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>>>>
> >>>>> I dont seem to have a cover letter to reply to... but anyways..
> >>>>>
> >>>>> Before: http://pastebin.ubuntu.com/17801376/
> >>>>> After all 5 patches: http://pastebin.ubuntu.com/17801824/
> >>>>>
> >>>>> Fails on beagleboard-X15 with:
> >>>>> [   36.781509] tmp102 0-0048: No cache defaults, reading back from HW
> >>>>> [   36.795940] tmp102 0-0048: unexpected config register value
> >>>>>
> >>>>> I have'nt bisected down on the specific patch in the series. Have you had a chance to test the series?
> >>>>>
> >>>>>
> >>>>
> >>>> Thanks for testing. Yes, I did test it. Maybe different chip revisions, or different
> >>>> initial config register values and I messed up there. Can you send me the output
> >>>> of i2cdump (word wide) ?
> >>>>
> >>>
> >>> Before 5 patches:
> >>>> # i2cdump -f 0 0x48 w
> >>>>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> >>>> 00: 7912 b062 004b 0050 c018 e006 0000 0000 
> > 
> > [ ... ]
> >>>
> >>> After 5 patches:
> >>>>  i2cdump -y 0 0x48 w
> >>>>      0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> >>>> 00: 5024 a060 004b 0050 c018 e006 0000 0000 
> > 
> > [ .... ]
> > 
> >> I can try and debug the series once I get some spare time, might be
> >> over the weekend or next week.
> > 
> > The register map, at least the initial one, is pretty much the same as mine
> > and as expected. The configuration register in the second map is messed up,
> > possible because of a write with wrong endianness.
> 
> Got a few mins skipping lunch.. ;)
> 
> I did a quick bisect, and it is indeed the patch #5 that breaks.
> added http://pastebin.ubuntu.com/17812044/ and got:
> 
> tmp102 0-0048: regval = 0x0000ffff
> 
> That was weird. Does'nt look like endian-ness swap thingy
> 
> So, did the following hack to see all messages flowing in and out from
> 0x48 at bus controller driver level: http://pastebin.ubuntu.com/17813093/
> / # dmesg|grep XXX
> / #
> 
> Before patch #5 (and on next-20160624):
> the same diff gave:
> http://pastebin.ubuntu.com/17813303/
> 
> 
> 
> > I bet the regmap_read() of the configuration register returns 0xa060 (or
> > 0xb062) instead of 0x60a0 / 0x62b0 on your system. If you find the time,
> > it would be great if you can confirm by printing the register value with
> > the "unexpected config register value" message (guess I should have left
> > that in place - I used it during testing ;-).
> > 
> > If that is the case, I'll probably have to drop the regmap changes, at least
> > for now. It would mean that regmap is broken for chips like the LM75 (ie
> > for all chips with 16-bit registers) on controllers supporting I2C_FUNC_I2C.
> 
> It does look like everything is getting cached out and no actual reads
> are actually getting through to the bus controller driver even.
> 
Yes, that is really weird. It also seems to fill the cache with 0xffff,
which is even more weird.

Ok, looks like converting drivers to regmap isn't a good idea. I'll need
to get a system with an adapter supporting I2C_FUNC_I2C and do some more
testing.

> I tested on next-20160624 and used omap2plus_defconfig for the test.
> 

Thanks a lot for the information, and for testing this with your system.

Guenter
