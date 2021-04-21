Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAFBC433ED
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Apr 2021 17:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B310061440
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Apr 2021 17:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244628AbhDURWO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Apr 2021 13:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244723AbhDURWM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 13:22:12 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A289C06138A
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 10:21:39 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id x20so9375060oix.10
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ttxLnkpvaRi3SUvtYivusngdjWGwJTxO2BAiwouAnGE=;
        b=YVHr3oRCI6iCAedOEOtPy2xe63HJtU3cQ1iFd8IqdCN3AiFIEUvncfXJw6/n3WR8ML
         b5cYFcPYf6yMjwiunVZc/PkFduMpshUJo/+wuCYg5PgQt5vvxu3XzNBh9zRyknTP/1yA
         WWMRKP3vsmIEOfC1jnF0QAv9ABlcN8jZ77stLn0HqMpJlmSQs85hDnV1T7i/ESwYYeYl
         5BHPNrUphISaG6laTwQmSKR1XZjpXIrOCxHVhPKMqvZ0Cp2zppQX+CYClVUsHCZrNszx
         ibovJDGZFFqHXgI5zcLQmO6bkHOoPqj8aBTAFkLojvkUAAtbPPe8ER15vmpXG2b5U7Xu
         R6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ttxLnkpvaRi3SUvtYivusngdjWGwJTxO2BAiwouAnGE=;
        b=D4PFAWDlPnHc452NRE1dJZuWP5Vl/CHnE3DHfEUtHoUkitsq6Hgi8ICGLc4sc0aazL
         BMxWQM9WtA0uemMx8yHF8dhGqCa6UzKQ//O6f2Fn/4Vg/0RqZpVYpvbSgzahMn9cC8D8
         RP0qSxYRDj+IfXtFOkfTj/IK3lBYOdJf+36zoWeVgJxOi7+PNGRQ1kqan79k9ixGIQUx
         Ac6zhFeAmcKTtXDTHLnTuby4wZBQAbV6oKy+OVCoqYTfBrdeKu2lFBDRRnnz8TXKBknS
         QdRXPbbIwrm2Gz3k3IQKFPji5mIYJ0zftx8YnjDJY84l0JMq/ut57HUKKAe+sBhzI1WN
         z+MQ==
X-Gm-Message-State: AOAM531timnXOxjvmaEppBF5BvIl0Ve3duKzYMZ8IVNwpj+jIZSbFxGA
        ofa3fTxA5A4rio42aLoNgoA=
X-Google-Smtp-Source: ABdhPJxx4oM5FHFrKHn9UqEUXZL383M0aHOMyLosmys/K2rGUjZAa0JmQkSVLITy8hp3zgSG/KLGVg==
X-Received: by 2002:aca:3f87:: with SMTP id m129mr7434634oia.82.1619025698875;
        Wed, 21 Apr 2021 10:21:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w140sm626808oif.42.2021.04.21.10.21.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 10:21:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 21 Apr 2021 10:21:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonas Malaco <jonas@protocubo.io>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: PWM control in NZXT Grid+ V3 and Smart Device
Message-ID: <20210421172136.GD110463@roeck-us.net>
References: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
 <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 21, 2021 at 01:48:03PM -0300, Jonas Malaco wrote:
> On Tue, Apr 13, 2021 at 09:45:29AM -0300, Jonas Malaco wrote:
> > Guenter (and others on this list),
> 
> Very gentle ping.
> 
> I also thought posting these questions first would be less disruptive
> than a RFC patch, but please let me know if you prefer the latter.
> 

It is a difficult subject, and I am struggling myself with the situations
you are presenting.

> Thanks again,
> Jonas
> 
> > 
> > I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
> > (V1) fan controllers, but I am having trouble deciding how to expose
> > their PWM control due to some device limitations.
> > 
> > Before getting into those, let me first give some very basic context...
> > 
> > These devices are USB HIDs, and asynchronously send "status" reports
> > every 200 ms to communicate speed, current, voltage and control mode for
> > their channels (one channel per report).
> > 
> > Fans can be controlled by sending HID output reports to the device, and
> > both DC and PWM modes are supported.  The device features a special
> > initialization routine (that must be requested during probe) which
> > automatically detects the appropriate control mode for each channel.
> > 
> > Back to the device limitations...
> > 
> > The first is that PWM values can be set, but not read back.  And neither
> > hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
> > be WO.  One solution is to have the driver track the PWM values that are
> > set through it and return those, but is this acceptable?

I have seen a couple of those recently. I think returning -ENODATA
if the value isn't known (yet) is the best possible solution. I thought
about adding that to the ABI, actually.

> > 
> > The other starts with PWM control being disabled for channels that the
> > device identifies as unconnected.  This is not in itself a problem, but
> > the initialization routine (where the detection happens) is
> > asynchronous, takes somewhere around 5 seconds, and we do not have any
> > way of directly querying its result.  We only know the control mode of
> > each channel (be it DC, PWM or disabled) from the regular status
> > reports.

Again, I think the best solution is to return -ENODATA until the value
is known.

> > 
> > These limitations make it complicated to simply use is_visible() to hide
> > pwm attributes of unconnected channels.  We would need to register with
> > the hwmon subsystem only after getting enough post-initialization status
> > reports for all channels, and this would essentially mean to sleep for
> > 6+ seconds.  We would also need to unregister and re-register when going
> > through a suspend-reset_resume cycle, because the device may have its
> > state wiped, requiring reinitialization.[2]
> > 
I think the above should resolve that.

> > A different approach to handle this, which I have preferred _so far,_ is
> > to use pwm*_enable = 0 to report the unconnected channels to user-space,
> > while keeping the other pwm attributes visible.  But this comes with
> > other problems.
> > 
> > First, lm-sensors' pwmconfig expects to be able to write to a
> > pwm*_enable attribute if it exists, but the device does not support that
> > operation.  The hwmon documentation states that RW values may be RO, but
> > pwmconfig is out there and in use.  So far I simply return 0 to attempts
> > at those writes, silently ignoring them; functional, but certainly a
> > hack.

It is a bad idea to return 0 if the value is not accepted. You could check
if the written value matches the current value and return 0 if it does,
and an error such as -EOPNOTSUPP or -EINVAL otherwise.

> > 
> > Second, if PWM control is disabled for a channel, but its pwm* and
> > pwm*_mode attributes are still visible, what should we return when
> > user-space attempts to write to them?  The practical answer may simply
> > be to return -EOPNOTSUPP, but this makes me wonder if the whole approach
> > (of handling these cases with pwm*_enable instead of is_visible()) is
> > not doomed.
> > 
Mode isn't really writeable either, isn't it ? If so, use the same trick as
with the _enable attribute.

The same is effectively true for the pwm value itself: Since both _enable
and _mode are effectively read-only, you can accept a write only if
fan control is enabled, and return an error if it isn't.

> > A final minor problem is that channels detected as unconnected run at
> > 40% PWM, but the documentation for pwm*_enable == 0 is a bit too
> > specific: "no fan speed control (i.e. fan at *full* speed)" (emphasis
> > mine).

Just document the difference. Reality doesn't always match our expectations.

Thanks,
Guenter

> > 
> > Do you have any suggestions and/or recommendations?
> > 
> > If it helps, a pre-RFC (but functional and mostly clean) version of the
> > driver can be found at:
> > 
> > https://github.com/jonasmalacofilho/linux/blob/p-hwmon-add-nzxt-smartdevice-gridplus3/drivers/hwmon/nzxt-smartdevice.c
> > 
> > Thanks,
> > Jonas
> > 
> > [1] According to Documentation/hwmon/sysfs-interface.rst.
> > [2] The device also does not respond to HID Get_Report, so it is not
> >     trivial to check whether it really needs to be reinitialized, since
> >     the only symptom of that being necessary is the absence of the
> >     asynchronous status reports.
