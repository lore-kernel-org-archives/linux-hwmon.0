Return-Path: <SRS0=nzsd=7L=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8ADC433DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 May 2020 13:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8268920721
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 May 2020 13:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgE2N3p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 May 2020 09:29:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:55040 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgE2N3p (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 May 2020 09:29:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B89CEAF30;
        Fri, 29 May 2020 13:29:42 +0000 (UTC)
Date:   Fri, 29 May 2020 15:29:37 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200529152937.08898e73@endymion>
In-Reply-To: <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
References: <20200526112259.4356fb2f@endymion>
        <20200527224252.GB89212@roeck-us.net>
        <20200527233334.GL252930@magnolia>
        <20200528120256.63023d63@endymion>
        <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 28 May 2020 06:52:37 -0700, Guenter Roeck wrote:
> On 5/28/20 3:02 AM, Jean Delvare wrote:
> > Well it's still in use and apparently at least one user cares enough to
> > report a bug and propose a candidate fix.
>
> ... but at the same time that user doesn't have any temperature sensors
> installed and won't be able to test any changes.

They would be able to test the rest of the driver still. Plus I have a
register dump which I am feeding i2c-stub with, and that lets me test
the driver to some extent. God bless Mark M. Hoffman!

What I can't test are timing issues, and hardware misbehavior as
described by Darrick.

> > (...)
> > 4* Why are you calling msleep_interruptible() in
> > adt7470_read_temperatures() to wait for the temperature conversions? We
> > return -EAGAIN if that happens, but then ignore that error code, and we
> > log a cryptic error message. Do I understand correctly that the only
> > case where this should happen is when the user unloads the kernel
> > driver, in which case we do not care about having been interrupted? I
> > can't actually get the error message to be logged when rmmod'ing the
> > module so I don't know what it would take to trigger it.
> 
> Not sure if rmmod generates a signal.

I tested and it doesn't seem so. I expected rmmod to call
adt7470_remove(), in turn calling kthread_stop() and I thought this
would interrupt the thread. But the interrupt message never gets logged.

"modprobe adt7470 && rmmod adt7470" takes 2 seconds, so I assume that
rmmod gives the thread all the time it wants to exit on its own
(through kthread_should_stop()).

> In theory you could possibly
> keep writing -1 into the num_temp_sensors attribute, execute the
> sensors command (or just read a temperature), and interrupt the
> sequence.

Interrupt how? I tried Ctrl+C while "sensors" is waiting for the driver
to update the values, but it waits for completion before actually
exiting.

So far I couldn't find any way to get this msleep_interruptible() to
actually get interrupted.

> (...)
> The datasheet says nothing about the need to run such a thread for
> automatic mode either.

But that at least makes some sense due to the external nature of the
thermal sensors. The data needs to be fetched from the slaves somehow
before you can read it from the ADT7470's registers.

On the other hand, having to change PWM configuration registers for
temperature readings to be correct (/if/ that's what is happening
here... not sure) is highly unexpected.

> As I understand it, the chip is supposed to
> repeat temperature measurements automatically once configuration
> register 1 bit 7 is set. Of course that is difficult if not
> impossible to confirm without access to the chip.

Well there's clearly a huge design mistake for that chip, sharing a
pin between FULL_SPEED and TMP_START makes it pretty much impossible
for automatic temperature monitoring to be implemented without a
software loop. And a hardware monitor device that can't run on its own
is just asking for trouble. Oh well.

-- 
Jean Delvare
SUSE L3 Support
