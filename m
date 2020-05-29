Return-Path: <SRS0=nzsd=7L=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C046AC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 May 2020 13:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99BD5207BC
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 May 2020 13:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgE2NmB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 May 2020 09:42:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:32824 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgE2NmA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 May 2020 09:42:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 5EBE9AF4F;
        Fri, 29 May 2020 13:41:58 +0000 (UTC)
Date:   Fri, 29 May 2020 15:41:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200529154157.18a5e4b5@endymion>
In-Reply-To: <20200529001858.GP252930@magnolia>
References: <20200526112259.4356fb2f@endymion>
        <20200527224252.GB89212@roeck-us.net>
        <20200527233334.GL252930@magnolia>
        <20200528120256.63023d63@endymion>
        <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
        <20200529001858.GP252930@magnolia>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 28 May 2020 17:18:58 -0700, Darrick J. Wong wrote:
> I vaguely remember that the adt7470 temperature inputs were connected to
> the CPU, and the PWM outputs were connected to the CPU heatsink fans.
> The BIOS appeared to set up the adt7470 for automatic thermal management
> (i.e. when you cranked all four cores of the machine to maximum) it
> would gradually raise the CPU fan speed, like you'd expect.
> 
> The reality (again, vaguely remembered) was that the chip wouldn't run
> its pwm control loop unless *something* poked it to reread the
> temperature sensors.  A different model of the same machine had a BMC
> which would talk to the adt7470 over i2c and take care of that.

That I understand, and while it is poor design in my opinion, it makes
sense to some degree.

> The other problem was that /some/ of the machines for whatever reason
> would adjust the pwm value that you could read out over i2c, but
> wouldn't actually change the fan speed unless you whacked the adt into
> manual modem.

Ah. That would be the reason for the extra code. Automatic fan speed
control that needs to be refreshed manually. Oh my.

> Neither of those two behaviors were listed in the datasheet, and we
> (IBM) could never get an answer out of either Analog or our own hardware
> group about whether or not this was the expected behavior.  I
> disassembled the BMC code to figure out what the other model computer
> was doing, and (clumsily) wrote that into the driver.  For all I know we
> got a bad batch of adt7470s and all these weird gymnastics aren't
> supposed to be necessary.
> 
> The next generation switched to a totally different chip and supplier,
> so I surmise they weren't happy with the results either.  Those machines
> tended to overheat if you were in Windows.
> 
> > > 4* Why are you calling msleep_interruptible() in
> > > adt7470_read_temperatures() to wait for the temperature conversions? We
> > > return -EAGAIN if that happens, but then ignore that error code, and we
> > > log a cryptic error message. Do I understand correctly that the only
> > > case where this should happen is when the user unloads the kernel
> > > driver, in which case we do not care about having been interrupted? I
> > > can't actually get the error message to be logged when rmmod'ing the
> > > module so I don't know what it would take to trigger it.  
> 
> Urrk, what a doof who wrote that.  /me smacks 2009-era djwong. :P
> 
> kthread_stop blocks until the thread exits...

My experiments seem to confirm this.

> but strangely we don't
> even try to interrupt the msleep_interruptible call.

How would we do that if we wanted to? Later you say this is not
possible?

> That's fine,
> though device removal will take longer than it needs to.

Yes, up to 2 seconds in my tests. Not pleasant, but also not
necessarily something to worry about, as rmmod is usually not needed.

> We also don't
> care about the return value of msleep_interruptible at all since one
> cannot interrupt the kthread.
> 
> I probably picked interruptible sleep to avoid triggering the hangcheck
> timer.

I don't understand that part. Is a 2 second uninteruptible sleep in a
kthread considered bad somehow?

> > > 5* Is there any reason why the update thread is being started
> > > unconditionally? As I understand it, it is only needed if at least one
> > > PWM output is configured in automatic mode, which (I think) is not the
> > > default. It is odd that the bug reporter hits a problem with the  
> 
> Yes, the driver should only start the kthread loop if someone wants
> automatic temp control.

OK, I'll give it a try. I don't want to add too much complexity though.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
