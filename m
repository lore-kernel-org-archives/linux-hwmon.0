Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:53389 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751589AbdJWWPc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2017 18:15:32 -0400
Date: Mon, 23 Oct 2017 15:15:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Porte <romain.porte@nokia.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [1/2] pmbus: added tps544c20 driver with trimming support
Message-ID: <20171023221530.GC6066@roeck-us.net>
References: <20171020103916.3309-2-romain.porte@nokia.com>
 <20171021162048.GA13173@roeck-us.net>
 <d97c57bc-dfe0-74cf-4266-a2f223cc5d24@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97c57bc-dfe0-74cf-4266-a2f223cc5d24@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 23, 2017 at 09:54:26AM +0200, Romain Porte wrote:
> On 21/10/2017 18:20, Guenter Roeck wrote:
> >This should be part of device programming in manufacturing, just like,
> >say, current calibration. It should not be user programmable, even less so
> >runtime programmable. On top of that, we definitely don't want to make
> >STORE_USER_ALL available to user space. Both can too easily result in
> >a bricked device (bad enough that the register values are writable using
> >i2cset).
> My point is that I am exactly using Linux's pmbus implementation in order to
> perform a manufacturing calibration which is indeed a one-time operation.
> 
> I agree that exposing these sysfs entries to end users can be dangerous. It
> can be useful if you actually want to perform a component calibration using
> Linux. Actually I am running an userspace application that does the
> calibration by writing to these sysfs entries. This driver is useful for
> manufacturing calibration and I think can be useful for other Linux users
> who wants to perform this kind of operation too.
> 
> If this driver is dangerous for the end-user, how can we keep the features
> of this driver for manufacturing calibration using Linux? Maybe keep the
> generic driver for normal use and propose this specific driver as 'Advanced
> TPS544C20 driver [DANGER]'?
> 

You can use i2cset for your purpose and still use Linux. There is no need
to have kernel support for it. With that, you can program all registers,
not just a single one.

Guenter
