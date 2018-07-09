Return-Path: <benh@kernel.crashing.org>
Return-path: <benh@kernel.crashing.org>
Message-ID: <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
Subject: Re: hwmon driver with misc interface
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James
	 <eajames@linux.vnet.ibm.com>
Date: Mon, 09 Jul 2018 11:05:26 +1000
In-Reply-To: <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
References: 
	<66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
	 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
	 <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, 2018-07-08 at 16:30 -0700, Guenter Roeck wrote:
> 
> Trying to be be reasonable....
> 
> Let's make some ground rules.
> 
> - Do not attach foreign attributes (not related to hardware monitoring) to
>    the hwmon device. Attach foreign attributes to its parent, eg the platform
>    or i2c driver, or to a separate (misc ?) device if that is not feasible
>    for some reason.
> - Avoid foreign subsystem drivers. If the chip has an input device, a watchdog,
>    and a hardware monitor, there should be three drivers.
>    This is to some degree flexible; for example, PMBus drivers may register
>    as power regulators, and some chips also have gpio support. But what,
>    for example, the applesmc driver does is really not acceptable.

This rule can be a bit nasty if the various "parts" of the chip need
tight interlock, share an interrupt etc... the solution to that is to
have most of the common code in a "parent" driver that creates child
devices with separate drivers that directly link onto the parent and
use exported functions, but it can easily bloat the driver
significantly for little benefit.

That said, this is maybe not *too much* of an issue in the OCC case,
see below.

> - Private hwmon attributes are acceptable as long as they are clearly
>    documented and explained as necessary. This is not a free ride; you should
>    have good reasons for private attributes and be able to explain that and why
>    you need them. In this context, "because the hardware provides the information"
>    is not a valid reason. The use case is important, not the fact that
>    the hardware provides some random information.
> 
> Can you work with that ?

Anything is always possible :-) The main question for me here is
whether to keep what we do today:

	* sbefifo (the transport driver)
	  |
	  * fsi-occ platform driver
            ("passes occ hwmon commands to sbefifo and adds /dev/occ")
             |
             * occ-hwmon

Or can I collapse fsi-occ and occ-hwmon into one.

Now /dev/occ is just a "raw" interface to send commands to the OCC, via
the same path occ-hwmon does. There's locking needed there between the
two so it currently happens in fsi-occ.

>From what you are saying, you prefer that we keep it separate, which is
our current design. I find it a bit messy but it's not a huge deal
frankly, so let's do so.

The pre-requisite sbefifo driver is now in Greg's tree (and I'll have
some fixes for it in -next this week), so you should be able to at
least test build when Eddie resubmits.

As for the various sysfs files for monitoring the base functionality of
the occ, Eddie, you can always move them to fsi-occ.

Cheers,
Ben.
