Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55301 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753127AbdGLPKs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2017 11:10:48 -0400
Date: Wed, 12 Jul 2017 08:10:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
        mspinler@linux.vnet.ibm.com
Subject: Re: [RFC PATCH 2/4] pmbus: Add fan configuration support
Message-ID: <20170712151045.GA19238@roeck-us.net>
References: <20170710135618.13661-1-andrew@aj.id.au>
 <20170710135618.13661-3-andrew@aj.id.au>
 <196d7c83-c5fd-cb85-e7bb-2f1a5ba189ae@roeck-us.net>
 <1499819983.4935.7.camel@aj.id.au>
 <208cece7-ee95-c162-82aa-09f35a8d384f@roeck-us.net>
 <1499842869.4935.11.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499842869.4935.11.camel@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 12, 2017 at 04:31:09PM +0930, Andrew Jeffery wrote:
> 
> Indeed. Hence RFC in case I had overlooked something :) Clearly I have.
> 
Not surprising. It isn't exceptionally well documented :-)

> > 
> > > However, the addition of the callbacks was driven by the behaviour of
> > > the MAX31785, where some values written to PMBUS_FAN_COMMAND_1 trigger
> > > automated control, while others retain manual control. Patch 4/4 should
> > > provide a bit more context, though I've also outlined the behaviour in
> > > the commit message for this patch. I don't have a lot of experience
> > > with PMBus devices so I don't have a good idea if there's a better way
> > > to capture the behaviour that isn't so unconstrained in its approach.
> > > 
> > 
> > Many pmbus commands have side effects. I don't see how an explicit callback
> > would be different to overloading a standard register or to providing a virtual
> > register/command, whichever is more convenient.
> 
> I'm going to experiment with the virtual registers. From your
> description above and looking at the comments in pmbus.h I think I can
> make something work (and drop the callbacks).
> 
Excellent.

> 
> Sure. FWIW I plan on sending a follow-up RFC based on the feedback
> you've given here, and I'll look to chop out pmbus_fan_ctrl. I was
> suspicious of needing it as well, but was after your input on the
> general approach and figured sending the patches was better than
> guessing at your potential feedback.
> 
> If a follow-up isn't of interest and you'd definitely rather take on
> the work up yourself, let me know.
> 

By all means, please go ahead. I got way too much on my plate already.

Thanks,
Guenter
