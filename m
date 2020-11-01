Return-Path: <SRS0=yzt0=EH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB42C4742C
	for <linux-hwmon@archiver.kernel.org>; Sun,  1 Nov 2020 09:34:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A198A208E4
	for <linux-hwmon@archiver.kernel.org>; Sun,  1 Nov 2020 09:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="WkVwm8W6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgKAJe2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 1 Nov 2020 04:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgKAJe0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 1 Nov 2020 04:34:26 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEF1C061A48
        for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2020 01:34:26 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id f16so10373409ilr.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2020 01:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=feEafZUghxfj0r5ehU1s8Cn33RCu4DgdtZG8O8W28q4=;
        b=WkVwm8W6d5z3BiH3mqEaxtpzm5JHDkQ2qO+Lm7pDbVmbp4zj2nxf5i3YTWPnO8jFUE
         UaLi3KvxE4JXDgbwd9TxjEIpaoXKQ5Y3PAoS6m7ujQGjV58sjQLZtY20FC7zvgpRgOhx
         SSPXrD4BXYmE5dYsTpMA8FooZLxH8Ol6J8cULSZZWS3gACsscDhPDgwQqnVoKvEy7cbx
         weUNM5mPzt/HtVXfTJLtP+p2jrG9tB4CYrzISin0mh+26T3hQqP8ZEg4PD5OUvDswKzV
         vufbtim0LI+4BsW685/COWuwMetSI0DFYlM/cPQSAGBZj6HMTKL7W/LQw0FcjdTP7nmE
         tVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=feEafZUghxfj0r5ehU1s8Cn33RCu4DgdtZG8O8W28q4=;
        b=i5P96saqOCQageELe0RfnTjnrzgQhlB7jMe9hylN9eKXvN1PFmjUJ3YC4t3QS3c+D4
         XUIipG1+rP6Yh+i55K8z86Mhi+SD4L6MkQgEpdzplObX6RlwPiadOHwskQIvfWzJRICj
         mDWi45Qo31yVtRyCGAuQ0MmZ2iE8BgZBjVYEKXCe4VGHdUOYBZ2preFStMT4u5eCOEbP
         u0AAvNMCkqqasnyB2GDOGbkxTPKv3iRV8gQDBJB0he33umdqj9QvGiq+k95nS22VLGjI
         0+2Ls9rmhATUemtaxlaPVNvSrXlTyidxJBeNu6XM1QJZCzqkypIEw0grkz6jbmgePLMH
         bK/g==
X-Gm-Message-State: AOAM530CWIeS0vQrAho7b9I+GMSj91sbsJbxuLAQTFCrMlRuNRtXdLEU
        FzkzzZkxSdmiPrWkNVRLNjKiNs0G4WiP8dkS0la3Ng==
X-Google-Smtp-Source: ABdhPJxhywKjvwLEbVG0Q4jm4ZwrctHRgWmYcvrw1ePGWRxW/2fhcJJeQK6WrcJ3rj3fCkBmAxMMU2qWmxihLX0/D8E=
X-Received: by 2002:a92:41cf:: with SMTP id o198mr7403679ila.262.1604223265873;
 Sun, 01 Nov 2020 01:34:25 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-5-luka.kovacic@sartura.hr> <20201029175823.GC26053@duo.ucw.cz>
In-Reply-To: <20201029175823.GC26053@duo.ucw.cz>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 1 Nov 2020 10:34:14 +0100
Message-ID: <CADZsf3bChWDv02v=LR-abC5rNmh09JsdabWVLcuuWaOhejBBjg@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] drivers: leds: Add the IEI WT61P803 PUZZLE LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Pavel,

On Thu, Oct 29, 2020 at 6:58 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Add support for the IEI WT61P803 PUZZLE LED driver.
> > Currently only the front panel power LED is supported,
> > since it is the only LED on this board wired through the
> > MCU.
> >
> > The LED is wired directly to the on-board MCU controller
> > and is toggled using an MCU command.
> >
> > Support for more LEDs is going to be added in case more
> > boards implement this microcontroller, as LEDs use many
> > different GPIOs.
>
> Not too bad.
>
> > This driver depends on the IEI WT61P803 PUZZLE MFD driver.
> >
> > Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > Cc: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/leds/Kconfig                    |   8 ++
> >  drivers/leds/Makefile                   |   1 +
> >  drivers/leds/leds-iei-wt61p803-puzzle.c | 161 ++++++++++++++++++++++++
> >  3 files changed, 170 insertions(+)
>
> Can you put it into drivers/leds/simple? You'll have to create it.

Sure, I'll move the driver there.

>
> > +++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
> > @@ -0,0 +1,161 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
>
> Make sure this is consistent with MODULE_LICENSE("GPL");. GPLv2+ would
> be nicer if you can.

Okay, I'll see what I can do...
Although isn't it okay to use either GPL-2.0-only or GPL-2.0+ with
MODULE_LICENSE("GPL") as described in Documentation/process/license-rules.rst
on line 441?

>
> > +     struct mutex lock;
>
> Mutex is _way_ overkill for this. Please check that locking provided
> by LED core is not sufficient. If not, please use atomic_t or
> something.

Ok.

>
> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek

Kind regards,
Luka
