Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E109C433B4
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Apr 2021 02:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A0746142B
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Apr 2021 02:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhDVCg7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Apr 2021 22:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhDVCg7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 22:36:59 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0627BC06174A
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 19:36:25 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id ef17so15685808qvb.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 19:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mNmeK+Y1oiEQslGRMyUPgokP30EwjAwwYHv9cY+vm/w=;
        b=i/FieK1EAWX8m/b+81Nx5REtFrCAEi1X50TPmCfeneMcAz6d8nQWZfUCblegyAxRwj
         iSc5h/lnMSqCt+871adTuD6Pns18xz9c0Gvl7M3COiQPcNmYgRAG3CLWFn+7+YbEOmVk
         X6rBOuxobHzEpDnLDmK4uBTJx4vX/DP/4qVA/p3gnQRps3I46ON0VMiPbgASeOfgWopg
         jmnm3i8ddw7s50imfOxNysmqCPbuKCjigAU6HU8rOsIx450smoxrPNG1tFWPLPy7QiEo
         r8hEReWvHlNRyxX0kP+nIrS7dBskXYphulzu9+0USRAtSEg6KODjFl8zXBcZt9ybvLJs
         HeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mNmeK+Y1oiEQslGRMyUPgokP30EwjAwwYHv9cY+vm/w=;
        b=Ntn41GjBtKhSVq86+yuPQ/N0XFiWkqnC7F+y70dW6wQl7q/LOTznFBb1gI+CNNWsJN
         I9n1SpQsk9xoiEeDBaO9FaTwYPaeldmWmMoqcDm7PuRKGxMctUkdZBCxEbIEvBwJEh37
         32Q6LDUx6xu3t51lVFZqjaI0466py6U9Z+5xtYPozf0DdvlrbgtY7xDB3Tz2GPt0jaQW
         HtHGRiwRCghpZVPDgQUcdOEf+9IMl3+WYaVAqzzF2GFamtSO8mW2aXwYQslYRHJxRdQX
         OXgKOCEtbmHFePFsHq5ILhVpueYbZb4u8CKDUGjZxkm1zXYosSn/xRgJzHqJ9rwZlqnI
         r3FQ==
X-Gm-Message-State: AOAM533Wrbuy14zt7WJI/8bzFh4pS8rH7VIU8BE/TNESsTc4C8lbonN4
        t3eNR9Yxue8jZ1XE3jPmains9boklAQglw==
X-Google-Smtp-Source: ABdhPJxqz3uf3g8Ti7m1REGbniovDnnZ1M4bMMqXSmW1Ywdy1UMbI1taYI2TO2JyIh5Dm/LGbqINqw==
X-Received: by 2002:a0c:f54e:: with SMTP id p14mr1267939qvm.61.1619058984237;
        Wed, 21 Apr 2021 19:36:24 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id p21sm1210651qkp.92.2021.04.21.19.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 19:36:23 -0700 (PDT)
Date:   Wed, 21 Apr 2021 23:36:20 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: PWM control in NZXT Grid+ V3 and Smart Device
Message-ID: <20210422023620.t6u6bjf3xpcztaze@calvin.localdomain>
References: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
 <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
 <20210421172136.GD110463@roeck-us.net>
 <20210421233127.3zriqcf22yw5lvxs@calvin.localdomain>
 <20210422001537.GA134898@roeck-us.net>
 <20210422011526.a6lbzsougxozsfwo@calvin.localdomain>
 <520e6d96-9062-56d1-29a1-b7635b3310ca@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <520e6d96-9062-56d1-29a1-b7635b3310ca@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 21, 2021 at 06:30:42PM -0700, Guenter Roeck wrote:
> On 4/21/21 6:15 PM, Jonas Malaco wrote:
> > On Wed, Apr 21, 2021 at 05:15:37PM -0700, Guenter Roeck wrote:
> >> On Wed, Apr 21, 2021 at 08:31:27PM -0300, Jonas Malaco wrote:
> >>> On Wed, Apr 21, 2021 at 10:21:36AM -0700, Guenter Roeck wrote:
> >>>> On Wed, Apr 21, 2021 at 01:48:03PM -0300, Jonas Malaco wrote:
> >>>>> On Tue, Apr 13, 2021 at 09:45:29AM -0300, Jonas Malaco wrote:
> >>>>>> Guenter (and others on this list),
> >>>>>
> >>>>> Very gentle ping.
> >>>>>
> >>>>> I also thought posting these questions first would be less disruptive
> >>>>> than a RFC patch, but please let me know if you prefer the latter.
> >>>>>
> >>>>
> >>>> It is a difficult subject, and I am struggling myself with the situations
> >>>> you are presenting.
> >>>
> >>> I am somewhat relieved that these issues are not so silly.  And I really
> >>> appropriate your comments.
> >>>
> >>> Please take a look at a few more comments bellow.
> >>>
> >>>>
> >>>>> Thanks again,
> >>>>> Jonas
> >>>>>
> >>>>>>
> >>>>>> I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
> >>>>>> (V1) fan controllers, but I am having trouble deciding how to expose
> >>>>>> their PWM control due to some device limitations.
> >>>>>>
> >>>>>> Before getting into those, let me first give some very basic context...
> >>>>>>
> >>>>>> These devices are USB HIDs, and asynchronously send "status" reports
> >>>>>> every 200 ms to communicate speed, current, voltage and control mode for
> >>>>>> their channels (one channel per report).
> >>>>>>
> >>>>>> Fans can be controlled by sending HID output reports to the device, and
> >>>>>> both DC and PWM modes are supported.  The device features a special
> >>>>>> initialization routine (that must be requested during probe) which
> >>>>>> automatically detects the appropriate control mode for each channel.
> >>>>>>
> >>>>>> Back to the device limitations...
> >>>>>>
> >>>>>> The first is that PWM values can be set, but not read back.  And neither
> >>>>>> hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
> >>>>>> be WO.  One solution is to have the driver track the PWM values that are
> >>>>>> set through it and return those, but is this acceptable?
> >>>>
> >>>> I have seen a couple of those recently. I think returning -ENODATA
> >>>> if the value isn't known (yet) is the best possible solution. I thought
> >>>> about adding that to the ABI, actually.
> >>>
> >>> We can never read the pwm[1-*] attributes, not even for detected and
> >>> controllable fans after the initialization procedure.
> >>>
> >>> And returning -ENODATA for pwm[1-*] reads makes pwmconfig/fancontrol
> >>> unhappy:
> >>>
> >>
> >> Seems to me that pwmconfig is then maybe not appropriate to use,
> >> and maybe there should be no driver for this device in the kernel
> >> in the first place.
> > 
> > I see your point.  Although, apart from this rather serious quirk, these
> > devices work really well with pwmconfig/fancontrol.
> > 
> >>
> >> Returning a random value after setting the pwm value to 255, removing,
> >> and re-inserting the driver is, in my opinion, even worse than
> >> returning -ENODATA. After all, the driver doesn't know the pwm value,
> >> and it is really a bad idea to report data which doesn't reflect
> >> reality.
> > 
> > Well, in this particular case, the driver must reinitialize the device
> > anyway, since it cannot know whether the device was already initialized.
> > Maybe the driver was removed because the device itself was disconnected
> > and powered off (it's a USB device, not a chip on a board).
> > 
> > So in the work-in-progress driver I take this opportunity to also make
> > sure that its state matches the device's, and force all fans to their
> > default PWM values after powering on.
> > 
> > Specifically, besides requesting the device to initialize itself, I also
> > (re)set all fans to 40% PWM.  (This does not require waiting for the
> > initialization to be complete).
> > 
> > Is this egregious?
> > 
> SGTM, just make sure this is well documented, and make sure that the initial
> pwm value is reported as 40%, ie 102.

Of course! :)

I'll send a v1 in the next few days.

Thanks,
Jonas

> 
> Thanks,
> Guenter
