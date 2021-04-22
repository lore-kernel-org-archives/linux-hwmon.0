Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9801DC433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Apr 2021 01:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75343613AB
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Apr 2021 01:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhDVBQH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Apr 2021 21:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbhDVBQH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 21:16:07 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E822CC06174A
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 18:15:31 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id d1so9705226qvy.11
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 18:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qkgJIw/O72ihTMAwdovT9VJFjVwxa00pfc4XwOWiOb0=;
        b=GhuWjIhXE5OVnouEmM3Vp897kyHJQ/SkjDhpysiKiSGizQoDdgG738A/h1bGi5+sHa
         12wJKr0I5oMnlTyFmyBaF7PJKbQGzGgWEEUnyZrPkJpjbPbogVdRW7zu/lFWc48va/QV
         Ix7MhnvZDCH1ynyjLnz4eTi1HMa5ZfSaWR7Ljo7Mk3UIzpaT/+45E9+rXRGkOyo1rSXA
         JOCd2IiwSobICL5CsVMDjWMc1ABzDUC84/eb88u0IVT+Awqk5QsDQE8EYaFzjilSjhcq
         DH0d6b90r0HgxDmzrE44uGndBBbTDEI7p+8b1C2GvfagaWIdVWoq1qwd24/toIofut2Y
         ZJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qkgJIw/O72ihTMAwdovT9VJFjVwxa00pfc4XwOWiOb0=;
        b=O+Og37rm9Td78b80OHhWx908o2GxKcxmotGMv2s0HS8k+fLhwPcsBe8FaJxOCx4+yL
         qCSunxxprwtJZr2JtC12eW1L2nZv7J1CAb+4IDaz0WDc2rB0hgrFlMB0SJz54yw+d7c4
         yooQCu3R5TEeTEImkjcIeqrD+Gnzr+5VND/vbvmmbp2ckJzraK/0psK9A0wEnlwywwZV
         JdW4QYSPTDYYEQxQbCItDInPDiL5hm+OixcJ//UCXz6p6fa5rBP6ljEiIXUIVdw5xO7P
         v+8GivvZ7lzPC1uTi+m2zONiOUeLJR6U8PArV1MBij/b8sns0r2izb+/kDC76Pj8PjaU
         7a0A==
X-Gm-Message-State: AOAM530K55f4mdyWdKW1FQpIazu+XO/Fi/SWsa0D3888HJNQD+39FxDf
        fJSTWOBumapKzpxIdfQ/NQ75hA0kBp3w6Q==
X-Google-Smtp-Source: ABdhPJwUXE1nQYCz7es0DO6BSyj1VHWsAw8yQDWLDyu023R0jU3WFvDLM4+EP6NrWHPnS/1sWttkjw==
X-Received: by 2002:a0c:c352:: with SMTP id j18mr827913qvi.12.1619054131150;
        Wed, 21 Apr 2021 18:15:31 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id e7sm1172009qth.27.2021.04.21.18.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 18:15:30 -0700 (PDT)
Date:   Wed, 21 Apr 2021 22:15:26 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: PWM control in NZXT Grid+ V3 and Smart Device
Message-ID: <20210422011526.a6lbzsougxozsfwo@calvin.localdomain>
References: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
 <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
 <20210421172136.GD110463@roeck-us.net>
 <20210421233127.3zriqcf22yw5lvxs@calvin.localdomain>
 <20210422001537.GA134898@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210422001537.GA134898@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 21, 2021 at 05:15:37PM -0700, Guenter Roeck wrote:
> On Wed, Apr 21, 2021 at 08:31:27PM -0300, Jonas Malaco wrote:
> > On Wed, Apr 21, 2021 at 10:21:36AM -0700, Guenter Roeck wrote:
> > > On Wed, Apr 21, 2021 at 01:48:03PM -0300, Jonas Malaco wrote:
> > > > On Tue, Apr 13, 2021 at 09:45:29AM -0300, Jonas Malaco wrote:
> > > > > Guenter (and others on this list),
> > > > 
> > > > Very gentle ping.
> > > > 
> > > > I also thought posting these questions first would be less disruptive
> > > > than a RFC patch, but please let me know if you prefer the latter.
> > > > 
> > > 
> > > It is a difficult subject, and I am struggling myself with the situations
> > > you are presenting.
> > 
> > I am somewhat relieved that these issues are not so silly.  And I really
> > appropriate your comments.
> > 
> > Please take a look at a few more comments bellow.
> > 
> > > 
> > > > Thanks again,
> > > > Jonas
> > > > 
> > > > > 
> > > > > I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
> > > > > (V1) fan controllers, but I am having trouble deciding how to expose
> > > > > their PWM control due to some device limitations.
> > > > > 
> > > > > Before getting into those, let me first give some very basic context...
> > > > > 
> > > > > These devices are USB HIDs, and asynchronously send "status" reports
> > > > > every 200 ms to communicate speed, current, voltage and control mode for
> > > > > their channels (one channel per report).
> > > > > 
> > > > > Fans can be controlled by sending HID output reports to the device, and
> > > > > both DC and PWM modes are supported.  The device features a special
> > > > > initialization routine (that must be requested during probe) which
> > > > > automatically detects the appropriate control mode for each channel.
> > > > > 
> > > > > Back to the device limitations...
> > > > > 
> > > > > The first is that PWM values can be set, but not read back.  And neither
> > > > > hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
> > > > > be WO.  One solution is to have the driver track the PWM values that are
> > > > > set through it and return those, but is this acceptable?
> > > 
> > > I have seen a couple of those recently. I think returning -ENODATA
> > > if the value isn't known (yet) is the best possible solution. I thought
> > > about adding that to the ABI, actually.
> > 
> > We can never read the pwm[1-*] attributes, not even for detected and
> > controllable fans after the initialization procedure.
> > 
> > And returning -ENODATA for pwm[1-*] reads makes pwmconfig/fancontrol
> > unhappy:
> > 
> 
> Seems to me that pwmconfig is then maybe not appropriate to use,
> and maybe there should be no driver for this device in the kernel
> in the first place.

I see your point.  Although, apart from this rather serious quirk, these
devices work really well with pwmconfig/fancontrol.

> 
> Returning a random value after setting the pwm value to 255, removing,
> and re-inserting the driver is, in my opinion, even worse than
> returning -ENODATA. After all, the driver doesn't know the pwm value,
> and it is really a bad idea to report data which doesn't reflect
> reality.

Well, in this particular case, the driver must reinitialize the device
anyway, since it cannot know whether the device was already initialized.
Maybe the driver was removed because the device itself was disconnected
and powered off (it's a USB device, not a chip on a board).

So in the work-in-progress driver I take this opportunity to also make
sure that its state matches the device's, and force all fans to their
default PWM values after powering on.

Specifically, besides requesting the device to initialize itself, I also
(re)set all fans to 40% PWM.  (This does not require waiting for the
initialization to be complete).

Is this egregious?

Thanks,
Jonas

> 
> Guenter
> 
> > # pwmconfig
> > [...]
> > Found the following PWM controls:
> > cat: hwmon0/pwm1: No data available
> >    hwmon0/pwm1           current value: 
> > cat: hwmon0/pwm1: No data available
> > /bin/pwmconfig: line 201: [: : integer expression expected
> > cat: hwmon0/pwm1: No data available
> > hwmon0/pwm1 stuck to 
> > Manual control mode not supported, skipping hwmon0/pwm1.
> > [...]
> > 
> > # fancontrol
> > [...]
> > Enabling PWM on fans...
> > cat: hwmon0/pwm1: No data available
> > Starting automatic fan control...
> > /bin/fancontrol: line 551: read: read error: 0: No data available
> > Error reading PWM value from /sys/class/hwmon/hwmon0/pwm1
> > Aborting, restoring fans...
> > cat: hwmon0/pwm1: No data available
> > /bin/fancontrol: line 458: [: : integer expression expected
> > hwmon0/pwm1_enable stuck to 1
> > Verify fans have returned to full speed
> > 
> > > 
> > > > > 
> > > > > The other starts with PWM control being disabled for channels that the
> > > > > device identifies as unconnected.  This is not in itself a problem, but
> > > > > the initialization routine (where the detection happens) is
> > > > > asynchronous, takes somewhere around 5 seconds, and we do not have any
> > > > > way of directly querying its result.  We only know the control mode of
> > > > > each channel (be it DC, PWM or disabled) from the regular status
> > > > > reports.
> > > 
> > > Again, I think the best solution is to return -ENODATA until the value
> > > is known.
> > 
> > Ok.
> > 
> > > 
> > > > > 
> > > > > These limitations make it complicated to simply use is_visible() to hide
> > > > > pwm attributes of unconnected channels.  We would need to register with
> > > > > the hwmon subsystem only after getting enough post-initialization status
> > > > > reports for all channels, and this would essentially mean to sleep for
> > > > > 6+ seconds.  We would also need to unregister and re-register when going
> > > > > through a suspend-reset_resume cycle, because the device may have its
> > > > > state wiped, requiring reinitialization.[2]
> > > > > 
> > > I think the above should resolve that.
> > 
> > Yes, as well as your suggestion bellow.
> > 
> > > 
> > > > > A different approach to handle this, which I have preferred _so far,_ is
> > > > > to use pwm*_enable = 0 to report the unconnected channels to user-space,
> > > > > while keeping the other pwm attributes visible.  But this comes with
> > > > > other problems.
> > > > > 
> > > > > First, lm-sensors' pwmconfig expects to be able to write to a
> > > > > pwm*_enable attribute if it exists, but the device does not support that
> > > > > operation.  The hwmon documentation states that RW values may be RO, but
> > > > > pwmconfig is out there and in use.  So far I simply return 0 to attempts
> > > > > at those writes, silently ignoring them; functional, but certainly a
> > > > > hack.
> > > 
> > > It is a bad idea to return 0 if the value is not accepted. You could check
> > > if the written value matches the current value and return 0 if it does,
> > > and an error such as -EOPNOTSUPP or -EINVAL otherwise.
> > 
> > It worked really well, thanks!
> > 
> > > 
> > > > > 
> > > > > Second, if PWM control is disabled for a channel, but its pwm* and
> > > > > pwm*_mode attributes are still visible, what should we return when
> > > > > user-space attempts to write to them?  The practical answer may simply
> > > > > be to return -EOPNOTSUPP, but this makes me wonder if the whole approach
> > > > > (of handling these cases with pwm*_enable instead of is_visible()) is
> > > > > not doomed.
> > > > > 
> > > Mode isn't really writeable either, isn't it ? If so, use the same trick as
> > > with the _enable attribute.
> > 
> > You're right, but setting its visibility to 0444 didn't cause issues for
> > pwmconfig or fancontrol, so I don't think the trick is necessary here.
> > 
> > > 
> > > The same is effectively true for the pwm value itself: Since both _enable
> > > and _mode are effectively read-only, you can accept a write only if
> > > fan control is enabled, and return an error if it isn't.
> > 
> > Ok.
> > 
> > > 
> > > > > A final minor problem is that channels detected as unconnected run at
> > > > > 40% PWM, but the documentation for pwm*_enable == 0 is a bit too
> > > > > specific: "no fan speed control (i.e. fan at *full* speed)" (emphasis
> > > > > mine).
> > > 
> > > Just document the difference. Reality doesn't always match our expectations.
> > 
> > Ok.
> > 
> > Thanks,
> > Jonas
> > 
> > > 
> > > Thanks,
> > > Guenter
> > > 
> > > > > 
> > > > > Do you have any suggestions and/or recommendations?
> > > > > 
> > > > > If it helps, a pre-RFC (but functional and mostly clean) version of the
> > > > > driver can be found at:
> > > > > 
> > > > > https://github.com/jonasmalacofilho/linux/blob/p-hwmon-add-nzxt-smartdevice-gridplus3/drivers/hwmon/nzxt-smartdevice.c
> > > > > 
> > > > > Thanks,
> > > > > Jonas
> > > > > 
> > > > > [1] According to Documentation/hwmon/sysfs-interface.rst.
> > > > > [2] The device also does not respond to HID Get_Report, so it is not
> > > > >     trivial to check whether it really needs to be reinitialized, since
> > > > >     the only symptom of that being necessary is the absence of the
> > > > >     asynchronous status reports.
