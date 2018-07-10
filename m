Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:57591 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732287AbeGJX2p (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jul 2018 19:28:45 -0400
Message-ID: <5437584ecc9db993bbba1cc81f70e241a5507023.camel@kernel.crashing.org>
Subject: Re: hwmon driver with misc interface
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>,
        Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jul 2018 09:26:56 +1000
In-Reply-To: <20180710204412.GA26666@roeck-us.net>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
         <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
         <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
         <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
         <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
         <516bc180-624f-3645-7f2d-27397ee720b3@linux.vnet.ibm.com>
         <20180710204412.GA26666@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, 2018-07-10 at 13:44 -0700, Guenter Roeck wrote:
> > > Yes, I think that would be more appropriate.
> > 
> > This still won't work, since then we wouldn't have those attributes
> > available in the P8 version of the driver (which has no fsi-occ driver). In
> > addition, how would the poll response data get from the hwmon driver to the
> > fsi-occ driver? Yet another interface? Seems awkward.
> > 
> > How about debugfs? We don't really mind where the attributes are, just that
> > the data is exposed somewhere...
> > 
> 
> You are essentially confirming that using sysfs attributes would not be
> appropriate. I have no problems with using debugfs; you have a free ride
> there.

I disagree.

If the attributes are used for the normal operation of the system then
they should be in sysfs.

A system should be able to function normally without debugfs mounted.

Those attributes are about monitoring proper operations of the OCC
right ? Or are there other things here ? I don't see any reason why
those couldn't hang off the device sysfs node...

Cheers,
Ben.
