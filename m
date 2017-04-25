Return-path: <jdelvare@suse.de>
Date: Tue, 25 Apr 2017 15:30:45 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170425153045.0c44641b@endymion>
In-Reply-To: <20170409152407.GB23984@roeck-us.net>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
	<20170312132544.GA17687@roeck-us.net>
	<20170312141522.GL21222@n2100.armlinux.org.uk>
	<20170312142634.GA1917@roeck-us.net>
	<20170321134430.GA3177@roeck-us.net>
	<20170321140812.GZ21222@n2100.armlinux.org.uk>
	<20170321170503.GC13789@roeck-us.net>
	<20170409153806.6dac6bbd@endymion>
	<20170409152407.GB23984@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Sun, 9 Apr 2017 08:24:07 -0700, Guenter Roeck wrote:
> On Sun, Apr 09, 2017 at 03:38:06PM +0200, Jean Delvare wrote:
> > On Tue, 21 Mar 2017 10:05:03 -0700, Guenter Roeck wrote:
> > > I'll submit the patch as-is upstream; at least it doesn't break anything.
> > > If it doesn't fix your problem, we'll have to look at it again at a later
> > > point.
> > 
> > Given that this patch fixes a regression in kernels v4.7 to v.4.10,
> > shouldn't it go to stable@?
>
> The patch has a Fixes: tag, so that should happen automatically. 
> I'll have to check if it applies cleanly to earlier kernels and if
> necessary send backport(s) to Greg.

I took a look at stable branches v4.9 and v4.10 and I can't find this
fix. Do you still plan to check if the fix applies and poke Greg about
it? Or do you want me to do it?

> > As a side note, I think the second half of the patch is redundant, it
> > only makes registration slightly faster on IT8705F, and could have bad
> > side effects at least in theory. The first half seems sufficient to
> > me...
>
> It only affects systems with two Super-IO chips, and I wanted to play safe. The
> worst side effect I can imagine would be that a second chip in a system with
> IT8705 as first chip would not be accepted, which is not worse than before
> when only one chip was supported.

But isn't as good as doing the right thing, which would require less
code. So I don't really follow your logic.

-- 
Jean Delvare
SUSE L3 Support
