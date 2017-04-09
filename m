Return-path: <jdelvare@suse.de>
Date: Sun, 9 Apr 2017 15:38:06 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170409153806.6dac6bbd@endymion>
In-Reply-To: <20170321170503.GC13789@roeck-us.net>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
	<20170312132544.GA17687@roeck-us.net>
	<20170312141522.GL21222@n2100.armlinux.org.uk>
	<20170312142634.GA1917@roeck-us.net>
	<20170321134430.GA3177@roeck-us.net>
	<20170321140812.GZ21222@n2100.armlinux.org.uk>
	<20170321170503.GC13789@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Tue, 21 Mar 2017 10:05:03 -0700, Guenter Roeck wrote:
> I'll submit the patch as-is upstream; at least it doesn't break anything.
> If it doesn't fix your problem, we'll have to look at it again at a later
> point.

Given that this patch fixes a regression in kernels v4.7 to v.4.10,
shouldn't it go to stable@?

As a side note, I think the second half of the patch is redundant, it
only makes registration slightly faster on IT8705F, and could have bad
side effects at least in theory. The first half seems sufficient to
me...

-- 
Jean Delvare
SUSE L3 Support
