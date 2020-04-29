Return-Path: <SRS0=bhe0=6N=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B13FC83006
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Apr 2020 14:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75F7D2083B
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Apr 2020 14:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="OTk4BhDe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgD2OuX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 Apr 2020 10:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727069AbgD2OuX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Apr 2020 10:50:23 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E70C035493
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2020 07:50:21 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 72so1911643otu.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2020 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qyI0SNEnQtXEbJwY1Ck/cg35XSFvpALxjDJPBXBhrnQ=;
        b=OTk4BhDexgtYj45AbedwxqiaNtEWMz5vICEz3FjS2ASgEs8RDykY5nycZKJdyYbvnn
         xdYRSxrMo55Daa/iS9BaQRTfDRlJL96e4tSX6UHp/duPNiog6mElo/qalSUKyuNe2+2N
         FywOGF2rs+Lg/lbWRbixNls/EZK2awg/bnYNn07l121KiDC7cS3+PpjNLSCT4vphjz9Q
         8+Qvo/Jpc4uxv0X7IfL1rgTr7vmGDeAVK+o2Evv+5128QbHUGYjhzwz3j8odYXtGvUjn
         MHsz/jK4o0FM3/8LMB8RHP46ODdQNZsg6uZaFmQaGKJ55XRjyCSufzRH3kpLiEfiZ5zN
         8GxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qyI0SNEnQtXEbJwY1Ck/cg35XSFvpALxjDJPBXBhrnQ=;
        b=D6khUBa1Zu+VnjTMa/ItNBDKSX18L+nQFiyeY76Xbc5d5QDfoJzz49Nu9Mdo9a6lUr
         sTnScuWIVvP6Q6aExBNWfnhv33t8/UOvjfGnHIetzLrbTcmy38F0TeDvQj8E6QgL9TQ/
         pBgBJKdfqotQR1ml28tosd/TxgSuAXt4ZH5UR8Lwk556Hd+eOuzl+Mpkaa6njKxweoej
         tlckhdF4VGJv3JE6Nf4VBVmjRXFCEqZbhNJ9+rOdIvmNYonyQoT4Mu+qEcSwkL7q410x
         KaU+u3U7W/n2DgF47F+fFIVTUjl2cgxwUj8HX4PNj5VUC7AiV6yUGYRuMtQ5x82ZSVwY
         CmRA==
X-Gm-Message-State: AGi0PubTkx9jZYMaqWWDmkqPtghU4RUXIgLqFpEUSECIljojkFIkfBGm
        kfyCOSYAErXyEF2ETk4M/rQ4xuaLhj1yRv4yCgl19Q==
X-Google-Smtp-Source: APiQypIXL8I2wEME01DT2EGMJ0/M/DnYHbWLA+pVPwZCB7X9EbvdQ5yUHo7uSB8IJZb4WwLhqG0FGhPpcw/e0s52+Ik=
X-Received: by 2002:a9d:2f48:: with SMTP id h66mr24840284otb.252.1588171820828;
 Wed, 29 Apr 2020 07:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <1585341214-25285-1-git-send-email-tharvey@gateworks.com>
 <1585341214-25285-3-git-send-email-tharvey@gateworks.com> <20200428094426.GL3559@dell>
 <CAJ+vNU0UCugbM7Q7WZ1Hw-U=Je483jYGdrvS0Vq6idxtuUmz2Q@mail.gmail.com> <20200429063319.GV3559@dell>
In-Reply-To: <20200429063319.GV3559@dell>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 29 Apr 2020 07:50:09 -0700
Message-ID: <CAJ+vNU1e10F_g51UXgJ+o1R9zhf_1J9xHJ6SYEuZC4615QfG1w@mail.gmail.com>
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

On Tue, Apr 28, 2020 at 11:33 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 28 Apr 2020, Tim Harvey wrote:
>
> > On Tue, Apr 28, 2020 at 2:44 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > <snip>
> > > > +
> > > > +static int gsc_probe(struct i2c_client *client)
> > > > +{
> > > > +     struct device *dev = &client->dev;
> > > > +     struct gsc_dev *gsc;
> > > > +     int ret;
> > > > +     unsigned int reg;
> > > > +
> > > > +     gsc = devm_kzalloc(dev, sizeof(*gsc), GFP_KERNEL);
> > > > +     if (!gsc)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     gsc->dev = &client->dev;
> > > > +     gsc->i2c = client;
> > > > +     i2c_set_clientdata(client, gsc);
> > > > +
> > > > +     gsc->bus.reg_write = gsc_regmap_regwrite;
> > > > +     gsc->bus.reg_read = gsc_regmap_regread;
> > >
> > > Why do you need to store these in ddata?
> >
> > Lee,
> >
> > Thanks for the review!
> >
> > I need the remap_bus* for devm_regmap_init() in the hwmon sub-module driver:
> >
> > hwmon->regmap = devm_regmap_init(dev, &gsc->bus, gsc->i2c_hwmon,
> > &gsc_hwmon_regmap_config);
> >
> > Is there something easier I'm missing?
>
> This is an odd setup.  I haven't seen one driver registering another
> driver's Regmap call-backs before, related or otherwise.  Normally the
> Regmap is setup (initialised) in the parent driver and child drivers
> just make use of it.  Here it looks like you are registering 2
> separate Regmaps, but using the same call-backs for both, which seems
> wrong to me.
>

Lee,

It is perhaps an odd setup. The hwmon sub-device is at a different i2c
slave address than the other sub-devices. The same callbacks are used
for reg read/write to take advantage of the retries due to the errata
resulting in occasional NAK'd register reads.

Tim
