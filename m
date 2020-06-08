Return-Path: <SRS0=E0ck=7V=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B50C433E2
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jun 2020 14:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 651CB2074B
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jun 2020 14:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZfPL8w5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgFHOYV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Jun 2020 10:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbgFHOYU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Jun 2020 10:24:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F89C08C5C7
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2020 07:24:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e1so17633086wrt.5
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2020 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fIhwy13PVaO5F8p6kg+GqvngU7Ke/x9Dg12+TRbhC9I=;
        b=CZfPL8w5fOBsBIx+z/oomYpe+rnOnlu08HlfeLxZxWn4DvD8EV1jvidfa2G6obPNXw
         wcLLWFtkhMqdqFwD6ucKN3p6mzAsg7HanEknR4Sla4G+4jcKzr/fpU1V57aBb/7AYoPw
         a+qTL3H1zDbkTzdEZSwS+EOshh5JBGPjQ8vruPaNy4+5DBNBZZqQkTMEdK4IxTK5NACU
         GGIM6BOSbSswTePVvH+wIByXOpNUEHdrrZU7+rCQFlWfiin1e/xF6lbhT4X8YtTuAVEZ
         Fa5yd03P+4vcSrJt3xaJlQ1FH4O1ETJFfjANj9H1Awd+M9I8eobjJwDd948h9av12Eua
         cTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fIhwy13PVaO5F8p6kg+GqvngU7Ke/x9Dg12+TRbhC9I=;
        b=Dhi3ARMzKGKg6OsufP5wH9hhszMlfosMbwOTGpHDMQmGMqfkj5KVsiEOSLLzQD7Zl1
         FbfepaXXG0QXTbkkSyE2qoS1rbHjSvJit9B0u30K+7MujaE0KiOfzZj2GmNi27vpAWgB
         s3IxQU9Tm87ZMnUd8ODhxooYwrkAmD9jbFFYxhoWgliFk8K8rrAN+MGaLudrsJhtGZjV
         FkcfS28XtERBY9t9qQcXp/+7PooRcl9DhDnZrfto7gSA3YGeqK69/90TjlJT8NEBd7GJ
         L8qFGqFA8biyer4bfAbSdYikJ1n5MiZCyj7c23S/NHlgIfp+c/fbzrp+0v54L062WOWD
         iaUw==
X-Gm-Message-State: AOAM533fUQylAHbyXnLvrrrLVheloNZSl0qmNonEJycemyzuWu6ckG2D
        c10RHC5MCR/GBSKrZ5YxA3Sh+A==
X-Google-Smtp-Source: ABdhPJweehatGIr1BA4m4b/1jQsQ1TEclLtHNU4cdgilO6fq2rqBkF/6wa0DUib7fHXp5oiaj3ZdVg==
X-Received: by 2002:adf:f208:: with SMTP id p8mr21462928wro.388.1591626257005;
        Mon, 08 Jun 2020 07:24:17 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id o15sm22497715wmm.31.2020.06.08.07.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 07:24:15 -0700 (PDT)
Date:   Mon, 8 Jun 2020 15:24:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/16] mfd: mfd-core: match device tree node against
 reg property
Message-ID: <20200608142413.GA4106@dell>
References: <20200423174543.17161-1-michael@walle.cc>
 <20200423174543.17161-4-michael@walle.cc>
 <67e90dafd67c285158c2c6f67f92edb7@walle.cc>
 <20200515102848.GH271301@dell>
 <159e68b4ce53630ef906b2fcbca925bd@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <159e68b4ce53630ef906b2fcbca925bd@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 25 May 2020, Michael Walle wrote:
> Am 2020-05-15 12:28, schrieb Lee Jones:
> > On Thu, 30 Apr 2020, Michael Walle wrote:
> > 
> > > Hi Lee,
> > > 
> > > Am 2020-04-23 19:45, schrieb Michael Walle:
> > > > There might be multiple children with the device tree compatible, for
> > > > example if a MFD has multiple instances of the same function. In this
> > > > case only the first is matched and the other children get a wrong
> > > > of_node reference.
> > > > Add a new option to match also against the unit address of the child
> > > > node. Additonally, a new helper OF_MFD_CELL_REG is added.

[...]

> > > > diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> > > > index d01d1299e49d..c2c0ad6b14f3 100644
> > > > --- a/include/linux/mfd/core.h
> > > > +++ b/include/linux/mfd/core.h
> > > > @@ -13,8 +13,11 @@
> > > >  #include <linux/platform_device.h>
> > > >
> > > >  #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
> > > > +#define MFD_OF_REG_VALID	BIT(31)
> > 
> > What about 64bit platforms?
> 
> The idea was to have this as a logical number. I.e. for now you may only
> have one subdevice per unique compatible string. In fact, if you have a
> look at the ab8500.c, there are multiple "stericsson,ab8500-pwm"
> subdevices. But there is only one DT node for all three of it. I guess
> this works as long as you don't use phandles to reference the pwm node
> in the device tree. Or you don't want to use device tree properties
> per subdevice (for example the "timeout-sec" of a watchdog device).

This is not a good example, as the "stericsson,ab8500-pwm" is
legitimate.  Here we are registering 3 potential devices, but only
instantiating 1 of them.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
