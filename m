Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3415AC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Apr 2022 08:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386421AbiDUIKr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Apr 2022 04:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiDUIKq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Apr 2022 04:10:46 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201161DA7E
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Apr 2022 01:07:56 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id b19so5465113wrh.11
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Apr 2022 01:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=m9wV+vIEZDL8KhprPYlhYVDn81Dgoq0DcYhAGk+490w=;
        b=du9gEsiIZYwYSSHgVxteh57cU7mTdEFHlkGr4b/devaFuNqJoLUFrAIV5PI+p0E7fw
         YLIsoSZ/jA79uXIHoD90HEkNd4wRqdbKvWHVM2sTyS6hbKW8Sad4piUCdXEn2vp56n6R
         eGb6hicXJeuUa53OFmXryJu5xVwHcxuD8Oj/RSstVnmE28BD3NMaXJnHBkkc3U4a4sgd
         WZKPviGs74pFKHwUkB8YtvknwXwiEKZU2FNztg18c+5PhkDwZ4M0yOdSI6iexi+Zg5lT
         OYbC4qA5rogT1Hz1sMNvovkIjT2ypBw0xQ+QvrKS9b37yWEsKROeUlfskIECps37+VFf
         KaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=m9wV+vIEZDL8KhprPYlhYVDn81Dgoq0DcYhAGk+490w=;
        b=n08BU02VtLNwbLpKUXWB72ET9fMyQwYI4K5/9/MCMpj/HU8ljbhQqvFAShEaxOF2Wl
         xDM96gKXvwhxTrWpjZIvbwHVsu6nrxJAoUWox8H/pIwuTTzZAGYA9K4+gEMRSmCuYrNm
         IyrW3kBCcHm5CWzS/1Xz7rnXntMsifX4KNz8YSlFXUDGl3+UWoVnx2/Y0aAfBLGyvxnQ
         S3lAoXsICEH2SSLCLppL0zte/VtRyJm6ZLTplz2Tq9f22q+5Retgh8EdKwJx9Wg2BdkJ
         r5+mFdQ+sNJdxwdOLv5JgOSti0IvWsDaVk3Q9qzRLT2pYDaSAOMgJDkpExqMdOl3xYz5
         bnzQ==
X-Gm-Message-State: AOAM531dWxVRDe9FgBw8En9GT3Xq8pJ4UrDDwFHmXbeoPXor5KeZNpfO
        CiKk32ocTSRT34Bn2rNS4I3mWQ==
X-Google-Smtp-Source: ABdhPJxyBztgLVIeedlBtMENS04Io2p1DpkMBDuu8qD87zZoXq4uHdG79UYVvBKbGBM6/Dyz/WHiNw==
X-Received: by 2002:a05:6000:100c:b0:207:a2aa:8d15 with SMTP id a12-20020a056000100c00b00207a2aa8d15mr18159747wrx.394.1650528474628;
        Thu, 21 Apr 2022 01:07:54 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f7-20020a1c3807000000b0038ffac6f752sm1404892wma.45.2022.04.21.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 01:07:53 -0700 (PDT)
Date:   Thu, 21 Apr 2022 09:07:51 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alistair Francis <alistair23@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Alistair Francis <alistair@alistair23.me>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andreas Kemnade <andreas@kemnade.info>,
        Zhang Rui <rui.zhang@intel.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Amit Kucheria <amitk@kernel.org>
Subject: Re: [PATCH v20 1/4] mfd: silergy,sy7636a: Add config option
Message-ID: <YmEQ1/Gs15gUxYdh@google.com>
References: <20220330094126.30252-1-alistair@alistair23.me>
 <20220330094126.30252-2-alistair@alistair23.me>
 <45acc349-8fea-f755-065c-c561949c45af@roeck-us.net>
 <CAKmqyKOqjperoku_uOy4sCa6LmCUtfB7SCvhLEKxLtcwDkzRyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKOqjperoku_uOy4sCa6LmCUtfB7SCvhLEKxLtcwDkzRyA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 20 Apr 2022, Alistair Francis wrote:

> On Thu, Mar 31, 2022 at 6:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 3/30/22 02:41, Alistair Francis wrote:
> > > Add a specific MFD_SY7636A config option.
> > >
> > > As part of this change we can use MFD_SY7636A as a dependency for all
> > > SY7636a components and also remove the name from MFD_SIMPLE_MFD_I2C as
> > > it no longer needs to be selectable.
> > >
> > > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Any chance of getting this in for 5.18? It would be nice to have the
> configs all sorted before the release

Can't do anything without Mark's Ack.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
