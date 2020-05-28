Return-Path: <SRS0=qJgv=7K=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7581DC433DF
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 May 2020 10:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62044208B8
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 May 2020 10:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387643AbgE1KDD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 May 2020 06:03:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:38038 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387518AbgE1KDC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 May 2020 06:03:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 31780AF4F;
        Thu, 28 May 2020 10:02:59 +0000 (UTC)
Date:   Thu, 28 May 2020 12:02:56 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200528120256.63023d63@endymion>
In-Reply-To: <20200527233334.GL252930@magnolia>
References: <20200526112259.4356fb2f@endymion>
        <20200527224252.GB89212@roeck-us.net>
        <20200527233334.GL252930@magnolia>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020 16:33:34 -0700, Darrick J. Wong wrote:
> On Wed, May 27, 2020 at 03:42:52PM -0700, Guenter Roeck wrote:
> > On Tue, May 26, 2020 at 11:22:59AM +0200, Jean Delvare wrote:  
> > > Hi all,
> > > 
> > > In the context of bug #207771, I got to look into the adt7470 driver.
> > > I'm slowing understanding the logic of the background temperature
> > > registers update thread, still there are 2 things I do not understand:
> > > 
> > > 1* Function adt7470_read_temperatures() sets data->num_temp_sensors,
> > > however this value seems to be only used to limit the wait time of
> > > future calls to the same function. In the general update function we
> > > still read ALL temperature sensors regardless of its value:
> > > 
> > > 		for (i = 0; i < ADT7470_TEMP_COUNT; i++)
> > > 			data->temp[i] = i2c_smbus_read_byte_data(client,
> > > 						ADT7470_TEMP_REG(i));
> > > 
> > > Shouldn't this loop be bounded with data->num_temp_sensors instead of
> > > ADT7470_TEMP_COUNT?
> > >   
> > Guess so.
> >   
> > > 2* Function adt7470_read_temperatures() also sets
> > > data->temperatures_probed to 1, and this boolean is then used to skip
> > > further calls to that function. But do we really need a separate
> > > variable for this, given that num_temp_sensors >= 0 matches the same
> > > condition as far as I can see?
> >
> > Agreed. On the other side, those are optimizations. I am not really sure
> > if that driver is worth spending time on, given the age of the chip.

Well it's still in use and apparently at least one user cares enough to
report a bug and propose a candidate fix.

> I /think/ the answer to both questions is yes, but I don't have the
> hardware anymore so I have no way to QA that... :/

Thanks for both of you for your answers.

Darrick, I have 3 more questions for you if you remember...

3* I understand that the temperatures need to be read periodically in
order for automatic fan speed control to work. What I do not understand
is why you bother switching PWM outputs to manual mode each time? What
bad would happen if we did not do that? I see nothing in the datasheet
justifying it.

4* Why are you calling msleep_interruptible() in
adt7470_read_temperatures() to wait for the temperature conversions? We
return -EAGAIN if that happens, but then ignore that error code, and we
log a cryptic error message. Do I understand correctly that the only
case where this should happen is when the user unloads the kernel
driver, in which case we do not care about having been interrupted? I
can't actually get the error message to be logged when rmmod'ing the
module so I don't know what it would take to trigger it.

5* Is there any reason why the update thread is being started
unconditionally? As I understand it, it is only needed if at least one
PWM output is configured in automatic mode, which (I think) is not the
default. It is odd that the bug reporter hits a problem with the
polling thread when they are not using automatic fan speed control in
the first place so they do not need the polling thread to run. I was
wondering if it would be possible to start and stop the polling thread
depending on whether automatic PWM is enabled or not.

Thanks again,
-- 
Jean Delvare
SUSE L3 Support
