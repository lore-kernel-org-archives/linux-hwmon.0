Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81297C63777
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 09:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AE4C206DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 09:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WxsRmHZK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgK0Jck (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Nov 2020 04:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgK0Jcj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Nov 2020 04:32:39 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B77C0617A7
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2020 01:32:38 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so4830694wrw.10
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2020 01:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lAxkAYvCa7eeDOc+aoeZS0G8r5xJMwvnpqn8jKIhjj0=;
        b=WxsRmHZK/D7hklZYA+bATzachY4P8/1CjCLcq5zP+7ElEyu783Ch+nUf1lcnuignHS
         T85HYP9g4tT5lC9VwQ7d8INq7eCbWKJnA7hDQNk8zPclOmXGAm8azI8dur5e4jpbf69i
         goO0fsroDYpazuS9uX+IheOGpXF6STQtb1oMOlAf19y2nz5cr5T1nrVukyrVRdrzbBpQ
         UKQtzUwJdg2bXMuJybPc2y0lcsLNEzAd7DfAjMTVdhrIS8aba7b6GoUhaILvkqSygYuA
         GaIjh9atCdamRF6umlGotb27L4VRPsemKz+59kniEWMBSO1/ttfi+dJKPkPTmXL3hqyE
         RYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lAxkAYvCa7eeDOc+aoeZS0G8r5xJMwvnpqn8jKIhjj0=;
        b=WWPJ+ySRskTZZUJVrGcMDrb8XzWd0hMwyMHe9kgYKpW83F6mBcRg9eXZIoTlr7cS1d
         iH3yoHQX2b7yAV/vQhZPdUB9Aj2IjXLzLo0XuR4PvOeQLQJR5hUpSm0yeQ4haUoEVu1q
         EjDSHQL06PIK1OjyKu10sWthBAm2M8icow8w9d6M7ZE4Ka82Eo9esaB5zeWvKiNxvqRS
         SsOTmTXzegKOHYHDnyY1KLtbPxgGZtkPyCIdEjGxDhSHSAcFglTYNLpCVF5opnLSlfOw
         Uz47zkLe+/azHxqhKkLPBhWZPG7Y1mbJQKVBp34HGoLU4laG394++X8OSWqun1OkQ89S
         /qbw==
X-Gm-Message-State: AOAM532GEmrcXp09FnREtG1SN+06VERWbo8a9nnU16lCrfsbEU8C6MbN
        hQhOJlAIfAyDIpmLpSp+yj6MeA==
X-Google-Smtp-Source: ABdhPJyE5yrp/QCLUHsa9WBEW+n10WAdt6LRN1ctPgu6eAswud+B3UVJlIP1A0aF6fmiPpFLGrcw4Q==
X-Received: by 2002:adf:ebc5:: with SMTP id v5mr9370555wrn.392.1606469557473;
        Fri, 27 Nov 2020 01:32:37 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d3sm13168196wrr.2.2020.11.27.01.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:32:36 -0800 (PST)
Date:   Fri, 27 Nov 2020 09:32:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Shihlun Lin <shihlun.lin@advantech.com.tw>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Campion Kang <campion.kang@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [RESEND PATCH v4 2/6] mfd: ahc1ec0: Add Advantech EC include
 file used by dt-bindings
Message-ID: <20201127093234.GQ2455276@dell>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
 <20201125070744.4651-2-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125070744.4651-2-shihlun.lin@advantech.com.tw>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 25 Nov 2020, Shihlun Lin wrote:

> This files defines the sud-device types and hwmon profiles support by
> Advantech embedded controller.
> 
> Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
> ---
>  include/dt-bindings/mfd/ahc1ec0.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/ahc1ec0.h

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
