Return-Path: <SRS0=A6DV=6M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2F3C83000
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Apr 2020 19:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A63B2070B
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Apr 2020 19:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="rR3xUz/+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgD1TVb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Apr 2020 15:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728540AbgD1TVa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Apr 2020 15:21:30 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C536FC03C1AB
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2020 12:21:29 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id i9so4959142ool.5
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2020 12:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uXcp+uKgbSVcG6/mpY6FU5AZWFkgd0Nj9B5N1XLmhEk=;
        b=rR3xUz/+5SrD2fxd27mqNrmdtzg9VEnGX/7Y42gse1/5fg5CIpMfqQlDKydeTY160H
         YoAm6BggaOquf5mGuHeC2GyHJUqOAqEQyqN2Qh+8jIq1+c/5UQIt99uSomVfuWltTeIj
         x6yFG8vaT1HQ9jTzQnCkUP6DVle6SZ9+b5dEp/eTV5dbtmn0+ujFGJxwfjMVdEOQaGTG
         hWqnUYx45yhgsFysINSMKCc68uZNUGuXC22786JihnVtMq16B663EnlytZbn/z+tczra
         04CwLco+uTMW5J0xmny9oCP77sR9Gdwlera7rALtNeOaFL7/b1txbVBcmLPqXRvWGh3E
         vsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uXcp+uKgbSVcG6/mpY6FU5AZWFkgd0Nj9B5N1XLmhEk=;
        b=muea1O5Dm+jomLNcgFhhxhEoZokGO1cWTBg22ncYVwLkREq8zl9iaHVMb3GRQGX4Z+
         0Qb6lm9NuMOBFy4u51GwezqwI0QBy8k9cVfF79mkkU4BaGBhsytC8JGeVD/M2fqNiHDF
         w2SEJdmWej54Yqo7tzX/em8XFIx3wE1RPEmdbGQD+xkZ3gbgwHERqAoyTgy1Yp/RBucg
         EspGkiaBnD/rBUhX705y2JPShmR6Z2FbMB/WAtrFN4WH28rK1gda+jCTcEsCqHOSOVRY
         j4zhkL68Bp+OjbyTGrW7i00xbPfvQ66P+zglORRtnk/uY4ZDu8JJQ/8e/hj7L5CY6F/3
         M97w==
X-Gm-Message-State: AGi0PuYk74t4h1sfTBNZmYNuUz0AVRtTp8p0hBm1TC9eIEkuTUNpSX10
        Vti2rl1XRtSxpz6k9wCK3Ro8ZGX4diqg5/dnIP85Rw==
X-Google-Smtp-Source: APiQypJpTstqKpcfAREIfkSw3AOBUiF8zoy29AApCHhbOOjmWJ5MxnfYC9IjaaUGw+zMpyWacSI5dwUCHLmUh3HjfjU=
X-Received: by 2002:a4a:b4c1:: with SMTP id g1mr24715863ooo.58.1588101689067;
 Tue, 28 Apr 2020 12:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <1585341214-25285-1-git-send-email-tharvey@gateworks.com>
 <1585341214-25285-3-git-send-email-tharvey@gateworks.com> <20200428094426.GL3559@dell>
In-Reply-To: <20200428094426.GL3559@dell>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 28 Apr 2020 12:21:17 -0700
Message-ID: <CAJ+vNU0UCugbM7Q7WZ1Hw-U=Je483jYGdrvS0Vq6idxtuUmz2Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] mfd: add Gateworks System Controller core driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Robert Jones <rjones@gateworks.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 28, 2020 at 2:44 AM Lee Jones <lee.jones@linaro.org> wrote:
>
<snip>
> > +
> > +static int gsc_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct gsc_dev *gsc;
> > +     int ret;
> > +     unsigned int reg;
> > +
> > +     gsc = devm_kzalloc(dev, sizeof(*gsc), GFP_KERNEL);
> > +     if (!gsc)
> > +             return -ENOMEM;
> > +
> > +     gsc->dev = &client->dev;
> > +     gsc->i2c = client;
> > +     i2c_set_clientdata(client, gsc);
> > +
> > +     gsc->bus.reg_write = gsc_regmap_regwrite;
> > +     gsc->bus.reg_read = gsc_regmap_regread;
>
> Why do you need to store these in ddata?

Lee,

Thanks for the review!

I need the remap_bus* for devm_regmap_init() in the hwmon sub-module driver:

hwmon->regmap = devm_regmap_init(dev, &gsc->bus, gsc->i2c_hwmon,
&gsc_hwmon_regmap_config);

Is there something easier I'm missing?

Thanks,

Tim
