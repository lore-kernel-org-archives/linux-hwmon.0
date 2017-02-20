Return-path: <ckeepax@opensource.wolfsonmicro.com>
Date: Mon, 20 Feb 2017 15:07:43 +0000
From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Lucas Tanure <tanureal@opensource.wolfsonmicro.com>,
        <linux-hwmon@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: How to add nano precision measurement to hwmon
Message-ID: <20170220150743.GA2742@localhost.localdomain>
References: <32c30882-2466-a992-158b-870cc8af5b40@opensource.cirrus.com>
 <3d1fd9fc-9b90-9bb7-3f5d-920c38c8c3c6@roeck-us.net>
 <11f62875-5d58-0282-f329-042f162e4ee6@opensource.cirrus.com>
 <e99ea167-3138-b555-ed62-b3a7b233c7ae@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e99ea167-3138-b555-ed62-b3a7b233c7ae@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Feb 19, 2017 at 08:33:52AM -0800, Guenter Roeck wrote:
> On 02/19/2017 12:53 AM, Lucas Tanure wrote:
> >On 19/02/2017 02:10, Guenter Roeck wrote:
> >>Hi Lucas,
> >>
> >>On 02/17/2017 08:07 AM, Lucas Tanure wrote:
> >Hi Guenter,
> >
> >You don't see any option to expose the 32bit float to user space ?
> >I would rather not deal with float conversion inside the kernel, as the numbers become too large to deal and I lose precision.
> >
> I'd rather not have to deal with one of many float formats in a kernel ABI.
> After all, an ABI is expected to convert from internal formats to standardized
> formats.
> 
> Besides, u32 can report ~4 A in nano-Ampere, and u64 can report 18,446,744,073 A
> in nano-Ampere, so I am not entirely sure I can follow your argument about
> loosing precision.
> 
> Do you plan to submit your driver upstream ? Maybe it would help to see the code.

I have to say I think I agree with Guenter here exposing random binary
stuff in sysfs is not nice and if the user side stuff can actually
be configured to correctly handle us reporting nA that seems like a
no-brainer.

We do intend to upstream the driver, there is some support for the
device in general that I need to upstream first, then Lucas can send
up the hwmon stuff.

Thanks,
Charles
