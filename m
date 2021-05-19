Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C05C433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 11:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30795610CC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 11:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240419AbhESLy6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 May 2021 07:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352678AbhESLy6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 May 2021 07:54:58 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68552C061761
        for <linux-hwmon@vger.kernel.org>; Wed, 19 May 2021 04:53:37 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id j30so11962519ila.5
        for <linux-hwmon@vger.kernel.org>; Wed, 19 May 2021 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UW7fZiIlXVfl0Qc0/A9Hj0P585Ftj5tVT/omHdWRq4I=;
        b=xLPFHrobZa2WtMv3ql7wPlAv5Tlyo5PmflSYyt63GdY1dJxV6q/++PoWUU73Vm8I8Q
         XhykK9d/2gYBEup6fAwa2XK+Umf9GBrejU/zdN/Q5H/8/Fgml0iNnb1gBdWV8iOy8P1v
         VJBUZDNw3f4iM+zvum6Yav1e8S+RzjRmzu0EQdDYM46bamsvc9oBTDOc27AOk9ZJPMzN
         hX73g9wxPHDs13xqAScfxHl1X2NLKl1zx/r5cxUNm2PlXAJ2UXr+O1mvsXUmJHXY/j3m
         t340Ij6y4xra8yVLLznQQEYhjk9BsM/rX0jQObGJQmoKKyBeJyAiwsCqGdNfZvj/t9ir
         +/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UW7fZiIlXVfl0Qc0/A9Hj0P585Ftj5tVT/omHdWRq4I=;
        b=SsamUpqcGslhU4TL9DxkG4V9e2/mCublr3ulX62uOOvfeD/Qr5P6n4QL8PtM2DCilt
         ow7R/6tZ2NwFJ16q8JZVitaf8mr98ue+ILi04/JySosuACETlDJKOdvAjcVF8pQT1NkC
         gZOLwhfkKkKlJT79/WSYzoc0l43meugSBUz7PT3jT2JxjbKYGBKvvVLyW91zQcm1AW7H
         dOo5893GgMBjSSY3rN5VvPn7QjXTfxi8S6tlExTAewcBUS9njdpYhnjt2fO/cLS6lLcz
         mdEl1KGMOt6XfEsj7phMZ2mIpzUyOKfikBufUr+lBl65ZkeJQcwjPl8imB0B9C7SDTgQ
         esRw==
X-Gm-Message-State: AOAM533oraeCxdXeBch/A7KNcmCwxT+6S//R2aLjdWkEbHjr2vj4v1tA
        9jL1jnoiFgwCmkAHq7IV7GewXgmuUqVv7JgVBAk7Fw==
X-Google-Smtp-Source: ABdhPJyagVuDl87Slxx3PuzN9OBL7HrQnUxrISgaMw3Gc9dfiRyYygGFfRlU4U4XUgvEtNonmfbMHU8PypFnnAmBhHo=
X-Received: by 2002:a92:cf45:: with SMTP id c5mr10915199ilr.182.1621425216452;
 Wed, 19 May 2021 04:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr> <af4923ef1ed0693fcd67d7986348b164@walle.cc>
In-Reply-To: <af4923ef1ed0693fcd67d7986348b164@walle.cc>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 19 May 2021 13:53:25 +0200
Message-ID: <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
To:     Michael Walle <michael@walle.cc>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 6, 2021 at 6:34 PM Michael Walle <michael@walle.cc> wrote:
>
> Hi Robert,
>
> Am 2021-04-30 14:35, schrieb Robert Marko:
> > Delta TN48M switches have a Lattice CPLD that serves
> > multiple purposes including being a GPIO expander.
> > So lets add the MFD core driver for it.
>
> Did you have a look at mfd/simple-mfd-i2c.c?

Hi Michael,

Yes, that was my first idea but we have a requirement to expose CPLD
information via debugfs as there are userspace applications using it.
And simple-mfd-i2c does not allow us to do so.

Regards,
Robert
>
> -michael



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
