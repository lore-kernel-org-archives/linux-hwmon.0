Return-Path: <SRS0=7wWQ=ZM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674F7C432C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 17:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17F3220895
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Nov 2019 17:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="gNNWqQL8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbfKTR0i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Nov 2019 12:26:38 -0500
Received: from mx.treblig.org ([46.43.15.161]:58792 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbfKTR0i (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Nov 2019 12:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
        :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=yJKXb46c+XwMbwXhPzJSPyVUWZP7YRyCdct3oan2xkc=; b=gNNWqQL89nZRa4M3aw5mk09n1N
        2QdcZrWTms8LWPOijxYx3I1Y/QdMxT/QJckBkP5yLrwIQBGhTtPtnJylUK4RC+fTJj27IlAne7s09
        c19cCh798JK0nNpg0QIalYi3EKQS1wrWbcfNBHdE03C52NA6Hx2UCaT7RIdSvoegLHqQZzuza1heR
        RM+bf+EB6bg75yR99jzcmKH8JW50gkPcjfjBa6PoCO43CxJqUXxUxIUaB/YwcEFUzigH5scsszcCi
        vri8m4737JnNGBrweKZb0nZV8OEXa6rRK479N0zjzsVLDSRMP1P8MZjgdObXRkfn1qFsLfeQqJLrS
        TIL8EtYQ==;
Received: from dg by mx.treblig.org with local (Exim 4.92)
        (envelope-from <dg@treblig.org>)
        id 1iXTk8-0002yR-2M; Wed, 20 Nov 2019 17:26:16 +0000
Date:   Wed, 20 Nov 2019 17:26:16 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: WIP: [PATCH] hwmon: (w83627ehf) convert to with_info interface
Message-ID: <20191120172616.GA22683@gallifrey>
References: <20191119181822.GC26171@gallifrey>
 <20191119212108.GA16985@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119212108.GA16985@roeck-us.net>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/4.19.0-5-amd64 (x86_64)
X-Uptime: 17:22:12 up 80 days, 17:42,  1 user,  load average: 0.00, 0.02, 0.00
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

* Guenter Roeck (linux@roeck-us.net) wrote:
> On Tue, Nov 19, 2019 at 06:18:22PM +0000, Dr. David Alan Gilbert wrote:
> > 
> > Hi Jean, Guenter,
> >   I'm part way through converting w83627ehf to use the devm_hwmon_device_register_with_info
> > interface and had some questions I'd appreciate the answer to.  My WIP
> > code is attached below.
> > 
> >   a) In the existing driver, all the pseudo files are showing up as:
> >      /sys/devices/platform/w83627ehf.656/blah_input
> >      with the rework:
> >      /sys/devices/platform/w83627ehf.656/hwmon/hwmon1/
> > 
> >      my reading is that the reworked one is correct?
> >      Although I guess the change is a pain for people with paths
> >      in tools.
> > 

Thanks for the reply.

> No one should have absolute path names like the above in their tools.
> So far none of the driver conversions caused trouble, so hopefully
> we should be fine.

OK, great.

> >   b) The device has an intrusion0_alarm & intrusion1_alarm
> >      that seems pretty common looking in drivers/hwmon - some other
> >      devices have a intrustion%d_beep.  Does it make sense to add
> >      a new hwmon_intrusion type to hwmon_sensor_types  ?
> > 
> Yes, we should add hwmon_intrusion to hwmon_sensor_types, with _alarm
> and _beep as supported attributes.

OK, will do.

> >   c) The device has a bunch more pwm variants:
> >      pwm2_max_output, pwm2_start_output, pwm2_step_output, pwm2_stop_output,
> >      pwm2_stop_time, pwm2_target, pwm2_tolerance
> > 
> >      for each/some of it's outputs.   What's the right thing to
> >      do there? Add them all to hwmon_pwm_attr_templates ?
> >      (Unfortunately it looks like everyone has fun with their own
> >       pwm settings).
> > 
> We'll have to keep sysfs files for those for the time being,
> unless there are some which are officially listed in
> Documentation/hwmon/sysfs-interface.rst.

OK, that's a bit messy; so just keep the existing sysfs code - do
I need to tweak that to match the new directory path?
Would another way be to use @extra_groups on the with_info call?

> > For reference, I seem to have a w83667hg on an ASRock P55M Pro.
> > 
> > The current status is that 'reading' seems to work (from what I can tell
> > but not looked at the PWM), and I've not converted the writers yet.
> > 
> Good start. I would suggest to run your patch through checkpatch.
> It will tell you, for example, that S_IRUGO et al ran out of favor,
> and that you are supposed to use octals instead.

Yeh I've already done that and used it to get rid of most of my space/tab
screwups;  I'll fix the remains up before I post the final version.

I should nail the rest of this either this weekend or next.

Thanks again for your comments,

Dave

> Thanks,
> Guenter
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
