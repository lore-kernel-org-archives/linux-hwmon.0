Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:39557 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732263AbeGJUpA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jul 2018 16:45:00 -0400
Received: by mail-pl0-f68.google.com with SMTP id s24-v6so8127253plq.6
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Jul 2018 13:44:15 -0700 (PDT)
Date: Tue, 10 Jul 2018 13:44:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: hwmon driver with misc interface
Message-ID: <20180710204412.GA26666@roeck-us.net>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
 <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
 <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
 <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
 <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
 <516bc180-624f-3645-7f2d-27397ee720b3@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <516bc180-624f-3645-7f2d-27397ee720b3@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 10, 2018 at 03:04:33PM -0500, Eddie James wrote:
> 
> 
> On 07/08/2018 08:26 PM, Guenter Roeck wrote:
> >On 07/08/2018 06:05 PM, Benjamin Herrenschmidt wrote:
> >>On Sun, 2018-07-08 at 16:30 -0700, Guenter Roeck wrote:
> >>>
> >>>Trying to be be reasonable....
> >>>
> >>>Let's make some ground rules.
> >>>
> >>>- Do not attach foreign attributes (not related to hardware
> >>>monitoring) to
> >>>    the hwmon device. Attach foreign attributes to its parent, eg the
> >>>platform
> >>>    or i2c driver, or to a separate (misc ?) device if that is not
> >>>feasible
> >>>    for some reason.
> >>>- Avoid foreign subsystem drivers. If the chip has an input device, a
> >>>watchdog,
> >>>    and a hardware monitor, there should be three drivers.
> >>>    This is to some degree flexible; for example, PMBus drivers may
> >>>register
> >>>    as power regulators, and some chips also have gpio support. But
> >>>what,
> >>>    for example, the applesmc driver does is really not acceptable.
> >>
> >>This rule can be a bit nasty if the various "parts" of the chip need
> >>tight interlock, share an interrupt etc... the solution to that is to
> >>have most of the common code in a "parent" driver that creates child
> >>devices with separate drivers that directly link onto the parent and
> >>use exported functions, but it can easily bloat the driver
> >>significantly for little benefit.
> >>
> >
> >But that is what mfd drivers are for, or am I missing something ?
> >After all, it has "multi-function device" right in its name.
> >
> >Sure, there is somebloat, but on the plus side it ensures that
> >all bits and pieces are reviewed by the respective maintainers,
> >and the cross-functional API is _forced_ to be clean.
> >
> >>That said, this is maybe not *too much* of an issue in the OCC case,
> >>see below.
> >>
> >>>- Private hwmon attributes are acceptable as long as they are clearly
> >>>    documented and explained as necessary. This is not a free ride;
> >>>you should
> >>>    have good reasons for private attributes and be able to explain
> >>>that and why
> >>>    you need them. In this context, "because the hardware provides the
> >>>information"
> >>>    is not a valid reason. The use case is important, not the fact that
> >>>    the hardware provides some random information.
> >>>
> >>>Can you work with that ?
> >>
> >>Anything is always possible :-) The main question for me here is
> >>whether to keep what we do today:
> >>
> >>    * sbefifo (the transport driver)
> >>      |
> >>      * fsi-occ platform driver
> >>             ("passes occ hwmon commands to sbefifo and adds /dev/occ")
> >>              |
> >>              * occ-hwmon
> >>
> >>Or can I collapse fsi-occ and occ-hwmon into one.
> >>
> >>Now /dev/occ is just a "raw" interface to send commands to the OCC, via
> >>the same path occ-hwmon does. There's locking needed there between the
> >>two so it currently happens in fsi-occ.
> >>
> >>>From what you are saying, you prefer that we keep it separate, which is
> >>our current design. I find it a bit messy but it's not a huge deal
> >>frankly, so let's do so.
> >>
> >Other drivers solve that with an API from parent to child, either with
> >a direct function call or with a callback function provided to the child.
> >Another option would be to handle it through regmap; That nowadays
> >supports custom accesses implemented in the parent driver (see regmap_read
> >and regmap_write in struct regmap_config). The child driver gets the
> >regmap pointer and uses the regmap API. I don't see that as messy.
> >
> >>The pre-requisite sbefifo driver is now in Greg's tree (and I'll have
> >>some fixes for it in -next this week), so you should be able to at
> >>least test build when Eddie resubmits.
> >>
> >Ok.
> >
> >>As for the various sysfs files for monitoring the base functionality of
> >>the occ, Eddie, you can always move them to fsi-occ.
> >>
> >
> >Yes, I think that would be more appropriate.
> 
> This still won't work, since then we wouldn't have those attributes
> available in the P8 version of the driver (which has no fsi-occ driver). In
> addition, how would the poll response data get from the hwmon driver to the
> fsi-occ driver? Yet another interface? Seems awkward.
> 
> How about debugfs? We don't really mind where the attributes are, just that
> the data is exposed somewhere...
> 
You are essentially confirming that using sysfs attributes would not be
appropriate. I have no problems with using debugfs; you have a free ride
there.

Guenter
