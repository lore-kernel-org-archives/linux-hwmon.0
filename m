Return-Path: <SRS0=Cu32=B5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A49C433E1
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Aug 2020 10:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D25A6207BB
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Aug 2020 10:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6wcLOra"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgHSKv4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Aug 2020 06:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgHSKvd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Aug 2020 06:51:33 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6546AC061757
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2020 03:51:29 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c15so21006997wrs.11
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2020 03:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jkwK21g5VFdynOOGr6pwZT15bIrSzS5HHZUTr6u93Bk=;
        b=o6wcLOra6wVLGD3LShyd1CcBwNTFU7v/kixPKoLuyTZgV+ErdoUhW0QEJzVNCoPXYI
         GVMuHyu9mGHZ6da1NSE2yas+EN30VVUhq3LL56yw4TGf4+WrjxxNIvw5MFEoTLEWYBST
         lOg02JNxd3WiubgOJuCDuousdR/dux4jCBQxh/GETWsGhSCiSfO61Dsjg9Tn4LUgbFNR
         HUcLGlOZkwm6/Y9xaRLkNSK8y5WRshXuQplnM/0wWDHgHpxVDCBHp46VIcQ++pd3yMp8
         hK1v+LcPjY5IfmK5noOrvsjPWmOf2sfi23qBLJ8IvJBWayY+TAWD6+Mac7nMjW/5AdZT
         qtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jkwK21g5VFdynOOGr6pwZT15bIrSzS5HHZUTr6u93Bk=;
        b=N60p+C9XxyqAJlgF4Wzzz0SstXZmxnyKloTi+aiw+WpvLz9g8BBpXO3E3RSfWEdgem
         WyonQN5ySp/G5zuNprjnvJoNt7nrrVF5W8RMFg3Al+JKGBaeXtGLavGoczzSnFRe4fx/
         uUz9aOel60wtYk/mJ773pWwSJK8oYXVKLjHJe0xrE0JrMUn46BshqlHrREsrpjb9o0y5
         iuovqg3tHfOKisbIzwneidhtmcJ+xu4XJT/ItPBmux8Jv3TFynUcNRrdV6LLT8HwgBlv
         nAb0iCcmpJseDxSBV+Rj3tQ1vZ5D3jGs6uGdl0dmeL/F6L3glA6j4KyVKjJlMl94rqs9
         CVkw==
X-Gm-Message-State: AOAM531wZamurQ2THrDjRCfBcwp+hCs4CF+y1mKTQOvO5Hu0SdwEC6CX
        UvlQW2/QK1V4P7D+MU7e+ajXDw==
X-Google-Smtp-Source: ABdhPJyXRU861CmmXhvzyM0K1yAJtYGdADvkQ1ImIfcucwdx9hjZDkswr6TS7g+o481n48uSjh4ZUQ==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr24001808wrq.407.1597834288094;
        Wed, 19 Aug 2020 03:51:28 -0700 (PDT)
Received: from dell ([95.149.164.62])
        by smtp.gmail.com with ESMTPSA id q7sm40425011wra.56.2020.08.19.03.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 03:51:27 -0700 (PDT)
Date:   Wed, 19 Aug 2020 11:51:24 +0100
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
Subject: Re: [PATCH v8 03/13] mfd: simple-mfd-i2c: add sl28cpld support
Message-ID: <20200819105124.GA3248864@dell>
References: <20200813124832.17349-1-michael@walle.cc>
 <20200813124832.17349-4-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200813124832.17349-4-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 13 Aug 2020, Michael Walle wrote:

> Add the core support for the board management controller found on the
> SMARC-sAL28 board.
> 
> Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
> provide a common symbol on which the subdevice drivers can depend on.
> 
> At the moment, this controller is used on the Kontron SMARC-sAL28 board.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since v7:
>  - added MFD_SL28CPLD virtual Kconfig symbol
>  - Please note, that I intentionally removed the Acked-for-MFD-by
>    because of this change.
> 
> Changes since v6:
>  - renamed "sl28cpld-r1" to "sl28cpld"
> 
> Changes since v5:
>  - none
> 
> Changes since v4:
>  - new patch
> 
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c |  1 +
>  2 files changed, 11 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
