Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B349C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 08:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57862613B6
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 08:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhEUIVX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 May 2021 04:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhEUIVW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 04:21:22 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE3AC0613ED
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 01:20:00 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id m1so15823128ilg.10
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=crfUFGTPalD4yXSTJwQEUnL2QL5B6TGLL3FiBmjfI84=;
        b=2JogOMKudm0mxROFyquyt69B7PYnzHPTbHOAOutNWuvHCNn3QO0xdo4kQDYulHhLJO
         bd9nIYQCpwjSqq5ZmRwFZnPgIjBvEhZcFWUYbveq4WRMu/1K6tf9Wb0rVi8I0OiQjpdb
         mDjDZfv4zp2qkyHlwvtnjEg65lJ7IbEGBUX12YnRbEnC6xkpISPNmTK07uryUQKrpRPx
         SmlQDd/Yyd345vY+kPP3ZDHS+nooBiXHiJkq/TggzOh7sNsJpHOWi9LOdKozkfNVzHUY
         Q0TE/wsQlGuHq0/FOAfoViEwMoyKOwrVcZ8EGTth3Xgrr1WJX/0H1bUdlPKbZvXvsQka
         ehfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=crfUFGTPalD4yXSTJwQEUnL2QL5B6TGLL3FiBmjfI84=;
        b=mbSolSeAV/k81pVE6QDqbsB8EpPyjRgUKqBgG9j4P9FI9k6r5dU1aiSExafy1hjiuK
         37AWxl0ebLB3r4M8KFJBHH+J6FxTNqKAa2eONqEn9xKpLUckIBV23CZAsi0AQ9nLB5/Y
         /6DMUj2ch0SyesB6/uxe1JMK0hFwxKFH/cHnoDUU5EDPepibcQNsHbvMfYzV2V41+hxT
         84m4lRUziPD9OG5V4+/k/BbW9oW7r/e4tDp5VjMLiLXNBVNL7CZvIqaluHsE9mwhDtky
         F4xx1AT0sctJIa8DFfCuj2Dn9tMXGjBJqA6YIRrDKPY+PRFxusuqF3mCS7KrqEAvi29m
         AnHg==
X-Gm-Message-State: AOAM533krCmOr/sXcpQUOsMfOqBhjWB45mKVW32MU0gzEM9IuhIZ/uZ/
        31z2YJOIzndfg/MWtxO/DUo7/KqesVYJx77o6zBexw==
X-Google-Smtp-Source: ABdhPJyau7+pJ3utV7hS4AIVYk+mKqhheG8tWJtpEQAkPNa4Ua+zo1rd0NNd6w5BdgqknR/MLa+2U3zQHY+C1Ajm2BI=
X-Received: by 2002:a92:4b08:: with SMTP id m8mr9882070ilg.183.1621585199636;
 Fri, 21 May 2021 01:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <af4923ef1ed0693fcd67d7986348b164@walle.cc> <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
 <0f28cabf858154842819935000f32bc2@walle.cc> <20210520064929.GM2549456@dell>
In-Reply-To: <20210520064929.GM2549456@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 21 May 2021 10:19:49 +0200
Message-ID: <CA+HBbNG62bJC4ZiH0WRVYnN1AC=J5eJQPo_46tS67xNzP1L0DQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Walle <michael@walle.cc>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 20, 2021 at 8:49 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Wed, 19 May 2021, Michael Walle wrote:
>
> > Hi,
> >
> > Am 2021-05-19 13:53, schrieb Robert Marko:
> > > On Thu, May 6, 2021 at 6:34 PM Michael Walle <michael@walle.cc> wrote=
:
> > > > Am 2021-04-30 14:35, schrieb Robert Marko:
> > > > > Delta TN48M switches have a Lattice CPLD that serves
> > > > > multiple purposes including being a GPIO expander.
> > > > > So lets add the MFD core driver for it.
> > > >
> > > > Did you have a look at mfd/simple-mfd-i2c.c?
> > >
> > > Yes, that was my first idea but we have a requirement to expose CPLD
> > > information via debugfs as there are userspace applications using it.
> > > And simple-mfd-i2c does not allow us to do so.
> >
> > Mh, last time Lee wasn't very fond of having a driver that just populat=
es
> > sub-drivers while doing almost nothing itself. See
> > https://lore.kernel.org/lkml/20200605065709.GD3714@dell/
>
> Right.  I still feel that way.
>
> > That being said, I'd also like to expose our CPLD version, but until no=
w
> > haven't found a good solution.
>
> Why though?  Does S/W *need* it?
Because we have userspace S/W that uses it as the same CPLD is in
multiple variants of the board but the correct board model is set during
manufacturing and we can read it from the CPLD.

We also have information about PSU1 and PSU2(Some models only)
power good, whether they are present and some other info that I need
to expose as these are monitored in userspace.

I planned to do that via the hwmon driver but according to Guenther they
are not hwmon attributes and I agree.

Would it be possible to have a dedicated driver that would only expose
the required information via debugfs?
Then I could simply use the simple I2C MFD driver with only a GPIO
driver on top of it.

Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
