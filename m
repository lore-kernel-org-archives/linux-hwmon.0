Return-Path: <SRS0=0Rzu=CR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFBDC433E2
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 07:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8999521D46
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 07:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfT5YyvY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgIHHmg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Sep 2020 03:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbgIHHm1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 03:42:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B49FC061755
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 00:42:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o5so17952181wrn.13
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uLUFK28IISjx23/D2ml5l6aSZkYLMgDiXFORqFH61rQ=;
        b=wfT5YyvYowSvPxHb+0/UENzgICebO//M3d0DIDWTaHQEJ5O8uHUUoMmrKzjeIMQqhp
         NitiIv7XdDmxggV4H52sZ8GTfO2gx/qw5l/KSDtQ5k7j01HmFi8cILzZZTc1QulK7jLs
         FJR7s1cQa4ABR9jisaKM+w4K4OH7nPjdA5yySjFdvPdEhKp9Pdb2E5jOhpoKyKzqADtF
         9rvVG8SDZqY9Gexgx+Opxsg3NCd1mxoMtmv0mYlisOhyCFfTItVkvffAfsv2qI5glIoD
         p6y8pTSLFo/DJ8Z8ql+PhihvnyiwtfryLTFJeF/3iqnz5513istkaHH5GvpZtlkejkLV
         tDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uLUFK28IISjx23/D2ml5l6aSZkYLMgDiXFORqFH61rQ=;
        b=FoLP/ZV9nkGF6RNWswSREPVCKK+cF0lNHfCy8SyuogT22eUjuoRXQKP/d9e9CieKG7
         2FjWGIWYAQ811gp74R021DoStpRi4QHZX8SYes5wzJzmbm5eufxQ9crtiqyrTL1nf9PW
         Uirb6gSaNmWVbHZZzPG6ukizViAqvry08dZB6KY90Oya8C7WvThh1+zHO8cl4h0T4lSv
         RmL/Tf11XMpU0RC1qZxDUyIUw6jkyaJ+R7xH8bhcdvNc4hcGx5/dRoMn41jX2x/FCriH
         oh7EwTQzCGlfoBFNNawfBhH8DWo4ezt+kkd5bdso/o3TdeD7NatJ5FVd6gPpfrmLB4OK
         Dq8Q==
X-Gm-Message-State: AOAM533brHRRv+Ea1zpuGSNcjQSm/wpgncZdcRdFUm8cJqr80RZKSh0j
        eh88oz6OJtzVOC/qd6+1zKfbPA==
X-Google-Smtp-Source: ABdhPJwKj9M+NROzity0wbbtarhMYD1iO1A/RCqJwJa4QnCTCrNVQ7+USV3LfuKpabL5+WM8PcwegQ==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr27381258wrm.117.1599550944553;
        Tue, 08 Sep 2020 00:42:24 -0700 (PDT)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id i6sm36336964wra.1.2020.09.08.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 00:42:23 -0700 (PDT)
Date:   Tue, 8 Sep 2020 08:42:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v9 00/13] Add support for Kontron sl28cpld
Message-ID: <20200908074221.GA4400@dell>
References: <20200907213802.26745-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200907213802.26745-1-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 07 Sep 2020, Michael Walle wrote:

> The Kontron sl28cpld is a board management chip providing gpio, pwm, fan
> monitoring and an interrupt controller. For now this controller is used on
> the Kontron SMARC-sAL28 board. But because of its flexible nature, it
> might also be used on other boards in the future. The individual blocks
> (like gpio, pwm, etc) are kept intentionally small. The MFD core driver
> then instantiates different (or multiple of the same) blocks. It also
> provides the register layout so it might be updated in the future without a
> device tree change; and support other boards with a different layout or
> functionalities.
> 
> See also [1] for more information.
> 
> This is my first take of a MFD driver. I don't know whether the subsystem
> maintainers should only be CCed on the patches which affect the subsystem
> or on all patches for this series. I've chosen the latter so you can get a
> more complete picture.
> 
> [1] https://lore.kernel.org/linux-devicetree/0e3e8204ab992d75aa07fc36af7e4ab2@walle.cc/

I'll take all of the non-ARM patches later this week.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
