Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4266DC433ED
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 17:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 075EE61177
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 17:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbhEFRW3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 May 2021 13:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbhEFRW2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 May 2021 13:22:28 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C09C0613ED
        for <linux-hwmon@vger.kernel.org>; Thu,  6 May 2021 10:21:29 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 15so8422182ybc.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 May 2021 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFWC5fpqRaGTrdHip1X5fLtWHN0bHh1jKIs9xXOqvCo=;
        b=gIZdu0zr3ZpqagrNEPWKcIoKlDQ3CN3N4AfPVFDzDwIzpjXbYoPYUXkop+y/aLEtfz
         3ettPFVeGcLlr4fq/lsEw/tIMWiYKroW2ITLgrbICh3bDGmgLCVh6HAKLS5dpdQCbaVy
         TCIFNQayODjdnB/b9uuRoOQgHzdMgPjVIV28h1P3VJF4tAUmlXEa2xB98R9EEl31VcO1
         lOmjoaGvnJE9sbfUTDEQ/2zk2O/nnntaNJHqYHPyuQXesjFftBABGdTFcO1IzothY6X2
         OVwnFlQeHYu6d67xD5WlSGxktHzDZw59uV4aqO6sldVr0vaeBBTGfaDNPmcTqipGzS7+
         dJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFWC5fpqRaGTrdHip1X5fLtWHN0bHh1jKIs9xXOqvCo=;
        b=LRhntQR6jrsaq8nWGvYI0+LkKkr1BViFphLYcrcpqoi7/Xi2AZ3r//9hYBakStZ8DC
         7x7QZTtdmDyV5P4H98uywImaDfnE06GeY1/gJgVkmABRKa/irXCEIhvqk8ttx7JKf6Yv
         Ic4E7E/NC91h78Yk5ZBw9xyv3AsuzIvswZ2dK+1bnGerNkvEXK5o33QZ2icN9cCAWOyp
         WLGbgcVG+G53pt468rMD4cz6/pb8kZlBgv5jgdR6c1OCWIS8PGBNR0nQEpUw/4hLmioT
         bgxMSgHwA8xAnN/xxTmq2Gt+EB8kym7IQQF7D0FY+yGB+mqQsXSWDxP7XulN0H1h8+Jr
         kN4w==
X-Gm-Message-State: AOAM530IBXJOrUP5AmrORANCmmBGo9DIBbWXZZoyZjLy4626cX/0ehOW
        a6Angyv1wiCu/r7SJF37GzDswxqbzmYhJfvdD3dnKQ==
X-Google-Smtp-Source: ABdhPJxLhId8udASljWKtWTJzDPUFg816nivtvIYhzWVhtN58/ebBXiVacPTAsp7k3xt4DZI1GvNbhhx7lELMqrLl6k=
X-Received: by 2002:a05:6902:102d:: with SMTP id x13mr7583894ybt.40.1620321688463;
 Thu, 06 May 2021 10:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-3-robert.marko@sartura.hr> <20210506140024.GB3340759@robh.at.kernel.org>
 <3905879e67d50d6a7f73fcd83982c052@walle.cc>
In-Reply-To: <3905879e67d50d6a7f73fcd83982c052@walle.cc>
From:   Luka Perkov <luka.perkov@sartura.hr>
Date:   Thu, 6 May 2021 19:21:17 +0200
Message-ID: <CAKQ-cribKLfiZqTyBe_OtPzKGk5M2_8+0ov-D4-hTei5aouDtw@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Michael Walle <michael@walle.cc>
Cc:     Rob Herring <robh@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>, lee.jones@linaro.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jdelvare@suse.com, linux@roeck-us.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Jonathan Polom <jmp@epiphyte.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>,
        =?UTF-8?B?Q0xFTUVOVC5DSEFORyDlvLXlvJjmhbY=?= 
        <CLEMENT.CHANG@deltaww.com>, upstream-wg@lists.dent.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Michael,

On Thu, May 6, 2021 at 6:40 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-05-06 16:00, schrieb Rob Herring:
> > On Fri, Apr 30, 2021 at 02:35:08PM +0200, Robert Marko wrote:
> >> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
> >>
> >> It is a mix of input only and output only pins.
> >>
> >> Since there is no logical GPIO numbering arbitrary one is used
> >> along dt-bindings to make it humanly readable.
> >>
> >> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >> ---
> >>  drivers/gpio/Kconfig      |  12 +++
> >>  drivers/gpio/Makefile     |   1 +
> >>  drivers/gpio/gpio-tn48m.c | 191
> >> ++++++++++++++++++++++++++++++++++++++
> >>  drivers/mfd/tn48m-cpld.c  |   6 +-
> >>  include/linux/mfd/tn48m.h |   3 +
> >>  5 files changed, 212 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpio/gpio-tn48m.c
> >
> >
> >> +static const struct platform_device_id tn48m_gpio_id_table[] = {
> >> +    { "delta,tn48m-gpio", },
> >
> > Looks like a compatible, but is not. I think you can drop this and just
> > use 'tm48m-gpio' (the driver name).
>
> I'm just curious, why isn't the vendor included here (as there
> might be a chance for name clashes in the future).

I'm looping in Clement from Delta as well as the Upstream Working
Group from DENT [0].

Thanks,

Luka

[0] https://dent.dev/
