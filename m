Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EBDC636CA
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 07:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1494613E9
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 07:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236997AbhGPH7W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Jul 2021 03:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236943AbhGPH7R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jul 2021 03:59:17 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389A3C061762
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jul 2021 00:56:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a13so10968109wrf.10
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jul 2021 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uVR/Jck5v49z+8mpV1Vad40sYJAyKAQCRBapDHKnLq0=;
        b=b173FmM3z/kDXtJkwwpSOdu/0g6cpW7zpOvbLBco/CZeWD6AqepnPtzBG5gG4+c9Qq
         7Qu0jnHuDXsn7aK/PyTqTx+kh/VdIahhyG/JjJtmllOMoH8P3CmptiIdCpyh1r5vELO6
         W+D8QXvBv+5RigjXbKPMIbGHopL7HSUMSVFNb/dE4bevZ9kvndHTUzo05SIkwQyKBOlB
         n8JEzsW5eVebvHJLz9ducXQnO0SMZHZUplG/Q0/+eLlmTl4ZWnWAP+j23t7SEKiS/8o0
         JIFCYcljOpw++5nx/W6NaWMzqTHB+YPkCNttLeOoO+pl9NJ25Vkl0jwzkY0RL/ci12xo
         w4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uVR/Jck5v49z+8mpV1Vad40sYJAyKAQCRBapDHKnLq0=;
        b=sCkmPKw11OmNZ8nogmpdYayrY5flROqgvtsMgy/OxvMIXf1OpYeFpQvf+72pVstqoi
         ZQJh2Qpc6PqWjXWO7J16S6hwUJ6dli+IAUATGQ+bAps/08iBpY1+stS10r/xqHEoX9gT
         GIB3emoDHrw/WI2WIw0YH392Py+WK24ia8Id80AqSO4VxBjlPjFuPsQ1LRfTo0ThAIgu
         N2uB2hjuNogBoSDkffEWDtDcIX2/zDpurPCb0p5A7dCXuG+V1O/Gcf1k/c7Jk0b2WQ9j
         Zsi2zQUHNcTgKL49fjf0Hl9qhqe4W1DuxhKcVi5PUAsu6PFR748OEC8ky9ZoAKeDp+ec
         yWIw==
X-Gm-Message-State: AOAM533ma6bNUrun/iNlQzaE31q4pBuqcvvAyWXwL+aAcjL8MQVV8H8z
        qbrfbOn92FKJ5KKmMbZV4acRwg==
X-Google-Smtp-Source: ABdhPJzASykD3R2CXs24CTU0MqQNY5E8qoccE8Z0FhyLoh+efaGHiDUdNcuDK6UwFWGbWEMK/4M3bg==
X-Received: by 2002:a5d:46cc:: with SMTP id g12mr10357001wrs.136.1626422179823;
        Fri, 16 Jul 2021 00:56:19 -0700 (PDT)
Received: from google.com ([31.124.24.141])
        by smtp.gmail.com with ESMTPSA id l14sm8810302wrs.22.2021.07.16.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 00:56:19 -0700 (PDT)
Date:   Fri, 16 Jul 2021 08:56:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
        Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Brown <broonie@kernel.org>,
        Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mhu@silicom.dk>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mfd: intel-m10-bmc: add n5010 variant
Message-ID: <YPE7oUflWYJt1IoD@google.com>
References: <20210629121214.988036-1-martin@geanix.com>
 <20210629121214.988036-4-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210629121214.988036-4-martin@geanix.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 29 Jun 2021, Martin Hundebøll wrote:

> From: Martin Hundebøll <mhu@silicom.dk>
> 
>  The m10-bmc is used on the Silicom N5010 PAC too, so add it to list of
>  m10bmc types.

Please refrain from padding out the commit message in future.

> Signed-off-by: Martin Hundebøll <mhu@silicom.dk>
> Acked-by: Moritz Fischer <mdf@kernel.org>
> Reviewed-by: Xu Yilun <yilun.xu@intel.com>
> ---
> 
> Changes since v2:
>  * Added Yilun's Reviewed-by
>  * Added Moritz' Acked-by
> 
> Changes since v1:
>  * Patch split out to separate mfd changes
> 
>  drivers/mfd/intel-m10-bmc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
