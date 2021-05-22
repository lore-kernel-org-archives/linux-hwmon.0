Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54990C04FF3
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 May 2021 02:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A4F160C3E
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 May 2021 02:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhEVCBn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 May 2021 22:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhEVCBn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 22:01:43 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F741C061574;
        Fri, 21 May 2021 19:00:19 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id s19so21453390oic.7;
        Fri, 21 May 2021 19:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v4mUO7yfT09cCss4W7+d0bMOwHylAb5+pLHbvcApjuM=;
        b=BJP4bZhjsZDUkvuKoRI4HWVkNqexgVZ+vTuovsCCS0W0TgAB8j+LGdncBYQqQwfhFK
         Zieop0K3wUu+C+bMXlJgukftwdMK/ER32gsR+1KxO0S3ern0KfvHR36cNOk8S8rY8YUc
         ewWz73QMEezMdjCMwF2Y8JbrE/GD+sss73XcuSKfQJ9DwgkgX2YIyQnmQVt26Ekge6Ey
         BhVR4hg7uM/UPaEqMor8B1HszyquVekI8Hi3mLGAM2vhAUZuCSMzmz6B5aKaF22Zi0ZP
         jLPdVgpHVgvUmAFQoEjfEf63H/ur635sCWq9FT3SoTlsyZ9bLsG8AQzlAZp2rQav9CDg
         8urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=v4mUO7yfT09cCss4W7+d0bMOwHylAb5+pLHbvcApjuM=;
        b=ozqr2opwQpyjjGy6EcfjSkDbJDIm7NwSxYAQx5eEfJ2Aamsg8jTOmIo4L2xDvgqfcR
         LEDNda1Zx0TU2PojA7XvmYLLbVFsE1xkl7pwxxPsF6sRBSfyeVN6GdVHggWDCHsjNodt
         LTF/QkALpx10QYH93VtZEMhG+p7ZpANJli16+DmFoik+s9ek+GpoFScpzB7xkzK5m933
         +jWxE2SdKkOdVIWHMmBgX8/2xBucAYj0qKL9cDgGV2oByNbt70oqiiJTmhdkVl1hk3uP
         7ffbZxQya0MMSX+KHDf5wh9ykPJylECc5pMDWCqZ1DZNHpyA3F8QjX7dG/Utrv/sezlO
         TBOQ==
X-Gm-Message-State: AOAM532mBHfkb0RCl4Nn44ZODyhzisfBxMSN4eV/oOMHKlaC1Cafsbtg
        mSgDewaKhFUdedO1o/t2IK7DLgE5RSk=
X-Google-Smtp-Source: ABdhPJxvlvOW2xLc21hYN6ryBwQDObaG1vHZfoBIG0bY6Q6QkToAWsKGQZO2Vh1X13fUO3zcOOqwdg==
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr4018510oic.50.1621648818612;
        Fri, 21 May 2021 19:00:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 65sm1665966otj.17.2021.05.21.19.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 19:00:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 May 2021 19:00:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: Add an entry for mp2888
Message-ID: <20210522020016.GA2140551@roeck-us.net>
References: <20210521172218.37592-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521172218.37592-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 21, 2021 at 02:22:18PM -0300, Fabio Estevam wrote:
> The entry for mp2888 is missing and it causes the following
> 'make htmldocs' build warning:
> 
> Documentation/hwmon/mp2888.rst: WARNING: document isn't included in any toctree
> 
> Add the mp2888 entry.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9ed60fa84cbe..6925a8a70511 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
>     mcp3021
>     menf21bmc
>     mlxreg-fan
> +   mp2888
>     mp2975
>     nct6683
>     nct6775
