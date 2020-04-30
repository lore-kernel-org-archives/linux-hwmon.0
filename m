Return-Path: <SRS0=c/8F=6O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEB9C83001
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Apr 2020 08:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A1E620784
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Apr 2020 08:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NC3ifVGm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgD3I2p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Apr 2020 04:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726765AbgD3I2p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Apr 2020 04:28:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D25C08E859
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2020 01:28:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so626307wra.7
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2020 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LXDuT+zyGwOMNyTmTsYthl+Wi+xniB67Z/MFEM9n6zI=;
        b=NC3ifVGmMaCmp7oxNCFOQKQ2zpOmDHCSdE4+9gKuDrjd1a3OPhghlhXvl96rWxXvjg
         qDoqa5EvKHOg7jJnCyKEBYcEgvL/nu3KFcYelURkzVuOeumTb8ITNTLPv06+5vdSaU49
         xD7vmkV8WkTnOxh6TR4objPG1vjBWVuDzFz1YobrqWF2nJUn3GSnVfQD1zk6+rEimFUh
         eUeRnfc1tbi3K1FsnEbBuNcWBzn1Csdj4ZOuDbViRqTpZJA78q7A1xga2EvUp12srDDJ
         o+pejIP8MCgfj+rCEa6prbLxjID3FxuLqKjoF5vIF4Sj/93ozvJt142otHVjgEeDkAEJ
         sHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LXDuT+zyGwOMNyTmTsYthl+Wi+xniB67Z/MFEM9n6zI=;
        b=ToDL1uwyxlPmz2Qx/egN3T2kxaKgK46Vyjs02hDMgBMMEsBLMBp9BSrcD83ZZbiIXL
         FXLuJaszrpBl2GYSeeexu++XNC9A8LHwWAdMNGAHWWWASjGSf4wPiZTEkLteemW8+35e
         p4Jy0ZCG4L2j+s2j2bYpZVBHzaugGzp5DVAOFAW4KzZxUzVoiM2M0ZHy0bygPf35LIJG
         pPvuFizk5sj/fxziciwWXfokvEKbT+HIdd8ituWPNCkuIaAotQGwgJ8xE3+OaMBHnkLF
         zVJqoowTXQjAtMuU/JdJw1Xgs3QqwY6RyS3ROIQ+nNe3Bn05rWmW9dDQd6C+UBRx8fqV
         RjNw==
X-Gm-Message-State: AGi0PubOUNF4g9m4cuLoV8jHDvO+S0y2cp6p0nKjK5uBXkIwmVE01+E/
        VEfp32DbmxKKMl2dRLOIz7lpuw==
X-Google-Smtp-Source: APiQypKIUnLYlQCahL0Xw2L9IO7WtZnvy2PZ9aE4GZuaDaKz/sreP2lKI22TFuQqRQZosaNtaTG8Fg==
X-Received: by 2002:adf:dd4c:: with SMTP id u12mr2514666wrm.395.1588235323498;
        Thu, 30 Apr 2020 01:28:43 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id i1sm751258wrx.22.2020.04.30.01.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 01:28:42 -0700 (PDT)
Date:   Thu, 30 Apr 2020 09:28:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Robert Jones <rjones@gateworks.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 2/3] mfd: add Gateworks System Controller core driver
Message-ID: <20200430082840.GB3118@dell>
References: <1585341214-25285-1-git-send-email-tharvey@gateworks.com>
 <1585341214-25285-3-git-send-email-tharvey@gateworks.com>
 <20200428094426.GL3559@dell>
 <CAJ+vNU0UCugbM7Q7WZ1Hw-U=Je483jYGdrvS0Vq6idxtuUmz2Q@mail.gmail.com>
 <20200429063319.GV3559@dell>
 <CAJ+vNU1e10F_g51UXgJ+o1R9zhf_1J9xHJ6SYEuZC4615QfG1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+vNU1e10F_g51UXgJ+o1R9zhf_1J9xHJ6SYEuZC4615QfG1w@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 29 Apr 2020, Tim Harvey wrote:

> On Tue, Apr 28, 2020 at 11:33 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Tue, 28 Apr 2020, Tim Harvey wrote:
> >
> > > On Tue, Apr 28, 2020 at 2:44 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > <snip>
> > > > > +
> > > > > +static int gsc_probe(struct i2c_client *client)
> > > > > +{
> > > > > +     struct device *dev = &client->dev;
> > > > > +     struct gsc_dev *gsc;
> > > > > +     int ret;
> > > > > +     unsigned int reg;
> > > > > +
> > > > > +     gsc = devm_kzalloc(dev, sizeof(*gsc), GFP_KERNEL);
> > > > > +     if (!gsc)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     gsc->dev = &client->dev;
> > > > > +     gsc->i2c = client;
> > > > > +     i2c_set_clientdata(client, gsc);
> > > > > +
> > > > > +     gsc->bus.reg_write = gsc_regmap_regwrite;
> > > > > +     gsc->bus.reg_read = gsc_regmap_regread;
> > > >
> > > > Why do you need to store these in ddata?
> > >
> > > Lee,
> > >
> > > Thanks for the review!
> > >
> > > I need the remap_bus* for devm_regmap_init() in the hwmon sub-module driver:
> > >
> > > hwmon->regmap = devm_regmap_init(dev, &gsc->bus, gsc->i2c_hwmon,
> > > &gsc_hwmon_regmap_config);
> > >
> > > Is there something easier I'm missing?
> >
> > This is an odd setup.  I haven't seen one driver registering another
> > driver's Regmap call-backs before, related or otherwise.  Normally the
> > Regmap is setup (initialised) in the parent driver and child drivers
> > just make use of it.  Here it looks like you are registering 2
> > separate Regmaps, but using the same call-backs for both, which seems
> > wrong to me.
> >
> 
> Lee,
> 
> It is perhaps an odd setup. The hwmon sub-device is at a different i2c
> slave address than the other sub-devices. The same callbacks are used
> for reg read/write to take advantage of the retries due to the errata
> resulting in occasional NAK'd register reads.

Then I suggest putting them somewhere shared or exporting them.

Passing pointers to the via ddata sounds a bit batty.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
