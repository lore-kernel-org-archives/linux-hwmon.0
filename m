Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56706C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 06:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C2AF207D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 06:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPWisZ+A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgE0Gxt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 02:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgE0Gxs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 02:53:48 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE48C061A0F
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2020 23:53:48 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u12so1923578wmd.3
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2020 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KaQOkQA7F9aEmTtrQs4AHoVIEVINLPeKbMlE71dR8YI=;
        b=cPWisZ+A4SR3iQJ6RsEDeDne0OUCVjnfpAGxMjkPrCxzFO71csUJv0xmdBRl7npeZh
         AeFPi1ZmAv1VwihKmOwSRiZrJsJ1i6kwIn8Nkt2Ls6PrSh4pmaZSr97snzWfE0Tn5x79
         bn5tQlmvjopqjhhwA+8717mpKH4FIRbM2wsps9Yaybn+1Sbdk7PQ6e6xPJok7tTW3hQT
         6R8cBzso9tSPzo2k0UZJPVj9XZDBCfP717btD4AxbyDHH0f/x517SgR/trJkcSQlO6BB
         UekgSoUHoJVz0M2m9h5Iu/ibOmd2JCvlYeh977CW4E0Cm+pKuCkVczG89O4X7pFde+o4
         gPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KaQOkQA7F9aEmTtrQs4AHoVIEVINLPeKbMlE71dR8YI=;
        b=Ndh/5hZ5VAF+IxSkz7jh1BIZsNoYO/R8+zskxrYRFaG0uK0STbrvYwm5Tm+R8wd7h0
         YyZEdoOPZeRkSg3nV2mXC0qA2U47Ht3lGhejHQhE+egJ/SELHcbGAFeTNd1VgZ40V16p
         NlQubzLcbOCSXoY8E4ygA6a+JP+OD/qWGK1fpiuD1By3KaUdiqBIXtf+y3sTeBe8y20y
         8Zz+ZPzcdb+zpO1vNsN/P3cuLSc2myWHyAJZgDhWzPLKCw7kKbGFnYj7FZ98BHtFuFIk
         NcIt5PrSNwFeUJKHj4k5fJj9L4SVMGh88oariy0B3fSivDgzp8hascTioN0gy4SLM3dS
         a95A==
X-Gm-Message-State: AOAM530WVltW/zCDwECALgkaecwxyPar2/OjEv2Ys7yLY+6Klf4cODSL
        tRX6aQTHcE0CEBJ5PPZo5Rr3pA==
X-Google-Smtp-Source: ABdhPJzEz2uP3oWCohWVrLCnTYgAhvZIGv77IRU3z+lWX42qdjUmDcj2EC+NMT9wwZk7n/CATpsnBg==
X-Received: by 2002:a1c:25c3:: with SMTP id l186mr2814857wml.103.1590562426704;
        Tue, 26 May 2020 23:53:46 -0700 (PDT)
Received: from dell ([95.149.164.102])
        by smtp.gmail.com with ESMTPSA id p23sm1900743wma.17.2020.05.26.23.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 23:53:46 -0700 (PDT)
Date:   Wed, 27 May 2020 07:53:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Walle <michael@walle.cc>,
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
Message-ID: <20200527065344.GP3628@dell>
References: <20200423174543.17161-1-michael@walle.cc>
 <20200423174543.17161-4-michael@walle.cc>
 <67e90dafd67c285158c2c6f67f92edb7@walle.cc>
 <20200515102848.GH271301@dell>
 <159e68b4ce53630ef906b2fcbca925bd@walle.cc>
 <20200526072427.GC3628@dell>
 <f5704ce5a3e280f63c81fe35efb08234@walle.cc>
 <20200526160336.GV1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526160336.GV1634618@smile.fi.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 26 May 2020, Andy Shevchenko wrote:

> On Tue, May 26, 2020 at 05:54:38PM +0200, Michael Walle wrote:
> > Am 2020-05-26 09:24, schrieb Lee Jones:
> 
> ...
> 
> > Like I said, in the long term I would like to have support for
> > different versions of the board management controller
> 
> > without having to change the device tree and have device tree bindings for the
> > subdevices at the same time.
> 
> But isn't device tree to describe *very specific platform* rather than *class
> of platforms*?

Yes.  Device Tree describes the hardware.

If the hardware changes, so must the Device Tree.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
