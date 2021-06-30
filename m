Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1A9C11F65
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Jun 2021 10:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1372261CA2
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Jun 2021 10:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbhF3K7v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Jun 2021 06:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhF3K7r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Jun 2021 06:59:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4911EC061756
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Jun 2021 03:57:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i94so3091198wri.4
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Jun 2021 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DmYIvYkRX4IsUDGy0OBH/JkPnt12KYyi21aGW72CZ7A=;
        b=a04xkbmpsgErnHdAiuLzV3LmUxzEnj6J7OFvUta9tOj3pItR0QD019BYty0qw9Drq2
         KAVo64B7vvenhDkTuN2rh8Uq4Eq5CYAq0/BEY16zf2Ne3ocNS7Ci5Zg5triMs4Bx5d1l
         bWVr4SUr1KH6q78WJnKY9ZE0dmLhwBcxnYck12xsH93G4uupfbxZ6E3tNkHH+kB2Fmnc
         WVtDZc2WIn/rYzg+Lr22qtdarrR2E3oQeWDnaSNFhOMj48zDb7OZc11guCyK3+pKWF+H
         Dr4kLs8Y0MyPZem/hodGmxABYKw8lhGCKBDwTQJRzcX8D0K+jqAADmBfFtlzCeTAvEvP
         d6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DmYIvYkRX4IsUDGy0OBH/JkPnt12KYyi21aGW72CZ7A=;
        b=nI5H/WZdX21ADw5iV3Q3DJyAwkfPyu9dFlqOq79IB8F6J1UdA1v6L2Uf2T9FmNGSvw
         +7sl/1EU+zq/WKwifX/DFBQ7avjpF2iUse1mBmHA4hhEPu3M/rdJFblu0eJ30Q4m3Wj/
         B0LHxSH2vLzov8w+XJ1rB1FNpSyBjismhs92WfarBsNLAwg+LK+q4uFHRyvlw4qhn+Sv
         XMdkzZ0sPFDWRoBjfWBjawodoPxkIR9+M9kdmMr9wUaBz/toOzXamVUmVtjkdbrMOtXm
         mjDhHN10BzvOCnT9aEEVnaK1HAFj1ELkPwnm7r3JxNCGKSfthuyH/iL3cIakPQzplLcy
         0z4g==
X-Gm-Message-State: AOAM530V3oNCaEQsncUTfUR/fM9ZTUy8TV6izU7vqGiPx++kEkqBjZPl
        ligzdC1VMDnmCv5W13YgFllK4A==
X-Google-Smtp-Source: ABdhPJz3JeDagWbYMUoFJT/9R94VInUH6Gicf0QhP+KXAgXOEqIJFHfg3tish5VeJwfEtFNxv+L7NA==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr38565132wrr.374.1625050634869;
        Wed, 30 Jun 2021 03:57:14 -0700 (PDT)
Received: from dell ([95.144.13.171])
        by smtp.gmail.com with ESMTPSA id k16sm4653787wru.79.2021.06.30.03.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 03:57:14 -0700 (PDT)
Date:   Wed, 30 Jun 2021 11:57:12 +0100
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
Subject: Re: [PATCH v2 4/5] mfd: intel-m10-bmc: add n5010 variant
Message-ID: <YNxOCJNgG5x6zUU+@dell>
References: <20210625074213.654274-1-martin@geanix.com>
 <20210625074213.654274-5-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210625074213.654274-5-martin@geanix.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 25 Jun 2021, Martin Hundebøll wrote:

> From: Martin Hundebøll <mhu@silicom.dk>
> 
>  The m10-bmc is used on the Silicom N5010 PAC too, so add it to list of
>  m10bmc types.
> 
> Signed-off-by: Martin Hundebøll <mhu@silicom.dk>
> ---
> 
> Changes since v1:
>  * Patch split out to separate mfd changes
> 
>  drivers/mfd/intel-m10-bmc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
