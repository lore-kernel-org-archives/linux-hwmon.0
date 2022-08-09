Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDBEC19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 13:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243101AbiHINdz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 09:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbiHINdy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 09:33:54 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EFB1901D
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 06:33:53 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id s11-20020a1cf20b000000b003a52a0945e8so4122336wmc.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=qDs3v/+2gBoPPTdjMsAIc3WC8rX3YXkWxxonQKGl4/w=;
        b=KXL2NUWmqPFko1XMcwYNAF4yLqrFdYZ7RUQo+B+ik3rzRGdaZDhSjTb1RZuaxEUFLx
         TJhTj6a87LkmuY67UEMMkfqawtVRA8wd/vp+KeZJfGfeRDwLGp6cORXFWRNmZ2Rs7vlG
         428ZrWeyxSXsHKH16eDUE3abwgJoNTbbMqm4WtkS3lNsIOLtSObFCKtE16h/brgAO4Tx
         DEfNDXI+qNcvGGfXUbLBZZdYFfwYzQjGPsQJmnOnfSmOcZ5r/SzJRvuQdV8e/a8aQasE
         /V7TDBSIsSpUQXvQyblVgN5tfNCkoE/kisoTB3alYsIbpLzCCbsLkZylILz8ayfQTjVs
         vU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=qDs3v/+2gBoPPTdjMsAIc3WC8rX3YXkWxxonQKGl4/w=;
        b=e+C5Z/jSlwyYmKvk9I9tZ62iz8gnnng0UamE5DFwNmRwk0Qac2vvhjWnSgREOmfSoy
         FZn8+5s7LOTruPMRS0RetoThgbZtBenMBSkzmQVyAJ3sXbXCfik6U0bNzJT0dZHuaxSu
         y5VxMK5CAn0DDF+4hfIPtz2zpSPyNDgq1yyoWnBfDT9KG2ZleRzG3pXQXnM4Kb7maC88
         Dbzx3LTlrasI/qK2+5yK6NOVWSDTS9kNCfIUS35QYzzk/NutyGek+vdYzaw4TzzAkE2T
         j5W1AD2UiVbcraiPoY1zYMQLKiEs2xrqCSZ3TI6DJhD/PZCdGYAB6jxQQmZw4FqmX0hs
         CpSA==
X-Gm-Message-State: ACgBeo01nSd1xrDDPmnpLH2wd2VtmPIDk921f1/IjekLCsA2XQQNvsls
        zx5swbQEJ+PXXUf46fdUkJRUMQ==
X-Google-Smtp-Source: AA6agR5Vw/hb9AVtINItYDqXRX7S16jDBHR9oXX97sa2DaTwoEP2cNEyV2erhdztP6VJgZ5ukYQEwg==
X-Received: by 2002:a05:600c:a02:b0:39c:97cc:82e3 with SMTP id z2-20020a05600c0a0200b0039c97cc82e3mr20753390wmp.97.1660052031819;
        Tue, 09 Aug 2022 06:33:51 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id k30-20020a05600c1c9e00b003a38606385esm2261133wms.3.2022.08.09.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 06:33:51 -0700 (PDT)
Date:   Tue, 9 Aug 2022 14:33:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, s.hauer@pengutronix.de,
        alistair23@gmail.com, linux-arm-kernel@lists.infradead.org,
        andreas@kemnade.info, amitk@kernel.org, shawnguo@kernel.org,
        linux-kernel@vger.kernel.org, geert@linux-m68k.org,
        linux-hwmon@vger.kernel.org, linux-imx@nxp.com, linux@roeck-us.net,
        rui.zhang@intel.com, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v21 1/4] mfd: silergy,sy7636a: Add config option
Message-ID: <YvJiPM0Ak1Z34Bog@google.com>
References: <20220525115554.430971-1-alistair@alistair23.me>
 <20220525115554.430971-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525115554.430971-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 25 May 2022, Alistair Francis wrote:

> Add a specific MFD_SY7636A config option.
> 
> As part of this change we can use MFD_SY7636A as a dependency for all
> SY7636a components and also remove the name from MFD_SIMPLE_MFD_I2C as
> it no longer needs to be selectable.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/Kconfig     |  1 +
>  drivers/mfd/Kconfig       | 12 +++++++++++-
>  drivers/regulator/Kconfig |  1 +
>  3 files changed, 13 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org
