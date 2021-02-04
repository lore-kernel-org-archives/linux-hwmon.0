Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F39C433E6
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Feb 2021 10:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B856B64F5E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Feb 2021 10:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbhBDKfO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Feb 2021 05:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235517AbhBDKdn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Feb 2021 05:33:43 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6F7C06178B
        for <linux-hwmon@vger.kernel.org>; Thu,  4 Feb 2021 02:33:03 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a1so2872768wrq.6
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Feb 2021 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hsN/OapOEplhri1ngP6qr+RO+51gU8IM8nQPOqxMvVQ=;
        b=EH3VfFhRjeXA5UtS/Yj+qDHIfaYbcWFBhV9MxtZ+xXWzTjfYWRujowx5LH9RKJIKMA
         WtyM2sMythgEQqf75Rn8DEEEeTX7zQpC46tppaAgrdqPN1DHFgTmgOQeORoqKQllaiFm
         kDVryYMeAD4kPWq5ziqL37Ml2HWdGzcBZqPYSgczVxihAe4aty8rzr/axgVWbkFHbnZb
         yCpV+gmR9HaUNPsjgPSMfivNdZyOS3mbjlvgk6NbYJn1krCRsbskztFZyAnZu2ryFnYU
         r7s0bxc6qAxgUSdwswooOSCqKhrdDX7Ww+wENsY+aT95cOYyAHbf1ba0YyMoCKHAkxDS
         heuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hsN/OapOEplhri1ngP6qr+RO+51gU8IM8nQPOqxMvVQ=;
        b=FmDj3B1CcZN0RXw0GfiC/eko0Kx1/kX5pZC1YgeGxJBs+Lbtwdqj5mUBliDNTauAmY
         5ZSmc5Cd7zmFSeU2+6m6FMujJRt53gcgkoKkLEHAbfVFkGCSKYA6lqfcpkE0mkpvK05X
         UZk56M5y1q5xjXaQhmM5b6B8F4YX782NiaKKWrHz/p/77zI4RkqcEsrL7BbHQ46gZcjs
         MpRfeKzTRVJRKamngIRfeGfqAoL/N3GIXAZdWnRejgFG2hSDoi8U/tx7fwJfJYkOJPW0
         qHV6KgbXHv4KfDd8CVxiS7Y/iombENtfLFoVZPfklmkaJoxoLCMv4gMN+H0XuWlN98cR
         f9lQ==
X-Gm-Message-State: AOAM530bRIla1cwYTS3AhWgEdldszexNIJiWSbCYD3tv4a1j2SxztZpH
        YfXOuqqjctxiTfcCSXfWoFNbQg==
X-Google-Smtp-Source: ABdhPJxHWLcMprdKmr42u2S4LwyYNw2r3RuA7Pr0JTirLj5GS/slybEW2EcRSZFRbhWP+hBUdlOhpQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr8670513wrq.425.1612434782343;
        Thu, 04 Feb 2021 02:33:02 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m205sm5665340wmf.40.2021.02.04.02.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 02:33:01 -0800 (PST)
Date:   Thu, 4 Feb 2021 10:32:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [PATCH v6 2/6] mfd: ahc1ec0: Add Advantech EC include file used
 by dt-bindings
Message-ID: <20210204103259.GB2789116@dell>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
 <20210118123749.4769-2-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118123749.4769-2-campion.kang@advantech.com.tw>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 18 Jan 2021, Campion Kang wrote:

> This files defines the sud-device types and hwmon profiles support by
> Advantech embedded controller.
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  include/dt-bindings/mfd/ahc1ec0-dt.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/ahc1ec0-dt.h

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
