Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3238EC433DB
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Jan 2021 08:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E83B02311C
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Jan 2021 08:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbhASIYk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Jan 2021 03:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730884AbhASIYX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Jan 2021 03:24:23 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42739C061574
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Jan 2021 00:23:43 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d26so18777084wrb.12
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Jan 2021 00:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0o446r/7sfNrNMbiwlFxGJePev96CeNNzqsH+vREsX8=;
        b=I+pBsb0vAWfUoTHY7RYJ6yNwT7cwg2JIs/IprcYa7Jzjnxdqdpn2CwBtUjTwRo4XM8
         uyIxI/Ggh9GSR8awn0b5sPWRSJ6KeHwcuc4V3KOQtFbLoo91T/73rswe0bX4MOgtFIIq
         ZGSHMQaKXk0g37CDxvDds7AOnm+lJVqQiA8kil11Bj3iT+HcRtNi3LkzM+W0rIu2yY5l
         wYQ2dW8NeBCzjwnly/8/Evir6hbxKdfoTmtw8ACc/5C0nweEREnUNSjhfoxL146bZiLg
         Aw0Xg9rkmpOGYX/qwx16LkK3/KSXweJF8f1Ja+42rbAaqhrWjHyujQ/j/QaJohd5V6CQ
         +kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0o446r/7sfNrNMbiwlFxGJePev96CeNNzqsH+vREsX8=;
        b=t0oDLS3hLLk2p03MmmfOd2u5UAva1c/EMlHLd/whWqk94ACJiWD9W4/3p9TSmnLRwV
         xBEuK805ccXBPz9gA8KQ4Z6OgjxMwt6mAqd1n4LW/Xpz1aUHGsPovm+ysVEjR5+LYWRy
         2TazAGFQYzUD7PKT0Mxggv+RzrH81mukb33eBeE77+Adq7JMc2gT+NLYcbipVrrM2CTn
         NVVyq5dP//MKP2ZUcOnHd9vWXocv/E7AN4ZtgPA8g3fj3wfUQ+MF9wle/Z+zRICuh4Z9
         MSttMDqqX6zsZEif5v6O2e3TcTZ9bh4LoYQ7dsxFH79D9AQByemJ1xv49sM0pON1I0Up
         ms4g==
X-Gm-Message-State: AOAM532POtFvx1E4voJI1StcHXIsk4LkYw2pV68fDzb0Jk5LjvXokp/W
        vy4Ho0DmX8mqc+xgbZ/idCP7Gg==
X-Google-Smtp-Source: ABdhPJy40W+PZAbNiUmSORK+HY3by6NS2OcSzoL5kUbSYa1SMUjm7J9uhh20bQCKaiilyG3zYfMTCA==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr3282521wru.200.1611044621936;
        Tue, 19 Jan 2021 00:23:41 -0800 (PST)
Received: from dell ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id y14sm29847493wru.96.2021.01.19.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 00:23:41 -0800 (PST)
Date:   Tue, 19 Jan 2021 08:23:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     AceLan Kao <chia-lin.kao@canonical.com>
Cc:     Campion Kang <campion.kang@advantech.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 4/6] mfd: ahc1ec0: Add support for Advantech embedded
 controller
Message-ID: <20210119082339.GI4903@dell>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
 <20210118123749.4769-4-campion.kang@advantech.com.tw>
 <CAFv23QngmvuKZb0_pK7RBa=VX=2ypabg5p1+vSqrT36CNdJhgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFv23QngmvuKZb0_pK7RBa=VX=2ypabg5p1+vSqrT36CNdJhgw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 19 Jan 2021, AceLan Kao wrote:

> Campion Kang <campion.kang@advantech.com.tw> 於 2021年1月18日 週一 下午8:37寫道：
> >
> > AHC1EC0 is the embedded controller driver for Advantech industrial
> > products. This provides sub-devices such as hwmon and watchdog, and also
> > expose functions for sub-devices to read/write the value to embedded
> > controller.
> >
> > Changed since V5:
> >         - Kconfig: add "AHC1EC0" string to clearly define the EC name
> >         - fix the code according to reviewer's suggestion
> >         - remove unnecessary header files
> >         - change the structure name to lower case, align with others
> > naming
> >
> > Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> > ---
> >  drivers/mfd/Kconfig         |  10 +
> >  drivers/mfd/Makefile        |   2 +
> >  drivers/mfd/ahc1ec0.c       | 808 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/ahc1ec0.h | 276 ++++++++++++
> >  4 files changed, 1096 insertions(+)
> >  create mode 100644 drivers/mfd/ahc1ec0.c
> >  create mode 100644 include/linux/mfd/ahc1ec0.h

[...]

NB: Snipped 1000 lines.

> Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Would you be kind enough to snip your replies please AceLan?

It would have the benefit of saving a lot of people a little time.

TIA.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
