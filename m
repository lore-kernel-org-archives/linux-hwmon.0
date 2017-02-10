Return-path: <chunkeey@googlemail.com>
From: Christian Lamparter <chunkeey@googlemail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH 2/2] hwmon: lm90: integration of channel map in dt-bindings
Date: Fri, 10 Feb 2017 21:44:53 +0100
Message-ID: <1500345.XcJ59yDJ4W@debian64>
In-Reply-To: <20170210172106.GA13576@roeck-us.net>
References: <2979642.2YCYMDeKdL@debian64> <bda1ec86d68fe6b78c04c7dec7eb3c63c0850a97.1486741517.git.chunkeey@googlemail.com> <20170210172106.GA13576@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-hwmon@vger.kernel.org>

On Friday, February 10, 2017 9:21:06 AM CET Guenter Roeck wrote:
> On Fri, Feb 10, 2017 at 05:12:30PM +0100, Christian Lamparter wrote:
> > This patch integrates the LOCAL, REMOTE and REMOTE2
> > channel definitions into the lm90.c driver.
> > 
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> > This is an optional patch to showcase how the channel definition
> > in the dt-bindings are mapped into the driver.
> > In theory, this makes it possible to easily remap the channel
> > indices. However, it does make the driver harder to read.
> 
> It also makes the driver dependent on external defines which are not controlled
> by the driver. If anyone changes those defines to be non-sequential or to not
> start with 0, we would be in trouble. Sure, that might and likely would result
> in compile errors, but still ...
Yes, gcc will complain with "array out of bounds errors" if any
of the LM90_SENSORS_ defines are less than 0 or higher than 2.
This is because of: static const u8 lm90_temp_index[3] and 
lm90_temp_min_index, ...

The BUILD_BUG_ON(LOCAL == REMOTE || ... || REMOTE2 == LOCAL) will
prevent duplicated values so LOCAL, REMOTE, REMOTE2 have to be
different.

> Besides, it is not complete. Anyone changing channel index values would
> (at least) mess up alarm bit association.
Yes, that's true. I missed lm90_is_tripped. But...

> If we want to do that kind of thing, it might make more sense to add some code
> to provide the desired mapping to the hwmon core, and to let the hwmon core
> handle it. No idea if that is even possible, though.
> 
> Is that really worth it ?
No, it's not worth it ;-). But thank you for your in-depth
analysis. So, let's leave it with just the first patch for
4.12-ish.

Regards,
Christian
