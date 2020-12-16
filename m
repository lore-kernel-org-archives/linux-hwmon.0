Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05BAC2BBCA
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 17:28:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77A2523382
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 17:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgLPR2h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Dec 2020 12:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgLPR2h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Dec 2020 12:28:37 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F32FC0617A6
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Dec 2020 09:27:56 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id h4so18458355qkk.4
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Dec 2020 09:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbVVb/3tBHQOeW2N0lGixFal7rrlyqRe0NYW7h5mJws=;
        b=df7mMBu2TQ/GxHbt3CKlE9kBX3thvKUQtLR6UQ0lqs1fISdjOZScd52uzgwcN83k8Q
         UEO8SFUp7FaxL9CZudC5Ze00tfKvOgeQo+eGDZtPLRAWElRDEEpHeErhKeYd/rXD+RIJ
         XEyTkZHSU4ZD0JXQhjKUL8VU+XijhQbYqNucF9P+kHeFMcsfzQJ5VmwCYupuEIjWSeV7
         AzDihoBDFLgx8xeTHPgRf+wBGnwJxT5UK81aol/KFgzR+fa7DWTxkh+FFThIpRLUpecK
         AI07lPfsqZpdfaBThI6NM6GC3Rcps+K9yBXbq6Y26LveZ2CueiK8aAlBxmbLh3oRIO/D
         7+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbVVb/3tBHQOeW2N0lGixFal7rrlyqRe0NYW7h5mJws=;
        b=ACYDt+TeCYX1hezcZZ5z3owabXihey7KELr3Xh0+wckSgJ+X9My6gwsxenlwym7f0Z
         Ir1/gzJoykwchOkODEW088Gj8+mJzh7mnswpfq6Guv3p/98hIPuqfOtyCGVtCxorcTKQ
         UL/kFgV9hhkCiApueb4hmm9EMoAU6mh/yz2DY1gOvaIpq+naGjJujjbZqKDK8+ukbcrQ
         /pk5JV7m/dpLkSHsG7S4Y47zyfvqZzw5KWY3uSqLjU46e0VYRAEQ8H9YLH4jarm44VtM
         pl2S/yujKjXFy3Y79YXEk8FyU7pBnr6sgvVKlFehF+C3nT+opiK3vMutYfl8pV3s33w0
         GZlw==
X-Gm-Message-State: AOAM531Do5KVYpE+1gjZZ/GA/Z1FOZLNHEzffb/9QQrVcvKqHHHLE7EN
        euihenb6Eo+/Pdf3lflWYxV38Ew3sC+Kz9kI3yfZBA==
X-Google-Smtp-Source: ABdhPJyKQE12XBOKvOQ1FMhyqrjGDCwscGWGuZr8KvzYRLNW9jyIe1uKwdJnLz5j9Wrf4O7RcY8Gm+wmO7GQib9dQpI=
X-Received: by 2002:a37:b982:: with SMTP id j124mr46935220qkf.1.1608139675605;
 Wed, 16 Dec 2020 09:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20201216163103.GA59351@roeck-us.net>
In-Reply-To: <20201216163103.GA59351@roeck-us.net>
From:   Kun Yi <kunyi@google.com>
Date:   Wed, 16 Dec 2020 09:27:28 -0800
Message-ID: <CAGMNF6V-w47SDAUgVAtG+Xrp0ECNOvVV1Xy5=FsXTwqc-c3NbQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: SENSORS_SBTSI should depend on X86
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 16, 2020 at 8:31 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Dec 16, 2020 at 02:46:41PM +0100, Geert Uytterhoeven wrote:
> > The AMD SB Temperature Sensor Interface (SB-TSI) is only present on AMD
> > X86 SoCs.  Hence add a dependency on X86, to prevent asking the user
> > about this driver when configuring a kernel without AMD X86 platform
> > support.

Sorry, I think there is some confusion. AMD SoC is a 'remote sensor',
or the client, whereas the device using the SB-TSI hwmon driver is the
master.
In industry, a typical scenario is ARM-based Board Management
Controllers (BMCs) using SB-TSI to monitor the host CPU temperature.

> >
> > Fixes: e7bb1a2ab8c4b156 ("hwmon: (sbtsi) Add basic support for SB-TSI sensors")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Makes sense. Applied.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/hwmon/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 1ecf697d8d99b70c..63d28f98108d4bb5 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1536,6 +1536,7 @@ config SENSORS_SL28CPLD
> >  config SENSORS_SBTSI
> >       tristate "Emulated SB-TSI temperature sensor"
> >       depends on I2C
> > +     depends on X86 || COMPILE_TEST
> >       help
> >         If you say yes here you get support for emulated temperature
> >         sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
> > --
> > 2.25.1
> >



-- 
Regards,
Kun
