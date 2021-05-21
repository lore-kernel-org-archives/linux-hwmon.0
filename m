Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDBAC433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 09:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4CE5613BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 09:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235471AbhEUJIU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 May 2021 05:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbhEUJIT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 05:08:19 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12E5C0613CE
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 02:06:55 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id b25so1105048iot.5
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Blq7G9mzB3hHpQKtwZ3S4wZgfLIsx29Hl5GOAjTVfiY=;
        b=nO68vVW9QHUttI2oQdlt/vmb0t4+UKIEdA4QBK2eT4RQ1KNgN9tbNIXSBYsJJNDgy7
         vCnqBU24iO6SHIqe5EPOX2RQ/EZEcceHUui5oGMlHK3I6HxamRkVgOAjAQa9mw/6FILB
         Oud+PAaJ9/H/jVZaSvSP9gutZAjJupKWFLVGuLqKtVBjvOzwNkvKav0L+A560wULPOBL
         E9qnclzj0S6wrXyVZk8PQwfJAD5JxJ4BLFxpPmTf3hUS9JfsPPnPu4lRGeoIAvMxYPai
         ennFh2/SOqP+k6wYhphtq6b1qfm/ywQfzFNyuxND27E9dG/Xw5CZP3y5g7bou+4fYw78
         WTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Blq7G9mzB3hHpQKtwZ3S4wZgfLIsx29Hl5GOAjTVfiY=;
        b=fo5yi+eqjnUNGRuMQkMeno1kcEiAyKJvMl/7AClgWAbqzVFCxxo6yCUrBbM7aNp61d
         fbpcua9kom8UVydw+xp/LH12UPj9I4IJBfnD0mRGGUB0fSgO/1cFiKhvsTWdI4MNGIhh
         eg8FENLRPjwl1wdpxb88dGF0XG6hXYksLxliZqqNSn3d4SHmjLQuxrVm6w/yRiJEsVFA
         3wGx0n4FYIIow88JoHMJRy3UY+xobgUm9X/ElTwN2ikxnlFKmGqaoU1M4/ZslThDPq9O
         VP+vDA8lxSmLbarIM8Op1oktCfV9pvkYGPdXi9+jpnfMxpFfSnxU5ngw43Y/LG9XTZDN
         JA/g==
X-Gm-Message-State: AOAM532Vj5aQMcNaHfjDz/dti9G01/LIQuxLa71wj4jZT530zlT+QDma
        N4f/Iviya2mgsfvxo0YU/cvWdAMQmT60dvuvuSw4ibSNJjAA+A==
X-Google-Smtp-Source: ABdhPJyerN6/E5/qWHR1DKRoc6VGmFkzhhN9wmq5HxK2huJFfcWHjP7H4X6dNm57RehUsIQKwu42TKelMmt2JUWemnQ=
X-Received: by 2002:a05:6602:134c:: with SMTP id i12mr10839236iov.175.1621588014963;
 Fri, 21 May 2021 02:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <af4923ef1ed0693fcd67d7986348b164@walle.cc> <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
 <0f28cabf858154842819935000f32bc2@walle.cc> <20210520064929.GM2549456@dell>
 <CA+HBbNG62bJC4ZiH0WRVYnN1AC=J5eJQPo_46tS67xNzP1L0DQ@mail.gmail.com> <20210521090357.GD2549456@dell>
In-Reply-To: <20210521090357.GD2549456@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 21 May 2021 11:06:44 +0200
Message-ID: <CA+HBbNH9BMbV9G_Emc4qfoKkdK3YYRmY16cNd_Hu5h1Ch0wctw@mail.gmail.com>
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

On Fri, May 21, 2021 at 11:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 21 May 2021, Robert Marko wrote:
>
> > On Thu, May 20, 2021 at 8:49 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Wed, 19 May 2021, Michael Walle wrote:
> > >
> > > > Hi,
> > > >
> > > > Am 2021-05-19 13:53, schrieb Robert Marko:
> > > > > On Thu, May 6, 2021 at 6:34 PM Michael Walle <michael@walle.cc> w=
rote:
> > > > > > Am 2021-04-30 14:35, schrieb Robert Marko:
> > > > > > > Delta TN48M switches have a Lattice CPLD that serves
> > > > > > > multiple purposes including being a GPIO expander.
> > > > > > > So lets add the MFD core driver for it.
> > > > > >
> > > > > > Did you have a look at mfd/simple-mfd-i2c.c?
> > > > >
> > > > > Yes, that was my first idea but we have a requirement to expose C=
PLD
> > > > > information via debugfs as there are userspace applications using=
 it.
> > > > > And simple-mfd-i2c does not allow us to do so.
> > > >
> > > > Mh, last time Lee wasn't very fond of having a driver that just pop=
ulates
> > > > sub-drivers while doing almost nothing itself. See
> > > > https://lore.kernel.org/lkml/20200605065709.GD3714@dell/
> > >
> > > Right.  I still feel that way.
> > >
> > > > That being said, I'd also like to expose our CPLD version, but unti=
l now
> > > > haven't found a good solution.
> > >
> > > Why though?  Does S/W *need* it?
> > Because we have userspace S/W that uses it as the same CPLD is in
> > multiple variants of the board but the correct board model is set durin=
g
> > manufacturing and we can read it from the CPLD.
> >
> > We also have information about PSU1 and PSU2(Some models only)
> > power good, whether they are present and some other info that I need
> > to expose as these are monitored in userspace.
> >
> > I planned to do that via the hwmon driver but according to Guenther the=
y
> > are not hwmon attributes and I agree.
> >
> > Would it be possible to have a dedicated driver that would only expose
> > the required information via debugfs?
> > Then I could simply use the simple I2C MFD driver with only a GPIO
> > driver on top of it.
>
> Yes, I was going to suggest that.
>
> It should probably live in drivers/misc.

OK, that works for me.
I will then rework this for v2.

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
