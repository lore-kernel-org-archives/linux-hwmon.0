Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:54989 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751209AbdJWWRE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2017 18:17:04 -0400
Date: Mon, 23 Oct 2017 15:17:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Porte <romain.porte@nokia.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [1/2] pmbus: added tps544c20 driver with trimming support
Message-ID: <20171023221702.GD6066@roeck-us.net>
References: <20171020103916.3309-2-romain.porte@nokia.com>
 <20171021162048.GA13173@roeck-us.net>
 <47c2dd13-c357-56fa-6886-08ce6e2b9d92@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c2dd13-c357-56fa-6886-08ce6e2b9d92@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 23, 2017 at 03:34:24PM +0200, Romain Porte wrote:
> On 21/10/2017 18:20, Guenter Roeck wrote:
> >This should be part of device programming in manufacturing, just like,
> >say, current calibration. It should not be user programmable, even less so
> >runtime programmable. On top of that, we definitely don't want to make
> >STORE_USER_ALL available to user space. Both can too easily result in
> >a bricked device (bad enough that the register values are writable using
> >i2cset).
> After some work, I have tested accessing these registers using i2cget and
> i2cset and I can reproduce all the features I have implemented in this
> driver. I think am going to re-implement my calibration procedure using
> i2cget and i2cset in userspace.
> 
> I thought it could be a good idea to make this accessible by sysfs entries.
> Since one must read the datasheet for calibrating the component, I guess it
> is not a big deal to have users to find register addresses/sizes and write
> to them using userspace commands instead of (over?)simplifying it by
> providing dedicated sysfs entries.
> 
Anyone tasked with calibration type work on any chip should _really_ read
the datasheet.

Guenter
