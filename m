Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33102 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752300AbeAaP5O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Jan 2018 10:57:14 -0500
Received: by mail-pf0-f195.google.com with SMTP id t5so13059258pfi.0
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2018 07:57:14 -0800 (PST)
Date: Wed, 31 Jan 2018 07:57:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Bargen <mail@dbrgn.ch>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        andreas.brauchli@sensirion.com
Subject: Re: [PATCH] hwmon: (sht21) Don't use clock stretching
Message-ID: <20180131155712.GA21986@roeck-us.net>
References: <20180126233731.19127-1-mail@dbrgn.ch>
 <54a9981f-71fe-d332-8364-7bfb88eed2b3@roeck-us.net>
 <20180131153923.3df073df@adalbert.office.threema.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180131153923.3df073df@adalbert.office.threema.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jan 31, 2018 at 03:39:23PM +0100, Danilo Bargen wrote:
> Hello Guenter
> 
> Thank you for your fast review!
> 
> > The driver must now support I2C_FUNC_I2C which is a significant change in functionality
> > since it will no longer work on SMBus-only adapters.
> 
> You are right of course, I wasn't aware of that.
> 
> > You'll have to find a better
> > solution, one that retains the old functionality but also works on the Raspberry Pi.
> 
> What are my options? A separate driver (sht21nhm) would probably not be accepted, right?
> 
One option would be to implement access functions differently if clock
stretching is known to not work. That would, however, require infrastructure
support since the controller driver should tell the chip driver that it doesnot
support clock stretching.

> Or should I instead try to submit it to the Raspberry Pi kernel tree directly?
> 
> > FWIW, this should really be solved in the infrastructure. Many devices support and
> > depend on clock stretching, and we can not mess up the drivers for all those devices
> > to deal with a broken adapter.
> 
> Could you elaborate what you mean with "in the infrastructure"? Could there be a
> way to solve this on the i2c / adapter driver level?
> 
As mentioned above, this is really a i2c controller driver issue. If the
controller driver does not support clock stretching, it should tell chip drivers
about it. There should also be infrastructure support to support "simulated"
clock stretching; otherwise each and every chip driver who needs it would have
to re-implement the same set of hacks.

> An interesting sidenote is that the driver used to work on the Raspberry Pi with
> older kernel versions, but not on current ones. (I'd have to look up the exact
> versions, but I think it changed sometime last year.) Maybe something about the
> timing was changed that broke clock stretching.
> 
Wouldn't it make sense then to track down the patch which introduced the problem
and fix the underlying issue instead of working around it ?

Guenter

> > Has this been discussed on the i2c mailing list ?
> 
> I did not submit a discussion so far, and the mailing list search did not
> turn up anything related. Should I start a discussion there?
> 
> Cheers and thanks for your time,
> Danilo Bargen
