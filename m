Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9147CC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 May 2022 08:30:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239027AbiEZIaM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 May 2022 04:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiEZIaM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 May 2022 04:30:12 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FAAC3D0A
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 01:30:10 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id h126-20020a1c2184000000b003975cedb52bso295109wmh.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SqD+//mjmyM8nN2hVLImGoL1fyQQfgdM4ycaASE7xag=;
        b=FkLQsnrsRRKNuLsePdSf+0SgS1LunWp3nDcqi2+thLADwb7djOu0kwiX1L5uoccyHf
         bbs8Ry5KBtmkqXecqJ8Nq8+xruRZf25pqRYUnnfgp+1y8vOpatE1lx6Xw01ODVai42hC
         ICEdzJppkQmBbZ0Ydc5DbB29clebg2vMNvDhujqorDg3p8K/PakcKCVxt0EC5EBCSqTf
         PqliSq9J2rS8ZuGfoNv0lNNgBEVsFMRDraQbQQa6jQx3PeoJVgG/7WQUl+jFH5b4UDjh
         6ZASfJl5SuwxOvEYKXxCmf2NVLROCjYzbyGtckwHJ2GetIKlxZSDjQaXNL8Hw8tirvkL
         dVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SqD+//mjmyM8nN2hVLImGoL1fyQQfgdM4ycaASE7xag=;
        b=Kgu0LZAILH5O0Y2fr4uFYAYmftHXzUFpz+Lz/xWumB06jH8zHUaM5ULVdUchURT+d4
         SPrpbAak26YiFF0RV/gM0Yt0O7g6q5VxObVVgNKB/1uOiFCc/fR871Eew2OAcv0VX/4T
         TUaza4O3ixqYjF4BmhPkLxSXXsiVTYOAGWzwcaNT/16scv1XDeVrwDHEXabgizwPUyGF
         LZ07y71chsIrCPDxC1x4iKQS+I2YmizYu0jV0nPNVbZ2Fwl84gwlEZikE6H/kfNa+06N
         SiD0YsbfRdllwuGab07nyIGSAmV5/hyClluplNliBT2WztOTZmvsMtqZqLfQQEfql+nu
         36Ow==
X-Gm-Message-State: AOAM531D9dpTE2ZeSerjm02xUWPiufH0Wxqw2VoHBuVlwlsLtAy0aIco
        XzK64ux46UEUR/1s06LzpfVHyA==
X-Google-Smtp-Source: ABdhPJwPfB+MTUo+/GlPxn+Tr1A9uarAX1twWrzeWeehJ8MKhcxFVbR33ybN71LPdJTLOGnvUwIC2Q==
X-Received: by 2002:a1c:7510:0:b0:394:1961:708 with SMTP id o16-20020a1c7510000000b0039419610708mr1185522wmc.201.1653553809149;
        Thu, 26 May 2022 01:30:09 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c4fd300b003974df805c7sm1269581wmq.8.2022.05.26.01.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 01:30:08 -0700 (PDT)
Date:   Thu, 26 May 2022 09:30:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Alistair Francis <alistair@alistair23.me>, lgirdwood@gmail.com,
        robh+dt@kernel.org, kernel@pengutronix.de, s.hauer@pengutronix.de,
        alistair23@gmail.com, linux-arm-kernel@lists.infradead.org,
        andreas@kemnade.info, amitk@kernel.org, shawnguo@kernel.org,
        linux-kernel@vger.kernel.org, geert@linux-m68k.org,
        linux-hwmon@vger.kernel.org, linux-imx@nxp.com, linux@roeck-us.net,
        rui.zhang@intel.com, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v21 1/4] mfd: silergy,sy7636a: Add config option
Message-ID: <Yo86jpMrKR0Dj/HB@google.com>
References: <20220525115554.430971-1-alistair@alistair23.me>
 <20220525115554.430971-2-alistair@alistair23.me>
 <Yo5vjlsc0J1S70zN@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yo5vjlsc0J1S70zN@sirena.org.uk>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 25 May 2022, Mark Brown wrote:

> On Wed, May 25, 2022 at 09:55:51PM +1000, Alistair Francis wrote:
> > Add a specific MFD_SY7636A config option.
> > 
> > As part of this change we can use MFD_SY7636A as a dependency for all
> > SY7636a components and also remove the name from MFD_SIMPLE_MFD_I2C as
> > it no longer needs to be selectable.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Full disclosure; I've already made my cut for v5.19.

This is due for v5.20.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
