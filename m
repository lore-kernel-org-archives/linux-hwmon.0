Return-path: <jdelvare@suse.de>
Date: Thu, 4 May 2017 10:49:58 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170504104958.45cd6364@endymion>
In-Reply-To: <89d6fe8b-206e-9354-498c-bd5e1e44d3cd@roeck-us.net>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
	<20170312132544.GA17687@roeck-us.net>
	<20170312141522.GL21222@n2100.armlinux.org.uk>
	<20170312142634.GA1917@roeck-us.net>
	<20170321134430.GA3177@roeck-us.net>
	<20170321140812.GZ21222@n2100.armlinux.org.uk>
	<20170321170503.GC13789@roeck-us.net>
	<20170409153806.6dac6bbd@endymion>
	<20170409152407.GB23984@roeck-us.net>
	<20170425153045.0c44641b@endymion>
	<89d6fe8b-206e-9354-498c-bd5e1e44d3cd@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Tue, 25 Apr 2017 06:49:27 -0700, Guenter Roeck wrote:
> On 04/25/2017 06:30 AM, Jean Delvare wrote:
> > I took a look at stable branches v4.9 and v4.10 and I can't find this
> > fix. Do you still plan to check if the fix applies and poke Greg about
> > it? Or do you want me to do it?
> 
> Severe lack of time on my side, sorry. Feel free to do it if you have some slack.

I finally found some time to look into this. The fix applies just fine
to kernel branches 4.9 and 4.10, so I asked stable@ to pick it.

> > (...)
> > But isn't as good as doing the right thing, which would require less
> > code. So I don't really follow your logic.
> 
> Call it paranoia. I have not received feedback if the patch is actually working,
> and I am unable to test it myself. Feel free to send a patch to remove the redundant
> part if you think it should be dropped.

Yes I think, and yes I will.

-- 
Jean Delvare
SUSE L3 Support
